#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_36 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _120 = false;
    bool _118 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _341 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_341, float2(0.0), isnan(_341))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _60 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].z, _58);
    float _62 = _60 * _54;
    float _64 = -_60;
    bool _68 = _64 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _70 = -_60;
    bool _72 = _70 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _74 = -_60;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _78 = !_68;
    int _81 = _78 ? 0 : 1;
    int _83 = 2;
    if (!_68)
    {
        _83 = 1;
    }
    int _85 = _83;
    int _87 = _85;
    if (!_72)
    {
        _87 = _81;
    }
    int _89 = _87;
    int _91 = _89 + 1;
    uint _94 = uint(_91);
    if (!_76)
    {
        _94 = uint(_89);
    }
    uint _96 = _94;
    uint _98 = min(_96, 2u);
    int _100 = int(_98) << 2;
    float _102 = in.m_38.x;
    uint _104 = uint(int(uint(_100) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    float _112 = _60 * _102;
    bool _114 = as_type<int>(_110) == 384;
    if (!_114)
    {
        bool _116 = as_type<int>(_110) == 656;
        _118 = _116;
        if (!_118)
        {
            _120 = true;
        }
    }
    float _154;
    float _156;
    float _158;
    float _160;
    if (!_118)
    {
        if (!_120)
        {
            float _122 = _62 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _124 = _62 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _126 = _62 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _128 = _62 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _130 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[0].x, _122);
            float _132 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[1].x, _124);
            float _134 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
            float _136 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[3].x, _128);
            float _138 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[0].z, _130);
            float _140 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[1].z, _132);
            float _142 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
            float _144 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[3].z, _136);
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _154 = _152;
            _156 = _146;
            _158 = _150;
            _160 = _148;
        }
    }
    if ((false || _120) || _118)
    {
        if ((!_120) || _118)
        {
            _118 = false;
            float _162 = _62 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _164 = _62 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _166 = _62 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _168 = _62 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _170 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[4].x, _162);
            float _172 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[5].x, _164);
            float _174 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[6].x, _166);
            float _176 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[7].x, _168);
            float _178 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[4].z, _170);
            float _180 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[5].z, _172);
            float _182 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[6].z, _174);
            float _184 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[7].z, _176);
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _154 = _192;
            _156 = _186;
            _158 = _190;
            _160 = _188;
        }
        if (false || _120)
        {
            _120 = false;
            float _194 = _62 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _196 = _62 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _198 = _62 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _200 = _62 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _202 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[8].x, _194);
            float _204 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[9].x, _196);
            float _206 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[10].x, _198);
            float _208 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[11].x, _200);
            float _210 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[8].z, _202);
            float _212 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[9].z, _204);
            float _214 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].z, _206);
            float _216 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[11].z, _208);
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _154 = _224;
            _156 = _218;
            _158 = _222;
            _160 = _220;
        }
    }
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = float(int(_96));
    float _236 = 1.0 / _226;
    float _238 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _240 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _242 = rint(_234);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = _236 * _228;
    float _252 = _236 * _230;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _236 * _232;
    float _258 = fma(_254, _238, _250);
    float _260 = -_238;
    float _262 = fma(_254, _260, _250);
    float _264 = fma(_254, _240, _256);
    float _266 = -_240;
    float _268 = fma(_254, _266, _256);
    float3 _791 = float3(_250, _264, float(int(_248)));
    float3 _795 = select(_791, float3(0.0), isnan(_791));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _795.xy, uint(rint(_795.z)), _254);
    float3 _804 = float3(_258, _264, float(int(_248)));
    float3 _806 = select(_804, float3(0.0), isnan(_804));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _806.xy, uint(rint(_806.z)), _254);
    float3 _815 = float3(_262, _264, float(int(_248)));
    float3 _817 = select(_815, float3(0.0), isnan(_815));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _817.xy, uint(rint(_817.z)), _254);
    float3 _826 = float3(_258, _256, float(int(_248)));
    float3 _828 = select(_826, float3(0.0), isnan(_826));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _828.xy, uint(rint(_828.z)), _254);
    float3 _837 = float3(_250, _256, float(int(_248)));
    float3 _839 = select(_837, float3(0.0), isnan(_837));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _839.xy, uint(rint(_839.z)), _254);
    float3 _848 = float3(_262, _256, float(int(_248)));
    float3 _850 = select(_848, float3(0.0), isnan(_848));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _850.xy, uint(rint(_850.z)), _254);
    float3 _859 = float3(_258, _268, float(int(_248)));
    float3 _861 = select(_859, float3(0.0), isnan(_859));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _861.xy, uint(rint(_861.z)), _254);
    float3 _870 = float3(_250, _268, float(int(_248)));
    float3 _872 = select(_870, float3(0.0), isnan(_870));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _872.xy, uint(rint(_872.z)), _254);
    float3 _881 = float3(_262, _268, float(int(_248)));
    float3 _883 = select(_881, float3(0.0), isnan(_881));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _883.xy, uint(rint(_883.z)), _254);
    float2 _889 = float2(_48, _50);
    float _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_889, float2(0.0), isnan(_889))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_889, float2(0.0), isnan(_889))).x;
    float _290 = -_60;
    float _292 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _294 = _290 + _292;
    float _296 = -_60;
    float _298 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _300 = _296 + _298;
    float _302 = _294 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _300 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = _308 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _312 = _272 + _270;
    float _314 = _312 + _274;
    float _316 = _314 + _276;
    float _318 = _316 + _278;
    float _320 = _318 + _280;
    float _322 = _320 + _282;
    float _324 = _322 + _284;
    float _326 = _324 + _286;
    float _328 = fma(_326, 0.111111111938953399658203125, _304);
    out.m_41.x = _288;
    out.m_41.y = _328;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _310;
    return out;
}

