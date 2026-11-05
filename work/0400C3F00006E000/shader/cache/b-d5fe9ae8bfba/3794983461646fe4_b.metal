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
    bool _1872 = false;
    bool _1648 = false;
    bool _1432 = false;
    bool _1218 = false;
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
    float2 _1917 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1917, float2(0.0), isnan(_1917))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1917, float2(0.0), isnan(_1917))).x;
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
    float3 _2421 = float3(_326, _324, float(int(_282)));
    float3 _2425 = select(_2421, float3(0.0), isnan(_2421));
    float _332 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2425.xy, uint(rint(_2425.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2425.xy, uint(rint(_2425.z))).x;
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
    float _796 = fma(_766, _692, _736);
    float _798 = _788 + _786;
    float _800 = fma(_774, _688, _746);
    float _802 = fma(_768, _692, _738);
    float _804 = fma(_770, _692, _740);
    float _806 = fma(_774, _692, _748);
    float _808 = _788 + _800;
    float _810 = fma(_766, _688, _734);
    float _812 = fma(_768, _688, _742);
    float _814 = fma(_770, _688, _744);
    float _816 = _788 + _794;
    float _818 = 1.0 / _798;
    float _820 = _788 + _806;
    bool _822 = !_149;
    int _824 = _822 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    bool _826 = !_149;
    int _828 = _826 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    bool _830 = !_149;
    int _832 = _830 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    float _834 = 1.0 / _808;
    float _836 = _155 ? as_type<float>(_824) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _838 = _155 ? as_type<float>(_832) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _840 = _155 ? as_type<float>(_828) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _842 = _836 + _772;
    float _844 = _836 + _784;
    float _846 = 1.0 / _816;
    float _848 = _836 + _810;
    float _850 = _836 + _796;
    float _852 = _838 + _776;
    float _854 = _838 + _790;
    float _856 = _838 + _812;
    float _858 = _838 + _802;
    float _860 = _840 + _814;
    float _862 = 1.0 / _820;
    float _864 = _840 + _782;
    float _866 = _842 * _818;
    float _868 = _840 + _792;
    float _870 = _840 + _804;
    float _872 = _848 * _834;
    float _874 = _856 * _834;
    float _876 = _860 * _834;
    float _878 = _852 * _818;
    float _880 = _864 * _818;
    float _882 = fma(_866, 0.5, 0.5);
    float _884 = _844 * _846;
    float _886 = fma(_880, 0.5, 0.5);
    float _888 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _890 = -_882;
    float _892 = _326 + _890;
    float _894 = _850 * _862;
    float _896 = fma(_884, 0.5, 0.5);
    float _898 = _870 * _862;
    float _900 = fma(_872, 0.5, 0.5);
    float _902 = _858 * _862;
    float _904 = fma(_874, -0.5, 0.5);
    float _906 = fma(_876, 0.5, 0.5);
    float _908 = -_886;
    float _910 = _606 + _908;
    float _912 = _892 * _888;
    float _914 = fma(_894, 0.5, 0.5);
    float _916 = -_896;
    float _918 = _326 + _916;
    float _920 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _922 = -_900;
    float _924 = _326 + _922;
    float _926 = -_904;
    float _928 = _324 + _926;
    float _930 = -_906;
    float _932 = _606 + _930;
    float _934 = _910 * _888;
    float _936 = -_606;
    float _938 = _936 + _332;
    float _940 = -_914;
    float _942 = _326 + _940;
    float _944 = _924 * _920;
    float _946 = _928 * _920;
    float _948 = _932 * _920;
    float _950 = _934 * 1.5;
    float _952 = _938 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _954 = _854 * _846;
    float _956 = _868 * _846;
    float _958 = fma(_878, -0.5, 0.5);
    float _960 = fma(_954, -0.5, 0.5);
    float _962 = precise::max(_952, _950);
    float _964 = -_958;
    float _966 = _324 + _964;
    float _968 = fma(_956, 0.5, 0.5);
    float _970 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _972 = precise::min(0.0, _962);
    float _974 = _966 * _888;
    float _976 = -_960;
    float _978 = _324 + _976;
    float _980 = -_968;
    float _982 = _606 + _980;
    bool _984 = _972 != _952;
    bool _986 = isnan(_972);
    bool _988 = _984 || _986;
    bool _990 = isnan(_952);
    bool _992 = _988 || _990;
    float _994 = fma(_902, -0.5, 0.5);
    float _996 = fma(_898, 0.5, 0.5);
    float _998 = _918 * _970;
    float _1000 = _978 * _970;
    float _1002 = _982 * _970;
    float _1004 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _1006 = -_994;
    float _1008 = _324 + _1006;
    float _1010 = -_996;
    float _1012 = _606 + _1010;
    float _1014 = _942 * _1004;
    float _1016 = _1008 * _1004;
    float _1018 = _1012 * _1004;
    bool _1020 = !_992;
    float _1216;
    if (!_1020)
    {
        float _1022 = _324 + _974;
        float _1024 = _326 + _912;
        float3 _3695 = float3(_1024, _1022, float(int(_282)));
        float3 _3697 = select(_3695, float3(0.0), isnan(_3695));
        float _1026 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3697.xy, uint(rint(_3697.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3697.xy, uint(rint(_3697.z))).x;
        float _1028 = _606 + _934;
        float _1030 = _934 * 3.0;
        float _1032 = -_1028;
        float _1034 = _1032 + _1026;
        float _1036 = _1034 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1038 = precise::max(_1036, _1030);
        float _1040 = precise::min(0.0, _1038);
        bool _1042 = _1040 != _1036;
        bool _1044 = isnan(_1040);
        bool _1046 = _1042 || _1044;
        bool _1048 = isnan(_1036);
        bool _1050 = _1046 || _1048;
        bool _1052 = !_1050;
        if (!_1052)
        {
            float _1054 = fma(_974, 2.0, _324);
            float _1056 = fma(_912, 2.0, _326);
            float3 _3750 = float3(_1056, _1054, float(int(_282)));
            float3 _3752 = select(_3750, float3(0.0), isnan(_3750));
            float _1058 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3752.xy, uint(rint(_3752.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3752.xy, uint(rint(_3752.z))).x;
            float _1060 = fma(_934, 2.0, _606);
            float _1062 = -_1060;
            float _1064 = _1062 + _1058;
            float _1066 = _934 * 4.5;
            float _1068 = _1064 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1070 = precise::max(_1068, _1066);
            float _1072 = precise::min(0.0, _1070);
            bool _1074 = _1072 != _1068;
            bool _1076 = isnan(_1072);
            bool _1078 = _1074 || _1076;
            bool _1080 = isnan(_1068);
            bool _1082 = _1078 || _1080;
            bool _1084 = !_1082;
            if (!_1084)
            {
                float _1086 = fma(_974, 3.0, _324);
                float _1088 = fma(_912, 3.0, _326);
                float3 _3805 = float3(_1088, _1086, float(int(_282)));
                float3 _3807 = select(_3805, float3(0.0), isnan(_3805));
                float _1090 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3807.xy, uint(rint(_3807.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3807.xy, uint(rint(_3807.z))).x;
                float _1092 = _606 + _1030;
                float _1094 = -_1092;
                float _1096 = _1094 + _1090;
                float _1098 = _934 * 6.0;
                float _1100 = _1096 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1102 = precise::max(_1100, _1098);
                float _1104 = precise::min(0.0, _1102);
                bool _1106 = _1104 != _1100;
                bool _1108 = isnan(_1104);
                bool _1110 = _1106 || _1108;
                bool _1112 = isnan(_1100);
                bool _1114 = _1110 || _1112;
                bool _1116 = !_1114;
                if (!_1116)
                {
                    float _1118 = fma(_974, 4.0, _324);
                    float _1120 = fma(_912, 4.0, _326);
                    float3 _3861 = float3(_1120, _1118, float(int(_282)));
                    float3 _3863 = select(_3861, float3(0.0), isnan(_3861));
                    float _1122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3863.xy, uint(rint(_3863.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3863.xy, uint(rint(_3863.z))).x;
                    float _1124 = fma(_934, 4.0, _606);
                    float _1126 = -_1124;
                    float _1128 = _1126 + _1122;
                    float _1130 = _934 * 7.5;
                    float _1132 = _1128 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1134 = precise::max(_1132, _1130);
                    float _1136 = precise::min(0.0, _1134);
                    bool _1138 = _1136 != _1132;
                    bool _1140 = isnan(_1136);
                    bool _1142 = _1138 || _1140;
                    bool _1144 = isnan(_1132);
                    bool _1146 = _1142 || _1144;
                    bool _1148 = !_1146;
                    if (!_1148)
                    {
                        float _1150 = fma(_974, 5.0, _324);
                        float _1152 = fma(_912, 5.0, _326);
                        float3 _3917 = float3(_1152, _1150, float(int(_282)));
                        float3 _3919 = select(_3917, float3(0.0), isnan(_3917));
                        float _1154 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3919.xy, uint(rint(_3919.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3919.xy, uint(rint(_3919.z))).x;
                        float _1156 = fma(_934, 5.0, _606);
                        float _1158 = -_1156;
                        float _1160 = _1158 + _1154;
                        float _1162 = fma(_934, 9.0, -1.0);
                        float _1164 = _1160 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1166 = precise::max(_1164, _1162);
                        float _1168 = precise::min(0.0, _1166);
                        bool _1170 = _1168 != _1164;
                        bool _1172 = isnan(_1168);
                        bool _1174 = _1170 || _1172;
                        bool _1176 = isnan(_1164);
                        bool _1178 = _1174 || _1176;
                        bool _1180 = !_1178;
                        if (!_1180)
                        {
                            float _1182 = fma(_974, 6.0, _324);
                            float _1184 = fma(_912, 6.0, _326);
                            float3 _3972 = float3(_1184, _1182, float(int(_282)));
                            float3 _3974 = select(_3972, float3(0.0), isnan(_3972));
                            float _1186 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3974.xy, uint(rint(_3974.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3974.xy, uint(rint(_3974.z))).x;
                            float _1188 = _606 + _1098;
                            float _1190 = fma(_934, 10.5, -1.0);
                            float _1192 = -_1188;
                            float _1194 = _1192 + _1186;
                            float _1196 = _1194 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1198 = precise::max(_1196, _1190);
                            float _1200 = precise::min(0.0, _1198);
                            bool _1202 = _1200 != _1196;
                            bool _1204 = isnan(_1200);
                            bool _1206 = _1202 || _1204;
                            bool _1208 = isnan(_1196);
                            bool _1210 = _1206 || _1208;
                            float _1212 = _1200;
                            if (_1210)
                            {
                                _1212 = 0.0;
                            }
                            float _1214 = _1212;
                            _1216 = _1214;
                            _1218 = _1210;
                        }
                    }
                }
            }
        }
    }
    if (!_1218)
    {
        _1216 = 1.0;
    }
    _1218 = false;
    float _1220 = _1216;
    float _1222 = _1002 * 1.5;
    float _1224 = precise::max(_952, _1222);
    float _1226 = precise::min(0.0, _1224);
    bool _1228 = _1226 != _952;
    bool _1230 = isnan(_1226);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan(_952);
    bool _1236 = _1232 || _1234;
    bool _1238 = !_1236;
    float _1240 = _1220;
    if (!_1238)
    {
        float _1242 = _324 + _1000;
        float _1244 = _326 + _998;
        float3 _4066 = float3(_1244, _1242, float(int(_282)));
        float3 _4068 = select(_4066, float3(0.0), isnan(_4066));
        float _1246 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4068.xy, uint(rint(_4068.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4068.xy, uint(rint(_4068.z))).x;
        float _1248 = _606 + _1002;
        float _1250 = _1002 * 3.0;
        float _1252 = -_1248;
        float _1254 = _1252 + _1246;
        float _1256 = _1254 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1258 = precise::max(_1256, _1250);
        float _1260 = precise::min(0.0, _1258);
        bool _1262 = _1260 != _1256;
        bool _1264 = isnan(_1260);
        bool _1266 = _1262 || _1264;
        bool _1268 = isnan(_1256);
        bool _1270 = _1266 || _1268;
        bool _1272 = !_1270;
        if (!_1272)
        {
            float _1274 = fma(_1000, 2.0, _324);
            float _1276 = fma(_998, 2.0, _326);
            float3 _4120 = float3(_1276, _1274, float(int(_282)));
            float3 _4122 = select(_4120, float3(0.0), isnan(_4120));
            float _1278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4122.xy, uint(rint(_4122.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4122.xy, uint(rint(_4122.z))).x;
            float _1280 = fma(_1002, 2.0, _606);
            float _1282 = _1002 * 4.5;
            float _1284 = -_1280;
            float _1286 = _1284 + _1278;
            float _1288 = _1286 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1290 = precise::max(_1288, _1282);
            float _1292 = precise::min(0.0, _1290);
            bool _1294 = _1292 != _1288;
            bool _1296 = isnan(_1292);
            bool _1298 = _1294 || _1296;
            bool _1300 = isnan(_1288);
            bool _1302 = _1298 || _1300;
            bool _1304 = !_1302;
            if (!_1304)
            {
                float _1306 = fma(_1000, 3.0, _324);
                float _1308 = fma(_998, 3.0, _326);
                float3 _4174 = float3(_1308, _1306, float(int(_282)));
                float3 _4176 = select(_4174, float3(0.0), isnan(_4174));
                float _1310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4176.xy, uint(rint(_4176.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4176.xy, uint(rint(_4176.z))).x;
                float _1312 = _606 + _1250;
                float _1314 = -_1312;
                float _1316 = _1314 + _1310;
                float _1318 = _1002 * 6.0;
                float _1320 = _1316 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1322 = precise::max(_1320, _1318);
                float _1324 = precise::min(0.0, _1322);
                bool _1326 = _1324 != _1320;
                bool _1328 = isnan(_1324);
                bool _1330 = _1326 || _1328;
                bool _1332 = isnan(_1320);
                bool _1334 = _1330 || _1332;
                bool _1336 = !_1334;
                if (!_1336)
                {
                    float _1338 = fma(_1000, 4.0, _324);
                    float _1340 = fma(_998, 4.0, _326);
                    float3 _4228 = float3(_1340, _1338, float(int(_282)));
                    float3 _4230 = select(_4228, float3(0.0), isnan(_4228));
                    float _1342 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4230.xy, uint(rint(_4230.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4230.xy, uint(rint(_4230.z))).x;
                    float _1344 = fma(_1002, 4.0, _606);
                    float _1346 = _1002 * 7.5;
                    float _1348 = -_1344;
                    float _1350 = _1348 + _1342;
                    float _1352 = _1350 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1354 = precise::max(_1352, _1346);
                    float _1356 = precise::min(0.0, _1354);
                    bool _1358 = _1356 != _1352;
                    bool _1360 = isnan(_1356);
                    bool _1362 = _1358 || _1360;
                    bool _1364 = isnan(_1352);
                    bool _1366 = _1362 || _1364;
                    bool _1368 = !_1366;
                    if (!_1368)
                    {
                        float _1370 = fma(_1000, 5.0, _324);
                        float _1372 = fma(_998, 5.0, _326);
                        float3 _4282 = float3(_1372, _1370, float(int(_282)));
                        float3 _4284 = select(_4282, float3(0.0), isnan(_4282));
                        float _1374 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4284.xy, uint(rint(_4284.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4284.xy, uint(rint(_4284.z))).x;
                        float _1376 = fma(_1002, 5.0, _606);
                        float _1378 = fma(_1002, 9.0, -1.0);
                        float _1380 = -_1376;
                        float _1382 = _1380 + _1374;
                        float _1384 = _1382 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1386 = precise::max(_1384, _1378);
                        float _1388 = precise::min(0.0, _1386);
                        bool _1390 = _1388 != _1384;
                        bool _1392 = isnan(_1388);
                        bool _1394 = _1390 || _1392;
                        bool _1396 = isnan(_1384);
                        bool _1398 = _1394 || _1396;
                        bool _1400 = !_1398;
                        if (!_1400)
                        {
                            float _1402 = fma(_1000, 6.0, _324);
                            float _1404 = fma(_998, 6.0, _326);
                            float3 _4336 = float3(_1404, _1402, float(int(_282)));
                            float3 _4338 = select(_4336, float3(0.0), isnan(_4336));
                            float _1406 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4338.xy, uint(rint(_4338.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4338.xy, uint(rint(_4338.z))).x;
                            float _1408 = _606 + _1318;
                            float _1410 = fma(_1002, 10.5, -1.0);
                            float _1412 = -_1408;
                            float _1414 = _1412 + _1406;
                            float _1416 = _1414 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1418 = precise::max(_1416, _1410);
                            float _1420 = precise::min(0.0, _1418);
                            bool _1422 = _1420 != _1416;
                            bool _1424 = isnan(_1420);
                            bool _1426 = _1422 || _1424;
                            bool _1428 = isnan(_1416);
                            bool _1430 = _1426 || _1428;
                            _1432 = _1430;
                        }
                    }
                }
            }
        }
    }
    if (!_1432)
    {
        float _1434 = _1220 + 1.0;
        _1240 = _1434;
    }
    _1432 = false;
    float _1436 = _1240;
    float _1438 = _948 * 1.5;
    float _1440 = precise::max(_952, _1438);
    float _1442 = precise::min(0.0, _1440);
    bool _1444 = _1442 != _952;
    bool _1446 = isnan(_1442);
    bool _1448 = _1444 || _1446;
    bool _1450 = isnan(_952);
    bool _1452 = _1448 || _1450;
    bool _1454 = !_1452;
    float _1456 = _1436;
    if (!_1454)
    {
        float _1458 = _324 + _946;
        float _1460 = _326 + _944;
        float3 _4426 = float3(_1460, _1458, float(int(_282)));
        float3 _4428 = select(_4426, float3(0.0), isnan(_4426));
        float _1462 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4428.xy, uint(rint(_4428.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4428.xy, uint(rint(_4428.z))).x;
        float _1464 = _606 + _948;
        float _1466 = _948 * 3.0;
        float _1468 = -_1464;
        float _1470 = _1468 + _1462;
        float _1472 = _1470 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1474 = precise::max(_1472, _1466);
        float _1476 = precise::min(0.0, _1474);
        bool _1478 = _1476 != _1472;
        bool _1480 = isnan(_1476);
        bool _1482 = _1478 || _1480;
        bool _1484 = isnan(_1472);
        bool _1486 = _1482 || _1484;
        bool _1488 = !_1486;
        if (!_1488)
        {
            float _1490 = fma(_946, 2.0, _324);
            float _1492 = fma(_944, 2.0, _326);
            float3 _4480 = float3(_1492, _1490, float(int(_282)));
            float3 _4482 = select(_4480, float3(0.0), isnan(_4480));
            float _1494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4482.xy, uint(rint(_4482.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4482.xy, uint(rint(_4482.z))).x;
            float _1496 = fma(_948, 2.0, _606);
            float _1498 = _948 * 4.5;
            float _1500 = -_1496;
            float _1502 = _1500 + _1494;
            float _1504 = _1502 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1506 = precise::max(_1504, _1498);
            float _1508 = precise::min(0.0, _1506);
            bool _1510 = _1508 != _1504;
            bool _1512 = isnan(_1508);
            bool _1514 = _1510 || _1512;
            bool _1516 = isnan(_1504);
            bool _1518 = _1514 || _1516;
            bool _1520 = !_1518;
            if (!_1520)
            {
                float _1522 = fma(_946, 3.0, _324);
                float _1524 = fma(_944, 3.0, _326);
                float3 _4534 = float3(_1524, _1522, float(int(_282)));
                float3 _4536 = select(_4534, float3(0.0), isnan(_4534));
                float _1526 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4536.xy, uint(rint(_4536.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4536.xy, uint(rint(_4536.z))).x;
                float _1528 = _606 + _1466;
                float _1530 = -_1528;
                float _1532 = _1530 + _1526;
                float _1534 = _948 * 6.0;
                float _1536 = _1532 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1538 = precise::max(_1536, _1534);
                float _1540 = precise::min(0.0, _1538);
                bool _1542 = _1540 != _1536;
                bool _1544 = isnan(_1540);
                bool _1546 = _1542 || _1544;
                bool _1548 = isnan(_1536);
                bool _1550 = _1546 || _1548;
                bool _1552 = !_1550;
                if (!_1552)
                {
                    float _1554 = fma(_946, 4.0, _324);
                    float _1556 = fma(_944, 4.0, _326);
                    float3 _4588 = float3(_1556, _1554, float(int(_282)));
                    float3 _4590 = select(_4588, float3(0.0), isnan(_4588));
                    float _1558 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4590.xy, uint(rint(_4590.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4590.xy, uint(rint(_4590.z))).x;
                    float _1560 = fma(_948, 4.0, _606);
                    float _1562 = -_1560;
                    float _1564 = _1562 + _1558;
                    float _1566 = _948 * 7.5;
                    float _1568 = _1564 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1570 = precise::max(_1568, _1566);
                    float _1572 = precise::min(0.0, _1570);
                    bool _1574 = _1572 != _1568;
                    bool _1576 = isnan(_1572);
                    bool _1578 = _1574 || _1576;
                    bool _1580 = isnan(_1568);
                    bool _1582 = _1578 || _1580;
                    bool _1584 = !_1582;
                    if (!_1584)
                    {
                        float _1586 = fma(_946, 5.0, _324);
                        float _1588 = fma(_944, 5.0, _326);
                        float3 _4642 = float3(_1588, _1586, float(int(_282)));
                        float3 _4644 = select(_4642, float3(0.0), isnan(_4642));
                        float _1590 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4644.xy, uint(rint(_4644.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4644.xy, uint(rint(_4644.z))).x;
                        float _1592 = fma(_948, 5.0, _606);
                        float _1594 = -_1592;
                        float _1596 = _1594 + _1590;
                        float _1598 = fma(_948, 9.0, -1.0);
                        float _1600 = _1596 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1602 = precise::max(_1600, _1598);
                        float _1604 = precise::min(0.0, _1602);
                        bool _1606 = _1604 != _1600;
                        bool _1608 = isnan(_1604);
                        bool _1610 = _1606 || _1608;
                        bool _1612 = isnan(_1600);
                        bool _1614 = _1610 || _1612;
                        bool _1616 = !_1614;
                        if (!_1616)
                        {
                            float _1618 = fma(_946, 6.0, _324);
                            float _1620 = fma(_944, 6.0, _326);
                            float3 _4696 = float3(_1620, _1618, float(int(_282)));
                            float3 _4698 = select(_4696, float3(0.0), isnan(_4696));
                            float _1622 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4698.xy, uint(rint(_4698.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4698.xy, uint(rint(_4698.z))).x;
                            float _1624 = _606 + _1534;
                            float _1626 = fma(_948, 10.5, -1.0);
                            float _1628 = -_1624;
                            float _1630 = _1628 + _1622;
                            float _1632 = _1630 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1634 = precise::max(_1632, _1626);
                            float _1636 = precise::min(0.0, _1634);
                            bool _1638 = _1636 != _1632;
                            bool _1640 = isnan(_1636);
                            bool _1642 = _1638 || _1640;
                            bool _1644 = isnan(_1632);
                            bool _1646 = _1642 || _1644;
                            _1648 = _1646;
                        }
                    }
                }
            }
        }
    }
    if (!_1648)
    {
        float _1650 = _1436 + 1.0;
        _1456 = _1650;
    }
    _1648 = false;
    float _1652 = _1456;
    float _1654 = _1018 * 1.5;
    float _1656 = precise::max(_952, _1654);
    float _1658 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1660 = 1.0 + _1658;
    float _1662 = precise::min(0.0, _1656);
    bool _1664 = _1662 != _952;
    bool _1666 = isnan(_1662);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan(_952);
    bool _1672 = _1668 || _1670;
    float _1674 = fma(_1660, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _1676 = _1674 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _1678 = !_1672;
    float _1680 = _1652;
    if (!_1678)
    {
        float _1682 = _324 + _1016;
        float _1684 = _326 + _1014;
        float3 _4801 = float3(_1684, _1682, float(int(_282)));
        float3 _4803 = select(_4801, float3(0.0), isnan(_4801));
        float _1686 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4803.xy, uint(rint(_4803.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4803.xy, uint(rint(_4803.z))).x;
        float _1688 = _606 + _1018;
        float _1690 = _1018 * 3.0;
        float _1692 = -_1688;
        float _1694 = _1692 + _1686;
        float _1696 = _1694 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1698 = precise::max(_1696, _1690);
        float _1700 = precise::min(0.0, _1698);
        bool _1702 = _1700 != _1696;
        bool _1704 = isnan(_1700);
        bool _1706 = _1702 || _1704;
        bool _1708 = isnan(_1696);
        bool _1710 = _1706 || _1708;
        bool _1712 = !_1710;
        if (!_1712)
        {
            float _1714 = fma(_1016, 2.0, _324);
            float _1716 = fma(_1014, 2.0, _326);
            float3 _4855 = float3(_1716, _1714, float(int(_282)));
            float3 _4857 = select(_4855, float3(0.0), isnan(_4855));
            float _1718 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4857.xy, uint(rint(_4857.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4857.xy, uint(rint(_4857.z))).x;
            float _1720 = fma(_1018, 2.0, _606);
            float _1722 = _1018 * 4.5;
            float _1724 = -_1720;
            float _1726 = _1724 + _1718;
            float _1728 = _1726 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1730 = precise::max(_1728, _1722);
            float _1732 = precise::min(0.0, _1730);
            bool _1734 = _1732 != _1728;
            bool _1736 = isnan(_1732);
            bool _1738 = _1734 || _1736;
            bool _1740 = isnan(_1728);
            bool _1742 = _1738 || _1740;
            bool _1744 = !_1742;
            if (!_1744)
            {
                float _1746 = fma(_1016, 3.0, _324);
                float _1748 = fma(_1014, 3.0, _326);
                float3 _4909 = float3(_1748, _1746, float(int(_282)));
                float3 _4911 = select(_4909, float3(0.0), isnan(_4909));
                float _1750 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4911.xy, uint(rint(_4911.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4911.xy, uint(rint(_4911.z))).x;
                float _1752 = _606 + _1690;
                float _1754 = -_1752;
                float _1756 = _1754 + _1750;
                float _1758 = _1018 * 6.0;
                float _1760 = _1756 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1762 = precise::max(_1760, _1758);
                float _1764 = precise::min(0.0, _1762);
                bool _1766 = _1764 != _1760;
                bool _1768 = isnan(_1764);
                bool _1770 = _1766 || _1768;
                bool _1772 = isnan(_1760);
                bool _1774 = _1770 || _1772;
                bool _1776 = !_1774;
                if (!_1776)
                {
                    float _1778 = fma(_1016, 4.0, _324);
                    float _1780 = fma(_1014, 4.0, _326);
                    float3 _4963 = float3(_1780, _1778, float(int(_282)));
                    float3 _4965 = select(_4963, float3(0.0), isnan(_4963));
                    float _1782 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4965.xy, uint(rint(_4965.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4965.xy, uint(rint(_4965.z))).x;
                    float _1784 = fma(_1018, 4.0, _606);
                    float _1786 = _1018 * 7.5;
                    float _1788 = -_1784;
                    float _1790 = _1788 + _1782;
                    float _1792 = _1790 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1794 = precise::max(_1792, _1786);
                    float _1796 = precise::min(0.0, _1794);
                    bool _1798 = _1796 != _1792;
                    bool _1800 = isnan(_1796);
                    bool _1802 = _1798 || _1800;
                    bool _1804 = isnan(_1792);
                    bool _1806 = _1802 || _1804;
                    bool _1808 = !_1806;
                    if (!_1808)
                    {
                        float _1810 = fma(_1016, 5.0, _324);
                        float _1812 = fma(_1014, 5.0, _326);
                        float3 _5017 = float3(_1812, _1810, float(int(_282)));
                        float3 _5019 = select(_5017, float3(0.0), isnan(_5017));
                        float _1814 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5019.xy, uint(rint(_5019.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5019.xy, uint(rint(_5019.z))).x;
                        float _1816 = fma(_1018, 5.0, _606);
                        float _1818 = fma(_1018, 9.0, -1.0);
                        float _1820 = -_1816;
                        float _1822 = _1820 + _1814;
                        float _1824 = _1822 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1826 = precise::max(_1824, _1818);
                        float _1828 = precise::min(0.0, _1826);
                        bool _1830 = _1828 != _1824;
                        bool _1832 = isnan(_1828);
                        bool _1834 = _1830 || _1832;
                        bool _1836 = isnan(_1824);
                        bool _1838 = _1834 || _1836;
                        bool _1840 = !_1838;
                        if (!_1840)
                        {
                            float _1842 = fma(_1016, 6.0, _324);
                            float _1844 = fma(_1014, 6.0, _326);
                            float3 _5071 = float3(_1844, _1842, float(int(_282)));
                            float3 _5073 = select(_5071, float3(0.0), isnan(_5071));
                            float _1846 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5073.xy, uint(rint(_5073.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5073.xy, uint(rint(_5073.z))).x;
                            float _1848 = _606 + _1758;
                            float _1850 = fma(_1018, 10.5, -1.0);
                            float _1852 = -_1848;
                            float _1854 = _1852 + _1846;
                            float _1856 = _1854 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1858 = precise::max(_1856, _1850);
                            float _1860 = precise::min(0.0, _1858);
                            bool _1862 = _1860 != _1856;
                            bool _1864 = isnan(_1860);
                            bool _1866 = _1862 || _1864;
                            bool _1868 = isnan(_1856);
                            bool _1870 = _1866 || _1868;
                            _1872 = _1870;
                        }
                    }
                }
            }
        }
    }
    if (!_1872)
    {
        float _1874 = _1652 + 1.0;
        _1680 = _1874;
    }
    _1872 = false;
    float _1876 = _1680;
    float _1878 = _1876 * 0.25;
    float _1880 = -_1878;
    float _1882 = fma(_1880, _1676, 1.0);
    out.m_39.x = _1882;
    return out;
}

