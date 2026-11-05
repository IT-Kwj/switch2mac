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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1616 = false;
    bool _1456 = false;
    bool _1304 = false;
    bool _1154 = false;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_36.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_36.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _1661 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1661, float2(0.0), isnan(_1661))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1661, float2(0.0), isnan(_1661))).x;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _70 = fma(_64, 2.0, -1.0);
    float _72 = fma(_62, 2.0, -1.0);
    float _74 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _76 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _78 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _82 = _74 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _84 = _68 * _76;
    bool _86 = _74 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _88 = _68 * _78;
    bool _90 = !_82;
    int _93 = _90 ? 0 : 1;
    float _95 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _97 = _84 * _95;
    float _99 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _101 = _84 * _99;
    float _103 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _105 = _84 * _103;
    bool _107 = _74 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _109 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[3].x, _97);
    int _111 = 2;
    if (!_82)
    {
        _111 = 1;
    }
    int _113 = _111;
    float _115 = -_74;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[3].z, _109);
    int _119 = _113;
    if (!_86)
    {
        _119 = _93;
    }
    int _121 = _119;
    float _123 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[2].x, _101);
    float _125 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[4].x, _105);
    float _127 = _117 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    int _129 = _121 + 1;
    float _131 = -_74;
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[2].z, _123);
    float _135 = -_74;
    float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[4].z, _125);
    float _139 = _127 * 78.233001708984375;
    int _141 = _129;
    if (!_107)
    {
        _141 = _121;
    }
    int _143 = _141;
    float _145 = _133 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _147 = _137 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    bool _149 = _143 != 1;
    float _151 = fma(_147, 12.98980045318603515625, _139);
    float _153 = fma(_145, 12.98980045318603515625, _139);
    bool _155 = _143 != 0;
    float _157 = fma(_145, 45.16400146484375, _151);
    bool _159 = !_149;
    int _161 = _159 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _163 = fma(_147, 45.16400146484375, _153);
    bool _165 = !_149;
    int _167 = _165 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    float _169 = _157 + 94.67299652099609375;
    bool _171 = !_149;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _175 = _163 + 94.67299652099609375;
    float _177 = _155 ? as_type<float>(_167) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _179 = _169 * 0.15915493667125701904296875;
    bool _181 = !_149;
    int _183 = _181 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _185 = _175 * 0.15915493667125701904296875;
    float _187 = _155 ? as_type<float>(_161) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _189 = _127 * _177;
    float _191 = _155 ? as_type<float>(_183) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _193 = _157 + 189.3459930419921875;
    float _195 = _155 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _197 = _179 * 6.283185482025146484375;
    float _199 = sin(_197);
    float _201 = fma(_145, _187, _189);
    float _203 = _127 * _191;
    float _205 = _163 + 189.3459930419921875;
    float _207 = fma(_145, _195, _203);
    float _209 = _205 * 0.15915493667125701904296875;
    float _211 = _193 * 0.15915493667125701904296875;
    float _213 = _185 * 6.283185482025146484375;
    float _215 = sin(_213);
    bool _217 = !_149;
    int _219 = _217 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _221 = !_149;
    int _223 = _221 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _225 = _199 * 43758.546875;
    bool _227 = !_149;
    int _229 = _227 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    float _231 = _211 * 6.283185482025146484375;
    float _233 = sin(_231);
    bool _235 = !_149;
    int _237 = _235 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    float _239 = _157 + 284.01898193359375;
    float _241 = _155 ? as_type<float>(_219) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _243 = _157 + 378.691986083984375;
    float _245 = _155 ? as_type<float>(_229) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _247 = _239 * 0.15915493667125701904296875;
    bool _249 = !_149;
    int _251 = _249 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _253 = _127 * _241;
    float _255 = _155 ? as_type<float>(_237) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _257 = _243 * 0.15915493667125701904296875;
    float _259 = _155 ? as_type<float>(_223) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _261 = fma(_145, _245, _253);
    float _263 = _155 ? as_type<float>(_251) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _265 = fma(_147, _255, _207);
    float _267 = float(_143);
    float _269 = fma(_147, _259, _201);
    float _271 = _263 + _265;
    float _273 = _163 + 284.01898193359375;
    float _275 = rint(_267);
    float _277 = precise::max(_275, 0.0);
    uint _280 = uint(_277);
    uint _282 = clamp(_280, 0u, 65535u);
    bool _284 = !_149;
    int _286 = _284 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _288 = _163 + 378.691986083984375;
    bool _290 = !_149;
    int _292 = _290 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    float _294 = _273 * 0.15915493667125701904296875;
    bool _296 = !_149;
    int _298 = _296 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _300 = _288 * 0.15915493667125701904296875;
    float _302 = _155 ? as_type<float>(_286) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    float _304 = 1.0 / _271;
    float _306 = _155 ? as_type<float>(_292) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _308 = _155 ? as_type<float>(_298) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _310 = fma(_147, _302, _261);
    float _312 = _306 + _269;
    float _314 = _308 + _310;
    float _316 = _209 * 6.283185482025146484375;
    float _318 = sin(_316);
    float _320 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _322 = _320 + 1.0;
    float _324 = _314 * _304;
    float _326 = _312 * _304;
    float _328 = _294 * 6.283185482025146484375;
    float _330 = sin(_328);
    float3 _2165 = float3(_326, _324, float(int(_282)));
    float3 _2169 = select(_2165, float3(0.0), isnan(_2165));
    float _332 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2169.xy, uint(rint(_2169.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2169.xy, uint(rint(_2169.z))).x;
    float _334 = _215 * 43758.546875;
    float _336 = fma(_322, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _338 = _257 * 6.283185482025146484375;
    float _340 = sin(_338);
    float _342 = _233 * 43758.546875;
    float _344 = _318 * 43758.546875;
    bool _346 = !_149;
    int _348 = _346 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _350 = _247 * 6.283185482025146484375;
    float _352 = sin(_350);
    bool _354 = !_149;
    int _356 = _354 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    bool _358 = !_149;
    int _360 = _358 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    bool _362 = !_149;
    int _364 = _362 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _366 = _300 * 6.283185482025146484375;
    float _368 = sin(_366);
    bool _370 = !_149;
    int _372 = _370 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _374 = _155 ? as_type<float>(_348) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    bool _376 = !_149;
    int _378 = _376 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _380 = _155 ? as_type<float>(_356) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _382 = floor(_334);
    float _384 = _155 ? as_type<float>(_360) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _386 = _352 * 43758.546875;
    float _388 = _155 ? as_type<float>(_364) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _390 = _127 * _374;
    bool _392 = !_149;
    int _394 = _392 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _396 = _127 * _380;
    float _398 = _155 ? as_type<float>(_372) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _400 = _127 * _384;
    float _402 = _155 ? as_type<float>(_378) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _404 = _127 * _388;
    float _406 = _155 ? as_type<float>(_394) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _408 = fma(_145, _398, _390);
    float _410 = floor(_342);
    float _412 = fma(_145, _402, _396);
    float _414 = _330 * 43758.546875;
    float _416 = fma(_145, _406, _400);
    float _418 = _340 * 43758.546875;
    float _420 = floor(_225);
    bool _422 = !_149;
    int _424 = _422 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    bool _426 = !_149;
    int _428 = _426 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    bool _430 = !_149;
    int _432 = _430 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    bool _434 = !_149;
    int _436 = _434 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _438 = floor(_344);
    float _440 = _155 ? as_type<float>(_424) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _442 = -_410;
    float _444 = _342 + _442;
    float _446 = _155 ? as_type<float>(_432) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _448 = _155 ? as_type<float>(_428) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _450 = fma(_145, _440, _404);
    float _452 = _155 ? as_type<float>(_436) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _454 = floor(_414);
    float _456 = _368 * 43758.546875;
    float _458 = -_382;
    float _460 = _334 + _458;
    float _462 = fma(_147, _448, _412);
    float _464 = -_420;
    float _466 = _225 + _464;
    float _468 = _336 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _470 = fma(_460, 2.0, -1.0);
    float _472 = fma(_444, 2.0, -1.0);
    float _474 = floor(_386);
    float _476 = -_438;
    float _478 = _344 + _476;
    float _480 = _468 * _470;
    float _482 = fma(_147, _452, _408);
    float _484 = fma(_478, 2.0, -1.0);
    float _486 = fma(_147, _446, _416);
    bool _488 = !_149;
    int _490 = _488 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _492 = floor(_456);
    float _494 = -_454;
    float _496 = _414 + _494;
    float _498 = fma(_466, 2.0, -1.0);
    float _500 = _480 * _480;
    float _502 = _468 * _484;
    float _504 = fma(_496, 2.0, -1.0);
    float _506 = _468 * _498;
    float _508 = floor(_418);
    float _510 = -_474;
    float _512 = _386 + _510;
    float _514 = fma(_506, _506, _500);
    float _516 = _468 * _472;
    float _518 = _502 * _502;
    float _520 = fma(_512, 2.0, -1.0);
    float _522 = _468 * _504;
    float _524 = _514 + 1.0;
    float _526 = -_492;
    float _528 = _456 + _526;
    float _530 = fma(_516, _516, _518);
    float _532 = _468 * _520;
    float _534 = _522 * _522;
    float _536 = fma(_528, 2.0, -1.0);
    float _538 = _530 + 1.0;
    float _540 = rsqrt(_524);
    float _542 = fma(_532, _532, _534);
    float _544 = -_508;
    float _546 = _418 + _544;
    float _548 = _468 * _536;
    float _550 = fma(_546, 2.0, -1.0);
    float _552 = rsqrt(_538);
    float _554 = _468 * _550;
    float _556 = _548 * _548;
    float _558 = _542 + 1.0;
    float _560 = fma(_554, _554, _556);
    bool _562 = !_149;
    int _564 = _562 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _566 = rsqrt(_558);
    float _568 = _560 + 1.0;
    bool _570 = !_149;
    int _572 = _570 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _574 = !_149;
    int _576 = _574 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _578 = _155 ? as_type<float>(_572) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _580 = rsqrt(_568);
    float _582 = _155 ? as_type<float>(_576) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    bool _584 = !_149;
    int _586 = _584 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _588 = _578 + _462;
    float _590 = _155 ? as_type<float>(_490) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _592 = _582 + _482;
    float _594 = _155 ? as_type<float>(_564) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _596 = fma(_516, _552, _588);
    float _598 = fma(_532, _566, _588);
    float _600 = _590 + _486;
    float _602 = fma(_522, _566, _592);
    float _604 = fma(_147, _594, _450);
    float _606 = _600 * _304;
    float _608 = fma(_554, _580, _588);
    float _610 = fma(_480, _540, _592);
    float _612 = fma(_506, _540, _588);
    float _614 = fma(_502, _552, _592);
    bool _616 = !_149;
    int _618 = _616 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    float _620 = fma(_548, _580, _592);
    bool _622 = !_149;
    int _624 = _622 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    bool _626 = !_149;
    int _628 = _626 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    bool _630 = !_149;
    int _632 = _630 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _634 = _155 ? as_type<float>(_586) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _636 = _155 ? as_type<float>(_618) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _638 = _155 ? as_type<float>(_624) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _640 = _634 + _604;
    float _642 = _155 ? as_type<float>(_628) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _644 = _636 * _614;
    float _646 = _155 ? as_type<float>(_632) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _648 = _638 * _614;
    float _650 = -_552;
    float _652 = _640 + _650;
    float _654 = _642 * _614;
    float _656 = _638 * _610;
    float _658 = _646 * _614;
    float _660 = _638 * _602;
    float _662 = _638 * _620;
    float _664 = _636 * _602;
    float _666 = _642 * _602;
    float _668 = _646 * _602;
    float _670 = _636 * _620;
    float _672 = _642 * _620;
    float _674 = _646 * _610;
    float _676 = _646 * _620;
    float _678 = _636 * _610;
    float _680 = _642 * _610;
    float _682 = -_540;
    float _684 = _640 + _682;
    float _686 = -_566;
    float _688 = _640 + _686;
    float _690 = -_580;
    float _692 = _640 + _690;
    bool _694 = !_149;
    int _696 = _694 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    bool _698 = !_149;
    int _700 = _698 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    bool _702 = !_149;
    int _704 = _702 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    bool _706 = !_149;
    int _708 = _706 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _710 = _155 ? as_type<float>(_696) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _712 = _155 ? as_type<float>(_700) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _714 = _155 ? as_type<float>(_704) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _716 = fma(_710, _612, _678);
    float _718 = _155 ? as_type<float>(_708) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _720 = fma(_712, _612, _656);
    float _722 = fma(_712, _596, _648);
    float _724 = fma(_714, _612, _680);
    float _726 = fma(_714, _596, _654);
    float _728 = fma(_718, _612, _674);
    float _730 = fma(_710, _596, _644);
    float _732 = fma(_718, _596, _658);
    float _734 = fma(_710, _598, _664);
    float _736 = fma(_710, _608, _670);
    float _738 = fma(_712, _608, _662);
    float _740 = fma(_714, _608, _672);
    float _742 = fma(_712, _598, _660);
    float _744 = fma(_714, _598, _666);
    float _746 = fma(_718, _598, _668);
    float _748 = fma(_718, _608, _676);
    bool _750 = !_149;
    int _752 = _750 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    bool _754 = !_149;
    int _756 = _754 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    bool _758 = !_149;
    int _760 = _758 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    bool _762 = !_149;
    int _764 = _762 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _766 = _155 ? as_type<float>(_752) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _768 = _155 ? as_type<float>(_756) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _770 = _155 ? as_type<float>(_760) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _772 = fma(_766, _684, _716);
    float _774 = _155 ? as_type<float>(_764) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _776 = fma(_768, _684, _720);
    bool _778 = !_149;
    int _780 = _778 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _782 = fma(_770, _684, _724);
    float _784 = fma(_766, _652, _730);
    float _786 = fma(_774, _684, _728);
    float _788 = _155 ? as_type<float>(_780) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _790 = fma(_768, _652, _722);
    float _792 = fma(_770, _652, _726);
    float _794 = fma(_774, _652, _732);
    float _796 = fma(_770, _688, _744);
    float _798 = _788 + _786;
    float _800 = fma(_774, _688, _746);
    float _802 = fma(_770, _692, _740);
    float _804 = fma(_766, _692, _736);
    float _806 = fma(_768, _692, _738);
    float _808 = _788 + _794;
    float _810 = fma(_774, _692, _748);
    float _812 = fma(_766, _688, _734);
    float _814 = _788 + _800;
    float _816 = fma(_768, _688, _742);
    float _818 = 1.0 / _808;
    float _820 = _788 + _810;
    bool _822 = !_149;
    int _824 = _822 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    bool _826 = !_149;
    int _828 = _826 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    bool _830 = !_149;
    int _832 = _830 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    float _834 = 1.0 / _814;
    float _836 = _155 ? as_type<float>(_824) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _838 = _155 ? as_type<float>(_828) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _840 = _155 ? as_type<float>(_832) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _842 = _836 + _792;
    float _844 = _836 + _782;
    float _846 = 1.0 / _798;
    float _848 = _838 + _772;
    float _850 = _838 + _784;
    float _852 = _838 + _812;
    float _854 = _838 + _804;
    float _856 = _840 + _790;
    float _858 = _840 + _816;
    float _860 = _840 + _776;
    float _862 = 1.0 / _820;
    float _864 = _850 * _818;
    float _866 = _856 * _818;
    float _868 = _842 * _818;
    float _870 = _858 * _834;
    float _872 = _840 + _806;
    float _874 = _836 + _802;
    float _876 = _848 * _846;
    float _878 = _860 * _846;
    float _880 = _836 + _796;
    float _882 = _844 * _846;
    float _884 = fma(_870, -0.5, 0.5);
    float _886 = _852 * _834;
    float _888 = _880 * _834;
    float _890 = fma(_882, 0.5, 0.5);
    float _892 = _854 * _862;
    float _894 = _872 * _862;
    float _896 = _874 * _862;
    float _898 = fma(_876, 0.5, 0.5);
    float _900 = fma(_878, -0.5, 0.5);
    float _902 = fma(_894, -0.5, 0.5);
    float _904 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.20000000298023223876953125;
    float _906 = -_898;
    float _908 = _326 + _906;
    float _910 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.20000000298023223876953125;
    float _912 = -_884;
    float _914 = _324 + _912;
    float _916 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.20000000298023223876953125;
    float _918 = -_902;
    float _920 = _324 + _918;
    float _922 = fma(_864, 0.5, 0.5);
    float _924 = fma(_866, -0.5, 0.5);
    float _926 = fma(_868, 0.5, 0.5);
    float _928 = fma(_886, 0.5, 0.5);
    float _930 = fma(_888, 0.5, 0.5);
    float _932 = fma(_892, 0.5, 0.5);
    float _934 = fma(_896, 0.5, 0.5);
    float _936 = -_890;
    float _938 = _606 + _936;
    float _940 = _908 * _904;
    float _942 = _914 * _910;
    float _944 = _920 * _916;
    float _946 = _938 * _904;
    float _948 = -_606;
    float _950 = _948 + _332;
    float _952 = -_900;
    float _954 = _324 + _952;
    float _956 = _946 * 1.5;
    float _958 = _950 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _960 = _954 * _904;
    float _962 = -_922;
    float _964 = _326 + _962;
    float _966 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.20000000298023223876953125;
    float _968 = -_924;
    float _970 = _324 + _968;
    float _972 = precise::max(_958, _956);
    float _974 = -_926;
    float _976 = _606 + _974;
    float _978 = _964 * _966;
    float _980 = _970 * _966;
    float _982 = precise::min(0.0, _972);
    float _984 = _976 * _966;
    float _986 = -_930;
    float _988 = _606 + _986;
    float _990 = -_928;
    float _992 = _326 + _990;
    bool _994 = _982 != _958;
    bool _996 = isnan(_982);
    bool _998 = _994 || _996;
    bool _1000 = isnan(_958);
    bool _1002 = _998 || _1000;
    float _1004 = -_932;
    float _1006 = _326 + _1004;
    float _1008 = -_934;
    float _1010 = _606 + _1008;
    float _1012 = _992 * _910;
    float _1014 = _988 * _910;
    float _1016 = _1006 * _916;
    float _1018 = _1010 * _916;
    bool _1020 = !_1002;
    float _1152;
    if (!_1020)
    {
        float _1022 = _326 + _940;
        float _1024 = fma(_940, 2.0, _326);
        float _1026 = fma(_940, 3.0, _326);
        float _1028 = fma(_940, 4.0, _326);
        float _1030 = _324 + _960;
        float _1032 = fma(_960, 2.0, _324);
        float _1034 = fma(_960, 3.0, _324);
        float _1036 = fma(_960, 4.0, _324);
        float3 _3459 = float3(_1022, _1030, float(int(_282)));
        float3 _3461 = select(_3459, float3(0.0), isnan(_3459));
        float _1038 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3461.xy, uint(rint(_3461.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3461.xy, uint(rint(_3461.z))).x;
        float3 _3470 = float3(_1024, _1032, float(int(_282)));
        float3 _3472 = select(_3470, float3(0.0), isnan(_3470));
        float _1040 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3472.xy, uint(rint(_3472.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3472.xy, uint(rint(_3472.z))).x;
        float3 _3481 = float3(_1026, _1034, float(int(_282)));
        float3 _3483 = select(_3481, float3(0.0), isnan(_3481));
        float _1042 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3483.xy, uint(rint(_3483.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3483.xy, uint(rint(_3483.z))).x;
        float3 _3492 = float3(_1028, _1036, float(int(_282)));
        float3 _3494 = select(_3492, float3(0.0), isnan(_3492));
        float _1044 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3494.xy, uint(rint(_3494.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3494.xy, uint(rint(_3494.z))).x;
        float _1046 = _606 + _946;
        float _1048 = _946 * 3.0;
        float _1050 = -_1046;
        float _1052 = _1050 + _1038;
        float _1054 = _1052 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1056 = precise::max(_1054, _1048);
        float _1058 = precise::min(0.0, _1056);
        bool _1060 = _1058 != _1054;
        bool _1062 = isnan(_1058);
        bool _1064 = _1060 || _1062;
        bool _1066 = isnan(_1054);
        bool _1068 = _1064 || _1066;
        bool _1070 = !_1068;
        if (!_1070)
        {
            float _1072 = fma(_946, 2.0, _606);
            float _1074 = _946 * 4.5;
            float _1076 = -_1072;
            float _1078 = _1076 + _1040;
            float _1080 = _1078 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1082 = precise::max(_1080, _1074);
            float _1084 = precise::min(0.0, _1082);
            bool _1086 = _1084 != _1080;
            bool _1088 = isnan(_1084);
            bool _1090 = _1086 || _1088;
            bool _1092 = isnan(_1080);
            bool _1094 = _1090 || _1092;
            bool _1096 = !_1094;
            if (!_1096)
            {
                float _1098 = _606 + _1048;
                float _1100 = -_1098;
                float _1102 = _1100 + _1042;
                float _1104 = fma(_946, 6.0, -1.0);
                float _1106 = _1102 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1108 = precise::max(_1106, _1104);
                float _1110 = precise::min(0.0, _1108);
                bool _1112 = _1110 != _1106;
                bool _1114 = isnan(_1110);
                bool _1116 = _1112 || _1114;
                bool _1118 = isnan(_1106);
                bool _1120 = _1116 || _1118;
                bool _1122 = !_1120;
                float _1124 = _1106;
                if (!_1122)
                {
                    float _1126 = fma(_946, 4.0, _606);
                    float _1128 = -_1126;
                    float _1130 = _1128 + _1044;
                    float _1132 = fma(_946, 7.5, -1.0);
                    float _1134 = _1130 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1136 = precise::max(_1134, _1132);
                    float _1138 = precise::min(0.0, _1136);
                    bool _1140 = _1138 != _1134;
                    bool _1142 = isnan(_1138);
                    bool _1144 = _1140 || _1142;
                    bool _1146 = isnan(_1134);
                    bool _1148 = _1144 || _1146;
                    if (_1148)
                    {
                        _1124 = 0.0;
                    }
                    float _1150 = _1124;
                    _1152 = _1150;
                    _1154 = _1148;
                }
            }
        }
    }
    if (!_1154)
    {
        _1152 = 1.0;
    }
    _1154 = false;
    float _1156 = _1152;
    float _1158 = _984 * 1.5;
    float _1160 = precise::max(_958, _1158);
    float _1162 = precise::min(0.0, _1160);
    bool _1164 = _1162 != _958;
    bool _1166 = isnan(_1162);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan(_958);
    bool _1172 = _1168 || _1170;
    bool _1174 = !_1172;
    float _1176 = _1156;
    if (!_1174)
    {
        float _1178 = _324 + _980;
        float _1180 = _326 + _978;
        float _1182 = fma(_980, 2.0, _324);
        float _1184 = fma(_980, 3.0, _324);
        float _1186 = fma(_980, 4.0, _324);
        float3 _3706 = float3(_1180, _1178, float(int(_282)));
        float3 _3708 = select(_3706, float3(0.0), isnan(_3706));
        float _1188 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3708.xy, uint(rint(_3708.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3708.xy, uint(rint(_3708.z))).x;
        float _1190 = fma(_978, 2.0, _326);
        float _1192 = fma(_978, 3.0, _326);
        float _1194 = fma(_978, 4.0, _326);
        float3 _3726 = float3(_1190, _1182, float(int(_282)));
        float3 _3728 = select(_3726, float3(0.0), isnan(_3726));
        float _1196 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3728.xy, uint(rint(_3728.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3728.xy, uint(rint(_3728.z))).x;
        float3 _3737 = float3(_1192, _1184, float(int(_282)));
        float3 _3739 = select(_3737, float3(0.0), isnan(_3737));
        float _1198 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3739.xy, uint(rint(_3739.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3739.xy, uint(rint(_3739.z))).x;
        float3 _3748 = float3(_1194, _1186, float(int(_282)));
        float3 _3750 = select(_3748, float3(0.0), isnan(_3748));
        float _1200 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3750.xy, uint(rint(_3750.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3750.xy, uint(rint(_3750.z))).x;
        float _1202 = _606 + _984;
        float _1204 = _984 * 3.0;
        float _1206 = -_1202;
        float _1208 = _1206 + _1188;
        float _1210 = _1208 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1212 = precise::max(_1210, _1204);
        float _1214 = precise::min(0.0, _1212);
        bool _1216 = _1214 != _1210;
        bool _1218 = isnan(_1214);
        bool _1220 = _1216 || _1218;
        bool _1222 = isnan(_1210);
        bool _1224 = _1220 || _1222;
        bool _1226 = !_1224;
        if (!_1226)
        {
            float _1228 = fma(_984, 2.0, _606);
            float _1230 = _984 * 4.5;
            float _1232 = -_1228;
            float _1234 = _1232 + _1196;
            float _1236 = _1234 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1238 = precise::max(_1236, _1230);
            float _1240 = precise::min(0.0, _1238);
            bool _1242 = _1240 != _1236;
            bool _1244 = isnan(_1240);
            bool _1246 = _1242 || _1244;
            bool _1248 = isnan(_1236);
            bool _1250 = _1246 || _1248;
            bool _1252 = !_1250;
            if (!_1252)
            {
                float _1254 = _606 + _1204;
                float _1256 = -_1254;
                float _1258 = _1256 + _1198;
                float _1260 = fma(_984, 6.0, -1.0);
                float _1262 = _1258 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1264 = precise::max(_1262, _1260);
                float _1266 = precise::min(0.0, _1264);
                bool _1268 = _1266 != _1262;
                bool _1270 = isnan(_1266);
                bool _1272 = _1268 || _1270;
                bool _1274 = isnan(_1262);
                bool _1276 = _1272 || _1274;
                bool _1278 = !_1276;
                if (!_1278)
                {
                    float _1280 = fma(_984, 4.0, _606);
                    float _1282 = -_1280;
                    float _1284 = _1282 + _1200;
                    float _1286 = fma(_984, 7.5, -1.0);
                    float _1288 = _1284 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1290 = precise::max(_1288, _1286);
                    float _1292 = precise::min(0.0, _1290);
                    bool _1294 = _1292 != _1288;
                    bool _1296 = isnan(_1292);
                    bool _1298 = _1294 || _1296;
                    bool _1300 = isnan(_1288);
                    bool _1302 = _1298 || _1300;
                    _1304 = _1302;
                }
            }
        }
    }
    if (!_1304)
    {
        float _1306 = _1156 + 1.0;
        _1176 = _1306;
    }
    _1304 = false;
    float _1308 = _1176;
    float _1310 = _1014 * 1.5;
    float _1312 = precise::max(_958, _1310);
    float _1314 = precise::min(0.0, _1312);
    bool _1316 = _1314 != _958;
    bool _1318 = isnan(_1314);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan(_958);
    bool _1324 = _1320 || _1322;
    bool _1326 = !_1324;
    float _1328 = _1308;
    if (!_1326)
    {
        float _1330 = _324 + _942;
        float _1332 = _326 + _1012;
        float _1334 = fma(_942, 2.0, _324);
        float _1336 = fma(_942, 3.0, _324);
        float _1338 = fma(_942, 4.0, _324);
        float3 _3956 = float3(_1332, _1330, float(int(_282)));
        float3 _3958 = select(_3956, float3(0.0), isnan(_3956));
        float _1340 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3958.xy, uint(rint(_3958.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3958.xy, uint(rint(_3958.z))).x;
        float _1342 = fma(_1012, 2.0, _326);
        float _1344 = fma(_1012, 3.0, _326);
        float _1346 = fma(_1012, 4.0, _326);
        float3 _3976 = float3(_1342, _1334, float(int(_282)));
        float3 _3978 = select(_3976, float3(0.0), isnan(_3976));
        float _1348 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3978.xy, uint(rint(_3978.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3978.xy, uint(rint(_3978.z))).x;
        float3 _3987 = float3(_1344, _1336, float(int(_282)));
        float3 _3989 = select(_3987, float3(0.0), isnan(_3987));
        float _1350 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3989.xy, uint(rint(_3989.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3989.xy, uint(rint(_3989.z))).x;
        float3 _3998 = float3(_1346, _1338, float(int(_282)));
        float3 _4000 = select(_3998, float3(0.0), isnan(_3998));
        float _1352 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4000.xy, uint(rint(_4000.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4000.xy, uint(rint(_4000.z))).x;
        float _1354 = _606 + _1014;
        float _1356 = _1014 * 3.0;
        float _1358 = -_1354;
        float _1360 = _1358 + _1340;
        float _1362 = _1360 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1364 = precise::max(_1362, _1356);
        float _1366 = precise::min(0.0, _1364);
        bool _1368 = _1366 != _1362;
        bool _1370 = isnan(_1366);
        bool _1372 = _1368 || _1370;
        bool _1374 = isnan(_1362);
        bool _1376 = _1372 || _1374;
        bool _1378 = !_1376;
        if (!_1378)
        {
            float _1380 = fma(_1014, 2.0, _606);
            float _1382 = _1014 * 4.5;
            float _1384 = -_1380;
            float _1386 = _1384 + _1348;
            float _1388 = _1386 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1390 = precise::max(_1388, _1382);
            float _1392 = precise::min(0.0, _1390);
            bool _1394 = _1392 != _1388;
            bool _1396 = isnan(_1392);
            bool _1398 = _1394 || _1396;
            bool _1400 = isnan(_1388);
            bool _1402 = _1398 || _1400;
            bool _1404 = !_1402;
            if (!_1404)
            {
                float _1406 = _606 + _1356;
                float _1408 = -_1406;
                float _1410 = _1408 + _1350;
                float _1412 = fma(_1014, 6.0, -1.0);
                float _1414 = _1410 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1416 = precise::max(_1414, _1412);
                float _1418 = precise::min(0.0, _1416);
                bool _1420 = _1418 != _1414;
                bool _1422 = isnan(_1418);
                bool _1424 = _1420 || _1422;
                bool _1426 = isnan(_1414);
                bool _1428 = _1424 || _1426;
                bool _1430 = !_1428;
                if (!_1430)
                {
                    float _1432 = fma(_1014, 4.0, _606);
                    float _1434 = -_1432;
                    float _1436 = _1434 + _1352;
                    float _1438 = fma(_1014, 7.5, -1.0);
                    float _1440 = _1436 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1442 = precise::max(_1440, _1438);
                    float _1444 = precise::min(0.0, _1442);
                    bool _1446 = _1444 != _1440;
                    bool _1448 = isnan(_1444);
                    bool _1450 = _1446 || _1448;
                    bool _1452 = isnan(_1440);
                    bool _1454 = _1450 || _1452;
                    _1456 = _1454;
                }
            }
        }
    }
    if (!_1456)
    {
        float _1458 = _1308 + 1.0;
        _1328 = _1458;
    }
    _1456 = false;
    float _1460 = _1328;
    float _1462 = _1018 * 1.5;
    float _1464 = precise::max(_958, _1462);
    float _1466 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1468 = 1.0 + _1466;
    float _1470 = precise::min(0.0, _1464);
    bool _1472 = _1470 != _958;
    bool _1474 = isnan(_1470);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan(_958);
    bool _1480 = _1476 || _1478;
    float _1482 = fma(_1468, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _1484 = _1482 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _1486 = !_1480;
    float _1488 = _1460;
    if (!_1486)
    {
        float _1490 = _324 + _944;
        float _1492 = _326 + _1016;
        float _1494 = fma(_944, 2.0, _324);
        float _1496 = fma(_1016, 2.0, _326);
        float _1498 = fma(_944, 3.0, _324);
        float _1500 = fma(_1016, 3.0, _326);
        float3 _4224 = float3(_1492, _1490, float(int(_282)));
        float3 _4226 = select(_4224, float3(0.0), isnan(_4224));
        float _1502 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4226.xy, uint(rint(_4226.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4226.xy, uint(rint(_4226.z))).x;
        float3 _4235 = float3(_1496, _1494, float(int(_282)));
        float3 _4237 = select(_4235, float3(0.0), isnan(_4235));
        float _1504 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4237.xy, uint(rint(_4237.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4237.xy, uint(rint(_4237.z))).x;
        float _1506 = fma(_944, 4.0, _324);
        float _1508 = fma(_1016, 4.0, _326);
        float3 _4252 = float3(_1500, _1498, float(int(_282)));
        float3 _4254 = select(_4252, float3(0.0), isnan(_4252));
        float _1510 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4254.xy, uint(rint(_4254.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4254.xy, uint(rint(_4254.z))).x;
        float3 _4263 = float3(_1508, _1506, float(int(_282)));
        float3 _4265 = select(_4263, float3(0.0), isnan(_4263));
        float _1512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4265.xy, uint(rint(_4265.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4265.xy, uint(rint(_4265.z))).x;
        float _1514 = _606 + _1018;
        float _1516 = _1018 * 3.0;
        float _1518 = -_1514;
        float _1520 = _1518 + _1502;
        float _1522 = _1520 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1524 = precise::max(_1522, _1516);
        float _1526 = precise::min(0.0, _1524);
        bool _1528 = _1526 != _1522;
        bool _1530 = isnan(_1526);
        bool _1532 = _1528 || _1530;
        bool _1534 = isnan(_1522);
        bool _1536 = _1532 || _1534;
        bool _1538 = !_1536;
        if (!_1538)
        {
            float _1540 = fma(_1018, 2.0, _606);
            float _1542 = _1018 * 4.5;
            float _1544 = -_1540;
            float _1546 = _1544 + _1504;
            float _1548 = _1546 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1550 = precise::max(_1548, _1542);
            float _1552 = precise::min(0.0, _1550);
            bool _1554 = _1552 != _1548;
            bool _1556 = isnan(_1552);
            bool _1558 = _1554 || _1556;
            bool _1560 = isnan(_1548);
            bool _1562 = _1558 || _1560;
            bool _1564 = !_1562;
            if (!_1564)
            {
                float _1566 = _606 + _1516;
                float _1568 = -_1566;
                float _1570 = _1568 + _1510;
                float _1572 = fma(_1018, 6.0, -1.0);
                float _1574 = _1570 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1576 = precise::max(_1574, _1572);
                float _1578 = precise::min(0.0, _1576);
                bool _1580 = _1578 != _1574;
                bool _1582 = isnan(_1578);
                bool _1584 = _1580 || _1582;
                bool _1586 = isnan(_1574);
                bool _1588 = _1584 || _1586;
                bool _1590 = !_1588;
                if (!_1590)
                {
                    float _1592 = fma(_1018, 4.0, _606);
                    float _1594 = -_1592;
                    float _1596 = _1594 + _1512;
                    float _1598 = fma(_1018, 7.5, -1.0);
                    float _1600 = _1596 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1602 = precise::max(_1600, _1598);
                    float _1604 = precise::min(0.0, _1602);
                    bool _1606 = _1604 != _1600;
                    bool _1608 = isnan(_1604);
                    bool _1610 = _1606 || _1608;
                    bool _1612 = isnan(_1600);
                    bool _1614 = _1610 || _1612;
                    _1616 = _1614;
                }
            }
        }
    }
    if (!_1616)
    {
        float _1618 = _1460 + 1.0;
        _1488 = _1618;
    }
    _1616 = false;
    float _1620 = _1488;
    float _1622 = _1620 * 0.25;
    float _1624 = -_1622;
    float _1626 = fma(_1624, _1484, 1.0);
    out.m_39.x = _1626;
    return out;
}

