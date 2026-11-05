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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texturecube<float> fp_t_tcb_1E [[id(6)]];
    sampler fp_t_tcb_1ESmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_1ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_49 [[user(locn8)]];
    float4 m_51 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_38.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_38.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _638 = float2(_88, _90);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_638, float2(0.0), isnan(_638))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_638, float2(0.0), isnan(_638))).xyzw;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = _93.w;
    float _103 = in.m_40.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_42.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_42.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _86 * _107;
    float _123 = in.m_44.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_44.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_44.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _86 * _113;
    float _143 = 0.0 + _101;
    float _145 = precise::clamp(_143, 0.0, 1.0);
    float _147 = _145 * _121;
    bool _150 = _147 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _152 = isnan(_147);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _158 = _154 || _156;
    float _160 = in.m_42.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    if (!_158)
    {
        discard_fragment();
    }
    float _166 = _97 * _97;
    float _168 = _99 * _99;
    float _170 = _95 * _95;
    float _172 = _86 * _119;
    float _174 = -_166;
    float _176 = _174 + 1.0;
    float _178 = -_168;
    float _180 = _178 + 1.0;
    float _182 = -_170;
    float _184 = _182 + 1.0;
    float _186 = _141 * _180;
    float _188 = _86 * _133;
    float _190 = _86 * _164;
    float _192 = _190 * _176;
    float _194 = _172 * _184;
    float _196 = _86 * _127;
    float _198 = _86 * _139;
    float _200 = fma(_166, _188, _192);
    float _202 = fma(_170, _196, _194);
    float _204 = fma(_168, _198, _186);
    if (!_158)
    {
        out.m_47.x = _202;
        out.m_47.y = _200;
        out.m_47.z = _204;
        out.m_47.w = _101;
        return out;
    }
    float _206 = in.m_49.w;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_44.w;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_51.w;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = _86 * _210;
    float _226 = precise::max(_224, 0.949999988079071044921875);
    float _228 = precise::max(0.0, _224);
    float _230 = precise::min(_226, 1.0);
    float _232 = precise::min(_228, 0.0500000007450580596923828125);
    float _234 = fma(_230, -19.999996185302734375, 19.999996185302734375);
    float _236 = _232 * 20.0;
    float _238 = _86 * _216;
    float _240 = _234 * _236;
    float _242 = _240 * _240;
    float _244 = _86 * _222;
    float _246 = _238 * _242;
    float _248 = _244 * _246;
    bool _250 = _248 != 1.0;
    bool _252 = isnan(_248);
    bool _254 = _250 || _252;
    bool _256 = isnan(1.0);
    bool _258 = _254 || _256;
    bool _260 = !_258;
    if (!_260)
    {
        float _262 = gl_FragCoord.x;
        float _264 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _266 = _262 / _264;
        float _268 = gl_FragCoord.y;
        float _270 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _272 = _268 / _270;
        float _274 = _248 * 256.0;
        float _276 = trunc(_274);
        int _279 = int(_276);
        float _281 = trunc(_266);
        int _283 = int(_281);
        float _285 = trunc(_272);
        int _287 = int(_285);
        int _289 = _283 + 2;
        int _291 = _289 >> 1;
        uint _294 = uint(int(uint(_287) >> uint(1)));
        int _296 = _291 ^ int(_294);
        int _298 = _296 << 16;
        int _300 = _298 ^ _291;
        int _302 = 983055 & _300;
        int _304 = _302 << 6;
        int _306 = _304 + _302;
        int _308 = _306 & 13369548;
        uint _310 = uint(int(uint(_308) >> uint(3)));
        int _312 = _308 | int(_310);
        uint _314 = uint(int(uint(_279) >> uint(7)));
        int _316 = int(_314) + _279;
        int _318 = _312 & 5570560;
        int _320 = _312 & 85;
        uint _322 = uint(int(uint(_318) >> uint(15)));
        int _324 = int(_322) + _320;
        bool _326 = uint(_316) > uint(_324);
        if (!_326)
        {
            discard_fragment();
        }
        if (!_326)
        {
            out.m_47.x = _202;
            out.m_47.y = _200;
            out.m_47.z = _204;
            out.m_47.w = _147;
            return out;
        }
    }
    float _328 = in.m_53.y;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _336 = in.m_53.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_53.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_51.x;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = _86 * _332;
    bool _356 = as_type<int>(_334) != 0;
    float _358 = _86 * _340;
    bool _360 = !_356;
    float _362 = -_354;
    float _364 = _360 ? _362 : _354;
    float _366 = _86 * _346;
    bool _368 = !_356;
    float _370 = -_358;
    float _372 = _368 ? _370 : _358;
    float _374 = _364 * _364;
    bool _376 = !_356;
    float _378 = -_366;
    float _380 = _376 ? _378 : _366;
    float _382 = fma(_372, _372, _374);
    float _384 = fma(_380, _380, _382);
    float _386 = rsqrt(_384);
    float _388 = _372 * _386;
    float _390 = _364 * _386;
    float _392 = _380 * _386;
    float _394 = abs(_388);
    float _396 = abs(_390);
    float _398 = precise::max(_394, _396);
    float _400 = abs(_392);
    float _402 = precise::max(_400, _398);
    float _404 = _86 * _352;
    float _406 = 1.0 / _402;
    float _408 = precise::min(_404, 1.0);
    float _410 = _390 * _406;
    float _412 = -_406;
    float _414 = _392 * _412;
    float _416 = _388 * _406;
    float3 _1118 = float3(_416, _410, _414);
    float3 _420 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1118, float3(0.0), isnan(_1118)), level(_408)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1118, float3(0.0), isnan(_1118)), level(_408)).xyz;
    float _422 = _420.x;
    float _424 = _420.y;
    float _426 = _420.z;
    float _428 = in.m_59.x;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = in.m_59.y;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    float _440 = in.m_59.z;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_61.x;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_61.z;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_61.y;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = in.m_63.w;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = in.m_63.z;
    float _472 = gl_FragCoord.w;
    float _474 = _470 * _472;
    float _476 = in.m_63.x;
    float _478 = gl_FragCoord.w;
    float _480 = _476 * _478;
    float _482 = in.m_63.y;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = _170 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _490 = -_404;
    float _492 = _490 + 1.0;
    float _494 = _492 * _488;
    float _496 = _494 * 0.02624999918043613433837890625;
    bool _498 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _500 = _86 * _432;
    float _502 = _86 * _438;
    float _504 = _86 * _444;
    float _506 = _86 * _468;
    float _508 = _86 * _474;
    float _510 = _86 * _480;
    float _512 = fma(_422, 0.20999999344348907470703125, _500);
    float _514 = fma(_424, 0.20999999344348907470703125, _502);
    float _516 = fma(_426, 0.20999999344348907470703125, _504);
    float _518 = _86 * _456;
    float _520 = fma(_496, (*spvDescriptorSet0.fp_c15)._m0[17].x, _512);
    float _522 = fma(_496, (*spvDescriptorSet0.fp_c15)._m0[17].y, _514);
    float _524 = fma(_496, (*spvDescriptorSet0.fp_c15)._m0[17].z, _516);
    float _526 = _86 * _450;
    float _528 = _86 * _462;
    float _530 = _524 + _518;
    float _532 = _520 + _526;
    float _534 = _522 + _528;
    float _536 = _204 * _530;
    float _538 = _202 * _532;
    float _540 = 0.0 + _147;
    float _542 = precise::clamp(_540, 0.0, 1.0);
    float _544 = _200 * _534;
    float _546 = _86 * _486;
    float _548 = fma(_536, _506, _508);
    float _550 = fma(_538, _506, _510);
    float _552 = _508;
    if (!_498)
    {
        _552 = _542;
    }
    float _554 = _552;
    float _556 = fma(_544, _506, _546);
    bool _558 = !_498;
    float _560 = _554;
    if (!_558)
    {
        float _562 = in.m_65.w;
        float _564 = gl_FragCoord.w;
        float _566 = _562 * _564;
        float _568 = in.m_65.z;
        float _570 = gl_FragCoord.w;
        float _572 = _568 * _570;
        float _574 = _86 * _566;
        float _576 = _86 * _572;
        float _578 = 1.0 / _574;
        float _580 = _576 * _578;
        float _582 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _584 = fma(_580, (*spvDescriptorSet0.fp_c8)._m0[30].w, _582);
        float _586 = 1.0 / _584;
        float _588 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _590 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _592 = fma(_586, _588, _590);
        float _594 = _592 * 8.0;
        float _596 = precise::clamp(_594, 0.0, 1.0);
        float _598 = _542 * _596;
        _560 = _598;
    }
    float _600 = _560;
    float _602 = 0.0 + _600;
    float _604 = precise::clamp(_602, 0.0, 1.0);
    out.m_47.x = _550;
    out.m_47.y = _556;
    out.m_47.z = _548;
    out.m_47.w = _604;
    return out;
}

