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
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _282 = false;
    bool _280 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _626 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_626, float2(0.0), isnan(_626)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _643 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_643, float2(0.0), isnan(_643))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_643, float2(0.0), isnan(_643))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_44.y;
    float _76 = in.m_42.x;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = _72 * _88;
    float _98 = _76 * _88;
    float _100 = -_96;
    float _102 = fma(_94, _74, _100);
    float _104 = -_68;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[46].z, _106);
    float _110 = -_98;
    float _112 = fma(_94, _80, _110);
    float _114 = -_88;
    float _116 = _114 + _94;
    float _118 = _102 * _102;
    float _120 = -_96;
    float _122 = fma(_108, _78, _120);
    float _124 = -_98;
    float _126 = fma(_108, _82, _124);
    float _128 = -_88;
    float _130 = _128 + _108;
    float _132 = fma(_112, _112, _118);
    float _134 = _122 * _122;
    float _136 = fma(_116, _116, _132);
    float _138 = fma(_126, _126, _134);
    float _140 = fma(_130, _130, _138);
    float _142 = rsqrt(_136);
    float _144 = rsqrt(_140);
    float _146 = -_70;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[46].z, _148);
    float _152 = _150 * _76;
    float _154 = -_150;
    bool _158 = _154 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _160 = _150 * _72;
    float _162 = _112 * _142;
    float _164 = _116 * _142;
    float _166 = _102 * _142;
    float _168 = -_150;
    bool _170 = _168 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _172 = -_150;
    bool _174 = _172 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _176 = _130 * _144;
    float _178 = _122 * _144;
    float _180 = _126 * _144;
    float _182 = _162 * _176;
    float _184 = _164 * _178;
    float _186 = _166 * _180;
    float _188 = -_182;
    float _190 = fma(_164, _180, _188);
    float _192 = -_184;
    float _194 = fma(_166, _176, _192);
    float _196 = -_186;
    float _198 = fma(_162, _178, _196);
    float _200 = _190 * _190;
    int _203 = 2;
    if (!_158)
    {
        _203 = 1;
    }
    int _205 = _203;
    float _207 = fma(_194, _194, _200);
    float _209 = fma(_198, _198, _207);
    bool _211 = !_158;
    int _213 = _211 ? 0 : 1;
    float _215 = rsqrt(_209);
    int _217 = _205;
    if (!_170)
    {
        _217 = _213;
    }
    int _219 = _217;
    int _221 = _219 + 1;
    uint _224 = uint(_221);
    if (!_174)
    {
        _224 = uint(_219);
    }
    uint _226 = _224;
    uint _228 = min(_226, 2u);
    int _230 = int(_228) << 2;
    float _232 = _190 * _215;
    float _234 = _194 * _215;
    float _236 = _198 * _215;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _240 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
    uint _242 = uint(int(uint(_230) >> uint(2)));
    uint _244 = uint(int(uint(int(_242)) >> uint(2)));
    int _246 = int(_242) & 3;
    float _248 = (*spvDescriptorSet0.fp_c1)._m0[int(_244)][_246];
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].z, _240);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = abs(_258);
    float _262 = log2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _266 = exp2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _270 = fma(_234, _268, _152);
    float _272 = fma(_232, _268, _160);
    float _274 = fma(_236, _268, _150);
    bool _276 = as_type<int>(_248) == 1264;
    if (!_276)
    {
        bool _278 = as_type<int>(_248) == 1536;
        _280 = _278;
        if (!_280)
        {
            _282 = true;
        }
    }
    float _316;
    float _318;
    float _320;
    float _322;
    if (!_280)
    {
        if (!_282)
        {
            float _284 = _272 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _286 = _272 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _288 = _272 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _290 = _272 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _292 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].x, _284);
            float _294 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].x, _286);
            float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].x, _288);
            float _298 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].z, _292);
            float _302 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].z, _294);
            float _304 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].z, _296);
            float _306 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].z, _298);
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _316 = _314;
            _318 = _312;
            _320 = _308;
            _322 = _310;
        }
    }
    if ((false || _282) || _280)
    {
        if ((!_282) || _280)
        {
            _280 = false;
            float _324 = _272 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _326 = _272 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _328 = _272 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _330 = _272 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _332 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].x, _324);
            float _334 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].x, _326);
            float _336 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].x, _328);
            float _338 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].z, _332);
            float _342 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].z, _334);
            float _344 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].z, _336);
            float _346 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].z, _338);
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _316 = _354;
            _318 = _352;
            _320 = _348;
            _322 = _350;
        }
        if (false || _282)
        {
            _282 = false;
            float _356 = _272 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _358 = _272 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _360 = _272 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _362 = _272 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _364 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].x, _356);
            float _366 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].x, _358);
            float _368 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].x, _360);
            float _370 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].z, _364);
            float _374 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].z, _366);
            float _376 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].z, _368);
            float _378 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].z, _370);
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _316 = _386;
            _318 = _384;
            _320 = _380;
            _322 = _382;
        }
    }
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float _396 = 1.0 / _388;
    float _398 = float(int(_226));
    float _400 = rint(_398);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    uint _406 = clamp(_404, 0u, 65535u);
    float _408 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _410 = _396 * _390;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _396 * _392;
    float _416 = _396 * _394;
    float _418 = _412 * _408;
    float _420 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _422 = _412 * _420;
    float _424 = fma(_418, 0.5, _414);
    float _426 = fma(_422, 1.5, _416);
    float _428 = fma(_418, -0.5, _414);
    float _430 = fma(_418, -1.5, _414);
    float _432 = fma(_418, 1.5, _414);
    float3 _1315 = float3(_424, _426, float(int(_406)));
    float3 _1319 = select(_1315, float3(0.0), isnan(_1315));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1319.xy, uint(rint(_1319.z)), _412);
    float3 _1328 = float3(_428, _426, float(int(_406)));
    float3 _1330 = select(_1328, float3(0.0), isnan(_1328));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1330.xy, uint(rint(_1330.z)), _412);
    float3 _1339 = float3(_430, _426, float(int(_406)));
    float3 _1341 = select(_1339, float3(0.0), isnan(_1339));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1341.xy, uint(rint(_1341.z)), _412);
    float3 _1350 = float3(_432, _426, float(int(_406)));
    float3 _1352 = select(_1350, float3(0.0), isnan(_1350));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1352.xy, uint(rint(_1352.z)), _412);
    float _442 = fma(_422, 0.5, _416);
    float3 _1364 = float3(_432, _442, float(int(_406)));
    float3 _1366 = select(_1364, float3(0.0), isnan(_1364));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1366.xy, uint(rint(_1366.z)), _412);
    float3 _1375 = float3(_424, _442, float(int(_406)));
    float3 _1377 = select(_1375, float3(0.0), isnan(_1375));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1377.xy, uint(rint(_1377.z)), _412);
    float3 _1386 = float3(_428, _442, float(int(_406)));
    float3 _1388 = select(_1386, float3(0.0), isnan(_1386));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1388.xy, uint(rint(_1388.z)), _412);
    float3 _1397 = float3(_430, _442, float(int(_406)));
    float3 _1399 = select(_1397, float3(0.0), isnan(_1397));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1399.xy, uint(rint(_1399.z)), _412);
    float2 _1405 = float2(_56, _58);
    float2 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1405, float2(0.0), isnan(_1405))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1405, float2(0.0), isnan(_1405))).xy;
    float _456 = _454.x;
    float _458 = _454.y;
    float _460 = fma(_422, -1.5, _416);
    float _462 = _440 + _434;
    float _464 = _462 + _436;
    float _466 = _464 + _438;
    float _468 = _466 + _444;
    float _470 = fma(_422, -0.5, _416);
    float _472 = _468 + _446;
    float3 _1441 = float3(_432, _470, float(int(_406)));
    float3 _1443 = select(_1441, float3(0.0), isnan(_1441));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1443.xy, uint(rint(_1443.z)), _412);
    float3 _1452 = float3(_424, _470, float(int(_406)));
    float3 _1454 = select(_1452, float3(0.0), isnan(_1452));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1454.xy, uint(rint(_1454.z)), _412);
    float3 _1463 = float3(_428, _470, float(int(_406)));
    float3 _1465 = select(_1463, float3(0.0), isnan(_1463));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1465.xy, uint(rint(_1465.z)), _412);
    float3 _1474 = float3(_430, _470, float(int(_406)));
    float3 _1476 = select(_1474, float3(0.0), isnan(_1474));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1476.xy, uint(rint(_1476.z)), _412);
    float _482 = _160 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _484 = _160 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _486 = _472 + _448;
    float _488 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[15].x, _482);
    float _490 = _160 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _492 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].z, _488);
    float _494 = _492 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _496 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[12].x, _490);
    float _498 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[13].x, _484);
    float _500 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].z, _496);
    float _502 = 1.0 / _494;
    float _504 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].z, _498);
    float _506 = _500 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _508 = _504 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _510 = fma(_456, 2.0, -1.0);
    float _512 = fma(_458, 2.0, -1.0);
    float _514 = _506 * _502;
    float _516 = _508 * _502;
    float _518 = _486 + _450;
    float _520 = _510 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _522 = _512 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float2 _1568 = float2(_514, _516);
    float2 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1568, float2(0.0), isnan(_1568))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1568, float2(0.0), isnan(_1568))).xy;
    float _526 = _524.x;
    float _528 = _524.y;
    float _530 = fma(_520, 2.0, _56);
    float _532 = fma(_522, 2.0, _58);
    float3 _1589 = float3(_432, _460, float(int(_406)));
    float3 _1591 = select(_1589, float3(0.0), isnan(_1589));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1591.xy, uint(rint(_1591.z)), _412);
    float3 _1600 = float3(_424, _460, float(int(_406)));
    float3 _1602 = select(_1600, float3(0.0), isnan(_1600));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1602.xy, uint(rint(_1602.z)), _412);
    float3 _1611 = float3(_428, _460, float(int(_406)));
    float3 _1613 = select(_1611, float3(0.0), isnan(_1611));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1613.xy, uint(rint(_1613.z)), _412);
    float3 _1622 = float3(_430, _460, float(int(_406)));
    float3 _1624 = select(_1622, float3(0.0), isnan(_1622));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1624.xy, uint(rint(_1624.z)), _412);
    float2 _1630 = float2(_530, _532);
    float _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1630, float2(0.0), isnan(_1630))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1630, float2(0.0), isnan(_1630))).x;
    float _544 = _160 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _546 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[14].x, _544);
    float _548 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].z, _546);
    float _550 = _548 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _552 = precise::min(_550, 1.0);
    float _554 = -_150;
    float _556 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _558 = _554 + _556;
    float _560 = _558 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = _518 + _474;
    float _566 = _564 + _476;
    float _568 = _566 + _478;
    float _570 = _568 + _480;
    float _572 = -_526;
    float _574 = fma(_572, _526, _528);
    float _576 = -_526;
    float _578 = _552 + _576;
    float _580 = fma(_578, _578, _574);
    bool _582 = _578 <= 0.001000000047497451305389404296875;
    float _584 = float(_582);
    float _586 = _570 + _534;
    float _588 = 1.0 / _580;
    float _590 = _586 + _536;
    float _592 = _590 + _538;
    float _594 = -_150;
    float _596 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _598 = _594 + _596;
    float _600 = _574 * _588;
    float _602 = _592 + _540;
    float _604 = _598 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = precise::max(_600, _584);
    float _610 = fma(_602, 0.0625, _562);
    float _612 = precise::min(_608, 1.0);
    float _614 = _612 + _606;
    out.m_49.x = _542;
    out.m_49.y = _610;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _614;
    return out;
}

