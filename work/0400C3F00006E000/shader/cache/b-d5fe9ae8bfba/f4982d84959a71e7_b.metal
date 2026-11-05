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
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
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
    bool _112 = false;
    bool _110 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _354 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_354, float2(0.0), isnan(_354))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_354, float2(0.0), isnan(_354))).x;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = _64 * _58;
    float _76 = -_64;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _80 = !_72;
    uint _83 = uint(_80 ? 0 : 1);
    uint _85 = 2u;
    if (!_72)
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
    bool _106 = as_type<int>(_104) == 336;
    if (!_106)
    {
        bool _108 = as_type<int>(_104) == 608;
        _110 = _108;
        if (!_110)
        {
            _112 = true;
        }
    }
    float _146;
    float _148;
    float _150;
    float _152;
    if (!_110)
    {
        if (!_112)
        {
            float _114 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _116 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _118 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _120 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _122 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _114);
            float _124 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _116);
            float _126 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _118);
            float _128 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _120);
            float _130 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _128);
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _146 = _144;
            _148 = _140;
            _150 = _138;
            _152 = _142;
        }
    }
    if ((false || _112) || _110)
    {
        if ((!_112) || _110)
        {
            _110 = false;
            float _154 = _74 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _156 = _74 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _158 = _74 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _160 = _74 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _162 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, _154);
            float _164 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].x, _156);
            float _166 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].x, _158);
            float _168 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
            float _170 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _168);
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _146 = _184;
            _148 = _180;
            _150 = _178;
            _152 = _182;
        }
        if (false || _112)
        {
            _112 = false;
            float _186 = _74 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _188 = _74 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _190 = _74 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _192 = _74 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _194 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].x, _186);
            float _196 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].x, _188);
            float _198 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].x, _190);
            float _200 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].x, _192);
            float _202 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _200);
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _146 = _216;
            _148 = _212;
            _150 = _210;
            _152 = _214;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _74 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _228 = _74 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _230 = 1.0 / _218;
    float _232 = float(int(_91));
    float _234 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].x, _226);
    float _236 = _74 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _238 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].x, _228);
    float _240 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].z, _234);
    float _242 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].z, _238);
    float _244 = rint(_232);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    uint _250 = clamp(_248, 0u, 65535u);
    float _252 = _240 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _254 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].x, _236);
    float _256 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].z, _254);
    float _258 = _230 * _220;
    float _260 = 1.0 / _252;
    float _262 = _230 * _222;
    float _264 = _256 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _266 = _242 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _268 = _230 * _224;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = _264 * _260;
    float _274 = _266 * _260;
    float2 _817 = float2(_272, _274);
    float2 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_817, float2(0.0), isnan(_817))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_817, float2(0.0), isnan(_817))).xy;
    float _280 = _278.x;
    float _282 = _278.y;
    float3 _833 = float3(_262, _258, float(int(_250)));
    float3 _837 = select(_833, float3(0.0), isnan(_833));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _837.xy, uint(rint(_837.z)), _270);
    float2 _843 = float2(_50, _52);
    float _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_843, float2(0.0), isnan(_843))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_843, float2(0.0), isnan(_843))).x;
    float _288 = _74 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _290 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].x, _288);
    float _292 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].z, _290);
    float _294 = _292 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _296 = precise::min(_294, 1.0);
    float _298 = -_64;
    float _300 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _302 = _298 + _300;
    float _304 = -_64;
    float _306 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _308 = _304 + _306;
    float _310 = _302 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = _308 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = -_280;
    float _320 = fma(_318, _280, _282);
    float _322 = -_280;
    float _324 = _296 + _322;
    float _326 = _284 + _312;
    float _328 = fma(_324, _324, _320);
    bool _330 = _324 <= 0.001000000047497451305389404296875;
    float _332 = float(_330);
    float _334 = 1.0 / _328;
    float _336 = _320 * _334;
    float _338 = precise::max(_336, _332);
    float _340 = precise::min(_338, 1.0);
    float _342 = _340 + _316;
    out.m_43.x = _286;
    out.m_43.y = _326;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _342;
    return out;
}

