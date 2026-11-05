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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _116 = false;
    bool _114 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _308 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_308, float2(0.0), isnan(_308))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = in.m_40.x;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _62 * _66;
    float _70 = _68 * _56;
    float _72 = -_68;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = -_68;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _82 = !_76;
    uint _85 = uint(_82 ? 0 : 1);
    uint _87 = 2u;
    if (!_76)
    {
        _87 = 1u;
    }
    uint _89 = _87;
    uint _91 = _89;
    if (!_80)
    {
        _91 = _85;
    }
    uint _93 = _91;
    uint _95 = min(_93, 2u);
    float _97 = _68 * _64;
    int _100 = int(_95) << 2;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    uint _104 = uint(int(uint(int(_102)) >> uint(2)));
    int _106 = int(_102) & 3;
    float _108 = (*spvDescriptorSet0.fp_c1)._m0[int(_104)][_106];
    bool _110 = as_type<int>(_108) == 368;
    if (!_110)
    {
        bool _112 = as_type<int>(_108) == 640;
        _114 = _112;
        if (!_114)
        {
            _116 = true;
        }
    }
    float _150;
    float _152;
    float _154;
    float _156;
    if (!_114)
    {
        if (!_116)
        {
            float _118 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _142;
            _154 = _144;
            _156 = _146;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _70 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _70 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _70 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _182;
            _154 = _184;
            _156 = _186;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _70 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _70 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _70 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _70 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _214;
            _154 = _216;
            _156 = _218;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float2 _684 = float2(_50, _52);
    float2 _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_684, float2(0.0), isnan(_684))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_684, float2(0.0), isnan(_684))).xy;
    float _234 = _232.x;
    float _236 = _232.y;
    float _238 = float(int(_93));
    float _240 = 1.0 / _222;
    float _242 = rint(_238);
    float _244 = precise::max(_242, 0.0);
    uint _246 = uint(_244);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = _240 * _224;
    float _252 = _240 * _226;
    float _254 = _240 * _228;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = fma(_234, 2.0, -1.0);
    float _260 = fma(_236, 2.0, -1.0);
    float _262 = _258 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _264 = _260 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _266 = fma(_262, 2.0, _50);
    float _268 = fma(_264, 2.0, _52);
    float3 _747 = float3(_250, _252, float(int(_248)));
    float3 _751 = select(_747, float3(0.0), isnan(_747));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _751.xy, uint(rint(_751.z)), _256);
    float2 _757 = float2(_266, _268);
    float _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_757, float2(0.0), isnan(_757))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_757, float2(0.0), isnan(_757))).x;
    float _274 = -_68;
    float _276 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _278 = _274 + _276;
    float _280 = -_68;
    float _282 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _284 = _280 + _282;
    float _286 = _278 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _284 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = _292 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _296 = _270 + _288;
    out.m_43.x = _272;
    out.m_43.y = _296;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _294;
    return out;
}

