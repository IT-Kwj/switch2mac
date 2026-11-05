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
    float4 m_71 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2035 = false;
    bool _1304 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2334 = as_type<float>(_122);
        out.gl_Position.z = _2334;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_53.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2403 = as_type<float>(_160);
        out.gl_Position.z = _2403;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_55.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_55.x;
    float _196 = in.m_55.y;
    float _198 = in.m_55.z;
    float _200 = in.m_55.w;
    float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _204 = in.m_48.x;
    float _206 = in.m_48.y;
    float _208 = in.m_48.z;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _216 = _202 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _218 = _198 * 2.0;
    float _220 = _194 * 2.0;
    float _222 = _196 * 2.0;
    float _224 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _210);
    float _226 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _228 = _206 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _230 = floor(_218);
    float _232 = _196 + _198;
    float _234 = _194 + _198;
    float _236 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _238 = _196 + _194;
    float _240 = _194 + (-0.5);
    float _242 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _212);
    float _244 = _196 + (-0.5);
    float _246 = floor(_220);
    float _248 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _226);
    float _250 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].x, _228);
    float _252 = _238 + (-1.0);
    float _254 = _232 + (-1.0);
    float _256 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _248);
    float _258 = _234 + (-1.0);
    float _260 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _262 = floor(_222);
    bool _264 = _230 > 0.0;
    float _266 = _214 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _268 = _230 >= 0.0;
    bool _270 = isnan(_230);
    bool _272 = _268 || _270;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    int _278 = _276 ? 0 : 1;
    bool _280 = _246 > 0.0;
    bool _282 = _246 >= 0.0;
    bool _284 = isnan(_246);
    bool _286 = _282 || _284;
    bool _288 = isnan(0.0);
    bool _290 = _286 || _288;
    int _292 = ~_278;
    int _294 = _292 + 1;
    int _296 = _294 + 1;
    int _298 = _290 ? 0 : 1;
    bool _300 = _262 > 0.0;
    bool _302 = _262 >= 0.0;
    bool _304 = isnan(_262);
    bool _306 = _302 || _304;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    int _312 = ~_298;
    int _314 = _312 + 1;
    int _316 = _314 + 1;
    int _318 = _310 ? 0 : 1;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _326 = _324 != 0;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _330 = _328 != 0;
    int _332 = ~_318;
    int _334 = _332 + 1;
    int _336 = _334 + 1;
    int _338 = _296;
    int _340 = _316;
    int _342 = _336;
    if (!_264)
    {
        int _344 = ~_278;
        int _346 = _344 + 1;
        _338 = _346;
    }
    int _348 = _338;
    if (!_280)
    {
        int _350 = ~_298;
        int _352 = _350 + 1;
        _340 = _352;
    }
    int _354 = _340;
    if (!_300)
    {
        int _356 = ~_318;
        int _358 = _356 + 1;
        _342 = _358;
    }
    int _360 = _342;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _364 = _362 != 0;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _368 = _366 != 0;
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _372 = _370 != 0;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _376 = _374 != 0;
    float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _380 = log2(_378);
    bool _382 = !_322;
    int _384 = _382 ? 0 : 1;
    bool _386 = _200 > 0.5;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _390 = !_326;
    int _392 = _390 ? 0 : 1;
    float _394 = _198 + (-0.5);
    bool _396 = _196 > 0.5;
    float _398 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[79].z, _388);
    float _400 = _206 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _402 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _404 = abs(_384);
    float _406 = in.m_57.x;
    float _408 = in.m_57.y;
    float _410 = in.m_57.z;
    float _412 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].x, _400);
    float _414 = _380 * _140;
    bool _416 = !_330;
    int _418 = _416 ? 0 : 1;
    float _420 = in.m_59.x;
    float _422 = in.m_59.y;
    float _424 = in.m_59.z;
    int _426 = abs(_392);
    float _428 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _398);
    int _430 = abs(_418);
    float _432 = exp2(_414);
    float _434 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _436 = float(_348);
    float _438 = 0.0;
    bool _440 = _386;
    if (_364)
    {
        float _442 = in.m_55.x;
        _438 = _442;
    }
    float _444 = _438;
    float _446 = float(_404);
    float _448 = _428 * (-0.15915493667125701904296875);
    float _450 = float(_426);
    float _452 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].z, _250);
    float _454 = float(_354);
    float _456 = _446 * _436;
    float _458 = float(_430);
    float _460 = float(_360);
    float _462 = _450 * _454;
    float _464 = _456 * (-2.0);
    float _466 = -_432;
    float _468 = _466 + 1.0;
    bool _470 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _478 = _474 || _476;
    float _480 = _462 * (-2.0);
    float _482 = _458 * _460;
    float _484 = fma(_464, _406, _406);
    float _486 = fma(_480, _408, _408);
    float _488 = _478 ? _468 : 0.0;
    float _490 = _482 * (-2.0);
    bool _492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(1.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _504 = 1.0 + _502;
    float _506 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _508 = fma(_490, _410, _410);
    float _510 = 1.0 / _504;
    float _512 = _422 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _522 = _420 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = 1.0 / _516;
    float _526 = fma(_402, -2.0, _518);
    float _528 = -_520;
    float _530 = fma(_236, 2.0, _528);
    float _532 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _224);
    float _534 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _242);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _540 = -_140;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[76].x, _530);
    float _544 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _526);
    bool _546 = _500;
    if (_500)
    {
        float _548 = _488 * _510;
        _144 = _548;
    }
    float _550 = _144;
    float _552 = fma(_260, _464, _260);
    float _554 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[196].x, _484);
    float _556 = _256 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _558 = _434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _560 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _562 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _564 = _556 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _568 = _558 + _566;
    float _570 = 1.0 / _538;
    float _572 = _564 * _564;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _578 = fma(_552, _550, _554);
    float _580 = fma(_568, _568, _572);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = 1.0 / _576;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _590 = _560 + _588;
    float _592 = _584 * _524;
    float _594 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _596 = fma(_590, _590, _580);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _602 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _610 = rsqrt(_596);
    float _612 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[196].z, _508);
    float _614 = _608 * _570;
    float _616 = _578 * 0.15915493667125701904296875;
    float _618 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[196].y, _486);
    float _620 = _586;
    if (_364)
    {
        bool _622 = _444 > 0.5;
        _546 = _622;
    }
    bool _624 = _546;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _626;
    float _630 = 1.0 / _600;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _636 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _638 = _628 * _586;
    float _640 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (_368)
    {
        float _642 = in.m_55.z;
        _620 = _642;
    }
    float _644 = _620;
    float _646 = _604 * _610;
    float _648 = fma(_602, _480, _602);
    float _650 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _652 = _616 * 6.283185482025146484375;
    float _654 = sin(_652);
    float _656 = _564 * _646;
    float _658 = in.m_61.y;
    float _660 = fma(_650, _490, _650);
    float _662 = _568 * _646;
    float _664 = -_656;
    float _666 = _564 + _664;
    float _668 = _634 * _630;
    float _670 = fma(_660, _550, _612);
    float _672 = -_662;
    float _674 = _568 + _672;
    float _676 = _666 * _666;
    float _678 = _590 * _646;
    float _680 = in.m_61.x;
    float _682 = _670 * 0.15915493667125701904296875;
    float _684 = fma(_674, _674, _676);
    float _686 = -_678;
    float _688 = _590 + _686;
    float _690 = fma(_648, _550, _618);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _694 = _192 + _692;
    float _696 = _616 * 6.283185482025146484375;
    float _698 = cos(_696);
    float _700 = fma(_688, _688, _684);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _704 = _192 + _702;
    float _706 = _690 * 0.15915493667125701904296875;
    float _708 = fma(_614, _694, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _712 = _192 + _710;
    float _714 = fma(_638, _704, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _716 = in.m_63.x;
    float _718 = in.m_63.y;
    float _720 = in.m_63.z;
    float _722 = _706 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = -_658;
    float _728 = _726 + 1.0;
    float _730 = fma(_592, _712, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _734 = _192 + _732;
    int _736 = _386 ? as_type<int>(_728) : as_type<int>(_658);
    float _738 = fma(_668, _734, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _740 = _706 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _658;
    float _746 = _706;
    float _748 = _644;
    int _750 = as_type<int>(_708);
    if (_368)
    {
        bool _752 = _644 > 0.5;
        _440 = _752;
    }
    bool _754 = _440;
    float _756 = _372 ? as_type<float>(_736) : _658;
    if (_376)
    {
        float _758 = _396 ? _728 : _658;
        _744 = _758;
    }
    float _760 = _744;
    float _762 = sqrt(_700);
    if (!_364)
    {
        _746 = _680;
    }
    float _764 = _746;
    float _766 = fma(_216, _760, -0.5);
    float _768 = _764;
    if (!_364)
    {
        _748 = _764;
    }
    float _770 = _748;
    float _772 = _770;
    if (_364)
    {
        _768 = _680;
    }
    float _774 = _768;
    float _776 = _682 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _654 * _724;
    float _782 = _698 * _742;
    float _784 = _654 * _742;
    float _786 = _698 * _724;
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    bool _790 = _718 != 0.0;
    bool _792 = isnan(_718);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    int _800 = 0;
    float _802 = _774;
    if (_364)
    {
        float _804 = -_774;
        float _806 = _804 + 1.0;
        _800 = as_type<int>(_806);
    }
    int _808 = _800;
    float _810 = _682 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = _610 * _762;
    bool _816 = _716 == 0.0;
    bool _818 = !_798;
    bool _820 = _816 && _818;
    if (_364)
    {
        float _822 = _624 ? as_type<float>(_808) : _774;
        _772 = _822;
    }
    float _824 = _772;
    float _826 = _636 * _814;
    float _828 = _640 * _814;
    bool _830 = _720 == 0.0;
    bool _832 = _830 && _820;
    float _834 = _654 * _778;
    float _836 = _742 * _778;
    float _838 = _698 * _778;
    float _840 = _724 * _778;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _844 = fma(_266, _824, -0.5);
    float _846 = fma(_812, _782, _780);
    float _848 = fma(_812, _780, _782);
    float _850 = _594 * _814;
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _854 = -_786;
    float _856 = fma(_812, _784, _854);
    float _858 = -_784;
    float _860 = fma(_812, _786, _858);
    float _862 = _850 * _842;
    float _864 = _826 * _852;
    float _866 = _828 * _788;
    bool _868 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _870 = isnan(_192);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -_864;
    float _882 = _812 * _880;
    float _884 = _838 * _864;
    float _886 = _834 * _864;
    bool _888 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _890 = isnan(_192);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = fma(_836, _862, _882);
    bool _902 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _904 = isnan(_192);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_846, _862, _884);
    float _916 = fma(_856, _862, _886);
    bool _918 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _920 = isnan(_192);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -_878;
    float _932 = _930 + 1.0;
    float _934 = -_898;
    float _936 = _934 + 1.0;
    float _938 = -_912;
    float _940 = _938 + 1.0;
    float _942 = fma(_860, _866, _914);
    float _944 = _898 * _932;
    float _946 = _912 * _936;
    bool _948 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _950 = isnan(_192);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _928 * _940;
    float _962 = fma(_840, _866, _900);
    float _964 = in.m_65.x;
    float _966 = in.m_65.y;
    float _968 = in.m_65.z;
    float _970 = -_928;
    float _972 = _970 + 1.0;
    float _974 = _942 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _976 = _942 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _978 = fma(_848, _866, _916);
    float _980 = _958 * _972;
    float _982 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[8].x, _974);
    float _984 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[10].x, _976);
    float _986 = _448 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = -_958;
    float _992 = _990 + 1.0;
    float _994 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[8].z, _982);
    float _996 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[10].z, _984);
    float _998 = _558 + _994;
    float _1000 = _560 + _996;
    float _1002 = _730 * _980;
    float _1004 = _448 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1010 = _998 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1014 = _1000 + _1012;
    float _1016 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1002);
    float _1018 = _1010 * _1010;
    float _1020 = _1014 * _1014;
    float _1022 = _964;
    float _1024 = _966;
    float _1026 = _968;
    float _1028 = _1018;
    float _1030 = _1020;
    float _1032 = _998;
    float _1034 = _1000;
    if (!_832)
    {
        float _1036 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _1022 = _1036;
    }
    float _1038 = _1022;
    float _1040 = _1038;
    if (!_832)
    {
        float _1042 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _966);
        _1024 = _1042;
    }
    float _1044 = _1024;
    if (!_832)
    {
        float _1046 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _968);
        _1026 = _1046;
    }
    float _1048 = _1026;
    float _1050 = _1018 + _1020;
    float _1052 = fma(_708, _960, _1016);
    float _1054 = _988 * _766;
    if (_368)
    {
        float _1056 = -_774;
        float _1058 = _1056 + 1.0;
        _750 = as_type<int>(_1058);
    }
    int _1060 = _750;
    float _1062 = sqrt(_1050);
    float _1064 = fma(_714, _946, _1052);
    float _1066 = -_1054;
    float _1068 = fma(_1006, _844, _1066);
    float _1070 = _1006 * _766;
    float _1072 = -_1044;
    float _1074 = _812 * _1072;
    float _1076 = fma(_738, _944, _1064);
    float _1078 = fma(_532, _1068, _542);
    float _1080 = _942 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1082 = _838 * _1044;
    float _1084 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1076);
    float _1086 = _834 * _1044;
    float _1088 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1080);
    float _1090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1092 = fma(_988, _844, _1070);
    float _1094 = fma(_836, _1038, _1074);
    float _1096 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1088);
    bool _1098 = _1062 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1100 = fma(_846, _1038, _1082);
    float _1102 = fma(_856, _1038, _1086);
    float _1104 = _556 + _1096;
    if (_368)
    {
        float _1106 = _754 ? as_type<float>(_1060) : _774;
        _802 = _1106;
    }
    float _1108 = _802;
    float _1110 = -_544;
    float _1112 = fma(_534, _1092, _1110);
    if (!_1098)
    {
        _1040 = _1104;
    }
    float _1114 = _1040;
    bool _1116 = !_1098;
    float _1118 = _1114;
    if (!_1116)
    {
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1124 = _1062 + _1122;
        float _1126 = rsqrt(_1050);
        float _1128 = _1124 * _1120;
        float _1130 = _1104 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = _1128 * 0.15915493667125701904296875;
        float _1134 = _1132 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = fma(_1136, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1144 = _1126 * _1142;
        float _1146 = _1140 + (-1.0);
        float _1148 = fma(_1010, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1150 = fma(_1014, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1152 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1156 = _1148 + _1154;
        float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1160 = _1150 + _1158;
        float _1162 = fma(_1104, _1140, _1152);
        float _1164 = _1156 * _1156;
        float _1166 = _1160 * _1160;
        _1118 = _1162;
        _1028 = _1164;
        _1030 = _1166;
        _1032 = _1148;
        _1034 = _1150;
    }
    float _1168 = _1118;
    float _1170 = _1028;
    float _1172 = _1030;
    float _1174 = _1032;
    float _1176 = _1034;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1180 = _1168 + _1178;
    float _1182 = fma(_860, _1048, _1100);
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1186 = fma(_840, _1048, _1094);
    float _1188 = fma(_1180, _1180, _1170);
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1192 = fma(_848, _1048, _1102);
    float _1194 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1196 = _1188 + _1172;
    float _1198 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1190);
    float _1200 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1202 = _756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1194);
    float _1206 = sqrt(_1196);
    float _1208 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1210 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1200);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1224 = _1202 * _1090;
    float _1226 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1204);
    float _1228 = _1208 * _1184;
    float _1230 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1234 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1238 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1078 + 0.5;
    float _1248 = _1112 + 0.5;
    float _1250 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1252 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1198);
    out.m_67.x = _1240;
    out.m_67.y = _1242;
    out.m_67.z = _1244;
    out.m_67.w = _1232;
    bool _1254 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1256 = isnan(_1206);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1262 = _1258 || _1260;
    out.m_69.x = _1246;
    out.m_69.y = _1248;
    out.m_69.z = _1228;
    out.m_69.w = _1224;
    out.m_71.x = _1234;
    out.m_71.y = _1236;
    out.m_71.z = _1238;
    out.m_71.w = _1250;
    out.m_73.x = _1226;
    out.m_73.y = _1230;
    out.m_73.z = _1252;
    float _1264 = _1210;
    float _1266 = _1234;
    float _1268 = _1248;
    if (!_1262)
    {
        _1264 = 1.0;
    }
    float _1270 = _1264;
    bool _1272 = !_1262;
    float _1274 = _1270;
    if (!_1272)
    {
        bool _1276 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1278 = isnan(_1206);
        bool _1280 = _1276 || _1278;
        bool _1282 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1284 = _1280 || _1282;
        if (!_1284)
        {
            float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1288 = _1206 + _1286;
            float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1292 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1290;
            float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1298 = 1.0 / _1292;
            float _1300 = _1288 * _1298;
            float _1302 = fma(_1300, _1296, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1274 = _1302;
            _1304 = true;
        }
        else
        {
            bool _1306 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1308 = isnan(_1206);
            bool _1310 = _1306 || _1308;
            bool _1312 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1314 = _1310 || _1312;
            if (!_1314)
            {
                float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1318 = _1206 + _1316;
                float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1322 = _1320 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1326 = _1324 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1328 = 1.0 / _1322;
                float _1330 = _1318 * _1328;
                float _1332 = fma(_1330, _1326, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1274 = _1332;
                _1304 = true;
            }
            else
            {
                _1274 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1304 = false;
    float _1334 = _1274;
    float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1338 = _1168 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1342 = _1174 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1346 = _1176 + _1344;
    float _1348 = -_662;
    float _1350 = _558 + _1348;
    float _1352 = fma(_1338, _1334, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1354 = fma(_1342, _1334, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1356 = fma(_1346, _1334, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1358 = -_656;
    float _1360 = _1358 + _1352;
    float _1362 = -_662;
    float _1364 = _1362 + _1354;
    float _1366 = -_678;
    float _1368 = _1366 + _1356;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1360 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1376 = _1364 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1380 = _1368 + _1378;
    float _1382 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1384 = _1372 * _1372;
    float _1386 = fma(_1376, _1376, _1384);
    float _1388 = fma(_1380, _1380, _1386);
    float _1390 = rsqrt(_1388);
    float _1392 = sqrt(_1388);
    float _1394 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1398 = _1376 * _1394;
    float _1400 = _1380 * _1394;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 * _1400;
    float _1406 = _1402 + _1404;
    float _1408 = sqrt(_1406);
    bool _1410 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1414 = _1408 + _1412;
    float _1416 = _1386;
    float _1418 = _1406;
    float _1420 = _1414;
    float _1422 = _1394;
    float _1424 = _1380;
    float _1426 = _1372;
    if (_1410)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1428;
    }
    float _1430 = _1416;
    if (_1410)
    {
        float _1432 = rsqrt(_1406);
        _1418 = _1432;
    }
    float _1434 = _1418;
    float _1436 = _1434;
    if (_1410)
    {
        float _1438 = _1414 * _1430;
        _1420 = _1438;
    }
    float _1440 = _1420;
    if (_1410)
    {
        float _1442 = _1440 * 0.15915493667125701904296875;
        _1266 = _1442;
    }
    float _1444 = _1266;
    float _1446 = _1244;
    if (_1410)
    {
        float _1448 = _1444 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        _1446 = _1450;
    }
    float _1452 = _1446;
    float _1454 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1456 = precise::max(0.0, _1454);
    float _1458 = _1430;
    float _1460 = _1456;
    if (_1410)
    {
        float _1462 = _1444 * 6.283185482025146484375;
        float _1464 = sin(_1462);
        _1458 = _1464;
    }
    float _1466 = _1458;
    float _1468 = -_1394;
    float _1470 = -_1456;
    float _1472 = fma(_1372, _1468, _1470);
    if (_1410)
    {
        float _1474 = _1472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1460 = _1474;
    }
    float _1476 = _1460;
    float _1478 = _1476;
    float _1480 = _1452;
    if (_1410)
    {
        float _1482 = _1452 + (-1.0);
        _1422 = _1482;
    }
    float _1484 = _1422;
    float _1486 = -_678;
    float _1488 = _560 + _1486;
    float _1490 = _1484;
    if (_1410)
    {
        float _1492 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1490 = _1492;
    }
    float _1494 = _1490;
    float _1496 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1498 = _1466;
    float _1500 = _1494;
    if (_1410)
    {
        float _1502 = fma(_1466, _1476, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1268 = _1502;
    }
    float _1504 = _1268;
    float _1506 = _1504;
    if (!_1410)
    {
        _1498 = _1472;
    }
    float _1508 = _1498;
    float _1510 = _1508;
    if (_1410)
    {
        float _1512 = fma(_1472, _1452, _1494);
        _1510 = _1512;
    }
    float _1514 = _1510;
    if (!_1410)
    {
        _1500 = _1398;
    }
    float _1516 = _1500;
    float _1518 = _1516;
    if (_1410)
    {
        float _1520 = _1434 * _1504;
        _1478 = _1520;
    }
    float _1522 = _1478;
    if (!_1410)
    {
        _1480 = _1400;
    }
    float _1524 = _1480;
    float _1526 = _1524;
    if (!_1410)
    {
        _1436 = _1402;
    }
    float _1528 = _1436;
    float _1530 = _1528;
    if (_1410)
    {
        float _1532 = _1398 * _1522;
        _1518 = _1532;
    }
    float _1534 = _1518;
    if (_1410)
    {
        float _1536 = _1400 * _1522;
        _1526 = _1536;
    }
    float _1538 = _1526;
    if (!_1410)
    {
        _1506 = _1404;
    }
    float _1540 = _1506;
    float _1542 = floor(_1382);
    float _1544 = _1540;
    if (_1410)
    {
        float _1546 = _1534 * _1534;
        _1530 = _1546;
    }
    float _1548 = _1530;
    if (_1410)
    {
        float _1550 = _1538 * _1538;
        _1544 = _1550;
    }
    float _1552 = _1544;
    float _1554 = fma(_1514, _1514, _1548);
    float _1556 = floor(_1496);
    float _1558 = _1554 + _1552;
    float _1560 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1396);
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1564 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1562);
    float _1566 = precise::clamp(_1564, 0.0, 1.0);
    float _1568 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1570 = -_1566;
    float _1572 = _1570 + 1.0;
    float _1574 = rsqrt(_1558);
    float _1576 = -_1542;
    float _1578 = _1382 + _1576;
    float _1580 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1584 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1586 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1588 = abs(_1572);
    float _1590 = log2(_1588);
    float _1592 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = -_1586;
    float _1596 = fma(_1594, _1582, 1.0);
    float _1598 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1600 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1584);
    float _1602 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1592);
    float _1604 = -_1556;
    float _1606 = _1496 + _1604;
    float _1608 = _1574 * _1534;
    float _1610 = _1574 * _1538;
    float _1612 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1598);
    float _1614 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1602);
    float _1616 = _1574 * _1514;
    float _1618 = _1608 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1620 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1612);
    float _1622 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1624 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1600);
    float _1626 = -_1618;
    float _1628 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1626);
    float _1630 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1634 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1636 = -_1610;
    float _1638 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1628);
    float _1640 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1642 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1632);
    float _1644 = exp2(_1634);
    float _1646 = fma(_1638, -0.5, 0.5);
    float _1648 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1650 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1642);
    float _1652 = fma(_1638, 0.5, 0.5);
    float _1654 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1648);
    float _1656 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1650);
    float _1658 = log2(_1596);
    float _1660 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1662 = _1616 + 1.0;
    float _1664 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1654);
    float _1666 = fma(_1652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1668 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1660);
    float _1670 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1664);
    float _1672 = 1.0 / _1656;
    float _1674 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1668);
    float _1676 = -_1616;
    float _1678 = fma(_1644, _1662, _1676);
    float _1680 = fma(_1652, _1666, -0.212114393711090087890625);
    float _1682 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1674);
    float2 _4863 = float2(_1578, _1606);
    float _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4863, float2(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4863, float2(0.0), isnan(_4863)), level(0.0)).x;
    float _1686 = fma(_1652, _1680, 1.570728778839111328125);
    float _1688 = sqrt(_1646);
    float _1690 = _1658 * 0.693147182464599609375;
    float _1692 = _1670 * _1672;
    float _1694 = _1682 * _1672;
    float _1696 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1698 = fma(_1692, 0.5, 0.5);
    float _1700 = fma(_1694, -0.5, 0.5);
    float _1702 = _1688 * 0.636619746685028076171875;
    float3 _4900 = float3(_1698, _1700, _1696);
    float _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4900, float3(0.0), isnan(_4900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4900, float3(0.0), isnan(_4900)), level(0.0)).x;
    float3 _4911 = float3(_1698, _1700, _1696);
    float4 _1707 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4911, float3(0.0), isnan(_4911)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4911, float3(0.0), isnan(_4911)), level(0.0)).xyzw;
    float _1709 = _1707.x;
    float _1711 = _1707.y;
    float _1713 = _1707.z;
    float _1715 = _1707.w;
    float _1717 = -_1686;
    float _1719 = fma(_1702, _1717, 1.0);
    float _1721 = fma(_1678, 0.5, 0.5);
    float2 _4934 = float2(_1719, _1721);
    float3 _1725 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4934, float2(0.0), isnan(_4934)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4934, float2(0.0), isnan(_4934)), level(0.0)).xyz;
    float _1727 = _1725.x;
    float _1729 = _1725.y;
    float _1731 = _1725.z;
    float _1733 = -_656;
    float _1735 = _556 + _1733;
    float _1737 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1376;
    out.m_75.y = _1372;
    out.m_75.z = _1380;
    float _1739 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1741 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1743 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1737);
    float _1745 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1739);
    float _1747 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1741);
    float _1749 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1745);
    float _1751 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    float _1753 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1755 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1757 = 1.0 / _1753;
    float _1759 = _1755 + _1753;
    bool _1761 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan(0.5);
    bool _1769 = _1765 || _1767;
    float _1771 = _1759 * _1757;
    float _1773 = _1771 * 0.5;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1777 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1775);
    float _1779 = 1.0 / _1777;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1783 = _1678;
    float _1785 = _1737;
    float _1787 = _1656;
    float _1789 = _1682;
    if (!_1769)
    {
        _1781 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1791 = _1781;
    float _1793 = _1791;
    if (!_1769)
    {
        float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1797 = _1791 + _1795;
        _1793 = _1797;
    }
    float _1799 = _1793;
    if (!_1769)
    {
        float _1801 = 1.0 / _1799;
        _1783 = _1801;
    }
    float _1803 = _1783;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1807 = _1779 * _1805;
    float _1809 = abs(_1807);
    float _1811 = log2(_1809);
    float _1813 = _1670;
    if (!_1769)
    {
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1817 = _1807 + _1815;
        _1785 = _1817;
    }
    float _1819 = _1785;
    bool _1821 = _1807 <= 8000.0;
    bool _1823 = isnan(_1807);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(8000.0);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1835 = exp2(_1833);
    float _1837 = fma(_1835, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1839 = precise::clamp(_1837, 0.0, 1.0);
    float _1841 = fma(_1839, -2.0, 3.0);
    float _1843 = _1839 * _1839;
    float _1845 = _1843 * _1841;
    float _1847 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1743);
    float _1851 = -_1845;
    float _1853 = _1851 + 1.0;
    float _1855 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1849);
    float _1857 = exp2(_1847);
    float _1859 = in.m_77.x;
    float _1861 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1845);
    float _1863 = _1845;
    if (_1769)
    {
        _1863 = 1.0;
    }
    float _1865 = _1863;
    float _1867 = _1865;
    if (!_1769)
    {
        float _1869 = _1819 * _1803;
        float _1871 = precise::clamp(_1869, 0.0, 1.0);
        _1867 = _1871;
    }
    float _1873 = _1867;
    float _1875 = _1831 * _1861;
    float _1877 = _1855 + _1656;
    bool _1879 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1881 = isnan(_1392);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1887 = _1883 || _1885;
    out.gl_Position.x = _1670;
    out.gl_Position.y = _1682;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1656;
    float _1889 = _1875 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1891 = _1877 * 0.5;
    float _1893 = -_1857;
    float _1895 = _1893 + 1.0;
    out.m_79.z = _1891;
    out.m_79.w = _1656;
    float _1897 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1887)
    {
        _1424 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1899 = _1424;
    float _1901 = _1899;
    float _1903 = _1899;
    if (!_1887)
    {
        _1787 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1905 = _1787;
    float _1907 = _1905;
    float _1909 = _1905;
    if (!_1887)
    {
        _1813 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1911 = _1813;
    float _1913 = _1911;
    float _1915 = _1911;
    if (!_1887)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1917 = _1789;
    float _1919 = _1917;
    float _1921 = _1917;
    if (!_1887)
    {
        _1426 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1923 = _1426;
    float _1925 = -_1684;
    float _1927 = _1925 + 1.0;
    float _1929 = _1927 * _1889;
    float _1931 = precise::clamp(_1929, 0.0, 1.0);
    float _1933 = -_1931;
    float _1935 = fma(_1933, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1937 = _1935 * _1859;
    float _1939 = _1937 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1941 = _1897 * _1704;
    float _1943 = -_1897;
    float _1945 = _1943 + 1.0;
    out.m_81.x = _1939;
    float _1947 = _1715 * _1941;
    float _1949 = _1715 * _1945;
    float _1951 = _1731 * _1941;
    float _1953 = fma(_1727, _1947, _1709);
    float _1955 = fma(_1729, _1947, _1711);
    float _1957 = _1947;
    float _1959 = _1923;
    float _1961 = _1923;
    if (!_1887)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1963 = _1957;
    float _1965 = fma(_1715, _1951, _1713);
    float _1967 = _1873 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_83.x = _1953;
    out.m_83.y = _1955;
    out.m_83.z = _1965;
    out.m_83.w = _1949;
    bool _1969 = !_1887;
    float _1971 = _1963;
    float _1973 = _1963;
    if (!_1969)
    {
        bool _1975 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1977 = isnan(_1392);
        bool _1979 = _1975 || _1977;
        bool _1981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1983 = _1979 || _1981;
        if (!_1983)
        {
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1987 = _1392 + _1985;
            float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1991 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1989;
            float _1993 = 1.0 / _1991;
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2015 = _1987 * _1993;
            float _2017 = precise::clamp(_2015, 0.0, 1.0);
            float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2023 = fma(_2017, _1997, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2025 = fma(_2017, _2021, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2027 = fma(_2017, _2001, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2029 = fma(_2017, _2005, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2031 = fma(_2017, _2009, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2033 = fma(_2017, _2013, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1915 = _2025;
            _1961 = _2031;
            _1909 = _2023;
            _1903 = _2029;
            _1921 = _2027;
            _1973 = _2033;
            _2035 = true;
        }
        else
        {
            bool _2037 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2039 = isnan(_1392);
            bool _2041 = _2037 || _2039;
            bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2045 = _2041 || _2043;
            if (!_2045)
            {
                _1907 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2047 = _1907;
            _1909 = _2047;
            if (!_2045)
            {
                _1913 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2049 = _1913;
            _1915 = _2049;
            if (!_2045)
            {
                _1919 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2051 = _1919;
            _1921 = _2051;
            if (!_2045)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2053 = _1901;
            _1903 = _2053;
            if (!_2045)
            {
                _1959 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2055 = _1959;
            _1961 = _2055;
            if (!_2045)
            {
                _1971 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2057 = _1971;
            bool _2059 = !_2045;
            _1973 = _2057;
            if (!_2059)
            {
                bool _2061 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2063 = isnan(_1392);
                bool _2065 = _2061 || _2063;
                bool _2067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2069 = _2065 || _2067;
                if (!_2069)
                {
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2073 = _1392 + _2071;
                    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2075;
                    float _2079 = 1.0 / _2077;
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2101 = _2073 * _2079;
                    float _2103 = precise::clamp(_2101, 0.0, 1.0);
                    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2109 = fma(_2103, _2083, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2111 = fma(_2103, _2107, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2113 = fma(_2103, _2087, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2115 = fma(_2103, _2091, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2117 = fma(_2103, _2095, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2119 = fma(_2103, _2099, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1915 = _2111;
                    _1961 = _2117;
                    _1909 = _2109;
                    _1903 = _2115;
                    _1921 = _2113;
                    _1973 = _2119;
                    _2035 = true;
                }
                else
                {
                    _1915 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1961 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1909 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1921 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1973 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2035 = false;
    float _2121 = _1915;
    float _2123 = _1961;
    float _2125 = _1909;
    float _2127 = _1903;
    float _2129 = _1921;
    float _2131 = _1973;
    float _2133 = _1967 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2135 = fma(_1230, -0.5, 0.5);
    float _2137 = precise::clamp(_2135, 0.0, 1.0);
    float _2139 = -_2121;
    float _2141 = _2139 + _2123;
    float _2143 = -_2125;
    float _2145 = _2143 + _2127;
    out.m_51.x = _2133;
    float _2147 = fma(_2137, _2141, _2121);
    float _2149 = -_2129;
    float _2151 = _2149 + _2131;
    float _2153 = fma(_2137, _2145, _2125);
    float _2155 = _2147 * 0.586610972881317138671875;
    bool _2157 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2159 = fma(_2137, _2151, _2129);
    out.m_85.x = 0.0;
    float _2161 = fma(_2153, 0.298911988735198974609375, _2155);
    bool _2163 = _1873 > 0.0;
    bool _2165 = isnan(_1873);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan(0.0);
    bool _2171 = _2167 || _2169;
    float _2173 = fma(_2159, 0.114477999508380889892578125, _2161);
    float _2175 = -_2173;
    float _2177 = _2153 + _2175;
    float _2179 = -_2173;
    float _2181 = _2147 + _2179;
    float _2183 = -_2173;
    float _2185 = _2159 + _2183;
    float _2187 = fma(_2177, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2173);
    float _2189 = fma(_2181, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2173);
    float _2191 = fma(_2185, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2173);
    bool _2193 = !_2157;
    if (!_2193)
    {
        float _2195 = -_1360;
        float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2199 = -_1364;
        float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2203 = -_1368;
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2207 = _2197 * _2197;
        float _2209 = fma(_2201, _2201, _2207);
        float _2211 = fma(_2205, _2205, _2209);
        float _2213 = sqrt(_2211);
        float _2215 = rsqrt(_2211);
        float _2217 = -_2213;
        float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2221 = _2219 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = _2201 * _2215;
        float _2227 = _2197 * _2215;
        float _2229 = abs(_2223);
        float _2231 = log2(_2229);
        float _2233 = _2205 * _2215;
        float _2235 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2237 = _1230 * _2227;
        float _2239 = -_2227;
        float _2241 = -_2235;
        float _2243 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2241);
        float _2245 = fma(_1226, _2225, _2237);
        float _2247 = -_2233;
        float _2249 = fma(_2247, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2243);
        float _2251 = fma(_1252, _2233, _2245);
        float _2253 = precise::clamp(_2251, 0.0, 1.0);
        float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2257 = _2249 + _2255;
        float _2259 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2261 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2263 = precise::clamp(_2261, 0.0, 1.0);
        float _2265 = exp2(_2259);
        float _2267 = _2265 * _2263;
        float _2269 = _2253 * _2267;
        float _2271 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2273 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2275 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2271;
        out.m_85.y = _2273;
        out.m_85.z = _2275;
    }
    out.m_87.x = _2187;
    out.m_87.y = _2189;
    out.m_87.z = _2191;
    if (_2171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2277 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2277;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2035 = false;
    bool _1304 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2334 = as_type<float>(_122);
        out.gl_Position.z = _2334;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_53.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2403 = as_type<float>(_160);
        out.gl_Position.z = _2403;
    }
    if (_154)
    {
        return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_55.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_55.x;
    float _196 = in.m_55.y;
    float _198 = in.m_55.z;
    float _200 = in.m_55.w;
    float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _204 = in.m_48.x;
    float _206 = in.m_48.y;
    float _208 = in.m_48.z;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _216 = _202 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _218 = _198 * 2.0;
    float _220 = _194 * 2.0;
    float _222 = _196 * 2.0;
    float _224 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _210);
    float _226 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _228 = _206 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _230 = floor(_218);
    float _232 = _196 + _198;
    float _234 = _194 + _198;
    float _236 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _238 = _196 + _194;
    float _240 = _194 + (-0.5);
    float _242 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _212);
    float _244 = _196 + (-0.5);
    float _246 = floor(_220);
    float _248 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _226);
    float _250 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].x, _228);
    float _252 = _238 + (-1.0);
    float _254 = _232 + (-1.0);
    float _256 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _248);
    float _258 = _234 + (-1.0);
    float _260 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _262 = floor(_222);
    bool _264 = _230 > 0.0;
    float _266 = _214 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _268 = _230 >= 0.0;
    bool _270 = isnan(_230);
    bool _272 = _268 || _270;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    int _278 = _276 ? 0 : 1;
    bool _280 = _246 > 0.0;
    bool _282 = _246 >= 0.0;
    bool _284 = isnan(_246);
    bool _286 = _282 || _284;
    bool _288 = isnan(0.0);
    bool _290 = _286 || _288;
    int _292 = ~_278;
    int _294 = _292 + 1;
    int _296 = _294 + 1;
    int _298 = _290 ? 0 : 1;
    bool _300 = _262 > 0.0;
    bool _302 = _262 >= 0.0;
    bool _304 = isnan(_262);
    bool _306 = _302 || _304;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    int _312 = ~_298;
    int _314 = _312 + 1;
    int _316 = _314 + 1;
    int _318 = _310 ? 0 : 1;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _326 = _324 != 0;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _330 = _328 != 0;
    int _332 = ~_318;
    int _334 = _332 + 1;
    int _336 = _334 + 1;
    int _338 = _296;
    int _340 = _316;
    int _342 = _336;
    if (!_264)
    {
        int _344 = ~_278;
        int _346 = _344 + 1;
        _338 = _346;
    }
    int _348 = _338;
    if (!_280)
    {
        int _350 = ~_298;
        int _352 = _350 + 1;
        _340 = _352;
    }
    int _354 = _340;
    if (!_300)
    {
        int _356 = ~_318;
        int _358 = _356 + 1;
        _342 = _358;
    }
    int _360 = _342;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _364 = _362 != 0;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _368 = _366 != 0;
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _372 = _370 != 0;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _376 = _374 != 0;
    float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _380 = log2(_378);
    bool _382 = !_322;
    int _384 = _382 ? 0 : 1;
    bool _386 = _200 > 0.5;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _390 = !_326;
    int _392 = _390 ? 0 : 1;
    float _394 = _198 + (-0.5);
    bool _396 = _196 > 0.5;
    float _398 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[79].z, _388);
    float _400 = _206 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _402 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _404 = abs(_384);
    float _406 = in.m_57.x;
    float _408 = in.m_57.y;
    float _410 = in.m_57.z;
    float _412 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].x, _400);
    float _414 = _380 * _140;
    bool _416 = !_330;
    int _418 = _416 ? 0 : 1;
    float _420 = in.m_59.x;
    float _422 = in.m_59.y;
    float _424 = in.m_59.z;
    int _426 = abs(_392);
    float _428 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _398);
    int _430 = abs(_418);
    float _432 = exp2(_414);
    float _434 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _436 = float(_348);
    float _438 = 0.0;
    bool _440 = _386;
    if (_364)
    {
        float _442 = in.m_55.x;
        _438 = _442;
    }
    float _444 = _438;
    float _446 = float(_404);
    float _448 = _428 * (-0.15915493667125701904296875);
    float _450 = float(_426);
    float _452 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].z, _250);
    float _454 = float(_354);
    float _456 = _446 * _436;
    float _458 = float(_430);
    float _460 = float(_360);
    float _462 = _450 * _454;
    float _464 = _456 * (-2.0);
    float _466 = -_432;
    float _468 = _466 + 1.0;
    bool _470 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _478 = _474 || _476;
    float _480 = _462 * (-2.0);
    float _482 = _458 * _460;
    float _484 = fma(_464, _406, _406);
    float _486 = fma(_480, _408, _408);
    float _488 = _478 ? _468 : 0.0;
    float _490 = _482 * (-2.0);
    bool _492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(1.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _504 = 1.0 + _502;
    float _506 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _508 = fma(_490, _410, _410);
    float _510 = 1.0 / _504;
    float _512 = _422 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _522 = _420 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = 1.0 / _516;
    float _526 = fma(_402, -2.0, _518);
    float _528 = -_520;
    float _530 = fma(_236, 2.0, _528);
    float _532 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _224);
    float _534 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _242);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _540 = -_140;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[76].x, _530);
    float _544 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _526);
    bool _546 = _500;
    if (_500)
    {
        float _548 = _488 * _510;
        _144 = _548;
    }
    float _550 = _144;
    float _552 = fma(_260, _464, _260);
    float _554 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[196].x, _484);
    float _556 = _256 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _558 = _434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _560 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _562 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _564 = _556 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _568 = _558 + _566;
    float _570 = 1.0 / _538;
    float _572 = _564 * _564;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _578 = fma(_552, _550, _554);
    float _580 = fma(_568, _568, _572);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = 1.0 / _576;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _590 = _560 + _588;
    float _592 = _584 * _524;
    float _594 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _596 = fma(_590, _590, _580);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _602 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _610 = rsqrt(_596);
    float _612 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[196].z, _508);
    float _614 = _608 * _570;
    float _616 = _578 * 0.15915493667125701904296875;
    float _618 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[196].y, _486);
    float _620 = _586;
    if (_364)
    {
        bool _622 = _444 > 0.5;
        _546 = _622;
    }
    bool _624 = _546;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _626;
    float _630 = 1.0 / _600;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _636 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _638 = _628 * _586;
    float _640 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (_368)
    {
        float _642 = in.m_55.z;
        _620 = _642;
    }
    float _644 = _620;
    float _646 = _604 * _610;
    float _648 = fma(_602, _480, _602);
    float _650 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _652 = _616 * 6.283185482025146484375;
    float _654 = sin(_652);
    float _656 = _564 * _646;
    float _658 = in.m_61.y;
    float _660 = fma(_650, _490, _650);
    float _662 = _568 * _646;
    float _664 = -_656;
    float _666 = _564 + _664;
    float _668 = _634 * _630;
    float _670 = fma(_660, _550, _612);
    float _672 = -_662;
    float _674 = _568 + _672;
    float _676 = _666 * _666;
    float _678 = _590 * _646;
    float _680 = in.m_61.x;
    float _682 = _670 * 0.15915493667125701904296875;
    float _684 = fma(_674, _674, _676);
    float _686 = -_678;
    float _688 = _590 + _686;
    float _690 = fma(_648, _550, _618);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _694 = _192 + _692;
    float _696 = _616 * 6.283185482025146484375;
    float _698 = cos(_696);
    float _700 = fma(_688, _688, _684);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _704 = _192 + _702;
    float _706 = _690 * 0.15915493667125701904296875;
    float _708 = fma(_614, _694, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _712 = _192 + _710;
    float _714 = fma(_638, _704, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _716 = in.m_63.x;
    float _718 = in.m_63.y;
    float _720 = in.m_63.z;
    float _722 = _706 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = -_658;
    float _728 = _726 + 1.0;
    float _730 = fma(_592, _712, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _734 = _192 + _732;
    int _736 = _386 ? as_type<int>(_728) : as_type<int>(_658);
    float _738 = fma(_668, _734, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _740 = _706 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _658;
    float _746 = _706;
    float _748 = _644;
    int _750 = as_type<int>(_708);
    if (_368)
    {
        bool _752 = _644 > 0.5;
        _440 = _752;
    }
    bool _754 = _440;
    float _756 = _372 ? as_type<float>(_736) : _658;
    if (_376)
    {
        float _758 = _396 ? _728 : _658;
        _744 = _758;
    }
    float _760 = _744;
    float _762 = sqrt(_700);
    if (!_364)
    {
        _746 = _680;
    }
    float _764 = _746;
    float _766 = fma(_216, _760, -0.5);
    float _768 = _764;
    if (!_364)
    {
        _748 = _764;
    }
    float _770 = _748;
    float _772 = _770;
    if (_364)
    {
        _768 = _680;
    }
    float _774 = _768;
    float _776 = _682 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _654 * _724;
    float _782 = _698 * _742;
    float _784 = _654 * _742;
    float _786 = _698 * _724;
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    bool _790 = _718 != 0.0;
    bool _792 = isnan(_718);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    int _800 = 0;
    float _802 = _774;
    if (_364)
    {
        float _804 = -_774;
        float _806 = _804 + 1.0;
        _800 = as_type<int>(_806);
    }
    int _808 = _800;
    float _810 = _682 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = _610 * _762;
    bool _816 = _716 == 0.0;
    bool _818 = !_798;
    bool _820 = _816 && _818;
    if (_364)
    {
        float _822 = _624 ? as_type<float>(_808) : _774;
        _772 = _822;
    }
    float _824 = _772;
    float _826 = _636 * _814;
    float _828 = _640 * _814;
    bool _830 = _720 == 0.0;
    bool _832 = _830 && _820;
    float _834 = _654 * _778;
    float _836 = _742 * _778;
    float _838 = _698 * _778;
    float _840 = _724 * _778;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _844 = fma(_266, _824, -0.5);
    float _846 = fma(_812, _782, _780);
    float _848 = fma(_812, _780, _782);
    float _850 = _594 * _814;
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _854 = -_786;
    float _856 = fma(_812, _784, _854);
    float _858 = -_784;
    float _860 = fma(_812, _786, _858);
    float _862 = _850 * _842;
    float _864 = _826 * _852;
    float _866 = _828 * _788;
    bool _868 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _870 = isnan(_192);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -_864;
    float _882 = _812 * _880;
    float _884 = _838 * _864;
    float _886 = _834 * _864;
    bool _888 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _890 = isnan(_192);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = fma(_836, _862, _882);
    bool _902 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _904 = isnan(_192);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_846, _862, _884);
    float _916 = fma(_856, _862, _886);
    bool _918 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _920 = isnan(_192);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -_878;
    float _932 = _930 + 1.0;
    float _934 = -_898;
    float _936 = _934 + 1.0;
    float _938 = -_912;
    float _940 = _938 + 1.0;
    float _942 = fma(_860, _866, _914);
    float _944 = _898 * _932;
    float _946 = _912 * _936;
    bool _948 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _950 = isnan(_192);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _928 * _940;
    float _962 = fma(_840, _866, _900);
    float _964 = in.m_65.x;
    float _966 = in.m_65.y;
    float _968 = in.m_65.z;
    float _970 = -_928;
    float _972 = _970 + 1.0;
    float _974 = _942 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _976 = _942 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _978 = fma(_848, _866, _916);
    float _980 = _958 * _972;
    float _982 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[8].x, _974);
    float _984 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[10].x, _976);
    float _986 = _448 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = -_958;
    float _992 = _990 + 1.0;
    float _994 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[8].z, _982);
    float _996 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[10].z, _984);
    float _998 = _558 + _994;
    float _1000 = _560 + _996;
    float _1002 = _730 * _980;
    float _1004 = _448 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1010 = _998 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1014 = _1000 + _1012;
    float _1016 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1002);
    float _1018 = _1010 * _1010;
    float _1020 = _1014 * _1014;
    float _1022 = _964;
    float _1024 = _966;
    float _1026 = _968;
    float _1028 = _1018;
    float _1030 = _1020;
    float _1032 = _998;
    float _1034 = _1000;
    if (!_832)
    {
        float _1036 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _1022 = _1036;
    }
    float _1038 = _1022;
    float _1040 = _1038;
    if (!_832)
    {
        float _1042 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _966);
        _1024 = _1042;
    }
    float _1044 = _1024;
    if (!_832)
    {
        float _1046 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _968);
        _1026 = _1046;
    }
    float _1048 = _1026;
    float _1050 = _1018 + _1020;
    float _1052 = fma(_708, _960, _1016);
    float _1054 = _988 * _766;
    if (_368)
    {
        float _1056 = -_774;
        float _1058 = _1056 + 1.0;
        _750 = as_type<int>(_1058);
    }
    int _1060 = _750;
    float _1062 = sqrt(_1050);
    float _1064 = fma(_714, _946, _1052);
    float _1066 = -_1054;
    float _1068 = fma(_1006, _844, _1066);
    float _1070 = _1006 * _766;
    float _1072 = -_1044;
    float _1074 = _812 * _1072;
    float _1076 = fma(_738, _944, _1064);
    float _1078 = fma(_532, _1068, _542);
    float _1080 = _942 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1082 = _838 * _1044;
    float _1084 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1076);
    float _1086 = _834 * _1044;
    float _1088 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1080);
    float _1090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1092 = fma(_988, _844, _1070);
    float _1094 = fma(_836, _1038, _1074);
    float _1096 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1088);
    bool _1098 = _1062 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1100 = fma(_846, _1038, _1082);
    float _1102 = fma(_856, _1038, _1086);
    float _1104 = _556 + _1096;
    if (_368)
    {
        float _1106 = _754 ? as_type<float>(_1060) : _774;
        _802 = _1106;
    }
    float _1108 = _802;
    float _1110 = -_544;
    float _1112 = fma(_534, _1092, _1110);
    if (!_1098)
    {
        _1040 = _1104;
    }
    float _1114 = _1040;
    bool _1116 = !_1098;
    float _1118 = _1114;
    if (!_1116)
    {
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1124 = _1062 + _1122;
        float _1126 = rsqrt(_1050);
        float _1128 = _1124 * _1120;
        float _1130 = _1104 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = _1128 * 0.15915493667125701904296875;
        float _1134 = _1132 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = fma(_1136, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1144 = _1126 * _1142;
        float _1146 = _1140 + (-1.0);
        float _1148 = fma(_1010, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1150 = fma(_1014, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1152 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1156 = _1148 + _1154;
        float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1160 = _1150 + _1158;
        float _1162 = fma(_1104, _1140, _1152);
        float _1164 = _1156 * _1156;
        float _1166 = _1160 * _1160;
        _1118 = _1162;
        _1028 = _1164;
        _1030 = _1166;
        _1032 = _1148;
        _1034 = _1150;
    }
    float _1168 = _1118;
    float _1170 = _1028;
    float _1172 = _1030;
    float _1174 = _1032;
    float _1176 = _1034;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1180 = _1168 + _1178;
    float _1182 = fma(_860, _1048, _1100);
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1186 = fma(_840, _1048, _1094);
    float _1188 = fma(_1180, _1180, _1170);
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1192 = fma(_848, _1048, _1102);
    float _1194 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1196 = _1188 + _1172;
    float _1198 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1190);
    float _1200 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1202 = _756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1194);
    float _1206 = sqrt(_1196);
    float _1208 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1210 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1200);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1224 = _1202 * _1090;
    float _1226 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1204);
    float _1228 = _1208 * _1184;
    float _1230 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1234 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1238 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1078 + 0.5;
    float _1248 = _1112 + 0.5;
    float _1250 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1252 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1198);
    out.m_67.x = _1240;
    out.m_67.y = _1242;
    out.m_67.z = _1244;
    out.m_67.w = _1232;
    bool _1254 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1256 = isnan(_1206);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1262 = _1258 || _1260;
    out.m_69.x = _1246;
    out.m_69.y = _1248;
    out.m_69.z = _1228;
    out.m_69.w = _1224;
    out.m_71.x = _1234;
    out.m_71.y = _1236;
    out.m_71.z = _1238;
    out.m_71.w = _1250;
    out.m_73.x = _1226;
    out.m_73.y = _1230;
    out.m_73.z = _1252;
    float _1264 = _1210;
    float _1266 = _1234;
    float _1268 = _1248;
    if (!_1262)
    {
        _1264 = 1.0;
    }
    float _1270 = _1264;
    bool _1272 = !_1262;
    float _1274 = _1270;
    if (!_1272)
    {
        bool _1276 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1278 = isnan(_1206);
        bool _1280 = _1276 || _1278;
        bool _1282 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1284 = _1280 || _1282;
        if (!_1284)
        {
            float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1288 = _1206 + _1286;
            float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1292 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1290;
            float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1298 = 1.0 / _1292;
            float _1300 = _1288 * _1298;
            float _1302 = fma(_1300, _1296, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1274 = _1302;
            _1304 = true;
        }
        else
        {
            bool _1306 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1308 = isnan(_1206);
            bool _1310 = _1306 || _1308;
            bool _1312 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1314 = _1310 || _1312;
            if (!_1314)
            {
                float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1318 = _1206 + _1316;
                float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1322 = _1320 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1326 = _1324 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1328 = 1.0 / _1322;
                float _1330 = _1318 * _1328;
                float _1332 = fma(_1330, _1326, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1274 = _1332;
                _1304 = true;
            }
            else
            {
                _1274 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1304 = false;
    float _1334 = _1274;
    float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1338 = _1168 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1342 = _1174 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1346 = _1176 + _1344;
    float _1348 = -_662;
    float _1350 = _558 + _1348;
    float _1352 = fma(_1338, _1334, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1354 = fma(_1342, _1334, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1356 = fma(_1346, _1334, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1358 = -_656;
    float _1360 = _1358 + _1352;
    float _1362 = -_662;
    float _1364 = _1362 + _1354;
    float _1366 = -_678;
    float _1368 = _1366 + _1356;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1360 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1376 = _1364 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1380 = _1368 + _1378;
    float _1382 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1384 = _1372 * _1372;
    float _1386 = fma(_1376, _1376, _1384);
    float _1388 = fma(_1380, _1380, _1386);
    float _1390 = rsqrt(_1388);
    float _1392 = sqrt(_1388);
    float _1394 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1398 = _1376 * _1394;
    float _1400 = _1380 * _1394;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 * _1400;
    float _1406 = _1402 + _1404;
    float _1408 = sqrt(_1406);
    bool _1410 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1414 = _1408 + _1412;
    float _1416 = _1386;
    float _1418 = _1406;
    float _1420 = _1414;
    float _1422 = _1394;
    float _1424 = _1380;
    float _1426 = _1372;
    if (_1410)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1428;
    }
    float _1430 = _1416;
    if (_1410)
    {
        float _1432 = rsqrt(_1406);
        _1418 = _1432;
    }
    float _1434 = _1418;
    float _1436 = _1434;
    if (_1410)
    {
        float _1438 = _1414 * _1430;
        _1420 = _1438;
    }
    float _1440 = _1420;
    if (_1410)
    {
        float _1442 = _1440 * 0.15915493667125701904296875;
        _1266 = _1442;
    }
    float _1444 = _1266;
    float _1446 = _1244;
    if (_1410)
    {
        float _1448 = _1444 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        _1446 = _1450;
    }
    float _1452 = _1446;
    float _1454 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1456 = precise::max(0.0, _1454);
    float _1458 = _1430;
    float _1460 = _1456;
    if (_1410)
    {
        float _1462 = _1444 * 6.283185482025146484375;
        float _1464 = sin(_1462);
        _1458 = _1464;
    }
    float _1466 = _1458;
    float _1468 = -_1394;
    float _1470 = -_1456;
    float _1472 = fma(_1372, _1468, _1470);
    if (_1410)
    {
        float _1474 = _1472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1460 = _1474;
    }
    float _1476 = _1460;
    float _1478 = _1476;
    float _1480 = _1452;
    if (_1410)
    {
        float _1482 = _1452 + (-1.0);
        _1422 = _1482;
    }
    float _1484 = _1422;
    float _1486 = -_678;
    float _1488 = _560 + _1486;
    float _1490 = _1484;
    if (_1410)
    {
        float _1492 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1490 = _1492;
    }
    float _1494 = _1490;
    float _1496 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1498 = _1466;
    float _1500 = _1494;
    if (_1410)
    {
        float _1502 = fma(_1466, _1476, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1268 = _1502;
    }
    float _1504 = _1268;
    float _1506 = _1504;
    if (!_1410)
    {
        _1498 = _1472;
    }
    float _1508 = _1498;
    float _1510 = _1508;
    if (_1410)
    {
        float _1512 = fma(_1472, _1452, _1494);
        _1510 = _1512;
    }
    float _1514 = _1510;
    if (!_1410)
    {
        _1500 = _1398;
    }
    float _1516 = _1500;
    float _1518 = _1516;
    if (_1410)
    {
        float _1520 = _1434 * _1504;
        _1478 = _1520;
    }
    float _1522 = _1478;
    if (!_1410)
    {
        _1480 = _1400;
    }
    float _1524 = _1480;
    float _1526 = _1524;
    if (!_1410)
    {
        _1436 = _1402;
    }
    float _1528 = _1436;
    float _1530 = _1528;
    if (_1410)
    {
        float _1532 = _1398 * _1522;
        _1518 = _1532;
    }
    float _1534 = _1518;
    if (_1410)
    {
        float _1536 = _1400 * _1522;
        _1526 = _1536;
    }
    float _1538 = _1526;
    if (!_1410)
    {
        _1506 = _1404;
    }
    float _1540 = _1506;
    float _1542 = floor(_1382);
    float _1544 = _1540;
    if (_1410)
    {
        float _1546 = _1534 * _1534;
        _1530 = _1546;
    }
    float _1548 = _1530;
    if (_1410)
    {
        float _1550 = _1538 * _1538;
        _1544 = _1550;
    }
    float _1552 = _1544;
    float _1554 = fma(_1514, _1514, _1548);
    float _1556 = floor(_1496);
    float _1558 = _1554 + _1552;
    float _1560 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1396);
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1564 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1562);
    float _1566 = precise::clamp(_1564, 0.0, 1.0);
    float _1568 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1570 = -_1566;
    float _1572 = _1570 + 1.0;
    float _1574 = rsqrt(_1558);
    float _1576 = -_1542;
    float _1578 = _1382 + _1576;
    float _1580 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1584 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1586 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1588 = abs(_1572);
    float _1590 = log2(_1588);
    float _1592 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = -_1586;
    float _1596 = fma(_1594, _1582, 1.0);
    float _1598 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1600 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1584);
    float _1602 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1592);
    float _1604 = -_1556;
    float _1606 = _1496 + _1604;
    float _1608 = _1574 * _1534;
    float _1610 = _1574 * _1538;
    float _1612 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1598);
    float _1614 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1602);
    float _1616 = _1574 * _1514;
    float _1618 = _1608 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1620 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1612);
    float _1622 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1624 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1600);
    float _1626 = -_1618;
    float _1628 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1626);
    float _1630 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1634 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1636 = -_1610;
    float _1638 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1628);
    float _1640 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1642 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1632);
    float _1644 = exp2(_1634);
    float _1646 = fma(_1638, -0.5, 0.5);
    float _1648 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1650 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1642);
    float _1652 = fma(_1638, 0.5, 0.5);
    float _1654 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1648);
    float _1656 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1650);
    float _1658 = log2(_1596);
    float _1660 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1662 = _1616 + 1.0;
    float _1664 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1654);
    float _1666 = fma(_1652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1668 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1660);
    float _1670 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1664);
    float _1672 = 1.0 / _1656;
    float _1674 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1668);
    float _1676 = -_1616;
    float _1678 = fma(_1644, _1662, _1676);
    float _1680 = fma(_1652, _1666, -0.212114393711090087890625);
    float _1682 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1674);
    float2 _4863 = float2(_1578, _1606);
    float _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4863, float2(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4863, float2(0.0), isnan(_4863)), level(0.0)).x;
    float _1686 = fma(_1652, _1680, 1.570728778839111328125);
    float _1688 = sqrt(_1646);
    float _1690 = _1658 * 0.693147182464599609375;
    float _1692 = _1670 * _1672;
    float _1694 = _1682 * _1672;
    float _1696 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1698 = fma(_1692, 0.5, 0.5);
    float _1700 = fma(_1694, -0.5, 0.5);
    float _1702 = _1688 * 0.636619746685028076171875;
    float3 _4900 = float3(_1698, _1700, _1696);
    float _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4900, float3(0.0), isnan(_4900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4900, float3(0.0), isnan(_4900)), level(0.0)).x;
    float3 _4911 = float3(_1698, _1700, _1696);
    float4 _1707 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4911, float3(0.0), isnan(_4911)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4911, float3(0.0), isnan(_4911)), level(0.0)).xyzw;
    float _1709 = _1707.x;
    float _1711 = _1707.y;
    float _1713 = _1707.z;
    float _1715 = _1707.w;
    float _1717 = -_1686;
    float _1719 = fma(_1702, _1717, 1.0);
    float _1721 = fma(_1678, 0.5, 0.5);
    float2 _4934 = float2(_1719, _1721);
    float3 _1725 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4934, float2(0.0), isnan(_4934)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4934, float2(0.0), isnan(_4934)), level(0.0)).xyz;
    float _1727 = _1725.x;
    float _1729 = _1725.y;
    float _1731 = _1725.z;
    float _1733 = -_656;
    float _1735 = _556 + _1733;
    float _1737 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1376;
    out.m_75.y = _1372;
    out.m_75.z = _1380;
    float _1739 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1741 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1743 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1737);
    float _1745 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1739);
    float _1747 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1741);
    float _1749 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1745);
    float _1751 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    float _1753 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1755 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1757 = 1.0 / _1753;
    float _1759 = _1755 + _1753;
    bool _1761 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan(0.5);
    bool _1769 = _1765 || _1767;
    float _1771 = _1759 * _1757;
    float _1773 = _1771 * 0.5;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1777 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1775);
    float _1779 = 1.0 / _1777;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1783 = _1678;
    float _1785 = _1737;
    float _1787 = _1656;
    float _1789 = _1682;
    if (!_1769)
    {
        _1781 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1791 = _1781;
    float _1793 = _1791;
    if (!_1769)
    {
        float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1797 = _1791 + _1795;
        _1793 = _1797;
    }
    float _1799 = _1793;
    if (!_1769)
    {
        float _1801 = 1.0 / _1799;
        _1783 = _1801;
    }
    float _1803 = _1783;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1807 = _1779 * _1805;
    float _1809 = abs(_1807);
    float _1811 = log2(_1809);
    float _1813 = _1670;
    if (!_1769)
    {
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1817 = _1807 + _1815;
        _1785 = _1817;
    }
    float _1819 = _1785;
    bool _1821 = _1807 <= 8000.0;
    bool _1823 = isnan(_1807);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(8000.0);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1835 = exp2(_1833);
    float _1837 = fma(_1835, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1839 = precise::clamp(_1837, 0.0, 1.0);
    float _1841 = fma(_1839, -2.0, 3.0);
    float _1843 = _1839 * _1839;
    float _1845 = _1843 * _1841;
    float _1847 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1743);
    float _1851 = -_1845;
    float _1853 = _1851 + 1.0;
    float _1855 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1849);
    float _1857 = exp2(_1847);
    float _1859 = in.m_77.x;
    float _1861 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1845);
    float _1863 = _1845;
    if (_1769)
    {
        _1863 = 1.0;
    }
    float _1865 = _1863;
    float _1867 = _1865;
    if (!_1769)
    {
        float _1869 = _1819 * _1803;
        float _1871 = precise::clamp(_1869, 0.0, 1.0);
        _1867 = _1871;
    }
    float _1873 = _1867;
    float _1875 = _1831 * _1861;
    float _1877 = _1855 + _1656;
    bool _1879 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1881 = isnan(_1392);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1887 = _1883 || _1885;
    out.gl_Position.x = _1670;
    out.gl_Position.y = _1682;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1656;
    float _1889 = _1875 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1891 = _1877 * 0.5;
    float _1893 = -_1857;
    float _1895 = _1893 + 1.0;
    out.m_79.z = _1891;
    out.m_79.w = _1656;
    float _1897 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1887)
    {
        _1424 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1899 = _1424;
    float _1901 = _1899;
    float _1903 = _1899;
    if (!_1887)
    {
        _1787 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1905 = _1787;
    float _1907 = _1905;
    float _1909 = _1905;
    if (!_1887)
    {
        _1813 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1911 = _1813;
    float _1913 = _1911;
    float _1915 = _1911;
    if (!_1887)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1917 = _1789;
    float _1919 = _1917;
    float _1921 = _1917;
    if (!_1887)
    {
        _1426 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1923 = _1426;
    float _1925 = -_1684;
    float _1927 = _1925 + 1.0;
    float _1929 = _1927 * _1889;
    float _1931 = precise::clamp(_1929, 0.0, 1.0);
    float _1933 = -_1931;
    float _1935 = fma(_1933, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1937 = _1935 * _1859;
    float _1939 = _1937 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1941 = _1897 * _1704;
    float _1943 = -_1897;
    float _1945 = _1943 + 1.0;
    out.m_81.x = _1939;
    float _1947 = _1715 * _1941;
    float _1949 = _1715 * _1945;
    float _1951 = _1731 * _1941;
    float _1953 = fma(_1727, _1947, _1709);
    float _1955 = fma(_1729, _1947, _1711);
    float _1957 = _1947;
    float _1959 = _1923;
    float _1961 = _1923;
    if (!_1887)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1963 = _1957;
    float _1965 = fma(_1715, _1951, _1713);
    float _1967 = _1873 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_83.x = _1953;
    out.m_83.y = _1955;
    out.m_83.z = _1965;
    out.m_83.w = _1949;
    bool _1969 = !_1887;
    float _1971 = _1963;
    float _1973 = _1963;
    if (!_1969)
    {
        bool _1975 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1977 = isnan(_1392);
        bool _1979 = _1975 || _1977;
        bool _1981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1983 = _1979 || _1981;
        if (!_1983)
        {
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1987 = _1392 + _1985;
            float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1991 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1989;
            float _1993 = 1.0 / _1991;
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2015 = _1987 * _1993;
            float _2017 = precise::clamp(_2015, 0.0, 1.0);
            float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2023 = fma(_2017, _1997, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2025 = fma(_2017, _2021, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2027 = fma(_2017, _2001, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2029 = fma(_2017, _2005, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2031 = fma(_2017, _2009, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2033 = fma(_2017, _2013, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1915 = _2025;
            _1961 = _2031;
            _1909 = _2023;
            _1903 = _2029;
            _1921 = _2027;
            _1973 = _2033;
            _2035 = true;
        }
        else
        {
            bool _2037 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2039 = isnan(_1392);
            bool _2041 = _2037 || _2039;
            bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2045 = _2041 || _2043;
            if (!_2045)
            {
                _1907 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2047 = _1907;
            _1909 = _2047;
            if (!_2045)
            {
                _1913 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2049 = _1913;
            _1915 = _2049;
            if (!_2045)
            {
                _1919 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2051 = _1919;
            _1921 = _2051;
            if (!_2045)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2053 = _1901;
            _1903 = _2053;
            if (!_2045)
            {
                _1959 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2055 = _1959;
            _1961 = _2055;
            if (!_2045)
            {
                _1971 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2057 = _1971;
            bool _2059 = !_2045;
            _1973 = _2057;
            if (!_2059)
            {
                bool _2061 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2063 = isnan(_1392);
                bool _2065 = _2061 || _2063;
                bool _2067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2069 = _2065 || _2067;
                if (!_2069)
                {
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2073 = _1392 + _2071;
                    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2075;
                    float _2079 = 1.0 / _2077;
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2101 = _2073 * _2079;
                    float _2103 = precise::clamp(_2101, 0.0, 1.0);
                    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2109 = fma(_2103, _2083, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2111 = fma(_2103, _2107, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2113 = fma(_2103, _2087, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2115 = fma(_2103, _2091, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2117 = fma(_2103, _2095, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2119 = fma(_2103, _2099, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1915 = _2111;
                    _1961 = _2117;
                    _1909 = _2109;
                    _1903 = _2115;
                    _1921 = _2113;
                    _1973 = _2119;
                    _2035 = true;
                }
                else
                {
                    _1915 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1961 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1909 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1921 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1973 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2035 = false;
    float _2121 = _1915;
    float _2123 = _1961;
    float _2125 = _1909;
    float _2127 = _1903;
    float _2129 = _1921;
    float _2131 = _1973;
    float _2133 = _1967 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2135 = fma(_1230, -0.5, 0.5);
    float _2137 = precise::clamp(_2135, 0.0, 1.0);
    float _2139 = -_2121;
    float _2141 = _2139 + _2123;
    float _2143 = -_2125;
    float _2145 = _2143 + _2127;
    out.m_51.x = _2133;
    float _2147 = fma(_2137, _2141, _2121);
    float _2149 = -_2129;
    float _2151 = _2149 + _2131;
    float _2153 = fma(_2137, _2145, _2125);
    float _2155 = _2147 * 0.586610972881317138671875;
    bool _2157 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2159 = fma(_2137, _2151, _2129);
    out.m_85.x = 0.0;
    float _2161 = fma(_2153, 0.298911988735198974609375, _2155);
    bool _2163 = _1873 > 0.0;
    bool _2165 = isnan(_1873);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan(0.0);
    bool _2171 = _2167 || _2169;
    float _2173 = fma(_2159, 0.114477999508380889892578125, _2161);
    float _2175 = -_2173;
    float _2177 = _2153 + _2175;
    float _2179 = -_2173;
    float _2181 = _2147 + _2179;
    float _2183 = -_2173;
    float _2185 = _2159 + _2183;
    float _2187 = fma(_2177, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2173);
    float _2189 = fma(_2181, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2173);
    float _2191 = fma(_2185, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2173);
    bool _2193 = !_2157;
    if (!_2193)
    {
        float _2195 = -_1360;
        float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2199 = -_1364;
        float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2203 = -_1368;
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2207 = _2197 * _2197;
        float _2209 = fma(_2201, _2201, _2207);
        float _2211 = fma(_2205, _2205, _2209);
        float _2213 = sqrt(_2211);
        float _2215 = rsqrt(_2211);
        float _2217 = -_2213;
        float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2221 = _2219 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = _2201 * _2215;
        float _2227 = _2197 * _2215;
        float _2229 = abs(_2223);
        float _2231 = log2(_2229);
        float _2233 = _2205 * _2215;
        float _2235 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2237 = _1230 * _2227;
        float _2239 = -_2227;
        float _2241 = -_2235;
        float _2243 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2241);
        float _2245 = fma(_1226, _2225, _2237);
        float _2247 = -_2233;
        float _2249 = fma(_2247, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2243);
        float _2251 = fma(_1252, _2233, _2245);
        float _2253 = precise::clamp(_2251, 0.0, 1.0);
        float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2257 = _2249 + _2255;
        float _2259 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2261 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2263 = precise::clamp(_2261, 0.0, 1.0);
        float _2265 = exp2(_2259);
        float _2267 = _2265 * _2263;
        float _2269 = _2253 * _2267;
        float _2271 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2273 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2275 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2271;
        out.m_85.y = _2273;
        out.m_85.z = _2275;
    }
    out.m_87.x = _2187;
    out.m_87.y = _2189;
    out.m_87.z = _2191;
    if (_2171)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2277 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2277;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2035 = false;
    bool _1304 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2334 = as_type<float>(_122);
        out.gl_Position.z = _2334;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_53.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    float _144 = _140;
    if (_136)
    {
        float _146 = float(_106);
        _142 = _146;
    }
    float _148 = _142;
    bool _150 = _140 >= _148;
    bool _152 = !_136;
    bool _154 = _150 || _152;
    if (_154)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _116;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _124 = as_type<int>(_158);
    }
    int _160 = _124;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2403 = as_type<float>(_160);
        out.gl_Position.z = _2403;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_55.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = in.m_55.x;
    float _196 = in.m_55.y;
    float _198 = in.m_55.z;
    float _200 = in.m_55.w;
    float _202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _204 = in.m_48.x;
    float _206 = in.m_48.y;
    float _208 = in.m_48.z;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _216 = _202 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _218 = _198 * 2.0;
    float _220 = _194 * 2.0;
    float _222 = _196 * 2.0;
    float _224 = fma(_194, (*spvDescriptorSet0.vp_c9)._m0[78].z, _210);
    float _226 = _206 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _228 = _206 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _230 = floor(_218);
    float _232 = _196 + _198;
    float _234 = _194 + _198;
    float _236 = _194 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _238 = _196 + _194;
    float _240 = _194 + (-0.5);
    float _242 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[78].w, _212);
    float _244 = _196 + (-0.5);
    float _246 = floor(_220);
    float _248 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[5].x, _226);
    float _250 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[6].x, _228);
    float _252 = _238 + (-1.0);
    float _254 = _232 + (-1.0);
    float _256 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[5].z, _248);
    float _258 = _234 + (-1.0);
    float _260 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _262 = floor(_222);
    bool _264 = _230 > 0.0;
    float _266 = _214 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _268 = _230 >= 0.0;
    bool _270 = isnan(_230);
    bool _272 = _268 || _270;
    bool _274 = isnan(0.0);
    bool _276 = _272 || _274;
    int _278 = _276 ? 0 : 1;
    bool _280 = _246 > 0.0;
    bool _282 = _246 >= 0.0;
    bool _284 = isnan(_246);
    bool _286 = _282 || _284;
    bool _288 = isnan(0.0);
    bool _290 = _286 || _288;
    int _292 = ~_278;
    int _294 = _292 + 1;
    int _296 = _294 + 1;
    int _298 = _290 ? 0 : 1;
    bool _300 = _262 > 0.0;
    bool _302 = _262 >= 0.0;
    bool _304 = isnan(_262);
    bool _306 = _302 || _304;
    bool _308 = isnan(0.0);
    bool _310 = _306 || _308;
    int _312 = ~_298;
    int _314 = _312 + 1;
    int _316 = _314 + 1;
    int _318 = _310 ? 0 : 1;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _322 = _320 != 0;
    int _324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _326 = _324 != 0;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _330 = _328 != 0;
    int _332 = ~_318;
    int _334 = _332 + 1;
    int _336 = _334 + 1;
    int _338 = _296;
    int _340 = _316;
    int _342 = _336;
    if (!_264)
    {
        int _344 = ~_278;
        int _346 = _344 + 1;
        _338 = _346;
    }
    int _348 = _338;
    if (!_280)
    {
        int _350 = ~_298;
        int _352 = _350 + 1;
        _340 = _352;
    }
    int _354 = _340;
    if (!_300)
    {
        int _356 = ~_318;
        int _358 = _356 + 1;
        _342 = _358;
    }
    int _360 = _342;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _364 = _362 != 0;
    int _366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _368 = _366 != 0;
    int _370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _372 = _370 != 0;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _376 = _374 != 0;
    float _378 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _380 = log2(_378);
    bool _382 = !_322;
    int _384 = _382 ? 0 : 1;
    bool _386 = _200 > 0.5;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _390 = !_326;
    int _392 = _390 ? 0 : 1;
    float _394 = _198 + (-0.5);
    bool _396 = _196 > 0.5;
    float _398 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[79].z, _388);
    float _400 = _206 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _402 = _196 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _404 = abs(_384);
    float _406 = in.m_57.x;
    float _408 = in.m_57.y;
    float _410 = in.m_57.z;
    float _412 = fma(_204, (*spvDescriptorSet0.vp_c10)._m0[4].x, _400);
    float _414 = _380 * _140;
    bool _416 = !_330;
    int _418 = _416 ? 0 : 1;
    float _420 = in.m_59.x;
    float _422 = in.m_59.y;
    float _424 = in.m_59.z;
    int _426 = abs(_392);
    float _428 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[79].x, _398);
    int _430 = abs(_418);
    float _432 = exp2(_414);
    float _434 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[4].z, _412);
    float _436 = float(_348);
    float _438 = 0.0;
    bool _440 = _386;
    if (_364)
    {
        float _442 = in.m_55.x;
        _438 = _442;
    }
    float _444 = _438;
    float _446 = float(_404);
    float _448 = _428 * (-0.15915493667125701904296875);
    float _450 = float(_426);
    float _452 = fma(_208, (*spvDescriptorSet0.vp_c10)._m0[6].z, _250);
    float _454 = float(_354);
    float _456 = _446 * _436;
    float _458 = float(_430);
    float _460 = float(_360);
    float _462 = _450 * _454;
    float _464 = _456 * (-2.0);
    float _466 = -_432;
    float _468 = _466 + 1.0;
    bool _470 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _472 = isnan(0.0);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _478 = _474 || _476;
    float _480 = _462 * (-2.0);
    float _482 = _458 * _460;
    float _484 = fma(_464, _406, _406);
    float _486 = fma(_480, _408, _408);
    float _488 = _478 ? _468 : 0.0;
    float _490 = _482 * (-2.0);
    bool _492 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _494 = isnan(1.0);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _500 = _496 || _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _504 = 1.0 + _502;
    float _506 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _508 = fma(_490, _410, _410);
    float _510 = 1.0 / _504;
    float _512 = _422 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _522 = _420 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _524 = 1.0 / _516;
    float _526 = fma(_402, -2.0, _518);
    float _528 = -_520;
    float _530 = fma(_236, 2.0, _528);
    float _532 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].z, _224);
    float _534 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[77].w, _242);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _540 = -_140;
    float _542 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[76].x, _530);
    float _544 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[76].y, _526);
    bool _546 = _500;
    if (_500)
    {
        float _548 = _488 * _510;
        _144 = _548;
    }
    float _550 = _144;
    float _552 = fma(_260, _464, _260);
    float _554 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[196].x, _484);
    float _556 = _256 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _558 = _434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _560 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _562 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _564 = _556 + _562;
    float _566 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _568 = _558 + _566;
    float _570 = 1.0 / _538;
    float _572 = _564 * _564;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _578 = fma(_552, _550, _554);
    float _580 = fma(_568, _568, _572);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _582;
    float _586 = 1.0 / _576;
    float _588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _590 = _560 + _588;
    float _592 = _584 * _524;
    float _594 = _522 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _596 = fma(_590, _590, _580);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _602 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _604 = _594 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _610 = rsqrt(_596);
    float _612 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[196].z, _508);
    float _614 = _608 * _570;
    float _616 = _578 * 0.15915493667125701904296875;
    float _618 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[196].y, _486);
    float _620 = _586;
    if (_364)
    {
        bool _622 = _444 > 0.5;
        _546 = _622;
    }
    bool _624 = _546;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _626;
    float _630 = 1.0 / _600;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _636 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _638 = _628 * _586;
    float _640 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    if (_368)
    {
        float _642 = in.m_55.z;
        _620 = _642;
    }
    float _644 = _620;
    float _646 = _604 * _610;
    float _648 = fma(_602, _480, _602);
    float _650 = fma(_258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _652 = _616 * 6.283185482025146484375;
    float _654 = sin(_652);
    float _656 = _564 * _646;
    float _658 = in.m_61.y;
    float _660 = fma(_650, _490, _650);
    float _662 = _568 * _646;
    float _664 = -_656;
    float _666 = _564 + _664;
    float _668 = _634 * _630;
    float _670 = fma(_660, _550, _612);
    float _672 = -_662;
    float _674 = _568 + _672;
    float _676 = _666 * _666;
    float _678 = _590 * _646;
    float _680 = in.m_61.x;
    float _682 = _670 * 0.15915493667125701904296875;
    float _684 = fma(_674, _674, _676);
    float _686 = -_678;
    float _688 = _590 + _686;
    float _690 = fma(_648, _550, _618);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _694 = _192 + _692;
    float _696 = _616 * 6.283185482025146484375;
    float _698 = cos(_696);
    float _700 = fma(_688, _688, _684);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _704 = _192 + _702;
    float _706 = _690 * 0.15915493667125701904296875;
    float _708 = fma(_614, _694, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _712 = _192 + _710;
    float _714 = fma(_638, _704, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _716 = in.m_63.x;
    float _718 = in.m_63.y;
    float _720 = in.m_63.z;
    float _722 = _706 * 6.283185482025146484375;
    float _724 = sin(_722);
    float _726 = -_658;
    float _728 = _726 + 1.0;
    float _730 = fma(_592, _712, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _734 = _192 + _732;
    int _736 = _386 ? as_type<int>(_728) : as_type<int>(_658);
    float _738 = fma(_668, _734, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _740 = _706 * 6.283185482025146484375;
    float _742 = cos(_740);
    float _744 = _658;
    float _746 = _706;
    float _748 = _644;
    int _750 = as_type<int>(_708);
    if (_368)
    {
        bool _752 = _644 > 0.5;
        _440 = _752;
    }
    bool _754 = _440;
    float _756 = _372 ? as_type<float>(_736) : _658;
    if (_376)
    {
        float _758 = _396 ? _728 : _658;
        _744 = _758;
    }
    float _760 = _744;
    float _762 = sqrt(_700);
    if (!_364)
    {
        _746 = _680;
    }
    float _764 = _746;
    float _766 = fma(_216, _760, -0.5);
    float _768 = _764;
    if (!_364)
    {
        _748 = _764;
    }
    float _770 = _748;
    float _772 = _770;
    if (_364)
    {
        _768 = _680;
    }
    float _774 = _768;
    float _776 = _682 * 6.283185482025146484375;
    float _778 = cos(_776);
    float _780 = _654 * _724;
    float _782 = _698 * _742;
    float _784 = _654 * _742;
    float _786 = _698 * _724;
    float _788 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _720);
    bool _790 = _718 != 0.0;
    bool _792 = isnan(_718);
    bool _794 = _790 || _792;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    int _800 = 0;
    float _802 = _774;
    if (_364)
    {
        float _804 = -_774;
        float _806 = _804 + 1.0;
        _800 = as_type<int>(_806);
    }
    int _808 = _800;
    float _810 = _682 * 6.283185482025146484375;
    float _812 = sin(_810);
    float _814 = _610 * _762;
    bool _816 = _716 == 0.0;
    bool _818 = !_798;
    bool _820 = _816 && _818;
    if (_364)
    {
        float _822 = _624 ? as_type<float>(_808) : _774;
        _772 = _822;
    }
    float _824 = _772;
    float _826 = _636 * _814;
    float _828 = _640 * _814;
    bool _830 = _720 == 0.0;
    bool _832 = _830 && _820;
    float _834 = _654 * _778;
    float _836 = _742 * _778;
    float _838 = _698 * _778;
    float _840 = _724 * _778;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _716);
    float _844 = fma(_266, _824, -0.5);
    float _846 = fma(_812, _782, _780);
    float _848 = fma(_812, _780, _782);
    float _850 = _594 * _814;
    float _852 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _718);
    float _854 = -_786;
    float _856 = fma(_812, _784, _854);
    float _858 = -_784;
    float _860 = fma(_812, _786, _858);
    float _862 = _850 * _842;
    float _864 = _826 * _852;
    float _866 = _828 * _788;
    bool _868 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _870 = isnan(_192);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = -_864;
    float _882 = _812 * _880;
    float _884 = _838 * _864;
    float _886 = _834 * _864;
    bool _888 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _890 = isnan(_192);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = fma(_836, _862, _882);
    bool _902 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _904 = isnan(_192);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_846, _862, _884);
    float _916 = fma(_856, _862, _886);
    bool _918 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _920 = isnan(_192);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -_878;
    float _932 = _930 + 1.0;
    float _934 = -_898;
    float _936 = _934 + 1.0;
    float _938 = -_912;
    float _940 = _938 + 1.0;
    float _942 = fma(_860, _866, _914);
    float _944 = _898 * _932;
    float _946 = _912 * _936;
    bool _948 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _950 = isnan(_192);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _956 = _952 || _954;
    float _958 = float(_956);
    float _960 = _928 * _940;
    float _962 = fma(_840, _866, _900);
    float _964 = in.m_65.x;
    float _966 = in.m_65.y;
    float _968 = in.m_65.z;
    float _970 = -_928;
    float _972 = _970 + 1.0;
    float _974 = _942 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _976 = _942 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _978 = fma(_848, _866, _916);
    float _980 = _958 * _972;
    float _982 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[8].x, _974);
    float _984 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[10].x, _976);
    float _986 = _448 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = -_958;
    float _992 = _990 + 1.0;
    float _994 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[8].z, _982);
    float _996 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[10].z, _984);
    float _998 = _558 + _994;
    float _1000 = _560 + _996;
    float _1002 = _730 * _980;
    float _1004 = _448 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1010 = _998 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1014 = _1000 + _1012;
    float _1016 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1002);
    float _1018 = _1010 * _1010;
    float _1020 = _1014 * _1014;
    float _1022 = _964;
    float _1024 = _966;
    float _1026 = _968;
    float _1028 = _1018;
    float _1030 = _1020;
    float _1032 = _998;
    float _1034 = _1000;
    if (!_832)
    {
        float _1036 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[17].y, _964);
        _1022 = _1036;
    }
    float _1038 = _1022;
    float _1040 = _1038;
    if (!_832)
    {
        float _1042 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[17].y, _966);
        _1024 = _1042;
    }
    float _1044 = _1024;
    if (!_832)
    {
        float _1046 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[17].y, _968);
        _1026 = _1046;
    }
    float _1048 = _1026;
    float _1050 = _1018 + _1020;
    float _1052 = fma(_708, _960, _1016);
    float _1054 = _988 * _766;
    if (_368)
    {
        float _1056 = -_774;
        float _1058 = _1056 + 1.0;
        _750 = as_type<int>(_1058);
    }
    int _1060 = _750;
    float _1062 = sqrt(_1050);
    float _1064 = fma(_714, _946, _1052);
    float _1066 = -_1054;
    float _1068 = fma(_1006, _844, _1066);
    float _1070 = _1006 * _766;
    float _1072 = -_1044;
    float _1074 = _812 * _1072;
    float _1076 = fma(_738, _944, _1064);
    float _1078 = fma(_532, _1068, _542);
    float _1080 = _942 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1082 = _838 * _1044;
    float _1084 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1076);
    float _1086 = _834 * _1044;
    float _1088 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1080);
    float _1090 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1092 = fma(_988, _844, _1070);
    float _1094 = fma(_836, _1038, _1074);
    float _1096 = fma(_978, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1088);
    bool _1098 = _1062 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1100 = fma(_846, _1038, _1082);
    float _1102 = fma(_856, _1038, _1086);
    float _1104 = _556 + _1096;
    if (_368)
    {
        float _1106 = _754 ? as_type<float>(_1060) : _774;
        _802 = _1106;
    }
    float _1108 = _802;
    float _1110 = -_544;
    float _1112 = fma(_534, _1092, _1110);
    if (!_1098)
    {
        _1040 = _1104;
    }
    float _1114 = _1040;
    bool _1116 = !_1098;
    float _1118 = _1114;
    if (!_1116)
    {
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1124 = _1062 + _1122;
        float _1126 = rsqrt(_1050);
        float _1128 = _1124 * _1120;
        float _1130 = _1104 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1132 = _1128 * 0.15915493667125701904296875;
        float _1134 = _1132 * 6.283185482025146484375;
        float _1136 = sin(_1134);
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = cos(_1138);
        float _1142 = fma(_1136, _1130, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1144 = _1126 * _1142;
        float _1146 = _1140 + (-1.0);
        float _1148 = fma(_1010, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1150 = fma(_1014, _1144, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1152 = _1146 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1156 = _1148 + _1154;
        float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1160 = _1150 + _1158;
        float _1162 = fma(_1104, _1140, _1152);
        float _1164 = _1156 * _1156;
        float _1166 = _1160 * _1160;
        _1118 = _1162;
        _1028 = _1164;
        _1030 = _1166;
        _1032 = _1148;
        _1034 = _1150;
    }
    float _1168 = _1118;
    float _1170 = _1028;
    float _1172 = _1030;
    float _1174 = _1032;
    float _1176 = _1034;
    float _1178 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1180 = _1168 + _1178;
    float _1182 = fma(_860, _1048, _1100);
    float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1186 = fma(_840, _1048, _1094);
    float _1188 = fma(_1180, _1180, _1170);
    float _1190 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1192 = fma(_848, _1048, _1102);
    float _1194 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1196 = _1188 + _1172;
    float _1198 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1190);
    float _1200 = _1182 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1202 = _756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1204 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1194);
    float _1206 = sqrt(_1196);
    float _1208 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1210 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1200);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1222 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1224 = _1202 * _1090;
    float _1226 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1204);
    float _1228 = _1208 * _1184;
    float _1230 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1210);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1234 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1236 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1238 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1240 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1242 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1244 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1246 = _1078 + 0.5;
    float _1248 = _1112 + 0.5;
    float _1250 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1252 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1198);
    out.m_67.x = _1240;
    out.m_67.y = _1242;
    out.m_67.z = _1244;
    out.m_67.w = _1232;
    bool _1254 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1256 = isnan(_1206);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1262 = _1258 || _1260;
    out.m_69.x = _1246;
    out.m_69.y = _1248;
    out.m_69.z = _1228;
    out.m_69.w = _1224;
    out.m_71.x = _1234;
    out.m_71.y = _1236;
    out.m_71.z = _1238;
    out.m_71.w = _1250;
    out.m_73.x = _1226;
    out.m_73.y = _1230;
    out.m_73.z = _1252;
    float _1264 = _1210;
    float _1266 = _1234;
    float _1268 = _1248;
    if (!_1262)
    {
        _1264 = 1.0;
    }
    float _1270 = _1264;
    bool _1272 = !_1262;
    float _1274 = _1270;
    if (!_1272)
    {
        bool _1276 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1278 = isnan(_1206);
        bool _1280 = _1276 || _1278;
        bool _1282 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1284 = _1280 || _1282;
        if (!_1284)
        {
            float _1286 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1288 = _1206 + _1286;
            float _1290 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1292 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1290;
            float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1296 = _1294 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1298 = 1.0 / _1292;
            float _1300 = _1288 * _1298;
            float _1302 = fma(_1300, _1296, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1274 = _1302;
            _1304 = true;
        }
        else
        {
            bool _1306 = _1206 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1308 = isnan(_1206);
            bool _1310 = _1306 || _1308;
            bool _1312 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1314 = _1310 || _1312;
            if (!_1314)
            {
                float _1316 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1318 = _1206 + _1316;
                float _1320 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1322 = _1320 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1326 = _1324 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1328 = 1.0 / _1322;
                float _1330 = _1318 * _1328;
                float _1332 = fma(_1330, _1326, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1274 = _1332;
                _1304 = true;
            }
            else
            {
                _1274 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1304 = false;
    float _1334 = _1274;
    float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1338 = _1168 + _1336;
    float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1342 = _1174 + _1340;
    float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1346 = _1176 + _1344;
    float _1348 = -_662;
    float _1350 = _558 + _1348;
    float _1352 = fma(_1338, _1334, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1354 = fma(_1342, _1334, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1356 = fma(_1346, _1334, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1358 = -_656;
    float _1360 = _1358 + _1352;
    float _1362 = -_662;
    float _1364 = _1362 + _1354;
    float _1366 = -_678;
    float _1368 = _1366 + _1356;
    float _1370 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1372 = _1360 + _1370;
    float _1374 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1376 = _1364 + _1374;
    float _1378 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1380 = _1368 + _1378;
    float _1382 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1384 = _1372 * _1372;
    float _1386 = fma(_1376, _1376, _1384);
    float _1388 = fma(_1380, _1380, _1386);
    float _1390 = rsqrt(_1388);
    float _1392 = sqrt(_1388);
    float _1394 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1396 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1398 = _1376 * _1394;
    float _1400 = _1380 * _1394;
    float _1402 = _1398 * _1398;
    float _1404 = _1400 * _1400;
    float _1406 = _1402 + _1404;
    float _1408 = sqrt(_1406);
    bool _1410 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1414 = _1408 + _1412;
    float _1416 = _1386;
    float _1418 = _1406;
    float _1420 = _1414;
    float _1422 = _1394;
    float _1424 = _1380;
    float _1426 = _1372;
    if (_1410)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1428;
    }
    float _1430 = _1416;
    if (_1410)
    {
        float _1432 = rsqrt(_1406);
        _1418 = _1432;
    }
    float _1434 = _1418;
    float _1436 = _1434;
    if (_1410)
    {
        float _1438 = _1414 * _1430;
        _1420 = _1438;
    }
    float _1440 = _1420;
    if (_1410)
    {
        float _1442 = _1440 * 0.15915493667125701904296875;
        _1266 = _1442;
    }
    float _1444 = _1266;
    float _1446 = _1244;
    if (_1410)
    {
        float _1448 = _1444 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        _1446 = _1450;
    }
    float _1452 = _1446;
    float _1454 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1456 = precise::max(0.0, _1454);
    float _1458 = _1430;
    float _1460 = _1456;
    if (_1410)
    {
        float _1462 = _1444 * 6.283185482025146484375;
        float _1464 = sin(_1462);
        _1458 = _1464;
    }
    float _1466 = _1458;
    float _1468 = -_1394;
    float _1470 = -_1456;
    float _1472 = fma(_1372, _1468, _1470);
    if (_1410)
    {
        float _1474 = _1472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1460 = _1474;
    }
    float _1476 = _1460;
    float _1478 = _1476;
    float _1480 = _1452;
    if (_1410)
    {
        float _1482 = _1452 + (-1.0);
        _1422 = _1482;
    }
    float _1484 = _1422;
    float _1486 = -_678;
    float _1488 = _560 + _1486;
    float _1490 = _1484;
    if (_1410)
    {
        float _1492 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1490 = _1492;
    }
    float _1494 = _1490;
    float _1496 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1498 = _1466;
    float _1500 = _1494;
    if (_1410)
    {
        float _1502 = fma(_1466, _1476, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1268 = _1502;
    }
    float _1504 = _1268;
    float _1506 = _1504;
    if (!_1410)
    {
        _1498 = _1472;
    }
    float _1508 = _1498;
    float _1510 = _1508;
    if (_1410)
    {
        float _1512 = fma(_1472, _1452, _1494);
        _1510 = _1512;
    }
    float _1514 = _1510;
    if (!_1410)
    {
        _1500 = _1398;
    }
    float _1516 = _1500;
    float _1518 = _1516;
    if (_1410)
    {
        float _1520 = _1434 * _1504;
        _1478 = _1520;
    }
    float _1522 = _1478;
    if (!_1410)
    {
        _1480 = _1400;
    }
    float _1524 = _1480;
    float _1526 = _1524;
    if (!_1410)
    {
        _1436 = _1402;
    }
    float _1528 = _1436;
    float _1530 = _1528;
    if (_1410)
    {
        float _1532 = _1398 * _1522;
        _1518 = _1532;
    }
    float _1534 = _1518;
    if (_1410)
    {
        float _1536 = _1400 * _1522;
        _1526 = _1536;
    }
    float _1538 = _1526;
    if (!_1410)
    {
        _1506 = _1404;
    }
    float _1540 = _1506;
    float _1542 = floor(_1382);
    float _1544 = _1540;
    if (_1410)
    {
        float _1546 = _1534 * _1534;
        _1530 = _1546;
    }
    float _1548 = _1530;
    if (_1410)
    {
        float _1550 = _1538 * _1538;
        _1544 = _1550;
    }
    float _1552 = _1544;
    float _1554 = fma(_1514, _1514, _1548);
    float _1556 = floor(_1496);
    float _1558 = _1554 + _1552;
    float _1560 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1396);
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1564 = fma(_1392, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1562);
    float _1566 = precise::clamp(_1564, 0.0, 1.0);
    float _1568 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1570 = -_1566;
    float _1572 = _1570 + 1.0;
    float _1574 = rsqrt(_1558);
    float _1576 = -_1542;
    float _1578 = _1382 + _1576;
    float _1580 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1584 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1586 = _1580 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1588 = abs(_1572);
    float _1590 = log2(_1588);
    float _1592 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = -_1586;
    float _1596 = fma(_1594, _1582, 1.0);
    float _1598 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1600 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1584);
    float _1602 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1592);
    float _1604 = -_1556;
    float _1606 = _1496 + _1604;
    float _1608 = _1574 * _1534;
    float _1610 = _1574 * _1538;
    float _1612 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1598);
    float _1614 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1602);
    float _1616 = _1574 * _1514;
    float _1618 = _1608 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1620 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1612);
    float _1622 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1624 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1600);
    float _1626 = -_1618;
    float _1628 = fma(_1616, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1626);
    float _1630 = _1620 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1632 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1634 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1636 = -_1610;
    float _1638 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1628);
    float _1640 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1642 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1632);
    float _1644 = exp2(_1634);
    float _1646 = fma(_1638, -0.5, 0.5);
    float _1648 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1650 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1642);
    float _1652 = fma(_1638, 0.5, 0.5);
    float _1654 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1648);
    float _1656 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1650);
    float _1658 = log2(_1596);
    float _1660 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1662 = _1616 + 1.0;
    float _1664 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1654);
    float _1666 = fma(_1652, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1668 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1660);
    float _1670 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1664);
    float _1672 = 1.0 / _1656;
    float _1674 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1668);
    float _1676 = -_1616;
    float _1678 = fma(_1644, _1662, _1676);
    float _1680 = fma(_1652, _1666, -0.212114393711090087890625);
    float _1682 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1674);
    float2 _4863 = float2(_1578, _1606);
    float _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4863, float2(0.0), isnan(_4863)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4863, float2(0.0), isnan(_4863)), level(0.0)).x;
    float _1686 = fma(_1652, _1680, 1.570728778839111328125);
    float _1688 = sqrt(_1646);
    float _1690 = _1658 * 0.693147182464599609375;
    float _1692 = _1670 * _1672;
    float _1694 = _1682 * _1672;
    float _1696 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1698 = fma(_1692, 0.5, 0.5);
    float _1700 = fma(_1694, -0.5, 0.5);
    float _1702 = _1688 * 0.636619746685028076171875;
    float3 _4900 = float3(_1698, _1700, _1696);
    float _1704 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4900, float3(0.0), isnan(_4900)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4900, float3(0.0), isnan(_4900)), level(0.0)).x;
    float3 _4911 = float3(_1698, _1700, _1696);
    float4 _1707 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4911, float3(0.0), isnan(_4911)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4911, float3(0.0), isnan(_4911)), level(0.0)).xyzw;
    float _1709 = _1707.x;
    float _1711 = _1707.y;
    float _1713 = _1707.z;
    float _1715 = _1707.w;
    float _1717 = -_1686;
    float _1719 = fma(_1702, _1717, 1.0);
    float _1721 = fma(_1678, 0.5, 0.5);
    float2 _4934 = float2(_1719, _1721);
    float3 _1725 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4934, float2(0.0), isnan(_4934)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4934, float2(0.0), isnan(_4934)), level(0.0)).xyz;
    float _1727 = _1725.x;
    float _1729 = _1725.y;
    float _1731 = _1725.z;
    float _1733 = -_656;
    float _1735 = _556 + _1733;
    float _1737 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1376;
    out.m_75.y = _1372;
    out.m_75.z = _1380;
    float _1739 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1741 = _1735 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1743 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1737);
    float _1745 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1739);
    float _1747 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1741);
    float _1749 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1745);
    float _1751 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1747);
    float _1753 = _1749 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1755 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1757 = 1.0 / _1753;
    float _1759 = _1755 + _1753;
    bool _1761 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan(0.5);
    bool _1769 = _1765 || _1767;
    float _1771 = _1759 * _1757;
    float _1773 = _1771 * 0.5;
    float _1775 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1777 = fma(_1773, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1775);
    float _1779 = 1.0 / _1777;
    float _1781 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1783 = _1678;
    float _1785 = _1737;
    float _1787 = _1656;
    float _1789 = _1682;
    if (!_1769)
    {
        _1781 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1791 = _1781;
    float _1793 = _1791;
    if (!_1769)
    {
        float _1795 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1797 = _1791 + _1795;
        _1793 = _1797;
    }
    float _1799 = _1793;
    if (!_1769)
    {
        float _1801 = 1.0 / _1799;
        _1783 = _1801;
    }
    float _1803 = _1783;
    float _1805 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1807 = _1779 * _1805;
    float _1809 = abs(_1807);
    float _1811 = log2(_1809);
    float _1813 = _1670;
    if (!_1769)
    {
        float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1817 = _1807 + _1815;
        _1785 = _1817;
    }
    float _1819 = _1785;
    bool _1821 = _1807 <= 8000.0;
    bool _1823 = isnan(_1807);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(8000.0);
    bool _1829 = _1825 || _1827;
    float _1831 = float(_1829);
    float _1833 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1835 = exp2(_1833);
    float _1837 = fma(_1835, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1839 = precise::clamp(_1837, 0.0, 1.0);
    float _1841 = fma(_1839, -2.0, 3.0);
    float _1843 = _1839 * _1839;
    float _1845 = _1843 * _1841;
    float _1847 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1849 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1743);
    float _1851 = -_1845;
    float _1853 = _1851 + 1.0;
    float _1855 = fma(_1640, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1849);
    float _1857 = exp2(_1847);
    float _1859 = in.m_77.x;
    float _1861 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1845);
    float _1863 = _1845;
    if (_1769)
    {
        _1863 = 1.0;
    }
    float _1865 = _1863;
    float _1867 = _1865;
    if (!_1769)
    {
        float _1869 = _1819 * _1803;
        float _1871 = precise::clamp(_1869, 0.0, 1.0);
        _1867 = _1871;
    }
    float _1873 = _1867;
    float _1875 = _1831 * _1861;
    float _1877 = _1855 + _1656;
    bool _1879 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1881 = isnan(_1392);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1887 = _1883 || _1885;
    out.gl_Position.x = _1670;
    out.gl_Position.y = _1682;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1656;
    float _1889 = _1875 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1891 = _1877 * 0.5;
    float _1893 = -_1857;
    float _1895 = _1893 + 1.0;
    out.m_79.z = _1891;
    out.m_79.w = _1656;
    float _1897 = _1895 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1887)
    {
        _1424 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1899 = _1424;
    float _1901 = _1899;
    float _1903 = _1899;
    if (!_1887)
    {
        _1787 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1905 = _1787;
    float _1907 = _1905;
    float _1909 = _1905;
    if (!_1887)
    {
        _1813 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1911 = _1813;
    float _1913 = _1911;
    float _1915 = _1911;
    if (!_1887)
    {
        _1789 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1917 = _1789;
    float _1919 = _1917;
    float _1921 = _1917;
    if (!_1887)
    {
        _1426 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1923 = _1426;
    float _1925 = -_1684;
    float _1927 = _1925 + 1.0;
    float _1929 = _1927 * _1889;
    float _1931 = precise::clamp(_1929, 0.0, 1.0);
    float _1933 = -_1931;
    float _1935 = fma(_1933, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1937 = _1935 * _1859;
    float _1939 = _1937 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1941 = _1897 * _1704;
    float _1943 = -_1897;
    float _1945 = _1943 + 1.0;
    out.m_81.x = _1939;
    float _1947 = _1715 * _1941;
    float _1949 = _1715 * _1945;
    float _1951 = _1731 * _1941;
    float _1953 = fma(_1727, _1947, _1709);
    float _1955 = fma(_1729, _1947, _1711);
    float _1957 = _1947;
    float _1959 = _1923;
    float _1961 = _1923;
    if (!_1887)
    {
        _1957 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1963 = _1957;
    float _1965 = fma(_1715, _1951, _1713);
    float _1967 = _1873 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_83.x = _1953;
    out.m_83.y = _1955;
    out.m_83.z = _1965;
    out.m_83.w = _1949;
    bool _1969 = !_1887;
    float _1971 = _1963;
    float _1973 = _1963;
    if (!_1969)
    {
        bool _1975 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1977 = isnan(_1392);
        bool _1979 = _1975 || _1977;
        bool _1981 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1983 = _1979 || _1981;
        if (!_1983)
        {
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1987 = _1392 + _1985;
            float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1991 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1989;
            float _1993 = 1.0 / _1991;
            float _1995 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1997 = _1995 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1999 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2001 = _1999 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2007 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2009 = _2007 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2015 = _1987 * _1993;
            float _2017 = precise::clamp(_2015, 0.0, 1.0);
            float _2019 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2021 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2023 = fma(_2017, _1997, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2025 = fma(_2017, _2021, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2027 = fma(_2017, _2001, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2029 = fma(_2017, _2005, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2031 = fma(_2017, _2009, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2033 = fma(_2017, _2013, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1915 = _2025;
            _1961 = _2031;
            _1909 = _2023;
            _1903 = _2029;
            _1921 = _2027;
            _1973 = _2033;
            _2035 = true;
        }
        else
        {
            bool _2037 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2039 = isnan(_1392);
            bool _2041 = _2037 || _2039;
            bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2045 = _2041 || _2043;
            if (!_2045)
            {
                _1907 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2047 = _1907;
            _1909 = _2047;
            if (!_2045)
            {
                _1913 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2049 = _1913;
            _1915 = _2049;
            if (!_2045)
            {
                _1919 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2051 = _1919;
            _1921 = _2051;
            if (!_2045)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2053 = _1901;
            _1903 = _2053;
            if (!_2045)
            {
                _1959 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2055 = _1959;
            _1961 = _2055;
            if (!_2045)
            {
                _1971 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2057 = _1971;
            bool _2059 = !_2045;
            _1973 = _2057;
            if (!_2059)
            {
                bool _2061 = _1392 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2063 = isnan(_1392);
                bool _2065 = _2061 || _2063;
                bool _2067 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2069 = _2065 || _2067;
                if (!_2069)
                {
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2073 = _1392 + _2071;
                    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2077 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2075;
                    float _2079 = 1.0 / _2077;
                    float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2101 = _2073 * _2079;
                    float _2103 = precise::clamp(_2101, 0.0, 1.0);
                    float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2109 = fma(_2103, _2083, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2111 = fma(_2103, _2107, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2113 = fma(_2103, _2087, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2115 = fma(_2103, _2091, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2117 = fma(_2103, _2095, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2119 = fma(_2103, _2099, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1915 = _2111;
                    _1961 = _2117;
                    _1909 = _2109;
                    _1903 = _2115;
                    _1921 = _2113;
                    _1973 = _2119;
                    _2035 = true;
                }
                else
                {
                    _1915 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1961 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1909 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1921 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1973 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2035 = false;
    float _2121 = _1915;
    float _2123 = _1961;
    float _2125 = _1909;
    float _2127 = _1903;
    float _2129 = _1921;
    float _2131 = _1973;
    float _2133 = _1967 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2135 = fma(_1230, -0.5, 0.5);
    float _2137 = precise::clamp(_2135, 0.0, 1.0);
    float _2139 = -_2121;
    float _2141 = _2139 + _2123;
    float _2143 = -_2125;
    float _2145 = _2143 + _2127;
    out.m_51.x = _2133;
    float _2147 = fma(_2137, _2141, _2121);
    float _2149 = -_2129;
    float _2151 = _2149 + _2131;
    float _2153 = fma(_2137, _2145, _2125);
    float _2155 = _2147 * 0.586610972881317138671875;
    bool _2157 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2159 = fma(_2137, _2151, _2129);
    out.m_85.x = 0.0;
    float _2161 = fma(_2153, 0.298911988735198974609375, _2155);
    bool _2163 = _1873 > 0.0;
    bool _2165 = isnan(_1873);
    bool _2167 = _2163 || _2165;
    bool _2169 = isnan(0.0);
    bool _2171 = _2167 || _2169;
    float _2173 = fma(_2159, 0.114477999508380889892578125, _2161);
    float _2175 = -_2173;
    float _2177 = _2153 + _2175;
    float _2179 = -_2173;
    float _2181 = _2147 + _2179;
    float _2183 = -_2173;
    float _2185 = _2159 + _2183;
    float _2187 = fma(_2177, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2173);
    float _2189 = fma(_2181, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2173);
    float _2191 = fma(_2185, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2173);
    bool _2193 = !_2157;
    if (!_2193)
    {
        float _2195 = -_1360;
        float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2199 = -_1364;
        float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2203 = -_1368;
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2207 = _2197 * _2197;
        float _2209 = fma(_2201, _2201, _2207);
        float _2211 = fma(_2205, _2205, _2209);
        float _2213 = sqrt(_2211);
        float _2215 = rsqrt(_2211);
        float _2217 = -_2213;
        float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2221 = _2219 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2223 = precise::clamp(_2221, 0.0, 1.0);
        float _2225 = _2201 * _2215;
        float _2227 = _2197 * _2215;
        float _2229 = abs(_2223);
        float _2231 = log2(_2229);
        float _2233 = _2205 * _2215;
        float _2235 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2237 = _1230 * _2227;
        float _2239 = -_2227;
        float _2241 = -_2235;
        float _2243 = fma(_2239, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2241);
        float _2245 = fma(_1226, _2225, _2237);
        float _2247 = -_2233;
        float _2249 = fma(_2247, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2243);
        float _2251 = fma(_1252, _2233, _2245);
        float _2253 = precise::clamp(_2251, 0.0, 1.0);
        float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2257 = _2249 + _2255;
        float _2259 = _2231 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2261 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2263 = precise::clamp(_2261, 0.0, 1.0);
        float _2265 = exp2(_2259);
        float _2267 = _2265 * _2263;
        float _2269 = _2253 * _2267;
        float _2271 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2273 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2275 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2271;
        out.m_85.y = _2273;
        out.m_85.z = _2275;
    }
    out.m_87.x = _2187;
    out.m_87.y = _2189;
    out.m_87.z = _2191;
    if (_2171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2277 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2277;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

