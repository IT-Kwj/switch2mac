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
    bool _114 = false;
    bool _112 = false;
    float _48 = in.m_36.x;
    float _50 = in.m_36.y;
    float2 _335 = float2(_48, _50);
    float _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_335, float2(0.0), isnan(_335))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_335, float2(0.0), isnan(_335))).x;
    float _54 = in.m_38.y;
    float _56 = -_52;
    float _58 = fma(_56, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _60 = 1.0 / _58;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = _60 * _62;
    float _66 = in.m_38.x;
    float _68 = _64 * _54;
    float _70 = -_64;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_64;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _80 = !_74;
    uint _83 = uint(_80 ? 0 : 1);
    uint _85 = 2u;
    if (!_74)
    {
        _85 = 1u;
    }
    uint _87 = _85;
    uint _89 = _87;
    if (!_78)
    {
        _89 = _83;
    }
    uint _91 = _89;
    uint _93 = min(_91, 2u);
    int _96 = int(_93) << 2;
    uint _98 = uint(int(uint(_96) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    float _106 = _64 * _66;
    bool _108 = as_type<int>(_104) == 368;
    if (!_108)
    {
        bool _110 = as_type<int>(_104) == 640;
        _112 = _110;
        if (!_112)
        {
            _114 = true;
        }
    }
    float _148;
    float _150;
    float _152;
    float _154;
    if (!_112)
    {
        if (!_114)
        {
            float _116 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _68 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _68 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _140;
            _152 = _144;
            _154 = _142;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _68 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _68 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _68 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _68 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _180;
            _152 = _184;
            _154 = _182;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _68 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _68 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _68 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _68 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _212;
            _152 = _216;
            _154 = _214;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = float(int(_91));
    float _230 = 1.0 / _220;
    float _232 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _234 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _236 = rint(_228);
    float _238 = precise::max(_236, 0.0);
    uint _240 = uint(_238);
    uint _242 = clamp(_240, 0u, 65535u);
    float _244 = _230 * _222;
    float _246 = _230 * _224;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _230 * _226;
    float _252 = fma(_248, _232, _244);
    float _254 = -_232;
    float _256 = fma(_248, _254, _244);
    float _258 = fma(_248, _234, _250);
    float _260 = -_234;
    float _262 = fma(_248, _260, _250);
    float3 _773 = float3(_244, _258, float(int(_242)));
    float3 _777 = select(_773, float3(0.0), isnan(_773));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _777.xy, uint(rint(_777.z)), _248);
    float3 _786 = float3(_252, _258, float(int(_242)));
    float3 _788 = select(_786, float3(0.0), isnan(_786));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _788.xy, uint(rint(_788.z)), _248);
    float3 _797 = float3(_256, _258, float(int(_242)));
    float3 _799 = select(_797, float3(0.0), isnan(_797));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _799.xy, uint(rint(_799.z)), _248);
    float3 _808 = float3(_252, _250, float(int(_242)));
    float3 _810 = select(_808, float3(0.0), isnan(_808));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _810.xy, uint(rint(_810.z)), _248);
    float3 _819 = float3(_244, _250, float(int(_242)));
    float3 _821 = select(_819, float3(0.0), isnan(_819));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _821.xy, uint(rint(_821.z)), _248);
    float3 _830 = float3(_256, _250, float(int(_242)));
    float3 _832 = select(_830, float3(0.0), isnan(_830));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _832.xy, uint(rint(_832.z)), _248);
    float3 _841 = float3(_252, _262, float(int(_242)));
    float3 _843 = select(_841, float3(0.0), isnan(_841));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _843.xy, uint(rint(_843.z)), _248);
    float3 _852 = float3(_244, _262, float(int(_242)));
    float3 _854 = select(_852, float3(0.0), isnan(_852));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _854.xy, uint(rint(_854.z)), _248);
    float3 _863 = float3(_256, _262, float(int(_242)));
    float3 _865 = select(_863, float3(0.0), isnan(_863));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _865.xy, uint(rint(_865.z)), _248);
    float2 _871 = float2(_48, _50);
    float _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_871, float2(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_871, float2(0.0), isnan(_871))).x;
    float _284 = -_64;
    float _286 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _288 = _284 + _286;
    float _290 = -_64;
    float _292 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _294 = _290 + _292;
    float _296 = _288 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = _294 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    float _304 = _302 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _306 = _266 + _264;
    float _308 = _306 + _268;
    float _310 = _308 + _270;
    float _312 = _310 + _272;
    float _314 = _312 + _274;
    float _316 = _314 + _276;
    float _318 = _316 + _278;
    float _320 = _318 + _280;
    float _322 = fma(_320, 0.111111111938953399658203125, _298);
    out.m_41.x = _282;
    out.m_41.y = _322;
    out.m_41.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_41.w = _304;
    return out;
}

