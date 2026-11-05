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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_41 [[user(locn5), flat]];
    float4 m_39 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.z;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _103 = _101 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _105 = -(*spvDescriptorSet0.fp_c9)._m0[194].x;
    float _107 = _105 + (*spvDescriptorSet0.fp_c9)._m0[194].y;
    float _109 = 1.0 / _63;
    float _111 = _109 * _69;
    float _113 = _109 * _75;
    float _115 = _111 + (-0.5);
    float _117 = _113 + (-0.5);
    float _119 = floor(_103);
    float _121 = _115 * _115;
    float _123 = fma(_117, _117, _121);
    float _125 = sqrt(_123);
    float _127 = -_119;
    float _129 = _103 + _127;
    float _131 = in.m_41.y;
    float _133 = _109 * _87;
    float _135 = _129 + 0.5;
    float _137 = _129 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _139 = _133 + (-0.5);
    float _141 = floor(_135);
    float _143 = _109 * _99;
    float _145 = _125 * 2.0;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = _143 + (-0.5);
    float _151 = -_147;
    float _153 = fma(_151, _147, 1.0);
    float _155 = _137 * _153;
    float _157 = _155 * 0.01745329238474369049072265625;
    float _159 = -_141;
    float _161 = _135 + _159;
    float _163 = _157 * 0.15915493667125701904296875;
    float _165 = _161 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _167 = _163 * 6.283185482025146484375;
    float _169 = sin(_167);
    float _171 = _153 * _165;
    float _173 = _109 * _81;
    float _175 = _171 * 0.01745329238474369049072265625;
    float _177 = _173 + (-0.5);
    float _179 = _163 * 6.283185482025146484375;
    float _181 = cos(_179);
    float _183 = _109 * _93;
    float _185 = _175 * 0.15915493667125701904296875;
    float _187 = in.m_41.x;
    float _189 = _183 + (-0.5);
    float _191 = _185 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = _169 * _177;
    float _197 = fma(_107, _161, (*spvDescriptorSet0.fp_c9)._m0[194].x);
    float _199 = fma(_129, _107, (*spvDescriptorSet0.fp_c9)._m0[194].x);
    float _201 = _185 * 6.283185482025146484375;
    float _203 = sin(_201);
    float _205 = _181 * _177;
    float _207 = -_195;
    float _209 = fma(_181, _139, _207);
    float _211 = fma(_169, _139, _205);
    float _213 = _193 * _189;
    float _215 = fma(_211, _199, 0.5);
    float _217 = _203 * _189;
    float _219 = fma(_203, _149, _213);
    float _221 = fma(_209, _199, 0.5);
    float _223 = -_217;
    float _225 = fma(_193, _149, _223);
    float _227 = fma(_219, _197, 0.5);
    float _229 = _221 + _187;
    float _231 = _215 + _187;
    float _233 = fma(_225, _197, 0.5);
    float _235 = _131 + _227;
    float _237 = _131 + _233;
    float2 _840 = float2(_229, _231);
    float4 _240 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_840, float2(0.0), isnan(_840))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_840, float2(0.0), isnan(_840))).xyzw;
    float _242 = _240.x;
    float _244 = _240.y;
    float _246 = _240.z;
    float _248 = _240.w;
    float2 _858 = float2(_237, _235);
    float4 _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_858, float2(0.0), isnan(_858))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_858, float2(0.0), isnan(_858))).xyzw;
    float _252 = _250.x;
    float _254 = _250.y;
    float _256 = _250.z;
    float _258 = _250.w;
    float _260 = in.m_43.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_43.x;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_43.z;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_45.y;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_45.x;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_45.z;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = _109 * _264;
    float _298 = _109 * _270;
    float _300 = _109 * _276;
    float _302 = _109 * _282;
    float _304 = _296 * _296;
    float _306 = fma(_298, _298, _304);
    float _308 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _310 = _308 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _312 = fma(_300, _300, _306);
    float _314 = 1.0 / _310;
    float _316 = rsqrt(_312);
    float _318 = _296 * _316;
    float _320 = _109 * _288;
    float _322 = _298 * _316;
    float _324 = in.m_47.x;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = _302 * _318;
    float _332 = _300 * _316;
    float _334 = in.m_49.w;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = fma(_320, _322, _330);
    float _342 = _109 * _294;
    float _344 = fma(_129, 2.0, -1.0);
    float _346 = fma(_342, _332, _340);
    float _348 = in.m_51.w;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = abs(_346);
    float _356 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _358 = _354 + _356;
    float _360 = _358 * _314;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = fma(_362, -2.0, 3.0);
    float _366 = _362 * _362;
    float _368 = _364 * _366;
    float _370 = _109 * _352;
    float _372 = _109 * _328;
    float _374 = in.m_51.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_51.z;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_49.y;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_49.z;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = -_248;
    float _400 = _398 + _258;
    float _402 = abs(_344);
    float _404 = fma(_402, _400, _248);
    float _406 = _147 * _404;
    float _408 = _109 * _338;
    float _410 = _408 * _406;
    float _412 = _370 * _410;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = _414 * _368;
    float _418 = _416 * _372;
    bool _422 = _418 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _424 = isnan(_418);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _430 = _426 || _428;
    float _432 = in.m_51.x;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = in.m_49.x;
    float _440 = gl_FragCoord.w;
    float _442 = _438 * _440;
    if (!_430)
    {
        discard_fragment();
    }
    float _444 = _244 * _244;
    float _446 = _242 * _242;
    float _448 = _246 * _246;
    float _450 = _109 * _384;
    float _452 = -_444;
    float _454 = fma(_254, _254, _452);
    float _456 = -_446;
    float _458 = fma(_252, _252, _456);
    float _460 = -_448;
    float _462 = fma(_256, _256, _460);
    float _464 = abs(_344);
    float _466 = fma(_464, _454, _444);
    float _468 = abs(_344);
    float _470 = fma(_468, _458, _446);
    float _472 = abs(_344);
    float _474 = fma(_472, _462, _448);
    float _476 = _109 * _378;
    float _478 = -_466;
    float _480 = _478 + 1.0;
    float _482 = -_470;
    float _484 = _482 + 1.0;
    float _486 = -_474;
    float _488 = _486 + 1.0;
    float _490 = _109 * _436;
    float _492 = _476 * _480;
    float _494 = _109 * _442;
    float _496 = _450 * _488;
    float _498 = _490 * _484;
    float _500 = _109 * _390;
    float _502 = _109 * _396;
    float _504 = fma(_470, _494, _498);
    float _506 = fma(_466, _500, _492);
    float _508 = fma(_474, _502, _496);
    if (!_430)
    {
        out.m_54.x = _504;
        out.m_54.y = _506;
        out.m_54.z = _508;
        out.m_54.w = _414;
        return out;
    }
    float _510 = _506 * 0.715200006961822509765625;
    float _512 = 0.0 + _418;
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = fma(_504, 0.2125999927520751953125, _510);
    bool _518 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _520 = fma(_508, 0.072200000286102294921875, _516);
    float _522 = 1.0 / _520;
    float _524 = _522 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _526 = precise::clamp(_524, 0.0, 1.0);
    float _528 = fma(_526, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _530 = _504 * _528;
    float _532 = _506 * _528;
    float _534 = _508 * _528;
    float _536 = _528;
    if (!_518)
    {
        _536 = _514;
    }
    float _538 = _536;
    bool _540 = !_518;
    float _542 = _538;
    if (!_540)
    {
        float _544 = in.m_56.w;
        float _546 = gl_FragCoord.w;
        float _548 = _544 * _546;
        float _550 = in.m_56.z;
        float _552 = gl_FragCoord.w;
        float _554 = _550 * _552;
        float _556 = _109 * _548;
        float _558 = _109 * _554;
        float _560 = 1.0 / _556;
        float _562 = _558 * _560;
        float _564 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _566 = fma(_562, (*spvDescriptorSet0.fp_c8)._m0[30].w, _564);
        float _568 = 1.0 / _566;
        float _570 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _572 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _574 = fma(_568, _570, _572);
        float _576 = _574 * 8.0;
        float _578 = precise::clamp(_576, 0.0, 1.0);
        float _580 = _514 * _578;
        _542 = _580;
    }
    float _582 = _542;
    float _584 = 0.0 + _582;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    out.m_54.x = _530;
    out.m_54.y = _532;
    out.m_54.z = _534;
    out.m_54.w = _586;
    return out;
}

