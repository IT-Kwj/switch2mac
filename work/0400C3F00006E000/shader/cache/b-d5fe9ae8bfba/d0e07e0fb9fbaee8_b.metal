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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _118 = false;
    bool _116 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _462 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_462, float2(0.0), isnan(_462))).x;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float _62 = -_56;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = _70 * _58;
    float _74 = -_70;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = _70 * _60;
    float _82 = -_70;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _86 = !_78;
    uint _89 = uint(_86 ? 0 : 1);
    uint _91 = 2u;
    if (!_78)
    {
        _91 = 1u;
    }
    uint _93 = _91;
    uint _95 = _93;
    if (!_84)
    {
        _95 = _89;
    }
    uint _97 = _95;
    uint _99 = min(_97, 2u);
    int _102 = int(_99) << 2;
    uint _104 = uint(int(uint(_102) >> uint(2)));
    uint _106 = uint(int(uint(int(_104)) >> uint(2)));
    int _108 = int(_104) & 3;
    float _110 = (*spvDescriptorSet0.fp_c1)._m0[int(_106)][_108];
    bool _112 = as_type<int>(_110) == 368;
    if (!_112)
    {
        bool _114 = as_type<int>(_110) == 640;
        _116 = _114;
        if (!_116)
        {
            _118 = true;
        }
    }
    float _152;
    float _154;
    float _156;
    float _158;
    if (!_116)
    {
        if (!_118)
        {
            float _120 = _80 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _122 = _80 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _124 = _80 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _126 = _80 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _128 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].x, _120);
            float _130 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].x, _122);
            float _132 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
            float _134 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].x, _126);
            float _136 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _128);
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _134);
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _152 = _150;
            _154 = _148;
            _156 = _144;
            _158 = _146;
        }
    }
    if ((false || _118) || _116)
    {
        if ((!_118) || _116)
        {
            _116 = false;
            float _160 = _80 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _162 = _80 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _164 = _80 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _166 = _80 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _168 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, _160);
            float _170 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].x, _162);
            float _172 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].x, _164);
            float _174 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].x, _166);
            float _176 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _168);
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _174);
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _152 = _190;
            _154 = _188;
            _156 = _184;
            _158 = _186;
        }
        if (false || _118)
        {
            _118 = false;
            float _192 = _80 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _194 = _80 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _196 = _80 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _198 = _80 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _200 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].x, _192);
            float _202 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].x, _194);
            float _204 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].x, _196);
            float _206 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].x, _198);
            float _208 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _200);
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _206);
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _152 = _222;
            _154 = _220;
            _156 = _216;
            _158 = _218;
        }
    }
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = 1.0 / _224;
    float _234 = float(int(_97));
    float _236 = rint(_234);
    float _238 = precise::max(_236, 0.0);
    uint _240 = uint(_238);
    uint _242 = clamp(_240, 0u, 65535u);
    float _244 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _246 = _232 * _226;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _232 * _228;
    float _252 = _232 * _230;
    float _254 = _248 * _244;
    float _256 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _258 = fma(_254, 0.5, _250);
    float _260 = _248 * _256;
    float _262 = fma(_254, 1.5, _250);
    float _264 = fma(_254, -0.5, _250);
    float _266 = fma(_254, -1.5, _250);
    float _268 = fma(_260, 1.5, _252);
    float _270 = fma(_260, 0.5, _252);
    float3 _908 = float3(_258, _268, float(int(_242)));
    float3 _912 = select(_908, float3(0.0), isnan(_908));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _912.xy, uint(rint(_912.z)), _248);
    float3 _921 = float3(_264, _268, float(int(_242)));
    float3 _923 = select(_921, float3(0.0), isnan(_921));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _923.xy, uint(rint(_923.z)), _248);
    float3 _932 = float3(_266, _268, float(int(_242)));
    float3 _934 = select(_932, float3(0.0), isnan(_932));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _934.xy, uint(rint(_934.z)), _248);
    float3 _943 = float3(_262, _268, float(int(_242)));
    float3 _945 = select(_943, float3(0.0), isnan(_943));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _945.xy, uint(rint(_945.z)), _248);
    float3 _954 = float3(_262, _270, float(int(_242)));
    float3 _956 = select(_954, float3(0.0), isnan(_954));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _956.xy, uint(rint(_956.z)), _248);
    float3 _965 = float3(_258, _270, float(int(_242)));
    float3 _967 = select(_965, float3(0.0), isnan(_965));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _967.xy, uint(rint(_967.z)), _248);
    float3 _976 = float3(_264, _270, float(int(_242)));
    float3 _978 = select(_976, float3(0.0), isnan(_976));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _978.xy, uint(rint(_978.z)), _248);
    float3 _987 = float3(_266, _270, float(int(_242)));
    float3 _989 = select(_987, float3(0.0), isnan(_987));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _989.xy, uint(rint(_989.z)), _248);
    float2 _995 = float2(_52, _54);
    float2 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_995, float2(0.0), isnan(_995))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_995, float2(0.0), isnan(_995))).xy;
    float _292 = _290.x;
    float _294 = _290.y;
    float _296 = fma(_260, -1.5, _252);
    float _298 = _278 + _272;
    float _300 = _298 + _274;
    float _302 = _300 + _276;
    float _304 = _302 + _280;
    float _306 = fma(_260, -0.5, _252);
    float _308 = _304 + _282;
    float3 _1031 = float3(_262, _306, float(int(_242)));
    float3 _1033 = select(_1031, float3(0.0), isnan(_1031));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1033.xy, uint(rint(_1033.z)), _248);
    float3 _1042 = float3(_258, _306, float(int(_242)));
    float3 _1044 = select(_1042, float3(0.0), isnan(_1042));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1044.xy, uint(rint(_1044.z)), _248);
    float3 _1053 = float3(_264, _306, float(int(_242)));
    float3 _1055 = select(_1053, float3(0.0), isnan(_1053));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1055.xy, uint(rint(_1055.z)), _248);
    float3 _1064 = float3(_266, _306, float(int(_242)));
    float3 _1066 = select(_1064, float3(0.0), isnan(_1064));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1066.xy, uint(rint(_1066.z)), _248);
    float _318 = _80 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _320 = _80 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _322 = _308 + _284;
    float _324 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[15].x, _318);
    float _326 = _80 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _328 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[15].z, _324);
    float _330 = _328 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _332 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[12].x, _326);
    float _334 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[13].x, _320);
    float _336 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[12].z, _332);
    float _338 = 1.0 / _330;
    float _340 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[13].z, _334);
    float _342 = _336 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _344 = _340 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _346 = fma(_292, 2.0, -1.0);
    float _348 = fma(_294, 2.0, -1.0);
    float _350 = _342 * _338;
    float _352 = _344 * _338;
    float _354 = _322 + _286;
    float _356 = _346 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _358 = _348 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float2 _1158 = float2(_350, _352);
    float2 _360 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1158, float2(0.0), isnan(_1158))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1158, float2(0.0), isnan(_1158))).xy;
    float _362 = _360.x;
    float _364 = _360.y;
    float _366 = fma(_356, 2.0, _52);
    float _368 = fma(_358, 2.0, _54);
    float3 _1179 = float3(_262, _296, float(int(_242)));
    float3 _1181 = select(_1179, float3(0.0), isnan(_1179));
    float _370 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1181.xy, uint(rint(_1181.z)), _248);
    float3 _1190 = float3(_258, _296, float(int(_242)));
    float3 _1192 = select(_1190, float3(0.0), isnan(_1190));
    float _372 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1192.xy, uint(rint(_1192.z)), _248);
    float3 _1201 = float3(_264, _296, float(int(_242)));
    float3 _1203 = select(_1201, float3(0.0), isnan(_1201));
    float _374 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1203.xy, uint(rint(_1203.z)), _248);
    float3 _1212 = float3(_266, _296, float(int(_242)));
    float3 _1214 = select(_1212, float3(0.0), isnan(_1212));
    float _376 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1214.xy, uint(rint(_1214.z)), _248);
    float2 _1220 = float2(_366, _368);
    float _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1220, float2(0.0), isnan(_1220))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1220, float2(0.0), isnan(_1220))).x;
    float _380 = _80 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _382 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[14].x, _380);
    float _384 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[14].z, _382);
    float _386 = _384 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _388 = precise::min(_386, 1.0);
    float _390 = -_70;
    float _392 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _394 = _390 + _392;
    float _396 = _394 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = _354 + _310;
    float _402 = _400 + _312;
    float _404 = _402 + _314;
    float _406 = _404 + _316;
    float _408 = -_362;
    float _410 = fma(_408, _362, _364);
    float _412 = -_362;
    float _414 = _388 + _412;
    float _416 = fma(_414, _414, _410);
    bool _418 = _414 <= 0.001000000047497451305389404296875;
    float _420 = float(_418);
    float _422 = _406 + _370;
    float _424 = 1.0 / _416;
    float _426 = _422 + _372;
    float _428 = _426 + _374;
    float _430 = -_70;
    float _432 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _434 = _430 + _432;
    float _436 = _410 * _424;
    float _438 = _428 + _376;
    float _440 = _434 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = precise::max(_436, _420);
    float _446 = fma(_438, 0.0625, _398);
    float _448 = precise::min(_444, 1.0);
    float _450 = _448 + _442;
    out.m_45.x = _378;
    out.m_45.y = _446;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _450;
    return out;
}

