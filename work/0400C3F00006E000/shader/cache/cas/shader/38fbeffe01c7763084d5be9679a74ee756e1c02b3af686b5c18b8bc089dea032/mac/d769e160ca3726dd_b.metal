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
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
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
    bool _122 = false;
    bool _120 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _448 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_448, float2(0.0), isnan(_448))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_448, float2(0.0), isnan(_448))).x;
    float _56 = in.m_40.x;
    float _58 = -_54;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _56;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = -_62;
    bool _74 = _72 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _76 = -_62;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _80 = !_70;
    int _83 = _80 ? 0 : 1;
    int _85 = 2;
    if (!_70)
    {
        _85 = 1;
    }
    int _87 = _85;
    int _89 = _87;
    if (!_74)
    {
        _89 = _83;
    }
    int _91 = _89;
    int _93 = _91 + 1;
    uint _96 = uint(_93);
    if (!_78)
    {
        _96 = uint(_91);
    }
    uint _98 = _96;
    uint _100 = min(_98, 2u);
    int _102 = int(_100) << 2;
    float _104 = in.m_40.y;
    uint _106 = uint(int(uint(_102) >> uint(2)));
    uint _108 = uint(int(uint(int(_106)) >> uint(2)));
    int _110 = int(_106) & 3;
    float _112 = (*spvDescriptorSet0.fp_c1)._m0[int(_108)][_110];
    float _114 = _62 * _104;
    bool _116 = as_type<int>(_112) == 384;
    if (!_116)
    {
        bool _118 = as_type<int>(_112) == 656;
        _120 = _118;
        if (!_120)
        {
            _122 = true;
        }
    }
    float _156;
    float _158;
    float _160;
    float _162;
    if (!_120)
    {
        if (!_122)
        {
            float _124 = _114 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _126 = _114 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _128 = _114 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _130 = _114 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
            float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _132);
            float _142 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _134);
            float _144 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
            float _146 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _156 = _154;
            _158 = _152;
            _160 = _148;
            _162 = _150;
        }
    }
    if ((false || _122) || _120)
    {
        if ((!_122) || _120)
        {
            _120 = false;
            float _164 = _114 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _166 = _114 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _168 = _114 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _170 = _114 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].x, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].x, _168);
            float _178 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _172);
            float _182 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _174);
            float _184 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _176);
            float _186 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _192;
            _160 = _188;
            _162 = _190;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _114 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _198 = _114 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _200 = _114 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _202 = _114 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].x, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].x, _200);
            float _210 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _204);
            float _214 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _206);
            float _216 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _208);
            float _218 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _156 = _226;
            _158 = _224;
            _160 = _220;
            _162 = _222;
        }
    }
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = 1.0 / _228;
    float _238 = float(int(_98));
    float _240 = rint(_238);
    float _242 = precise::max(_240, 0.0);
    uint _244 = uint(_242);
    uint _246 = clamp(_244, 0u, 65535u);
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _250 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _252 = _236 * _230;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _236 * _232;
    float _258 = _236 * _234;
    float _260 = _254 * _248;
    float _262 = _254 * _250;
    float _264 = fma(_260, 0.5, _256);
    float _266 = fma(_262, 0.5, _258);
    float _268 = fma(_262, 1.5, _258);
    float _270 = fma(_260, -0.5, _256);
    float _272 = fma(_260, 1.5, _256);
    float3 _902 = float3(_264, _268, float(int(_246)));
    float3 _906 = select(_902, float3(0.0), isnan(_902));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _906.xy, uint(rint(_906.z)), _254);
    float3 _915 = float3(_270, _268, float(int(_246)));
    float3 _917 = select(_915, float3(0.0), isnan(_915));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _917.xy, uint(rint(_917.z)), _254);
    float3 _926 = float3(_272, _266, float(int(_246)));
    float3 _928 = select(_926, float3(0.0), isnan(_926));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _928.xy, uint(rint(_928.z)), _254);
    float3 _937 = float3(_264, _266, float(int(_246)));
    float3 _939 = select(_937, float3(0.0), isnan(_937));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _939.xy, uint(rint(_939.z)), _254);
    float3 _948 = float3(_270, _266, float(int(_246)));
    float3 _950 = select(_948, float3(0.0), isnan(_948));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _950.xy, uint(rint(_950.z)), _254);
    float _284 = fma(_260, -1.5, _256);
    float _286 = fma(_262, -0.5, _258);
    float3 _966 = float3(_284, _266, float(int(_246)));
    float3 _968 = select(_966, float3(0.0), isnan(_966));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _968.xy, uint(rint(_968.z)), _254);
    float3 _977 = float3(_264, _286, float(int(_246)));
    float3 _979 = select(_977, float3(0.0), isnan(_977));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _979.xy, uint(rint(_979.z)), _254);
    float3 _988 = float3(_284, _268, float(int(_246)));
    float3 _990 = select(_988, float3(0.0), isnan(_988));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _990.xy, uint(rint(_990.z)), _254);
    float3 _999 = float3(_272, _268, float(int(_246)));
    float3 _1001 = select(_999, float3(0.0), isnan(_999));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1001.xy, uint(rint(_1001.z)), _254);
    float3 _1010 = float3(_272, _286, float(int(_246)));
    float3 _1012 = select(_1010, float3(0.0), isnan(_1010));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1012.xy, uint(rint(_1012.z)), _254);
    float3 _1021 = float3(_270, _286, float(int(_246)));
    float3 _1023 = select(_1021, float3(0.0), isnan(_1021));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1023.xy, uint(rint(_1023.z)), _254);
    float3 _1032 = float3(_284, _286, float(int(_246)));
    float3 _1034 = select(_1032, float3(0.0), isnan(_1032));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1034.xy, uint(rint(_1034.z)), _254);
    float _302 = fma(_262, -1.5, _258);
    float _304 = _114 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _306 = _114 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _308 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[15].x, _304);
    float _310 = _114 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _312 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[13].x, _306);
    float _314 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[15].z, _308);
    float _316 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[12].x, _310);
    float _318 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[13].z, _312);
    float _320 = _314 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _322 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[12].z, _316);
    float _324 = _318 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _326 = 1.0 / _320;
    float _328 = _322 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _330 = _328 * _326;
    float _332 = _324 * _326;
    float2 _1108 = float2(_330, _332);
    float2 _336 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1108, float2(0.0), isnan(_1108))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1108, float2(0.0), isnan(_1108))).xy;
    float _338 = _336.x;
    float _340 = _336.y;
    float3 _1123 = float3(_272, _302, float(int(_246)));
    float3 _1125 = select(_1123, float3(0.0), isnan(_1123));
    float _342 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1125.xy, uint(rint(_1125.z)), _254);
    float3 _1134 = float3(_264, _302, float(int(_246)));
    float3 _1136 = select(_1134, float3(0.0), isnan(_1134));
    float _344 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1136.xy, uint(rint(_1136.z)), _254);
    float3 _1145 = float3(_270, _302, float(int(_246)));
    float3 _1147 = select(_1145, float3(0.0), isnan(_1145));
    float _346 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1147.xy, uint(rint(_1147.z)), _254);
    float3 _1156 = float3(_284, _302, float(int(_246)));
    float3 _1158 = select(_1156, float3(0.0), isnan(_1156));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1158.xy, uint(rint(_1158.z)), _254);
    float2 _1164 = float2(_50, _52);
    float _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1164, float2(0.0), isnan(_1164))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1164, float2(0.0), isnan(_1164))).x;
    float _352 = _114 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _354 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[14].x, _352);
    float _356 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[14].z, _354);
    float _358 = _356 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _360 = precise::min(_358, 1.0);
    float _362 = _294 + _274;
    float _364 = _362 + _276;
    float _366 = _364 + _292;
    float _368 = _366 + _278;
    float _370 = _368 + _280;
    float _372 = _370 + _282;
    float _374 = _372 + _288;
    float _376 = _374 + _296;
    float _378 = _376 + _290;
    float _380 = _378 + _298;
    float _382 = _380 + _300;
    float _384 = -_338;
    float _386 = fma(_384, _338, _340);
    float _388 = -_338;
    float _390 = _360 + _388;
    float _392 = _382 + _342;
    float _394 = fma(_390, _390, _386);
    float _396 = _392 + _344;
    bool _398 = _390 <= 0.001000000047497451305389404296875;
    float _400 = float(_398);
    float _402 = 1.0 / _394;
    float _404 = _396 + _346;
    float _406 = -_62;
    float _408 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _410 = _406 + _408;
    float _412 = _404 + _348;
    float _414 = _410 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _386 * _402;
    float _420 = -_62;
    float _422 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _424 = _420 + _422;
    float _426 = precise::max(_418, _400);
    float _428 = _424 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = precise::min(_426, 1.0);
    float _434 = fma(_412, 0.0625, _430);
    float _436 = _432 + _416;
    out.m_43.x = _350;
    out.m_43.y = _434;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _436;
    return out;
}

