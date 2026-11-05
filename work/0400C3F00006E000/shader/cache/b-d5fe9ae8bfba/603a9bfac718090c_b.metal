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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _278 = false;
    bool _276 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _602 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_602, float2(0.0), isnan(_602)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _619 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_619, float2(0.0), isnan(_619))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_619, float2(0.0), isnan(_619))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_98;
    float _104 = fma(_90, _72, _102);
    float _106 = -_98;
    float _108 = fma(_96, _74, _106);
    float _110 = -_100;
    float _112 = fma(_90, _76, _110);
    float _114 = -_100;
    float _116 = fma(_96, _78, _114);
    float _118 = _104 * _104;
    float _120 = _108 * _108;
    float _122 = -_84;
    float _124 = _122 + _90;
    float _126 = -_84;
    float _128 = _126 + _96;
    float _130 = fma(_112, _112, _118);
    float _132 = fma(_116, _116, _120);
    float _134 = fma(_124, _124, _130);
    float _136 = fma(_128, _128, _132);
    float _138 = -_66;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[46].z, _140);
    float _144 = rsqrt(_134);
    float _146 = -_142;
    bool _150 = _146 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _152 = _142 * _70;
    float _154 = -_142;
    bool _156 = _154 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _158 = -_142;
    bool _160 = _158 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _162 = rsqrt(_136);
    int _165 = 2;
    if (!_150)
    {
        _165 = 1;
    }
    int _167 = _165;
    float _169 = _112 * _144;
    float _171 = _124 * _144;
    float _173 = _104 * _144;
    float _175 = _128 * _162;
    float _177 = _108 * _162;
    float _179 = _116 * _162;
    float _181 = _169 * _175;
    float _183 = _171 * _177;
    float _185 = _173 * _179;
    float _187 = -_181;
    float _189 = fma(_171, _179, _187);
    float _191 = -_183;
    float _193 = fma(_173, _175, _191);
    float _195 = -_185;
    float _197 = fma(_169, _177, _195);
    float _199 = _189 * _189;
    float _201 = fma(_193, _193, _199);
    bool _203 = !_150;
    int _205 = _203 ? 0 : 1;
    float _207 = fma(_197, _197, _201);
    int _209 = _167;
    if (!_156)
    {
        _209 = _205;
    }
    int _211 = _209;
    float _213 = rsqrt(_207);
    int _215 = _211 + 1;
    uint _218 = uint(_215);
    if (!_160)
    {
        _218 = uint(_211);
    }
    uint _220 = _218;
    uint _222 = min(_220, 2u);
    float _224 = _189 * _213;
    float _226 = _193 * _213;
    int _228 = int(_222) << 2;
    float _230 = _197 * _213;
    float _232 = _224 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _234 = uint(int(uint(_228) >> uint(2)));
    uint _236 = uint(int(uint(int(_234)) >> uint(2)));
    int _238 = int(_234) & 3;
    float _240 = (*spvDescriptorSet0.fp_c1)._m0[int(_236)][_238];
    float _242 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].x, _232);
    float _244 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[35].z, _242);
    float _246 = abs(_244);
    float _248 = -_246;
    float _250 = _248 + 1.0;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = _142 * _68;
    float _256 = abs(_252);
    float _258 = log2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _262 = exp2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _266 = fma(_226, _264, _152);
    float _268 = fma(_224, _264, _254);
    float _270 = fma(_230, _264, _142);
    bool _272 = as_type<int>(_240) == 1264;
    if (!_272)
    {
        bool _274 = as_type<int>(_240) == 1536;
        _276 = _274;
        if (!_276)
        {
            _278 = true;
        }
    }
    float _312;
    float _314;
    float _316;
    float _318;
    if (!_276)
    {
        if (!_278)
        {
            float _280 = _268 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _282 = _268 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _284 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _286 = _268 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _288 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
            float _290 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].x, _282);
            float _292 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].x, _284);
            float _294 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].x, _286);
            float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].z, _288);
            float _298 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].z, _290);
            float _300 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _292);
            float _302 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].z, _294);
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _312 = _310;
            _314 = _308;
            _316 = _304;
            _318 = _306;
        }
    }
    if ((false || _278) || _276)
    {
        if ((!_278) || _276)
        {
            _276 = false;
            float _320 = _268 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _322 = _268 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _324 = _268 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _326 = _268 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _328 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[4].x, _320);
            float _330 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[5].x, _322);
            float _332 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[6].x, _324);
            float _334 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[7].x, _326);
            float _336 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].z, _328);
            float _338 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].z, _330);
            float _340 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].z, _332);
            float _342 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].z, _334);
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _312 = _350;
            _314 = _348;
            _316 = _344;
            _318 = _346;
        }
        if (false || _278)
        {
            _278 = false;
            float _352 = _268 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _354 = _268 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _356 = _268 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _358 = _268 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _360 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[8].x, _352);
            float _362 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[9].x, _354);
            float _364 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[10].x, _356);
            float _366 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[11].x, _358);
            float _368 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].z, _360);
            float _370 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].z, _362);
            float _372 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].z, _364);
            float _374 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].z, _366);
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _312 = _382;
            _314 = _380;
            _316 = _376;
            _318 = _378;
        }
    }
    float _384 = _312;
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = 1.0 / _384;
    float _394 = float(int(_220));
    float _396 = rint(_394);
    float _398 = precise::max(_396, 0.0);
    uint _400 = uint(_398);
    uint _402 = clamp(_400, 0u, 65535u);
    float _404 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _406 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _408 = _392 * _386;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _392 * _388;
    float _414 = _392 * _390;
    float _416 = _410 * _404;
    float _418 = _410 * _406;
    float _420 = fma(_416, 0.5, _412);
    float _422 = fma(_418, 0.5, _414);
    float _424 = fma(_418, 1.5, _414);
    float _426 = fma(_416, 1.5, _412);
    float _428 = fma(_416, -0.5, _412);
    float _430 = fma(_416, -1.5, _412);
    float _432 = fma(_418, -0.5, _414);
    float3 _1297 = float3(_420, _424, float(int(_402)));
    float3 _1301 = select(_1297, float3(0.0), isnan(_1297));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1301.xy, uint(rint(_1301.z)), _410);
    float3 _1310 = float3(_426, _422, float(int(_402)));
    float3 _1312 = select(_1310, float3(0.0), isnan(_1310));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1312.xy, uint(rint(_1312.z)), _410);
    float3 _1321 = float3(_420, _422, float(int(_402)));
    float3 _1323 = select(_1321, float3(0.0), isnan(_1321));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1323.xy, uint(rint(_1323.z)), _410);
    float3 _1332 = float3(_428, _422, float(int(_402)));
    float3 _1334 = select(_1332, float3(0.0), isnan(_1332));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1334.xy, uint(rint(_1334.z)), _410);
    float3 _1343 = float3(_430, _422, float(int(_402)));
    float3 _1345 = select(_1343, float3(0.0), isnan(_1343));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1345.xy, uint(rint(_1345.z)), _410);
    float3 _1354 = float3(_426, _432, float(int(_402)));
    float3 _1356 = select(_1354, float3(0.0), isnan(_1354));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1356.xy, uint(rint(_1356.z)), _410);
    float3 _1365 = float3(_428, _424, float(int(_402)));
    float3 _1367 = select(_1365, float3(0.0), isnan(_1365));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1367.xy, uint(rint(_1367.z)), _410);
    float3 _1376 = float3(_430, _424, float(int(_402)));
    float3 _1378 = select(_1376, float3(0.0), isnan(_1376));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1378.xy, uint(rint(_1378.z)), _410);
    float3 _1387 = float3(_426, _424, float(int(_402)));
    float3 _1389 = select(_1387, float3(0.0), isnan(_1387));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1389.xy, uint(rint(_1389.z)), _410);
    float3 _1398 = float3(_420, _432, float(int(_402)));
    float3 _1400 = select(_1398, float3(0.0), isnan(_1398));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1400.xy, uint(rint(_1400.z)), _410);
    float3 _1409 = float3(_428, _432, float(int(_402)));
    float3 _1411 = select(_1409, float3(0.0), isnan(_1409));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1411.xy, uint(rint(_1411.z)), _410);
    float3 _1420 = float3(_430, _432, float(int(_402)));
    float3 _1422 = select(_1420, float3(0.0), isnan(_1420));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1422.xy, uint(rint(_1422.z)), _410);
    float _458 = _254 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _460 = fma(_418, -1.5, _414);
    float _462 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[15].x, _458);
    float _464 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[15].z, _462);
    float _466 = _464 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _468 = _254 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _470 = _254 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _472 = 1.0 / _466;
    float _474 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[12].x, _468);
    float _476 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[13].x, _470);
    float _478 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[12].z, _474);
    float _480 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[13].z, _476);
    float _482 = _478 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _484 = _480 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _486 = _482 * _472;
    float _488 = _484 * _472;
    float2 _1496 = float2(_486, _488);
    float2 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1496, float2(0.0), isnan(_1496))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1496, float2(0.0), isnan(_1496))).xy;
    float _494 = _492.x;
    float _496 = _492.y;
    float3 _1511 = float3(_426, _460, float(int(_402)));
    float3 _1513 = select(_1511, float3(0.0), isnan(_1511));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1513.xy, uint(rint(_1513.z)), _410);
    float3 _1522 = float3(_420, _460, float(int(_402)));
    float3 _1524 = select(_1522, float3(0.0), isnan(_1522));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1524.xy, uint(rint(_1524.z)), _410);
    float3 _1533 = float3(_428, _460, float(int(_402)));
    float3 _1535 = select(_1533, float3(0.0), isnan(_1533));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1535.xy, uint(rint(_1535.z)), _410);
    float3 _1544 = float3(_430, _460, float(int(_402)));
    float3 _1546 = select(_1544, float3(0.0), isnan(_1544));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1546.xy, uint(rint(_1546.z)), _410);
    float _506 = _254 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _508 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[14].x, _506);
    float _510 = -_142;
    float _512 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _514 = _510 + _512;
    float _516 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[14].z, _508);
    float _518 = _514 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _520 = precise::clamp(_518, 0.0, 1.0);
    float _522 = _516 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _524 = precise::min(_522, 1.0);
    float _526 = _450 + _434;
    float _528 = _526 + _446;
    float _530 = _528 + _448;
    float _532 = _530 + _436;
    float _534 = _532 + _438;
    float _536 = _534 + _440;
    float _538 = _536 + _442;
    float _540 = _538 + _444;
    float _542 = _540 + _452;
    float _544 = _542 + _454;
    float _546 = _544 + _456;
    float _548 = -_142;
    float _550 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _552 = _548 + _550;
    float _554 = _552 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    float _558 = -_494;
    float _560 = fma(_558, _494, _496);
    float _562 = -_494;
    float _564 = _524 + _562;
    float _566 = fma(_564, _564, _560);
    float _568 = _546 + _498;
    bool _570 = _564 <= 0.001000000047497451305389404296875;
    float _572 = float(_570);
    float _574 = 1.0 / _566;
    float _576 = _568 + _500;
    float _578 = _576 + _502;
    float _580 = _560 * _574;
    float _582 = precise::max(_580, _572);
    float _584 = _578 + _504;
    float _586 = precise::min(_582, 1.0);
    float _588 = fma(_584, 0.0625, _520);
    float _590 = _586 + _556;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _588;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _590;
    return out;
}

