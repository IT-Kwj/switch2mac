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
    bool _116 = false;
    bool _114 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _384 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_384, float2(0.0), isnan(_384))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_384, float2(0.0), isnan(_384))).x;
    float _56 = in.m_40.x;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = in.m_40.y;
    float _70 = _66 * _56;
    float _72 = -_66;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = -_66;
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
    int _98 = int(_95) << 2;
    uint _100 = uint(int(uint(_98) >> uint(2)));
    uint _102 = uint(int(uint(int(_100)) >> uint(2)));
    int _104 = int(_100) & 3;
    float _106 = (*spvDescriptorSet0.fp_c1)._m0[int(_102)][_104];
    float _108 = _66 * _68;
    bool _110 = as_type<int>(_106) == 368;
    if (!_110)
    {
        bool _112 = as_type<int>(_106) == 640;
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
            float _118 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _108 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _122 = _108 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _124 = _108 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _126 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _120);
            float _130 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
            float _132 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
            float _140 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _132);
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _150 = _148;
            _152 = _146;
            _154 = _142;
            _156 = _144;
        }
    }
    if ((false || _116) || _114)
    {
        if ((!_116) || _114)
        {
            _114 = false;
            float _158 = _108 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _108 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _162 = _108 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _164 = _108 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _166 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].x, _160);
            float _170 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].x, _162);
            float _172 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _170);
            float _180 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _172);
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _150 = _188;
            _152 = _186;
            _154 = _182;
            _156 = _184;
        }
        if (false || _116)
        {
            _116 = false;
            float _190 = _108 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _108 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _194 = _108 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _196 = _108 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _198 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].x, _192);
            float _202 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].x, _194);
            float _204 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _202);
            float _212 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _204);
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _150 = _220;
            _152 = _218;
            _154 = _214;
            _156 = _216;
        }
    }
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _108 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _232 = _108 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _234 = 1.0 / _222;
    float _236 = float(int(_93));
    float _238 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].x, _230);
    float _240 = _108 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _242 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].x, _232);
    float _244 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[15].z, _238);
    float _246 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[13].z, _242);
    float _248 = rint(_236);
    float _250 = precise::max(_248, 0.0);
    uint _252 = uint(_250);
    uint _254 = clamp(_252, 0u, 65535u);
    float _256 = _244 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _258 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].x, _240);
    float _260 = _246 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _262 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[12].z, _258);
    float _264 = _234 * _224;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = 1.0 / _256;
    float _270 = _234 * _226;
    float _272 = _262 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _274 = _266 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _276 = _234 * _228;
    float _278 = _274 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _280 = _274 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _282 = fma(_280, 0.5, _276);
    float _284 = _272 * _268;
    float _286 = _260 * _268;
    float _288 = fma(_278, 0.5, _270);
    float _290 = fma(_278, -0.5, _270);
    float _292 = fma(_280, -0.5, _276);
    float2 _879 = float2(_284, _286);
    float2 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_879, float2(0.0), isnan(_879))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_879, float2(0.0), isnan(_879))).xy;
    float _298 = _296.x;
    float _300 = _296.y;
    float3 _895 = float3(_290, _282, float(int(_254)));
    float3 _899 = select(_895, float3(0.0), isnan(_895));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _899.xy, uint(rint(_899.z)), _266);
    float3 _908 = float3(_288, _282, float(int(_254)));
    float3 _910 = select(_908, float3(0.0), isnan(_908));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _910.xy, uint(rint(_910.z)), _266);
    float3 _919 = float3(_288, _292, float(int(_254)));
    float3 _921 = select(_919, float3(0.0), isnan(_919));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _921.xy, uint(rint(_921.z)), _266);
    float3 _930 = float3(_290, _292, float(int(_254)));
    float3 _932 = select(_930, float3(0.0), isnan(_930));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _932.xy, uint(rint(_932.z)), _266);
    float2 _938 = float2(_50, _52);
    float _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_938, float2(0.0), isnan(_938))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_938, float2(0.0), isnan(_938))).x;
    float _312 = _108 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _314 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].x, _312);
    float _316 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[14].z, _314);
    float _318 = _316 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _320 = precise::min(_318, 1.0);
    float _322 = -_66;
    float _324 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _326 = _322 + _324;
    float _328 = -_66;
    float _330 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _332 = _328 + _330;
    float _334 = _326 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = -_298;
    float _340 = fma(_338, _298, _300);
    float _342 = -_298;
    float _344 = _320 + _342;
    float _346 = fma(_344, _344, _340);
    float _348 = _304 + _302;
    bool _350 = _344 <= 0.001000000047497451305389404296875;
    float _352 = float(_350);
    float _354 = 1.0 / _346;
    float _356 = _348 + _306;
    float _358 = _356 + _308;
    float _360 = fma(_358, 0.25, _336);
    float _362 = _340 * _354;
    float _364 = _332 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = precise::max(_362, _352);
    float _370 = precise::min(_368, 1.0);
    float _372 = _370 + _366;
    out.m_43.x = _310;
    out.m_43.y = _360;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _372;
    return out;
}

