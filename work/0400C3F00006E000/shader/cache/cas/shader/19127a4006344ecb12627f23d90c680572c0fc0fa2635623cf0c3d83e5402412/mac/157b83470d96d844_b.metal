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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    texturecube<float> fp_t_tcb_1E [[id(13)]];
    sampler fp_t_tcb_1ESmplr [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_CSmplr_w [[id(18)]];
    sampler fp_t_tcb_34Smplr_w [[id(19)]];
    sampler fp_t_tcb_1ESmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_58 [[user(locn7)]];
    float4 m_67 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
    float4 m_69 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_46.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_46.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_46.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_48.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_48.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_48.z;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_48.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = 1.0 / _80;
    float _126 = _124 * _86;
    float _128 = _124 * _92;
    float _130 = _124 * _98;
    float _132 = _124 * _104;
    float _134 = _124 * _110;
    float _136 = _124 * _116;
    float _138 = 1.0 / _126;
    float _140 = _124 * _122;
    float _142 = _128 * _138;
    float _144 = _130 * _138;
    float2 _666 = float2(_144, _142);
    float _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_666, float2(0.0), isnan(_666))).x;
    float2 _677 = float2(_132, _134);
    float _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_677, float2(0.0), isnan(_677))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_677, float2(0.0), isnan(_677))).w;
    float2 _685 = float2(_136, _140);
    float _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_685, float2(0.0), isnan(_685))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_685, float2(0.0), isnan(_685))).w;
    float _152 = in.m_46.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_50.w;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_52.w;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_54.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _178 = _124 * _156;
    float _180 = _124 * _162;
    float _182 = _178 * _138;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _186 = fma(_182, (*spvDescriptorSet0.fp_c8)._m0[30].w, _184);
    float _188 = 1.0 / _186;
    float _190 = in.m_56.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_58.y;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = _124 * _194;
    float _204 = _124 * _200;
    float _206 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _208 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _206);
    float _210 = -_180;
    float _212 = fma(_148, _150, _210);
    float _214 = _124 * _168;
    float _216 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _218 = _188 * _216;
    float _220 = 1.0 / _208;
    float _222 = _212 * _214;
    float _224 = 0.0 + _222;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _230 = -_218;
    float _232 = fma(_220, _228, _230);
    float _234 = _232 * _176;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = _124 * _174;
    float _240 = _226 * _236;
    float _242 = _240 * _238;
    bool _246 = _242 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _248 = isnan(_242);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _254 = _250 || _252;
    float _256 = in.m_56.x;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_58.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = _218;
    if (!_254)
    {
        discard_fragment();
    }
    float _270 = _124 * _260;
    float _272 = _124 * _266;
    float2 _863 = float2(_270, _202);
    float2 _276 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_863, float2(0.0), isnan(_863))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_863, float2(0.0), isnan(_863))).xy;
    float _278 = _276.x;
    float _280 = _276.y;
    float2 _875 = float2(_272, _204);
    float2 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_875, float2(0.0), isnan(_875))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_875, float2(0.0), isnan(_875))).xy;
    float _284 = _282.x;
    float _286 = _282.y;
    float _288 = in.m_60.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_60.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_60.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _124 * _292;
    float _308 = _124 * _298;
    float _310 = _124 * _304;
    float _312 = _306 * _306;
    float _314 = fma(_308, _308, _312);
    float _316 = fma(_310, _310, _314);
    float _318 = rsqrt(_316);
    float _320 = _308 * _318;
    float _322 = _306 * _318;
    float _324 = _310 * _318;
    if (!_254)
    {
        out.m_63.x = 0.0500000007450580596923828125;
        out.m_63.y = 0.0;
        out.m_63.z = 0.0;
        out.m_63.w = _222;
        return out;
    }
    float _326 = abs(_320);
    float _328 = abs(_322);
    float _330 = precise::max(_326, _328);
    float _332 = abs(_324);
    float _334 = precise::max(_332, _330);
    float _336 = 1.0 / _334;
    float _338 = -_336;
    float _340 = _324 * _338;
    float _342 = _320 * _336;
    float _344 = _322 * _336;
    float3 _977 = float3(_342, _344, _340);
    float _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_977, float3(0.0), isnan(_977)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_977, float3(0.0), isnan(_977)), level(0.0)).x;
    float _348 = in.m_65.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_65.x;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_67.y;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_67.x;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_65.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_67.z;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = _124 * _352;
    float _386 = _124 * _358;
    float _388 = _124 * _364;
    float _390 = _124 * _370;
    float _392 = _384 * _384;
    float _394 = in.m_69.w;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = _388 * _388;
    float _402 = in.m_69.z;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = fma(_386, _386, _392);
    float _410 = _124 * _376;
    float _412 = fma(_390, _390, _400);
    float _414 = _124 * _382;
    float _416 = fma(_410, _410, _408);
    float _418 = -_280;
    float _420 = _418 + _286;
    float _422 = fma(_414, _414, _412);
    float _424 = -_278;
    float _426 = _424 + _284;
    float _428 = _322 * _322;
    float _430 = fma(_420, 0.20000000298023223876953125, _280);
    float _432 = rsqrt(_416);
    float _434 = fma(_426, 0.20000000298023223876953125, _278);
    float _436 = fma(_320, _320, _428);
    float _438 = _430 * _430;
    float _440 = in.m_69.x;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = fma(_324, _324, _436);
    float _448 = fma(_434, _434, _438);
    float _450 = precise::clamp(_448, 0.0, 1.0);
    float _452 = rsqrt(_422);
    float _454 = -_450;
    float _456 = _454 + 1.0;
    float _458 = rsqrt(_446);
    float _460 = _384 * _432;
    float _462 = in.m_71.x;
    float _464 = gl_FragCoord.w;
    float _466 = _462 * _464;
    float _468 = sqrt(_456);
    float _470 = _388 * _452;
    float _472 = in.m_73.x;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = _430 * _470;
    float _480 = _322 * _458;
    float _482 = fma(_434, _460, _478);
    float _484 = in.m_69.y;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    bool _490 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _492 = fma(_480, _468, _482);
    float _494 = fma(_492, -0.5, 0.5);
    float _496 = _494 * _494;
    if (_490)
    {
        float _498 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _500 = _218 + _498;
        _268 = _500;
    }
    float _502 = _268;
    float _504 = _494 * _496;
    float _506 = _504 * 2.1456000804901123046875;
    float _508 = _504 * 0.75;
    float _510 = fma(_504, 14.94999980926513671875, 0.0500000007450580596923828125);
    float _512 = _124 * _476;
    float _514 = fma(_510, 0.2125999927520751953125, _506);
    float _516 = fma(_504, 0.05415000021457672119140625, _514);
    float _518 = 1.0 / _516;
    float _520 = _124 * _406;
    float _522 = _518 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _524 = precise::clamp(_522, 0.0, 1.0);
    float _526 = fma(_524, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _528 = _124 * _398;
    float _530 = _504 * 3.0;
    float _532 = _124 * _488;
    float _534 = _526 * _528;
    float _536 = _510 * _526;
    float _538 = _510;
    if (_490)
    {
        float _540 = _502 * 8.0;
        float _542 = precise::clamp(_540, 0.0, 1.0);
        _538 = _542;
    }
    float _544 = _538;
    float _546 = fma(_508, _534, _520);
    float _548 = _124 * _466;
    float _550 = fma(_530, _534, _532);
    float _552 = _124 * _444;
    float _554 = fma(_346, 0.20999999344348907470703125, _512);
    float _556 = _554 + _548;
    float _558 = 0.0 + _242;
    float _560 = precise::clamp(_558, 0.0, 1.0);
    float _562 = fma(_556, 0.0500000007450580596923828125, _536);
    float _564 = _560;
    if (_490)
    {
        float _566 = _560 * _544;
        _564 = _566;
    }
    float _568 = _564;
    float _570 = fma(_562, _528, _552);
    float _572 = 0.0 + _568;
    float _574 = precise::clamp(_572, 0.0, 1.0);
    out.m_63.x = _570;
    out.m_63.y = _550;
    out.m_63.z = _546;
    out.m_63.w = _574;
    return out;
}

