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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1725 = false;
    bool _914 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2031 = as_type<float>(_124);
        out.gl_Position.z = _2031;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2100 = as_type<float>(_160);
        out.gl_Position.z = _2100;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = in.m_57.x;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _170 = _168 != 0;
    float _172 = _142 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _174 = 0.0 + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = in.m_48.x;
    float _180 = in.m_48.y;
    float _182 = in.m_48.z;
    float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _186 = in.m_59.w;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _194 = _192 != 0;
    float _196 = in.m_57.y;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _200 = _198 != 0;
    float _202 = _172 * _164;
    float _204 = in.m_55.y;
    float _206 = fma((*spvDescriptorSet0.vp_c10)._m0[3].x, 0.10000002384185791015625, 1.0);
    float _208 = 0.0;
    float _210 = _204;
    if (!_170)
    {
        float _212 = -_162;
        float _214 = _212 + 1.0;
        _208 = _214;
    }
    float _216 = _208;
    float _218 = _216;
    if (_170)
    {
        float _220 = -_162;
        float _222 = _220 + 1.0;
        _218 = _222;
    }
    float _224 = _218;
    float _226 = 0.0;
    if (!_170)
    {
        _226 = _162;
    }
    float _228 = _226;
    float _230 = fma(_166, 1234.0, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _232 = -_162;
    float _234 = _224 + _232;
    float _236 = _180 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _238 = _180 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _240 = _180 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _242 = _230 * 0.01666666753590106964111328125;
    float _244 = fma(_176, _234, _162);
    float _246 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].x, _236);
    float _248 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].x, _240);
    float _250 = _242 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _252 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].x, _238);
    float _254 = _244 * 6.283185482025146484375;
    float _256 = in.m_61.x;
    float _258 = in.m_61.y;
    float _260 = in.m_61.z;
    float _262 = _250 * 6.283185482025146484375;
    float _264 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].z, _246);
    float _266 = _254 * 0.15915493667125701904296875;
    float _268 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].z, _252);
    float _270 = -_262;
    float _272 = fma(_244, 7.539823055267333984375, _270);
    float _274 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].z, _248);
    float _276 = _266 * 6.283185482025146484375;
    float _278 = cos(_276);
    float _280 = _268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _282 = _272 * 0.15915493667125701904296875;
    float _284 = fma(_176, -2.0, 1.0);
    float _286 = _264 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _290 = _280 + _288;
    float _292 = _274 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _294 = (*spvDescriptorSet0.vp_c10)._m0[3].x * 1.5;
    float _296 = _282 * 6.283185482025146484375;
    float _298 = sin(_296);
    float _300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _302 = _286 + _300;
    float _304 = _290 * _290;
    bool _306 = _284 > 0.0;
    float _308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _310 = _292 + _308;
    bool _312 = _284 >= 0.0;
    bool _314 = isnan(_284);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = fma(_302, _302, _304);
    out.m_63.w = _186;
    int _324 = _320 ? 0 : 1;
    float _326 = fma(_310, _310, _322);
    float _328 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _330 = fma(_278, -0.5, 0.5);
    int _332 = ~_324;
    int _334 = _332 + 1;
    int _336 = _334 + 1;
    float _338 = rsqrt(_326);
    float _340 = fma(0.5, (*spvDescriptorSet0.vp_c10)._m0[3].x, -0.25);
    float _342 = fma(_298, 0.5, 0.5);
    int _344 = _336;
    float _346 = _228;
    float _348 = _286;
    float _350 = _292;
    if (!_306)
    {
        int _352 = ~_324;
        int _354 = _352 + 1;
        _344 = _354;
    }
    int _356 = _344;
    float _358 = fma(_328, _330, 0.125);
    bool _360 = _196 > 0.5;
    float _362 = fma(_294, _342, 1.0);
    float _364 = float(_356);
    float _366 = in.m_65.x;
    float _368 = in.m_65.y;
    float _370 = in.m_65.z;
    float _372 = _244 * _358;
    float _374 = _364 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    int _376 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _378 = _376 != 0;
    float _380 = _372 * _362;
    float _382 = _374 * 0.15915493667125701904296875;
    float _384 = _290 * _338;
    float _386 = 0.0 + _380;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _302 * _338;
    float _392 = -_384;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[18].w, _290);
    float _396 = _388 * 0.52359902858734130859375;
    float _398 = -_390;
    float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _302);
    float _402 = _382 * 6.283185482025146484375;
    float _404 = sin(_402);
    float _406 = _394 * _394;
    float _408 = _396 * 0.15915493667125701904296875;
    float _410 = _310 * _338;
    float _412 = -_340;
    float _414 = _412 + _260;
    float _416 = fma(_400, _400, _406);
    float _418 = precise::max(0.0, _380);
    float _420 = -_410;
    float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _310);
    float _424 = _366 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = _408 * 6.283185482025146484375;
    float _428 = sin(_426);
    float _430 = precise::min(_418, 2.625);
    float _432 = fma(_422, _422, _416);
    float _434 = _368 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = _370 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _438 = fma(_430, 1.14285719394683837890625, 1.0);
    float _440 = fma(_430, -0.2857142984867095947265625, 1.0);
    float _442 = _408 * 6.283185482025146484375;
    float _444 = cos(_442);
    float _446 = -_204;
    float _448 = _446 + 1.0;
    float _450 = _414 * _438;
    float _452 = _438 * _256;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _456 = _450 * _440;
    bool _458 = _360;
    float _460 = _390;
    float _462 = _410;
    if (_200)
    {
        float _464 = _360 ? _448 : _204;
        _210 = _464;
    }
    float _466 = _210;
    float _468 = sqrt(_432);
    float _470 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[20].x, _202);
    float _472 = _452 * _206;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _476 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _478 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_170)
    {
        bool _480 = _166 > 0.5;
        _458 = _480;
    }
    bool _482 = _458;
    float _484 = _382 * 6.283185482025146484375;
    float _486 = cos(_484);
    float _488 = _456 * _444;
    float _490 = _456 * _428;
    float _492 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _474);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _496 = fma(_380, _428, _488);
    float _498 = -_490;
    float _500 = fma(_380, _444, _498);
    float _502 = _472 * _404;
    float _504 = _338 * _468;
    float _506 = _496 * _206;
    float _508 = _500 * _206;
    float _510 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _512 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _514 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _516 = _476 * _504;
    float _518 = fma(_510, -2.0, _494);
    float _520 = _472 * _486;
    float _522 = -_502;
    float _524 = fma(_506, _486, _522);
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _508);
    float _528 = _512 * _504;
    float _530 = fma(_506, _404, _520);
    float _532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _524);
    float _534 = _514 * _504;
    float _536 = _516 * _526;
    float _538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _530);
    float _540 = _528 * _532;
    float _542 = _536 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _544 = _534 * _538;
    float _546 = _536 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _548 = -_454;
    float _550 = fma(_478, 2.0, _548);
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _554 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[8].x, _542);
    float _556 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[10].x, _546);
    float _558 = _536 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _560 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[8].z, _554);
    float _562 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[10].z, _556);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _566 = _286 + _560;
    float _568 = _292 + _562;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _574 = _566 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _578 = _568 + _576;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _586 = _574 * _574;
    float _588 = _578 * _578;
    float _590 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _582);
    float _592 = _552 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _594 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _596 = _586 + _588;
    float _598 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[9].x, _558);
    float _604 = sqrt(_596);
    float _606 = _584;
    float _608 = _586;
    float _610 = _588;
    float _612 = _566;
    float _614 = _568;
    if (_170)
    {
        float _616 = _482 ? _224 : _162;
        _346 = _616;
    }
    float _618 = _346;
    float _620 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _492);
    out.m_67.x = _594;
    out.m_67.y = _598;
    out.m_67.z = _600;
    out.m_67.w = _584;
    float _622 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[9].z, _602);
    float _624 = -_142;
    float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[76].x, _550);
    float _628 = in.m_69.x;
    float _630 = in.m_69.y;
    float _632 = in.m_69.z;
    float _634 = floor(_470);
    float _636 = fma(_592, _466, -0.5);
    float _638 = _184 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _640 = _508 != 0.0;
    bool _642 = isnan(_508);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _518);
    float _652 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _590);
    bool _654 = _604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _656 = _280 + _622;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _664 = _530 == 0.0;
    bool _666 = !_648;
    bool _668 = _664 && _666;
    float _670 = fma(_638, _618, -0.5);
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _674 = !_190;
    int _676 = _674 ? 0 : 1;
    float _678 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _680 = !_194;
    int _682 = _680 ? 0 : 1;
    float _684 = _660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _686 = _524 == 0.0;
    bool _688 = _686 && _668;
    float _690 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_654)
    {
        _606 = _656;
    }
    float _692 = _606;
    bool _694 = !_654;
    float _696 = _692;
    float _698 = _630;
    float _700 = _628;
    float _702 = _632;
    if (!_694)
    {
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _708 = _604 + _706;
        float _710 = rsqrt(_596);
        float _712 = _708 * _704;
        float _714 = _656 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _716 = _712 * 0.15915493667125701904296875;
        float _718 = _716 * 6.283185482025146484375;
        float _720 = sin(_718);
        float _722 = _716 * 6.283185482025146484375;
        float _724 = cos(_722);
        float _726 = fma(_720, _714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _728 = _710 * _726;
        float _730 = _724 + (-1.0);
        float _732 = fma(_574, _728, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _734 = fma(_578, _728, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _736 = _730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _740 = _732 + _738;
        float _742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _744 = _734 + _742;
        float _746 = fma(_656, _724, _736);
        float _748 = _740 * _740;
        float _750 = _744 * _744;
        _696 = _746;
        _608 = _748;
        _610 = _750;
        _612 = _732;
        _614 = _734;
    }
    float _752 = _696;
    float _754 = _608;
    float _756 = _610;
    float _758 = _612;
    float _760 = _614;
    float _762 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _764 = _752 + _762;
    float _766 = -_634;
    float _768 = _470 + _766;
    float _770 = _470 * 6.283185482025146484375;
    if (!_688)
    {
        float _772 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _630);
        _698 = _772;
    }
    float _774 = _698;
    float _776 = fma(_764, _764, _754);
    out.m_71.x = _678;
    out.m_71.y = _684;
    out.m_71.z = _690;
    out.m_71.w = _672;
    float _778 = _770 * 0.15915493667125701904296875;
    if (!_688)
    {
        float _780 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[17].y, _628);
        _700 = _780;
    }
    float _782 = _700;
    float _784 = _776 + _756;
    float _786 = _774 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _788 = _774 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _790 = fma(_620, _670, _626);
    if (!_688)
    {
        float _792 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[17].y, _632);
        _702 = _792;
    }
    float _794 = _702;
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _786);
    float _798 = sqrt(_784);
    float _800 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].x, _788);
    int _802 = abs(_676);
    float _804 = -_650;
    float _806 = fma(_652, _636, _804);
    out.m_73.x = _244;
    float _808 = _774 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _810 = _806 + 0.5;
    float _812 = _778 * 6.283185482025146484375;
    float _814 = cos(_812);
    float _816 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].x, _808);
    float _818 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _796);
    float _820 = -_768;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _824 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _816);
    float _826 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _800);
    bool _828 = !_378;
    int _830 = _828 ? 0 : 1;
    float _832 = _790 + 0.5;
    float _834 = float(_802);
    out.m_75.x = _818;
    out.m_75.y = _824;
    out.m_75.z = _826;
    bool _836 = _798 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _838 = isnan(_798);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _844 = _840 || _842;
    int _846 = abs(_830);
    float _848 = abs(_822);
    float _850 = _834 * _848;
    float _852 = fma(_814, 0.5, 0.5);
    int _854 = abs(_682);
    out.m_77.x = _832;
    out.m_77.y = _810;
    bool _856 = _768 < 0.5;
    float _858 = float(_856);
    float _860 = -_852;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _864 = float(_846);
    float _866 = -_858;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _870 = fma(_864, _862, _850);
    float _872 = _864;
    if (!_844)
    {
        _872 = 1.0;
    }
    float _874 = _872;
    float _876 = float(_854);
    float _878 = abs(_868);
    float _880 = fma(_876, _878, _870);
    bool _882 = !_844;
    float _884 = _874;
    if (!_882)
    {
        bool _886 = _798 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _888 = isnan(_798);
        bool _890 = _886 || _888;
        bool _892 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _894 = _890 || _892;
        if (!_894)
        {
            float _896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _898 = _798 + _896;
            float _900 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _902 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _900;
            float _904 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _906 = _904 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _908 = 1.0 / _902;
            float _910 = _898 * _908;
            float _912 = fma(_910, _906, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _884 = _912;
            _914 = true;
        }
        else
        {
            bool _916 = _798 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _918 = isnan(_798);
            bool _920 = _916 || _918;
            bool _922 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _924 = _920 || _922;
            if (!_924)
            {
                float _926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _928 = _798 + _926;
                float _930 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _932 = _930 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _934 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _936 = _934 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _938 = 1.0 / _932;
                float _940 = _928 * _938;
                float _942 = fma(_940, _936, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _884 = _942;
                _914 = true;
            }
            else
            {
                _884 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _914 = false;
    float _944 = _884;
    float _946 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _948 = _752 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _952 = _758 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _956 = _760 + _954;
    float _958 = fma(_948, _944, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _960 = fma(_952, _944, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _962 = -_384;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _966 = fma(_956, _944, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _968 = -_390;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _960);
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _964 + _972;
    float _976 = -_410;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _966);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = _970 + _980;
    float _984 = _974 * _974;
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _988 = _978 + _986;
    float _990 = fma(_982, _982, _984);
    float _992 = fma(_988, _988, _990);
    float _994 = rsqrt(_992);
    float _996 = _994 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _998 = _982 * _996;
    float _1000 = _988 * _996;
    float _1002 = _998 * _998;
    float _1004 = _1000 * _1000;
    float _1006 = _1002 + _1004;
    float _1008 = sqrt(_1006);
    bool _1010 = _1008 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1014 = _1008 + _1012;
    float _1016 = _850;
    float _1018 = _994;
    float _1020 = _1014;
    float _1022 = _974;
    if (_1010)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1024;
    }
    float _1026 = _1016;
    if (_1010)
    {
        float _1028 = rsqrt(_1006);
        _1018 = _1028;
    }
    float _1030 = _1018;
    float _1032 = _1026;
    float _1034 = _1030;
    if (_1010)
    {
        float _1036 = _1014 * _1026;
        _1020 = _1036;
    }
    float _1038 = _1020;
    if (_1010)
    {
        float _1040 = _1038 * 0.15915493667125701904296875;
        _1032 = _1040;
    }
    float _1042 = _1032;
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1046 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1048 = _988;
    float _1050 = _1042;
    if (_1010)
    {
        float _1052 = _1042 * 6.283185482025146484375;
        float _1054 = sin(_1052);
        _1048 = _1054;
    }
    float _1056 = _1048;
    float _1058 = precise::max(0.0, _1044);
    float _1060 = -_996;
    float _1062 = -_1058;
    float _1064 = fma(_974, _1060, _1062);
    float _1066 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1010)
    {
        float _1068 = _1042 * 6.283185482025146484375;
        float _1070 = cos(_1068);
        _1066 = _1070;
    }
    float _1072 = _1066;
    float _1074 = -_390;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _286);
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1010)
    {
        float _1080 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1080;
    }
    float _1082 = _1022;
    if (!_1010)
    {
        _460 = _1002;
    }
    float _1084 = _460;
    float _1086 = _964 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1088 = _1084;
    if (_1010)
    {
        float _1090 = fma(_1056, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _348 = _1090;
    }
    float _1092 = _348;
    float _1094 = -_410;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _1098 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1010)
    {
        _462 = _1064;
    }
    float _1100 = _462;
    float _1102 = _1100;
    if (_1010)
    {
        float _1104 = _1030 * _1092;
        _1078 = _1104;
    }
    float _1106 = _1078;
    if (!_1010)
    {
        _1034 = _998;
    }
    float _1108 = _1034;
    float _1110 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1086);
    float _1112 = _1108;
    if (!_1010)
    {
        _1050 = _1000;
    }
    float _1114 = _1050;
    float _1116 = _1114;
    float _1118 = _1072;
    if (_1010)
    {
        float _1120 = _1072 + (-1.0);
        _350 = _1120;
    }
    float _1122 = _350;
    float _1124 = _1122;
    if (_1010)
    {
        float _1126 = _998 * _1106;
        _1112 = _1126;
    }
    float _1128 = _1112;
    if (_1010)
    {
        float _1130 = _1000 * _1106;
        _1116 = _1130;
    }
    float _1132 = _1116;
    if (_1010)
    {
        float _1134 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1124 = _1134;
    }
    float _1136 = _1124;
    if (_1010)
    {
        float _1138 = _1128 * _1128;
        _1088 = _1138;
    }
    float _1140 = _1088;
    float _1142 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1110);
    float _1144 = floor(_1098);
    if (_1010)
    {
        float _1146 = fma(_1064, _1072, _1136);
        _1102 = _1146;
    }
    float _1148 = _1102;
    if (!_1010)
    {
        _1118 = _1004;
    }
    float _1150 = _1118;
    float _1152 = _1150;
    if (_1010)
    {
        float _1154 = _1132 * _1132;
        _1152 = _1154;
    }
    float _1156 = _1152;
    float _1158 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1160 = fma(_1148, _1148, _1140);
    float _1162 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1164 = _964 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = sqrt(_992);
    float _1168 = _1160 + _1156;
    float _1170 = _964 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1172 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1174 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1170);
    float _1176 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1172);
    float _1178 = floor(_1162);
    float _1180 = _964 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1174);
    float _1184 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1186 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1190 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1188);
    float _1192 = precise::clamp(_1190, 0.0, 1.0);
    float _1194 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1184);
    float _1196 = rsqrt(_1168);
    float _1198 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1200 = -_1192;
    float _1202 = _1200 + 1.0;
    float _1204 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1206 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1208 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1210 = -_1178;
    float _1212 = _1162 + _1210;
    float _1214 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1206);
    float _1216 = abs(_1202);
    float _1218 = log2(_1216);
    float _1220 = -_1208;
    float _1222 = fma(_1220, _1046, 1.0);
    float _1224 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1214);
    float _1226 = _1196 * _1128;
    float _1228 = _1196 * _1148;
    float _1230 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1224);
    float _1232 = _1196 * _1132;
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1236 = log2(_1222);
    float _1238 = _1228 + 1.0;
    float _1240 = -_1234;
    float _1242 = fma(_1228, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1240);
    float _1244 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1246 = -_1232;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1242);
    float _1250 = exp2(_1244);
    float _1252 = -_1144;
    float _1254 = _1098 + _1252;
    float _1256 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1258 = fma(_1248, -0.5, 0.5);
    float _1260 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1262 = fma(_1248, 0.5, 0.5);
    float _1264 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1256);
    float _1266 = 1.0 / _1230;
    float _1268 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1260);
    float _1270 = fma(_1262, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1272 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1264);
    float _1274 = _1236 * 0.693147182464599609375;
    float _1276 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1268);
    float _1278 = fma(_1262, _1270, -0.212114393711090087890625);
    float _1280 = sqrt(_1258);
    float _1282 = -_1228;
    float _1284 = fma(_1250, _1238, _1282);
    float _1286 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1272);
    float _1288 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1276);
    float _1290 = fma(_1262, _1278, 1.570728778839111328125);
    float _1292 = fma(_1284, 0.5, 0.5);
    float _1294 = _1286 * _1266;
    float _1296 = _1288 * _1266;
    float _1298 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1300 = fma(_1296, -0.5, 0.5);
    float _1302 = _1280 * 0.636619746685028076171875;
    float _1304 = fma(_1294, 0.5, 0.5);
    float _1306 = -_1290;
    float _1308 = fma(_1302, _1306, 1.0);
    float2 _4000 = float2(_1254, _1212);
    float _1310 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4000, float2(0.0), isnan(_4000)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4000, float2(0.0), isnan(_4000)), level(0.0)).x;
    float3 _4011 = float3(_1304, _1300, _1298);
    float _1312 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4011, float3(0.0), isnan(_4011)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4011, float3(0.0), isnan(_4011)), level(0.0)).x;
    float3 _4022 = float3(_1304, _1300, _1298);
    float4 _1315 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4022, float3(0.0), isnan(_4022)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4022, float3(0.0), isnan(_4022)), level(0.0)).xyzw;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = _1315.w;
    float2 _4038 = float2(_1308, _1292);
    float3 _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4038, float2(0.0), isnan(_4038)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4038, float2(0.0), isnan(_4038)), level(0.0)).xyz;
    float _1329 = _1327.x;
    float _1331 = _1327.y;
    float _1333 = _1327.z;
    float _1335 = -_384;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _280);
    float _1339 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1341 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1343 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1347 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1339);
    float _1349 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1343);
    float _1351 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1353 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1349);
    float _1355 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1351);
    float _1357 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1347);
    float _1359 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1361 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1363 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1357);
    float _1365 = 1.0 / _1359;
    float _1367 = _1361 + _1359;
    float _1369 = _1363 + _1230;
    float _1371 = _1369 * 0.5;
    float _1373 = in.m_79.x;
    float _1375 = _1367 * _1365;
    float _1377 = _1375 * 0.5;
    out.m_81.z = _1371;
    out.m_81.w = _1230;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1381 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1379);
    float _1383 = 1.0 / _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1387 = _1383 * _1385;
    float _1389 = abs(_1387);
    float _1391 = log2(_1389);
    float _1393 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1395 = exp2(_1393);
    bool _1397 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan(0.5);
    bool _1405 = _1401 || _1403;
    out.gl_Position.x = _1286;
    out.gl_Position.y = _1288;
    out.gl_Position.z = _1363;
    out.gl_Position.w = _1230;
    float _1407 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = exp2(_1341);
    bool _1413 = _1387 <= 8000.0;
    bool _1415 = isnan(_1387);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(8000.0);
    bool _1421 = _1417 || _1419;
    float _1423 = float(_1421);
    float _1425 = fma(_1409, -2.0, 3.0);
    float _1427 = _1409 * _1409;
    float _1429 = _1286;
    float _1431 = _1387;
    if (_1405)
    {
        _1429 = 1.0;
    }
    float _1433 = _1429;
    float _1435 = _1427 * _1425;
    float _1437 = -_1435;
    float _1439 = _1437 + 1.0;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1435);
    float _1443 = _1439;
    float _1445 = _1433;
    if (_1405)
    {
        _1443 = 1.0;
    }
    float _1447 = _1443;
    float _1449 = _1423 * _1441;
    float _1451 = _1447;
    float _1453 = _1321;
    float _1455 = _1373;
    float _1457 = _1323;
    if (!_1405)
    {
        float _1459 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1463 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1461;
        float _1465 = _1459 * 0.15915493667125701904296875;
        float _1467 = _1465 * 6.283185482025146484375;
        float _1469 = cos(_1467);
        float _1471 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1473 = _1471 * 0.15915493667125701904296875;
        float _1475 = _1465 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        float _1479 = 1.0 / _1469;
        float _1481 = _1473 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1477 * _1479;
        float _1487 = _1473 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = _1483 * _1485;
        float _1493 = 1.0 / _1463;
        float _1495 = 1.0 / _1491;
        float _1497 = _1489 * _1495;
        float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1501 = fma(_1387, _1497, _1499);
        float _1503 = _1501 * _1493;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1451 = _1505;
    }
    float _1507 = _1451;
    if (!_1405)
    {
        float _1509 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1511 = _1509 * 0.15915493667125701904296875;
        float _1513 = _1511 * 6.283185482025146484375;
        float _1515 = cos(_1513);
        float _1517 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1519 = _1517 * 0.15915493667125701904296875;
        float _1521 = _1511 * 6.283185482025146484375;
        float _1523 = sin(_1521);
        float _1525 = 1.0 / _1515;
        float _1527 = _1519 * 6.283185482025146484375;
        float _1529 = cos(_1527);
        float _1531 = _1523 * _1525;
        float _1533 = _1519 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        float _1537 = _1529 * _1531;
        float _1539 = 1.0 / _1537;
        float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1543 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1541;
        float _1545 = 1.0 / _1543;
        float _1547 = _1535 * _1539;
        float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1551 = fma(_1387, _1547, _1549);
        float _1553 = _1551 * _1545;
        float _1555 = precise::clamp(_1553, 0.0, 1.0);
        float _1557 = -_1555;
        float _1559 = _1557 + 1.0;
        _1445 = _1559;
        _1431 = _1555;
    }
    float _1561 = _1445;
    float _1563 = _1431;
    float _1565 = -_1411;
    float _1567 = _1565 + 1.0;
    float _1569 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1571 = -_1310;
    float _1573 = _1571 + 1.0;
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1577 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1579 = isnan(_1166);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1585 = _1581 || _1583;
    float _1587 = _1573 * _1569;
    float _1589 = precise::clamp(_1587, 0.0, 1.0);
    float _1591 = _1575 * _1312;
    float _1593 = -_1575;
    float _1595 = _1593 + 1.0;
    float _1597 = -_1589;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1601 = _1323 * _1591;
    float _1603 = _1333 * _1591;
    float _1605 = _1599 * _1373;
    float _1607 = _1323 * _1595;
    float _1609 = fma(_1329, _1601, _1317);
    float _1611 = fma(_1331, _1601, _1319);
    float _1613 = _1605 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1615 = fma(_1323, _1603, _1321);
    float _1617 = _1507 * _1561;
    float _1619 = _1563;
    float _1621 = _1617;
    float _1623 = _1595;
    if (!_1585)
    {
        _1453 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1625 = _1453;
    out.m_83.x = _1613;
    float _1627 = _880 * _1617;
    float _1629 = _1625;
    float _1631 = _1625;
    if (!_1585)
    {
        _1455 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1633 = _1455;
    out.m_85.x = _1609;
    out.m_85.y = _1611;
    out.m_85.z = _1615;
    out.m_85.w = _1607;
    float _1635 = _1633;
    float _1637 = _1633;
    if (!_1585)
    {
        _1457 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1639 = _1457;
    float _1641 = _1639;
    float _1643 = _1639;
    if (!_1585)
    {
        _1619 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1645 = _1619;
    float _1647 = _1645;
    float _1649 = _1645;
    if (!_1585)
    {
        _1621 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1651 = _1621;
    float _1653 = _1651;
    float _1655 = _1651;
    if (!_1585)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1657 = _1623;
    bool _1659 = !_1585;
    float _1661 = _1657;
    float _1663 = _1657;
    if (!_1659)
    {
        bool _1665 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1667 = isnan(_1166);
        bool _1669 = _1665 || _1667;
        bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1673 = _1669 || _1671;
        if (!_1673)
        {
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1677 = _1166 + _1675;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1679;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1687 = 1.0 / _1681;
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1705 = _1677 * _1687;
            float _1707 = precise::clamp(_1705, 0.0, 1.0);
            float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1713 = fma(_1707, _1685, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1715 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1717 = fma(_1707, _1691, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1719 = fma(_1707, _1695, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1721 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1723 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1637 = _1717;
            _1655 = _1721;
            _1631 = _1713;
            _1649 = _1719;
            _1643 = _1715;
            _1663 = _1723;
            _1725 = true;
        }
        else
        {
            bool _1727 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1729 = isnan(_1166);
            bool _1731 = _1727 || _1729;
            bool _1733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1735 = _1731 || _1733;
            if (!_1735)
            {
                _1629 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1737 = _1629;
            _1631 = _1737;
            if (!_1735)
            {
                _1635 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1739 = _1635;
            _1637 = _1739;
            if (!_1735)
            {
                _1641 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1741 = _1641;
            _1643 = _1741;
            if (!_1735)
            {
                _1647 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1743 = _1647;
            _1649 = _1743;
            if (!_1735)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1745 = _1653;
            _1655 = _1745;
            if (!_1735)
            {
                _1661 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1747 = _1661;
            bool _1749 = !_1735;
            _1663 = _1747;
            if (!_1749)
            {
                bool _1751 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1753 = isnan(_1166);
                bool _1755 = _1751 || _1753;
                bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1759 = _1755 || _1757;
                if (!_1759)
                {
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1763 = _1166 + _1761;
                    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1765;
                    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1773 = 1.0 / _1767;
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1791 = _1763 * _1773;
                    float _1793 = precise::clamp(_1791, 0.0, 1.0);
                    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1799 = fma(_1793, _1771, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1801 = fma(_1793, _1797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1803 = fma(_1793, _1777, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1805 = fma(_1793, _1781, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1807 = fma(_1793, _1785, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1809 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1637 = _1803;
                    _1655 = _1807;
                    _1631 = _1799;
                    _1649 = _1805;
                    _1643 = _1801;
                    _1663 = _1809;
                    _1725 = true;
                }
                else
                {
                    _1637 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1631 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1649 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1643 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1663 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1725 = false;
    float _1811 = _1637;
    float _1813 = _1655;
    float _1815 = _1631;
    float _1817 = _1649;
    float _1819 = _1643;
    float _1821 = _1663;
    float _1823 = fma(_824, -0.5, 0.5);
    float _1825 = precise::clamp(_1823, 0.0, 1.0);
    float _1827 = -_1811;
    float _1829 = _1827 + _1813;
    float _1831 = _1627 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1833 = -_1815;
    float _1835 = _1833 + _1817;
    out.m_87.x = 0.0;
    float _1837 = fma(_1825, _1829, _1811);
    float _1839 = -_1819;
    float _1841 = _1839 + _1821;
    out.m_51.x = _1831;
    float _1843 = fma(_1825, _1835, _1815);
    float _1845 = _1837 * 0.586610972881317138671875;
    bool _1847 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1849 = fma(_1825, _1841, _1819);
    float _1851 = fma(_1843, 0.298911988735198974609375, _1845);
    bool _1853 = _1507 > 0.0;
    bool _1855 = isnan(_1507);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.0);
    bool _1861 = _1857 || _1859;
    float _1863 = fma(_1849, 0.114477999508380889892578125, _1851);
    bool _1865 = _1561 <= 0.0;
    bool _1867 = !_1861;
    bool _1869 = _1865 || _1867;
    float _1871 = -_1863;
    float _1873 = _1837 + _1871;
    float _1875 = -_1863;
    float _1877 = _1843 + _1875;
    float _1879 = -_1863;
    float _1881 = _1849 + _1879;
    float _1883 = fma(_1873, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1885 = fma(_1877, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1887 = fma(_1881, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    bool _1889 = !_1847;
    if (!_1889)
    {
        float _1891 = -_964;
        float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1895 = -_970;
        float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1899 = -_978;
        float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1903 = _1893 * _1893;
        float _1905 = fma(_1897, _1897, _1903);
        float _1907 = fma(_1901, _1901, _1905);
        float _1909 = sqrt(_1907);
        float _1911 = rsqrt(_1907);
        float _1913 = -_1909;
        float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1917 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1919 = precise::clamp(_1917, 0.0, 1.0);
        float _1921 = _1897 * _1911;
        float _1923 = _1893 * _1911;
        float _1925 = abs(_1919);
        float _1927 = log2(_1925);
        float _1929 = _1901 * _1911;
        float _1931 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1933 = _824 * _1923;
        float _1935 = -_1923;
        float _1937 = -_1931;
        float _1939 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1937);
        float _1941 = fma(_818, _1921, _1933);
        float _1943 = -_1929;
        float _1945 = fma(_1943, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1939);
        float _1947 = fma(_826, _1929, _1941);
        float _1949 = precise::clamp(_1947, 0.0, 1.0);
        float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1953 = _1945 + _1951;
        float _1955 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1957 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1959 = precise::clamp(_1957, 0.0, 1.0);
        float _1961 = exp2(_1955);
        float _1963 = _1961 * _1959;
        float _1965 = _1949 * _1963;
        float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1969 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1971 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1967;
        out.m_87.y = _1969;
        out.m_87.z = _1971;
    }
    out.m_89.x = _1885;
    out.m_89.y = _1883;
    out.m_89.z = _1887;
    if (!_1869)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _1973 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1973;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1725 = false;
    bool _914 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2031 = as_type<float>(_124);
        out.gl_Position.z = _2031;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2100 = as_type<float>(_160);
        out.gl_Position.z = _2100;
    }
    if (_152)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = in.m_57.x;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _170 = _168 != 0;
    float _172 = _142 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _174 = 0.0 + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = in.m_48.x;
    float _180 = in.m_48.y;
    float _182 = in.m_48.z;
    float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _186 = in.m_59.w;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _194 = _192 != 0;
    float _196 = in.m_57.y;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _200 = _198 != 0;
    float _202 = _172 * _164;
    float _204 = in.m_55.y;
    float _206 = fma((*spvDescriptorSet0.vp_c10)._m0[3].x, 0.10000002384185791015625, 1.0);
    float _208 = 0.0;
    float _210 = _204;
    if (!_170)
    {
        float _212 = -_162;
        float _214 = _212 + 1.0;
        _208 = _214;
    }
    float _216 = _208;
    float _218 = _216;
    if (_170)
    {
        float _220 = -_162;
        float _222 = _220 + 1.0;
        _218 = _222;
    }
    float _224 = _218;
    float _226 = 0.0;
    if (!_170)
    {
        _226 = _162;
    }
    float _228 = _226;
    float _230 = fma(_166, 1234.0, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _232 = -_162;
    float _234 = _224 + _232;
    float _236 = _180 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _238 = _180 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _240 = _180 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _242 = _230 * 0.01666666753590106964111328125;
    float _244 = fma(_176, _234, _162);
    float _246 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].x, _236);
    float _248 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].x, _240);
    float _250 = _242 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _252 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].x, _238);
    float _254 = _244 * 6.283185482025146484375;
    float _256 = in.m_61.x;
    float _258 = in.m_61.y;
    float _260 = in.m_61.z;
    float _262 = _250 * 6.283185482025146484375;
    float _264 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].z, _246);
    float _266 = _254 * 0.15915493667125701904296875;
    float _268 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].z, _252);
    float _270 = -_262;
    float _272 = fma(_244, 7.539823055267333984375, _270);
    float _274 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].z, _248);
    float _276 = _266 * 6.283185482025146484375;
    float _278 = cos(_276);
    float _280 = _268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _282 = _272 * 0.15915493667125701904296875;
    float _284 = fma(_176, -2.0, 1.0);
    float _286 = _264 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _290 = _280 + _288;
    float _292 = _274 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _294 = (*spvDescriptorSet0.vp_c10)._m0[3].x * 1.5;
    float _296 = _282 * 6.283185482025146484375;
    float _298 = sin(_296);
    float _300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _302 = _286 + _300;
    float _304 = _290 * _290;
    bool _306 = _284 > 0.0;
    float _308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _310 = _292 + _308;
    bool _312 = _284 >= 0.0;
    bool _314 = isnan(_284);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = fma(_302, _302, _304);
    out.m_63.w = _186;
    int _324 = _320 ? 0 : 1;
    float _326 = fma(_310, _310, _322);
    float _328 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _330 = fma(_278, -0.5, 0.5);
    int _332 = ~_324;
    int _334 = _332 + 1;
    int _336 = _334 + 1;
    float _338 = rsqrt(_326);
    float _340 = fma(0.5, (*spvDescriptorSet0.vp_c10)._m0[3].x, -0.25);
    float _342 = fma(_298, 0.5, 0.5);
    int _344 = _336;
    float _346 = _228;
    float _348 = _286;
    float _350 = _292;
    if (!_306)
    {
        int _352 = ~_324;
        int _354 = _352 + 1;
        _344 = _354;
    }
    int _356 = _344;
    float _358 = fma(_328, _330, 0.125);
    bool _360 = _196 > 0.5;
    float _362 = fma(_294, _342, 1.0);
    float _364 = float(_356);
    float _366 = in.m_65.x;
    float _368 = in.m_65.y;
    float _370 = in.m_65.z;
    float _372 = _244 * _358;
    float _374 = _364 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    int _376 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _378 = _376 != 0;
    float _380 = _372 * _362;
    float _382 = _374 * 0.15915493667125701904296875;
    float _384 = _290 * _338;
    float _386 = 0.0 + _380;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _302 * _338;
    float _392 = -_384;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[18].w, _290);
    float _396 = _388 * 0.52359902858734130859375;
    float _398 = -_390;
    float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _302);
    float _402 = _382 * 6.283185482025146484375;
    float _404 = sin(_402);
    float _406 = _394 * _394;
    float _408 = _396 * 0.15915493667125701904296875;
    float _410 = _310 * _338;
    float _412 = -_340;
    float _414 = _412 + _260;
    float _416 = fma(_400, _400, _406);
    float _418 = precise::max(0.0, _380);
    float _420 = -_410;
    float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _310);
    float _424 = _366 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = _408 * 6.283185482025146484375;
    float _428 = sin(_426);
    float _430 = precise::min(_418, 2.625);
    float _432 = fma(_422, _422, _416);
    float _434 = _368 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = _370 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _438 = fma(_430, 1.14285719394683837890625, 1.0);
    float _440 = fma(_430, -0.2857142984867095947265625, 1.0);
    float _442 = _408 * 6.283185482025146484375;
    float _444 = cos(_442);
    float _446 = -_204;
    float _448 = _446 + 1.0;
    float _450 = _414 * _438;
    float _452 = _438 * _256;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _456 = _450 * _440;
    bool _458 = _360;
    float _460 = _390;
    float _462 = _410;
    if (_200)
    {
        float _464 = _360 ? _448 : _204;
        _210 = _464;
    }
    float _466 = _210;
    float _468 = sqrt(_432);
    float _470 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[20].x, _202);
    float _472 = _452 * _206;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _476 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _478 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_170)
    {
        bool _480 = _166 > 0.5;
        _458 = _480;
    }
    bool _482 = _458;
    float _484 = _382 * 6.283185482025146484375;
    float _486 = cos(_484);
    float _488 = _456 * _444;
    float _490 = _456 * _428;
    float _492 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _474);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _496 = fma(_380, _428, _488);
    float _498 = -_490;
    float _500 = fma(_380, _444, _498);
    float _502 = _472 * _404;
    float _504 = _338 * _468;
    float _506 = _496 * _206;
    float _508 = _500 * _206;
    float _510 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _512 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _514 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _516 = _476 * _504;
    float _518 = fma(_510, -2.0, _494);
    float _520 = _472 * _486;
    float _522 = -_502;
    float _524 = fma(_506, _486, _522);
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _508);
    float _528 = _512 * _504;
    float _530 = fma(_506, _404, _520);
    float _532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _524);
    float _534 = _514 * _504;
    float _536 = _516 * _526;
    float _538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _530);
    float _540 = _528 * _532;
    float _542 = _536 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _544 = _534 * _538;
    float _546 = _536 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _548 = -_454;
    float _550 = fma(_478, 2.0, _548);
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _554 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[8].x, _542);
    float _556 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[10].x, _546);
    float _558 = _536 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _560 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[8].z, _554);
    float _562 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[10].z, _556);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _566 = _286 + _560;
    float _568 = _292 + _562;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _574 = _566 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _578 = _568 + _576;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _586 = _574 * _574;
    float _588 = _578 * _578;
    float _590 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _582);
    float _592 = _552 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _594 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _596 = _586 + _588;
    float _598 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[9].x, _558);
    float _604 = sqrt(_596);
    float _606 = _584;
    float _608 = _586;
    float _610 = _588;
    float _612 = _566;
    float _614 = _568;
    if (_170)
    {
        float _616 = _482 ? _224 : _162;
        _346 = _616;
    }
    float _618 = _346;
    float _620 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _492);
    out.m_67.x = _594;
    out.m_67.y = _598;
    out.m_67.z = _600;
    out.m_67.w = _584;
    float _622 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[9].z, _602);
    float _624 = -_142;
    float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[76].x, _550);
    float _628 = in.m_69.x;
    float _630 = in.m_69.y;
    float _632 = in.m_69.z;
    float _634 = floor(_470);
    float _636 = fma(_592, _466, -0.5);
    float _638 = _184 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _640 = _508 != 0.0;
    bool _642 = isnan(_508);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _518);
    float _652 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _590);
    bool _654 = _604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _656 = _280 + _622;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _664 = _530 == 0.0;
    bool _666 = !_648;
    bool _668 = _664 && _666;
    float _670 = fma(_638, _618, -0.5);
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _674 = !_190;
    int _676 = _674 ? 0 : 1;
    float _678 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _680 = !_194;
    int _682 = _680 ? 0 : 1;
    float _684 = _660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _686 = _524 == 0.0;
    bool _688 = _686 && _668;
    float _690 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_654)
    {
        _606 = _656;
    }
    float _692 = _606;
    bool _694 = !_654;
    float _696 = _692;
    float _698 = _630;
    float _700 = _628;
    float _702 = _632;
    if (!_694)
    {
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _708 = _604 + _706;
        float _710 = rsqrt(_596);
        float _712 = _708 * _704;
        float _714 = _656 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _716 = _712 * 0.15915493667125701904296875;
        float _718 = _716 * 6.283185482025146484375;
        float _720 = sin(_718);
        float _722 = _716 * 6.283185482025146484375;
        float _724 = cos(_722);
        float _726 = fma(_720, _714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _728 = _710 * _726;
        float _730 = _724 + (-1.0);
        float _732 = fma(_574, _728, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _734 = fma(_578, _728, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _736 = _730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _740 = _732 + _738;
        float _742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _744 = _734 + _742;
        float _746 = fma(_656, _724, _736);
        float _748 = _740 * _740;
        float _750 = _744 * _744;
        _696 = _746;
        _608 = _748;
        _610 = _750;
        _612 = _732;
        _614 = _734;
    }
    float _752 = _696;
    float _754 = _608;
    float _756 = _610;
    float _758 = _612;
    float _760 = _614;
    float _762 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _764 = _752 + _762;
    float _766 = -_634;
    float _768 = _470 + _766;
    float _770 = _470 * 6.283185482025146484375;
    if (!_688)
    {
        float _772 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _630);
        _698 = _772;
    }
    float _774 = _698;
    float _776 = fma(_764, _764, _754);
    out.m_71.x = _678;
    out.m_71.y = _684;
    out.m_71.z = _690;
    out.m_71.w = _672;
    float _778 = _770 * 0.15915493667125701904296875;
    if (!_688)
    {
        float _780 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[17].y, _628);
        _700 = _780;
    }
    float _782 = _700;
    float _784 = _776 + _756;
    float _786 = _774 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _788 = _774 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _790 = fma(_620, _670, _626);
    if (!_688)
    {
        float _792 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[17].y, _632);
        _702 = _792;
    }
    float _794 = _702;
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _786);
    float _798 = sqrt(_784);
    float _800 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].x, _788);
    int _802 = abs(_676);
    float _804 = -_650;
    float _806 = fma(_652, _636, _804);
    out.m_73.x = _244;
    float _808 = _774 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _810 = _806 + 0.5;
    float _812 = _778 * 6.283185482025146484375;
    float _814 = cos(_812);
    float _816 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].x, _808);
    float _818 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _796);
    float _820 = -_768;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _824 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _816);
    float _826 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _800);
    bool _828 = !_378;
    int _830 = _828 ? 0 : 1;
    float _832 = _790 + 0.5;
    float _834 = float(_802);
    out.m_75.x = _818;
    out.m_75.y = _824;
    out.m_75.z = _826;
    bool _836 = _798 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _838 = isnan(_798);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _844 = _840 || _842;
    int _846 = abs(_830);
    float _848 = abs(_822);
    float _850 = _834 * _848;
    float _852 = fma(_814, 0.5, 0.5);
    int _854 = abs(_682);
    out.m_77.x = _832;
    out.m_77.y = _810;
    bool _856 = _768 < 0.5;
    float _858 = float(_856);
    float _860 = -_852;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _864 = float(_846);
    float _866 = -_858;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _870 = fma(_864, _862, _850);
    float _872 = _864;
    if (!_844)
    {
        _872 = 1.0;
    }
    float _874 = _872;
    float _876 = float(_854);
    float _878 = abs(_868);
    float _880 = fma(_876, _878, _870);
    bool _882 = !_844;
    float _884 = _874;
    if (!_882)
    {
        bool _886 = _798 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _888 = isnan(_798);
        bool _890 = _886 || _888;
        bool _892 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _894 = _890 || _892;
        if (!_894)
        {
            float _896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _898 = _798 + _896;
            float _900 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _902 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _900;
            float _904 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _906 = _904 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _908 = 1.0 / _902;
            float _910 = _898 * _908;
            float _912 = fma(_910, _906, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _884 = _912;
            _914 = true;
        }
        else
        {
            bool _916 = _798 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _918 = isnan(_798);
            bool _920 = _916 || _918;
            bool _922 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _924 = _920 || _922;
            if (!_924)
            {
                float _926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _928 = _798 + _926;
                float _930 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _932 = _930 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _934 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _936 = _934 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _938 = 1.0 / _932;
                float _940 = _928 * _938;
                float _942 = fma(_940, _936, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _884 = _942;
                _914 = true;
            }
            else
            {
                _884 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _914 = false;
    float _944 = _884;
    float _946 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _948 = _752 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _952 = _758 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _956 = _760 + _954;
    float _958 = fma(_948, _944, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _960 = fma(_952, _944, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _962 = -_384;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _966 = fma(_956, _944, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _968 = -_390;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _960);
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _964 + _972;
    float _976 = -_410;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _966);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = _970 + _980;
    float _984 = _974 * _974;
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _988 = _978 + _986;
    float _990 = fma(_982, _982, _984);
    float _992 = fma(_988, _988, _990);
    float _994 = rsqrt(_992);
    float _996 = _994 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _998 = _982 * _996;
    float _1000 = _988 * _996;
    float _1002 = _998 * _998;
    float _1004 = _1000 * _1000;
    float _1006 = _1002 + _1004;
    float _1008 = sqrt(_1006);
    bool _1010 = _1008 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1014 = _1008 + _1012;
    float _1016 = _850;
    float _1018 = _994;
    float _1020 = _1014;
    float _1022 = _974;
    if (_1010)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1024;
    }
    float _1026 = _1016;
    if (_1010)
    {
        float _1028 = rsqrt(_1006);
        _1018 = _1028;
    }
    float _1030 = _1018;
    float _1032 = _1026;
    float _1034 = _1030;
    if (_1010)
    {
        float _1036 = _1014 * _1026;
        _1020 = _1036;
    }
    float _1038 = _1020;
    if (_1010)
    {
        float _1040 = _1038 * 0.15915493667125701904296875;
        _1032 = _1040;
    }
    float _1042 = _1032;
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1046 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1048 = _988;
    float _1050 = _1042;
    if (_1010)
    {
        float _1052 = _1042 * 6.283185482025146484375;
        float _1054 = sin(_1052);
        _1048 = _1054;
    }
    float _1056 = _1048;
    float _1058 = precise::max(0.0, _1044);
    float _1060 = -_996;
    float _1062 = -_1058;
    float _1064 = fma(_974, _1060, _1062);
    float _1066 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1010)
    {
        float _1068 = _1042 * 6.283185482025146484375;
        float _1070 = cos(_1068);
        _1066 = _1070;
    }
    float _1072 = _1066;
    float _1074 = -_390;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _286);
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1010)
    {
        float _1080 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1080;
    }
    float _1082 = _1022;
    if (!_1010)
    {
        _460 = _1002;
    }
    float _1084 = _460;
    float _1086 = _964 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1088 = _1084;
    if (_1010)
    {
        float _1090 = fma(_1056, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _348 = _1090;
    }
    float _1092 = _348;
    float _1094 = -_410;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _1098 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1010)
    {
        _462 = _1064;
    }
    float _1100 = _462;
    float _1102 = _1100;
    if (_1010)
    {
        float _1104 = _1030 * _1092;
        _1078 = _1104;
    }
    float _1106 = _1078;
    if (!_1010)
    {
        _1034 = _998;
    }
    float _1108 = _1034;
    float _1110 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1086);
    float _1112 = _1108;
    if (!_1010)
    {
        _1050 = _1000;
    }
    float _1114 = _1050;
    float _1116 = _1114;
    float _1118 = _1072;
    if (_1010)
    {
        float _1120 = _1072 + (-1.0);
        _350 = _1120;
    }
    float _1122 = _350;
    float _1124 = _1122;
    if (_1010)
    {
        float _1126 = _998 * _1106;
        _1112 = _1126;
    }
    float _1128 = _1112;
    if (_1010)
    {
        float _1130 = _1000 * _1106;
        _1116 = _1130;
    }
    float _1132 = _1116;
    if (_1010)
    {
        float _1134 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1124 = _1134;
    }
    float _1136 = _1124;
    if (_1010)
    {
        float _1138 = _1128 * _1128;
        _1088 = _1138;
    }
    float _1140 = _1088;
    float _1142 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1110);
    float _1144 = floor(_1098);
    if (_1010)
    {
        float _1146 = fma(_1064, _1072, _1136);
        _1102 = _1146;
    }
    float _1148 = _1102;
    if (!_1010)
    {
        _1118 = _1004;
    }
    float _1150 = _1118;
    float _1152 = _1150;
    if (_1010)
    {
        float _1154 = _1132 * _1132;
        _1152 = _1154;
    }
    float _1156 = _1152;
    float _1158 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1160 = fma(_1148, _1148, _1140);
    float _1162 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1164 = _964 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = sqrt(_992);
    float _1168 = _1160 + _1156;
    float _1170 = _964 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1172 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1174 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1170);
    float _1176 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1172);
    float _1178 = floor(_1162);
    float _1180 = _964 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1174);
    float _1184 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1186 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1190 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1188);
    float _1192 = precise::clamp(_1190, 0.0, 1.0);
    float _1194 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1184);
    float _1196 = rsqrt(_1168);
    float _1198 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1200 = -_1192;
    float _1202 = _1200 + 1.0;
    float _1204 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1206 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1208 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1210 = -_1178;
    float _1212 = _1162 + _1210;
    float _1214 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1206);
    float _1216 = abs(_1202);
    float _1218 = log2(_1216);
    float _1220 = -_1208;
    float _1222 = fma(_1220, _1046, 1.0);
    float _1224 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1214);
    float _1226 = _1196 * _1128;
    float _1228 = _1196 * _1148;
    float _1230 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1224);
    float _1232 = _1196 * _1132;
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1236 = log2(_1222);
    float _1238 = _1228 + 1.0;
    float _1240 = -_1234;
    float _1242 = fma(_1228, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1240);
    float _1244 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1246 = -_1232;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1242);
    float _1250 = exp2(_1244);
    float _1252 = -_1144;
    float _1254 = _1098 + _1252;
    float _1256 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1258 = fma(_1248, -0.5, 0.5);
    float _1260 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1262 = fma(_1248, 0.5, 0.5);
    float _1264 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1256);
    float _1266 = 1.0 / _1230;
    float _1268 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1260);
    float _1270 = fma(_1262, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1272 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1264);
    float _1274 = _1236 * 0.693147182464599609375;
    float _1276 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1268);
    float _1278 = fma(_1262, _1270, -0.212114393711090087890625);
    float _1280 = sqrt(_1258);
    float _1282 = -_1228;
    float _1284 = fma(_1250, _1238, _1282);
    float _1286 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1272);
    float _1288 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1276);
    float _1290 = fma(_1262, _1278, 1.570728778839111328125);
    float _1292 = fma(_1284, 0.5, 0.5);
    float _1294 = _1286 * _1266;
    float _1296 = _1288 * _1266;
    float _1298 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1300 = fma(_1296, -0.5, 0.5);
    float _1302 = _1280 * 0.636619746685028076171875;
    float _1304 = fma(_1294, 0.5, 0.5);
    float _1306 = -_1290;
    float _1308 = fma(_1302, _1306, 1.0);
    float2 _4000 = float2(_1254, _1212);
    float _1310 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4000, float2(0.0), isnan(_4000)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4000, float2(0.0), isnan(_4000)), level(0.0)).x;
    float3 _4011 = float3(_1304, _1300, _1298);
    float _1312 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4011, float3(0.0), isnan(_4011)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4011, float3(0.0), isnan(_4011)), level(0.0)).x;
    float3 _4022 = float3(_1304, _1300, _1298);
    float4 _1315 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4022, float3(0.0), isnan(_4022)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4022, float3(0.0), isnan(_4022)), level(0.0)).xyzw;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = _1315.w;
    float2 _4038 = float2(_1308, _1292);
    float3 _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4038, float2(0.0), isnan(_4038)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4038, float2(0.0), isnan(_4038)), level(0.0)).xyz;
    float _1329 = _1327.x;
    float _1331 = _1327.y;
    float _1333 = _1327.z;
    float _1335 = -_384;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _280);
    float _1339 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1341 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1343 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1347 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1339);
    float _1349 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1343);
    float _1351 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1353 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1349);
    float _1355 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1351);
    float _1357 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1347);
    float _1359 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1361 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1363 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1357);
    float _1365 = 1.0 / _1359;
    float _1367 = _1361 + _1359;
    float _1369 = _1363 + _1230;
    float _1371 = _1369 * 0.5;
    float _1373 = in.m_79.x;
    float _1375 = _1367 * _1365;
    float _1377 = _1375 * 0.5;
    out.m_81.z = _1371;
    out.m_81.w = _1230;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1381 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1379);
    float _1383 = 1.0 / _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1387 = _1383 * _1385;
    float _1389 = abs(_1387);
    float _1391 = log2(_1389);
    float _1393 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1395 = exp2(_1393);
    bool _1397 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan(0.5);
    bool _1405 = _1401 || _1403;
    out.gl_Position.x = _1286;
    out.gl_Position.y = _1288;
    out.gl_Position.z = _1363;
    out.gl_Position.w = _1230;
    float _1407 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = exp2(_1341);
    bool _1413 = _1387 <= 8000.0;
    bool _1415 = isnan(_1387);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(8000.0);
    bool _1421 = _1417 || _1419;
    float _1423 = float(_1421);
    float _1425 = fma(_1409, -2.0, 3.0);
    float _1427 = _1409 * _1409;
    float _1429 = _1286;
    float _1431 = _1387;
    if (_1405)
    {
        _1429 = 1.0;
    }
    float _1433 = _1429;
    float _1435 = _1427 * _1425;
    float _1437 = -_1435;
    float _1439 = _1437 + 1.0;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1435);
    float _1443 = _1439;
    float _1445 = _1433;
    if (_1405)
    {
        _1443 = 1.0;
    }
    float _1447 = _1443;
    float _1449 = _1423 * _1441;
    float _1451 = _1447;
    float _1453 = _1321;
    float _1455 = _1373;
    float _1457 = _1323;
    if (!_1405)
    {
        float _1459 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1463 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1461;
        float _1465 = _1459 * 0.15915493667125701904296875;
        float _1467 = _1465 * 6.283185482025146484375;
        float _1469 = cos(_1467);
        float _1471 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1473 = _1471 * 0.15915493667125701904296875;
        float _1475 = _1465 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        float _1479 = 1.0 / _1469;
        float _1481 = _1473 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1477 * _1479;
        float _1487 = _1473 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = _1483 * _1485;
        float _1493 = 1.0 / _1463;
        float _1495 = 1.0 / _1491;
        float _1497 = _1489 * _1495;
        float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1501 = fma(_1387, _1497, _1499);
        float _1503 = _1501 * _1493;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1451 = _1505;
    }
    float _1507 = _1451;
    if (!_1405)
    {
        float _1509 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1511 = _1509 * 0.15915493667125701904296875;
        float _1513 = _1511 * 6.283185482025146484375;
        float _1515 = cos(_1513);
        float _1517 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1519 = _1517 * 0.15915493667125701904296875;
        float _1521 = _1511 * 6.283185482025146484375;
        float _1523 = sin(_1521);
        float _1525 = 1.0 / _1515;
        float _1527 = _1519 * 6.283185482025146484375;
        float _1529 = cos(_1527);
        float _1531 = _1523 * _1525;
        float _1533 = _1519 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        float _1537 = _1529 * _1531;
        float _1539 = 1.0 / _1537;
        float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1543 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1541;
        float _1545 = 1.0 / _1543;
        float _1547 = _1535 * _1539;
        float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1551 = fma(_1387, _1547, _1549);
        float _1553 = _1551 * _1545;
        float _1555 = precise::clamp(_1553, 0.0, 1.0);
        float _1557 = -_1555;
        float _1559 = _1557 + 1.0;
        _1445 = _1559;
        _1431 = _1555;
    }
    float _1561 = _1445;
    float _1563 = _1431;
    float _1565 = -_1411;
    float _1567 = _1565 + 1.0;
    float _1569 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1571 = -_1310;
    float _1573 = _1571 + 1.0;
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1577 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1579 = isnan(_1166);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1585 = _1581 || _1583;
    float _1587 = _1573 * _1569;
    float _1589 = precise::clamp(_1587, 0.0, 1.0);
    float _1591 = _1575 * _1312;
    float _1593 = -_1575;
    float _1595 = _1593 + 1.0;
    float _1597 = -_1589;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1601 = _1323 * _1591;
    float _1603 = _1333 * _1591;
    float _1605 = _1599 * _1373;
    float _1607 = _1323 * _1595;
    float _1609 = fma(_1329, _1601, _1317);
    float _1611 = fma(_1331, _1601, _1319);
    float _1613 = _1605 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1615 = fma(_1323, _1603, _1321);
    float _1617 = _1507 * _1561;
    float _1619 = _1563;
    float _1621 = _1617;
    float _1623 = _1595;
    if (!_1585)
    {
        _1453 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1625 = _1453;
    out.m_83.x = _1613;
    float _1627 = _880 * _1617;
    float _1629 = _1625;
    float _1631 = _1625;
    if (!_1585)
    {
        _1455 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1633 = _1455;
    out.m_85.x = _1609;
    out.m_85.y = _1611;
    out.m_85.z = _1615;
    out.m_85.w = _1607;
    float _1635 = _1633;
    float _1637 = _1633;
    if (!_1585)
    {
        _1457 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1639 = _1457;
    float _1641 = _1639;
    float _1643 = _1639;
    if (!_1585)
    {
        _1619 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1645 = _1619;
    float _1647 = _1645;
    float _1649 = _1645;
    if (!_1585)
    {
        _1621 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1651 = _1621;
    float _1653 = _1651;
    float _1655 = _1651;
    if (!_1585)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1657 = _1623;
    bool _1659 = !_1585;
    float _1661 = _1657;
    float _1663 = _1657;
    if (!_1659)
    {
        bool _1665 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1667 = isnan(_1166);
        bool _1669 = _1665 || _1667;
        bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1673 = _1669 || _1671;
        if (!_1673)
        {
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1677 = _1166 + _1675;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1679;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1687 = 1.0 / _1681;
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1705 = _1677 * _1687;
            float _1707 = precise::clamp(_1705, 0.0, 1.0);
            float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1713 = fma(_1707, _1685, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1715 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1717 = fma(_1707, _1691, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1719 = fma(_1707, _1695, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1721 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1723 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1637 = _1717;
            _1655 = _1721;
            _1631 = _1713;
            _1649 = _1719;
            _1643 = _1715;
            _1663 = _1723;
            _1725 = true;
        }
        else
        {
            bool _1727 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1729 = isnan(_1166);
            bool _1731 = _1727 || _1729;
            bool _1733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1735 = _1731 || _1733;
            if (!_1735)
            {
                _1629 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1737 = _1629;
            _1631 = _1737;
            if (!_1735)
            {
                _1635 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1739 = _1635;
            _1637 = _1739;
            if (!_1735)
            {
                _1641 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1741 = _1641;
            _1643 = _1741;
            if (!_1735)
            {
                _1647 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1743 = _1647;
            _1649 = _1743;
            if (!_1735)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1745 = _1653;
            _1655 = _1745;
            if (!_1735)
            {
                _1661 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1747 = _1661;
            bool _1749 = !_1735;
            _1663 = _1747;
            if (!_1749)
            {
                bool _1751 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1753 = isnan(_1166);
                bool _1755 = _1751 || _1753;
                bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1759 = _1755 || _1757;
                if (!_1759)
                {
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1763 = _1166 + _1761;
                    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1765;
                    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1773 = 1.0 / _1767;
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1791 = _1763 * _1773;
                    float _1793 = precise::clamp(_1791, 0.0, 1.0);
                    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1799 = fma(_1793, _1771, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1801 = fma(_1793, _1797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1803 = fma(_1793, _1777, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1805 = fma(_1793, _1781, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1807 = fma(_1793, _1785, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1809 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1637 = _1803;
                    _1655 = _1807;
                    _1631 = _1799;
                    _1649 = _1805;
                    _1643 = _1801;
                    _1663 = _1809;
                    _1725 = true;
                }
                else
                {
                    _1637 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1631 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1649 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1643 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1663 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1725 = false;
    float _1811 = _1637;
    float _1813 = _1655;
    float _1815 = _1631;
    float _1817 = _1649;
    float _1819 = _1643;
    float _1821 = _1663;
    float _1823 = fma(_824, -0.5, 0.5);
    float _1825 = precise::clamp(_1823, 0.0, 1.0);
    float _1827 = -_1811;
    float _1829 = _1827 + _1813;
    float _1831 = _1627 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1833 = -_1815;
    float _1835 = _1833 + _1817;
    out.m_87.x = 0.0;
    float _1837 = fma(_1825, _1829, _1811);
    float _1839 = -_1819;
    float _1841 = _1839 + _1821;
    out.m_51.x = _1831;
    float _1843 = fma(_1825, _1835, _1815);
    float _1845 = _1837 * 0.586610972881317138671875;
    bool _1847 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1849 = fma(_1825, _1841, _1819);
    float _1851 = fma(_1843, 0.298911988735198974609375, _1845);
    bool _1853 = _1507 > 0.0;
    bool _1855 = isnan(_1507);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.0);
    bool _1861 = _1857 || _1859;
    float _1863 = fma(_1849, 0.114477999508380889892578125, _1851);
    bool _1865 = _1561 <= 0.0;
    bool _1867 = !_1861;
    bool _1869 = _1865 || _1867;
    float _1871 = -_1863;
    float _1873 = _1837 + _1871;
    float _1875 = -_1863;
    float _1877 = _1843 + _1875;
    float _1879 = -_1863;
    float _1881 = _1849 + _1879;
    float _1883 = fma(_1873, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1885 = fma(_1877, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1887 = fma(_1881, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    bool _1889 = !_1847;
    if (!_1889)
    {
        float _1891 = -_964;
        float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1895 = -_970;
        float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1899 = -_978;
        float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1903 = _1893 * _1893;
        float _1905 = fma(_1897, _1897, _1903);
        float _1907 = fma(_1901, _1901, _1905);
        float _1909 = sqrt(_1907);
        float _1911 = rsqrt(_1907);
        float _1913 = -_1909;
        float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1917 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1919 = precise::clamp(_1917, 0.0, 1.0);
        float _1921 = _1897 * _1911;
        float _1923 = _1893 * _1911;
        float _1925 = abs(_1919);
        float _1927 = log2(_1925);
        float _1929 = _1901 * _1911;
        float _1931 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1933 = _824 * _1923;
        float _1935 = -_1923;
        float _1937 = -_1931;
        float _1939 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1937);
        float _1941 = fma(_818, _1921, _1933);
        float _1943 = -_1929;
        float _1945 = fma(_1943, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1939);
        float _1947 = fma(_826, _1929, _1941);
        float _1949 = precise::clamp(_1947, 0.0, 1.0);
        float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1953 = _1945 + _1951;
        float _1955 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1957 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1959 = precise::clamp(_1957, 0.0, 1.0);
        float _1961 = exp2(_1955);
        float _1963 = _1961 * _1959;
        float _1965 = _1949 * _1963;
        float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1969 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1971 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1967;
        out.m_87.y = _1969;
        out.m_87.z = _1971;
    }
    out.m_89.x = _1885;
    out.m_89.y = _1883;
    out.m_89.z = _1887;
    if (!_1869)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _1973 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1973;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1725 = false;
    bool _914 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2031 = as_type<float>(_124);
        out.gl_Position.z = _2031;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_108);
        _116 = _144;
    }
    float _146 = _116;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _126 = as_type<int>(_158);
    }
    int _160 = _126;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2100 = as_type<float>(_160);
        out.gl_Position.z = _2100;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _166 = in.m_57.x;
    int _168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _170 = _168 != 0;
    float _172 = _142 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _174 = 0.0 + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = in.m_48.x;
    float _180 = in.m_48.y;
    float _182 = in.m_48.z;
    float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _186 = in.m_59.w;
    int _188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _190 = _188 != 0;
    int _192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _194 = _192 != 0;
    float _196 = in.m_57.y;
    int _198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _200 = _198 != 0;
    float _202 = _172 * _164;
    float _204 = in.m_55.y;
    float _206 = fma((*spvDescriptorSet0.vp_c10)._m0[3].x, 0.10000002384185791015625, 1.0);
    float _208 = 0.0;
    float _210 = _204;
    if (!_170)
    {
        float _212 = -_162;
        float _214 = _212 + 1.0;
        _208 = _214;
    }
    float _216 = _208;
    float _218 = _216;
    if (_170)
    {
        float _220 = -_162;
        float _222 = _220 + 1.0;
        _218 = _222;
    }
    float _224 = _218;
    float _226 = 0.0;
    if (!_170)
    {
        _226 = _162;
    }
    float _228 = _226;
    float _230 = fma(_166, 1234.0, (*spvDescriptorSet0.vp_c10)._m0[2].x);
    float _232 = -_162;
    float _234 = _224 + _232;
    float _236 = _180 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _238 = _180 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _240 = _180 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _242 = _230 * 0.01666666753590106964111328125;
    float _244 = fma(_176, _234, _162);
    float _246 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].x, _236);
    float _248 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].x, _240);
    float _250 = _242 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _252 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].x, _238);
    float _254 = _244 * 6.283185482025146484375;
    float _256 = in.m_61.x;
    float _258 = in.m_61.y;
    float _260 = in.m_61.z;
    float _262 = _250 * 6.283185482025146484375;
    float _264 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].z, _246);
    float _266 = _254 * 0.15915493667125701904296875;
    float _268 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].z, _252);
    float _270 = -_262;
    float _272 = fma(_244, 7.539823055267333984375, _270);
    float _274 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].z, _248);
    float _276 = _266 * 6.283185482025146484375;
    float _278 = cos(_276);
    float _280 = _268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _282 = _272 * 0.15915493667125701904296875;
    float _284 = fma(_176, -2.0, 1.0);
    float _286 = _264 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _290 = _280 + _288;
    float _292 = _274 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _294 = (*spvDescriptorSet0.vp_c10)._m0[3].x * 1.5;
    float _296 = _282 * 6.283185482025146484375;
    float _298 = sin(_296);
    float _300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _302 = _286 + _300;
    float _304 = _290 * _290;
    bool _306 = _284 > 0.0;
    float _308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _310 = _292 + _308;
    bool _312 = _284 >= 0.0;
    bool _314 = isnan(_284);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = fma(_302, _302, _304);
    out.m_63.w = _186;
    int _324 = _320 ? 0 : 1;
    float _326 = fma(_310, _310, _322);
    float _328 = _258 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _330 = fma(_278, -0.5, 0.5);
    int _332 = ~_324;
    int _334 = _332 + 1;
    int _336 = _334 + 1;
    float _338 = rsqrt(_326);
    float _340 = fma(0.5, (*spvDescriptorSet0.vp_c10)._m0[3].x, -0.25);
    float _342 = fma(_298, 0.5, 0.5);
    int _344 = _336;
    float _346 = _228;
    float _348 = _286;
    float _350 = _292;
    if (!_306)
    {
        int _352 = ~_324;
        int _354 = _352 + 1;
        _344 = _354;
    }
    int _356 = _344;
    float _358 = fma(_328, _330, 0.125);
    bool _360 = _196 > 0.5;
    float _362 = fma(_294, _342, 1.0);
    float _364 = float(_356);
    float _366 = in.m_65.x;
    float _368 = in.m_65.y;
    float _370 = in.m_65.z;
    float _372 = _244 * _358;
    float _374 = _364 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    int _376 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _378 = _376 != 0;
    float _380 = _372 * _362;
    float _382 = _374 * 0.15915493667125701904296875;
    float _384 = _290 * _338;
    float _386 = 0.0 + _380;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    float _390 = _302 * _338;
    float _392 = -_384;
    float _394 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[18].w, _290);
    float _396 = _388 * 0.52359902858734130859375;
    float _398 = -_390;
    float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _302);
    float _402 = _382 * 6.283185482025146484375;
    float _404 = sin(_402);
    float _406 = _394 * _394;
    float _408 = _396 * 0.15915493667125701904296875;
    float _410 = _310 * _338;
    float _412 = -_340;
    float _414 = _412 + _260;
    float _416 = fma(_400, _400, _406);
    float _418 = precise::max(0.0, _380);
    float _420 = -_410;
    float _422 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[18].w, _310);
    float _424 = _366 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _426 = _408 * 6.283185482025146484375;
    float _428 = sin(_426);
    float _430 = precise::min(_418, 2.625);
    float _432 = fma(_422, _422, _416);
    float _434 = _368 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = _370 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _438 = fma(_430, 1.14285719394683837890625, 1.0);
    float _440 = fma(_430, -0.2857142984867095947265625, 1.0);
    float _442 = _408 * 6.283185482025146484375;
    float _444 = cos(_442);
    float _446 = -_204;
    float _448 = _446 + 1.0;
    float _450 = _414 * _438;
    float _452 = _438 * _256;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _456 = _450 * _440;
    bool _458 = _360;
    float _460 = _390;
    float _462 = _410;
    if (_200)
    {
        float _464 = _360 ? _448 : _204;
        _210 = _464;
    }
    float _466 = _210;
    float _468 = sqrt(_432);
    float _470 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[20].x, _202);
    float _472 = _452 * _206;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _476 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _478 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_170)
    {
        bool _480 = _166 > 0.5;
        _458 = _480;
    }
    bool _482 = _458;
    float _484 = _382 * 6.283185482025146484375;
    float _486 = cos(_484);
    float _488 = _456 * _444;
    float _490 = _456 * _428;
    float _492 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _474);
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _496 = fma(_380, _428, _488);
    float _498 = -_490;
    float _500 = fma(_380, _444, _498);
    float _502 = _472 * _404;
    float _504 = _338 * _468;
    float _506 = _496 * _206;
    float _508 = _500 * _206;
    float _510 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _512 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _514 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _516 = _476 * _504;
    float _518 = fma(_510, -2.0, _494);
    float _520 = _472 * _486;
    float _522 = -_502;
    float _524 = fma(_506, _486, _522);
    float _526 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _508);
    float _528 = _512 * _504;
    float _530 = fma(_506, _404, _520);
    float _532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _524);
    float _534 = _514 * _504;
    float _536 = _516 * _526;
    float _538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _530);
    float _540 = _528 * _532;
    float _542 = _536 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _544 = _534 * _538;
    float _546 = _536 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _548 = -_454;
    float _550 = fma(_478, 2.0, _548);
    float _552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _554 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[8].x, _542);
    float _556 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[10].x, _546);
    float _558 = _536 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _560 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[8].z, _554);
    float _562 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[10].z, _556);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _566 = _286 + _560;
    float _568 = _292 + _562;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _572 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _574 = _566 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _578 = _568 + _576;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _586 = _574 * _574;
    float _588 = _578 * _578;
    float _590 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _582);
    float _592 = _552 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _594 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _596 = _586 + _588;
    float _598 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = fma(_544, (*spvDescriptorSet0.vp_c10)._m0[9].x, _558);
    float _604 = sqrt(_596);
    float _606 = _584;
    float _608 = _586;
    float _610 = _588;
    float _612 = _566;
    float _614 = _568;
    if (_170)
    {
        float _616 = _482 ? _224 : _162;
        _346 = _616;
    }
    float _618 = _346;
    float _620 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _492);
    out.m_67.x = _594;
    out.m_67.y = _598;
    out.m_67.z = _600;
    out.m_67.w = _584;
    float _622 = fma(_540, (*spvDescriptorSet0.vp_c10)._m0[9].z, _602);
    float _624 = -_142;
    float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[76].x, _550);
    float _628 = in.m_69.x;
    float _630 = in.m_69.y;
    float _632 = in.m_69.z;
    float _634 = floor(_470);
    float _636 = fma(_592, _466, -0.5);
    float _638 = _184 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _640 = _508 != 0.0;
    bool _642 = isnan(_508);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _518);
    float _652 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _590);
    bool _654 = _604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _656 = _280 + _622;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _664 = _530 == 0.0;
    bool _666 = !_648;
    bool _668 = _664 && _666;
    float _670 = fma(_638, _618, -0.5);
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _674 = !_190;
    int _676 = _674 ? 0 : 1;
    float _678 = _658 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _680 = !_194;
    int _682 = _680 ? 0 : 1;
    float _684 = _660 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _686 = _524 == 0.0;
    bool _688 = _686 && _668;
    float _690 = _662 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_654)
    {
        _606 = _656;
    }
    float _692 = _606;
    bool _694 = !_654;
    float _696 = _692;
    float _698 = _630;
    float _700 = _628;
    float _702 = _632;
    if (!_694)
    {
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _708 = _604 + _706;
        float _710 = rsqrt(_596);
        float _712 = _708 * _704;
        float _714 = _656 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _716 = _712 * 0.15915493667125701904296875;
        float _718 = _716 * 6.283185482025146484375;
        float _720 = sin(_718);
        float _722 = _716 * 6.283185482025146484375;
        float _724 = cos(_722);
        float _726 = fma(_720, _714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _728 = _710 * _726;
        float _730 = _724 + (-1.0);
        float _732 = fma(_574, _728, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _734 = fma(_578, _728, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _736 = _730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _738 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _740 = _732 + _738;
        float _742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _744 = _734 + _742;
        float _746 = fma(_656, _724, _736);
        float _748 = _740 * _740;
        float _750 = _744 * _744;
        _696 = _746;
        _608 = _748;
        _610 = _750;
        _612 = _732;
        _614 = _734;
    }
    float _752 = _696;
    float _754 = _608;
    float _756 = _610;
    float _758 = _612;
    float _760 = _614;
    float _762 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _764 = _752 + _762;
    float _766 = -_634;
    float _768 = _470 + _766;
    float _770 = _470 * 6.283185482025146484375;
    if (!_688)
    {
        float _772 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[17].y, _630);
        _698 = _772;
    }
    float _774 = _698;
    float _776 = fma(_764, _764, _754);
    out.m_71.x = _678;
    out.m_71.y = _684;
    out.m_71.z = _690;
    out.m_71.w = _672;
    float _778 = _770 * 0.15915493667125701904296875;
    if (!_688)
    {
        float _780 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[17].y, _628);
        _700 = _780;
    }
    float _782 = _700;
    float _784 = _776 + _756;
    float _786 = _774 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _788 = _774 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _790 = fma(_620, _670, _626);
    if (!_688)
    {
        float _792 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[17].y, _632);
        _702 = _792;
    }
    float _794 = _702;
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[8].x, _786);
    float _798 = sqrt(_784);
    float _800 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[10].x, _788);
    int _802 = abs(_676);
    float _804 = -_650;
    float _806 = fma(_652, _636, _804);
    out.m_73.x = _244;
    float _808 = _774 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _810 = _806 + 0.5;
    float _812 = _778 * 6.283185482025146484375;
    float _814 = cos(_812);
    float _816 = fma(_782, (*spvDescriptorSet0.vp_c10)._m0[9].x, _808);
    float _818 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[8].z, _796);
    float _820 = -_768;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _824 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[9].z, _816);
    float _826 = fma(_794, (*spvDescriptorSet0.vp_c10)._m0[10].z, _800);
    bool _828 = !_378;
    int _830 = _828 ? 0 : 1;
    float _832 = _790 + 0.5;
    float _834 = float(_802);
    out.m_75.x = _818;
    out.m_75.y = _824;
    out.m_75.z = _826;
    bool _836 = _798 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _838 = isnan(_798);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _844 = _840 || _842;
    int _846 = abs(_830);
    float _848 = abs(_822);
    float _850 = _834 * _848;
    float _852 = fma(_814, 0.5, 0.5);
    int _854 = abs(_682);
    out.m_77.x = _832;
    out.m_77.y = _810;
    bool _856 = _768 < 0.5;
    float _858 = float(_856);
    float _860 = -_852;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _864 = float(_846);
    float _866 = -_858;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _870 = fma(_864, _862, _850);
    float _872 = _864;
    if (!_844)
    {
        _872 = 1.0;
    }
    float _874 = _872;
    float _876 = float(_854);
    float _878 = abs(_868);
    float _880 = fma(_876, _878, _870);
    bool _882 = !_844;
    float _884 = _874;
    if (!_882)
    {
        bool _886 = _798 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _888 = isnan(_798);
        bool _890 = _886 || _888;
        bool _892 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _894 = _890 || _892;
        if (!_894)
        {
            float _896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _898 = _798 + _896;
            float _900 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _902 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _900;
            float _904 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _906 = _904 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _908 = 1.0 / _902;
            float _910 = _898 * _908;
            float _912 = fma(_910, _906, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _884 = _912;
            _914 = true;
        }
        else
        {
            bool _916 = _798 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _918 = isnan(_798);
            bool _920 = _916 || _918;
            bool _922 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _924 = _920 || _922;
            if (!_924)
            {
                float _926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _928 = _798 + _926;
                float _930 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _932 = _930 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _934 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _936 = _934 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _938 = 1.0 / _932;
                float _940 = _928 * _938;
                float _942 = fma(_940, _936, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _884 = _942;
                _914 = true;
            }
            else
            {
                _884 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _914 = false;
    float _944 = _884;
    float _946 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _948 = _752 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _952 = _758 + _950;
    float _954 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _956 = _760 + _954;
    float _958 = fma(_948, _944, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _960 = fma(_952, _944, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _962 = -_384;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _966 = fma(_956, _944, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _968 = -_390;
    float _970 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[18].w, _960);
    float _972 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _974 = _964 + _972;
    float _976 = -_410;
    float _978 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[18].w, _966);
    float _980 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _982 = _970 + _980;
    float _984 = _974 * _974;
    float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _988 = _978 + _986;
    float _990 = fma(_982, _982, _984);
    float _992 = fma(_988, _988, _990);
    float _994 = rsqrt(_992);
    float _996 = _994 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _998 = _982 * _996;
    float _1000 = _988 * _996;
    float _1002 = _998 * _998;
    float _1004 = _1000 * _1000;
    float _1006 = _1002 + _1004;
    float _1008 = sqrt(_1006);
    bool _1010 = _1008 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1014 = _1008 + _1012;
    float _1016 = _850;
    float _1018 = _994;
    float _1020 = _1014;
    float _1022 = _974;
    if (_1010)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1024;
    }
    float _1026 = _1016;
    if (_1010)
    {
        float _1028 = rsqrt(_1006);
        _1018 = _1028;
    }
    float _1030 = _1018;
    float _1032 = _1026;
    float _1034 = _1030;
    if (_1010)
    {
        float _1036 = _1014 * _1026;
        _1020 = _1036;
    }
    float _1038 = _1020;
    if (_1010)
    {
        float _1040 = _1038 * 0.15915493667125701904296875;
        _1032 = _1040;
    }
    float _1042 = _1032;
    float _1044 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1046 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1048 = _988;
    float _1050 = _1042;
    if (_1010)
    {
        float _1052 = _1042 * 6.283185482025146484375;
        float _1054 = sin(_1052);
        _1048 = _1054;
    }
    float _1056 = _1048;
    float _1058 = precise::max(0.0, _1044);
    float _1060 = -_996;
    float _1062 = -_1058;
    float _1064 = fma(_974, _1060, _1062);
    float _1066 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1010)
    {
        float _1068 = _1042 * 6.283185482025146484375;
        float _1070 = cos(_1068);
        _1066 = _1070;
    }
    float _1072 = _1066;
    float _1074 = -_390;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[18].w, _286);
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1010)
    {
        float _1080 = _1064 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1080;
    }
    float _1082 = _1022;
    if (!_1010)
    {
        _460 = _1002;
    }
    float _1084 = _460;
    float _1086 = _964 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1088 = _1084;
    if (_1010)
    {
        float _1090 = fma(_1056, _1082, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _348 = _1090;
    }
    float _1092 = _348;
    float _1094 = -_410;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _292);
    float _1098 = fma(_1076, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1010)
    {
        _462 = _1064;
    }
    float _1100 = _462;
    float _1102 = _1100;
    if (_1010)
    {
        float _1104 = _1030 * _1092;
        _1078 = _1104;
    }
    float _1106 = _1078;
    if (!_1010)
    {
        _1034 = _998;
    }
    float _1108 = _1034;
    float _1110 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1086);
    float _1112 = _1108;
    if (!_1010)
    {
        _1050 = _1000;
    }
    float _1114 = _1050;
    float _1116 = _1114;
    float _1118 = _1072;
    if (_1010)
    {
        float _1120 = _1072 + (-1.0);
        _350 = _1120;
    }
    float _1122 = _350;
    float _1124 = _1122;
    if (_1010)
    {
        float _1126 = _998 * _1106;
        _1112 = _1126;
    }
    float _1128 = _1112;
    if (_1010)
    {
        float _1130 = _1000 * _1106;
        _1116 = _1130;
    }
    float _1132 = _1116;
    if (_1010)
    {
        float _1134 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1124 = _1134;
    }
    float _1136 = _1124;
    if (_1010)
    {
        float _1138 = _1128 * _1128;
        _1088 = _1138;
    }
    float _1140 = _1088;
    float _1142 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1110);
    float _1144 = floor(_1098);
    if (_1010)
    {
        float _1146 = fma(_1064, _1072, _1136);
        _1102 = _1146;
    }
    float _1148 = _1102;
    if (!_1010)
    {
        _1118 = _1004;
    }
    float _1150 = _1118;
    float _1152 = _1150;
    if (_1010)
    {
        float _1154 = _1132 * _1132;
        _1152 = _1154;
    }
    float _1156 = _1152;
    float _1158 = _1142 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1160 = fma(_1148, _1148, _1140);
    float _1162 = fma(_1096, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1164 = _964 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1166 = sqrt(_992);
    float _1168 = _1160 + _1156;
    float _1170 = _964 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1172 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1164);
    float _1174 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1170);
    float _1176 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1172);
    float _1178 = floor(_1162);
    float _1180 = _964 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1182 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1174);
    float _1184 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1180);
    float _1186 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1190 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1188);
    float _1192 = precise::clamp(_1190, 0.0, 1.0);
    float _1194 = fma(_978, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1184);
    float _1196 = rsqrt(_1168);
    float _1198 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1200 = -_1192;
    float _1202 = _1200 + 1.0;
    float _1204 = _1194 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1206 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1208 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1210 = -_1178;
    float _1212 = _1162 + _1210;
    float _1214 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1206);
    float _1216 = abs(_1202);
    float _1218 = log2(_1216);
    float _1220 = -_1208;
    float _1222 = fma(_1220, _1046, 1.0);
    float _1224 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1214);
    float _1226 = _1196 * _1128;
    float _1228 = _1196 * _1148;
    float _1230 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1224);
    float _1232 = _1196 * _1132;
    float _1234 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1236 = log2(_1222);
    float _1238 = _1228 + 1.0;
    float _1240 = -_1234;
    float _1242 = fma(_1228, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1240);
    float _1244 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1246 = -_1232;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1242);
    float _1250 = exp2(_1244);
    float _1252 = -_1144;
    float _1254 = _1098 + _1252;
    float _1256 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1258 = fma(_1248, -0.5, 0.5);
    float _1260 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1262 = fma(_1248, 0.5, 0.5);
    float _1264 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1256);
    float _1266 = 1.0 / _1230;
    float _1268 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1260);
    float _1270 = fma(_1262, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1272 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1264);
    float _1274 = _1236 * 0.693147182464599609375;
    float _1276 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1268);
    float _1278 = fma(_1262, _1270, -0.212114393711090087890625);
    float _1280 = sqrt(_1258);
    float _1282 = -_1228;
    float _1284 = fma(_1250, _1238, _1282);
    float _1286 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1272);
    float _1288 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1276);
    float _1290 = fma(_1262, _1278, 1.570728778839111328125);
    float _1292 = fma(_1284, 0.5, 0.5);
    float _1294 = _1286 * _1266;
    float _1296 = _1288 * _1266;
    float _1298 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1300 = fma(_1296, -0.5, 0.5);
    float _1302 = _1280 * 0.636619746685028076171875;
    float _1304 = fma(_1294, 0.5, 0.5);
    float _1306 = -_1290;
    float _1308 = fma(_1302, _1306, 1.0);
    float2 _4000 = float2(_1254, _1212);
    float _1310 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4000, float2(0.0), isnan(_4000)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4000, float2(0.0), isnan(_4000)), level(0.0)).x;
    float3 _4011 = float3(_1304, _1300, _1298);
    float _1312 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4011, float3(0.0), isnan(_4011)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4011, float3(0.0), isnan(_4011)), level(0.0)).x;
    float3 _4022 = float3(_1304, _1300, _1298);
    float4 _1315 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4022, float3(0.0), isnan(_4022)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4022, float3(0.0), isnan(_4022)), level(0.0)).xyzw;
    float _1317 = _1315.x;
    float _1319 = _1315.y;
    float _1321 = _1315.z;
    float _1323 = _1315.w;
    float2 _4038 = float2(_1308, _1292);
    float3 _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4038, float2(0.0), isnan(_4038)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4038, float2(0.0), isnan(_4038)), level(0.0)).xyz;
    float _1329 = _1327.x;
    float _1331 = _1327.y;
    float _1333 = _1327.z;
    float _1335 = -_384;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[18].w, _280);
    float _1339 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1341 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1343 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1347 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1339);
    float _1349 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1343);
    float _1351 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1353 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1349);
    float _1355 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1351);
    float _1357 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1347);
    float _1359 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1361 = _1355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1363 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1357);
    float _1365 = 1.0 / _1359;
    float _1367 = _1361 + _1359;
    float _1369 = _1363 + _1230;
    float _1371 = _1369 * 0.5;
    float _1373 = in.m_79.x;
    float _1375 = _1367 * _1365;
    float _1377 = _1375 * 0.5;
    out.m_81.z = _1371;
    out.m_81.w = _1230;
    float _1379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1381 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1379);
    float _1383 = 1.0 / _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1387 = _1383 * _1385;
    float _1389 = abs(_1387);
    float _1391 = log2(_1389);
    float _1393 = _1391 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1395 = exp2(_1393);
    bool _1397 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1401 = _1397 || _1399;
    bool _1403 = isnan(0.5);
    bool _1405 = _1401 || _1403;
    out.gl_Position.x = _1286;
    out.gl_Position.y = _1288;
    out.gl_Position.z = _1363;
    out.gl_Position.w = _1230;
    float _1407 = fma(_1395, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1409 = precise::clamp(_1407, 0.0, 1.0);
    float _1411 = exp2(_1341);
    bool _1413 = _1387 <= 8000.0;
    bool _1415 = isnan(_1387);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(8000.0);
    bool _1421 = _1417 || _1419;
    float _1423 = float(_1421);
    float _1425 = fma(_1409, -2.0, 3.0);
    float _1427 = _1409 * _1409;
    float _1429 = _1286;
    float _1431 = _1387;
    if (_1405)
    {
        _1429 = 1.0;
    }
    float _1433 = _1429;
    float _1435 = _1427 * _1425;
    float _1437 = -_1435;
    float _1439 = _1437 + 1.0;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1435);
    float _1443 = _1439;
    float _1445 = _1433;
    if (_1405)
    {
        _1443 = 1.0;
    }
    float _1447 = _1443;
    float _1449 = _1423 * _1441;
    float _1451 = _1447;
    float _1453 = _1321;
    float _1455 = _1373;
    float _1457 = _1323;
    if (!_1405)
    {
        float _1459 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1463 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1461;
        float _1465 = _1459 * 0.15915493667125701904296875;
        float _1467 = _1465 * 6.283185482025146484375;
        float _1469 = cos(_1467);
        float _1471 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1473 = _1471 * 0.15915493667125701904296875;
        float _1475 = _1465 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        float _1479 = 1.0 / _1469;
        float _1481 = _1473 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1477 * _1479;
        float _1487 = _1473 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = _1483 * _1485;
        float _1493 = 1.0 / _1463;
        float _1495 = 1.0 / _1491;
        float _1497 = _1489 * _1495;
        float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1501 = fma(_1387, _1497, _1499);
        float _1503 = _1501 * _1493;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1451 = _1505;
    }
    float _1507 = _1451;
    if (!_1405)
    {
        float _1509 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1511 = _1509 * 0.15915493667125701904296875;
        float _1513 = _1511 * 6.283185482025146484375;
        float _1515 = cos(_1513);
        float _1517 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1519 = _1517 * 0.15915493667125701904296875;
        float _1521 = _1511 * 6.283185482025146484375;
        float _1523 = sin(_1521);
        float _1525 = 1.0 / _1515;
        float _1527 = _1519 * 6.283185482025146484375;
        float _1529 = cos(_1527);
        float _1531 = _1523 * _1525;
        float _1533 = _1519 * 6.283185482025146484375;
        float _1535 = sin(_1533);
        float _1537 = _1529 * _1531;
        float _1539 = 1.0 / _1537;
        float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1543 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1541;
        float _1545 = 1.0 / _1543;
        float _1547 = _1535 * _1539;
        float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1551 = fma(_1387, _1547, _1549);
        float _1553 = _1551 * _1545;
        float _1555 = precise::clamp(_1553, 0.0, 1.0);
        float _1557 = -_1555;
        float _1559 = _1557 + 1.0;
        _1445 = _1559;
        _1431 = _1555;
    }
    float _1561 = _1445;
    float _1563 = _1431;
    float _1565 = -_1411;
    float _1567 = _1565 + 1.0;
    float _1569 = _1449 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1571 = -_1310;
    float _1573 = _1571 + 1.0;
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1577 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1579 = isnan(_1166);
    bool _1581 = _1577 || _1579;
    bool _1583 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1585 = _1581 || _1583;
    float _1587 = _1573 * _1569;
    float _1589 = precise::clamp(_1587, 0.0, 1.0);
    float _1591 = _1575 * _1312;
    float _1593 = -_1575;
    float _1595 = _1593 + 1.0;
    float _1597 = -_1589;
    float _1599 = fma(_1597, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1601 = _1323 * _1591;
    float _1603 = _1333 * _1591;
    float _1605 = _1599 * _1373;
    float _1607 = _1323 * _1595;
    float _1609 = fma(_1329, _1601, _1317);
    float _1611 = fma(_1331, _1601, _1319);
    float _1613 = _1605 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1615 = fma(_1323, _1603, _1321);
    float _1617 = _1507 * _1561;
    float _1619 = _1563;
    float _1621 = _1617;
    float _1623 = _1595;
    if (!_1585)
    {
        _1453 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1625 = _1453;
    out.m_83.x = _1613;
    float _1627 = _880 * _1617;
    float _1629 = _1625;
    float _1631 = _1625;
    if (!_1585)
    {
        _1455 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1633 = _1455;
    out.m_85.x = _1609;
    out.m_85.y = _1611;
    out.m_85.z = _1615;
    out.m_85.w = _1607;
    float _1635 = _1633;
    float _1637 = _1633;
    if (!_1585)
    {
        _1457 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1639 = _1457;
    float _1641 = _1639;
    float _1643 = _1639;
    if (!_1585)
    {
        _1619 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1645 = _1619;
    float _1647 = _1645;
    float _1649 = _1645;
    if (!_1585)
    {
        _1621 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1651 = _1621;
    float _1653 = _1651;
    float _1655 = _1651;
    if (!_1585)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1657 = _1623;
    bool _1659 = !_1585;
    float _1661 = _1657;
    float _1663 = _1657;
    if (!_1659)
    {
        bool _1665 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1667 = isnan(_1166);
        bool _1669 = _1665 || _1667;
        bool _1671 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1673 = _1669 || _1671;
        if (!_1673)
        {
            float _1675 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1677 = _1166 + _1675;
            float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1681 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1679;
            float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1685 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1687 = 1.0 / _1681;
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1691 = _1689 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1695 = _1693 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1697 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1699 = _1697 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1705 = _1677 * _1687;
            float _1707 = precise::clamp(_1705, 0.0, 1.0);
            float _1709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1711 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1713 = fma(_1707, _1685, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1715 = fma(_1707, _1711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1717 = fma(_1707, _1691, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1719 = fma(_1707, _1695, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1721 = fma(_1707, _1699, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1723 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1637 = _1717;
            _1655 = _1721;
            _1631 = _1713;
            _1649 = _1719;
            _1643 = _1715;
            _1663 = _1723;
            _1725 = true;
        }
        else
        {
            bool _1727 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1729 = isnan(_1166);
            bool _1731 = _1727 || _1729;
            bool _1733 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1735 = _1731 || _1733;
            if (!_1735)
            {
                _1629 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1737 = _1629;
            _1631 = _1737;
            if (!_1735)
            {
                _1635 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1739 = _1635;
            _1637 = _1739;
            if (!_1735)
            {
                _1641 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1741 = _1641;
            _1643 = _1741;
            if (!_1735)
            {
                _1647 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1743 = _1647;
            _1649 = _1743;
            if (!_1735)
            {
                _1653 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1745 = _1653;
            _1655 = _1745;
            if (!_1735)
            {
                _1661 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1747 = _1661;
            bool _1749 = !_1735;
            _1663 = _1747;
            if (!_1749)
            {
                bool _1751 = _1166 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1753 = isnan(_1166);
                bool _1755 = _1751 || _1753;
                bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1759 = _1755 || _1757;
                if (!_1759)
                {
                    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1763 = _1166 + _1761;
                    float _1765 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1765;
                    float _1769 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1771 = _1769 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1773 = 1.0 / _1767;
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1777 = _1775 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1781 = _1779 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1783 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1785 = _1783 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1791 = _1763 * _1773;
                    float _1793 = precise::clamp(_1791, 0.0, 1.0);
                    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1799 = fma(_1793, _1771, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1801 = fma(_1793, _1797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1803 = fma(_1793, _1777, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1805 = fma(_1793, _1781, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1807 = fma(_1793, _1785, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1809 = fma(_1793, _1789, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1637 = _1803;
                    _1655 = _1807;
                    _1631 = _1799;
                    _1649 = _1805;
                    _1643 = _1801;
                    _1663 = _1809;
                    _1725 = true;
                }
                else
                {
                    _1637 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1655 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1631 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1649 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1643 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1663 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1725 = false;
    float _1811 = _1637;
    float _1813 = _1655;
    float _1815 = _1631;
    float _1817 = _1649;
    float _1819 = _1643;
    float _1821 = _1663;
    float _1823 = fma(_824, -0.5, 0.5);
    float _1825 = precise::clamp(_1823, 0.0, 1.0);
    float _1827 = -_1811;
    float _1829 = _1827 + _1813;
    float _1831 = _1627 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1833 = -_1815;
    float _1835 = _1833 + _1817;
    out.m_87.x = 0.0;
    float _1837 = fma(_1825, _1829, _1811);
    float _1839 = -_1819;
    float _1841 = _1839 + _1821;
    out.m_51.x = _1831;
    float _1843 = fma(_1825, _1835, _1815);
    float _1845 = _1837 * 0.586610972881317138671875;
    bool _1847 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1849 = fma(_1825, _1841, _1819);
    float _1851 = fma(_1843, 0.298911988735198974609375, _1845);
    bool _1853 = _1507 > 0.0;
    bool _1855 = isnan(_1507);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan(0.0);
    bool _1861 = _1857 || _1859;
    float _1863 = fma(_1849, 0.114477999508380889892578125, _1851);
    bool _1865 = _1561 <= 0.0;
    bool _1867 = !_1861;
    bool _1869 = _1865 || _1867;
    float _1871 = -_1863;
    float _1873 = _1837 + _1871;
    float _1875 = -_1863;
    float _1877 = _1843 + _1875;
    float _1879 = -_1863;
    float _1881 = _1849 + _1879;
    float _1883 = fma(_1873, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1885 = fma(_1877, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1887 = fma(_1881, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    bool _1889 = !_1847;
    if (!_1889)
    {
        float _1891 = -_964;
        float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1895 = -_970;
        float _1897 = _1895 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1899 = -_978;
        float _1901 = _1899 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1903 = _1893 * _1893;
        float _1905 = fma(_1897, _1897, _1903);
        float _1907 = fma(_1901, _1901, _1905);
        float _1909 = sqrt(_1907);
        float _1911 = rsqrt(_1907);
        float _1913 = -_1909;
        float _1915 = _1913 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1917 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1919 = precise::clamp(_1917, 0.0, 1.0);
        float _1921 = _1897 * _1911;
        float _1923 = _1893 * _1911;
        float _1925 = abs(_1919);
        float _1927 = log2(_1925);
        float _1929 = _1901 * _1911;
        float _1931 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1933 = _824 * _1923;
        float _1935 = -_1923;
        float _1937 = -_1931;
        float _1939 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1937);
        float _1941 = fma(_818, _1921, _1933);
        float _1943 = -_1929;
        float _1945 = fma(_1943, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1939);
        float _1947 = fma(_826, _1929, _1941);
        float _1949 = precise::clamp(_1947, 0.0, 1.0);
        float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1953 = _1945 + _1951;
        float _1955 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1957 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1959 = precise::clamp(_1957, 0.0, 1.0);
        float _1961 = exp2(_1955);
        float _1963 = _1961 * _1959;
        float _1965 = _1949 * _1963;
        float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1969 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1971 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _1967;
        out.m_87.y = _1969;
        out.m_87.z = _1971;
    }
    out.m_89.x = _1885;
    out.m_89.y = _1883;
    out.m_89.z = _1887;
    if (!_1869)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _1973 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1973;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

