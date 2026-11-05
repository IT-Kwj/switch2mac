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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_56 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_40.z;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_40.w;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = 1.0 / _74;
    float _102 = _100 * _80;
    float _104 = _100 * _86;
    float _106 = _100 * _92;
    float _108 = _100 * _98;
    float2 _679 = float2(_102, _104);
    float4 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_679, float2(0.0), isnan(_679))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_679, float2(0.0), isnan(_679))).xyzw;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float _119 = _111.w;
    float2 _698 = float2(_106, _108);
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_698, float2(0.0), isnan(_698))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_42.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_42.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_42.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_44.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_44.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_44.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_46.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _175 = _173 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _177 = 1.0 / _175;
    float _179 = _100 * _135;
    float _181 = _100 * _141;
    float _183 = _100 * _147;
    float _185 = in.m_48.w;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = _179 * _179;
    float _193 = fma(_181, _181, _191);
    float _195 = _100 * _153;
    float _197 = fma(_183, _183, _193);
    float _199 = rsqrt(_197);
    float _201 = _100 * _165;
    float _203 = _179 * _199;
    float _205 = _100 * _159;
    float _207 = _181 * _199;
    float _209 = _183 * _199;
    float _211 = _195 * _203;
    float _213 = fma(_205, _207, _211);
    float _215 = fma(_201, _209, _213);
    float _217 = in.m_50.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = abs(_215);
    float _225 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _227 = _223 + _225;
    float _229 = _227 * _177;
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_231, -2.0, 3.0);
    float _235 = _100 * _171;
    float _237 = _231 * _231;
    float _239 = _233 * _237;
    float _241 = _100 * _221;
    float _243 = -_235;
    float _245 = _119 + _243;
    float _247 = _100 * _189;
    float _249 = _247 * _245;
    float _251 = _129 * _249;
    float _253 = 0.0 + _251;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = _255 * _239;
    float _259 = _257 * _241;
    bool _262 = _259 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _264 = isnan(_259);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _270 = _266 || _268;
    float _272 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    if (!_270)
    {
        discard_fragment();
    }
    float _274 = in.m_56.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    bool _280 = as_type<int>(_272) != 0;
    bool _282 = !_280;
    float _284 = -_195;
    float _286 = _282 ? _284 : _195;
    bool _288 = !_280;
    float _290 = -_205;
    float _292 = _288 ? _290 : _205;
    bool _294 = !_280;
    float _296 = -_201;
    float _298 = _294 ? _296 : _201;
    float _300 = _286 * _286;
    float _302 = fma(_292, _292, _300);
    float _304 = fma(_298, _298, _302);
    float _306 = rsqrt(_304);
    float _308 = _292 * _306;
    float _310 = _286 * _306;
    float _312 = _298 * _306;
    float _314 = _100 * _278;
    float _316 = abs(_308);
    float _318 = abs(_310);
    float _320 = precise::max(_316, _318);
    float _322 = precise::min(_314, 1.0);
    float _324 = abs(_312);
    float _326 = precise::max(_324, _320);
    float _328 = 1.0 / _326;
    float _330 = _308 * _328;
    float _332 = _310 * _328;
    float _334 = -_328;
    float _336 = _312 * _334;
    float3 _1004 = float3(_330, _332, _336);
    float3 _340 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1004, float3(0.0), isnan(_1004)), level(_322)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1004, float3(0.0), isnan(_1004)), level(_322)).xyz;
    float _342 = _340.x;
    float _344 = _340.y;
    float _346 = _340.z;
    float _348 = _310 * _310;
    float _350 = in.m_48.x;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_48.z;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_46.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = fma(_308, _308, _348);
    float _370 = _115 * _125;
    float _372 = _113 * _123;
    float _374 = _117 * _127;
    float _376 = fma(_312, _312, _368);
    float _378 = -_374;
    float _380 = _378 + 1.0;
    float _382 = rsqrt(_376);
    float _384 = in.m_48.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = _310 * _382;
    float _392 = _308 * _382;
    float _394 = _312 * _382;
    float _396 = _390 * _390;
    float _398 = in.m_46.y;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = _100 * _360;
    float _406 = fma(_392, _392, _396);
    float _408 = fma(_394, _394, _406);
    float _410 = in.m_46.z;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = rsqrt(_408);
    float _418 = _100 * _388;
    float _420 = -_370;
    float _422 = _420 + 1.0;
    float _424 = _418 * _422;
    float _426 = _404 * _380;
    float _428 = _100 * _366;
    float _430 = _100 * _354;
    float _432 = _394 * _416;
    float _434 = _390 * _416;
    float _436 = _432 * 0.577381789684295654296875;
    float _438 = fma(_434, 0.816474258899688720703125, _436);
    float _440 = -_372;
    float _442 = _440 + 1.0;
    float _444 = _430 * _442;
    float _446 = _100 * _402;
    float _448 = _100 * _414;
    float _450 = fma(_438, 0.0999999940395355224609375, 0.89999997615814208984375);
    float _452 = fma(_372, _428, _444);
    float _454 = fma(_370, _446, _424);
    float _456 = fma(_374, _448, _426);
    float _458 = _452 * _450;
    float _460 = _454 * _450;
    float _462 = _456 * _450;
    if (!_270)
    {
        out.m_59.x = _458;
        out.m_59.y = _460;
        out.m_59.z = _462;
        out.m_59.w = _251;
        return out;
    }
    float _464 = in.m_61.y;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = in.m_61.z;
    float _472 = gl_FragCoord.w;
    float _474 = _470 * _472;
    float _476 = in.m_61.x;
    float _478 = gl_FragCoord.w;
    float _480 = _476 * _478;
    float _482 = in.m_63.y;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = in.m_63.x;
    float _490 = gl_FragCoord.w;
    float _492 = _488 * _490;
    float _494 = in.m_63.z;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = in.m_65.x;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = in.m_65.w;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = in.m_65.y;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = in.m_65.z;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = _100 * _468;
    float _526 = _100 * _474;
    float _528 = _100 * _480;
    float _530 = fma(_344, 0.20999999344348907470703125, _524);
    float _532 = _100 * _486;
    float _534 = fma(_342, 0.20999999344348907470703125, _528);
    bool _536 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _538 = _100 * _492;
    float _540 = fma(_346, 0.20999999344348907470703125, _526);
    float _542 = _100 * _498;
    float _544 = _530 + _532;
    float _546 = _534 + _538;
    float _548 = _100 * _516;
    float _550 = _540 + _542;
    float _552 = _460 * _544;
    float _554 = _458 * _546;
    float _556 = 0.0 + _259;
    float _558 = precise::clamp(_556, 0.0, 1.0);
    float _560 = _100 * _504;
    float _562 = _100 * _510;
    float _564 = _462 * _550;
    float _566 = _100 * _522;
    float _568 = fma(_554, _562, _560);
    float _570 = fma(_552, _562, _548);
    float _572 = fma(_564, _562, _566);
    float _574 = _560;
    if (!_536)
    {
        _574 = _558;
    }
    float _576 = _574;
    bool _578 = !_536;
    float _580 = _576;
    if (!_578)
    {
        float _582 = in.m_67.w;
        float _584 = gl_FragCoord.w;
        float _586 = _582 * _584;
        float _588 = in.m_67.z;
        float _590 = gl_FragCoord.w;
        float _592 = _588 * _590;
        float _594 = _100 * _586;
        float _596 = _100 * _592;
        float _598 = 1.0 / _594;
        float _600 = _596 * _598;
        float _602 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _604 = fma(_600, (*spvDescriptorSet0.fp_c8)._m0[30].w, _602);
        float _606 = 1.0 / _604;
        float _608 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _610 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _612 = fma(_606, _608, _610);
        float _614 = _612 * 8.0;
        float _616 = precise::clamp(_614, 0.0, 1.0);
        float _618 = _558 * _616;
        _580 = _618;
    }
    float _620 = _580;
    float _622 = 0.0 + _620;
    float _624 = precise::clamp(_622, 0.0, 1.0);
    out.m_59.x = _568;
    out.m_59.y = _570;
    out.m_59.z = _572;
    out.m_59.w = _624;
    return out;
}

