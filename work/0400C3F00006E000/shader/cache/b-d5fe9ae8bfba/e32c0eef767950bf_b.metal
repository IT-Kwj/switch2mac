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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_69 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_49 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    float _116 = _114;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1823 = as_type<float>(_122);
        out.gl_Position.z = _1823;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_47.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_104);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    if (_152)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _112;
    if (_152)
    {
        out.m_45.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1892 = as_type<float>(_158);
        out.gl_Position.z = _1892;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_49.w;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _164 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _176 = in.m_51.x;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _184;
    float _188 = in.m_55.w;
    float _190 = 0.0;
    float _192 = _164;
    if (_172)
    {
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _190 = _194;
    }
    float _196 = _190;
    float _198 = in.m_47.x;
    float _200 = in.m_47.y;
    float _202 = in.m_47.z;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[194].y + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _216 = _160 * 78.233001708984375;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _226;
    float _230 = -_162;
    float _232 = fma(_174, _230, _168);
    float _234 = fma(_166, 12.98980045318603515625, _216);
    bool _236 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.0);
    bool _244 = _240 || _242;
    float _246 = fma(_210, _168, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _248 = floor(_232);
    float _250 = _234 * 0.15915493667125701904296875;
    float _252 = 0.0;
    float _254 = _196;
    if (_172)
    {
        float _256 = _176 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _252 = _256;
    }
    float _258 = _252;
    float _260 = fma(_224, _166, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _262 = fma(_228, _170, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _264 = precise::max(_246, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _266 = _250 * 6.283185482025146484375;
    float _268 = sin(_266);
    float _270 = precise::max(_260, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _272 = precise::max(_262, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _274 = precise::min(_264, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _276 = precise::min(_270, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _278 = -_248;
    float _280 = _232 + _278;
    float _282 = 1.0 / _186;
    float _284 = in.m_42.x;
    float _286 = in.m_42.y;
    float _288 = in.m_42.z;
    float _290 = precise::min(_272, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _292 = 0.0;
    if (_172)
    {
        float _294 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[14].x, _280);
        _292 = _294;
    }
    float _296 = _292;
    float _298 = -_274;
    float _300 = _298 + _180;
    float _302 = -_276;
    float _304 = _302 + _178;
    float _306 = _280 * _280;
    float _308 = _268 * 43758.546875;
    float _310 = _296;
    if (_172)
    {
        float _312 = _296 * _196;
        _310 = _312;
    }
    float _314 = _310;
    float _316 = 1.0 / _214;
    if (!_244)
    {
        float _318 = _164 * _164;
        float _320 = _318 * 0.5;
        _254 = _320;
    }
    float _322 = _254;
    float _324 = -_290;
    float _326 = _324 + _182;
    float _328 = _322;
    if (!_244)
    {
        float _330 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _328 = _330;
    }
    float _332 = _328;
    float _334 = 1.0 / _206;
    float _336 = 1.0 / _220;
    float _338 = floor(_308);
    float _340 = 0.0;
    float _342 = _332;
    if (_172)
    {
        float _344 = floor(_314);
        _340 = _344;
    }
    float _346 = _340;
    bool _348 = !_244;
    float _350 = 0.0;
    if (!_348)
    {
        float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = log2(_352);
        float _356 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _358 = _356 + 1.0;
        float _360 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = _164 * _354;
        float _364 = 1.0 / _358;
        float _366 = _360 * 0.693147182464599609375;
        float _368 = exp2(_362);
        float _370 = 1.0 / _366;
        float _372 = _368 + (-1.0);
        float _374 = -_372;
        float _376 = fma(_374, _370, _164);
        float _378 = _376 * _364;
        float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _380;
        _350 = _370;
    }
    float _382 = _342;
    float _384 = _350;
    bool _386 = !_244;
    float _388 = _384;
    if (!_386)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _164 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _192 = _408;
    }
    float _410 = _192;
    float _412 = _306 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _414 = -_338;
    float _416 = _308 + _414;
    float _418 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_172)
    {
        _388 = _280;
    }
    float _420 = _388;
    float _422 = fma(_210, _412, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _424 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _426 = _420;
    if (_172)
    {
        float _428 = -_346;
        float _430 = _314 + _428;
        _426 = _430;
    }
    float _432 = _426;
    float _434 = fma(_410, _200, _418);
    float _436 = fma(_410, _198, _424);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _442 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _444;
    float _448 = fma(_436, _188, _284);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _450;
    float _454 = 1.0 / _440;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _458 = _432 + _456;
    float _460 = fma(_434, _188, _286);
    float _462 = fma(_410, _202, _442);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _466 = _432 + _464;
    float _468 = _458 * _282;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _472 = _432 + _470;
    float _474 = fma(_462, _188, _288);
    float _476 = 1.0 / _452;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _480 = _432 + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _484 = _432 + _482;
    float _486 = _466 * _316;
    float _488 = _480 * _334;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _492 = _432 + _490;
    float _494 = 1.0 / _446;
    float _496 = _484 * _454;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _508 = _432 + _506;
    float _510 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _512 = _472 * _336;
    float _514 = _492 * _476;
    float _516 = fma(_504, _468, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _538 = fma(_528, _468, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _540;
    bool _544 = _416 >= 0.5;
    bool _546 = isnan(_416);
    bool _548 = _544 || _546;
    bool _550 = isnan(0.5);
    bool _552 = _548 || _550;
    float _554 = fma(_520, _488, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _556 = fma(_524, _488, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _558 = fma(_542, _488, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _560 = fma(_532, _512, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _562 = fma(_536, _512, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _572 = !_552;
    float _574 = _572 ? (-1.0) : 1.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    bool _580 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _582 = isnan(_432);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _508 * _494;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _602;
    float _606 = _306 * 5.0;
    float _608 = fma(_566, _486, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _610 = fma(_570, _486, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _612 = fma(_578, _486, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _614;
    float _618 = _574 * 0.4000000059604644775390625;
    bool _620 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _622 = isnan(_432);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_590;
    float _634 = _632 + 1.0;
    float _636 = fma(_596, _512, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _638 = fma(_600, _592, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _640 = fma(_604, _592, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _642 = fma(_616, _592, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _644 = _606 * _618;
    float _646 = _630 * _634;
    bool _648 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _650 = isnan(_432);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -_630;
    float _662 = _660 + 1.0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _668 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _670 = isnan(_432);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_416, 3.1415927410125732421875, _644);
    bool _682 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _684 = isnan(_432);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -_658;
    float _696 = _694 + 1.0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _702 = -_678;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    bool _710 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _712 = isnan(_432);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = _658 * _662;
    float _724 = -_692;
    float _726 = _724 + 1.0;
    float _728 = _678 * _696;
    float _730 = _680 * 0.15915493667125701904296875;
    bool _732 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _734 = isnan(_432);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _692 * _704;
    bool _746 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _748 = isnan(_432);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_700, _496, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _760 = fma(_666, _496, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _762 = fma(_708, _496, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _764 = _720 * _726;
    float _766 = -_720;
    float _768 = _766 + 1.0;
    float _770 = _730 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = -_742;
    float _776 = _774 + 1.0;
    float _778 = _538 * _764;
    float _780 = _510 * _764;
    float _782 = _516 * _764;
    float _784 = _590 * _776;
    float _786 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[159].x, _778);
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[159].y, _780);
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[159].z, _782);
    float _792 = -_756;
    float _794 = _792 + 1.0;
    float _796 = fma(_608, _744, _786);
    float _798 = fma(_610, _744, _788);
    float _800 = fma(_612, _744, _790);
    float _802 = _742 * _794;
    float _804 = fma(_554, _728, _796);
    float _806 = fma(_556, _728, _798);
    float _808 = _772 * 1.256637096405029296875;
    float _810 = fma(_558, _728, _800);
    float _812 = fma(_560, _722, _804);
    float _814 = fma(_562, _722, _806);
    float _816 = _808 * 0.15915493667125701904296875;
    float _818 = fma(_638, _646, _812);
    float _820 = fma(_636, _722, _810);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _822;
    float _826 = fma(_640, _646, _814);
    float _828 = _816 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = fma(_758, _784, _818);
    float _834 = fma(_824, _514, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _836 = _644 * 0.15915493667125701904296875;
    float _838 = fma(_642, _646, _820);
    float _840 = fma(_834, _802, _832);
    float _842 = _816 * 6.283185482025146484375;
    float _844 = cos(_842);
    float _846 = in.m_55.x;
    float _848 = in.m_55.y;
    float _850 = in.m_55.z;
    float _852 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _840);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _854;
    float _858 = fma(_762, _784, _838);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _860;
    float _864 = _852 * _326;
    float _866 = fma(_856, _514, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _868 = _836 * 6.283185482025146484375;
    float _870 = cos(_868);
    float _872 = fma(_862, _514, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _874 = _852 * _300;
    float _876 = _864 * _830;
    float _878 = fma(_866, _802, _858);
    float _880 = fma(_760, _784, _826);
    float _882 = _852 * _304;
    float _884 = _836 * 6.283185482025146484375;
    float _886 = sin(_884);
    float _888 = _864 * _844;
    float _890 = -_876;
    float _892 = fma(_874, _844, _890);
    float _894 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].z, _878);
    float _896 = fma(_872, _802, _880);
    float _898 = fma(_874, _830, _888);
    float _900 = _892 * _870;
    float _902 = fma(_290, _894, _898);
    float _904 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].y, _896);
    float _906 = _850 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _908 = _848 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _910 = _846 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _912 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _892 * _886;
    float _916 = fma(_882, _886, _900);
    float _918 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _920 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _922 = -_914;
    float _924 = fma(_882, _870, _922);
    float _926 = _916 + _422;
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _902);
    float _930 = fma(_276, _904, _924);
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _926);
    float _934 = _928 * _912;
    float _936 = _460 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _930);
    float _940 = _932 * _918;
    float _942 = _460 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _944 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _936);
    float _946 = _938 * _920;
    float _948 = _940 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _950 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _942);
    float _952 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].z, _944);
    float _954 = _940 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[10].x, _948);
    float _958 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].z, _950);
    float _960 = _952 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _962 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _964 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].z, _956);
    float _966 = _958 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _968 = _460 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _970 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].z, _962);
    float _972 = _960 + _964;
    float _974 = _940 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _976 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _968);
    float _978 = _966 + _970;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _982 = _972 + _980;
    float _984 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[9].x, _974);
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _988 = _978 + _986;
    float _990 = _982 * _982;
    float _992 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].z, _984);
    float _994 = fma(_988, _988, _990);
    float _996 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].z, _976);
    float _998 = sqrt(_994);
    float _1000 = _996 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1002 = _1000 + _992;
    bool _1004 = _998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1006 = _448;
    float _1008 = _474;
    float _1010 = _976;
    if (!_1004)
    {
        _1006 = _978;
    }
    float _1012 = _1006;
    float _1014 = _1012;
    if (!_1004)
    {
        _1008 = _972;
    }
    float _1016 = _1008;
    float _1018 = _1016;
    if (!_1004)
    {
        _1010 = _1002;
    }
    float _1020 = _1010;
    bool _1022 = !_1004;
    float _1024 = _1020;
    if (!_1022)
    {
        float _1026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1030 = _998 + _1028;
        float _1032 = rsqrt(_994);
        float _1034 = _1030 * _1026;
        float _1036 = _1002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = _1034 * 0.15915493667125701904296875;
        float _1040 = _1038 * 6.283185482025146484375;
        float _1042 = cos(_1040);
        float _1044 = _1038 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        float _1048 = _1042 + (-1.0);
        float _1050 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = fma(_1046, _1036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1054 = fma(_1002, _1042, _1050);
        float _1056 = _1032 * _1052;
        float _1058 = fma(_988, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1060 = fma(_982, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1024 = _1054;
        _1014 = _1058;
        _1018 = _1060;
    }
    float _1062 = _1024;
    float _1064 = _1014;
    float _1066 = _1018;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1070 = _1062 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1074 = _1064 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1078 = _1066 + _1076;
    float _1080 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1082 = _1070 * _1070;
    float _1084 = fma(_1074, _1074, _1082);
    float _1086 = fma(_1078, _1078, _1084);
    float _1088 = rsqrt(_1086);
    float _1090 = sqrt(_1086);
    float _1092 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1094 = _1074 * _1092;
    float _1096 = _1078 * _1092;
    float _1098 = _1094 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 + _1100;
    float _1104 = sqrt(_1102);
    bool _1106 = _1104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1104 + _1108;
    float _1112 = _1078;
    float _1114 = _1102;
    float _1116 = _1110;
    float _1118 = _1082;
    float _1120 = _1092;
    if (_1106)
    {
        float _1122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1122;
    }
    float _1124 = _1112;
    if (_1106)
    {
        float _1126 = rsqrt(_1102);
        _1114 = _1126;
    }
    float _1128 = _1114;
    float _1130 = _1128;
    if (_1106)
    {
        float _1132 = _1110 * _1124;
        _1116 = _1132;
    }
    float _1134 = _1116;
    if (_1106)
    {
        float _1136 = _1134 * 0.15915493667125701904296875;
        _1118 = _1136;
    }
    float _1138 = _1118;
    float _1140 = _1124;
    float _1142 = _1138;
    if (_1106)
    {
        float _1144 = _1138 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        _1140 = _1146;
    }
    float _1148 = _1140;
    float _1150 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1152 = precise::max(0.0, _1150);
    float _1154 = _978;
    float _1156 = _1152;
    if (_1106)
    {
        float _1158 = _1138 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        _1154 = _1160;
    }
    float _1162 = _1154;
    float _1164 = -_1092;
    float _1166 = -_1152;
    float _1168 = fma(_1070, _1164, _1166);
    float _1170 = _1168;
    if (_1106)
    {
        float _1172 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1172;
    }
    float _1174 = _1156;
    float _1176 = _1148;
    float _1178 = _1174;
    if (_1106)
    {
        float _1180 = fma(_1148, _1174, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1176 = _1180;
    }
    float _1182 = _1176;
    float _1184 = _1182;
    float _1186 = _1162;
    if (_1106)
    {
        float _1188 = _1162 + (-1.0);
        _1178 = _1188;
    }
    float _1190 = _1178;
    float _1192 = _1190;
    if (_1106)
    {
        float _1194 = _1128 * _1182;
        _1120 = _1194;
    }
    float _1196 = _1120;
    if (!_1106)
    {
        _1184 = _1094;
    }
    float _1198 = _1184;
    float _1200 = _1198;
    if (_1106)
    {
        float _1202 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1142 = _1202;
    }
    float _1204 = _1142;
    if (_1106)
    {
        float _1206 = _1094 * _1196;
        _1200 = _1206;
    }
    float _1208 = _1200;
    if (!_1106)
    {
        _1192 = _1096;
    }
    float _1210 = _1192;
    float _1212 = _1210;
    if (_1106)
    {
        float _1214 = _1096 * _1196;
        _1212 = _1214;
    }
    float _1216 = _1212;
    if (!_1106)
    {
        _1130 = _1098;
    }
    float _1218 = _1130;
    float _1220 = _1218;
    if (_1106)
    {
        float _1222 = fma(_1168, _1162, _1204);
        _1170 = _1222;
    }
    float _1224 = _1170;
    if (_1106)
    {
        float _1226 = _1208 * _1208;
        _1220 = _1226;
    }
    float _1228 = _1220;
    if (!_1106)
    {
        _1186 = _1100;
    }
    float _1230 = _1186;
    float _1232 = _1230;
    if (_1106)
    {
        float _1234 = _1216 * _1216;
        _1232 = _1234;
    }
    float _1236 = _1232;
    float _1238 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1240 = fma(_1224, _1224, _1228);
    float _1242 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1238);
    float _1244 = _1240 + _1236;
    float _1246 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1250 = fma(_1090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1248);
    float _1252 = precise::clamp(_1250, 0.0, 1.0);
    float _1254 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1242);
    float _1256 = rsqrt(_1244);
    float _1258 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1260 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1246);
    float _1262 = -_1252;
    float _1264 = _1262 + 1.0;
    float _1266 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1258);
    float _1270 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1274 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1276 = abs(_1264);
    float _1278 = log2(_1276);
    float _1280 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1268);
    float _1282 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1284 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1274);
    float _1286 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = _1256 * _1208;
    float _1294 = _1256 * _1224;
    float _1296 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1298 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1302 = _1256 * _1216;
    float _1304 = -_1286;
    float _1306 = fma(_1304, _1080, 1.0);
    float _1308 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1298);
    float _1310 = -_1300;
    float _1312 = fma(_1294, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1310);
    float _1314 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1316 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1318 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1308);
    float _1320 = -_1302;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1312);
    float _1324 = exp2(_1314);
    float _1326 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1328 = fma(_1322, -0.5, 0.5);
    float _1330 = fma(_1322, 0.5, 0.5);
    float _1332 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1326);
    float _1334 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1316);
    float _1336 = _1294 + 1.0;
    float _1338 = log2(_1306);
    float _1340 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1332);
    float _1342 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1334);
    float _1344 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1346 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1340);
    float _1348 = 1.0 / _1318;
    float _1350 = -_1294;
    float _1352 = fma(_1324, _1336, _1350);
    float _1354 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1356 = fma(_1330, _1344, -0.212114393711090087890625);
    float _1358 = fma(_1352, 0.5, 0.5);
    float _1360 = fma(_1330, _1356, 1.570728778839111328125);
    float _1362 = sqrt(_1328);
    float _1364 = _1338 * 0.693147182464599609375;
    float _1366 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1368 = _1346 * _1348;
    float _1370 = _1354 * _1348;
    float _1372 = fma(_1368, 0.5, 0.5);
    float _1374 = fma(_1370, -0.5, 0.5);
    float _1376 = _1362 * 0.636619746685028076171875;
    float3 _3884 = float3(_1372, _1374, _1366);
    float _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3884, float3(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3884, float3(0.0), isnan(_3884)), level(0.0)).x;
    float3 _3895 = float3(_1372, _1374, _1366);
    float4 _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3895, float3(0.0), isnan(_3895)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3895, float3(0.0), isnan(_3895)), level(0.0)).xyzw;
    float _1383 = _1381.x;
    float _1385 = _1381.y;
    float _1387 = _1381.z;
    float _1389 = _1381.w;
    float _1391 = -_1360;
    float _1393 = fma(_1376, _1391, 1.0);
    float2 _3917 = float2(_1393, _1358);
    float3 _1397 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3917, float2(0.0), isnan(_3917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3917, float2(0.0), isnan(_3917)), level(0.0)).xyz;
    float _1399 = _1397.x;
    float _1401 = _1397.y;
    float _1403 = _1397.z;
    float _1405 = in.m_51.y;
    float _1407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1411 = _1409 != 0;
    float _1413 = in.m_57.y;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1419 = _1417 != 0;
    float _1421 = in.m_51.w;
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1425 = _1423 != 0;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1431 = _1429 != 0;
    float _1433 = in.m_57.x;
    float _1435 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1437 = _1360;
    float _1439 = _1366;
    if (_1411)
    {
        float _1441 = in.m_51.z;
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1449 = false;
    if (_1419)
    {
        bool _1451 = _176 > 0.5;
        _1449 = _1451;
    }
    bool _1453 = _1449;
    float _1455 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1445);
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1459 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1461 = _1405 > 0.5;
    float _1463 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1415);
    float _1465 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1467 = -_1413;
    float _1469 = _1467 + 1.0;
    float _1471 = fma(_1459, -2.0, _1427);
    float _1473 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1463);
    float _1475 = -_1447;
    float _1477 = fma(_1465, 2.0, _1475);
    bool _1479 = _1421 > 0.5;
    float _1481 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1471);
    float _1483 = in.m_59.x;
    float _1485 = in.m_59.y;
    float _1487 = in.m_59.z;
    float _1489 = in.m_59.w;
    float _1491 = -_140;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1477);
    int _1495 = _1479 ? as_type<int>(_1469) : as_type<int>(_1413);
    int _1497 = 0;
    bool _1499 = _1479;
    float _1501 = _1413;
    if (_1419)
    {
        float _1503 = -_1433;
        float _1505 = _1503 + 1.0;
        _1497 = as_type<int>(_1505);
    }
    int _1507 = _1497;
    if (!_1419)
    {
        _1439 = _1433;
    }
    float _1509 = _1439;
    int _1511 = 0;
    float _1513 = _1509;
    if (_1411)
    {
        float _1515 = -_1433;
        float _1517 = _1515 + 1.0;
        _1511 = as_type<int>(_1517);
    }
    int _1519 = _1511;
    if (_1411)
    {
        bool _1521 = _1443 > 0.5;
        _1499 = _1521;
    }
    bool _1523 = _1499;
    out.m_61.x = _166;
    out.m_61.y = _168;
    out.m_61.z = _170;
    float _1525 = _1425 ? as_type<float>(_1495) : _1413;
    float _1527 = exp2(_1435);
    if (_1431)
    {
        float _1529 = _1461 ? _1469 : _1413;
        _1501 = _1529;
    }
    float _1531 = _1501;
    float _1533 = in.m_63.x;
    float _1535 = in.m_63.y;
    float _1537 = in.m_63.z;
    float _1539 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1541 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1455);
    if (_1419)
    {
        float _1543 = _1453 ? as_type<float>(_1507) : _1433;
        _1513 = _1543;
    }
    float _1545 = _1513;
    out.m_65.x = _280;
    float _1547 = fma(_1539, _1531, -0.5);
    float _1549 = -_916;
    bool _1551 = _422 != _1549;
    bool _1553 = isnan(_422);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(_1549);
    bool _1559 = _1555 || _1557;
    if (!_1411)
    {
        _142 = _1433;
    }
    float _1561 = _142;
    float _1563 = -_1481;
    float _1565 = fma(_1473, _1547, _1563);
    bool _1567 = _930 == 0.0;
    bool _1569 = !_1559;
    bool _1571 = _1567 && _1569;
    out.m_67.x = _930;
    float _1573 = _1561;
    if (_1411)
    {
        float _1575 = _1523 ? as_type<float>(_1519) : _1433;
        _1573 = _1575;
    }
    float _1577 = _1573;
    float _1579 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1581 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1583 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1585 = _902 == 0.0;
    bool _1587 = _1585 && _1571;
    float _1589 = fma(_1483, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1579);
    float _1591 = fma(_1483, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1581);
    float _1593 = fma(_1483, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1583);
    float _1595 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1597 = -_1527;
    float _1599 = _1597 + 1.0;
    float _1601 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1591);
    float _1603 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1589);
    float _1605 = _830 * _1537;
    float _1607 = _844 * _1537;
    float _1609 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1593);
    float _1611 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1613 = -_1605;
    float _1615 = fma(_844, _1535, _1613);
    float _1617 = fma(_830, _1535, _1607);
    float _1619 = fma(_1595, _1545, -0.5);
    out.m_69.x = _1601;
    out.m_69.y = _1603;
    out.m_69.z = _1609;
    float _1621 = _886 * _1615;
    float _1623 = _870 * _1615;
    float _1625 = _1617 * _1485;
    float _1627 = _1318 * 0.5;
    float _1629 = -_1621;
    float _1631 = fma(_870, _1533, _1629);
    float _1633 = fma(_886, _1533, _1623);
    float _1635 = fma(_1541, _1619, _1493);
    float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1639 = _1631 * _1487;
    float _1641 = -_1625;
    float _1643 = fma(_1633, _1487, _1641);
    float _1645 = fma(_1354, -0.5, _1627);
    float _1647 = -_1639;
    float _1649 = fma(_1617, _1483, _1647);
    float _1651 = _1633 * _1483;
    float _1653 = _1643 * _1489;
    float _1655 = _1633;
    float _1657 = _1631;
    float _1659 = _1617;
    if (!_1587)
    {
        float _1661 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1633);
        _1655 = _1661;
    }
    float _1663 = _1655;
    float _1665 = _1649 * _1489;
    float _1667 = -_1651;
    float _1669 = fma(_1631, _1485, _1667);
    if (!_1587)
    {
        float _1671 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1631);
        _1657 = _1671;
    }
    float _1673 = _1657;
    float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1679 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1681 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1683 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1677);
    float _1687 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1679);
    float _1689 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1681);
    float _1691 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1693 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1695 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1697 = _1669 * _1489;
    float _1699 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1691);
    float _1701 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1703 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1693);
    float _1705 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1695);
    float _1707 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1687);
    float _1709 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1685);
    float _1711 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1689);
    float _1713 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1699);
    float _1715 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_1587)
    {
        float _1717 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1617);
        _1659 = _1717;
    }
    float _1719 = _1659;
    float _1721 = _1611 * _1637;
    out.m_71.x = _1707;
    out.m_71.y = _1709;
    out.m_71.z = _1711;
    float _1723 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1713);
    float _1725 = _1715 * _1675;
    float _1727 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1701);
    float _1729 = _1346 + _1318;
    float _1731 = _1723 + _1318;
    float _1733 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1703);
    float _1735 = _1565 + 0.5;
    float _1737 = _1635 + 0.5;
    float _1739 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1705);
    float _1741 = _1731 * 0.5;
    float _1743 = _1729 * 0.5;
    float _1745 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _1737;
    out.m_73.y = _1735;
    out.m_73.z = _1721;
    out.m_73.w = _1725;
    float _1747 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1727;
    out.m_75.y = _1733;
    out.m_75.z = _1739;
    out.m_77.x = _966;
    out.m_77.y = _1000;
    out.m_77.z = _960;
    out.m_79.x = _1064;
    out.m_79.y = _1062;
    out.m_79.z = _1066;
    out.m_45.x = 1.0;
    out.gl_Position.x = _1346;
    out.gl_Position.y = _1354;
    out.gl_Position.z = _1723;
    out.gl_Position.w = _1318;
    out.m_81.x = _1743;
    out.m_81.y = _1645;
    out.m_81.z = _1741;
    out.m_81.w = _1318;
    out.m_83.w = _1747;
    float _1749 = _1745 * _1378;
    float _1751 = -_1745;
    float _1753 = _1751 + 1.0;
    float _1755 = _1389 * _1749;
    float _1757 = _1389 * _1753;
    float _1759 = _1403 * _1749;
    float _1761 = fma(_1399, _1755, _1383);
    float _1763 = fma(_1401, _1755, _1385);
    float _1765 = fma(_1389, _1759, _1387);
    out.m_85.x = _1761;
    out.m_85.y = _1763;
    out.m_85.z = _1765;
    out.m_85.w = _1757;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    float _116 = _114;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1823 = as_type<float>(_122);
        out.gl_Position.z = _1823;
    }
    if (!_108)
    {
        return out;
    }
    float _126 = in.m_47.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_104);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    if (_152)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _112;
    if (_152)
    {
        out.m_45.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1892 = as_type<float>(_158);
        out.gl_Position.z = _1892;
    }
    if (_152)
    {
        return out;
    }
    float _160 = in.m_49.w;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _164 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _176 = in.m_51.x;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _184;
    float _188 = in.m_55.w;
    float _190 = 0.0;
    float _192 = _164;
    if (_172)
    {
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _190 = _194;
    }
    float _196 = _190;
    float _198 = in.m_47.x;
    float _200 = in.m_47.y;
    float _202 = in.m_47.z;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[194].y + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _216 = _160 * 78.233001708984375;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _226;
    float _230 = -_162;
    float _232 = fma(_174, _230, _168);
    float _234 = fma(_166, 12.98980045318603515625, _216);
    bool _236 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.0);
    bool _244 = _240 || _242;
    float _246 = fma(_210, _168, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _248 = floor(_232);
    float _250 = _234 * 0.15915493667125701904296875;
    float _252 = 0.0;
    float _254 = _196;
    if (_172)
    {
        float _256 = _176 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _252 = _256;
    }
    float _258 = _252;
    float _260 = fma(_224, _166, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _262 = fma(_228, _170, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _264 = precise::max(_246, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _266 = _250 * 6.283185482025146484375;
    float _268 = sin(_266);
    float _270 = precise::max(_260, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _272 = precise::max(_262, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _274 = precise::min(_264, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _276 = precise::min(_270, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _278 = -_248;
    float _280 = _232 + _278;
    float _282 = 1.0 / _186;
    float _284 = in.m_42.x;
    float _286 = in.m_42.y;
    float _288 = in.m_42.z;
    float _290 = precise::min(_272, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _292 = 0.0;
    if (_172)
    {
        float _294 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[14].x, _280);
        _292 = _294;
    }
    float _296 = _292;
    float _298 = -_274;
    float _300 = _298 + _180;
    float _302 = -_276;
    float _304 = _302 + _178;
    float _306 = _280 * _280;
    float _308 = _268 * 43758.546875;
    float _310 = _296;
    if (_172)
    {
        float _312 = _296 * _196;
        _310 = _312;
    }
    float _314 = _310;
    float _316 = 1.0 / _214;
    if (!_244)
    {
        float _318 = _164 * _164;
        float _320 = _318 * 0.5;
        _254 = _320;
    }
    float _322 = _254;
    float _324 = -_290;
    float _326 = _324 + _182;
    float _328 = _322;
    if (!_244)
    {
        float _330 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _328 = _330;
    }
    float _332 = _328;
    float _334 = 1.0 / _206;
    float _336 = 1.0 / _220;
    float _338 = floor(_308);
    float _340 = 0.0;
    float _342 = _332;
    if (_172)
    {
        float _344 = floor(_314);
        _340 = _344;
    }
    float _346 = _340;
    bool _348 = !_244;
    float _350 = 0.0;
    if (!_348)
    {
        float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = log2(_352);
        float _356 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _358 = _356 + 1.0;
        float _360 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = _164 * _354;
        float _364 = 1.0 / _358;
        float _366 = _360 * 0.693147182464599609375;
        float _368 = exp2(_362);
        float _370 = 1.0 / _366;
        float _372 = _368 + (-1.0);
        float _374 = -_372;
        float _376 = fma(_374, _370, _164);
        float _378 = _376 * _364;
        float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _380;
        _350 = _370;
    }
    float _382 = _342;
    float _384 = _350;
    bool _386 = !_244;
    float _388 = _384;
    if (!_386)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _164 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _192 = _408;
    }
    float _410 = _192;
    float _412 = _306 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _414 = -_338;
    float _416 = _308 + _414;
    float _418 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_172)
    {
        _388 = _280;
    }
    float _420 = _388;
    float _422 = fma(_210, _412, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _424 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _426 = _420;
    if (_172)
    {
        float _428 = -_346;
        float _430 = _314 + _428;
        _426 = _430;
    }
    float _432 = _426;
    float _434 = fma(_410, _200, _418);
    float _436 = fma(_410, _198, _424);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _442 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _444;
    float _448 = fma(_436, _188, _284);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _450;
    float _454 = 1.0 / _440;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _458 = _432 + _456;
    float _460 = fma(_434, _188, _286);
    float _462 = fma(_410, _202, _442);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _466 = _432 + _464;
    float _468 = _458 * _282;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _472 = _432 + _470;
    float _474 = fma(_462, _188, _288);
    float _476 = 1.0 / _452;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _480 = _432 + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _484 = _432 + _482;
    float _486 = _466 * _316;
    float _488 = _480 * _334;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _492 = _432 + _490;
    float _494 = 1.0 / _446;
    float _496 = _484 * _454;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _508 = _432 + _506;
    float _510 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _512 = _472 * _336;
    float _514 = _492 * _476;
    float _516 = fma(_504, _468, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _538 = fma(_528, _468, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _540;
    bool _544 = _416 >= 0.5;
    bool _546 = isnan(_416);
    bool _548 = _544 || _546;
    bool _550 = isnan(0.5);
    bool _552 = _548 || _550;
    float _554 = fma(_520, _488, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _556 = fma(_524, _488, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _558 = fma(_542, _488, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _560 = fma(_532, _512, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _562 = fma(_536, _512, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _572 = !_552;
    float _574 = _572 ? (-1.0) : 1.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    bool _580 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _582 = isnan(_432);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _508 * _494;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _602;
    float _606 = _306 * 5.0;
    float _608 = fma(_566, _486, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _610 = fma(_570, _486, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _612 = fma(_578, _486, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _614;
    float _618 = _574 * 0.4000000059604644775390625;
    bool _620 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _622 = isnan(_432);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_590;
    float _634 = _632 + 1.0;
    float _636 = fma(_596, _512, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _638 = fma(_600, _592, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _640 = fma(_604, _592, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _642 = fma(_616, _592, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _644 = _606 * _618;
    float _646 = _630 * _634;
    bool _648 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _650 = isnan(_432);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -_630;
    float _662 = _660 + 1.0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _668 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _670 = isnan(_432);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_416, 3.1415927410125732421875, _644);
    bool _682 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _684 = isnan(_432);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -_658;
    float _696 = _694 + 1.0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _702 = -_678;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    bool _710 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _712 = isnan(_432);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = _658 * _662;
    float _724 = -_692;
    float _726 = _724 + 1.0;
    float _728 = _678 * _696;
    float _730 = _680 * 0.15915493667125701904296875;
    bool _732 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _734 = isnan(_432);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _692 * _704;
    bool _746 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _748 = isnan(_432);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_700, _496, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _760 = fma(_666, _496, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _762 = fma(_708, _496, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _764 = _720 * _726;
    float _766 = -_720;
    float _768 = _766 + 1.0;
    float _770 = _730 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = -_742;
    float _776 = _774 + 1.0;
    float _778 = _538 * _764;
    float _780 = _510 * _764;
    float _782 = _516 * _764;
    float _784 = _590 * _776;
    float _786 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[159].x, _778);
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[159].y, _780);
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[159].z, _782);
    float _792 = -_756;
    float _794 = _792 + 1.0;
    float _796 = fma(_608, _744, _786);
    float _798 = fma(_610, _744, _788);
    float _800 = fma(_612, _744, _790);
    float _802 = _742 * _794;
    float _804 = fma(_554, _728, _796);
    float _806 = fma(_556, _728, _798);
    float _808 = _772 * 1.256637096405029296875;
    float _810 = fma(_558, _728, _800);
    float _812 = fma(_560, _722, _804);
    float _814 = fma(_562, _722, _806);
    float _816 = _808 * 0.15915493667125701904296875;
    float _818 = fma(_638, _646, _812);
    float _820 = fma(_636, _722, _810);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _822;
    float _826 = fma(_640, _646, _814);
    float _828 = _816 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = fma(_758, _784, _818);
    float _834 = fma(_824, _514, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _836 = _644 * 0.15915493667125701904296875;
    float _838 = fma(_642, _646, _820);
    float _840 = fma(_834, _802, _832);
    float _842 = _816 * 6.283185482025146484375;
    float _844 = cos(_842);
    float _846 = in.m_55.x;
    float _848 = in.m_55.y;
    float _850 = in.m_55.z;
    float _852 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _840);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _854;
    float _858 = fma(_762, _784, _838);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _860;
    float _864 = _852 * _326;
    float _866 = fma(_856, _514, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _868 = _836 * 6.283185482025146484375;
    float _870 = cos(_868);
    float _872 = fma(_862, _514, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _874 = _852 * _300;
    float _876 = _864 * _830;
    float _878 = fma(_866, _802, _858);
    float _880 = fma(_760, _784, _826);
    float _882 = _852 * _304;
    float _884 = _836 * 6.283185482025146484375;
    float _886 = sin(_884);
    float _888 = _864 * _844;
    float _890 = -_876;
    float _892 = fma(_874, _844, _890);
    float _894 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].z, _878);
    float _896 = fma(_872, _802, _880);
    float _898 = fma(_874, _830, _888);
    float _900 = _892 * _870;
    float _902 = fma(_290, _894, _898);
    float _904 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].y, _896);
    float _906 = _850 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _908 = _848 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _910 = _846 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _912 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _892 * _886;
    float _916 = fma(_882, _886, _900);
    float _918 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _920 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _922 = -_914;
    float _924 = fma(_882, _870, _922);
    float _926 = _916 + _422;
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _902);
    float _930 = fma(_276, _904, _924);
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _926);
    float _934 = _928 * _912;
    float _936 = _460 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _930);
    float _940 = _932 * _918;
    float _942 = _460 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _944 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _936);
    float _946 = _938 * _920;
    float _948 = _940 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _950 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _942);
    float _952 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].z, _944);
    float _954 = _940 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[10].x, _948);
    float _958 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].z, _950);
    float _960 = _952 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _962 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _964 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].z, _956);
    float _966 = _958 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _968 = _460 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _970 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].z, _962);
    float _972 = _960 + _964;
    float _974 = _940 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _976 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _968);
    float _978 = _966 + _970;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _982 = _972 + _980;
    float _984 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[9].x, _974);
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _988 = _978 + _986;
    float _990 = _982 * _982;
    float _992 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].z, _984);
    float _994 = fma(_988, _988, _990);
    float _996 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].z, _976);
    float _998 = sqrt(_994);
    float _1000 = _996 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1002 = _1000 + _992;
    bool _1004 = _998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1006 = _448;
    float _1008 = _474;
    float _1010 = _976;
    if (!_1004)
    {
        _1006 = _978;
    }
    float _1012 = _1006;
    float _1014 = _1012;
    if (!_1004)
    {
        _1008 = _972;
    }
    float _1016 = _1008;
    float _1018 = _1016;
    if (!_1004)
    {
        _1010 = _1002;
    }
    float _1020 = _1010;
    bool _1022 = !_1004;
    float _1024 = _1020;
    if (!_1022)
    {
        float _1026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1030 = _998 + _1028;
        float _1032 = rsqrt(_994);
        float _1034 = _1030 * _1026;
        float _1036 = _1002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = _1034 * 0.15915493667125701904296875;
        float _1040 = _1038 * 6.283185482025146484375;
        float _1042 = cos(_1040);
        float _1044 = _1038 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        float _1048 = _1042 + (-1.0);
        float _1050 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = fma(_1046, _1036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1054 = fma(_1002, _1042, _1050);
        float _1056 = _1032 * _1052;
        float _1058 = fma(_988, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1060 = fma(_982, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1024 = _1054;
        _1014 = _1058;
        _1018 = _1060;
    }
    float _1062 = _1024;
    float _1064 = _1014;
    float _1066 = _1018;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1070 = _1062 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1074 = _1064 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1078 = _1066 + _1076;
    float _1080 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1082 = _1070 * _1070;
    float _1084 = fma(_1074, _1074, _1082);
    float _1086 = fma(_1078, _1078, _1084);
    float _1088 = rsqrt(_1086);
    float _1090 = sqrt(_1086);
    float _1092 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1094 = _1074 * _1092;
    float _1096 = _1078 * _1092;
    float _1098 = _1094 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 + _1100;
    float _1104 = sqrt(_1102);
    bool _1106 = _1104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1104 + _1108;
    float _1112 = _1078;
    float _1114 = _1102;
    float _1116 = _1110;
    float _1118 = _1082;
    float _1120 = _1092;
    if (_1106)
    {
        float _1122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1122;
    }
    float _1124 = _1112;
    if (_1106)
    {
        float _1126 = rsqrt(_1102);
        _1114 = _1126;
    }
    float _1128 = _1114;
    float _1130 = _1128;
    if (_1106)
    {
        float _1132 = _1110 * _1124;
        _1116 = _1132;
    }
    float _1134 = _1116;
    if (_1106)
    {
        float _1136 = _1134 * 0.15915493667125701904296875;
        _1118 = _1136;
    }
    float _1138 = _1118;
    float _1140 = _1124;
    float _1142 = _1138;
    if (_1106)
    {
        float _1144 = _1138 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        _1140 = _1146;
    }
    float _1148 = _1140;
    float _1150 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1152 = precise::max(0.0, _1150);
    float _1154 = _978;
    float _1156 = _1152;
    if (_1106)
    {
        float _1158 = _1138 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        _1154 = _1160;
    }
    float _1162 = _1154;
    float _1164 = -_1092;
    float _1166 = -_1152;
    float _1168 = fma(_1070, _1164, _1166);
    float _1170 = _1168;
    if (_1106)
    {
        float _1172 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1172;
    }
    float _1174 = _1156;
    float _1176 = _1148;
    float _1178 = _1174;
    if (_1106)
    {
        float _1180 = fma(_1148, _1174, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1176 = _1180;
    }
    float _1182 = _1176;
    float _1184 = _1182;
    float _1186 = _1162;
    if (_1106)
    {
        float _1188 = _1162 + (-1.0);
        _1178 = _1188;
    }
    float _1190 = _1178;
    float _1192 = _1190;
    if (_1106)
    {
        float _1194 = _1128 * _1182;
        _1120 = _1194;
    }
    float _1196 = _1120;
    if (!_1106)
    {
        _1184 = _1094;
    }
    float _1198 = _1184;
    float _1200 = _1198;
    if (_1106)
    {
        float _1202 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1142 = _1202;
    }
    float _1204 = _1142;
    if (_1106)
    {
        float _1206 = _1094 * _1196;
        _1200 = _1206;
    }
    float _1208 = _1200;
    if (!_1106)
    {
        _1192 = _1096;
    }
    float _1210 = _1192;
    float _1212 = _1210;
    if (_1106)
    {
        float _1214 = _1096 * _1196;
        _1212 = _1214;
    }
    float _1216 = _1212;
    if (!_1106)
    {
        _1130 = _1098;
    }
    float _1218 = _1130;
    float _1220 = _1218;
    if (_1106)
    {
        float _1222 = fma(_1168, _1162, _1204);
        _1170 = _1222;
    }
    float _1224 = _1170;
    if (_1106)
    {
        float _1226 = _1208 * _1208;
        _1220 = _1226;
    }
    float _1228 = _1220;
    if (!_1106)
    {
        _1186 = _1100;
    }
    float _1230 = _1186;
    float _1232 = _1230;
    if (_1106)
    {
        float _1234 = _1216 * _1216;
        _1232 = _1234;
    }
    float _1236 = _1232;
    float _1238 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1240 = fma(_1224, _1224, _1228);
    float _1242 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1238);
    float _1244 = _1240 + _1236;
    float _1246 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1250 = fma(_1090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1248);
    float _1252 = precise::clamp(_1250, 0.0, 1.0);
    float _1254 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1242);
    float _1256 = rsqrt(_1244);
    float _1258 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1260 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1246);
    float _1262 = -_1252;
    float _1264 = _1262 + 1.0;
    float _1266 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1258);
    float _1270 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1274 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1276 = abs(_1264);
    float _1278 = log2(_1276);
    float _1280 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1268);
    float _1282 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1284 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1274);
    float _1286 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = _1256 * _1208;
    float _1294 = _1256 * _1224;
    float _1296 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1298 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1302 = _1256 * _1216;
    float _1304 = -_1286;
    float _1306 = fma(_1304, _1080, 1.0);
    float _1308 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1298);
    float _1310 = -_1300;
    float _1312 = fma(_1294, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1310);
    float _1314 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1316 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1318 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1308);
    float _1320 = -_1302;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1312);
    float _1324 = exp2(_1314);
    float _1326 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1328 = fma(_1322, -0.5, 0.5);
    float _1330 = fma(_1322, 0.5, 0.5);
    float _1332 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1326);
    float _1334 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1316);
    float _1336 = _1294 + 1.0;
    float _1338 = log2(_1306);
    float _1340 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1332);
    float _1342 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1334);
    float _1344 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1346 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1340);
    float _1348 = 1.0 / _1318;
    float _1350 = -_1294;
    float _1352 = fma(_1324, _1336, _1350);
    float _1354 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1356 = fma(_1330, _1344, -0.212114393711090087890625);
    float _1358 = fma(_1352, 0.5, 0.5);
    float _1360 = fma(_1330, _1356, 1.570728778839111328125);
    float _1362 = sqrt(_1328);
    float _1364 = _1338 * 0.693147182464599609375;
    float _1366 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1368 = _1346 * _1348;
    float _1370 = _1354 * _1348;
    float _1372 = fma(_1368, 0.5, 0.5);
    float _1374 = fma(_1370, -0.5, 0.5);
    float _1376 = _1362 * 0.636619746685028076171875;
    float3 _3884 = float3(_1372, _1374, _1366);
    float _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3884, float3(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3884, float3(0.0), isnan(_3884)), level(0.0)).x;
    float3 _3895 = float3(_1372, _1374, _1366);
    float4 _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3895, float3(0.0), isnan(_3895)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3895, float3(0.0), isnan(_3895)), level(0.0)).xyzw;
    float _1383 = _1381.x;
    float _1385 = _1381.y;
    float _1387 = _1381.z;
    float _1389 = _1381.w;
    float _1391 = -_1360;
    float _1393 = fma(_1376, _1391, 1.0);
    float2 _3917 = float2(_1393, _1358);
    float3 _1397 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3917, float2(0.0), isnan(_3917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3917, float2(0.0), isnan(_3917)), level(0.0)).xyz;
    float _1399 = _1397.x;
    float _1401 = _1397.y;
    float _1403 = _1397.z;
    float _1405 = in.m_51.y;
    float _1407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1411 = _1409 != 0;
    float _1413 = in.m_57.y;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1419 = _1417 != 0;
    float _1421 = in.m_51.w;
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1425 = _1423 != 0;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1431 = _1429 != 0;
    float _1433 = in.m_57.x;
    float _1435 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1437 = _1360;
    float _1439 = _1366;
    if (_1411)
    {
        float _1441 = in.m_51.z;
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1449 = false;
    if (_1419)
    {
        bool _1451 = _176 > 0.5;
        _1449 = _1451;
    }
    bool _1453 = _1449;
    float _1455 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1445);
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1459 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1461 = _1405 > 0.5;
    float _1463 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1415);
    float _1465 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1467 = -_1413;
    float _1469 = _1467 + 1.0;
    float _1471 = fma(_1459, -2.0, _1427);
    float _1473 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1463);
    float _1475 = -_1447;
    float _1477 = fma(_1465, 2.0, _1475);
    bool _1479 = _1421 > 0.5;
    float _1481 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1471);
    float _1483 = in.m_59.x;
    float _1485 = in.m_59.y;
    float _1487 = in.m_59.z;
    float _1489 = in.m_59.w;
    float _1491 = -_140;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1477);
    int _1495 = _1479 ? as_type<int>(_1469) : as_type<int>(_1413);
    int _1497 = 0;
    bool _1499 = _1479;
    float _1501 = _1413;
    if (_1419)
    {
        float _1503 = -_1433;
        float _1505 = _1503 + 1.0;
        _1497 = as_type<int>(_1505);
    }
    int _1507 = _1497;
    if (!_1419)
    {
        _1439 = _1433;
    }
    float _1509 = _1439;
    int _1511 = 0;
    float _1513 = _1509;
    if (_1411)
    {
        float _1515 = -_1433;
        float _1517 = _1515 + 1.0;
        _1511 = as_type<int>(_1517);
    }
    int _1519 = _1511;
    if (_1411)
    {
        bool _1521 = _1443 > 0.5;
        _1499 = _1521;
    }
    bool _1523 = _1499;
    out.m_61.x = _166;
    out.m_61.y = _168;
    out.m_61.z = _170;
    float _1525 = _1425 ? as_type<float>(_1495) : _1413;
    float _1527 = exp2(_1435);
    if (_1431)
    {
        float _1529 = _1461 ? _1469 : _1413;
        _1501 = _1529;
    }
    float _1531 = _1501;
    float _1533 = in.m_63.x;
    float _1535 = in.m_63.y;
    float _1537 = in.m_63.z;
    float _1539 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1541 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1455);
    if (_1419)
    {
        float _1543 = _1453 ? as_type<float>(_1507) : _1433;
        _1513 = _1543;
    }
    float _1545 = _1513;
    out.m_65.x = _280;
    float _1547 = fma(_1539, _1531, -0.5);
    float _1549 = -_916;
    bool _1551 = _422 != _1549;
    bool _1553 = isnan(_422);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(_1549);
    bool _1559 = _1555 || _1557;
    if (!_1411)
    {
        _142 = _1433;
    }
    float _1561 = _142;
    float _1563 = -_1481;
    float _1565 = fma(_1473, _1547, _1563);
    bool _1567 = _930 == 0.0;
    bool _1569 = !_1559;
    bool _1571 = _1567 && _1569;
    out.m_67.x = _930;
    float _1573 = _1561;
    if (_1411)
    {
        float _1575 = _1523 ? as_type<float>(_1519) : _1433;
        _1573 = _1575;
    }
    float _1577 = _1573;
    float _1579 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1581 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1583 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1585 = _902 == 0.0;
    bool _1587 = _1585 && _1571;
    float _1589 = fma(_1483, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1579);
    float _1591 = fma(_1483, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1581);
    float _1593 = fma(_1483, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1583);
    float _1595 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1597 = -_1527;
    float _1599 = _1597 + 1.0;
    float _1601 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1591);
    float _1603 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1589);
    float _1605 = _830 * _1537;
    float _1607 = _844 * _1537;
    float _1609 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1593);
    float _1611 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1613 = -_1605;
    float _1615 = fma(_844, _1535, _1613);
    float _1617 = fma(_830, _1535, _1607);
    float _1619 = fma(_1595, _1545, -0.5);
    out.m_69.x = _1601;
    out.m_69.y = _1603;
    out.m_69.z = _1609;
    float _1621 = _886 * _1615;
    float _1623 = _870 * _1615;
    float _1625 = _1617 * _1485;
    float _1627 = _1318 * 0.5;
    float _1629 = -_1621;
    float _1631 = fma(_870, _1533, _1629);
    float _1633 = fma(_886, _1533, _1623);
    float _1635 = fma(_1541, _1619, _1493);
    float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1639 = _1631 * _1487;
    float _1641 = -_1625;
    float _1643 = fma(_1633, _1487, _1641);
    float _1645 = fma(_1354, -0.5, _1627);
    float _1647 = -_1639;
    float _1649 = fma(_1617, _1483, _1647);
    float _1651 = _1633 * _1483;
    float _1653 = _1643 * _1489;
    float _1655 = _1633;
    float _1657 = _1631;
    float _1659 = _1617;
    if (!_1587)
    {
        float _1661 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1633);
        _1655 = _1661;
    }
    float _1663 = _1655;
    float _1665 = _1649 * _1489;
    float _1667 = -_1651;
    float _1669 = fma(_1631, _1485, _1667);
    if (!_1587)
    {
        float _1671 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1631);
        _1657 = _1671;
    }
    float _1673 = _1657;
    float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1679 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1681 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1683 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1677);
    float _1687 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1679);
    float _1689 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1681);
    float _1691 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1693 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1695 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1697 = _1669 * _1489;
    float _1699 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1691);
    float _1701 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1703 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1693);
    float _1705 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1695);
    float _1707 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1687);
    float _1709 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1685);
    float _1711 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1689);
    float _1713 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1699);
    float _1715 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_1587)
    {
        float _1717 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1617);
        _1659 = _1717;
    }
    float _1719 = _1659;
    float _1721 = _1611 * _1637;
    out.m_71.x = _1707;
    out.m_71.y = _1709;
    out.m_71.z = _1711;
    float _1723 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1713);
    float _1725 = _1715 * _1675;
    float _1727 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1701);
    float _1729 = _1346 + _1318;
    float _1731 = _1723 + _1318;
    float _1733 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1703);
    float _1735 = _1565 + 0.5;
    float _1737 = _1635 + 0.5;
    float _1739 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1705);
    float _1741 = _1731 * 0.5;
    float _1743 = _1729 * 0.5;
    float _1745 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _1737;
    out.m_73.y = _1735;
    out.m_73.z = _1721;
    out.m_73.w = _1725;
    float _1747 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1727;
    out.m_75.y = _1733;
    out.m_75.z = _1739;
    out.m_77.x = _966;
    out.m_77.y = _1000;
    out.m_77.z = _960;
    out.m_79.x = _1064;
    out.m_79.y = _1062;
    out.m_79.z = _1066;
    out.m_45.x = 1.0;
    out.gl_Position.x = _1346;
    out.gl_Position.y = _1354;
    out.gl_Position.z = _1723;
    out.gl_Position.w = _1318;
    out.m_81.x = _1743;
    out.m_81.y = _1645;
    out.m_81.z = _1741;
    out.m_81.w = _1318;
    out.m_83.w = _1747;
    float _1749 = _1745 * _1378;
    float _1751 = -_1745;
    float _1753 = _1751 + 1.0;
    float _1755 = _1389 * _1749;
    float _1757 = _1389 * _1753;
    float _1759 = _1403 * _1749;
    float _1761 = fma(_1399, _1755, _1383);
    float _1763 = fma(_1401, _1755, _1385);
    float _1765 = fma(_1389, _1759, _1387);
    out.m_85.x = _1761;
    out.m_85.y = _1763;
    out.m_85.z = _1765;
    out.m_85.w = _1757;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    float _116 = _114;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _118 = 0;
    if (!_108)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1823 = as_type<float>(_122);
        out.gl_Position.z = _1823;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_47.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_104);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    if (_152)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _112;
    if (_152)
    {
        out.m_45.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1892 = as_type<float>(_158);
        out.gl_Position.z = _1892;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_49.w;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _164 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _166 = in.m_49.x;
    float _168 = in.m_49.y;
    float _170 = in.m_49.z;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _174 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _176 = in.m_51.x;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _186 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _184;
    float _188 = in.m_55.w;
    float _190 = 0.0;
    float _192 = _164;
    if (_172)
    {
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _190 = _194;
    }
    float _196 = _190;
    float _198 = in.m_47.x;
    float _200 = in.m_47.y;
    float _202 = in.m_47.z;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[194].y + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _216 = _160 * 78.233001708984375;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _224 = _222 + (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _226;
    float _230 = -_162;
    float _232 = fma(_174, _230, _168);
    float _234 = fma(_166, 12.98980045318603515625, _216);
    bool _236 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.0);
    bool _244 = _240 || _242;
    float _246 = fma(_210, _168, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _248 = floor(_232);
    float _250 = _234 * 0.15915493667125701904296875;
    float _252 = 0.0;
    float _254 = _196;
    if (_172)
    {
        float _256 = _176 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _252 = _256;
    }
    float _258 = _252;
    float _260 = fma(_224, _166, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _262 = fma(_228, _170, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _264 = precise::max(_246, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _266 = _250 * 6.283185482025146484375;
    float _268 = sin(_266);
    float _270 = precise::max(_260, (*spvDescriptorSet0.vp_c9)._m0[193].y);
    float _272 = precise::max(_262, (*spvDescriptorSet0.vp_c9)._m0[193].w);
    float _274 = precise::min(_264, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _276 = precise::min(_270, (*spvDescriptorSet0.vp_c9)._m0[194].x);
    float _278 = -_248;
    float _280 = _232 + _278;
    float _282 = 1.0 / _186;
    float _284 = in.m_42.x;
    float _286 = in.m_42.y;
    float _288 = in.m_42.z;
    float _290 = precise::min(_272, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _292 = 0.0;
    if (_172)
    {
        float _294 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[14].x, _280);
        _292 = _294;
    }
    float _296 = _292;
    float _298 = -_274;
    float _300 = _298 + _180;
    float _302 = -_276;
    float _304 = _302 + _178;
    float _306 = _280 * _280;
    float _308 = _268 * 43758.546875;
    float _310 = _296;
    if (_172)
    {
        float _312 = _296 * _196;
        _310 = _312;
    }
    float _314 = _310;
    float _316 = 1.0 / _214;
    if (!_244)
    {
        float _318 = _164 * _164;
        float _320 = _318 * 0.5;
        _254 = _320;
    }
    float _322 = _254;
    float _324 = -_290;
    float _326 = _324 + _182;
    float _328 = _322;
    if (!_244)
    {
        float _330 = _322 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _328 = _330;
    }
    float _332 = _328;
    float _334 = 1.0 / _206;
    float _336 = 1.0 / _220;
    float _338 = floor(_308);
    float _340 = 0.0;
    float _342 = _332;
    if (_172)
    {
        float _344 = floor(_314);
        _340 = _344;
    }
    float _346 = _340;
    bool _348 = !_244;
    float _350 = 0.0;
    if (!_348)
    {
        float _352 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _354 = log2(_352);
        float _356 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _358 = _356 + 1.0;
        float _360 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _362 = _164 * _354;
        float _364 = 1.0 / _358;
        float _366 = _360 * 0.693147182464599609375;
        float _368 = exp2(_362);
        float _370 = 1.0 / _366;
        float _372 = _368 + (-1.0);
        float _374 = -_372;
        float _376 = fma(_374, _370, _164);
        float _378 = _376 * _364;
        float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _342 = _380;
        _350 = _370;
    }
    float _382 = _342;
    float _384 = _350;
    bool _386 = !_244;
    float _388 = _384;
    if (!_386)
    {
        float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _392 = log2(_390);
        float _394 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _396 = _394 + 1.0;
        float _398 = 1.0 / _396;
        float _400 = _164 * _392;
        float _402 = exp2(_400);
        float _404 = -_402;
        float _406 = _404 + 1.0;
        float _408 = _406 * _398;
        _192 = _408;
    }
    float _410 = _192;
    float _412 = _306 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _414 = -_338;
    float _416 = _308 + _414;
    float _418 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_172)
    {
        _388 = _280;
    }
    float _420 = _388;
    float _422 = fma(_210, _412, (*spvDescriptorSet0.vp_c9)._m0[193].z);
    float _424 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _426 = _420;
    if (_172)
    {
        float _428 = -_346;
        float _430 = _314 + _428;
        _426 = _430;
    }
    float _432 = _426;
    float _434 = fma(_410, _200, _418);
    float _436 = fma(_410, _198, _424);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _442 = _382 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _444;
    float _448 = fma(_436, _188, _284);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _450;
    float _454 = 1.0 / _440;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _458 = _432 + _456;
    float _460 = fma(_434, _188, _286);
    float _462 = fma(_410, _202, _442);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _466 = _432 + _464;
    float _468 = _458 * _282;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _472 = _432 + _470;
    float _474 = fma(_462, _188, _288);
    float _476 = 1.0 / _452;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _480 = _432 + _478;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _484 = _432 + _482;
    float _486 = _466 * _316;
    float _488 = _480 * _334;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _492 = _432 + _490;
    float _494 = 1.0 / _446;
    float _496 = _484 * _454;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _508 = _432 + _506;
    float _510 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _512 = _472 * _336;
    float _514 = _492 * _476;
    float _516 = fma(_504, _468, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _518;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _526;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _538 = fma(_528, _468, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _540;
    bool _544 = _416 >= 0.5;
    bool _546 = isnan(_416);
    bool _548 = _544 || _546;
    bool _550 = isnan(0.5);
    bool _552 = _548 || _550;
    float _554 = fma(_520, _488, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _556 = fma(_524, _488, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _558 = fma(_542, _488, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _560 = fma(_532, _512, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _562 = fma(_536, _512, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _572 = !_552;
    float _574 = _572 ? (-1.0) : 1.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    bool _580 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _582 = isnan(_432);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    float _592 = _508 * _494;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _602;
    float _606 = _306 * 5.0;
    float _608 = fma(_566, _486, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _610 = fma(_570, _486, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _612 = fma(_578, _486, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _614;
    float _618 = _574 * 0.4000000059604644775390625;
    bool _620 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _622 = isnan(_432);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -_590;
    float _634 = _632 + 1.0;
    float _636 = fma(_596, _512, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _638 = fma(_600, _592, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _640 = fma(_604, _592, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _642 = fma(_616, _592, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _644 = _606 * _618;
    float _646 = _630 * _634;
    bool _648 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _650 = isnan(_432);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -_630;
    float _662 = _660 + 1.0;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _666 = _664 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    bool _668 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _670 = isnan(_432);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = fma(_416, 3.1415927410125732421875, _644);
    bool _682 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _684 = isnan(_432);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -_658;
    float _696 = _694 + 1.0;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _702 = -_678;
    float _704 = _702 + 1.0;
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    bool _710 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _712 = isnan(_432);
    bool _714 = _710 || _712;
    bool _716 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _718 = _714 || _716;
    float _720 = float(_718);
    float _722 = _658 * _662;
    float _724 = -_692;
    float _726 = _724 + 1.0;
    float _728 = _678 * _696;
    float _730 = _680 * 0.15915493667125701904296875;
    bool _732 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _734 = isnan(_432);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    float _744 = _692 * _704;
    bool _746 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _748 = isnan(_432);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_700, _496, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _760 = fma(_666, _496, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _762 = fma(_708, _496, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _764 = _720 * _726;
    float _766 = -_720;
    float _768 = _766 + 1.0;
    float _770 = _730 * 6.283185482025146484375;
    float _772 = sin(_770);
    float _774 = -_742;
    float _776 = _774 + 1.0;
    float _778 = _538 * _764;
    float _780 = _510 * _764;
    float _782 = _516 * _764;
    float _784 = _590 * _776;
    float _786 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[159].x, _778);
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[159].y, _780);
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[159].z, _782);
    float _792 = -_756;
    float _794 = _792 + 1.0;
    float _796 = fma(_608, _744, _786);
    float _798 = fma(_610, _744, _788);
    float _800 = fma(_612, _744, _790);
    float _802 = _742 * _794;
    float _804 = fma(_554, _728, _796);
    float _806 = fma(_556, _728, _798);
    float _808 = _772 * 1.256637096405029296875;
    float _810 = fma(_558, _728, _800);
    float _812 = fma(_560, _722, _804);
    float _814 = fma(_562, _722, _806);
    float _816 = _808 * 0.15915493667125701904296875;
    float _818 = fma(_638, _646, _812);
    float _820 = fma(_636, _722, _810);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _822;
    float _826 = fma(_640, _646, _814);
    float _828 = _816 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = fma(_758, _784, _818);
    float _834 = fma(_824, _514, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _836 = _644 * 0.15915493667125701904296875;
    float _838 = fma(_642, _646, _820);
    float _840 = fma(_834, _802, _832);
    float _842 = _816 * 6.283185482025146484375;
    float _844 = cos(_842);
    float _846 = in.m_55.x;
    float _848 = in.m_55.y;
    float _850 = in.m_55.z;
    float _852 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].x, _840);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _854;
    float _858 = fma(_762, _784, _838);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _860;
    float _864 = _852 * _326;
    float _866 = fma(_856, _514, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _868 = _836 * 6.283185482025146484375;
    float _870 = cos(_868);
    float _872 = fma(_862, _514, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _874 = _852 * _300;
    float _876 = _864 * _830;
    float _878 = fma(_866, _802, _858);
    float _880 = fma(_760, _784, _826);
    float _882 = _852 * _304;
    float _884 = _836 * 6.283185482025146484375;
    float _886 = sin(_884);
    float _888 = _864 * _844;
    float _890 = -_876;
    float _892 = fma(_874, _844, _890);
    float _894 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].z, _878);
    float _896 = fma(_872, _802, _880);
    float _898 = fma(_874, _830, _888);
    float _900 = _892 * _870;
    float _902 = fma(_290, _894, _898);
    float _904 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[166].y, _896);
    float _906 = _850 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _908 = _848 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _910 = _846 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _912 = _906 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _914 = _892 * _886;
    float _916 = fma(_882, _886, _900);
    float _918 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _920 = _910 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _922 = -_914;
    float _924 = fma(_882, _870, _922);
    float _926 = _916 + _422;
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _902);
    float _930 = fma(_276, _904, _924);
    float _932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _926);
    float _934 = _928 * _912;
    float _936 = _460 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _930);
    float _940 = _932 * _918;
    float _942 = _460 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _944 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _936);
    float _946 = _938 * _920;
    float _948 = _940 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _950 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _942);
    float _952 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].z, _944);
    float _954 = _940 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[10].x, _948);
    float _958 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].z, _950);
    float _960 = _952 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _962 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _964 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[10].z, _956);
    float _966 = _958 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _968 = _460 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _970 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[8].z, _962);
    float _972 = _960 + _964;
    float _974 = _940 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _976 = fma(_448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _968);
    float _978 = _966 + _970;
    float _980 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _982 = _972 + _980;
    float _984 = fma(_946, (*spvDescriptorSet0.vp_c10)._m0[9].x, _974);
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _988 = _978 + _986;
    float _990 = _982 * _982;
    float _992 = fma(_934, (*spvDescriptorSet0.vp_c10)._m0[9].z, _984);
    float _994 = fma(_988, _988, _990);
    float _996 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].z, _976);
    float _998 = sqrt(_994);
    float _1000 = _996 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1002 = _1000 + _992;
    bool _1004 = _998 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1006 = _448;
    float _1008 = _474;
    float _1010 = _976;
    if (!_1004)
    {
        _1006 = _978;
    }
    float _1012 = _1006;
    float _1014 = _1012;
    if (!_1004)
    {
        _1008 = _972;
    }
    float _1016 = _1008;
    float _1018 = _1016;
    if (!_1004)
    {
        _1010 = _1002;
    }
    float _1020 = _1010;
    bool _1022 = !_1004;
    float _1024 = _1020;
    if (!_1022)
    {
        float _1026 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1028 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1030 = _998 + _1028;
        float _1032 = rsqrt(_994);
        float _1034 = _1030 * _1026;
        float _1036 = _1002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1038 = _1034 * 0.15915493667125701904296875;
        float _1040 = _1038 * 6.283185482025146484375;
        float _1042 = cos(_1040);
        float _1044 = _1038 * 6.283185482025146484375;
        float _1046 = sin(_1044);
        float _1048 = _1042 + (-1.0);
        float _1050 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = fma(_1046, _1036, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1054 = fma(_1002, _1042, _1050);
        float _1056 = _1032 * _1052;
        float _1058 = fma(_988, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1060 = fma(_982, _1056, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1024 = _1054;
        _1014 = _1058;
        _1018 = _1060;
    }
    float _1062 = _1024;
    float _1064 = _1014;
    float _1066 = _1018;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1070 = _1062 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1074 = _1064 + _1072;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1078 = _1066 + _1076;
    float _1080 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1082 = _1070 * _1070;
    float _1084 = fma(_1074, _1074, _1082);
    float _1086 = fma(_1078, _1078, _1084);
    float _1088 = rsqrt(_1086);
    float _1090 = sqrt(_1086);
    float _1092 = _1088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1094 = _1074 * _1092;
    float _1096 = _1078 * _1092;
    float _1098 = _1094 * _1094;
    float _1100 = _1096 * _1096;
    float _1102 = _1098 + _1100;
    float _1104 = sqrt(_1102);
    bool _1106 = _1104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1110 = _1104 + _1108;
    float _1112 = _1078;
    float _1114 = _1102;
    float _1116 = _1110;
    float _1118 = _1082;
    float _1120 = _1092;
    if (_1106)
    {
        float _1122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1112 = _1122;
    }
    float _1124 = _1112;
    if (_1106)
    {
        float _1126 = rsqrt(_1102);
        _1114 = _1126;
    }
    float _1128 = _1114;
    float _1130 = _1128;
    if (_1106)
    {
        float _1132 = _1110 * _1124;
        _1116 = _1132;
    }
    float _1134 = _1116;
    if (_1106)
    {
        float _1136 = _1134 * 0.15915493667125701904296875;
        _1118 = _1136;
    }
    float _1138 = _1118;
    float _1140 = _1124;
    float _1142 = _1138;
    if (_1106)
    {
        float _1144 = _1138 * 6.283185482025146484375;
        float _1146 = sin(_1144);
        _1140 = _1146;
    }
    float _1148 = _1140;
    float _1150 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1152 = precise::max(0.0, _1150);
    float _1154 = _978;
    float _1156 = _1152;
    if (_1106)
    {
        float _1158 = _1138 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        _1154 = _1160;
    }
    float _1162 = _1154;
    float _1164 = -_1092;
    float _1166 = -_1152;
    float _1168 = fma(_1070, _1164, _1166);
    float _1170 = _1168;
    if (_1106)
    {
        float _1172 = _1168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1156 = _1172;
    }
    float _1174 = _1156;
    float _1176 = _1148;
    float _1178 = _1174;
    if (_1106)
    {
        float _1180 = fma(_1148, _1174, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1176 = _1180;
    }
    float _1182 = _1176;
    float _1184 = _1182;
    float _1186 = _1162;
    if (_1106)
    {
        float _1188 = _1162 + (-1.0);
        _1178 = _1188;
    }
    float _1190 = _1178;
    float _1192 = _1190;
    if (_1106)
    {
        float _1194 = _1128 * _1182;
        _1120 = _1194;
    }
    float _1196 = _1120;
    if (!_1106)
    {
        _1184 = _1094;
    }
    float _1198 = _1184;
    float _1200 = _1198;
    if (_1106)
    {
        float _1202 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1142 = _1202;
    }
    float _1204 = _1142;
    if (_1106)
    {
        float _1206 = _1094 * _1196;
        _1200 = _1206;
    }
    float _1208 = _1200;
    if (!_1106)
    {
        _1192 = _1096;
    }
    float _1210 = _1192;
    float _1212 = _1210;
    if (_1106)
    {
        float _1214 = _1096 * _1196;
        _1212 = _1214;
    }
    float _1216 = _1212;
    if (!_1106)
    {
        _1130 = _1098;
    }
    float _1218 = _1130;
    float _1220 = _1218;
    if (_1106)
    {
        float _1222 = fma(_1168, _1162, _1204);
        _1170 = _1222;
    }
    float _1224 = _1170;
    if (_1106)
    {
        float _1226 = _1208 * _1208;
        _1220 = _1226;
    }
    float _1228 = _1220;
    if (!_1106)
    {
        _1186 = _1100;
    }
    float _1230 = _1186;
    float _1232 = _1230;
    if (_1106)
    {
        float _1234 = _1216 * _1216;
        _1232 = _1234;
    }
    float _1236 = _1232;
    float _1238 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1240 = fma(_1224, _1224, _1228);
    float _1242 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1238);
    float _1244 = _1240 + _1236;
    float _1246 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1248 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1250 = fma(_1090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1248);
    float _1252 = precise::clamp(_1250, 0.0, 1.0);
    float _1254 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1242);
    float _1256 = rsqrt(_1244);
    float _1258 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1260 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1246);
    float _1262 = -_1252;
    float _1264 = _1262 + 1.0;
    float _1266 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1268 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1258);
    float _1270 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1274 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1266);
    float _1276 = abs(_1264);
    float _1278 = log2(_1276);
    float _1280 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1268);
    float _1282 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1284 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1274);
    float _1286 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = _1256 * _1208;
    float _1294 = _1256 * _1224;
    float _1296 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1298 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1300 = _1292 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1302 = _1256 * _1216;
    float _1304 = -_1286;
    float _1306 = fma(_1304, _1080, 1.0);
    float _1308 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1298);
    float _1310 = -_1300;
    float _1312 = fma(_1294, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1310);
    float _1314 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1316 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1318 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1308);
    float _1320 = -_1302;
    float _1322 = fma(_1320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1312);
    float _1324 = exp2(_1314);
    float _1326 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1328 = fma(_1322, -0.5, 0.5);
    float _1330 = fma(_1322, 0.5, 0.5);
    float _1332 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1326);
    float _1334 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1316);
    float _1336 = _1294 + 1.0;
    float _1338 = log2(_1306);
    float _1340 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1332);
    float _1342 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1334);
    float _1344 = fma(_1330, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1346 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1340);
    float _1348 = 1.0 / _1318;
    float _1350 = -_1294;
    float _1352 = fma(_1324, _1336, _1350);
    float _1354 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1342);
    float _1356 = fma(_1330, _1344, -0.212114393711090087890625);
    float _1358 = fma(_1352, 0.5, 0.5);
    float _1360 = fma(_1330, _1356, 1.570728778839111328125);
    float _1362 = sqrt(_1328);
    float _1364 = _1338 * 0.693147182464599609375;
    float _1366 = _1364 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1368 = _1346 * _1348;
    float _1370 = _1354 * _1348;
    float _1372 = fma(_1368, 0.5, 0.5);
    float _1374 = fma(_1370, -0.5, 0.5);
    float _1376 = _1362 * 0.636619746685028076171875;
    float3 _3884 = float3(_1372, _1374, _1366);
    float _1378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3884, float3(0.0), isnan(_3884)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3884, float3(0.0), isnan(_3884)), level(0.0)).x;
    float3 _3895 = float3(_1372, _1374, _1366);
    float4 _1381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3895, float3(0.0), isnan(_3895)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3895, float3(0.0), isnan(_3895)), level(0.0)).xyzw;
    float _1383 = _1381.x;
    float _1385 = _1381.y;
    float _1387 = _1381.z;
    float _1389 = _1381.w;
    float _1391 = -_1360;
    float _1393 = fma(_1376, _1391, 1.0);
    float2 _3917 = float2(_1393, _1358);
    float3 _1397 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3917, float2(0.0), isnan(_3917)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3917, float2(0.0), isnan(_3917)), level(0.0)).xyz;
    float _1399 = _1397.x;
    float _1401 = _1397.y;
    float _1403 = _1397.z;
    float _1405 = in.m_51.y;
    float _1407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1411 = _1409 != 0;
    float _1413 = in.m_57.y;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1419 = _1417 != 0;
    float _1421 = in.m_51.w;
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1425 = _1423 != 0;
    float _1427 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1431 = _1429 != 0;
    float _1433 = in.m_57.x;
    float _1435 = _1278 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1437 = _1360;
    float _1439 = _1366;
    if (_1411)
    {
        float _1441 = in.m_51.z;
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1447 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1449 = false;
    if (_1419)
    {
        bool _1451 = _176 > 0.5;
        _1449 = _1451;
    }
    bool _1453 = _1449;
    float _1455 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1445);
    float _1457 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1459 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1461 = _1405 > 0.5;
    float _1463 = fma(_1405, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1415);
    float _1465 = _176 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1467 = -_1413;
    float _1469 = _1467 + 1.0;
    float _1471 = fma(_1459, -2.0, _1427);
    float _1473 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1463);
    float _1475 = -_1447;
    float _1477 = fma(_1465, 2.0, _1475);
    bool _1479 = _1421 > 0.5;
    float _1481 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1471);
    float _1483 = in.m_59.x;
    float _1485 = in.m_59.y;
    float _1487 = in.m_59.z;
    float _1489 = in.m_59.w;
    float _1491 = -_140;
    float _1493 = fma(_1491, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1477);
    int _1495 = _1479 ? as_type<int>(_1469) : as_type<int>(_1413);
    int _1497 = 0;
    bool _1499 = _1479;
    float _1501 = _1413;
    if (_1419)
    {
        float _1503 = -_1433;
        float _1505 = _1503 + 1.0;
        _1497 = as_type<int>(_1505);
    }
    int _1507 = _1497;
    if (!_1419)
    {
        _1439 = _1433;
    }
    float _1509 = _1439;
    int _1511 = 0;
    float _1513 = _1509;
    if (_1411)
    {
        float _1515 = -_1433;
        float _1517 = _1515 + 1.0;
        _1511 = as_type<int>(_1517);
    }
    int _1519 = _1511;
    if (_1411)
    {
        bool _1521 = _1443 > 0.5;
        _1499 = _1521;
    }
    bool _1523 = _1499;
    out.m_61.x = _166;
    out.m_61.y = _168;
    out.m_61.z = _170;
    float _1525 = _1425 ? as_type<float>(_1495) : _1413;
    float _1527 = exp2(_1435);
    if (_1431)
    {
        float _1529 = _1461 ? _1469 : _1413;
        _1501 = _1529;
    }
    float _1531 = _1501;
    float _1533 = in.m_63.x;
    float _1535 = in.m_63.y;
    float _1537 = in.m_63.z;
    float _1539 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1541 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1455);
    if (_1419)
    {
        float _1543 = _1453 ? as_type<float>(_1507) : _1433;
        _1513 = _1543;
    }
    float _1545 = _1513;
    out.m_65.x = _280;
    float _1547 = fma(_1539, _1531, -0.5);
    float _1549 = -_916;
    bool _1551 = _422 != _1549;
    bool _1553 = isnan(_422);
    bool _1555 = _1551 || _1553;
    bool _1557 = isnan(_1549);
    bool _1559 = _1555 || _1557;
    if (!_1411)
    {
        _142 = _1433;
    }
    float _1561 = _142;
    float _1563 = -_1481;
    float _1565 = fma(_1473, _1547, _1563);
    bool _1567 = _930 == 0.0;
    bool _1569 = !_1559;
    bool _1571 = _1567 && _1569;
    out.m_67.x = _930;
    float _1573 = _1561;
    if (_1411)
    {
        float _1575 = _1523 ? as_type<float>(_1519) : _1433;
        _1573 = _1575;
    }
    float _1577 = _1573;
    float _1579 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1581 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1583 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1585 = _902 == 0.0;
    bool _1587 = _1585 && _1571;
    float _1589 = fma(_1483, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1579);
    float _1591 = fma(_1483, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1581);
    float _1593 = fma(_1483, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1583);
    float _1595 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1597 = -_1527;
    float _1599 = _1597 + 1.0;
    float _1601 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1591);
    float _1603 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1589);
    float _1605 = _830 * _1537;
    float _1607 = _844 * _1537;
    float _1609 = fma(_1487, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1593);
    float _1611 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1613 = -_1605;
    float _1615 = fma(_844, _1535, _1613);
    float _1617 = fma(_830, _1535, _1607);
    float _1619 = fma(_1595, _1545, -0.5);
    out.m_69.x = _1601;
    out.m_69.y = _1603;
    out.m_69.z = _1609;
    float _1621 = _886 * _1615;
    float _1623 = _870 * _1615;
    float _1625 = _1617 * _1485;
    float _1627 = _1318 * 0.5;
    float _1629 = -_1621;
    float _1631 = fma(_870, _1533, _1629);
    float _1633 = fma(_886, _1533, _1623);
    float _1635 = fma(_1541, _1619, _1493);
    float _1637 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1639 = _1631 * _1487;
    float _1641 = -_1625;
    float _1643 = fma(_1633, _1487, _1641);
    float _1645 = fma(_1354, -0.5, _1627);
    float _1647 = -_1639;
    float _1649 = fma(_1617, _1483, _1647);
    float _1651 = _1633 * _1483;
    float _1653 = _1643 * _1489;
    float _1655 = _1633;
    float _1657 = _1631;
    float _1659 = _1617;
    if (!_1587)
    {
        float _1661 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1633);
        _1655 = _1661;
    }
    float _1663 = _1655;
    float _1665 = _1649 * _1489;
    float _1667 = -_1651;
    float _1669 = fma(_1631, _1485, _1667);
    if (!_1587)
    {
        float _1671 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1631);
        _1657 = _1671;
    }
    float _1673 = _1657;
    float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1677 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1679 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1681 = _1665 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1683 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1685 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1677);
    float _1687 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1679);
    float _1689 = fma(_1653, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1681);
    float _1691 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1693 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1695 = _1663 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1697 = _1669 * _1489;
    float _1699 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1691);
    float _1701 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1683);
    float _1703 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1693);
    float _1705 = fma(_1673, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1695);
    float _1707 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1687);
    float _1709 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1685);
    float _1711 = fma(_1697, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1689);
    float _1713 = fma(_1272, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1699);
    float _1715 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_1587)
    {
        float _1717 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1617);
        _1659 = _1717;
    }
    float _1719 = _1659;
    float _1721 = _1611 * _1637;
    out.m_71.x = _1707;
    out.m_71.y = _1709;
    out.m_71.z = _1711;
    float _1723 = fma(_1296, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1713);
    float _1725 = _1715 * _1675;
    float _1727 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1701);
    float _1729 = _1346 + _1318;
    float _1731 = _1723 + _1318;
    float _1733 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1703);
    float _1735 = _1565 + 0.5;
    float _1737 = _1635 + 0.5;
    float _1739 = fma(_1719, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1705);
    float _1741 = _1731 * 0.5;
    float _1743 = _1729 * 0.5;
    float _1745 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _1737;
    out.m_73.y = _1735;
    out.m_73.z = _1721;
    out.m_73.w = _1725;
    float _1747 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1727;
    out.m_75.y = _1733;
    out.m_75.z = _1739;
    out.m_77.x = _966;
    out.m_77.y = _1000;
    out.m_77.z = _960;
    out.m_79.x = _1064;
    out.m_79.y = _1062;
    out.m_79.z = _1066;
    out.m_45.x = 1.0;
    out.gl_Position.x = _1346;
    out.gl_Position.y = _1354;
    out.gl_Position.z = _1723;
    out.gl_Position.w = _1318;
    out.m_81.x = _1743;
    out.m_81.y = _1645;
    out.m_81.z = _1741;
    out.m_81.w = _1318;
    out.m_83.w = _1747;
    float _1749 = _1745 * _1378;
    float _1751 = -_1745;
    float _1753 = _1751 + 1.0;
    float _1755 = _1389 * _1749;
    float _1757 = _1389 * _1753;
    float _1759 = _1403 * _1749;
    float _1761 = fma(_1399, _1755, _1383);
    float _1763 = fma(_1401, _1755, _1385);
    float _1765 = fma(_1389, _1759, _1387);
    out.m_85.x = _1761;
    out.m_85.y = _1763;
    out.m_85.z = _1765;
    out.m_85.w = _1757;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

