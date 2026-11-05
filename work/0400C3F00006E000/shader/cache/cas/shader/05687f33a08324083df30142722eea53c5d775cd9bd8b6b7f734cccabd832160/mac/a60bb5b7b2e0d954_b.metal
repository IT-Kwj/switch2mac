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
    bool _930 = false;
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
    float2 _977 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_977, float2(0.0), isnan(_977))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_977, float2(0.0), isnan(_977))).x;
    float _68 = fma(_62, 2.0, -1.0);
    float _70 = fma(_64, 2.0, -1.0);
    float _72 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _76 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _78 = _76 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _80 = _76 * _74;
    float _82 = _76 * _72;
    bool _86 = _78 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _90 = _80 * _88;
    bool _92 = _78 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _96 = _80 * _94;
    bool _98 = _78 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    float _100 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[3].x, _90);
    bool _102 = !_86;
    int _105 = _102 ? 0 : 1;
    float _107 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[2].x, _96);
    float _109 = -_78;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[3].z, _100);
    float _113 = -_78;
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].z, _107);
    int _117 = 2;
    if (!_86)
    {
        _117 = 1;
    }
    int _119 = _117;
    float _121 = _111 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    int _123 = _119;
    if (!_92)
    {
        _123 = _105;
    }
    int _125 = _123;
    int _127 = _125 + 1;
    int _129 = _127;
    if (!_98)
    {
        _129 = _125;
    }
    int _131 = _129;
    float _133 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _135 = _80 * _133;
    bool _137 = _131 != 1;
    float _139 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[4].x, _135);
    bool _141 = _131 != 0;
    float _143 = _115 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    bool _145 = !_137;
    int _147 = _145 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _149 = -_78;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[4].z, _139);
    bool _153 = !_137;
    int _155 = _153 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _157 = _141 ? as_type<float>(_147) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _159 = _151 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _161 = _141 ? as_type<float>(_155) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _163 = _121 * _157;
    float _165 = fma(_143, _161, _163);
    bool _167 = !_137;
    int _169 = _167 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    bool _171 = !_137;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    bool _175 = !_137;
    int _177 = _175 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    bool _179 = !_137;
    int _181 = _179 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _183 = !_137;
    int _185 = _183 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    bool _187 = !_137;
    int _189 = _187 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _191 = _141 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    float _193 = _141 ? as_type<float>(_181) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _195 = _141 ? as_type<float>(_185) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _197 = _121 * _191;
    float _199 = _141 ? as_type<float>(_169) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _201 = _121 * _193;
    float _203 = _141 ? as_type<float>(_177) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _205 = fma(_159, _195, _165);
    float _207 = _141 ? as_type<float>(_189) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _209 = fma(_143, _199, _197);
    float _211 = fma(_143, _203, _201);
    float _213 = _207 + _205;
    float _215 = float(_131);
    bool _217 = !_137;
    int _219 = _217 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    bool _221 = !_137;
    int _223 = _221 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _225 = 1.0 / _213;
    float _227 = _141 ? as_type<float>(_219) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    bool _229 = !_137;
    int _231 = _229 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    bool _233 = !_137;
    int _235 = _233 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _237 = fma(_159, _227, _211);
    float _239 = _141 ? as_type<float>(_223) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _241 = rint(_215);
    float _243 = precise::max(_241, 0.0);
    uint _246 = uint(_243);
    uint _248 = clamp(_246, 0u, 65535u);
    float _250 = _141 ? as_type<float>(_235) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _252 = _141 ? as_type<float>(_231) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _254 = fma(_159, _239, _209);
    float _256 = _250 + _237;
    float _258 = _252 + _254;
    float _260 = _256 * _225;
    float _262 = _258 * _225;
    float3 _1397 = float3(_262, _260, float(int(_248)));
    float3 _1401 = select(_1397, float3(0.0), isnan(_1397));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1401.xy, uint(rint(_1401.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1401.xy, uint(rint(_1401.z))).x;
    float _266 = _121 * 78.233001708984375;
    float _268 = fma(_159, 12.98980045318603515625, _266);
    float _270 = fma(_143, 12.98980045318603515625, _266);
    float _272 = fma(_143, 45.16400146484375, _268);
    float _274 = fma(_159, 45.16400146484375, _270);
    bool _276 = !_137;
    int _278 = _276 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _280 = _272 + 94.67299652099609375;
    float _282 = _272 + 189.3459930419921875;
    float _284 = _141 ? as_type<float>(_278) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _286 = _280 * 0.15915493667125701904296875;
    float _288 = _282 * 0.15915493667125701904296875;
    float _290 = _274 + 94.67299652099609375;
    float _292 = _274 + 189.3459930419921875;
    float _294 = _121 * _284;
    float _296 = _290 * 0.15915493667125701904296875;
    float _298 = _292 * 0.15915493667125701904296875;
    float _300 = _286 * 6.283185482025146484375;
    float _302 = sin(_300);
    bool _304 = !_137;
    int _306 = _304 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    bool _308 = !_137;
    int _310 = _308 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _312 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _314 = _312 + 1.0;
    float _316 = _141 ? as_type<float>(_306) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _318 = _296 * 6.283185482025146484375;
    float _320 = sin(_318);
    float _322 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _324 = _121 * _316;
    bool _326 = !_137;
    int _328 = _326 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _330 = _288 * 6.283185482025146484375;
    float _332 = sin(_330);
    float _334 = _302 * 43758.546875;
    float _336 = _141 ? as_type<float>(_310) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    bool _338 = !_137;
    int _340 = _338 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    float _342 = _121 * _336;
    float _344 = _298 * 6.283185482025146484375;
    float _346 = sin(_344);
    float _348 = _320 * 43758.546875;
    float _350 = _141 ? as_type<float>(_328) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    bool _352 = !_137;
    int _354 = _352 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    float _356 = _141 ? as_type<float>(_340) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _358 = _121 * _350;
    float _360 = _332 * 43758.546875;
    float _362 = floor(_334);
    bool _364 = !_137;
    int _366 = _364 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _368 = fma(_143, _356, _342);
    float _370 = _141 ? as_type<float>(_354) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _372 = _346 * 43758.546875;
    float _374 = floor(_348);
    float _376 = _141 ? as_type<float>(_366) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _378 = fma(_143, _370, _358);
    bool _380 = !_137;
    int _382 = _380 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _384 = floor(_360);
    float _386 = -_362;
    float _388 = _334 + _386;
    float _390 = _141 ? as_type<float>(_382) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _392 = fma(_388, 2.0, -1.0);
    float _394 = floor(_372);
    float _396 = -_374;
    float _398 = _348 + _396;
    float _400 = fma(_143, _390, _294);
    bool _402 = !_137;
    int _404 = _402 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _406 = fma(_398, 2.0, -1.0);
    bool _408 = !_137;
    int _410 = _408 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _412 = fma(_143, _376, _324);
    float _414 = -_384;
    float _416 = _360 + _414;
    float _418 = _322 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    bool _420 = !_137;
    int _422 = _420 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _424 = fma(_416, 2.0, -1.0);
    float _426 = _418 * _406;
    float _428 = _141 ? as_type<float>(_422) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _430 = _418 * _392;
    float _432 = -_394;
    float _434 = _372 + _432;
    float _436 = _141 ? as_type<float>(_410) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _438 = _426 * _426;
    float _440 = fma(_159, _428, _400);
    float _442 = fma(_434, 2.0, -1.0);
    float _444 = _418 * _424;
    float _446 = fma(_430, _430, _438);
    float _448 = _418 * _442;
    float _450 = fma(_159, _436, _378);
    float _452 = _446 + 1.0;
    float _454 = _448 * _448;
    float _456 = rsqrt(_452);
    bool _458 = !_137;
    int _460 = _458 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    float _462 = fma(_444, _444, _454);
    bool _464 = !_137;
    int _466 = _464 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _468 = _462 + 1.0;
    bool _470 = !_137;
    int _472 = _470 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    bool _474 = !_137;
    int _476 = _474 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _478 = _141 ? as_type<float>(_460) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _480 = rsqrt(_468);
    float _482 = _141 ? as_type<float>(_466) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _484 = _141 ? as_type<float>(_404) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _486 = fma(_159, _478, _412);
    bool _488 = !_137;
    int _490 = _488 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _492 = _482 + _440;
    float _494 = _141 ? as_type<float>(_472) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _496 = fma(_159, _484, _368);
    float _498 = _141 ? as_type<float>(_476) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _500 = fma(_430, _456, _492);
    float _502 = _141 ? as_type<float>(_490) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _504 = _494 + _450;
    float _506 = _498 + _486;
    float _508 = fma(_444, _480, _492);
    float _510 = _502 + _496;
    float _512 = fma(_426, _456, _504);
    float _514 = -_456;
    float _516 = _506 + _514;
    float _518 = -_480;
    float _520 = _506 + _518;
    float _522 = fma(_448, _480, _504);
    float _524 = _510 * _225;
    bool _526 = !_137;
    int _528 = _526 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    bool _530 = !_137;
    int _532 = _530 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    bool _534 = !_137;
    int _536 = _534 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    bool _538 = !_137;
    int _540 = _538 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    bool _542 = !_137;
    int _544 = _542 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _546 = _141 ? as_type<float>(_528) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _548 = _546 * _512;
    float _550 = _546 * _522;
    float _552 = _141 ? as_type<float>(_532) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _554 = _141 ? as_type<float>(_536) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _556 = _141 ? as_type<float>(_540) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _558 = _141 ? as_type<float>(_544) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _560 = _554 * _512;
    bool _562 = !_137;
    int _564 = _562 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _566 = _554 * _522;
    bool _568 = !_137;
    int _570 = _568 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    float _572 = _556 * _512;
    bool _574 = !_137;
    int _576 = _574 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _578 = _556 * _522;
    float _580 = _558 * _512;
    float _582 = _558 * _522;
    float _584 = _141 ? as_type<float>(_564) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _586 = fma(_552, _500, _548);
    float _588 = _141 ? as_type<float>(_570) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _590 = fma(_552, _508, _550);
    float _592 = _141 ? as_type<float>(_576) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _594 = fma(_584, _500, _560);
    float _596 = fma(_588, _500, _572);
    float _598 = fma(_592, _500, _580);
    bool _600 = !_137;
    int _602 = _600 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _604 = fma(_592, _508, _582);
    float _606 = fma(_584, _508, _566);
    float _608 = fma(_588, _508, _578);
    bool _610 = !_137;
    int _612 = _610 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _614 = _141 ? as_type<float>(_602) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    bool _616 = !_137;
    int _618 = _616 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    bool _620 = !_137;
    int _622 = _620 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    float _624 = fma(_614, _516, _598);
    float _626 = _141 ? as_type<float>(_612) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _628 = fma(_614, _520, _604);
    float _630 = _141 ? as_type<float>(_618) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    float _632 = _141 ? as_type<float>(_622) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _634 = _626 + _624;
    float _636 = _626 + _628;
    float _638 = fma(_630, _516, _586);
    float _640 = fma(_632, _520, _606);
    float _642 = 1.0 / _634;
    float _644 = fma(_632, _516, _594);
    bool _646 = !_137;
    int _648 = _646 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _650 = fma(_630, _520, _590);
    float _652 = _141 ? as_type<float>(_648) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _654 = 1.0 / _636;
    bool _656 = !_137;
    int _658 = _656 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _660 = !_137;
    int _662 = _660 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _664 = fma(_652, _520, _608);
    bool _666 = !_137;
    int _668 = _666 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _670 = fma(_652, _516, _596);
    float _672 = _141 ? as_type<float>(_662) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _674 = _141 ? as_type<float>(_668) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _676 = _672 + _670;
    float _678 = _141 ? as_type<float>(_658) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _680 = _642 * 0.5;
    float _682 = _672 + _664;
    float _684 = _674 + _638;
    float _686 = _674 + _650;
    float _688 = _678 + _644;
    float _690 = _678 + _640;
    float _692 = _654 * 0.5;
    float _694 = fma(_676, _680, 0.5);
    float _696 = _688 * _642;
    float _698 = _690 * _654;
    float _700 = fma(_684, _680, 0.5);
    float _702 = fma(_682, _692, 0.5);
    float _704 = -_694;
    float _706 = _524 + _704;
    float _708 = fma(_696, -0.5, 0.5);
    float _710 = fma(_698, -0.5, 0.5);
    float _712 = -_702;
    float _714 = _524 + _712;
    float _716 = _706 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _718 = fma(_686, _692, 0.5);
    float _720 = -_710;
    float _722 = _260 + _720;
    float _724 = -_524;
    float _726 = _724 + _264;
    float _728 = _714 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _730 = _716 * 0.5;
    float _732 = _726 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _734 = _728 * 0.5;
    float _736 = precise::max(_732, _730);
    float _738 = precise::max(_732, _734);
    float _740 = precise::min(0.0, _736);
    float _742 = precise::min(0.0, _738);
    bool _744 = _740 != _732;
    bool _746 = isnan(_740);
    bool _748 = _744 || _746;
    bool _750 = isnan(_732);
    bool _752 = _748 || _750;
    bool _754 = _742 != _732;
    bool _756 = isnan(_742);
    bool _758 = _754 || _756;
    bool _760 = isnan(_732);
    bool _762 = _758 || _760;
    float _764 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _766 = 1.0 + _764;
    float _768 = fma(_766, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _770 = -_718;
    float _772 = _262 + _770;
    float _774 = _718;
    if (!_752)
    {
        _774 = 1.0;
    }
    float _776 = _774;
    bool _778 = !_752;
    float _780 = _776;
    if (!_778)
    {
        float _782 = -_708;
        float _784 = _260 + _782;
        float _786 = -_700;
        float _788 = _262 + _786;
        float _790 = _784 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _792 = _788 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
        float _794 = fma(_790, 0.3333333432674407958984375, _260);
        float _796 = fma(_792, 0.3333333432674407958984375, _262);
        float _798 = fma(_792, 0.666666686534881591796875, _262);
        float _800 = fma(_790, 0.666666686534881591796875, _260);
        float3 _2449 = float3(_796, _794, float(int(_248)));
        float3 _2451 = select(_2449, float3(0.0), isnan(_2449));
        float _802 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2451.xy, uint(rint(_2451.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2451.xy, uint(rint(_2451.z))).x;
        float3 _2460 = float3(_798, _800, float(int(_248)));
        float3 _2462 = select(_2460, float3(0.0), isnan(_2460));
        float _804 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2462.xy, uint(rint(_2462.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2462.xy, uint(rint(_2462.z))).x;
        float _806 = fma(_716, 0.3333333432674407958984375, _524);
        float _808 = _716 + (-1.0);
        float _810 = -_806;
        float _812 = _810 + _802;
        float _814 = _812 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _816 = precise::max(_814, _808);
        float _818 = precise::min(0.0, _816);
        bool _820 = _818 != _814;
        bool _822 = isnan(_818);
        bool _824 = _820 || _822;
        bool _826 = isnan(_814);
        bool _828 = _824 || _826;
        float _830 = _814;
        if (!_828)
        {
            _830 = 1.0;
        }
        float _832 = _830;
        bool _834 = !_828;
        _780 = _832;
        if (!_834)
        {
            float _836 = fma(_716, 0.666666686534881591796875, _524);
            float _838 = fma(_716, 1.5, -1.0);
            float _840 = -_836;
            float _842 = _840 + _804;
            float _844 = _842 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _846 = precise::max(_844, _838);
            float _848 = precise::min(0.0, _846);
            bool _850 = _848 == _844;
            float _852 = float(_850);
            _780 = _852;
        }
    }
    float _854 = _780;
    float _856 = _772 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _858 = _722 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    bool _860 = !_762;
    float _928;
    if (!_860)
    {
        float _862 = fma(_858, 0.3333333432674407958984375, _260);
        float _864 = fma(_856, 0.3333333432674407958984375, _262);
        float _866 = fma(_858, 0.666666686534881591796875, _260);
        float _868 = fma(_856, 0.666666686534881591796875, _262);
        float3 _2569 = float3(_864, _862, float(int(_248)));
        float3 _2571 = select(_2569, float3(0.0), isnan(_2569));
        float _870 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2571.xy, uint(rint(_2571.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2571.xy, uint(rint(_2571.z))).x;
        float3 _2580 = float3(_868, _866, float(int(_248)));
        float3 _2582 = select(_2580, float3(0.0), isnan(_2580));
        float _872 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2582.xy, uint(rint(_2582.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2582.xy, uint(rint(_2582.z))).x;
        float _874 = fma(_728, 0.3333333432674407958984375, _524);
        float _876 = _728 + (-1.0);
        float _878 = -_874;
        float _880 = _878 + _870;
        float _882 = _880 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _884 = precise::max(_882, _876);
        float _886 = precise::min(0.0, _884);
        bool _888 = _886 != _882;
        bool _890 = isnan(_886);
        bool _892 = _888 || _890;
        bool _894 = isnan(_882);
        bool _896 = _892 || _894;
        bool _898 = !_896;
        float _900 = _882;
        if (!_898)
        {
            float _902 = fma(_728, 0.666666686534881591796875, _524);
            float _904 = fma(_728, 1.5, -1.0);
            float _906 = -_902;
            float _908 = _906 + _872;
            float _910 = _908 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _912 = precise::max(_910, _904);
            float _914 = precise::min(0.0, _912);
            bool _916 = _914 != _910;
            bool _918 = isnan(_914);
            bool _920 = _916 || _918;
            bool _922 = isnan(_910);
            bool _924 = _920 || _922;
            if (_924)
            {
                _900 = _854;
            }
            float _926 = _900;
            _928 = _926;
            _930 = _924;
        }
    }
    if (!_930)
    {
        float _932 = _854 + 1.0;
        _928 = _932;
    }
    _930 = false;
    float _934 = _928;
    float _936 = _934 * 0.5;
    float _938 = _768 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _940 = -_936;
    float _942 = fma(_940, _938, 1.0);
    out.m_39.x = _942;
    return out;
}

