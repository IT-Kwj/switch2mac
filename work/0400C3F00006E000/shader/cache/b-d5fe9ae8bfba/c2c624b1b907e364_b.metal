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
    bool _2684 = false;
    bool _1712 = false;
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
    float2 _2729 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2729, float2(0.0), isnan(_2729))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2729, float2(0.0), isnan(_2729))).x;
    float _68 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _70 = _68 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _72 = fma(_64, 2.0, -1.0);
    float _74 = fma(_62, 2.0, -1.0);
    bool _78 = _70 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _80 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _82 = _70 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _84 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    bool _86 = _70 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _88 = _68 * _80;
    bool _90 = !_78;
    int _93 = _90 ? 0 : 1;
    float _95 = _68 * _84;
    float _97 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _99 = _88 * _97;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _103 = _88 * _101;
    int _105 = 2;
    if (!_78)
    {
        _105 = 1;
    }
    int _107 = _105;
    float _109 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[3].x, _99);
    int _111 = _107;
    if (!_82)
    {
        _111 = _93;
    }
    int _113 = _111;
    float _115 = -_70;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[3].z, _109);
    int _119 = _113 + 1;
    int _121 = _119;
    if (!_86)
    {
        _121 = _113;
    }
    int _123 = _121;
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _127 = _88 * _125;
    float _129 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _103);
    float _131 = _117 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _133 = _123 != 1;
    float _135 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[4].x, _127);
    bool _137 = _123 != 0;
    float _139 = -_70;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[2].z, _129);
    bool _143 = !_133;
    int _145 = _143 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _147 = -_70;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[4].z, _135);
    bool _151 = !_133;
    int _153 = _151 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _155 = _141 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _157 = _137 ? as_type<float>(_145) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _159 = _149 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _161 = _137 ? as_type<float>(_153) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _163 = _131 * _157;
    float _165 = fma(_155, _161, _163);
    bool _167 = !_133;
    int _169 = _167 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    bool _171 = !_133;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _175 = !_133;
    int _177 = _175 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    bool _179 = !_133;
    int _181 = _179 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _183 = _137 ? as_type<float>(_169) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    bool _185 = !_133;
    int _187 = _185 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    float _189 = _137 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _191 = _131 * _183;
    bool _193 = !_133;
    int _195 = _193 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _197 = _137 ? as_type<float>(_177) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _199 = _137 ? as_type<float>(_181) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _201 = _131 * _189;
    float _203 = _137 ? as_type<float>(_187) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _205 = fma(_159, _197, _165);
    float _207 = _137 ? as_type<float>(_195) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _209 = fma(_155, _199, _191);
    float _211 = fma(_155, _203, _201);
    float _213 = _207 + _205;
    bool _215 = !_133;
    int _217 = _215 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _219 = 1.0 / _213;
    bool _221 = !_133;
    int _223 = _221 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _225 = float(_123);
    float _227 = _137 ? as_type<float>(_217) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    bool _229 = !_133;
    int _231 = _229 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    bool _233 = !_133;
    int _235 = _233 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _237 = fma(_159, _227, _211);
    float _239 = _137 ? as_type<float>(_223) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _241 = rint(_225);
    float _243 = precise::max(_241, 0.0);
    uint _246 = uint(_243);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = _137 ? as_type<float>(_235) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _252 = _137 ? as_type<float>(_231) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _254 = fma(_159, _239, _209);
    float _256 = _250 + _237;
    float _258 = _252 + _254;
    float _260 = _256 * _219;
    float _262 = _258 * _219;
    float3 _3149 = float3(_262, _260, float(int(_248)));
    float3 _3153 = select(_3149, float3(0.0), isnan(_3149));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3153.xy, uint(rint(_3153.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3153.xy, uint(rint(_3153.z))).x;
    float _266 = _131 * 78.233001708984375;
    float _268 = rint(_225);
    float _270 = precise::max(_268, 0.0);
    uint _272 = uint(_270);
    float _274 = fma(_159, 12.98980045318603515625, _266);
    float _276 = fma(_155, 12.98980045318603515625, _266);
    float _278 = fma(_155, 45.16400146484375, _274);
    float _280 = fma(_159, 45.16400146484375, _276);
    bool _282 = !_133;
    int _284 = _282 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _286 = _278 + 94.67299652099609375;
    float _288 = _137 ? as_type<float>(_284) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _290 = _286 * 0.15915493667125701904296875;
    float _292 = _278 + 189.3459930419921875;
    float _294 = _290 * 6.283185482025146484375;
    float _296 = sin(_294);
    float _298 = _292 * 0.15915493667125701904296875;
    float _300 = _280 + 94.67299652099609375;
    bool _302 = !_133;
    int _304 = _302 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    bool _306 = !_133;
    int _308 = _306 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _310 = _300 * 0.15915493667125701904296875;
    float _312 = _280 + 189.3459930419921875;
    float _314 = _298 * 6.283185482025146484375;
    float _316 = sin(_314);
    float _318 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _320 = _318 + 1.0;
    float _322 = _312 * 0.15915493667125701904296875;
    float _324 = fma(_320, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _326 = _310 * 6.283185482025146484375;
    float _328 = sin(_326);
    bool _330 = !_133;
    int _332 = _330 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _334 = _296 * 43758.546875;
    bool _336 = !_133;
    int _338 = _336 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    bool _340 = !_133;
    int _342 = _340 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _344 = _137 ? as_type<float>(_332) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _346 = _322 * 6.283185482025146484375;
    float _348 = sin(_346);
    float _350 = _316 * 43758.546875;
    float _352 = _137 ? as_type<float>(_342) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _354 = _131 * _344;
    float _356 = _131 * _352;
    float _358 = _328 * 43758.546875;
    float _360 = _137 ? as_type<float>(_338) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _362 = floor(_334);
    bool _364 = !_133;
    int _366 = _364 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _368 = _137 ? as_type<float>(_304) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _370 = _131 * _360;
    float _372 = _348 * 43758.546875;
    float _374 = _131 * _288;
    float _376 = floor(_358);
    bool _378 = !_133;
    int _380 = _378 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _382 = fma(_155, _368, _354);
    float _384 = _137 ? as_type<float>(_380) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    bool _386 = !_133;
    int _388 = _386 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _390 = floor(_350);
    float _392 = -_362;
    float _394 = _334 + _392;
    float _396 = fma(_155, _384, _370);
    float _398 = _137 ? as_type<float>(_388) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _400 = _137 ? as_type<float>(_366) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _402 = floor(_372);
    float _404 = -_376;
    float _406 = _358 + _404;
    float _408 = fma(_155, _398, _356);
    float _410 = fma(_155, _400, _374);
    float _412 = _137 ? as_type<float>(_308) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _414 = -_390;
    float _416 = _350 + _414;
    float _418 = _324 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _420 = fma(_406, 2.0, -1.0);
    bool _422 = !_133;
    int _424 = _422 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _426 = fma(_159, _412, _382);
    bool _428 = !_133;
    int _430 = _428 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _432 = fma(_394, 2.0, -1.0);
    float _434 = _418 * _420;
    float _436 = -_402;
    float _438 = _372 + _436;
    float _440 = _137 ? as_type<float>(_424) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _442 = _418 * _432;
    float _444 = fma(_416, 2.0, -1.0);
    float _446 = fma(_438, 2.0, -1.0);
    float _448 = _137 ? as_type<float>(_430) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _450 = fma(_159, _440, _396);
    float _452 = _418 * _444;
    float _454 = _418 * _446;
    float _456 = _434 * _434;
    float _458 = fma(_159, _448, _408);
    float _460 = _454 * _454;
    float _462 = fma(_442, _442, _456);
    float _464 = fma(_452, _452, _460);
    float _466 = _462 + 1.0;
    float _468 = _464 + 1.0;
    bool _470 = !_133;
    int _472 = _470 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _474 = rsqrt(_466);
    bool _476 = !_133;
    int _478 = _476 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _480 = !_133;
    int _482 = _480 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    bool _484 = !_133;
    int _486 = _484 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _488 = rsqrt(_468);
    float _490 = _137 ? as_type<float>(_472) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    bool _492 = !_133;
    int _494 = _492 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _496 = _137 ? as_type<float>(_478) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _498 = fma(_159, _490, _410);
    float _500 = _137 ? as_type<float>(_482) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _502 = _137 ? as_type<float>(_486) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _504 = _496 + _450;
    float _506 = _137 ? as_type<float>(_494) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _508 = _500 + _458;
    float _510 = _502 + _498;
    float _512 = fma(_442, _474, _504);
    float _514 = _506 + _426;
    float _516 = fma(_434, _474, _508);
    float _518 = fma(_454, _488, _508);
    float _520 = -_474;
    float _522 = _510 + _520;
    float _524 = _514 * _219;
    float _526 = -_488;
    float _528 = _510 + _526;
    float _530 = fma(_452, _488, _504);
    bool _532 = !_133;
    int _534 = _532 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    bool _536 = !_133;
    int _538 = _536 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    bool _540 = !_133;
    int _542 = _540 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    bool _544 = !_133;
    int _546 = _544 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _548 = _137 ? as_type<float>(_534) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _550 = _137 ? as_type<float>(_538) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _552 = _137 ? as_type<float>(_542) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _554 = _548 * _516;
    float _556 = _137 ? as_type<float>(_546) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _558 = _550 * _516;
    bool _560 = !_133;
    int _562 = _560 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _564 = _552 * _516;
    float _566 = _556 * _516;
    bool _568 = !_133;
    int _570 = _568 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _572 = _548 * _518;
    bool _574 = !_133;
    int _576 = _574 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _578 = _550 * _518;
    float _580 = _137 ? as_type<float>(_562) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _582 = _552 * _518;
    bool _584 = !_133;
    int _586 = _584 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _588 = _556 * _518;
    float _590 = _137 ? as_type<float>(_570) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _592 = fma(_580, _512, _554);
    float _594 = _137 ? as_type<float>(_576) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _596 = fma(_580, _530, _572);
    float _598 = _137 ? as_type<float>(_586) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _600 = fma(_590, _512, _558);
    float _602 = fma(_590, _530, _578);
    float _604 = fma(_594, _512, _564);
    float _606 = fma(_594, _530, _582);
    float _608 = fma(_598, _512, _566);
    float _610 = fma(_598, _530, _588);
    bool _612 = !_133;
    int _614 = _612 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    bool _616 = !_133;
    int _618 = _616 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    bool _620 = !_133;
    int _622 = _620 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _624 = _137 ? as_type<float>(_614) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    bool _626 = !_133;
    int _628 = _626 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _630 = _137 ? as_type<float>(_622) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _632 = fma(_624, _528, _596);
    float _634 = _137 ? as_type<float>(_628) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _636 = fma(_624, _522, _592);
    float _638 = _137 ? as_type<float>(_618) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _640 = fma(_630, _522, _608);
    float _642 = fma(_630, _528, _610);
    float _644 = _634 + _640;
    float _646 = fma(_638, _522, _600);
    float _648 = fma(_638, _528, _602);
    float _650 = _634 + _642;
    float _652 = 1.0 / _644;
    bool _654 = !_133;
    int _656 = _654 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _658 = _137 ? as_type<float>(_656) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    bool _660 = !_133;
    int _662 = _660 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _664 = !_133;
    int _666 = _664 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _668 = fma(_658, _522, _604);
    bool _670 = !_133;
    int _672 = _670 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _674 = 1.0 / _650;
    float _676 = _137 ? as_type<float>(_666) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _678 = fma(_658, _528, _606);
    float _680 = _137 ? as_type<float>(_672) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _682 = _676 + _668;
    float _684 = _137 ? as_type<float>(_662) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _686 = _652 * 0.5;
    float _688 = _676 + _678;
    float _690 = _680 + _636;
    float _692 = _680 + _632;
    float _694 = fma(_682, _686, 0.5);
    float _696 = _684 + _646;
    float _698 = _684 + _648;
    float _700 = fma(_690, _686, 0.5);
    float _702 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0333333350718021392822265625;
    float _704 = -_694;
    float _706 = _524 + _704;
    float _708 = _696 * _652;
    float _710 = _698 * _674;
    float _712 = _674 * 0.5;
    float _714 = _706 * _702;
    float _716 = fma(_708, -0.5, 0.5);
    float _718 = fma(_710, -0.5, 0.5);
    float _720 = fma(_692, _712, 0.5);
    float _722 = _714 * 1.5;
    float _724 = -_716;
    float _726 = _260 + _724;
    float _728 = -_700;
    float _730 = _262 + _728;
    float _732 = fma(_688, _712, 0.5);
    float _734 = _726 * _702;
    float _736 = _730 * _702;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.0333333350718021392822265625;
    float _740 = -_732;
    float _742 = _524 + _740;
    float _744 = _742 * _738;
    float _746 = -_524;
    float _748 = _746 + _264;
    float _750 = _748 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _752 = precise::max(_750, _722);
    float _754 = precise::min(0.0, _752);
    bool _756 = _754 != _750;
    bool _758 = isnan(_754);
    bool _760 = _756 || _758;
    bool _762 = isnan(_750);
    bool _764 = _760 || _762;
    float _766 = -_720;
    float _768 = _262 + _766;
    float _770 = -_718;
    float _772 = _260 + _770;
    float _774 = _768 * _738;
    float _776 = _772 * _738;
    bool _778 = !_764;
    float _780 = as_type<float>(_272);
    float _1710;
    if (!_778)
    {
        float _782 = _260 + _734;
        float _784 = _262 + _736;
        float3 _4173 = float3(_784, _782, float(int(_248)));
        float3 _4175 = select(_4173, float3(0.0), isnan(_4173));
        float _786 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4175.xy, uint(rint(_4175.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4175.xy, uint(rint(_4175.z))).x;
        float _788 = _524 + _714;
        float _790 = _714 * 3.0;
        float _792 = -_788;
        float _794 = _792 + _786;
        float _796 = _794 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _798 = precise::max(_796, _790);
        float _800 = precise::min(0.0, _798);
        bool _802 = _800 != _796;
        bool _804 = isnan(_800);
        bool _806 = _802 || _804;
        bool _808 = isnan(_796);
        bool _810 = _806 || _808;
        bool _812 = !_810;
        if (!_812)
        {
            float _814 = fma(_734, 2.0, _260);
            float _816 = fma(_736, 2.0, _262);
            float3 _4228 = float3(_816, _814, float(int(_248)));
            float3 _4230 = select(_4228, float3(0.0), isnan(_4228));
            float _818 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4230.xy, uint(rint(_4230.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4230.xy, uint(rint(_4230.z))).x;
            float _820 = fma(_714, 2.0, _524);
            float _822 = _714 * 4.5;
            float _824 = -_820;
            float _826 = _824 + _818;
            float _828 = _826 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _830 = precise::max(_828, _822);
            float _832 = precise::min(0.0, _830);
            bool _834 = _832 != _828;
            bool _836 = isnan(_832);
            bool _838 = _834 || _836;
            bool _840 = isnan(_828);
            bool _842 = _838 || _840;
            bool _844 = !_842;
            if (!_844)
            {
                float _846 = fma(_734, 3.0, _260);
                float _848 = fma(_736, 3.0, _262);
                float3 _4283 = float3(_848, _846, float(int(_248)));
                float3 _4285 = select(_4283, float3(0.0), isnan(_4283));
                float _850 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4285.xy, uint(rint(_4285.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4285.xy, uint(rint(_4285.z))).x;
                float _852 = fma(_714, 3.0, _524);
                float _854 = _714 * 6.0;
                float _856 = -_852;
                float _858 = _856 + _850;
                float _860 = _858 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _862 = precise::max(_860, _854);
                float _864 = precise::min(0.0, _862);
                bool _866 = _864 != _860;
                bool _868 = isnan(_864);
                bool _870 = _866 || _868;
                bool _872 = isnan(_860);
                bool _874 = _870 || _872;
                bool _876 = !_874;
                if (!_876)
                {
                    float _878 = fma(_734, 4.0, _260);
                    float _880 = fma(_736, 4.0, _262);
                    float3 _4339 = float3(_880, _878, float(int(_248)));
                    float3 _4341 = select(_4339, float3(0.0), isnan(_4339));
                    float _882 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4341.xy, uint(rint(_4341.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4341.xy, uint(rint(_4341.z))).x;
                    float _884 = fma(_714, 4.0, _524);
                    float _886 = _714 * 7.5;
                    float _888 = -_884;
                    float _890 = _888 + _882;
                    float _892 = _890 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _894 = precise::max(_892, _886);
                    float _896 = precise::min(0.0, _894);
                    bool _898 = _896 != _892;
                    bool _900 = isnan(_896);
                    bool _902 = _898 || _900;
                    bool _904 = isnan(_892);
                    bool _906 = _902 || _904;
                    bool _908 = !_906;
                    if (!_908)
                    {
                        float _910 = fma(_734, 5.0, _260);
                        float _912 = fma(_736, 5.0, _262);
                        float3 _4395 = float3(_912, _910, float(int(_248)));
                        float3 _4397 = select(_4395, float3(0.0), isnan(_4395));
                        float _914 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4397.xy, uint(rint(_4397.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4397.xy, uint(rint(_4397.z))).x;
                        float _916 = fma(_714, 5.0, _524);
                        float _918 = _714 * 9.0;
                        float _920 = -_916;
                        float _922 = _920 + _914;
                        float _924 = _922 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _926 = precise::max(_924, _918);
                        float _928 = precise::min(0.0, _926);
                        bool _930 = _928 != _924;
                        bool _932 = isnan(_928);
                        bool _934 = _930 || _932;
                        bool _936 = isnan(_924);
                        bool _938 = _934 || _936;
                        bool _940 = !_938;
                        if (!_940)
                        {
                            float _942 = fma(_734, 6.0, _260);
                            float _944 = fma(_736, 6.0, _262);
                            float3 _4450 = float3(_944, _942, float(int(_248)));
                            float3 _4452 = select(_4450, float3(0.0), isnan(_4450));
                            float _946 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4452.xy, uint(rint(_4452.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4452.xy, uint(rint(_4452.z))).x;
                            float _948 = fma(_714, 6.0, _524);
                            float _950 = _714 * 10.5;
                            float _952 = -_948;
                            float _954 = _952 + _946;
                            float _956 = _954 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _958 = precise::max(_956, _950);
                            float _960 = precise::min(0.0, _958);
                            bool _962 = _960 != _956;
                            bool _964 = isnan(_960);
                            bool _966 = _962 || _964;
                            bool _968 = isnan(_956);
                            bool _970 = _966 || _968;
                            bool _972 = !_970;
                            if (!_972)
                            {
                                float _974 = fma(_734, 7.0, _260);
                                float _976 = fma(_736, 7.0, _262);
                                float3 _4506 = float3(_976, _974, float(int(_248)));
                                float3 _4508 = select(_4506, float3(0.0), isnan(_4506));
                                float _978 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4508.xy, uint(rint(_4508.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4508.xy, uint(rint(_4508.z))).x;
                                float _980 = fma(_714, 7.0, _524);
                                float _982 = _714 * 12.0;
                                float _984 = -_980;
                                float _986 = _984 + _978;
                                float _988 = _986 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _990 = precise::max(_988, _982);
                                float _992 = precise::min(0.0, _990);
                                bool _994 = _992 != _988;
                                bool _996 = isnan(_992);
                                bool _998 = _994 || _996;
                                bool _1000 = isnan(_988);
                                bool _1002 = _998 || _1000;
                                bool _1004 = !_1002;
                                if (!_1004)
                                {
                                    float _1006 = fma(_734, 8.0, _260);
                                    float _1008 = fma(_736, 8.0, _262);
                                    float3 _4562 = float3(_1008, _1006, float(int(_248)));
                                    float3 _4564 = select(_4562, float3(0.0), isnan(_4562));
                                    float _1010 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4564.xy, uint(rint(_4564.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4564.xy, uint(rint(_4564.z))).x;
                                    float _1012 = fma(_714, 8.0, _524);
                                    float _1014 = _714 * 13.5;
                                    float _1016 = -_1012;
                                    float _1018 = _1016 + _1010;
                                    float _1020 = _1018 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _1022 = precise::max(_1020, _1014);
                                    float _1024 = precise::min(0.0, _1022);
                                    bool _1026 = _1024 != _1020;
                                    bool _1028 = isnan(_1024);
                                    bool _1030 = _1026 || _1028;
                                    bool _1032 = isnan(_1020);
                                    bool _1034 = _1030 || _1032;
                                    bool _1036 = !_1034;
                                    if (!_1036)
                                    {
                                        float _1038 = fma(_734, 9.0, _260);
                                        float _1040 = fma(_736, 9.0, _262);
                                        float3 _4617 = float3(_1040, _1038, float(int(_248)));
                                        float3 _4619 = select(_4617, float3(0.0), isnan(_4617));
                                        float _1042 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4619.xy, uint(rint(_4619.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4619.xy, uint(rint(_4619.z))).x;
                                        float _1044 = fma(_714, 9.0, _524);
                                        float _1046 = _714 * 15.0;
                                        float _1048 = -_1044;
                                        float _1050 = _1048 + _1042;
                                        float _1052 = _1050 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _1054 = precise::max(_1052, _1046);
                                        float _1056 = precise::min(0.0, _1054);
                                        bool _1058 = _1056 != _1052;
                                        bool _1060 = isnan(_1056);
                                        bool _1062 = _1058 || _1060;
                                        bool _1064 = isnan(_1052);
                                        bool _1066 = _1062 || _1064;
                                        bool _1068 = !_1066;
                                        if (!_1068)
                                        {
                                            float _1070 = fma(_734, 10.0, _260);
                                            float _1072 = fma(_736, 10.0, _262);
                                            float3 _4673 = float3(_1072, _1070, float(int(_248)));
                                            float3 _4675 = select(_4673, float3(0.0), isnan(_4673));
                                            float _1074 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4675.xy, uint(rint(_4675.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4675.xy, uint(rint(_4675.z))).x;
                                            float _1076 = fma(_714, 10.0, _524);
                                            float _1078 = _714 * 16.5;
                                            float _1080 = -_1076;
                                            float _1082 = _1080 + _1074;
                                            float _1084 = _1082 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _1086 = precise::max(_1084, _1078);
                                            float _1088 = precise::min(0.0, _1086);
                                            bool _1090 = _1088 != _1084;
                                            bool _1092 = isnan(_1088);
                                            bool _1094 = _1090 || _1092;
                                            bool _1096 = isnan(_1084);
                                            bool _1098 = _1094 || _1096;
                                            bool _1100 = !_1098;
                                            if (!_1100)
                                            {
                                                float _1102 = fma(_734, 11.0, _260);
                                                float _1104 = fma(_736, 11.0, _262);
                                                float3 _4729 = float3(_1104, _1102, float(int(_248)));
                                                float3 _4731 = select(_4729, float3(0.0), isnan(_4729));
                                                float _1106 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4731.xy, uint(rint(_4731.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4731.xy, uint(rint(_4731.z))).x;
                                                float _1108 = fma(_714, 11.0, _524);
                                                float _1110 = _714 * 18.0;
                                                float _1112 = -_1108;
                                                float _1114 = _1112 + _1106;
                                                float _1116 = _1114 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _1118 = precise::max(_1116, _1110);
                                                float _1120 = precise::min(0.0, _1118);
                                                bool _1122 = _1120 != _1116;
                                                bool _1124 = isnan(_1120);
                                                bool _1126 = _1122 || _1124;
                                                bool _1128 = isnan(_1116);
                                                bool _1130 = _1126 || _1128;
                                                bool _1132 = !_1130;
                                                if (!_1132)
                                                {
                                                    float _1134 = fma(_734, 12.0, _260);
                                                    float _1136 = fma(_736, 12.0, _262);
                                                    float3 _4784 = float3(_1136, _1134, float(int(_248)));
                                                    float3 _4786 = select(_4784, float3(0.0), isnan(_4784));
                                                    float _1138 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4786.xy, uint(rint(_4786.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4786.xy, uint(rint(_4786.z))).x;
                                                    float _1140 = fma(_714, 12.0, _524);
                                                    float _1142 = _714 * 19.5;
                                                    float _1144 = -_1140;
                                                    float _1146 = _1144 + _1138;
                                                    float _1148 = _1146 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _1150 = precise::max(_1148, _1142);
                                                    float _1152 = precise::min(0.0, _1150);
                                                    bool _1154 = _1152 != _1148;
                                                    bool _1156 = isnan(_1152);
                                                    bool _1158 = _1154 || _1156;
                                                    bool _1160 = isnan(_1148);
                                                    bool _1162 = _1158 || _1160;
                                                    bool _1164 = !_1162;
                                                    if (!_1164)
                                                    {
                                                        float _1166 = fma(_734, 13.0, _260);
                                                        float _1168 = fma(_736, 13.0, _262);
                                                        float3 _4840 = float3(_1168, _1166, float(int(_248)));
                                                        float3 _4842 = select(_4840, float3(0.0), isnan(_4840));
                                                        float _1170 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4842.xy, uint(rint(_4842.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4842.xy, uint(rint(_4842.z))).x;
                                                        float _1172 = fma(_714, 13.0, _524);
                                                        float _1174 = _714 * 21.0;
                                                        float _1176 = -_1172;
                                                        float _1178 = _1176 + _1170;
                                                        float _1180 = _1178 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _1182 = precise::max(_1180, _1174);
                                                        float _1184 = precise::min(0.0, _1182);
                                                        bool _1186 = _1184 != _1180;
                                                        bool _1188 = isnan(_1184);
                                                        bool _1190 = _1186 || _1188;
                                                        bool _1192 = isnan(_1180);
                                                        bool _1194 = _1190 || _1192;
                                                        bool _1196 = !_1194;
                                                        if (!_1196)
                                                        {
                                                            float _1198 = fma(_734, 14.0, _260);
                                                            float _1200 = fma(_736, 14.0, _262);
                                                            float3 _4896 = float3(_1200, _1198, float(int(_248)));
                                                            float3 _4898 = select(_4896, float3(0.0), isnan(_4896));
                                                            float _1202 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4898.xy, uint(rint(_4898.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4898.xy, uint(rint(_4898.z))).x;
                                                            float _1204 = fma(_714, 14.0, _524);
                                                            float _1206 = _714 * 22.5;
                                                            float _1208 = -_1204;
                                                            float _1210 = _1208 + _1202;
                                                            float _1212 = _1210 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _1214 = precise::max(_1212, _1206);
                                                            float _1216 = precise::min(0.0, _1214);
                                                            bool _1218 = _1216 != _1212;
                                                            bool _1220 = isnan(_1216);
                                                            bool _1222 = _1218 || _1220;
                                                            bool _1224 = isnan(_1212);
                                                            bool _1226 = _1222 || _1224;
                                                            bool _1228 = !_1226;
                                                            if (!_1228)
                                                            {
                                                                float _1230 = fma(_734, 15.0, _260);
                                                                float _1232 = fma(_736, 15.0, _262);
                                                                float3 _4951 = float3(_1232, _1230, float(int(_248)));
                                                                float3 _4953 = select(_4951, float3(0.0), isnan(_4951));
                                                                float _1234 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _4953.xy, uint(rint(_4953.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _4953.xy, uint(rint(_4953.z))).x;
                                                                float _1236 = fma(_714, 15.0, _524);
                                                                float _1238 = _714 * 24.0;
                                                                float _1240 = -_1236;
                                                                float _1242 = _1240 + _1234;
                                                                float _1244 = _1242 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _1246 = precise::max(_1244, _1238);
                                                                float _1248 = precise::min(0.0, _1246);
                                                                bool _1250 = _1248 != _1244;
                                                                bool _1252 = isnan(_1248);
                                                                bool _1254 = _1250 || _1252;
                                                                bool _1256 = isnan(_1244);
                                                                bool _1258 = _1254 || _1256;
                                                                bool _1260 = !_1258;
                                                                if (!_1260)
                                                                {
                                                                    float _1262 = fma(_734, 16.0, _260);
                                                                    float _1264 = fma(_736, 16.0, _262);
                                                                    float3 _5007 = float3(_1264, _1262, float(int(_248)));
                                                                    float3 _5009 = select(_5007, float3(0.0), isnan(_5007));
                                                                    float _1266 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5009.xy, uint(rint(_5009.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5009.xy, uint(rint(_5009.z))).x;
                                                                    float _1268 = fma(_714, 16.0, _524);
                                                                    float _1270 = _714 * 25.5;
                                                                    float _1272 = -_1268;
                                                                    float _1274 = _1272 + _1266;
                                                                    float _1276 = _1274 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _1278 = precise::max(_1276, _1270);
                                                                    float _1280 = precise::min(0.0, _1278);
                                                                    bool _1282 = _1280 != _1276;
                                                                    bool _1284 = isnan(_1280);
                                                                    bool _1286 = _1282 || _1284;
                                                                    bool _1288 = isnan(_1276);
                                                                    bool _1290 = _1286 || _1288;
                                                                    bool _1292 = !_1290;
                                                                    if (!_1292)
                                                                    {
                                                                        float _1294 = fma(_734, 17.0, _260);
                                                                        float _1296 = fma(_736, 17.0, _262);
                                                                        float3 _5063 = float3(_1296, _1294, float(int(_248)));
                                                                        float3 _5065 = select(_5063, float3(0.0), isnan(_5063));
                                                                        float _1298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5065.xy, uint(rint(_5065.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5065.xy, uint(rint(_5065.z))).x;
                                                                        float _1300 = fma(_714, 17.0, _524);
                                                                        float _1302 = _714 * 27.0;
                                                                        float _1304 = -_1300;
                                                                        float _1306 = _1304 + _1298;
                                                                        float _1308 = _1306 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _1310 = precise::max(_1308, _1302);
                                                                        float _1312 = precise::min(0.0, _1310);
                                                                        bool _1314 = _1312 != _1308;
                                                                        bool _1316 = isnan(_1312);
                                                                        bool _1318 = _1314 || _1316;
                                                                        bool _1320 = isnan(_1308);
                                                                        bool _1322 = _1318 || _1320;
                                                                        bool _1324 = !_1322;
                                                                        if (!_1324)
                                                                        {
                                                                            float _1326 = fma(_734, 18.0, _260);
                                                                            float _1328 = fma(_736, 18.0, _262);
                                                                            float3 _5118 = float3(_1328, _1326, float(int(_248)));
                                                                            float3 _5120 = select(_5118, float3(0.0), isnan(_5118));
                                                                            float _1330 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5120.xy, uint(rint(_5120.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5120.xy, uint(rint(_5120.z))).x;
                                                                            float _1332 = fma(_714, 18.0, _524);
                                                                            float _1334 = _714 * 28.5;
                                                                            float _1336 = -_1332;
                                                                            float _1338 = _1336 + _1330;
                                                                            float _1340 = _1338 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _1342 = precise::max(_1340, _1334);
                                                                            float _1344 = precise::min(0.0, _1342);
                                                                            bool _1346 = _1344 != _1340;
                                                                            bool _1348 = isnan(_1344);
                                                                            bool _1350 = _1346 || _1348;
                                                                            bool _1352 = isnan(_1340);
                                                                            bool _1354 = _1350 || _1352;
                                                                            bool _1356 = !_1354;
                                                                            if (!_1356)
                                                                            {
                                                                                float _1358 = fma(_734, 19.0, _260);
                                                                                float _1360 = fma(_736, 19.0, _262);
                                                                                float3 _5174 = float3(_1360, _1358, float(int(_248)));
                                                                                float3 _5176 = select(_5174, float3(0.0), isnan(_5174));
                                                                                float _1362 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5176.xy, uint(rint(_5176.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5176.xy, uint(rint(_5176.z))).x;
                                                                                float _1364 = fma(_714, 19.0, _524);
                                                                                float _1366 = _714 * 30.0;
                                                                                float _1368 = -_1364;
                                                                                float _1370 = _1368 + _1362;
                                                                                float _1372 = _1370 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _1374 = precise::max(_1372, _1366);
                                                                                float _1376 = precise::min(0.0, _1374);
                                                                                bool _1378 = _1376 != _1372;
                                                                                bool _1380 = isnan(_1376);
                                                                                bool _1382 = _1378 || _1380;
                                                                                bool _1384 = isnan(_1372);
                                                                                bool _1386 = _1382 || _1384;
                                                                                bool _1388 = !_1386;
                                                                                if (!_1388)
                                                                                {
                                                                                    float _1390 = fma(_734, 20.0, _260);
                                                                                    float _1392 = fma(_736, 20.0, _262);
                                                                                    float3 _5230 = float3(_1392, _1390, float(int(_248)));
                                                                                    float3 _5232 = select(_5230, float3(0.0), isnan(_5230));
                                                                                    float _1394 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5232.xy, uint(rint(_5232.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5232.xy, uint(rint(_5232.z))).x;
                                                                                    float _1396 = fma(_714, 20.0, _524);
                                                                                    float _1398 = _714 * 31.5;
                                                                                    float _1400 = -_1396;
                                                                                    float _1402 = _1400 + _1394;
                                                                                    float _1404 = _1402 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                    float _1406 = precise::max(_1404, _1398);
                                                                                    float _1408 = precise::min(0.0, _1406);
                                                                                    bool _1410 = _1408 != _1404;
                                                                                    bool _1412 = isnan(_1408);
                                                                                    bool _1414 = _1410 || _1412;
                                                                                    bool _1416 = isnan(_1404);
                                                                                    bool _1418 = _1414 || _1416;
                                                                                    bool _1420 = !_1418;
                                                                                    if (!_1420)
                                                                                    {
                                                                                        float _1422 = fma(_734, 21.0, _260);
                                                                                        float _1424 = fma(_736, 21.0, _262);
                                                                                        float3 _5285 = float3(_1424, _1422, float(int(_248)));
                                                                                        float3 _5287 = select(_5285, float3(0.0), isnan(_5285));
                                                                                        float _1426 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5287.xy, uint(rint(_5287.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5287.xy, uint(rint(_5287.z))).x;
                                                                                        float _1428 = fma(_714, 21.0, _524);
                                                                                        float _1430 = _714 * 33.0;
                                                                                        float _1432 = -_1428;
                                                                                        float _1434 = _1432 + _1426;
                                                                                        float _1436 = _1434 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                        float _1438 = precise::max(_1436, _1430);
                                                                                        float _1440 = precise::min(0.0, _1438);
                                                                                        bool _1442 = _1440 != _1436;
                                                                                        bool _1444 = isnan(_1440);
                                                                                        bool _1446 = _1442 || _1444;
                                                                                        bool _1448 = isnan(_1436);
                                                                                        bool _1450 = _1446 || _1448;
                                                                                        bool _1452 = !_1450;
                                                                                        if (!_1452)
                                                                                        {
                                                                                            float _1454 = fma(_734, 22.0, _260);
                                                                                            float _1456 = fma(_736, 22.0, _262);
                                                                                            float3 _5341 = float3(_1456, _1454, float(int(_248)));
                                                                                            float3 _5343 = select(_5341, float3(0.0), isnan(_5341));
                                                                                            float _1458 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5343.xy, uint(rint(_5343.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5343.xy, uint(rint(_5343.z))).x;
                                                                                            float _1460 = fma(_714, 22.0, _524);
                                                                                            float _1462 = _714 * 34.5;
                                                                                            float _1464 = -_1460;
                                                                                            float _1466 = _1464 + _1458;
                                                                                            float _1468 = _1466 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                            float _1470 = precise::max(_1468, _1462);
                                                                                            float _1472 = precise::min(0.0, _1470);
                                                                                            bool _1474 = _1472 != _1468;
                                                                                            bool _1476 = isnan(_1472);
                                                                                            bool _1478 = _1474 || _1476;
                                                                                            bool _1480 = isnan(_1468);
                                                                                            bool _1482 = _1478 || _1480;
                                                                                            bool _1484 = !_1482;
                                                                                            if (!_1484)
                                                                                            {
                                                                                                float _1486 = fma(_734, 23.0, _260);
                                                                                                float _1488 = fma(_736, 23.0, _262);
                                                                                                float3 _5397 = float3(_1488, _1486, float(int(_248)));
                                                                                                float3 _5399 = select(_5397, float3(0.0), isnan(_5397));
                                                                                                float _1490 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5399.xy, uint(rint(_5399.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5399.xy, uint(rint(_5399.z))).x;
                                                                                                float _1492 = fma(_714, 23.0, _524);
                                                                                                float _1494 = _714 * 36.0;
                                                                                                float _1496 = -_1492;
                                                                                                float _1498 = _1496 + _1490;
                                                                                                float _1500 = _1498 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                float _1502 = precise::max(_1500, _1494);
                                                                                                float _1504 = precise::min(0.0, _1502);
                                                                                                bool _1506 = _1504 != _1500;
                                                                                                bool _1508 = isnan(_1504);
                                                                                                bool _1510 = _1506 || _1508;
                                                                                                bool _1512 = isnan(_1500);
                                                                                                bool _1514 = _1510 || _1512;
                                                                                                bool _1516 = !_1514;
                                                                                                if (!_1516)
                                                                                                {
                                                                                                    float _1518 = fma(_734, 24.0, _260);
                                                                                                    float _1520 = fma(_736, 24.0, _262);
                                                                                                    float3 _5452 = float3(_1520, _1518, float(int(_248)));
                                                                                                    float3 _5454 = select(_5452, float3(0.0), isnan(_5452));
                                                                                                    float _1522 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5454.xy, uint(rint(_5454.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5454.xy, uint(rint(_5454.z))).x;
                                                                                                    float _1524 = fma(_714, 24.0, _524);
                                                                                                    float _1526 = _714 * 37.5;
                                                                                                    float _1528 = -_1524;
                                                                                                    float _1530 = _1528 + _1522;
                                                                                                    float _1532 = _1530 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                    float _1534 = precise::max(_1532, _1526);
                                                                                                    float _1536 = precise::min(0.0, _1534);
                                                                                                    bool _1538 = _1536 != _1532;
                                                                                                    bool _1540 = isnan(_1536);
                                                                                                    bool _1542 = _1538 || _1540;
                                                                                                    bool _1544 = isnan(_1532);
                                                                                                    bool _1546 = _1542 || _1544;
                                                                                                    bool _1548 = !_1546;
                                                                                                    if (!_1548)
                                                                                                    {
                                                                                                        float _1550 = fma(_734, 25.0, _260);
                                                                                                        float _1552 = fma(_736, 25.0, _262);
                                                                                                        float3 _5508 = float3(_1552, _1550, float(int(_248)));
                                                                                                        float3 _5510 = select(_5508, float3(0.0), isnan(_5508));
                                                                                                        float _1554 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5510.xy, uint(rint(_5510.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5510.xy, uint(rint(_5510.z))).x;
                                                                                                        float _1556 = fma(_714, 25.0, _524);
                                                                                                        float _1558 = _714 * 39.0;
                                                                                                        float _1560 = -_1556;
                                                                                                        float _1562 = _1560 + _1554;
                                                                                                        float _1564 = _1562 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                        float _1566 = precise::max(_1564, _1558);
                                                                                                        float _1568 = precise::min(0.0, _1566);
                                                                                                        bool _1570 = _1568 != _1564;
                                                                                                        bool _1572 = isnan(_1568);
                                                                                                        bool _1574 = _1570 || _1572;
                                                                                                        bool _1576 = isnan(_1564);
                                                                                                        bool _1578 = _1574 || _1576;
                                                                                                        bool _1580 = !_1578;
                                                                                                        if (!_1580)
                                                                                                        {
                                                                                                            float _1582 = fma(_734, 26.0, _260);
                                                                                                            float _1584 = fma(_736, 26.0, _262);
                                                                                                            float3 _5564 = float3(_1584, _1582, float(int(_248)));
                                                                                                            float3 _5566 = select(_5564, float3(0.0), isnan(_5564));
                                                                                                            float _1586 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5566.xy, uint(rint(_5566.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5566.xy, uint(rint(_5566.z))).x;
                                                                                                            float _1588 = fma(_714, 26.0, _524);
                                                                                                            float _1590 = _714 * 40.5;
                                                                                                            float _1592 = -_1588;
                                                                                                            float _1594 = _1592 + _1586;
                                                                                                            float _1596 = _1594 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                            float _1598 = precise::max(_1596, _1590);
                                                                                                            float _1600 = precise::min(0.0, _1598);
                                                                                                            bool _1602 = _1600 != _1596;
                                                                                                            bool _1604 = isnan(_1600);
                                                                                                            bool _1606 = _1602 || _1604;
                                                                                                            bool _1608 = isnan(_1596);
                                                                                                            bool _1610 = _1606 || _1608;
                                                                                                            bool _1612 = !_1610;
                                                                                                            if (!_1612)
                                                                                                            {
                                                                                                                float _1614 = fma(_734, 27.0, _260);
                                                                                                                float _1616 = fma(_736, 27.0, _262);
                                                                                                                float3 _5619 = float3(_1616, _1614, float(int(_248)));
                                                                                                                float3 _5621 = select(_5619, float3(0.0), isnan(_5619));
                                                                                                                float _1618 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5621.xy, uint(rint(_5621.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5621.xy, uint(rint(_5621.z))).x;
                                                                                                                float _1620 = fma(_714, 27.0, _524);
                                                                                                                float _1622 = _714 * 42.0;
                                                                                                                float _1624 = -_1620;
                                                                                                                float _1626 = _1624 + _1618;
                                                                                                                float _1628 = _1626 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                                float _1630 = precise::max(_1628, _1622);
                                                                                                                float _1632 = precise::min(0.0, _1630);
                                                                                                                bool _1634 = _1632 != _1628;
                                                                                                                bool _1636 = isnan(_1632);
                                                                                                                bool _1638 = _1634 || _1636;
                                                                                                                bool _1640 = isnan(_1628);
                                                                                                                bool _1642 = _1638 || _1640;
                                                                                                                bool _1644 = !_1642;
                                                                                                                if (!_1644)
                                                                                                                {
                                                                                                                    float _1646 = fma(_734, 28.0, _260);
                                                                                                                    float _1648 = fma(_736, 28.0, _262);
                                                                                                                    float3 _5675 = float3(_1648, _1646, float(int(_248)));
                                                                                                                    float3 _5677 = select(_5675, float3(0.0), isnan(_5675));
                                                                                                                    float _1650 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5677.xy, uint(rint(_5677.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5677.xy, uint(rint(_5677.z))).x;
                                                                                                                    float _1652 = fma(_714, 28.0, _524);
                                                                                                                    float _1654 = fma(_714, 43.5, -1.0);
                                                                                                                    float _1656 = -_1652;
                                                                                                                    float _1658 = _1656 + _1650;
                                                                                                                    float _1660 = _1658 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                                    float _1662 = precise::max(_1660, _1654);
                                                                                                                    float _1664 = precise::min(0.0, _1662);
                                                                                                                    bool _1666 = _1664 != _1660;
                                                                                                                    bool _1668 = isnan(_1664);
                                                                                                                    bool _1670 = _1666 || _1668;
                                                                                                                    bool _1672 = isnan(_1660);
                                                                                                                    bool _1674 = _1670 || _1672;
                                                                                                                    bool _1676 = !_1674;
                                                                                                                    if (!_1676)
                                                                                                                    {
                                                                                                                        float _1678 = fma(_734, 29.0, _260);
                                                                                                                        float _1680 = fma(_736, 29.0, _262);
                                                                                                                        float3 _5731 = float3(_1680, _1678, float(int(_248)));
                                                                                                                        float3 _5733 = select(_5731, float3(0.0), isnan(_5731));
                                                                                                                        float _1682 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5733.xy, uint(rint(_5733.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5733.xy, uint(rint(_5733.z))).x;
                                                                                                                        float _1684 = fma(_714, 29.0, _524);
                                                                                                                        float _1686 = fma(_714, 45.0, -1.0);
                                                                                                                        float _1688 = -_1684;
                                                                                                                        float _1690 = _1688 + _1682;
                                                                                                                        float _1692 = _1690 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                                        float _1694 = precise::max(_1692, _1686);
                                                                                                                        float _1696 = precise::min(0.0, _1694);
                                                                                                                        bool _1698 = _1696 != _1692;
                                                                                                                        bool _1700 = isnan(_1696);
                                                                                                                        bool _1702 = _1698 || _1700;
                                                                                                                        bool _1704 = isnan(_1692);
                                                                                                                        bool _1706 = _1702 || _1704;
                                                                                                                        if (_1706)
                                                                                                                        {
                                                                                                                            _780 = 0.0;
                                                                                                                        }
                                                                                                                        float _1708 = _780;
                                                                                                                        _1710 = _1708;
                                                                                                                        _1712 = _1706;
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_1712)
    {
        _1710 = 1.0;
    }
    _1712 = false;
    float _1714 = _1710;
    bool _1716 = _272 > 65535u;
    bool _1718 = !_1716;
    float _1720 = _1718 ? as_type<float>(_272) : 9.1834094859526886742986618240905e-41;
    float3 _5824 = float3(_262, _260, float(as_type<int>(_1720)));
    float3 _5826 = select(_5824, float3(0.0), isnan(_5824));
    float _1722 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5826.xy, uint(rint(_5826.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5826.xy, uint(rint(_5826.z))).x;
    float _1724 = _744 * 1.5;
    float _1726 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _1728 = 1.0 + _1726;
    float _1730 = -_524;
    float _1732 = _1730 + _1722;
    float _1734 = _1732 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _1736 = precise::max(_1734, _1724);
    float _1738 = precise::min(0.0, _1736);
    bool _1740 = _1738 != _1734;
    bool _1742 = isnan(_1738);
    bool _1744 = _1740 || _1742;
    bool _1746 = isnan(_1734);
    bool _1748 = _1744 || _1746;
    float _1750 = fma(_1728, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _1752 = _1750 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _1754 = !_1748;
    float _1756 = _1714;
    if (!_1754)
    {
        float _1758 = _260 + _776;
        float _1760 = _262 + _774;
        float3 _5891 = float3(_1760, _1758, float(as_type<int>(_1720)));
        float3 _5893 = select(_5891, float3(0.0), isnan(_5891));
        float _1762 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5893.xy, uint(rint(_5893.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5893.xy, uint(rint(_5893.z))).x;
        float _1764 = _524 + _744;
        float _1766 = _744 * 3.0;
        float _1768 = -_1764;
        float _1770 = _1768 + _1762;
        float _1772 = _1770 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1774 = precise::max(_1772, _1766);
        float _1776 = precise::min(0.0, _1774);
        bool _1778 = _1776 != _1772;
        bool _1780 = isnan(_1776);
        bool _1782 = _1778 || _1780;
        bool _1784 = isnan(_1772);
        bool _1786 = _1782 || _1784;
        bool _1788 = !_1786;
        if (!_1788)
        {
            float _1790 = fma(_776, 2.0, _260);
            float _1792 = fma(_774, 2.0, _262);
            float3 _5945 = float3(_1792, _1790, float(as_type<int>(_1720)));
            float3 _5947 = select(_5945, float3(0.0), isnan(_5945));
            float _1794 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _5947.xy, uint(rint(_5947.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _5947.xy, uint(rint(_5947.z))).x;
            float _1796 = fma(_744, 2.0, _524);
            float _1798 = _744 * 4.5;
            float _1800 = -_1796;
            float _1802 = _1800 + _1794;
            float _1804 = _1802 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1806 = precise::max(_1804, _1798);
            float _1808 = precise::min(0.0, _1806);
            bool _1810 = _1808 != _1804;
            bool _1812 = isnan(_1808);
            bool _1814 = _1810 || _1812;
            bool _1816 = isnan(_1804);
            bool _1818 = _1814 || _1816;
            bool _1820 = !_1818;
            if (!_1820)
            {
                float _1822 = fma(_776, 3.0, _260);
                float _1824 = fma(_774, 3.0, _262);
                float3 _5999 = float3(_1824, _1822, float(as_type<int>(_1720)));
                float3 _6001 = select(_5999, float3(0.0), isnan(_5999));
                float _1826 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6001.xy, uint(rint(_6001.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6001.xy, uint(rint(_6001.z))).x;
                float _1828 = fma(_744, 3.0, _524);
                float _1830 = _744 * 6.0;
                float _1832 = -_1828;
                float _1834 = _1832 + _1826;
                float _1836 = _1834 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1838 = precise::max(_1836, _1830);
                float _1840 = precise::min(0.0, _1838);
                bool _1842 = _1840 != _1836;
                bool _1844 = isnan(_1840);
                bool _1846 = _1842 || _1844;
                bool _1848 = isnan(_1836);
                bool _1850 = _1846 || _1848;
                bool _1852 = !_1850;
                if (!_1852)
                {
                    float _1854 = fma(_776, 4.0, _260);
                    float _1856 = fma(_774, 4.0, _262);
                    float3 _6053 = float3(_1856, _1854, float(as_type<int>(_1720)));
                    float3 _6055 = select(_6053, float3(0.0), isnan(_6053));
                    float _1858 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6055.xy, uint(rint(_6055.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6055.xy, uint(rint(_6055.z))).x;
                    float _1860 = fma(_744, 4.0, _524);
                    float _1862 = _744 * 7.5;
                    float _1864 = -_1860;
                    float _1866 = _1864 + _1858;
                    float _1868 = _1866 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1870 = precise::max(_1868, _1862);
                    float _1872 = precise::min(0.0, _1870);
                    bool _1874 = _1872 != _1868;
                    bool _1876 = isnan(_1872);
                    bool _1878 = _1874 || _1876;
                    bool _1880 = isnan(_1868);
                    bool _1882 = _1878 || _1880;
                    bool _1884 = !_1882;
                    if (!_1884)
                    {
                        float _1886 = fma(_776, 5.0, _260);
                        float _1888 = fma(_774, 5.0, _262);
                        float3 _6107 = float3(_1888, _1886, float(as_type<int>(_1720)));
                        float3 _6109 = select(_6107, float3(0.0), isnan(_6107));
                        float _1890 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6109.xy, uint(rint(_6109.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6109.xy, uint(rint(_6109.z))).x;
                        float _1892 = fma(_744, 5.0, _524);
                        float _1894 = _744 * 9.0;
                        float _1896 = -_1892;
                        float _1898 = _1896 + _1890;
                        float _1900 = _1898 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1902 = precise::max(_1900, _1894);
                        float _1904 = precise::min(0.0, _1902);
                        bool _1906 = _1904 != _1900;
                        bool _1908 = isnan(_1904);
                        bool _1910 = _1906 || _1908;
                        bool _1912 = isnan(_1900);
                        bool _1914 = _1910 || _1912;
                        bool _1916 = !_1914;
                        if (!_1916)
                        {
                            float _1918 = fma(_776, 6.0, _260);
                            float _1920 = fma(_774, 6.0, _262);
                            float3 _6161 = float3(_1920, _1918, float(as_type<int>(_1720)));
                            float3 _6163 = select(_6161, float3(0.0), isnan(_6161));
                            float _1922 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6163.xy, uint(rint(_6163.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6163.xy, uint(rint(_6163.z))).x;
                            float _1924 = fma(_744, 6.0, _524);
                            float _1926 = _744 * 10.5;
                            float _1928 = -_1924;
                            float _1930 = _1928 + _1922;
                            float _1932 = _1930 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1934 = precise::max(_1932, _1926);
                            float _1936 = precise::min(0.0, _1934);
                            bool _1938 = _1936 != _1932;
                            bool _1940 = isnan(_1936);
                            bool _1942 = _1938 || _1940;
                            bool _1944 = isnan(_1932);
                            bool _1946 = _1942 || _1944;
                            bool _1948 = !_1946;
                            if (!_1948)
                            {
                                float _1950 = fma(_776, 7.0, _260);
                                float _1952 = fma(_774, 7.0, _262);
                                float3 _6215 = float3(_1952, _1950, float(as_type<int>(_1720)));
                                float3 _6217 = select(_6215, float3(0.0), isnan(_6215));
                                float _1954 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6217.xy, uint(rint(_6217.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6217.xy, uint(rint(_6217.z))).x;
                                float _1956 = fma(_744, 7.0, _524);
                                float _1958 = _744 * 12.0;
                                float _1960 = -_1956;
                                float _1962 = _1960 + _1954;
                                float _1964 = _1962 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                float _1966 = precise::max(_1964, _1958);
                                float _1968 = precise::min(0.0, _1966);
                                bool _1970 = _1968 != _1964;
                                bool _1972 = isnan(_1968);
                                bool _1974 = _1970 || _1972;
                                bool _1976 = isnan(_1964);
                                bool _1978 = _1974 || _1976;
                                bool _1980 = !_1978;
                                if (!_1980)
                                {
                                    float _1982 = fma(_776, 8.0, _260);
                                    float _1984 = fma(_774, 8.0, _262);
                                    float3 _6269 = float3(_1984, _1982, float(as_type<int>(_1720)));
                                    float3 _6271 = select(_6269, float3(0.0), isnan(_6269));
                                    float _1986 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6271.xy, uint(rint(_6271.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6271.xy, uint(rint(_6271.z))).x;
                                    float _1988 = fma(_744, 8.0, _524);
                                    float _1990 = _744 * 13.5;
                                    float _1992 = -_1988;
                                    float _1994 = _1992 + _1986;
                                    float _1996 = _1994 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                    float _1998 = precise::max(_1996, _1990);
                                    float _2000 = precise::min(0.0, _1998);
                                    bool _2002 = _2000 != _1996;
                                    bool _2004 = isnan(_2000);
                                    bool _2006 = _2002 || _2004;
                                    bool _2008 = isnan(_1996);
                                    bool _2010 = _2006 || _2008;
                                    bool _2012 = !_2010;
                                    if (!_2012)
                                    {
                                        float _2014 = fma(_776, 9.0, _260);
                                        float _2016 = fma(_774, 9.0, _262);
                                        float3 _6323 = float3(_2016, _2014, float(as_type<int>(_1720)));
                                        float3 _6325 = select(_6323, float3(0.0), isnan(_6323));
                                        float _2018 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6325.xy, uint(rint(_6325.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6325.xy, uint(rint(_6325.z))).x;
                                        float _2020 = fma(_744, 9.0, _524);
                                        float _2022 = _744 * 15.0;
                                        float _2024 = -_2020;
                                        float _2026 = _2024 + _2018;
                                        float _2028 = _2026 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                        float _2030 = precise::max(_2028, _2022);
                                        float _2032 = precise::min(0.0, _2030);
                                        bool _2034 = _2032 != _2028;
                                        bool _2036 = isnan(_2032);
                                        bool _2038 = _2034 || _2036;
                                        bool _2040 = isnan(_2028);
                                        bool _2042 = _2038 || _2040;
                                        bool _2044 = !_2042;
                                        if (!_2044)
                                        {
                                            float _2046 = fma(_776, 10.0, _260);
                                            float _2048 = fma(_774, 10.0, _262);
                                            float3 _6377 = float3(_2048, _2046, float(as_type<int>(_1720)));
                                            float3 _6379 = select(_6377, float3(0.0), isnan(_6377));
                                            float _2050 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6379.xy, uint(rint(_6379.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6379.xy, uint(rint(_6379.z))).x;
                                            float _2052 = fma(_744, 10.0, _524);
                                            float _2054 = _744 * 16.5;
                                            float _2056 = -_2052;
                                            float _2058 = _2056 + _2050;
                                            float _2060 = _2058 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                            float _2062 = precise::max(_2060, _2054);
                                            float _2064 = precise::min(0.0, _2062);
                                            bool _2066 = _2064 != _2060;
                                            bool _2068 = isnan(_2064);
                                            bool _2070 = _2066 || _2068;
                                            bool _2072 = isnan(_2060);
                                            bool _2074 = _2070 || _2072;
                                            bool _2076 = !_2074;
                                            if (!_2076)
                                            {
                                                float _2078 = fma(_776, 11.0, _260);
                                                float _2080 = fma(_774, 11.0, _262);
                                                float3 _6431 = float3(_2080, _2078, float(as_type<int>(_1720)));
                                                float3 _6433 = select(_6431, float3(0.0), isnan(_6431));
                                                float _2082 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6433.xy, uint(rint(_6433.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6433.xy, uint(rint(_6433.z))).x;
                                                float _2084 = fma(_744, 11.0, _524);
                                                float _2086 = _744 * 18.0;
                                                float _2088 = -_2084;
                                                float _2090 = _2088 + _2082;
                                                float _2092 = _2090 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                float _2094 = precise::max(_2092, _2086);
                                                float _2096 = precise::min(0.0, _2094);
                                                bool _2098 = _2096 != _2092;
                                                bool _2100 = isnan(_2096);
                                                bool _2102 = _2098 || _2100;
                                                bool _2104 = isnan(_2092);
                                                bool _2106 = _2102 || _2104;
                                                bool _2108 = !_2106;
                                                if (!_2108)
                                                {
                                                    float _2110 = fma(_776, 12.0, _260);
                                                    float _2112 = fma(_774, 12.0, _262);
                                                    float3 _6485 = float3(_2112, _2110, float(as_type<int>(_1720)));
                                                    float3 _6487 = select(_6485, float3(0.0), isnan(_6485));
                                                    float _2114 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6487.xy, uint(rint(_6487.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6487.xy, uint(rint(_6487.z))).x;
                                                    float _2116 = fma(_744, 12.0, _524);
                                                    float _2118 = _744 * 19.5;
                                                    float _2120 = -_2116;
                                                    float _2122 = _2120 + _2114;
                                                    float _2124 = _2122 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                    float _2126 = precise::max(_2124, _2118);
                                                    float _2128 = precise::min(0.0, _2126);
                                                    bool _2130 = _2128 != _2124;
                                                    bool _2132 = isnan(_2128);
                                                    bool _2134 = _2130 || _2132;
                                                    bool _2136 = isnan(_2124);
                                                    bool _2138 = _2134 || _2136;
                                                    bool _2140 = !_2138;
                                                    if (!_2140)
                                                    {
                                                        float _2142 = fma(_776, 13.0, _260);
                                                        float _2144 = fma(_774, 13.0, _262);
                                                        float3 _6539 = float3(_2144, _2142, float(as_type<int>(_1720)));
                                                        float3 _6541 = select(_6539, float3(0.0), isnan(_6539));
                                                        float _2146 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6541.xy, uint(rint(_6541.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6541.xy, uint(rint(_6541.z))).x;
                                                        float _2148 = fma(_744, 13.0, _524);
                                                        float _2150 = _744 * 21.0;
                                                        float _2152 = -_2148;
                                                        float _2154 = _2152 + _2146;
                                                        float _2156 = _2154 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                        float _2158 = precise::max(_2156, _2150);
                                                        float _2160 = precise::min(0.0, _2158);
                                                        bool _2162 = _2160 != _2156;
                                                        bool _2164 = isnan(_2160);
                                                        bool _2166 = _2162 || _2164;
                                                        bool _2168 = isnan(_2156);
                                                        bool _2170 = _2166 || _2168;
                                                        bool _2172 = !_2170;
                                                        if (!_2172)
                                                        {
                                                            float _2174 = fma(_776, 14.0, _260);
                                                            float _2176 = fma(_774, 14.0, _262);
                                                            float3 _6593 = float3(_2176, _2174, float(as_type<int>(_1720)));
                                                            float3 _6595 = select(_6593, float3(0.0), isnan(_6593));
                                                            float _2178 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6595.xy, uint(rint(_6595.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6595.xy, uint(rint(_6595.z))).x;
                                                            float _2180 = fma(_744, 14.0, _524);
                                                            float _2182 = _744 * 22.5;
                                                            float _2184 = -_2180;
                                                            float _2186 = _2184 + _2178;
                                                            float _2188 = _2186 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                            float _2190 = precise::max(_2188, _2182);
                                                            float _2192 = precise::min(0.0, _2190);
                                                            bool _2194 = _2192 != _2188;
                                                            bool _2196 = isnan(_2192);
                                                            bool _2198 = _2194 || _2196;
                                                            bool _2200 = isnan(_2188);
                                                            bool _2202 = _2198 || _2200;
                                                            bool _2204 = !_2202;
                                                            if (!_2204)
                                                            {
                                                                float _2206 = fma(_776, 15.0, _260);
                                                                float _2208 = fma(_774, 15.0, _262);
                                                                float3 _6647 = float3(_2208, _2206, float(as_type<int>(_1720)));
                                                                float3 _6649 = select(_6647, float3(0.0), isnan(_6647));
                                                                float _2210 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6649.xy, uint(rint(_6649.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6649.xy, uint(rint(_6649.z))).x;
                                                                float _2212 = fma(_744, 15.0, _524);
                                                                float _2214 = _744 * 24.0;
                                                                float _2216 = -_2212;
                                                                float _2218 = _2216 + _2210;
                                                                float _2220 = _2218 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                float _2222 = precise::max(_2220, _2214);
                                                                float _2224 = precise::min(0.0, _2222);
                                                                bool _2226 = _2224 != _2220;
                                                                bool _2228 = isnan(_2224);
                                                                bool _2230 = _2226 || _2228;
                                                                bool _2232 = isnan(_2220);
                                                                bool _2234 = _2230 || _2232;
                                                                bool _2236 = !_2234;
                                                                if (!_2236)
                                                                {
                                                                    float _2238 = fma(_776, 16.0, _260);
                                                                    float _2240 = fma(_774, 16.0, _262);
                                                                    float3 _6701 = float3(_2240, _2238, float(as_type<int>(_1720)));
                                                                    float3 _6703 = select(_6701, float3(0.0), isnan(_6701));
                                                                    float _2242 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6703.xy, uint(rint(_6703.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6703.xy, uint(rint(_6703.z))).x;
                                                                    float _2244 = fma(_744, 16.0, _524);
                                                                    float _2246 = _744 * 25.5;
                                                                    float _2248 = -_2244;
                                                                    float _2250 = _2248 + _2242;
                                                                    float _2252 = _2250 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                    float _2254 = precise::max(_2252, _2246);
                                                                    float _2256 = precise::min(0.0, _2254);
                                                                    bool _2258 = _2256 != _2252;
                                                                    bool _2260 = isnan(_2256);
                                                                    bool _2262 = _2258 || _2260;
                                                                    bool _2264 = isnan(_2252);
                                                                    bool _2266 = _2262 || _2264;
                                                                    bool _2268 = !_2266;
                                                                    if (!_2268)
                                                                    {
                                                                        float _2270 = fma(_776, 17.0, _260);
                                                                        float _2272 = fma(_774, 17.0, _262);
                                                                        float3 _6755 = float3(_2272, _2270, float(as_type<int>(_1720)));
                                                                        float3 _6757 = select(_6755, float3(0.0), isnan(_6755));
                                                                        float _2274 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6757.xy, uint(rint(_6757.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6757.xy, uint(rint(_6757.z))).x;
                                                                        float _2276 = fma(_744, 17.0, _524);
                                                                        float _2278 = _744 * 27.0;
                                                                        float _2280 = -_2276;
                                                                        float _2282 = _2280 + _2274;
                                                                        float _2284 = _2282 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                        float _2286 = precise::max(_2284, _2278);
                                                                        float _2288 = precise::min(0.0, _2286);
                                                                        bool _2290 = _2288 != _2284;
                                                                        bool _2292 = isnan(_2288);
                                                                        bool _2294 = _2290 || _2292;
                                                                        bool _2296 = isnan(_2284);
                                                                        bool _2298 = _2294 || _2296;
                                                                        bool _2300 = !_2298;
                                                                        if (!_2300)
                                                                        {
                                                                            float _2302 = fma(_776, 18.0, _260);
                                                                            float _2304 = fma(_774, 18.0, _262);
                                                                            float3 _6809 = float3(_2304, _2302, float(as_type<int>(_1720)));
                                                                            float3 _6811 = select(_6809, float3(0.0), isnan(_6809));
                                                                            float _2306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6811.xy, uint(rint(_6811.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6811.xy, uint(rint(_6811.z))).x;
                                                                            float _2308 = fma(_744, 18.0, _524);
                                                                            float _2310 = _744 * 28.5;
                                                                            float _2312 = -_2308;
                                                                            float _2314 = _2312 + _2306;
                                                                            float _2316 = _2314 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                            float _2318 = precise::max(_2316, _2310);
                                                                            float _2320 = precise::min(0.0, _2318);
                                                                            bool _2322 = _2320 != _2316;
                                                                            bool _2324 = isnan(_2320);
                                                                            bool _2326 = _2322 || _2324;
                                                                            bool _2328 = isnan(_2316);
                                                                            bool _2330 = _2326 || _2328;
                                                                            bool _2332 = !_2330;
                                                                            if (!_2332)
                                                                            {
                                                                                float _2334 = fma(_776, 19.0, _260);
                                                                                float _2336 = fma(_774, 19.0, _262);
                                                                                float3 _6863 = float3(_2336, _2334, float(as_type<int>(_1720)));
                                                                                float3 _6865 = select(_6863, float3(0.0), isnan(_6863));
                                                                                float _2338 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6865.xy, uint(rint(_6865.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6865.xy, uint(rint(_6865.z))).x;
                                                                                float _2340 = fma(_744, 19.0, _524);
                                                                                float _2342 = _744 * 30.0;
                                                                                float _2344 = -_2340;
                                                                                float _2346 = _2344 + _2338;
                                                                                float _2348 = _2346 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                float _2350 = precise::max(_2348, _2342);
                                                                                float _2352 = precise::min(0.0, _2350);
                                                                                bool _2354 = _2352 != _2348;
                                                                                bool _2356 = isnan(_2352);
                                                                                bool _2358 = _2354 || _2356;
                                                                                bool _2360 = isnan(_2348);
                                                                                bool _2362 = _2358 || _2360;
                                                                                bool _2364 = !_2362;
                                                                                if (!_2364)
                                                                                {
                                                                                    float _2366 = fma(_776, 20.0, _260);
                                                                                    float _2368 = fma(_774, 20.0, _262);
                                                                                    float3 _6917 = float3(_2368, _2366, float(as_type<int>(_1720)));
                                                                                    float3 _6919 = select(_6917, float3(0.0), isnan(_6917));
                                                                                    float _2370 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6919.xy, uint(rint(_6919.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6919.xy, uint(rint(_6919.z))).x;
                                                                                    float _2372 = fma(_744, 20.0, _524);
                                                                                    float _2374 = _744 * 31.5;
                                                                                    float _2376 = -_2372;
                                                                                    float _2378 = _2376 + _2370;
                                                                                    float _2380 = _2378 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                    float _2382 = precise::max(_2380, _2374);
                                                                                    float _2384 = precise::min(0.0, _2382);
                                                                                    bool _2386 = _2384 != _2380;
                                                                                    bool _2388 = isnan(_2384);
                                                                                    bool _2390 = _2386 || _2388;
                                                                                    bool _2392 = isnan(_2380);
                                                                                    bool _2394 = _2390 || _2392;
                                                                                    bool _2396 = !_2394;
                                                                                    if (!_2396)
                                                                                    {
                                                                                        float _2398 = fma(_776, 21.0, _260);
                                                                                        float _2400 = fma(_774, 21.0, _262);
                                                                                        float3 _6971 = float3(_2400, _2398, float(as_type<int>(_1720)));
                                                                                        float3 _6973 = select(_6971, float3(0.0), isnan(_6971));
                                                                                        float _2402 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _6973.xy, uint(rint(_6973.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _6973.xy, uint(rint(_6973.z))).x;
                                                                                        float _2404 = fma(_744, 21.0, _524);
                                                                                        float _2406 = _744 * 33.0;
                                                                                        float _2408 = -_2404;
                                                                                        float _2410 = _2408 + _2402;
                                                                                        float _2412 = _2410 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                        float _2414 = precise::max(_2412, _2406);
                                                                                        float _2416 = precise::min(0.0, _2414);
                                                                                        bool _2418 = _2416 != _2412;
                                                                                        bool _2420 = isnan(_2416);
                                                                                        bool _2422 = _2418 || _2420;
                                                                                        bool _2424 = isnan(_2412);
                                                                                        bool _2426 = _2422 || _2424;
                                                                                        bool _2428 = !_2426;
                                                                                        if (!_2428)
                                                                                        {
                                                                                            float _2430 = fma(_776, 22.0, _260);
                                                                                            float _2432 = fma(_774, 22.0, _262);
                                                                                            float3 _7025 = float3(_2432, _2430, float(as_type<int>(_1720)));
                                                                                            float3 _7027 = select(_7025, float3(0.0), isnan(_7025));
                                                                                            float _2434 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7027.xy, uint(rint(_7027.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7027.xy, uint(rint(_7027.z))).x;
                                                                                            float _2436 = fma(_744, 22.0, _524);
                                                                                            float _2438 = _744 * 34.5;
                                                                                            float _2440 = -_2436;
                                                                                            float _2442 = _2440 + _2434;
                                                                                            float _2444 = _2442 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                            float _2446 = precise::max(_2444, _2438);
                                                                                            float _2448 = precise::min(0.0, _2446);
                                                                                            bool _2450 = _2448 != _2444;
                                                                                            bool _2452 = isnan(_2448);
                                                                                            bool _2454 = _2450 || _2452;
                                                                                            bool _2456 = isnan(_2444);
                                                                                            bool _2458 = _2454 || _2456;
                                                                                            bool _2460 = !_2458;
                                                                                            if (!_2460)
                                                                                            {
                                                                                                float _2462 = fma(_776, 23.0, _260);
                                                                                                float _2464 = fma(_774, 23.0, _262);
                                                                                                float3 _7079 = float3(_2464, _2462, float(as_type<int>(_1720)));
                                                                                                float3 _7081 = select(_7079, float3(0.0), isnan(_7079));
                                                                                                float _2466 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7081.xy, uint(rint(_7081.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7081.xy, uint(rint(_7081.z))).x;
                                                                                                float _2468 = fma(_744, 23.0, _524);
                                                                                                float _2470 = _744 * 36.0;
                                                                                                float _2472 = -_2468;
                                                                                                float _2474 = _2472 + _2466;
                                                                                                float _2476 = _2474 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                float _2478 = precise::max(_2476, _2470);
                                                                                                float _2480 = precise::min(0.0, _2478);
                                                                                                bool _2482 = _2480 != _2476;
                                                                                                bool _2484 = isnan(_2480);
                                                                                                bool _2486 = _2482 || _2484;
                                                                                                bool _2488 = isnan(_2476);
                                                                                                bool _2490 = _2486 || _2488;
                                                                                                bool _2492 = !_2490;
                                                                                                if (!_2492)
                                                                                                {
                                                                                                    float _2494 = fma(_776, 24.0, _260);
                                                                                                    float _2496 = fma(_774, 24.0, _262);
                                                                                                    float3 _7133 = float3(_2496, _2494, float(as_type<int>(_1720)));
                                                                                                    float3 _7135 = select(_7133, float3(0.0), isnan(_7133));
                                                                                                    float _2498 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7135.xy, uint(rint(_7135.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7135.xy, uint(rint(_7135.z))).x;
                                                                                                    float _2500 = fma(_744, 24.0, _524);
                                                                                                    float _2502 = _744 * 37.5;
                                                                                                    float _2504 = -_2500;
                                                                                                    float _2506 = _2504 + _2498;
                                                                                                    float _2508 = _2506 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                    float _2510 = precise::max(_2508, _2502);
                                                                                                    float _2512 = precise::min(0.0, _2510);
                                                                                                    bool _2514 = _2512 != _2508;
                                                                                                    bool _2516 = isnan(_2512);
                                                                                                    bool _2518 = _2514 || _2516;
                                                                                                    bool _2520 = isnan(_2508);
                                                                                                    bool _2522 = _2518 || _2520;
                                                                                                    bool _2524 = !_2522;
                                                                                                    if (!_2524)
                                                                                                    {
                                                                                                        float _2526 = fma(_776, 25.0, _260);
                                                                                                        float _2528 = fma(_774, 25.0, _262);
                                                                                                        float3 _7187 = float3(_2528, _2526, float(as_type<int>(_1720)));
                                                                                                        float3 _7189 = select(_7187, float3(0.0), isnan(_7187));
                                                                                                        float _2530 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7189.xy, uint(rint(_7189.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7189.xy, uint(rint(_7189.z))).x;
                                                                                                        float _2532 = fma(_744, 25.0, _524);
                                                                                                        float _2534 = _744 * 39.0;
                                                                                                        float _2536 = -_2532;
                                                                                                        float _2538 = _2536 + _2530;
                                                                                                        float _2540 = _2538 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                        float _2542 = precise::max(_2540, _2534);
                                                                                                        float _2544 = precise::min(0.0, _2542);
                                                                                                        bool _2546 = _2544 != _2540;
                                                                                                        bool _2548 = isnan(_2544);
                                                                                                        bool _2550 = _2546 || _2548;
                                                                                                        bool _2552 = isnan(_2540);
                                                                                                        bool _2554 = _2550 || _2552;
                                                                                                        bool _2556 = !_2554;
                                                                                                        if (!_2556)
                                                                                                        {
                                                                                                            float _2558 = fma(_776, 26.0, _260);
                                                                                                            float _2560 = fma(_774, 26.0, _262);
                                                                                                            float3 _7241 = float3(_2560, _2558, float(as_type<int>(_1720)));
                                                                                                            float3 _7243 = select(_7241, float3(0.0), isnan(_7241));
                                                                                                            float _2562 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7243.xy, uint(rint(_7243.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7243.xy, uint(rint(_7243.z))).x;
                                                                                                            float _2564 = fma(_744, 26.0, _524);
                                                                                                            float _2566 = _744 * 40.5;
                                                                                                            float _2568 = -_2564;
                                                                                                            float _2570 = _2568 + _2562;
                                                                                                            float _2572 = _2570 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                            float _2574 = precise::max(_2572, _2566);
                                                                                                            float _2576 = precise::min(0.0, _2574);
                                                                                                            bool _2578 = _2576 != _2572;
                                                                                                            bool _2580 = isnan(_2576);
                                                                                                            bool _2582 = _2578 || _2580;
                                                                                                            bool _2584 = isnan(_2572);
                                                                                                            bool _2586 = _2582 || _2584;
                                                                                                            bool _2588 = !_2586;
                                                                                                            if (!_2588)
                                                                                                            {
                                                                                                                float _2590 = fma(_776, 27.0, _260);
                                                                                                                float _2592 = fma(_774, 27.0, _262);
                                                                                                                float3 _7295 = float3(_2592, _2590, float(as_type<int>(_1720)));
                                                                                                                float3 _7297 = select(_7295, float3(0.0), isnan(_7295));
                                                                                                                float _2594 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7297.xy, uint(rint(_7297.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7297.xy, uint(rint(_7297.z))).x;
                                                                                                                float _2596 = fma(_744, 27.0, _524);
                                                                                                                float _2598 = _744 * 42.0;
                                                                                                                float _2600 = -_2596;
                                                                                                                float _2602 = _2600 + _2594;
                                                                                                                float _2604 = _2602 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                                float _2606 = precise::max(_2604, _2598);
                                                                                                                float _2608 = precise::min(0.0, _2606);
                                                                                                                bool _2610 = _2608 != _2604;
                                                                                                                bool _2612 = isnan(_2608);
                                                                                                                bool _2614 = _2610 || _2612;
                                                                                                                bool _2616 = isnan(_2604);
                                                                                                                bool _2618 = _2614 || _2616;
                                                                                                                bool _2620 = !_2618;
                                                                                                                if (!_2620)
                                                                                                                {
                                                                                                                    float _2622 = fma(_776, 28.0, _260);
                                                                                                                    float _2624 = fma(_774, 28.0, _262);
                                                                                                                    float3 _7349 = float3(_2624, _2622, float(as_type<int>(_1720)));
                                                                                                                    float3 _7351 = select(_7349, float3(0.0), isnan(_7349));
                                                                                                                    float _2626 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7351.xy, uint(rint(_7351.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7351.xy, uint(rint(_7351.z))).x;
                                                                                                                    float _2628 = fma(_744, 28.0, _524);
                                                                                                                    float _2630 = fma(_744, 43.5, -1.0);
                                                                                                                    float _2632 = -_2628;
                                                                                                                    float _2634 = _2632 + _2626;
                                                                                                                    float _2636 = _2634 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                                    float _2638 = precise::max(_2636, _2630);
                                                                                                                    float _2640 = precise::min(0.0, _2638);
                                                                                                                    bool _2642 = _2640 != _2636;
                                                                                                                    bool _2644 = isnan(_2640);
                                                                                                                    bool _2646 = _2642 || _2644;
                                                                                                                    bool _2648 = isnan(_2636);
                                                                                                                    bool _2650 = _2646 || _2648;
                                                                                                                    bool _2652 = !_2650;
                                                                                                                    if (!_2652)
                                                                                                                    {
                                                                                                                        float _2654 = fma(_776, 29.0, _260);
                                                                                                                        float _2656 = fma(_774, 29.0, _262);
                                                                                                                        float3 _7403 = float3(_2656, _2654, float(as_type<int>(_1720)));
                                                                                                                        float3 _7405 = select(_7403, float3(0.0), isnan(_7403));
                                                                                                                        float _2658 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _7405.xy, uint(rint(_7405.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _7405.xy, uint(rint(_7405.z))).x;
                                                                                                                        float _2660 = fma(_744, 29.0, _524);
                                                                                                                        float _2662 = fma(_744, 45.0, -1.0);
                                                                                                                        float _2664 = -_2660;
                                                                                                                        float _2666 = _2664 + _2658;
                                                                                                                        float _2668 = _2666 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                                                                                                                        float _2670 = precise::max(_2668, _2662);
                                                                                                                        float _2672 = precise::min(0.0, _2670);
                                                                                                                        bool _2674 = _2672 != _2668;
                                                                                                                        bool _2676 = isnan(_2672);
                                                                                                                        bool _2678 = _2674 || _2676;
                                                                                                                        bool _2680 = isnan(_2668);
                                                                                                                        bool _2682 = _2678 || _2680;
                                                                                                                        _2684 = _2682;
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (!_2684)
    {
        float _2686 = _1714 + 1.0;
        _1756 = _2686;
    }
    _2684 = false;
    float _2688 = _1756;
    float _2690 = _2688 * 0.5;
    float _2692 = -_2690;
    float _2694 = fma(_2692, _1752, 1.0);
    out.m_39.x = _2694;
    return out;
}

