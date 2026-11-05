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
    bool _1192 = false;
    bool _970 = false;
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
    float2 _1237 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1237, float2(0.0), isnan(_1237))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1237, float2(0.0), isnan(_1237))).x;
    float _68 = fma(_64, 2.0, -1.0);
    float _70 = fma(_62, 2.0, -1.0);
    float _72 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _74 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].z);
    float _76 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _78 = _74 * _72;
    bool _82 = _76 > (*spvDescriptorSet0.fp_c4)._m0[33].y;
    bool _84 = _76 > (*spvDescriptorSet0.fp_c4)._m0[33].x;
    bool _86 = _76 > (*spvDescriptorSet0.fp_c4)._m0[33].z;
    bool _88 = !_82;
    int _91 = _88 ? 0 : 1;
    int _93 = 2;
    if (!_82)
    {
        _93 = 1;
    }
    int _95 = _93;
    int _97 = _95;
    if (!_84)
    {
        _97 = _91;
    }
    int _99 = _97;
    float _101 = _68 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    int _103 = _99 + 1;
    float _105 = _74 * _101;
    int _107 = _103;
    if (!_86)
    {
        _107 = _99;
    }
    int _109 = _107;
    float _111 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _113 = _105 * _111;
    float _115 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _117 = _105 * _115;
    bool _119 = _109 != 1;
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _123 = _105 * _121;
    float _125 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[3].x, _113);
    float _127 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[2].x, _117);
    bool _129 = _109 != 0;
    float _131 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[4].x, _123);
    bool _133 = !_119;
    int _135 = _133 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].y);
    float _137 = -_76;
    float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[3].z, _125);
    float _141 = -_76;
    float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[2].z, _127);
    bool _145 = !_119;
    int _147 = _145 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].x);
    float _149 = -_76;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[4].z, _131);
    float _153 = _129 ? as_type<float>(_135) : (*spvDescriptorSet0.fp_c4)._m0[24].y;
    float _155 = _139 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _157 = _143 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _159 = _129 ? as_type<float>(_147) : (*spvDescriptorSet0.fp_c4)._m0[24].x;
    float _161 = _151 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _163 = _155 * _153;
    float _165 = fma(_157, _159, _163);
    bool _167 = !_119;
    int _169 = _167 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].y);
    bool _171 = !_119;
    int _173 = _171 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].y);
    bool _175 = !_119;
    int _177 = _175 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].z);
    bool _179 = !_119;
    int _181 = _179 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].x);
    float _183 = _129 ? as_type<float>(_169) : (*spvDescriptorSet0.fp_c4)._m0[21].y;
    bool _185 = !_119;
    int _187 = _185 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].x);
    float _189 = _129 ? as_type<float>(_173) : (*spvDescriptorSet0.fp_c4)._m0[22].y;
    float _191 = _155 * _183;
    bool _193 = !_119;
    int _195 = _193 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[28].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[32].w);
    float _197 = _129 ? as_type<float>(_177) : (*spvDescriptorSet0.fp_c4)._m0[24].z;
    float _199 = _155 * _189;
    float _201 = _129 ? as_type<float>(_181) : (*spvDescriptorSet0.fp_c4)._m0[21].x;
    float _203 = _129 ? as_type<float>(_187) : (*spvDescriptorSet0.fp_c4)._m0[22].x;
    float _205 = fma(_161, _197, _165);
    float _207 = _129 ? as_type<float>(_195) : (*spvDescriptorSet0.fp_c4)._m0[24].w;
    float _209 = fma(_157, _201, _191);
    float _211 = fma(_157, _203, _199);
    float _213 = _207 + _205;
    bool _215 = !_119;
    int _217 = _215 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].z);
    float _219 = 1.0 / _213;
    float _221 = float(_109);
    bool _223 = !_119;
    int _225 = _223 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].z);
    float _227 = _129 ? as_type<float>(_217) : (*spvDescriptorSet0.fp_c4)._m0[22].z;
    bool _229 = !_119;
    int _231 = _229 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[25].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[29].w);
    float _233 = rint(_221);
    float _235 = precise::max(_233, 0.0);
    uint _238 = uint(_235);
    uint _240 = clamp(_238, 0u, 65535u);
    bool _242 = !_119;
    int _244 = _242 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[26].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[30].w);
    float _246 = fma(_161, _227, _211);
    float _248 = _129 ? as_type<float>(_225) : (*spvDescriptorSet0.fp_c4)._m0[21].z;
    float _250 = _129 ? as_type<float>(_244) : (*spvDescriptorSet0.fp_c4)._m0[22].w;
    float _252 = _129 ? as_type<float>(_231) : (*spvDescriptorSet0.fp_c4)._m0[21].w;
    float _254 = fma(_161, _248, _209);
    float _256 = _250 + _246;
    float _258 = _252 + _254;
    float _260 = _256 * _219;
    float _262 = _258 * _219;
    float3 _1657 = float3(_262, _260, float(int(_240)));
    float3 _1661 = select(_1657, float3(0.0), isnan(_1657));
    float _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _1661.xy, uint(rint(_1661.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _1661.xy, uint(rint(_1661.z))).x;
    float _266 = _155 * 78.233001708984375;
    float _268 = fma(_161, 12.98980045318603515625, _266);
    float _270 = fma(_157, 12.98980045318603515625, _266);
    float _272 = fma(_157, 45.16400146484375, _268);
    float _274 = fma(_161, 45.16400146484375, _270);
    bool _276 = !_119;
    int _278 = _276 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].y);
    float _280 = _272 + 94.67299652099609375;
    float _282 = _272 + 189.3459930419921875;
    bool _284 = !_119;
    int _286 = _284 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _288 = _280 * 0.15915493667125701904296875;
    float _290 = _274 + 94.67299652099609375;
    float _292 = _274 + 189.3459930419921875;
    float _294 = _282 * 0.15915493667125701904296875;
    float _296 = _129 ? as_type<float>(_278) : (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _298 = _290 * 0.15915493667125701904296875;
    float _300 = _292 * 0.15915493667125701904296875;
    float _302 = _288 * 6.283185482025146484375;
    float _304 = sin(_302);
    float _306 = _129 ? as_type<float>(_286) : (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _308 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _310 = _308 + 1.0;
    float _312 = _298 * 6.283185482025146484375;
    float _314 = sin(_312);
    float _316 = fma(_310, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    bool _318 = !_119;
    int _320 = _318 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].x);
    bool _322 = !_119;
    int _324 = _322 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].y);
    float _326 = _300 * 6.283185482025146484375;
    float _328 = sin(_326);
    float _330 = _304 * 43758.546875;
    bool _332 = !_119;
    int _334 = _332 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].z);
    float _336 = _129 ? as_type<float>(_324) : (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _338 = _155 * _296;
    float _340 = _129 ? as_type<float>(_320) : (*spvDescriptorSet0.fp_c4)._m0[23].x;
    float _342 = _294 * 6.283185482025146484375;
    float _344 = sin(_342);
    float _346 = _129 ? as_type<float>(_334) : (*spvDescriptorSet0.fp_c4)._m0[23].z;
    float _348 = _328 * 43758.546875;
    bool _350 = !_119;
    int _352 = _350 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].y);
    float _354 = floor(_330);
    float _356 = _129 ? as_type<float>(_352) : (*spvDescriptorSet0.fp_c4)._m0[23].y;
    float _358 = _314 * 43758.546875;
    float _360 = _155 * _306;
    float _362 = _344 * 43758.546875;
    float _364 = _155 * _356;
    float _366 = floor(_358);
    float _368 = _155 * _336;
    bool _370 = !_119;
    int _372 = _370 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _374 = fma(_157, _340, _364);
    float _376 = _129 ? as_type<float>(_372) : (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _378 = floor(_348);
    float _380 = -_354;
    float _382 = _330 + _380;
    float _384 = fma(_157, _376, _360);
    bool _386 = !_119;
    int _388 = _386 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _390 = floor(_362);
    float _392 = -_366;
    float _394 = _358 + _392;
    bool _396 = !_119;
    int _398 = _396 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].x);
    bool _400 = !_119;
    int _402 = _400 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].z);
    float _404 = -_378;
    float _406 = _348 + _404;
    bool _408 = !_119;
    int _410 = _408 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].x);
    float _412 = _129 ? as_type<float>(_398) : (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _414 = fma(_406, 2.0, -1.0);
    float _416 = _129 ? as_type<float>(_410) : (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _418 = -_390;
    float _420 = _362 + _418;
    float _422 = _316 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _424 = fma(_394, 2.0, -1.0);
    float _426 = fma(_382, 2.0, -1.0);
    float _428 = fma(_420, 2.0, -1.0);
    float _430 = _422 * _414;
    float _432 = _422 * _424;
    float _434 = _129 ? as_type<float>(_388) : (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _436 = _422 * _426;
    float _438 = _129 ? as_type<float>(_402) : (*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _440 = _432 * _432;
    float _442 = _422 * _428;
    float _444 = _430 * _430;
    float _446 = fma(_157, _412, _338);
    float _448 = fma(_436, _436, _440);
    float _450 = fma(_157, _416, _368);
    float _452 = fma(_442, _442, _444);
    float _454 = fma(_161, _346, _374);
    float _456 = fma(_161, _434, _384);
    float _458 = _448 + 1.0;
    float _460 = fma(_161, _438, _446);
    float _462 = _452 + 1.0;
    float _464 = rsqrt(_458);
    bool _466 = !_119;
    int _468 = _466 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[27].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[31].w);
    float _470 = rsqrt(_462);
    bool _472 = !_119;
    int _474 = _472 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].z);
    bool _476 = !_119;
    int _478 = _476 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[3].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[6].w);
    bool _480 = !_119;
    int _482 = _480 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[4].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[7].w);
    bool _484 = !_119;
    int _486 = _484 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[5].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _488 = _129 ? as_type<float>(_474) : (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _490 = _129 ? as_type<float>(_468) : (*spvDescriptorSet0.fp_c4)._m0[23].w;
    float _492 = _129 ? as_type<float>(_478) : (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _494 = fma(_161, _488, _450);
    float _496 = _129 ? as_type<float>(_482) : (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _498 = _490 + _454;
    float _500 = _129 ? as_type<float>(_486) : (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _502 = _492 + _456;
    float _504 = _496 + _460;
    float _506 = _500 + _494;
    float _508 = fma(_436, _464, _502);
    float _510 = fma(_442, _470, _502);
    float _512 = fma(_430, _470, _504);
    float _514 = -_470;
    float _516 = _506 + _514;
    float _518 = _498 * _219;
    float _520 = fma(_432, _464, _504);
    bool _522 = !_119;
    int _524 = _522 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].y);
    float _526 = -_464;
    float _528 = _506 + _526;
    bool _530 = !_119;
    int _532 = _530 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].y);
    bool _534 = !_119;
    int _536 = _534 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].y);
    bool _538 = !_119;
    int _540 = _538 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].y) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].y);
    float _542 = _129 ? as_type<float>(_524) : (*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _544 = _129 ? as_type<float>(_532) : (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _546 = _129 ? as_type<float>(_536) : (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _548 = _542 * _520;
    float _550 = _129 ? as_type<float>(_540) : (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _552 = _544 * _520;
    float _554 = _546 * _520;
    float _556 = _550 * _520;
    float _558 = _542 * _512;
    float _560 = _544 * _512;
    bool _562 = !_119;
    int _564 = _562 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].x);
    float _566 = _546 * _512;
    bool _568 = !_119;
    int _570 = _568 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].x);
    float _572 = _550 * _512;
    bool _574 = !_119;
    int _576 = _574 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].x);
    bool _578 = !_119;
    int _580 = _578 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].x) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].x);
    float _582 = _129 ? as_type<float>(_564) : (*spvDescriptorSet0.fp_c4)._m0[9].x;
    float _584 = _129 ? as_type<float>(_570) : (*spvDescriptorSet0.fp_c4)._m0[10].x;
    float _586 = _129 ? as_type<float>(_576) : (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _588 = fma(_582, _508, _548);
    float _590 = _129 ? as_type<float>(_580) : (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _592 = fma(_584, _508, _552);
    float _594 = fma(_582, _510, _558);
    float _596 = fma(_586, _508, _554);
    float _598 = fma(_590, _508, _556);
    float _600 = fma(_584, _510, _560);
    float _602 = fma(_586, _510, _566);
    bool _604 = !_119;
    int _606 = _604 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].z);
    float _608 = fma(_590, _510, _572);
    bool _610 = !_119;
    int _612 = _610 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].z);
    float _614 = _129 ? as_type<float>(_606) : (*spvDescriptorSet0.fp_c4)._m0[9].z;
    bool _616 = !_119;
    int _618 = _616 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[16].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[20].w);
    float _620 = _129 ? as_type<float>(_612) : (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _622 = fma(_614, _528, _588);
    float _624 = fma(_614, _516, _594);
    bool _626 = !_119;
    int _628 = _626 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].z);
    float _630 = fma(_620, _528, _598);
    float _632 = _129 ? as_type<float>(_618) : (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _634 = fma(_620, _516, _608);
    bool _636 = !_119;
    int _638 = _636 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].z) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].z);
    float _640 = _129 ? as_type<float>(_628) : (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _642 = _632 + _630;
    float _644 = _129 ? as_type<float>(_638) : (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _646 = _632 + _634;
    float _648 = fma(_640, _528, _592);
    float _650 = fma(_640, _516, _600);
    float _652 = fma(_644, _528, _596);
    float _654 = 1.0 / _642;
    float _656 = fma(_644, _516, _602);
    bool _658 = !_119;
    int _660 = _658 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[14].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[18].w);
    bool _662 = !_119;
    int _664 = _662 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[13].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[17].w);
    float _666 = 1.0 / _646;
    bool _668 = !_119;
    int _670 = _668 ? as_type<int>((*spvDescriptorSet0.fp_c4)._m0[15].w) : as_type<int>((*spvDescriptorSet0.fp_c4)._m0[19].w);
    float _672 = _129 ? as_type<float>(_660) : (*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _674 = _129 ? as_type<float>(_664) : (*spvDescriptorSet0.fp_c4)._m0[9].w;
    float _676 = _672 + _648;
    float _678 = _129 ? as_type<float>(_670) : (*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _680 = _672 + _650;
    float _682 = _674 + _622;
    float _684 = _654 * 0.5;
    float _686 = _676 * _654;
    float _688 = _678 + _652;
    float _690 = _680 * _666;
    float _692 = fma(_682, _684, 0.5);
    float _694 = fma(_688, _684, 0.5);
    float _696 = _674 + _624;
    float _698 = _666 * 0.5;
    float _700 = fma(_686, -0.5, 0.5);
    float _702 = fma(_690, -0.5, 0.5);
    float _704 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _706 = -_694;
    float _708 = _518 + _706;
    float _710 = -_692;
    float _712 = _262 + _710;
    float _714 = -_700;
    float _716 = _260 + _714;
    float _718 = _678 + _656;
    float _720 = _708 * _704;
    float _722 = _712 * _704;
    float _724 = _716 * _704;
    float _726 = _720 * 1.5;
    float _728 = fma(_696, _698, 0.5);
    float _730 = fma(_718, _698, 0.5);
    float _732 = -_702;
    float _734 = _260 + _732;
    float _736 = (*spvDescriptorSet0.fp_c3)._m0[5].y * 0.14285714924335479736328125;
    float _738 = -_728;
    float _740 = _262 + _738;
    float _742 = -_730;
    float _744 = _518 + _742;
    float _746 = _740 * _736;
    float _748 = _734 * _736;
    float _750 = _744 * _736;
    float _752 = -_518;
    float _754 = _752 + _264;
    float _756 = _754 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _758 = precise::max(_756, _726);
    float _760 = precise::min(0.0, _758);
    bool _762 = _760 != _756;
    bool _764 = isnan(_760);
    bool _766 = _762 || _764;
    bool _768 = isnan(_756);
    bool _770 = _766 || _768;
    bool _772 = !_770;
    float _774 = _722;
    float _968;
    if (!_772)
    {
        float _776 = _260 + _724;
        float _778 = _262 + _722;
        float3 _2674 = float3(_778, _776, float(int(_240)));
        float3 _2676 = select(_2674, float3(0.0), isnan(_2674));
        float _780 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2676.xy, uint(rint(_2676.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2676.xy, uint(rint(_2676.z))).x;
        float _782 = _518 + _720;
        float _784 = _720 * 3.0;
        float _786 = -_782;
        float _788 = _786 + _780;
        float _790 = _788 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _792 = precise::max(_790, _784);
        float _794 = precise::min(0.0, _792);
        bool _796 = _794 != _790;
        bool _798 = isnan(_794);
        bool _800 = _796 || _798;
        bool _802 = isnan(_790);
        bool _804 = _800 || _802;
        bool _806 = !_804;
        if (!_806)
        {
            float _808 = fma(_724, 2.0, _260);
            float _810 = fma(_722, 2.0, _262);
            float3 _2729 = float3(_810, _808, float(int(_240)));
            float3 _2731 = select(_2729, float3(0.0), isnan(_2729));
            float _812 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2731.xy, uint(rint(_2731.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2731.xy, uint(rint(_2731.z))).x;
            float _814 = fma(_720, 2.0, _518);
            float _816 = -_814;
            float _818 = _816 + _812;
            float _820 = _720 * 4.5;
            float _822 = _818 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _824 = precise::max(_822, _820);
            float _826 = precise::min(0.0, _824);
            bool _828 = _826 != _822;
            bool _830 = isnan(_826);
            bool _832 = _828 || _830;
            bool _834 = isnan(_822);
            bool _836 = _832 || _834;
            bool _838 = !_836;
            if (!_838)
            {
                float _840 = fma(_724, 3.0, _260);
                float _842 = fma(_722, 3.0, _262);
                float3 _2784 = float3(_842, _840, float(int(_240)));
                float3 _2786 = select(_2784, float3(0.0), isnan(_2784));
                float _844 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2786.xy, uint(rint(_2786.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2786.xy, uint(rint(_2786.z))).x;
                float _846 = _518 + _784;
                float _848 = -_846;
                float _850 = _848 + _844;
                float _852 = _720 * 6.0;
                float _854 = _850 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _856 = precise::max(_854, _852);
                float _858 = precise::min(0.0, _856);
                bool _860 = _858 != _854;
                bool _862 = isnan(_858);
                bool _864 = _860 || _862;
                bool _866 = isnan(_854);
                bool _868 = _864 || _866;
                bool _870 = !_868;
                if (!_870)
                {
                    float _872 = fma(_724, 4.0, _260);
                    float _874 = fma(_722, 4.0, _262);
                    float3 _2840 = float3(_874, _872, float(int(_240)));
                    float3 _2842 = select(_2840, float3(0.0), isnan(_2840));
                    float _876 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2842.xy, uint(rint(_2842.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2842.xy, uint(rint(_2842.z))).x;
                    float _878 = fma(_720, 4.0, _518);
                    float _880 = -_878;
                    float _882 = _880 + _876;
                    float _884 = _720 * 7.5;
                    float _886 = _882 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _888 = precise::max(_886, _884);
                    float _890 = precise::min(0.0, _888);
                    bool _892 = _890 != _886;
                    bool _894 = isnan(_890);
                    bool _896 = _892 || _894;
                    bool _898 = isnan(_886);
                    bool _900 = _896 || _898;
                    bool _902 = !_900;
                    if (!_902)
                    {
                        float _904 = fma(_724, 5.0, _260);
                        float _906 = fma(_722, 5.0, _262);
                        float3 _2896 = float3(_906, _904, float(int(_240)));
                        float3 _2898 = select(_2896, float3(0.0), isnan(_2896));
                        float _908 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2898.xy, uint(rint(_2898.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2898.xy, uint(rint(_2898.z))).x;
                        float _910 = fma(_720, 5.0, _518);
                        float _912 = -_910;
                        float _914 = _912 + _908;
                        float _916 = fma(_720, 9.0, -1.0);
                        float _918 = _914 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _920 = precise::max(_918, _916);
                        float _922 = precise::min(0.0, _920);
                        bool _924 = _922 != _918;
                        bool _926 = isnan(_922);
                        bool _928 = _924 || _926;
                        bool _930 = isnan(_918);
                        bool _932 = _928 || _930;
                        bool _934 = !_932;
                        if (!_934)
                        {
                            float _936 = fma(_724, 6.0, _260);
                            float _938 = fma(_722, 6.0, _262);
                            float3 _2951 = float3(_938, _936, float(int(_240)));
                            float3 _2953 = select(_2951, float3(0.0), isnan(_2951));
                            float _940 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2953.xy, uint(rint(_2953.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2953.xy, uint(rint(_2953.z))).x;
                            float _942 = _518 + _852;
                            float _944 = fma(_720, 10.5, -1.0);
                            float _946 = -_942;
                            float _948 = _946 + _940;
                            float _950 = _948 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _952 = precise::max(_950, _944);
                            float _954 = precise::min(0.0, _952);
                            bool _956 = _954 != _950;
                            bool _958 = isnan(_954);
                            bool _960 = _956 || _958;
                            bool _962 = isnan(_950);
                            bool _964 = _960 || _962;
                            if (_964)
                            {
                                _774 = 0.0;
                            }
                            float _966 = _774;
                            _968 = _966;
                            _970 = _964;
                        }
                    }
                }
            }
        }
    }
    if (!_970)
    {
        _968 = 1.0;
    }
    _970 = false;
    float _972 = _968;
    float _974 = _750 * 1.5;
    float _976 = precise::max(_756, _974);
    float _978 = -(*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _980 = 1.0 + _978;
    float _982 = precise::min(0.0, _976);
    bool _984 = _982 != _756;
    bool _986 = isnan(_982);
    bool _988 = _984 || _986;
    bool _990 = isnan(_756);
    bool _992 = _988 || _990;
    float _994 = fma(_980, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _996 = _994 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    bool _998 = !_992;
    float _1000 = _972;
    if (!_998)
    {
        float _1002 = _260 + _748;
        float _1004 = _262 + _746;
        float3 _3059 = float3(_1004, _1002, float(int(_240)));
        float3 _3061 = select(_3059, float3(0.0), isnan(_3059));
        float _1006 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3061.xy, uint(rint(_3061.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3061.xy, uint(rint(_3061.z))).x;
        float _1008 = _518 + _750;
        float _1010 = _750 * 3.0;
        float _1012 = -_1008;
        float _1014 = _1012 + _1006;
        float _1016 = _1014 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
        float _1018 = precise::max(_1016, _1010);
        float _1020 = precise::min(0.0, _1018);
        bool _1022 = _1020 != _1016;
        bool _1024 = isnan(_1020);
        bool _1026 = _1022 || _1024;
        bool _1028 = isnan(_1016);
        bool _1030 = _1026 || _1028;
        bool _1032 = !_1030;
        if (!_1032)
        {
            float _1034 = fma(_748, 2.0, _260);
            float _1036 = fma(_746, 2.0, _262);
            float3 _3113 = float3(_1036, _1034, float(int(_240)));
            float3 _3115 = select(_3113, float3(0.0), isnan(_3113));
            float _1038 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3115.xy, uint(rint(_3115.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3115.xy, uint(rint(_3115.z))).x;
            float _1040 = fma(_750, 2.0, _518);
            float _1042 = _750 * 4.5;
            float _1044 = -_1040;
            float _1046 = _1044 + _1038;
            float _1048 = _1046 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
            float _1050 = precise::max(_1048, _1042);
            float _1052 = precise::min(0.0, _1050);
            bool _1054 = _1052 != _1048;
            bool _1056 = isnan(_1052);
            bool _1058 = _1054 || _1056;
            bool _1060 = isnan(_1048);
            bool _1062 = _1058 || _1060;
            bool _1064 = !_1062;
            if (!_1064)
            {
                float _1066 = fma(_748, 3.0, _260);
                float _1068 = fma(_746, 3.0, _262);
                float3 _3167 = float3(_1068, _1066, float(int(_240)));
                float3 _3169 = select(_3167, float3(0.0), isnan(_3167));
                float _1070 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3169.xy, uint(rint(_3169.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3169.xy, uint(rint(_3169.z))).x;
                float _1072 = _518 + _1010;
                float _1074 = -_1072;
                float _1076 = _1074 + _1070;
                float _1078 = _750 * 6.0;
                float _1080 = _1076 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                float _1082 = precise::max(_1080, _1078);
                float _1084 = precise::min(0.0, _1082);
                bool _1086 = _1084 != _1080;
                bool _1088 = isnan(_1084);
                bool _1090 = _1086 || _1088;
                bool _1092 = isnan(_1080);
                bool _1094 = _1090 || _1092;
                bool _1096 = !_1094;
                if (!_1096)
                {
                    float _1098 = fma(_748, 4.0, _260);
                    float _1100 = fma(_746, 4.0, _262);
                    float3 _3221 = float3(_1100, _1098, float(int(_240)));
                    float3 _3223 = select(_3221, float3(0.0), isnan(_3221));
                    float _1102 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3223.xy, uint(rint(_3223.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3223.xy, uint(rint(_3223.z))).x;
                    float _1104 = fma(_750, 4.0, _518);
                    float _1106 = -_1104;
                    float _1108 = _1106 + _1102;
                    float _1110 = _750 * 7.5;
                    float _1112 = _1108 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                    float _1114 = precise::max(_1112, _1110);
                    float _1116 = precise::min(0.0, _1114);
                    bool _1118 = _1116 != _1112;
                    bool _1120 = isnan(_1116);
                    bool _1122 = _1118 || _1120;
                    bool _1124 = isnan(_1112);
                    bool _1126 = _1122 || _1124;
                    bool _1128 = !_1126;
                    if (!_1128)
                    {
                        float _1130 = fma(_748, 5.0, _260);
                        float _1132 = fma(_746, 5.0, _262);
                        float3 _3275 = float3(_1132, _1130, float(int(_240)));
                        float3 _3277 = select(_3275, float3(0.0), isnan(_3275));
                        float _1134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3277.xy, uint(rint(_3277.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3277.xy, uint(rint(_3277.z))).x;
                        float _1136 = fma(_750, 5.0, _518);
                        float _1138 = -_1136;
                        float _1140 = _1138 + _1134;
                        float _1142 = fma(_750, 9.0, -1.0);
                        float _1144 = _1140 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                        float _1146 = precise::max(_1144, _1142);
                        float _1148 = precise::min(0.0, _1146);
                        bool _1150 = _1148 != _1144;
                        bool _1152 = isnan(_1148);
                        bool _1154 = _1150 || _1152;
                        bool _1156 = isnan(_1144);
                        bool _1158 = _1154 || _1156;
                        bool _1160 = !_1158;
                        if (!_1160)
                        {
                            float _1162 = fma(_746, 6.0, _262);
                            float _1164 = fma(_748, 6.0, _260);
                            float3 _3329 = float3(_1162, _1164, float(int(_240)));
                            float3 _3331 = select(_3329, float3(0.0), isnan(_3329));
                            float _1166 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _3331.xy, uint(rint(_3331.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _3331.xy, uint(rint(_3331.z))).x;
                            float _1168 = _518 + _1078;
                            float _1170 = fma(_750, 10.5, -1.0);
                            float _1172 = -_1168;
                            float _1174 = _1172 + _1166;
                            float _1176 = _1174 + (*spvDescriptorSet0.fp_c3)._m0[5].x;
                            float _1178 = precise::max(_1176, _1170);
                            float _1180 = precise::min(0.0, _1178);
                            bool _1182 = _1180 != _1176;
                            bool _1184 = isnan(_1180);
                            bool _1186 = _1182 || _1184;
                            bool _1188 = isnan(_1176);
                            bool _1190 = _1186 || _1188;
                            _1192 = _1190;
                        }
                    }
                }
            }
        }
    }
    if (!_1192)
    {
        float _1194 = _972 + 1.0;
        _1000 = _1194;
    }
    _1192 = false;
    float _1196 = _1000;
    float _1198 = _1196 * 0.5;
    float _1200 = -_1198;
    float _1202 = fma(_1200, _996, 1.0);
    out.m_39.x = _1202;
    return out;
}

