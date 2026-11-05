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
    texture2d<float> vp_t_tcb_10 [[id(5)]];
    sampler vp_t_tcb_10Smplr [[id(6)]];
    sampler vp_t_tcb_10Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_35 [[attribute(2)]];
    float4 m_40 [[attribute(3)]];
    float4 m_42 [[attribute(4)]];
    float4 m_47 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_35.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_38.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2510 = as_type<float>(_90);
        out.gl_Position.z = _2510;
    }
    if (!_78)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _92 = in.m_40.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _108 = 0.0;
    if (_102)
    {
        float _110 = float(_74);
        _108 = _110;
    }
    float _112 = _108;
    bool _114 = _106 >= _112;
    bool _116 = !_102;
    bool _118 = _114 || _116;
    if (_118)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _84;
    if (_118)
    {
        out.m_38.x = 0.0;
    }
    int _122 = 0;
    if (_118)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2578 = as_type<float>(_126);
        out.gl_Position.z = _2578;
    }
    if (_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_42.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _134 = as_type<float>(int(gl_VertexIndex));
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = _132 * _130;
    float _148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _146);
    float _150 = in.m_40.x;
    float _152 = in.m_40.y;
    float _154 = in.m_40.z;
    float _156 = _148 * 6.283185482025146484375;
    float _158 = floor(_148);
    int _160 = as_type<int>(_134) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_134) & 2;
    bool _166 = _164 != 0;
    float _168 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _156 * 0.15915493667125701904296875;
    float _172 = 0.0;
    float _174 = _168;
    if (!_144)
    {
        float _176 = _168 * _168;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _184 = _182 != 0;
    float _186 = _170 * 6.283185482025146484375;
    float _188 = cos(_186);
    float _190 = _180;
    float _192 = 0.5;
    if (!_144)
    {
        float _194 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _194;
    }
    float _196 = _190;
    bool _198 = !_162;
    float _200 = _198 ? (-0.5) : 0.5;
    float _202 = -_158;
    float _204 = _148 + _202;
    bool _206 = !_166;
    float _208 = _206 ? (-0.5) : 0.5;
    bool _210 = !_144;
    float _212 = _196;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _168 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _168);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_144;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _168 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _174 = _266;
    }
    float _268 = _174;
    float _270 = in.m_47.w;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _274 = _272 != 0;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _278 = _276 != 0;
    float _280 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _282 = _204 < 0.5;
    float _284 = float(_282);
    float _286 = -_204;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = fma(_188, 0.5, 0.5);
    float _292 = in.m_35.x;
    float _294 = in.m_35.y;
    float _296 = in.m_35.z;
    bool _298 = !_274;
    int _300 = _298 ? 0 : 1;
    float _302 = -_284;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_184;
    int _308 = _306 ? 0 : 1;
    float _310 = -_290;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _314 = abs(_300);
    float _316 = fma(_268, _150, _280);
    int _318 = abs(_308);
    float _320 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _322 = !_278;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_268, _152, _320);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _330 = abs(_324);
    float _332 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = float(_314);
    float _336 = float(_318);
    float _338 = fma(_268, _154, _332);
    float _340 = abs(_288);
    float _342 = _334 * _340;
    float _344 = fma(_338, _270, _296);
    float _346 = float(_330);
    float _348 = fma(_336, _312, _342);
    float _350 = fma(_316, _270, _292);
    float _352 = fma(_326, _270, _294);
    float _354 = abs(_304);
    float _356 = fma(_346, _354, _348);
    bool _358 = !_328;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_74);
        float _380 = 1.0 / _378;
        float _382 = _106 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = in.m_42.y;
    float _388 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _394 = _128 > 0.5;
    float _396 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _400 = _398 != 0;
    float _402 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _406 = _404 != 0;
    float _408 = 1.0 / _392;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _412 = _384 + _410;
    bool _414 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _416 = isnan(_384);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _396);
    float _428 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _388);
    bool _430 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _432 = isnan(_384);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _448 = -_440;
    float _450 = _448 + 1.0;
    bool _452 = _386 > 0.5;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _462 = 1.0 / _446;
    bool _464 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _466 = isnan(_384);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _456 * _408;
    bool _478 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _480 = isnan(_384);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _426);
    float _492 = fma(_476, _412, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _494 = -_424;
    float _496 = _494 + 1.0;
    float _498 = -_488;
    float _500 = _498 + 1.0;
    float _502 = 1.0 / _460;
    bool _504 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = isnan(_384);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = _440 * _496;
    float _518 = _424 * _500;
    bool _520 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _522 = isnan(_384);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _536 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _538 = isnan(_384);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _428);
    float _550 = _530 * _450;
    float _552 = -_530;
    float _554 = _552 + 1.0;
    float _556 = -_546;
    float _558 = _556 + 1.0;
    float _560 = 1.0 / _534;
    float _562 = _548 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _564 = _546 * _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _570 = -_514;
    float _572 = _570 + 1.0;
    float _574 = _514 * _558;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = _474 * _572;
    float _582 = 1.0 / _568;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _584;
    float _588 = _578 * _462;
    float _590 = _492 * _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _384 + _592;
    float _596 = -_474;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _604 = _586 * _502;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _608 = _384 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _614 = fma(_588, _594, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _616 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _590);
    float _618 = 1.0 / _602;
    float _620 = fma(_604, _608, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _622 = _612 * _560;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _630 = _384 + _628;
    float _632 = fma(_614, _574, _616);
    float _634 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _442);
    float _636 = _490 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _638 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _640 = _562 + _638;
    float _642 = _626 * _582;
    float _644 = fma(_622, _630, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _646 = fma(_620, _564, _632);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _650 = _384 + _648;
    float _652 = _634 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _656 = _636 + _654;
    float _658 = _640 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _660 = fma(_642, _650, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _662 = fma(_644, _550, _646);
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _666 = _652 + _664;
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[28].x, _658);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _674 = fma(_660, _516, _662);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _678 = _384 + _676;
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[28].z, _668);
    float _682 = _672 * _618;
    float _684 = -_200;
    int _686 = _394 ? as_type<int>(_684) : as_type<int>(_200);
    float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _690 = -_208;
    int _692 = _452 ? as_type<int>(_690) : as_type<int>(_208);
    float _694 = fma(_682, _678, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    bool _696 = _680 >= 0.0;
    float _698 = _640 * _640;
    bool _700 = !_400;
    float _702 = _700 ? _200 : as_type<float>(_686);
    float _704 = fma(_694, _518, _674);
    bool _706 = !_406;
    float _708 = _706 ? _208 : as_type<float>(_692);
    float _710 = fma(_656, _656, _698);
    float _712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _714 = _702 + 0.5;
    float _716 = -_708;
    float _718 = _716 + 0.5;
    float _720 = fma(_666, _666, _710);
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _724 = _718 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _728 = rsqrt(_720);
    float _730 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[121].x, _704);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _734 = _698;
    if (_696)
    {
        _734 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _736 = _734;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _746 = _722 * _688;
    float _748 = _724 * _712;
    float _750 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _762 = as_type<int>(_736);
    if (_696)
    {
        float _764 = _736 * 5.0;
        _762 = as_type<int>(_764);
    }
    int _766 = _762;
    float _768 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = _746;
    out.m_49.y = _748;
    float _770 = _640 * _728;
    float _772 = _656 * _728;
    out.m_51.x = _754;
    out.m_51.y = _756;
    out.m_51.z = _758;
    float _774 = as_type<float>(_766);
    if (_696)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3610 = as_type<float>(_766);
        out.gl_Position.z = _3610;
    }
    out.m_53.x = _750;
    out.m_53.y = _752;
    out.m_53.z = _760;
    out.m_53.w = _768;
    if (_696)
    {
        out.m_38.x = 0.0;
    }
    if (_696)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _776 = -_770;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _780 = _666 * _728;
    float _782 = -_772;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _636);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _778 + _786;
    float _790 = -_780;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _652);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _796 = _784 + _794;
    float _798 = _788 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _802 = _792 + _800;
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[28].x, _798);
    float _806 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[28].z, _804);
    bool _808 = _806 >= 0.0;
    float _810 = _780;
    if (_808)
    {
        _774 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _812 = _774;
    int _814 = as_type<int>(_812);
    if (_808)
    {
        out.m_38.x = 0.0;
    }
    if (_808)
    {
        float _816 = _812 * 5.0;
        _814 = as_type<int>(_816);
    }
    int _818 = _814;
    if (_808)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3713 = as_type<float>(_818);
        out.gl_Position.z = _3713;
    }
    if (_808)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _820 = _778 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _822 = _778 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[11].x, _820);
    float _826 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[9].x, _822);
    float _828 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[11].z, _824);
    float _830 = _778 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _832 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[9].z, _826);
    float _834 = _828 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _836 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[8].x, _830);
    float _838 = _832 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _840 = 1.0 / _834;
    float _842 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[8].z, _836);
    float _844 = _834 * 0.5;
    float _846 = _842 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _848 = fma(_838, -0.5, _844);
    float _850 = _846 + _834;
    float _852 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _848);
    float _854 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _848);
    float _856 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _848);
    float _858 = _850 * 0.5;
    float _860 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _848);
    float _862 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _848);
    float _864 = _852 * _840;
    float _866 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _858);
    float _868 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _858);
    float _870 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _858);
    float _872 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _858);
    float _874 = _866 * _840;
    float _876 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _848);
    float _878 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _848);
    float _880 = _854 * _840;
    float _882 = _868 * _840;
    float _884 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _858);
    float _886 = _870 * _840;
    float _888 = _856 * _840;
    float _890 = _872 * _840;
    float _892 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _848);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _896 = _848 + _894;
    float _898 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _858);
    float _900 = _860 * _840;
    float _902 = _862 * _840;
    float _904 = _848 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _906 = _876 * _840;
    float _908 = _878 * _840;
    float2 _3900 = float2(_874, _880);
    float _910 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3900, float2(0.0), isnan(_3900)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3900, float2(0.0), isnan(_3900)), level(0.0)).x;
    float2 _3910 = float2(_882, _864);
    float _912 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3910, float2(0.0), isnan(_3910)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3910, float2(0.0), isnan(_3910)), level(0.0)).x;
    float2 _3918 = float2(_882, _888);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3918, float2(0.0), isnan(_3918)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3918, float2(0.0), isnan(_3918)), level(0.0)).x;
    float2 _3926 = float2(_886, _900);
    float _916 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3926, float2(0.0), isnan(_3926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3926, float2(0.0), isnan(_3926)), level(0.0)).x;
    float2 _3934 = float2(_890, _906);
    float _918 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3934, float2(0.0), isnan(_3934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3934, float2(0.0), isnan(_3934)), level(0.0)).x;
    float _920 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _858);
    float _922 = _884 * _840;
    float _924 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _848);
    float _926 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _848);
    float _928 = _898 * _840;
    float _930 = _892 * _840;
    float _932 = _896 * _840;
    float _934 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _848);
    float _936 = _858 * _840;
    float _938 = _904 * _840;
    float _940 = _920 * _840;
    float2 _3983 = float2(_922, _902);
    float _942 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3983, float2(0.0), isnan(_3983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3983, float2(0.0), isnan(_3983)), level(0.0)).x;
    float2 _3991 = float2(_922, _908);
    float _944 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3991, float2(0.0), isnan(_3991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3991, float2(0.0), isnan(_3991)), level(0.0)).x;
    float2 _3999 = float2(_928, _930);
    float _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3999, float2(0.0), isnan(_3999)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3999, float2(0.0), isnan(_3999)), level(0.0)).x;
    float2 _4007 = float2(_936, _930);
    float _948 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4007, float2(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4007, float2(0.0), isnan(_4007)), level(0.0)).x;
    float2 _4015 = float2(_936, _932);
    float _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4015, float2(0.0), isnan(_4015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4015, float2(0.0), isnan(_4015)), level(0.0)).x;
    float2 _4023 = float2(_936, _938);
    float _952 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4023, float2(0.0), isnan(_4023)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4023, float2(0.0), isnan(_4023)), level(0.0)).x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _956 = _858 + _954;
    float _958 = _848 * _840;
    float _960 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _848);
    float _962 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _848);
    float _964 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _848);
    float _966 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _848);
    float _968 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _848);
    float _970 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _848);
    float _972 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _848);
    float _974 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _848);
    float _976 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _848);
    float _978 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _848);
    float _980 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _848);
    float _982 = _924 * _840;
    float _984 = _926 * _840;
    float _986 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _858);
    float _988 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _858);
    float _990 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _858);
    float _992 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _858);
    float _994 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _858);
    float _996 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _858);
    float _998 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _858);
    float _1000 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _858);
    float _1002 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _858);
    float _1004 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _858);
    float _1006 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _858);
    float _1008 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _858);
    float _1010 = _934 * _840;
    float _1012 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _858);
    float _1014 = _858 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1016 = _956 * _840;
    float _1018 = _960 * _840;
    float2 _4163 = float2(_940, _982);
    float _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4163, float2(0.0), isnan(_4163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4163, float2(0.0), isnan(_4163)), level(0.0)).x;
    float2 _4171 = float2(_936, _982);
    float _1022 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4171, float2(0.0), isnan(_4171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4171, float2(0.0), isnan(_4171)), level(0.0)).x;
    float2 _4179 = float2(_936, _984);
    float _1024 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4179, float2(0.0), isnan(_4179)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4179, float2(0.0), isnan(_4179)), level(0.0)).x;
    float2 _4187 = float2(_936, _1010);
    float _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4187, float2(0.0), isnan(_4187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4187, float2(0.0), isnan(_4187)), level(0.0)).x;
    float2 _4195 = float2(_936, _958);
    float _1028 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4195, float2(0.0), isnan(_4195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4195, float2(0.0), isnan(_4195)), level(0.0)).x;
    float2 _4203 = float2(_1016, _958);
    float _1030 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4203, float2(0.0), isnan(_4203)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4203, float2(0.0), isnan(_4203)), level(0.0)).x;
    float _1032 = _962 * _840;
    float _1034 = _986 * _840;
    float _1036 = _1014 * _840;
    float _1038 = _988 * _840;
    float _1040 = _990 * _840;
    float2 _4226 = float2(_1034, _1018);
    float _1042 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4226, float2(0.0), isnan(_4226)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4226, float2(0.0), isnan(_4226)), level(0.0)).x;
    float2 _4234 = float2(_1034, _1032);
    float _1044 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4234, float2(0.0), isnan(_4234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4234, float2(0.0), isnan(_4234)), level(0.0)).x;
    float2 _4242 = float2(_1034, _958);
    float _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4242, float2(0.0), isnan(_4242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4242, float2(0.0), isnan(_4242)), level(0.0)).x;
    float2 _4250 = float2(_1036, _958);
    float _1048 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4250, float2(0.0), isnan(_4250)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4250, float2(0.0), isnan(_4250)), level(0.0)).x;
    float2 _4258 = float2(_1038, _958);
    float _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4258, float2(0.0), isnan(_4258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4258, float2(0.0), isnan(_4258)), level(0.0)).x;
    float2 _4266 = float2(_1040, _958);
    float _1052 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4266, float2(0.0), isnan(_4266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4266, float2(0.0), isnan(_4266)), level(0.0)).x;
    float _1054 = _994 * _840;
    float _1056 = _992 * _840;
    float _1058 = _996 * _840;
    float _1060 = _964 * _840;
    float _1062 = _998 * _840;
    float _1064 = _966 * _840;
    float _1066 = _1000 * _840;
    float _1068 = _968 * _840;
    float _1070 = _1002 * _840;
    float _1072 = _970 * _840;
    float _1074 = _1004 * _840;
    float2 _4307 = float2(_1056, _958);
    float _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4307, float2(0.0), isnan(_4307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4307, float2(0.0), isnan(_4307)), level(0.0)).x;
    float2 _4315 = float2(_1054, _1060);
    float _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4315, float2(0.0), isnan(_4315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4315, float2(0.0), isnan(_4315)), level(0.0)).x;
    float2 _4323 = float2(_1058, _1064);
    float _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4323, float2(0.0), isnan(_4323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4323, float2(0.0), isnan(_4323)), level(0.0)).x;
    float2 _4331 = float2(_1062, _1068);
    float _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4331, float2(0.0), isnan(_4331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4331, float2(0.0), isnan(_4331)), level(0.0)).x;
    float2 _4339 = float2(_1066, _1072);
    float _1084 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4339, float2(0.0), isnan(_4339)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4339, float2(0.0), isnan(_4339)), level(0.0)).x;
    float _1086 = _972 * _840;
    float _1088 = _1006 * _840;
    float _1090 = _974 * _840;
    float _1092 = _1008 * _840;
    float _1094 = _976 * _840;
    float _1096 = _1012 * _840;
    float _1098 = _978 * _840;
    float _1100 = _980 * _840;
    float2 _4371 = float2(_1070, _1086);
    float _1102 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4371, float2(0.0), isnan(_4371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4371, float2(0.0), isnan(_4371)), level(0.0)).x;
    float2 _4379 = float2(_1074, _1090);
    float _1104 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4379, float2(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4379, float2(0.0), isnan(_4379)), level(0.0)).x;
    float2 _4387 = float2(_1088, _1094);
    float _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4387, float2(0.0), isnan(_4387)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4387, float2(0.0), isnan(_4387)), level(0.0)).x;
    float2 _4395 = float2(_1092, _1098);
    float _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4395, float2(0.0), isnan(_4395)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4395, float2(0.0), isnan(_4395)), level(0.0)).x;
    float2 _4403 = float2(_1096, _1100);
    float _1110 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4403, float2(0.0), isnan(_4403)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4403, float2(0.0), isnan(_4403)), level(0.0)).x;
    float _1112 = -_770;
    float _1114 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _640);
    float _1116 = -_772;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _656);
    float _1120 = in.m_47.x;
    float _1122 = in.m_47.y;
    float _1124 = -_780;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _1128 = _1114 * _1114;
    float _1130 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _208);
    float _1132 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _200);
    float _1134 = fma(_1118, _1118, _1128);
    bool _1136 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1138 = isnan(0.5);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1144 = _1140 || _1142;
    float _1146 = fma(_1126, _1126, _1134);
    float _1148 = sqrt(_1146);
    float _1150 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1152 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1154 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1156 = _728 * _1148;
    float _1158 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1160 = _1156 * _1154;
    float _1162 = _1156 * _1158;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1166 = _1164 * 0.5;
    float _1168 = _1130 * _1162;
    float _1170 = _1132 * _1160;
    float _1172 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1174 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1172);
    float _1180 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1174);
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1184 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1178);
    float _1186 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1180);
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    float _1190 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1192 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1194 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1196 = _778 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1198 = _652 + _1190;
    float _1200 = _636 + _1192;
    float _1202 = _562 + _1194;
    float _1204 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1196);
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1208 = _1198 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1212 = _1200 + _1210;
    float _1214 = _1208 * _1208;
    float _1216 = fma(_1212, _1212, _1214);
    float _1218 = sqrt(_1216);
    bool _1220 = _1218 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = _1166;
    float _1224 = _1194;
    float _1226 = _1202;
    if (!_1220)
    {
        _1222 = _1200;
    }
    float _1228 = _1222;
    float _1230 = _1228;
    if (!_1220)
    {
        _1224 = _1198;
    }
    float _1232 = _1224;
    bool _1234 = !_1220;
    float _1236 = _1232;
    if (!_1234)
    {
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1242 = _1218 + _1240;
        float _1244 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = rsqrt(_1216);
        float _1248 = _1242 * _1238;
        float _1250 = _1248 * 0.15915493667125701904296875;
        float _1252 = _1250 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = _1250 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = _1254 + (-1.0);
        float _1262 = fma(_1258, _1244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1264 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = _1246 * _1262;
        float _1268 = fma(_1202, _1254, _1264);
        float _1270 = fma(_1212, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1272 = fma(_1208, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1230 = _1270;
        _1236 = _1272;
        _1226 = _1268;
    }
    float _1274 = _1230;
    float _1276 = _1236;
    float _1278 = _1226;
    float _1280 = -_772;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1284 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1204);
    float _1286 = -_780;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1276);
    float _1290 = -_770;
    float _1292 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1278);
    float _1294 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1296 = _1292;
    float _1298 = _1288;
    if (_1144)
    {
        _810 = _1282;
    }
    float _1300 = _810;
    float _1302 = _1300;
    if (!_1144)
    {
        float _1304 = _788 * _788;
        float _1306 = 1.0 / _1156;
        float _1308 = -_652;
        float _1310 = _1308 + _1276;
        float _1312 = fma(_796, _796, _1304);
        float _1314 = fma(_802, _802, _1312);
        float _1316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1318 = sqrt(_1314);
        float _1320 = precise::min(_1318, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1322 = _1320 * _1316;
        float _1324 = -_636;
        float _1326 = _1324 + _1274;
        float _1328 = _1322 * _1306;
        float _1330 = -_562;
        float _1332 = _1330 + _1278;
        float _1334 = fma(_1326, _1328, _784);
        float _1336 = fma(_1332, _1328, _778);
        float _1338 = fma(_1310, _1328, _792);
        _1296 = _1336;
        _1302 = _1334;
        _1298 = _1338;
    }
    float _1340 = _1296;
    float _1342 = _1302;
    float _1344 = _1298;
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1348 = _1294 + _834;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1354 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1346);
    float _1356 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1350);
    float _1360 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1352);
    float _1362 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1356);
    float _1366 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1358);
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1360);
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1372 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1364);
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1382 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1378);
    float _1388 = _1348 * _840;
    float _1390 = _1388 * 0.5;
    float _1392 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1382);
    float _1394 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1396 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1380);
    float _1398 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1400 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1386);
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1402);
    float _1406 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1392);
    float _1408 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1396);
    float _1410 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1394);
    float _1412 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1400);
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1416 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1414);
    float _1418 = 1.0 / _1404;
    float _1420 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1410);
    float _1422 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1408);
    float _1424 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1428 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1426);
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1432 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1430);
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1436 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1434);
    float _1438 = _1412 + _1420;
    float _1440 = 1.0 / _1416;
    out.gl_Position.x = _1422;
    out.gl_Position.y = _1424;
    out.gl_Position.z = _1412;
    out.gl_Position.w = _1420;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1444 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1442);
    float _1446 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1448 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1446);
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1452 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1450);
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1456 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1454);
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1460 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1458);
    float _1462 = 1.0 / _1432;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1466 = _1418 * _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1470 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1468);
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1474 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1472);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1478 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1476);
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1482 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1480);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1486 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1484);
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1490 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1488);
    float _1492 = 1.0 / _1428;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1496 = -_1466;
    float _1498 = fma(_1440, _1494, _1496);
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1502 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1500);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1506 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1504);
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1510 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1508);
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1514 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1512);
    bool _1516 = _1498 >= 0.0;
    bool _1518 = isnan(_1498);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan(0.0);
    bool _1524 = _1520 || _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1528 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1526);
    float _1530 = 1.0 / _1436;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1534 = -_1466;
    float _1536 = fma(_1462, _1532, _1534);
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1540 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1538);
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1544 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1542);
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1548 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1546);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1552 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1550);
    bool _1554 = _1536 >= 0.0;
    bool _1556 = isnan(_1536);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan(0.0);
    bool _1562 = _1558 || _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1566 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1564);
    float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1570 = -_1466;
    float _1572 = fma(_1492, _1568, _1570);
    float _1574 = 1.0 / _1444;
    bool _1576 = !_1562;
    float _1578 = _1576 ? 0.0 : 2.0;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1582 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1586 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1584);
    bool _1588 = _1572 >= 0.0;
    bool _1590 = isnan(_1572);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan(0.0);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1602 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1600);
    bool _1604 = !_1524;
    float _1606 = _1604 ? 0.0 : 2.0;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1610 = -_1466;
    float _1612 = fma(_1530, _1608, _1610);
    float _1614 = 1.0 / _1452;
    float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1618 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1616);
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1622 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1620);
    float _1624 = _1606 + _1598;
    bool _1626 = _1612 >= 0.0;
    bool _1628 = isnan(_1612);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan(0.0);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1640 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1638);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1644 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1642);
    float _1646 = _1624 + _1578;
    float _1648 = 1.0 / _1448;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1652 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1650);
    float _1654 = _1438 * 0.5;
    float _1656 = _1646 + _1636;
    float _1658 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1660 = -_1466;
    float _1662 = fma(_1574, _1658, _1660);
    out.m_55.z = _1654;
    out.m_55.w = _1420;
    float _1664 = 1.0 / _1460;
    bool _1666 = _1662 >= 0.0;
    bool _1668 = isnan(_1662);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.0);
    bool _1674 = _1670 || _1672;
    float _1676 = float(_1674);
    float _1678 = _1656 + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1682 = -_1466;
    float _1684 = fma(_1614, _1680, _1682);
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1688 = -_1466;
    float _1690 = fma(_1648, _1686, _1688);
    float _1692 = 1.0 / _1474;
    bool _1694 = _1684 >= 0.0;
    bool _1696 = isnan(_1684);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan(0.0);
    bool _1702 = _1698 || _1700;
    bool _1704 = _1690 >= 0.0;
    bool _1706 = isnan(_1690);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(0.0);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    bool _1716 = !_1702;
    float _1718 = _1716 ? 0.0 : 2.0;
    float _1720 = 1.0 / _1456;
    float _1722 = _1678 + _1718;
    float _1724 = _1722 + _1714;
    float _1726 = 1.0 / _1486;
    float _1728 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1730 = -_1466;
    float _1732 = fma(_1720, _1728, _1730);
    float _1734 = 1.0 / _1490;
    bool _1736 = _1732 >= 0.0;
    bool _1738 = isnan(_1732);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan(0.0);
    bool _1744 = _1740 || _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1748 = -_1466;
    float _1750 = fma(_1664, _1746, _1748);
    float _1752 = 1.0 / _1470;
    bool _1754 = _1750 >= 0.0;
    bool _1756 = isnan(_1750);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    bool _1764 = !_1744;
    float _1766 = _1764 ? 0.0 : 2.0;
    bool _1768 = !_1762;
    float _1770 = _1768 ? 0.0 : 2.0;
    float _1772 = 1.0 / _1506;
    float _1774 = _1724 + _1766;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1778 = -_1466;
    float _1780 = fma(_1726, _1776, _1778);
    float _1782 = _1774 + _1770;
    bool _1784 = _1780 >= 0.0;
    bool _1786 = isnan(_1780);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan(0.0);
    bool _1792 = _1788 || _1790;
    float _1794 = float(_1792);
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1798 = -_1466;
    float _1800 = fma(_1752, _1796, _1798);
    float _1802 = 1.0 / _1540;
    bool _1804 = _1800 >= 0.0;
    bool _1806 = isnan(_1800);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(0.0);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = 1.0 / _1478;
    float _1818 = _1782 + _1814;
    float _1820 = 1.0 / _1544;
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1824 = -_1466;
    float _1826 = fma(_1816, _1822, _1824);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1830 = -_1466;
    float _1832 = fma(_1692, _1828, _1830);
    float _1834 = 1.0 / _1548;
    bool _1836 = _1826 >= 0.0;
    bool _1838 = isnan(_1826);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan(0.0);
    bool _1844 = _1840 || _1842;
    bool _1846 = _1832 >= 0.0;
    bool _1848 = isnan(_1832);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan(0.0);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    bool _1858 = !_1844;
    float _1860 = _1858 ? 0.0 : 2.0;
    float _1862 = 1.0 / _1482;
    float _1864 = _1818 + _1860;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1868 = -_1466;
    float _1870 = fma(_1734, _1866, _1868);
    float _1872 = _1864 + _1856;
    float _1874 = 1.0 / _1552;
    bool _1876 = _1870 >= 0.0;
    bool _1878 = isnan(_1870);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(0.0);
    bool _1884 = _1880 || _1882;
    float _1886 = _1872 + _1794;
    bool _1888 = !_1884;
    float _1890 = _1888 ? 0.0 : 2.0;
    float _1892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1894 = -_1466;
    float _1896 = fma(_1862, _1892, _1894);
    float _1898 = 1.0 / _1566;
    float _1900 = _1886 + _1890;
    bool _1902 = _1896 >= 0.0;
    bool _1904 = isnan(_1896);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.0);
    bool _1910 = _1906 || _1908;
    float _1912 = float(_1910);
    float _1914 = 1.0 / _1502;
    float _1916 = _1900 + _1912;
    float _1918 = 1.0 / _1582;
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1922 = -_1466;
    float _1924 = fma(_1914, _1920, _1922);
    float _1926 = 1.0 / _1602;
    bool _1928 = _1924 >= 0.0;
    bool _1930 = isnan(_1924);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(0.0);
    bool _1936 = _1932 || _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1940 = -_1466;
    float _1942 = fma(_1772, _1938, _1940);
    float _1944 = 1.0 / _1510;
    bool _1946 = _1942 >= 0.0;
    bool _1948 = isnan(_1942);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan(0.0);
    bool _1954 = _1950 || _1952;
    bool _1956 = !_1936;
    float _1958 = _1956 ? 0.0 : 2.0;
    bool _1960 = !_1954;
    float _1962 = _1960 ? 0.0 : 2.0;
    float _1964 = 1.0 / _1618;
    float _1966 = _1916 + _1958;
    float _1968 = _1966 + _1962;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1972 = -_1466;
    float _1974 = fma(_1944, _1970, _1972);
    float _1976 = 1.0 / _1622;
    bool _1978 = _1974 >= 0.0;
    bool _1980 = isnan(_1974);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan(0.0);
    bool _1986 = _1982 || _1984;
    float _1988 = float(_1986);
    float _1990 = 1.0 / _1514;
    float _1992 = _1968 + _1988;
    float _1994 = 1.0 / _1640;
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1998 = -_1466;
    float _2000 = fma(_1990, _1996, _1998);
    float _2002 = 1.0 / _1644;
    bool _2004 = _2000 >= 0.0;
    bool _2006 = isnan(_2000);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.0);
    bool _2012 = _2008 || _2010;
    float _2014 = 1.0 / _1528;
    bool _2016 = !_2012;
    float _2018 = _2016 ? 0.0 : 2.0;
    float _2020 = _1992 + _2018;
    float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2024 = -_1466;
    float _2026 = fma(_1802, _2022, _2024);
    float _2028 = 1.0 / _1652;
    bool _2030 = _2026 >= 0.0;
    bool _2032 = isnan(_2026);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan(0.0);
    bool _2038 = _2034 || _2036;
    float _2040 = float(_2038);
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2044 = -_1466;
    float _2046 = fma(_2014, _2042, _2044);
    bool _2048 = _2046 >= 0.0;
    bool _2050 = isnan(_2046);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan(0.0);
    bool _2056 = _2052 || _2054;
    float _2058 = float(_2056);
    float _2060 = 1.0 / _1586;
    float _2062 = _2020 + _2058;
    float _2064 = _2062 + _2040;
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2068 = -_1466;
    float _2070 = fma(_1820, _2066, _2068);
    bool _2072 = _2070 >= 0.0;
    bool _2074 = isnan(_2070);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2084 = -_1466;
    float _2086 = fma(_2060, _2082, _2084);
    bool _2088 = !_2080;
    float _2090 = _2088 ? 0.0 : 2.0;
    bool _2092 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2094 = isnan(0.5);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2100 = _2096 || _2098;
    bool _2102 = _2086 >= 0.0;
    bool _2104 = isnan(_2086);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan(0.0);
    bool _2110 = _2106 || _2108;
    float _2112 = float(_2110);
    float _2114 = _2064 + _2090;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2118 = -_1466;
    float _2120 = fma(_1834, _2116, _2118);
    float _2122 = _2114 + _2112;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2126 = -_1466;
    float _2128 = fma(_1926, _2124, _2126);
    bool _2130 = _2120 >= 0.0;
    bool _2132 = isnan(_2120);
    bool _2134 = _2130 || _2132;
    bool _2136 = isnan(0.0);
    bool _2138 = _2134 || _2136;
    float _2140 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2142 = -_1466;
    float _2144 = fma(_1874, _2140, _2142);
    float _2146 = _1510;
    float _2148 = _1448;
    float _2150 = _1466;
    if (!_2100)
    {
        _192 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2152 = _192;
    float _2154 = _2152;
    if (!_2100)
    {
        float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2158 = _1466 + _2156;
        _2146 = _2158;
    }
    float _2160 = _2146;
    bool _2162 = _2144 >= 0.0;
    bool _2164 = isnan(_2144);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan(0.0);
    bool _2170 = _2166 || _2168;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2174 = -_1466;
    float _2176 = fma(_1898, _2172, _2174);
    if (!_2100)
    {
        _2148 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2178 = _2148;
    float _2180 = _2178;
    if (!_2100)
    {
        float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2184 = _2152 + _2182;
        _2154 = _2184;
    }
    float _2186 = _2154;
    bool _2188 = _2176 >= 0.0;
    bool _2190 = isnan(_2176);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan(0.0);
    bool _2196 = _2192 || _2194;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2200 = -_1466;
    float _2202 = fma(_1918, _2198, _2200);
    float _2204 = _1482;
    if (!_2100)
    {
        float _2206 = 1.0 / _2186;
        _2204 = _2206;
    }
    float _2208 = _2204;
    if (!_2100)
    {
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2212 = _2178 + _2210;
        _2180 = _2212;
    }
    float _2214 = _2180;
    bool _2216 = !_2196;
    float _2218 = _2216 ? 0.0 : 3.0;
    bool _2220 = _2202 >= 0.0;
    bool _2222 = isnan(_2202);
    bool _2224 = _2220 || _2222;
    bool _2226 = isnan(0.0);
    bool _2228 = _2224 || _2226;
    bool _2230 = !_2170;
    float _2232 = _2230 ? 0.0 : 3.0;
    bool _2234 = _2128 >= 0.0;
    bool _2236 = isnan(_2128);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan(0.0);
    bool _2242 = _2238 || _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2246 = -_1466;
    float _2248 = fma(_1976, _2244, _2246);
    bool _2250 = !_2228;
    float _2252 = _2250 ? 0.0 : 3.0;
    float _2254 = _2232 + _2218;
    bool _2256 = !_2138;
    float _2258 = _2256 ? 0.0 : 2.0;
    float _2260 = _2214;
    if (!_2100)
    {
        float _2262 = 1.0 / _2214;
        _2260 = _2262;
    }
    float _2264 = _2260;
    bool _2266 = !_2242;
    float _2268 = _2266 ? 0.0 : 3.0;
    float _2270 = _2254 + _2252;
    float _2272 = _2122 + _2258;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2276 = -_1466;
    float _2278 = fma(_1964, _2274, _2276);
    float _2280 = _2270 + _2268;
    bool _2282 = _2278 >= 0.0;
    bool _2284 = isnan(_2278);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(0.0);
    bool _2290 = _2286 || _2288;
    float _2292 = _2278;
    float _2294 = _2272;
    if (_2100)
    {
        _2292 = 1.0;
    }
    float _2296 = _2292;
    float _2298 = _2296;
    if (!_2100)
    {
        float _2300 = _2160 * _2208;
        float _2302 = precise::clamp(_2300, 0.0, 1.0);
        _2298 = _2302;
    }
    float _2304 = _2298;
    bool _2306 = !_2290;
    float _2308 = _2306 ? 0.0 : 3.0;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2312 = -_1466;
    float _2314 = fma(_1994, _2310, _2312);
    bool _2316 = _2248 >= 0.0;
    bool _2318 = isnan(_2248);
    bool _2320 = _2316 || _2318;
    bool _2322 = isnan(0.0);
    bool _2324 = _2320 || _2322;
    float _2326 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2328 = -_1466;
    float _2330 = fma(_2002, _2326, _2328);
    float _2332 = _2280 + _2308;
    bool _2334 = _2314 >= 0.0;
    bool _2336 = isnan(_2314);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan(0.0);
    bool _2342 = _2338 || _2340;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2346 = -_1466;
    float _2348 = fma(_2028, _2344, _2346);
    bool _2350 = !_2324;
    float _2352 = _2350 ? 0.0 : 3.0;
    if (!_2100)
    {
        float _2354 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2356 = _1466 + _2354;
        _2150 = _2356;
    }
    float _2358 = _2150;
    bool _2360 = _2330 >= 0.0;
    bool _2362 = isnan(_2330);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan(0.0);
    bool _2368 = _2364 || _2366;
    bool _2370 = !_2342;
    float _2372 = _2370 ? 0.0 : 3.0;
    float _2374 = _2332 + _2352;
    bool _2376 = _2348 >= 0.0;
    bool _2378 = isnan(_2348);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.0);
    bool _2384 = _2380 || _2382;
    float _2386 = _2358;
    if (!_2100)
    {
        float _2388 = _2358 * _2264;
        float _2390 = precise::clamp(_2388, 0.0, 1.0);
        _2386 = _2390;
    }
    float _2392 = _2386;
    bool _2394 = !_2368;
    float _2396 = _2394 ? 0.0 : 3.0;
    float _2398 = _2374 + _2372;
    bool _2400 = !_2384;
    float _2402 = _2400 ? 0.0 : 5.0;
    float _2404 = _2398 + _2396;
    float _2406 = _2272 * 0.02857142873108386993408203125;
    float _2408 = precise::clamp(_2406, 0.0, 1.0);
    if (_2100)
    {
        _2294 = 1.0;
    }
    float _2410 = _2294;
    float _2412 = _2410;
    if (!_2100)
    {
        float _2414 = -_2392;
        float _2416 = _2414 + 1.0;
        _2412 = _2416;
    }
    float _2418 = _2412;
    float _2420 = _2404 + _2402;
    bool _2422 = _2304 > 0.0;
    bool _2424 = isnan(_2304);
    bool _2426 = _2422 || _2424;
    bool _2428 = isnan(0.0);
    bool _2430 = _2426 || _2428;
    float _2432 = _2420 * 0.14285714924335479736328125;
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    bool _2436 = _2418 <= 0.0;
    bool _2438 = !_2430;
    bool _2440 = _2436 || _2438;
    float _2442 = _2408 * _2434;
    float _2444 = _2442 * _2304;
    float _2446 = _2444 * _2418;
    float _2448 = _2446 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2450 = _356 * _2448;
    float _2452 = _2450 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2452;
    if (!_2440)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2454 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_38.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2454;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_35.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_38.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2510 = as_type<float>(_90);
        out.gl_Position.z = _2510;
    }
    if (!_78)
    {
        return out;
    }
    float _92 = in.m_40.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _108 = 0.0;
    if (_102)
    {
        float _110 = float(_74);
        _108 = _110;
    }
    float _112 = _108;
    bool _114 = _106 >= _112;
    bool _116 = !_102;
    bool _118 = _114 || _116;
    if (_118)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _84;
    if (_118)
    {
        out.m_38.x = 0.0;
    }
    int _122 = 0;
    if (_118)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2578 = as_type<float>(_126);
        out.gl_Position.z = _2578;
    }
    if (_118)
    {
        return out;
    }
    float _128 = in.m_42.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _134 = as_type<float>(int(gl_VertexIndex));
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = _132 * _130;
    float _148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _146);
    float _150 = in.m_40.x;
    float _152 = in.m_40.y;
    float _154 = in.m_40.z;
    float _156 = _148 * 6.283185482025146484375;
    float _158 = floor(_148);
    int _160 = as_type<int>(_134) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_134) & 2;
    bool _166 = _164 != 0;
    float _168 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _156 * 0.15915493667125701904296875;
    float _172 = 0.0;
    float _174 = _168;
    if (!_144)
    {
        float _176 = _168 * _168;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _184 = _182 != 0;
    float _186 = _170 * 6.283185482025146484375;
    float _188 = cos(_186);
    float _190 = _180;
    float _192 = 0.5;
    if (!_144)
    {
        float _194 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _194;
    }
    float _196 = _190;
    bool _198 = !_162;
    float _200 = _198 ? (-0.5) : 0.5;
    float _202 = -_158;
    float _204 = _148 + _202;
    bool _206 = !_166;
    float _208 = _206 ? (-0.5) : 0.5;
    bool _210 = !_144;
    float _212 = _196;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _168 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _168);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_144;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _168 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _174 = _266;
    }
    float _268 = _174;
    float _270 = in.m_47.w;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _274 = _272 != 0;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _278 = _276 != 0;
    float _280 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _282 = _204 < 0.5;
    float _284 = float(_282);
    float _286 = -_204;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = fma(_188, 0.5, 0.5);
    float _292 = in.m_35.x;
    float _294 = in.m_35.y;
    float _296 = in.m_35.z;
    bool _298 = !_274;
    int _300 = _298 ? 0 : 1;
    float _302 = -_284;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_184;
    int _308 = _306 ? 0 : 1;
    float _310 = -_290;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _314 = abs(_300);
    float _316 = fma(_268, _150, _280);
    int _318 = abs(_308);
    float _320 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _322 = !_278;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_268, _152, _320);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _330 = abs(_324);
    float _332 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = float(_314);
    float _336 = float(_318);
    float _338 = fma(_268, _154, _332);
    float _340 = abs(_288);
    float _342 = _334 * _340;
    float _344 = fma(_338, _270, _296);
    float _346 = float(_330);
    float _348 = fma(_336, _312, _342);
    float _350 = fma(_316, _270, _292);
    float _352 = fma(_326, _270, _294);
    float _354 = abs(_304);
    float _356 = fma(_346, _354, _348);
    bool _358 = !_328;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_74);
        float _380 = 1.0 / _378;
        float _382 = _106 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = in.m_42.y;
    float _388 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _394 = _128 > 0.5;
    float _396 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _400 = _398 != 0;
    float _402 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _406 = _404 != 0;
    float _408 = 1.0 / _392;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _412 = _384 + _410;
    bool _414 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _416 = isnan(_384);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _396);
    float _428 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _388);
    bool _430 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _432 = isnan(_384);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _448 = -_440;
    float _450 = _448 + 1.0;
    bool _452 = _386 > 0.5;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _462 = 1.0 / _446;
    bool _464 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _466 = isnan(_384);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _456 * _408;
    bool _478 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _480 = isnan(_384);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _426);
    float _492 = fma(_476, _412, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _494 = -_424;
    float _496 = _494 + 1.0;
    float _498 = -_488;
    float _500 = _498 + 1.0;
    float _502 = 1.0 / _460;
    bool _504 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = isnan(_384);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = _440 * _496;
    float _518 = _424 * _500;
    bool _520 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _522 = isnan(_384);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _536 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _538 = isnan(_384);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _428);
    float _550 = _530 * _450;
    float _552 = -_530;
    float _554 = _552 + 1.0;
    float _556 = -_546;
    float _558 = _556 + 1.0;
    float _560 = 1.0 / _534;
    float _562 = _548 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _564 = _546 * _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _570 = -_514;
    float _572 = _570 + 1.0;
    float _574 = _514 * _558;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = _474 * _572;
    float _582 = 1.0 / _568;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _584;
    float _588 = _578 * _462;
    float _590 = _492 * _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _384 + _592;
    float _596 = -_474;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _604 = _586 * _502;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _608 = _384 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _614 = fma(_588, _594, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _616 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _590);
    float _618 = 1.0 / _602;
    float _620 = fma(_604, _608, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _622 = _612 * _560;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _630 = _384 + _628;
    float _632 = fma(_614, _574, _616);
    float _634 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _442);
    float _636 = _490 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _638 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _640 = _562 + _638;
    float _642 = _626 * _582;
    float _644 = fma(_622, _630, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _646 = fma(_620, _564, _632);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _650 = _384 + _648;
    float _652 = _634 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _656 = _636 + _654;
    float _658 = _640 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _660 = fma(_642, _650, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _662 = fma(_644, _550, _646);
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _666 = _652 + _664;
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[28].x, _658);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _674 = fma(_660, _516, _662);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _678 = _384 + _676;
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[28].z, _668);
    float _682 = _672 * _618;
    float _684 = -_200;
    int _686 = _394 ? as_type<int>(_684) : as_type<int>(_200);
    float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _690 = -_208;
    int _692 = _452 ? as_type<int>(_690) : as_type<int>(_208);
    float _694 = fma(_682, _678, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    bool _696 = _680 >= 0.0;
    float _698 = _640 * _640;
    bool _700 = !_400;
    float _702 = _700 ? _200 : as_type<float>(_686);
    float _704 = fma(_694, _518, _674);
    bool _706 = !_406;
    float _708 = _706 ? _208 : as_type<float>(_692);
    float _710 = fma(_656, _656, _698);
    float _712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _714 = _702 + 0.5;
    float _716 = -_708;
    float _718 = _716 + 0.5;
    float _720 = fma(_666, _666, _710);
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _724 = _718 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _728 = rsqrt(_720);
    float _730 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[121].x, _704);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _734 = _698;
    if (_696)
    {
        _734 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _736 = _734;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _746 = _722 * _688;
    float _748 = _724 * _712;
    float _750 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _762 = as_type<int>(_736);
    if (_696)
    {
        float _764 = _736 * 5.0;
        _762 = as_type<int>(_764);
    }
    int _766 = _762;
    float _768 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = _746;
    out.m_49.y = _748;
    float _770 = _640 * _728;
    float _772 = _656 * _728;
    out.m_51.x = _754;
    out.m_51.y = _756;
    out.m_51.z = _758;
    float _774 = as_type<float>(_766);
    if (_696)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3610 = as_type<float>(_766);
        out.gl_Position.z = _3610;
    }
    out.m_53.x = _750;
    out.m_53.y = _752;
    out.m_53.z = _760;
    out.m_53.w = _768;
    if (_696)
    {
        out.m_38.x = 0.0;
    }
    if (_696)
    {
        return out;
    }
    float _776 = -_770;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _780 = _666 * _728;
    float _782 = -_772;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _636);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _778 + _786;
    float _790 = -_780;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _652);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _796 = _784 + _794;
    float _798 = _788 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _802 = _792 + _800;
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[28].x, _798);
    float _806 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[28].z, _804);
    bool _808 = _806 >= 0.0;
    float _810 = _780;
    if (_808)
    {
        _774 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _812 = _774;
    int _814 = as_type<int>(_812);
    if (_808)
    {
        out.m_38.x = 0.0;
    }
    if (_808)
    {
        float _816 = _812 * 5.0;
        _814 = as_type<int>(_816);
    }
    int _818 = _814;
    if (_808)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3713 = as_type<float>(_818);
        out.gl_Position.z = _3713;
    }
    if (_808)
    {
        return out;
    }
    float _820 = _778 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _822 = _778 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[11].x, _820);
    float _826 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[9].x, _822);
    float _828 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[11].z, _824);
    float _830 = _778 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _832 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[9].z, _826);
    float _834 = _828 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _836 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[8].x, _830);
    float _838 = _832 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _840 = 1.0 / _834;
    float _842 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[8].z, _836);
    float _844 = _834 * 0.5;
    float _846 = _842 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _848 = fma(_838, -0.5, _844);
    float _850 = _846 + _834;
    float _852 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _848);
    float _854 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _848);
    float _856 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _848);
    float _858 = _850 * 0.5;
    float _860 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _848);
    float _862 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _848);
    float _864 = _852 * _840;
    float _866 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _858);
    float _868 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _858);
    float _870 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _858);
    float _872 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _858);
    float _874 = _866 * _840;
    float _876 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _848);
    float _878 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _848);
    float _880 = _854 * _840;
    float _882 = _868 * _840;
    float _884 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _858);
    float _886 = _870 * _840;
    float _888 = _856 * _840;
    float _890 = _872 * _840;
    float _892 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _848);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _896 = _848 + _894;
    float _898 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _858);
    float _900 = _860 * _840;
    float _902 = _862 * _840;
    float _904 = _848 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _906 = _876 * _840;
    float _908 = _878 * _840;
    float2 _3900 = float2(_874, _880);
    float _910 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3900, float2(0.0), isnan(_3900)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3900, float2(0.0), isnan(_3900)), level(0.0)).x;
    float2 _3910 = float2(_882, _864);
    float _912 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3910, float2(0.0), isnan(_3910)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3910, float2(0.0), isnan(_3910)), level(0.0)).x;
    float2 _3918 = float2(_882, _888);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3918, float2(0.0), isnan(_3918)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3918, float2(0.0), isnan(_3918)), level(0.0)).x;
    float2 _3926 = float2(_886, _900);
    float _916 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3926, float2(0.0), isnan(_3926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3926, float2(0.0), isnan(_3926)), level(0.0)).x;
    float2 _3934 = float2(_890, _906);
    float _918 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3934, float2(0.0), isnan(_3934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3934, float2(0.0), isnan(_3934)), level(0.0)).x;
    float _920 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _858);
    float _922 = _884 * _840;
    float _924 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _848);
    float _926 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _848);
    float _928 = _898 * _840;
    float _930 = _892 * _840;
    float _932 = _896 * _840;
    float _934 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _848);
    float _936 = _858 * _840;
    float _938 = _904 * _840;
    float _940 = _920 * _840;
    float2 _3983 = float2(_922, _902);
    float _942 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3983, float2(0.0), isnan(_3983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3983, float2(0.0), isnan(_3983)), level(0.0)).x;
    float2 _3991 = float2(_922, _908);
    float _944 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3991, float2(0.0), isnan(_3991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3991, float2(0.0), isnan(_3991)), level(0.0)).x;
    float2 _3999 = float2(_928, _930);
    float _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3999, float2(0.0), isnan(_3999)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3999, float2(0.0), isnan(_3999)), level(0.0)).x;
    float2 _4007 = float2(_936, _930);
    float _948 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4007, float2(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4007, float2(0.0), isnan(_4007)), level(0.0)).x;
    float2 _4015 = float2(_936, _932);
    float _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4015, float2(0.0), isnan(_4015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4015, float2(0.0), isnan(_4015)), level(0.0)).x;
    float2 _4023 = float2(_936, _938);
    float _952 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4023, float2(0.0), isnan(_4023)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4023, float2(0.0), isnan(_4023)), level(0.0)).x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _956 = _858 + _954;
    float _958 = _848 * _840;
    float _960 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _848);
    float _962 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _848);
    float _964 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _848);
    float _966 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _848);
    float _968 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _848);
    float _970 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _848);
    float _972 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _848);
    float _974 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _848);
    float _976 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _848);
    float _978 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _848);
    float _980 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _848);
    float _982 = _924 * _840;
    float _984 = _926 * _840;
    float _986 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _858);
    float _988 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _858);
    float _990 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _858);
    float _992 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _858);
    float _994 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _858);
    float _996 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _858);
    float _998 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _858);
    float _1000 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _858);
    float _1002 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _858);
    float _1004 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _858);
    float _1006 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _858);
    float _1008 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _858);
    float _1010 = _934 * _840;
    float _1012 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _858);
    float _1014 = _858 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1016 = _956 * _840;
    float _1018 = _960 * _840;
    float2 _4163 = float2(_940, _982);
    float _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4163, float2(0.0), isnan(_4163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4163, float2(0.0), isnan(_4163)), level(0.0)).x;
    float2 _4171 = float2(_936, _982);
    float _1022 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4171, float2(0.0), isnan(_4171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4171, float2(0.0), isnan(_4171)), level(0.0)).x;
    float2 _4179 = float2(_936, _984);
    float _1024 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4179, float2(0.0), isnan(_4179)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4179, float2(0.0), isnan(_4179)), level(0.0)).x;
    float2 _4187 = float2(_936, _1010);
    float _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4187, float2(0.0), isnan(_4187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4187, float2(0.0), isnan(_4187)), level(0.0)).x;
    float2 _4195 = float2(_936, _958);
    float _1028 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4195, float2(0.0), isnan(_4195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4195, float2(0.0), isnan(_4195)), level(0.0)).x;
    float2 _4203 = float2(_1016, _958);
    float _1030 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4203, float2(0.0), isnan(_4203)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4203, float2(0.0), isnan(_4203)), level(0.0)).x;
    float _1032 = _962 * _840;
    float _1034 = _986 * _840;
    float _1036 = _1014 * _840;
    float _1038 = _988 * _840;
    float _1040 = _990 * _840;
    float2 _4226 = float2(_1034, _1018);
    float _1042 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4226, float2(0.0), isnan(_4226)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4226, float2(0.0), isnan(_4226)), level(0.0)).x;
    float2 _4234 = float2(_1034, _1032);
    float _1044 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4234, float2(0.0), isnan(_4234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4234, float2(0.0), isnan(_4234)), level(0.0)).x;
    float2 _4242 = float2(_1034, _958);
    float _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4242, float2(0.0), isnan(_4242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4242, float2(0.0), isnan(_4242)), level(0.0)).x;
    float2 _4250 = float2(_1036, _958);
    float _1048 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4250, float2(0.0), isnan(_4250)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4250, float2(0.0), isnan(_4250)), level(0.0)).x;
    float2 _4258 = float2(_1038, _958);
    float _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4258, float2(0.0), isnan(_4258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4258, float2(0.0), isnan(_4258)), level(0.0)).x;
    float2 _4266 = float2(_1040, _958);
    float _1052 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4266, float2(0.0), isnan(_4266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4266, float2(0.0), isnan(_4266)), level(0.0)).x;
    float _1054 = _994 * _840;
    float _1056 = _992 * _840;
    float _1058 = _996 * _840;
    float _1060 = _964 * _840;
    float _1062 = _998 * _840;
    float _1064 = _966 * _840;
    float _1066 = _1000 * _840;
    float _1068 = _968 * _840;
    float _1070 = _1002 * _840;
    float _1072 = _970 * _840;
    float _1074 = _1004 * _840;
    float2 _4307 = float2(_1056, _958);
    float _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4307, float2(0.0), isnan(_4307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4307, float2(0.0), isnan(_4307)), level(0.0)).x;
    float2 _4315 = float2(_1054, _1060);
    float _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4315, float2(0.0), isnan(_4315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4315, float2(0.0), isnan(_4315)), level(0.0)).x;
    float2 _4323 = float2(_1058, _1064);
    float _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4323, float2(0.0), isnan(_4323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4323, float2(0.0), isnan(_4323)), level(0.0)).x;
    float2 _4331 = float2(_1062, _1068);
    float _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4331, float2(0.0), isnan(_4331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4331, float2(0.0), isnan(_4331)), level(0.0)).x;
    float2 _4339 = float2(_1066, _1072);
    float _1084 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4339, float2(0.0), isnan(_4339)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4339, float2(0.0), isnan(_4339)), level(0.0)).x;
    float _1086 = _972 * _840;
    float _1088 = _1006 * _840;
    float _1090 = _974 * _840;
    float _1092 = _1008 * _840;
    float _1094 = _976 * _840;
    float _1096 = _1012 * _840;
    float _1098 = _978 * _840;
    float _1100 = _980 * _840;
    float2 _4371 = float2(_1070, _1086);
    float _1102 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4371, float2(0.0), isnan(_4371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4371, float2(0.0), isnan(_4371)), level(0.0)).x;
    float2 _4379 = float2(_1074, _1090);
    float _1104 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4379, float2(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4379, float2(0.0), isnan(_4379)), level(0.0)).x;
    float2 _4387 = float2(_1088, _1094);
    float _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4387, float2(0.0), isnan(_4387)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4387, float2(0.0), isnan(_4387)), level(0.0)).x;
    float2 _4395 = float2(_1092, _1098);
    float _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4395, float2(0.0), isnan(_4395)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4395, float2(0.0), isnan(_4395)), level(0.0)).x;
    float2 _4403 = float2(_1096, _1100);
    float _1110 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4403, float2(0.0), isnan(_4403)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4403, float2(0.0), isnan(_4403)), level(0.0)).x;
    float _1112 = -_770;
    float _1114 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _640);
    float _1116 = -_772;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _656);
    float _1120 = in.m_47.x;
    float _1122 = in.m_47.y;
    float _1124 = -_780;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _1128 = _1114 * _1114;
    float _1130 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _208);
    float _1132 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _200);
    float _1134 = fma(_1118, _1118, _1128);
    bool _1136 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1138 = isnan(0.5);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1144 = _1140 || _1142;
    float _1146 = fma(_1126, _1126, _1134);
    float _1148 = sqrt(_1146);
    float _1150 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1152 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1154 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1156 = _728 * _1148;
    float _1158 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1160 = _1156 * _1154;
    float _1162 = _1156 * _1158;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1166 = _1164 * 0.5;
    float _1168 = _1130 * _1162;
    float _1170 = _1132 * _1160;
    float _1172 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1174 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1172);
    float _1180 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1174);
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1184 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1178);
    float _1186 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1180);
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    float _1190 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1192 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1194 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1196 = _778 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1198 = _652 + _1190;
    float _1200 = _636 + _1192;
    float _1202 = _562 + _1194;
    float _1204 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1196);
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1208 = _1198 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1212 = _1200 + _1210;
    float _1214 = _1208 * _1208;
    float _1216 = fma(_1212, _1212, _1214);
    float _1218 = sqrt(_1216);
    bool _1220 = _1218 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = _1166;
    float _1224 = _1194;
    float _1226 = _1202;
    if (!_1220)
    {
        _1222 = _1200;
    }
    float _1228 = _1222;
    float _1230 = _1228;
    if (!_1220)
    {
        _1224 = _1198;
    }
    float _1232 = _1224;
    bool _1234 = !_1220;
    float _1236 = _1232;
    if (!_1234)
    {
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1242 = _1218 + _1240;
        float _1244 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = rsqrt(_1216);
        float _1248 = _1242 * _1238;
        float _1250 = _1248 * 0.15915493667125701904296875;
        float _1252 = _1250 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = _1250 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = _1254 + (-1.0);
        float _1262 = fma(_1258, _1244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1264 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = _1246 * _1262;
        float _1268 = fma(_1202, _1254, _1264);
        float _1270 = fma(_1212, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1272 = fma(_1208, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1230 = _1270;
        _1236 = _1272;
        _1226 = _1268;
    }
    float _1274 = _1230;
    float _1276 = _1236;
    float _1278 = _1226;
    float _1280 = -_772;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1284 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1204);
    float _1286 = -_780;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1276);
    float _1290 = -_770;
    float _1292 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1278);
    float _1294 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1296 = _1292;
    float _1298 = _1288;
    if (_1144)
    {
        _810 = _1282;
    }
    float _1300 = _810;
    float _1302 = _1300;
    if (!_1144)
    {
        float _1304 = _788 * _788;
        float _1306 = 1.0 / _1156;
        float _1308 = -_652;
        float _1310 = _1308 + _1276;
        float _1312 = fma(_796, _796, _1304);
        float _1314 = fma(_802, _802, _1312);
        float _1316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1318 = sqrt(_1314);
        float _1320 = precise::min(_1318, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1322 = _1320 * _1316;
        float _1324 = -_636;
        float _1326 = _1324 + _1274;
        float _1328 = _1322 * _1306;
        float _1330 = -_562;
        float _1332 = _1330 + _1278;
        float _1334 = fma(_1326, _1328, _784);
        float _1336 = fma(_1332, _1328, _778);
        float _1338 = fma(_1310, _1328, _792);
        _1296 = _1336;
        _1302 = _1334;
        _1298 = _1338;
    }
    float _1340 = _1296;
    float _1342 = _1302;
    float _1344 = _1298;
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1348 = _1294 + _834;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1354 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1346);
    float _1356 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1350);
    float _1360 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1352);
    float _1362 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1356);
    float _1366 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1358);
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1360);
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1372 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1364);
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1382 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1378);
    float _1388 = _1348 * _840;
    float _1390 = _1388 * 0.5;
    float _1392 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1382);
    float _1394 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1396 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1380);
    float _1398 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1400 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1386);
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1402);
    float _1406 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1392);
    float _1408 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1396);
    float _1410 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1394);
    float _1412 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1400);
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1416 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1414);
    float _1418 = 1.0 / _1404;
    float _1420 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1410);
    float _1422 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1408);
    float _1424 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1428 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1426);
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1432 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1430);
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1436 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1434);
    float _1438 = _1412 + _1420;
    float _1440 = 1.0 / _1416;
    out.gl_Position.x = _1422;
    out.gl_Position.y = _1424;
    out.gl_Position.z = _1412;
    out.gl_Position.w = _1420;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1444 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1442);
    float _1446 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1448 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1446);
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1452 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1450);
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1456 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1454);
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1460 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1458);
    float _1462 = 1.0 / _1432;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1466 = _1418 * _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1470 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1468);
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1474 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1472);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1478 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1476);
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1482 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1480);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1486 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1484);
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1490 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1488);
    float _1492 = 1.0 / _1428;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1496 = -_1466;
    float _1498 = fma(_1440, _1494, _1496);
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1502 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1500);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1506 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1504);
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1510 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1508);
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1514 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1512);
    bool _1516 = _1498 >= 0.0;
    bool _1518 = isnan(_1498);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan(0.0);
    bool _1524 = _1520 || _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1528 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1526);
    float _1530 = 1.0 / _1436;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1534 = -_1466;
    float _1536 = fma(_1462, _1532, _1534);
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1540 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1538);
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1544 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1542);
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1548 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1546);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1552 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1550);
    bool _1554 = _1536 >= 0.0;
    bool _1556 = isnan(_1536);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan(0.0);
    bool _1562 = _1558 || _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1566 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1564);
    float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1570 = -_1466;
    float _1572 = fma(_1492, _1568, _1570);
    float _1574 = 1.0 / _1444;
    bool _1576 = !_1562;
    float _1578 = _1576 ? 0.0 : 2.0;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1582 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1586 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1584);
    bool _1588 = _1572 >= 0.0;
    bool _1590 = isnan(_1572);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan(0.0);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1602 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1600);
    bool _1604 = !_1524;
    float _1606 = _1604 ? 0.0 : 2.0;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1610 = -_1466;
    float _1612 = fma(_1530, _1608, _1610);
    float _1614 = 1.0 / _1452;
    float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1618 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1616);
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1622 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1620);
    float _1624 = _1606 + _1598;
    bool _1626 = _1612 >= 0.0;
    bool _1628 = isnan(_1612);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan(0.0);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1640 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1638);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1644 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1642);
    float _1646 = _1624 + _1578;
    float _1648 = 1.0 / _1448;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1652 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1650);
    float _1654 = _1438 * 0.5;
    float _1656 = _1646 + _1636;
    float _1658 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1660 = -_1466;
    float _1662 = fma(_1574, _1658, _1660);
    out.m_55.z = _1654;
    out.m_55.w = _1420;
    float _1664 = 1.0 / _1460;
    bool _1666 = _1662 >= 0.0;
    bool _1668 = isnan(_1662);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.0);
    bool _1674 = _1670 || _1672;
    float _1676 = float(_1674);
    float _1678 = _1656 + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1682 = -_1466;
    float _1684 = fma(_1614, _1680, _1682);
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1688 = -_1466;
    float _1690 = fma(_1648, _1686, _1688);
    float _1692 = 1.0 / _1474;
    bool _1694 = _1684 >= 0.0;
    bool _1696 = isnan(_1684);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan(0.0);
    bool _1702 = _1698 || _1700;
    bool _1704 = _1690 >= 0.0;
    bool _1706 = isnan(_1690);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(0.0);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    bool _1716 = !_1702;
    float _1718 = _1716 ? 0.0 : 2.0;
    float _1720 = 1.0 / _1456;
    float _1722 = _1678 + _1718;
    float _1724 = _1722 + _1714;
    float _1726 = 1.0 / _1486;
    float _1728 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1730 = -_1466;
    float _1732 = fma(_1720, _1728, _1730);
    float _1734 = 1.0 / _1490;
    bool _1736 = _1732 >= 0.0;
    bool _1738 = isnan(_1732);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan(0.0);
    bool _1744 = _1740 || _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1748 = -_1466;
    float _1750 = fma(_1664, _1746, _1748);
    float _1752 = 1.0 / _1470;
    bool _1754 = _1750 >= 0.0;
    bool _1756 = isnan(_1750);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    bool _1764 = !_1744;
    float _1766 = _1764 ? 0.0 : 2.0;
    bool _1768 = !_1762;
    float _1770 = _1768 ? 0.0 : 2.0;
    float _1772 = 1.0 / _1506;
    float _1774 = _1724 + _1766;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1778 = -_1466;
    float _1780 = fma(_1726, _1776, _1778);
    float _1782 = _1774 + _1770;
    bool _1784 = _1780 >= 0.0;
    bool _1786 = isnan(_1780);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan(0.0);
    bool _1792 = _1788 || _1790;
    float _1794 = float(_1792);
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1798 = -_1466;
    float _1800 = fma(_1752, _1796, _1798);
    float _1802 = 1.0 / _1540;
    bool _1804 = _1800 >= 0.0;
    bool _1806 = isnan(_1800);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(0.0);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = 1.0 / _1478;
    float _1818 = _1782 + _1814;
    float _1820 = 1.0 / _1544;
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1824 = -_1466;
    float _1826 = fma(_1816, _1822, _1824);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1830 = -_1466;
    float _1832 = fma(_1692, _1828, _1830);
    float _1834 = 1.0 / _1548;
    bool _1836 = _1826 >= 0.0;
    bool _1838 = isnan(_1826);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan(0.0);
    bool _1844 = _1840 || _1842;
    bool _1846 = _1832 >= 0.0;
    bool _1848 = isnan(_1832);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan(0.0);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    bool _1858 = !_1844;
    float _1860 = _1858 ? 0.0 : 2.0;
    float _1862 = 1.0 / _1482;
    float _1864 = _1818 + _1860;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1868 = -_1466;
    float _1870 = fma(_1734, _1866, _1868);
    float _1872 = _1864 + _1856;
    float _1874 = 1.0 / _1552;
    bool _1876 = _1870 >= 0.0;
    bool _1878 = isnan(_1870);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(0.0);
    bool _1884 = _1880 || _1882;
    float _1886 = _1872 + _1794;
    bool _1888 = !_1884;
    float _1890 = _1888 ? 0.0 : 2.0;
    float _1892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1894 = -_1466;
    float _1896 = fma(_1862, _1892, _1894);
    float _1898 = 1.0 / _1566;
    float _1900 = _1886 + _1890;
    bool _1902 = _1896 >= 0.0;
    bool _1904 = isnan(_1896);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.0);
    bool _1910 = _1906 || _1908;
    float _1912 = float(_1910);
    float _1914 = 1.0 / _1502;
    float _1916 = _1900 + _1912;
    float _1918 = 1.0 / _1582;
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1922 = -_1466;
    float _1924 = fma(_1914, _1920, _1922);
    float _1926 = 1.0 / _1602;
    bool _1928 = _1924 >= 0.0;
    bool _1930 = isnan(_1924);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(0.0);
    bool _1936 = _1932 || _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1940 = -_1466;
    float _1942 = fma(_1772, _1938, _1940);
    float _1944 = 1.0 / _1510;
    bool _1946 = _1942 >= 0.0;
    bool _1948 = isnan(_1942);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan(0.0);
    bool _1954 = _1950 || _1952;
    bool _1956 = !_1936;
    float _1958 = _1956 ? 0.0 : 2.0;
    bool _1960 = !_1954;
    float _1962 = _1960 ? 0.0 : 2.0;
    float _1964 = 1.0 / _1618;
    float _1966 = _1916 + _1958;
    float _1968 = _1966 + _1962;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1972 = -_1466;
    float _1974 = fma(_1944, _1970, _1972);
    float _1976 = 1.0 / _1622;
    bool _1978 = _1974 >= 0.0;
    bool _1980 = isnan(_1974);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan(0.0);
    bool _1986 = _1982 || _1984;
    float _1988 = float(_1986);
    float _1990 = 1.0 / _1514;
    float _1992 = _1968 + _1988;
    float _1994 = 1.0 / _1640;
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1998 = -_1466;
    float _2000 = fma(_1990, _1996, _1998);
    float _2002 = 1.0 / _1644;
    bool _2004 = _2000 >= 0.0;
    bool _2006 = isnan(_2000);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.0);
    bool _2012 = _2008 || _2010;
    float _2014 = 1.0 / _1528;
    bool _2016 = !_2012;
    float _2018 = _2016 ? 0.0 : 2.0;
    float _2020 = _1992 + _2018;
    float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2024 = -_1466;
    float _2026 = fma(_1802, _2022, _2024);
    float _2028 = 1.0 / _1652;
    bool _2030 = _2026 >= 0.0;
    bool _2032 = isnan(_2026);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan(0.0);
    bool _2038 = _2034 || _2036;
    float _2040 = float(_2038);
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2044 = -_1466;
    float _2046 = fma(_2014, _2042, _2044);
    bool _2048 = _2046 >= 0.0;
    bool _2050 = isnan(_2046);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan(0.0);
    bool _2056 = _2052 || _2054;
    float _2058 = float(_2056);
    float _2060 = 1.0 / _1586;
    float _2062 = _2020 + _2058;
    float _2064 = _2062 + _2040;
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2068 = -_1466;
    float _2070 = fma(_1820, _2066, _2068);
    bool _2072 = _2070 >= 0.0;
    bool _2074 = isnan(_2070);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2084 = -_1466;
    float _2086 = fma(_2060, _2082, _2084);
    bool _2088 = !_2080;
    float _2090 = _2088 ? 0.0 : 2.0;
    bool _2092 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2094 = isnan(0.5);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2100 = _2096 || _2098;
    bool _2102 = _2086 >= 0.0;
    bool _2104 = isnan(_2086);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan(0.0);
    bool _2110 = _2106 || _2108;
    float _2112 = float(_2110);
    float _2114 = _2064 + _2090;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2118 = -_1466;
    float _2120 = fma(_1834, _2116, _2118);
    float _2122 = _2114 + _2112;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2126 = -_1466;
    float _2128 = fma(_1926, _2124, _2126);
    bool _2130 = _2120 >= 0.0;
    bool _2132 = isnan(_2120);
    bool _2134 = _2130 || _2132;
    bool _2136 = isnan(0.0);
    bool _2138 = _2134 || _2136;
    float _2140 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2142 = -_1466;
    float _2144 = fma(_1874, _2140, _2142);
    float _2146 = _1510;
    float _2148 = _1448;
    float _2150 = _1466;
    if (!_2100)
    {
        _192 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2152 = _192;
    float _2154 = _2152;
    if (!_2100)
    {
        float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2158 = _1466 + _2156;
        _2146 = _2158;
    }
    float _2160 = _2146;
    bool _2162 = _2144 >= 0.0;
    bool _2164 = isnan(_2144);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan(0.0);
    bool _2170 = _2166 || _2168;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2174 = -_1466;
    float _2176 = fma(_1898, _2172, _2174);
    if (!_2100)
    {
        _2148 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2178 = _2148;
    float _2180 = _2178;
    if (!_2100)
    {
        float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2184 = _2152 + _2182;
        _2154 = _2184;
    }
    float _2186 = _2154;
    bool _2188 = _2176 >= 0.0;
    bool _2190 = isnan(_2176);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan(0.0);
    bool _2196 = _2192 || _2194;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2200 = -_1466;
    float _2202 = fma(_1918, _2198, _2200);
    float _2204 = _1482;
    if (!_2100)
    {
        float _2206 = 1.0 / _2186;
        _2204 = _2206;
    }
    float _2208 = _2204;
    if (!_2100)
    {
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2212 = _2178 + _2210;
        _2180 = _2212;
    }
    float _2214 = _2180;
    bool _2216 = !_2196;
    float _2218 = _2216 ? 0.0 : 3.0;
    bool _2220 = _2202 >= 0.0;
    bool _2222 = isnan(_2202);
    bool _2224 = _2220 || _2222;
    bool _2226 = isnan(0.0);
    bool _2228 = _2224 || _2226;
    bool _2230 = !_2170;
    float _2232 = _2230 ? 0.0 : 3.0;
    bool _2234 = _2128 >= 0.0;
    bool _2236 = isnan(_2128);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan(0.0);
    bool _2242 = _2238 || _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2246 = -_1466;
    float _2248 = fma(_1976, _2244, _2246);
    bool _2250 = !_2228;
    float _2252 = _2250 ? 0.0 : 3.0;
    float _2254 = _2232 + _2218;
    bool _2256 = !_2138;
    float _2258 = _2256 ? 0.0 : 2.0;
    float _2260 = _2214;
    if (!_2100)
    {
        float _2262 = 1.0 / _2214;
        _2260 = _2262;
    }
    float _2264 = _2260;
    bool _2266 = !_2242;
    float _2268 = _2266 ? 0.0 : 3.0;
    float _2270 = _2254 + _2252;
    float _2272 = _2122 + _2258;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2276 = -_1466;
    float _2278 = fma(_1964, _2274, _2276);
    float _2280 = _2270 + _2268;
    bool _2282 = _2278 >= 0.0;
    bool _2284 = isnan(_2278);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(0.0);
    bool _2290 = _2286 || _2288;
    float _2292 = _2278;
    float _2294 = _2272;
    if (_2100)
    {
        _2292 = 1.0;
    }
    float _2296 = _2292;
    float _2298 = _2296;
    if (!_2100)
    {
        float _2300 = _2160 * _2208;
        float _2302 = precise::clamp(_2300, 0.0, 1.0);
        _2298 = _2302;
    }
    float _2304 = _2298;
    bool _2306 = !_2290;
    float _2308 = _2306 ? 0.0 : 3.0;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2312 = -_1466;
    float _2314 = fma(_1994, _2310, _2312);
    bool _2316 = _2248 >= 0.0;
    bool _2318 = isnan(_2248);
    bool _2320 = _2316 || _2318;
    bool _2322 = isnan(0.0);
    bool _2324 = _2320 || _2322;
    float _2326 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2328 = -_1466;
    float _2330 = fma(_2002, _2326, _2328);
    float _2332 = _2280 + _2308;
    bool _2334 = _2314 >= 0.0;
    bool _2336 = isnan(_2314);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan(0.0);
    bool _2342 = _2338 || _2340;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2346 = -_1466;
    float _2348 = fma(_2028, _2344, _2346);
    bool _2350 = !_2324;
    float _2352 = _2350 ? 0.0 : 3.0;
    if (!_2100)
    {
        float _2354 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2356 = _1466 + _2354;
        _2150 = _2356;
    }
    float _2358 = _2150;
    bool _2360 = _2330 >= 0.0;
    bool _2362 = isnan(_2330);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan(0.0);
    bool _2368 = _2364 || _2366;
    bool _2370 = !_2342;
    float _2372 = _2370 ? 0.0 : 3.0;
    float _2374 = _2332 + _2352;
    bool _2376 = _2348 >= 0.0;
    bool _2378 = isnan(_2348);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.0);
    bool _2384 = _2380 || _2382;
    float _2386 = _2358;
    if (!_2100)
    {
        float _2388 = _2358 * _2264;
        float _2390 = precise::clamp(_2388, 0.0, 1.0);
        _2386 = _2390;
    }
    float _2392 = _2386;
    bool _2394 = !_2368;
    float _2396 = _2394 ? 0.0 : 3.0;
    float _2398 = _2374 + _2372;
    bool _2400 = !_2384;
    float _2402 = _2400 ? 0.0 : 5.0;
    float _2404 = _2398 + _2396;
    float _2406 = _2272 * 0.02857142873108386993408203125;
    float _2408 = precise::clamp(_2406, 0.0, 1.0);
    if (_2100)
    {
        _2294 = 1.0;
    }
    float _2410 = _2294;
    float _2412 = _2410;
    if (!_2100)
    {
        float _2414 = -_2392;
        float _2416 = _2414 + 1.0;
        _2412 = _2416;
    }
    float _2418 = _2412;
    float _2420 = _2404 + _2402;
    bool _2422 = _2304 > 0.0;
    bool _2424 = isnan(_2304);
    bool _2426 = _2422 || _2424;
    bool _2428 = isnan(0.0);
    bool _2430 = _2426 || _2428;
    float _2432 = _2420 * 0.14285714924335479736328125;
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    bool _2436 = _2418 <= 0.0;
    bool _2438 = !_2430;
    bool _2440 = _2436 || _2438;
    float _2442 = _2408 * _2434;
    float _2444 = _2442 * _2304;
    float _2446 = _2444 * _2418;
    float _2448 = _2446 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2450 = _356 * _2448;
    float _2452 = _2450 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2452;
    if (!_2440)
    {
        return out;
    }
    float _2454 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_38.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2454;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_38 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    bool _376 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _69 = in.m_35.w;
    float _71 = trunc(_69);
    int _74 = int(_71);
    bool _78 = _74 >= 1;
    float _80 = 0.0;
    if (!_78)
    {
        _80 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _82 = _80;
    float _84 = _82;
    if (!_78)
    {
        out.m_38.x = 0.0;
    }
    int _86 = 0;
    if (!_78)
    {
        float _88 = _82 * 5.0;
        _86 = as_type<int>(_88);
    }
    int _90 = _86;
    if (!_78)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2510 = as_type<float>(_90);
        out.gl_Position.z = _2510;
    }
    if (!_78)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _92 = in.m_40.w;
    bool _94 = _92 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _96 = isnan(_92);
    bool _98 = _94 || _96;
    bool _100 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _102 = _98 || _100;
    float _104 = -_92;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _108 = 0.0;
    if (_102)
    {
        float _110 = float(_74);
        _108 = _110;
    }
    float _112 = _108;
    bool _114 = _106 >= _112;
    bool _116 = !_102;
    bool _118 = _114 || _116;
    if (_118)
    {
        _84 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _84;
    if (_118)
    {
        out.m_38.x = 0.0;
    }
    int _122 = 0;
    if (_118)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2578 = as_type<float>(_126);
        out.gl_Position.z = _2578;
    }
    if (_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_42.x;
    float _130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _132 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _134 = as_type<float>(int(gl_VertexIndex));
    bool _136 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _138 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _140 = _136 || _138;
    bool _142 = isnan(1.0);
    bool _144 = _140 || _142;
    float _146 = _132 * _130;
    float _148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[20].x, _146);
    float _150 = in.m_40.x;
    float _152 = in.m_40.y;
    float _154 = in.m_40.z;
    float _156 = _148 * 6.283185482025146484375;
    float _158 = floor(_148);
    int _160 = as_type<int>(_134) & 1;
    bool _162 = _160 != 0;
    int _164 = as_type<int>(_134) & 2;
    bool _166 = _164 != 0;
    float _168 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = _156 * 0.15915493667125701904296875;
    float _172 = 0.0;
    float _174 = _168;
    if (!_144)
    {
        float _176 = _168 * _168;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _184 = _182 != 0;
    float _186 = _170 * 6.283185482025146484375;
    float _188 = cos(_186);
    float _190 = _180;
    float _192 = 0.5;
    if (!_144)
    {
        float _194 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _194;
    }
    float _196 = _190;
    bool _198 = !_162;
    float _200 = _198 ? (-0.5) : 0.5;
    float _202 = -_158;
    float _204 = _148 + _202;
    bool _206 = !_166;
    float _208 = _206 ? (-0.5) : 0.5;
    bool _210 = !_144;
    float _212 = _196;
    if (!_210)
    {
        float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = log2(_214);
        float _218 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _220 = _218 + 1.0;
        float _222 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = _168 * _216;
        float _226 = 1.0 / _220;
        float _228 = _222 * 0.693147182464599609375;
        float _230 = exp2(_224);
        float _232 = 1.0 / _228;
        float _234 = _230 + (-1.0);
        float _236 = -_234;
        float _238 = fma(_236, _232, _168);
        float _240 = _238 * _226;
        float _242 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _242;
    }
    float _244 = _212;
    bool _246 = !_144;
    if (!_246)
    {
        float _248 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = log2(_248);
        float _252 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _254 = _252 + 1.0;
        float _256 = 1.0 / _254;
        float _258 = _168 * _250;
        float _260 = exp2(_258);
        float _262 = -_260;
        float _264 = _262 + 1.0;
        float _266 = _264 * _256;
        _174 = _266;
    }
    float _268 = _174;
    float _270 = in.m_47.w;
    int _272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _274 = _272 != 0;
    int _276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _278 = _276 != 0;
    float _280 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _282 = _204 < 0.5;
    float _284 = float(_282);
    float _286 = -_204;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = fma(_188, 0.5, 0.5);
    float _292 = in.m_35.x;
    float _294 = in.m_35.y;
    float _296 = in.m_35.z;
    bool _298 = !_274;
    int _300 = _298 ? 0 : 1;
    float _302 = -_284;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _306 = !_184;
    int _308 = _306 ? 0 : 1;
    float _310 = -_290;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _314 = abs(_300);
    float _316 = fma(_268, _150, _280);
    int _318 = abs(_308);
    float _320 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _322 = !_278;
    int _324 = _322 ? 0 : 1;
    float _326 = fma(_268, _152, _320);
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _330 = abs(_324);
    float _332 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _334 = float(_314);
    float _336 = float(_318);
    float _338 = fma(_268, _154, _332);
    float _340 = abs(_288);
    float _342 = _334 * _340;
    float _344 = fma(_338, _270, _296);
    float _346 = float(_330);
    float _348 = fma(_336, _312, _342);
    float _350 = fma(_316, _270, _292);
    float _352 = fma(_326, _270, _294);
    float _354 = abs(_304);
    float _356 = fma(_346, _354, _348);
    bool _358 = !_328;
    float _374;
    if (!_358)
    {
        float _360 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _362 = _128 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _364 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[11].y, _106);
        float _366 = _364 * _360;
        float _368 = floor(_366);
        float _370 = -_368;
        float _372 = _366 + _370;
        _374 = _372;
        _376 = true;
    }
    else
    {
        float _378 = float(_74);
        float _380 = 1.0 / _378;
        float _382 = _106 * _380;
        _374 = _382;
    }
    _376 = false;
    float _384 = _374;
    float _386 = in.m_42.y;
    float _388 = _352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _394 = _128 > 0.5;
    float _396 = _352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _400 = _398 != 0;
    float _402 = _352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _406 = _404 != 0;
    float _408 = 1.0 / _392;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _412 = _384 + _410;
    bool _414 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _416 = isnan(_384);
    bool _418 = _414 || _416;
    bool _420 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _422 = _418 || _420;
    float _424 = float(_422);
    float _426 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _396);
    float _428 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _388);
    bool _430 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _432 = isnan(_384);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = fma(_350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _448 = -_440;
    float _450 = _448 + 1.0;
    bool _452 = _386 > 0.5;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _460 = _458 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _462 = 1.0 / _446;
    bool _464 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _466 = isnan(_384);
    bool _468 = _464 || _466;
    bool _470 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _472 = _468 || _470;
    float _474 = float(_472);
    float _476 = _456 * _408;
    bool _478 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _480 = isnan(_384);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[4].z, _426);
    float _492 = fma(_476, _412, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _494 = -_424;
    float _496 = _494 + 1.0;
    float _498 = -_488;
    float _500 = _498 + 1.0;
    float _502 = 1.0 / _460;
    bool _504 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _506 = isnan(_384);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = _440 * _496;
    float _518 = _424 * _500;
    bool _520 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _522 = isnan(_384);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _536 = _384 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _538 = isnan(_384);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[5].z, _428);
    float _550 = _530 * _450;
    float _552 = -_530;
    float _554 = _552 + 1.0;
    float _556 = -_546;
    float _558 = _556 + 1.0;
    float _560 = 1.0 / _534;
    float _562 = _548 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _564 = _546 * _554;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _570 = -_514;
    float _572 = _570 + 1.0;
    float _574 = _514 * _558;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = _474 * _572;
    float _582 = 1.0 / _568;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _584;
    float _588 = _578 * _462;
    float _590 = _492 * _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _594 = _384 + _592;
    float _596 = -_474;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _604 = _586 * _502;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _608 = _384 + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _614 = fma(_588, _594, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _616 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _590);
    float _618 = 1.0 / _602;
    float _620 = fma(_604, _608, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _622 = _612 * _560;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _630 = _384 + _628;
    float _632 = fma(_614, _574, _616);
    float _634 = fma(_344, (*spvDescriptorSet0.vp_c10)._m0[6].z, _442);
    float _636 = _490 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _638 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _640 = _562 + _638;
    float _642 = _626 * _582;
    float _644 = fma(_622, _630, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _646 = fma(_620, _564, _632);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _650 = _384 + _648;
    float _652 = _634 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _656 = _636 + _654;
    float _658 = _640 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _660 = fma(_642, _650, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _662 = fma(_644, _550, _646);
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _666 = _652 + _664;
    float _668 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[28].x, _658);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _674 = fma(_660, _516, _662);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _678 = _384 + _676;
    float _680 = fma(_666, (*spvDescriptorSet0.vp_c8)._m0[28].z, _668);
    float _682 = _672 * _618;
    float _684 = -_200;
    int _686 = _394 ? as_type<int>(_684) : as_type<int>(_200);
    float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _690 = -_208;
    int _692 = _452 ? as_type<int>(_690) : as_type<int>(_208);
    float _694 = fma(_682, _678, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    bool _696 = _680 >= 0.0;
    float _698 = _640 * _640;
    bool _700 = !_400;
    float _702 = _700 ? _200 : as_type<float>(_686);
    float _704 = fma(_694, _518, _674);
    bool _706 = !_406;
    float _708 = _706 ? _208 : as_type<float>(_692);
    float _710 = fma(_656, _656, _698);
    float _712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _714 = _702 + 0.5;
    float _716 = -_708;
    float _718 = _716 + 0.5;
    float _720 = fma(_666, _666, _710);
    float _722 = _714 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _724 = _718 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _728 = rsqrt(_720);
    float _730 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[121].x, _704);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _734 = _698;
    if (_696)
    {
        _734 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _736 = _734;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _746 = _722 * _688;
    float _748 = _724 * _712;
    float _750 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _762 = as_type<int>(_736);
    if (_696)
    {
        float _764 = _736 * 5.0;
        _762 = as_type<int>(_764);
    }
    int _766 = _762;
    float _768 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_49.x = _746;
    out.m_49.y = _748;
    float _770 = _640 * _728;
    float _772 = _656 * _728;
    out.m_51.x = _754;
    out.m_51.y = _756;
    out.m_51.z = _758;
    float _774 = as_type<float>(_766);
    if (_696)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3610 = as_type<float>(_766);
        out.gl_Position.z = _3610;
    }
    out.m_53.x = _750;
    out.m_53.y = _752;
    out.m_53.z = _760;
    out.m_53.w = _768;
    if (_696)
    {
        out.m_38.x = 0.0;
    }
    if (_696)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _776 = -_770;
    float _778 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _562);
    float _780 = _666 * _728;
    float _782 = -_772;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _636);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _788 = _778 + _786;
    float _790 = -_780;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _652);
    float _794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _796 = _784 + _794;
    float _798 = _788 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _802 = _792 + _800;
    float _804 = fma(_796, (*spvDescriptorSet0.vp_c8)._m0[28].x, _798);
    float _806 = fma(_802, (*spvDescriptorSet0.vp_c8)._m0[28].z, _804);
    bool _808 = _806 >= 0.0;
    float _810 = _780;
    if (_808)
    {
        _774 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _812 = _774;
    int _814 = as_type<int>(_812);
    if (_808)
    {
        out.m_38.x = 0.0;
    }
    if (_808)
    {
        float _816 = _812 * 5.0;
        _814 = as_type<int>(_816);
    }
    int _818 = _814;
    if (_808)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3713 = as_type<float>(_818);
        out.gl_Position.z = _3713;
    }
    if (_808)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _820 = _778 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _822 = _778 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _824 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[11].x, _820);
    float _826 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[9].x, _822);
    float _828 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[11].z, _824);
    float _830 = _778 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _832 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[9].z, _826);
    float _834 = _828 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _836 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[8].x, _830);
    float _838 = _832 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _840 = 1.0 / _834;
    float _842 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[8].z, _836);
    float _844 = _834 * 0.5;
    float _846 = _842 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _848 = fma(_838, -0.5, _844);
    float _850 = _846 + _834;
    float _852 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _848);
    float _854 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _848);
    float _856 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _848);
    float _858 = _850 * 0.5;
    float _860 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _848);
    float _862 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _848);
    float _864 = _852 * _840;
    float _866 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _858);
    float _868 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _858);
    float _870 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _858);
    float _872 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _858);
    float _874 = _866 * _840;
    float _876 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _848);
    float _878 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _848);
    float _880 = _854 * _840;
    float _882 = _868 * _840;
    float _884 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _858);
    float _886 = _870 * _840;
    float _888 = _856 * _840;
    float _890 = _872 * _840;
    float _892 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _848);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _896 = _848 + _894;
    float _898 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _858);
    float _900 = _860 * _840;
    float _902 = _862 * _840;
    float _904 = _848 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _906 = _876 * _840;
    float _908 = _878 * _840;
    float2 _3900 = float2(_874, _880);
    float _910 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3900, float2(0.0), isnan(_3900)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3900, float2(0.0), isnan(_3900)), level(0.0)).x;
    float2 _3910 = float2(_882, _864);
    float _912 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3910, float2(0.0), isnan(_3910)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3910, float2(0.0), isnan(_3910)), level(0.0)).x;
    float2 _3918 = float2(_882, _888);
    float _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3918, float2(0.0), isnan(_3918)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3918, float2(0.0), isnan(_3918)), level(0.0)).x;
    float2 _3926 = float2(_886, _900);
    float _916 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3926, float2(0.0), isnan(_3926)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3926, float2(0.0), isnan(_3926)), level(0.0)).x;
    float2 _3934 = float2(_890, _906);
    float _918 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3934, float2(0.0), isnan(_3934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3934, float2(0.0), isnan(_3934)), level(0.0)).x;
    float _920 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _858);
    float _922 = _884 * _840;
    float _924 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _848);
    float _926 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _848);
    float _928 = _898 * _840;
    float _930 = _892 * _840;
    float _932 = _896 * _840;
    float _934 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _848);
    float _936 = _858 * _840;
    float _938 = _904 * _840;
    float _940 = _920 * _840;
    float2 _3983 = float2(_922, _902);
    float _942 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3983, float2(0.0), isnan(_3983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3983, float2(0.0), isnan(_3983)), level(0.0)).x;
    float2 _3991 = float2(_922, _908);
    float _944 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3991, float2(0.0), isnan(_3991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3991, float2(0.0), isnan(_3991)), level(0.0)).x;
    float2 _3999 = float2(_928, _930);
    float _946 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_3999, float2(0.0), isnan(_3999)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_3999, float2(0.0), isnan(_3999)), level(0.0)).x;
    float2 _4007 = float2(_936, _930);
    float _948 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4007, float2(0.0), isnan(_4007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4007, float2(0.0), isnan(_4007)), level(0.0)).x;
    float2 _4015 = float2(_936, _932);
    float _950 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4015, float2(0.0), isnan(_4015)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4015, float2(0.0), isnan(_4015)), level(0.0)).x;
    float2 _4023 = float2(_936, _938);
    float _952 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4023, float2(0.0), isnan(_4023)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4023, float2(0.0), isnan(_4023)), level(0.0)).x;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _956 = _858 + _954;
    float _958 = _848 * _840;
    float _960 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _848);
    float _962 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _848);
    float _964 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _848);
    float _966 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _848);
    float _968 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _848);
    float _970 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _848);
    float _972 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _848);
    float _974 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _848);
    float _976 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _848);
    float _978 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _848);
    float _980 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _848);
    float _982 = _924 * _840;
    float _984 = _926 * _840;
    float _986 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _858);
    float _988 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _858);
    float _990 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _858);
    float _992 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _858);
    float _994 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _858);
    float _996 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _858);
    float _998 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _858);
    float _1000 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _858);
    float _1002 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _858);
    float _1004 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _858);
    float _1006 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _858);
    float _1008 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _858);
    float _1010 = _934 * _840;
    float _1012 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _858);
    float _1014 = _858 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1016 = _956 * _840;
    float _1018 = _960 * _840;
    float2 _4163 = float2(_940, _982);
    float _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4163, float2(0.0), isnan(_4163)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4163, float2(0.0), isnan(_4163)), level(0.0)).x;
    float2 _4171 = float2(_936, _982);
    float _1022 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4171, float2(0.0), isnan(_4171)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4171, float2(0.0), isnan(_4171)), level(0.0)).x;
    float2 _4179 = float2(_936, _984);
    float _1024 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4179, float2(0.0), isnan(_4179)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4179, float2(0.0), isnan(_4179)), level(0.0)).x;
    float2 _4187 = float2(_936, _1010);
    float _1026 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4187, float2(0.0), isnan(_4187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4187, float2(0.0), isnan(_4187)), level(0.0)).x;
    float2 _4195 = float2(_936, _958);
    float _1028 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4195, float2(0.0), isnan(_4195)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4195, float2(0.0), isnan(_4195)), level(0.0)).x;
    float2 _4203 = float2(_1016, _958);
    float _1030 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4203, float2(0.0), isnan(_4203)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4203, float2(0.0), isnan(_4203)), level(0.0)).x;
    float _1032 = _962 * _840;
    float _1034 = _986 * _840;
    float _1036 = _1014 * _840;
    float _1038 = _988 * _840;
    float _1040 = _990 * _840;
    float2 _4226 = float2(_1034, _1018);
    float _1042 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4226, float2(0.0), isnan(_4226)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4226, float2(0.0), isnan(_4226)), level(0.0)).x;
    float2 _4234 = float2(_1034, _1032);
    float _1044 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4234, float2(0.0), isnan(_4234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4234, float2(0.0), isnan(_4234)), level(0.0)).x;
    float2 _4242 = float2(_1034, _958);
    float _1046 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4242, float2(0.0), isnan(_4242)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4242, float2(0.0), isnan(_4242)), level(0.0)).x;
    float2 _4250 = float2(_1036, _958);
    float _1048 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4250, float2(0.0), isnan(_4250)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4250, float2(0.0), isnan(_4250)), level(0.0)).x;
    float2 _4258 = float2(_1038, _958);
    float _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4258, float2(0.0), isnan(_4258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4258, float2(0.0), isnan(_4258)), level(0.0)).x;
    float2 _4266 = float2(_1040, _958);
    float _1052 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4266, float2(0.0), isnan(_4266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4266, float2(0.0), isnan(_4266)), level(0.0)).x;
    float _1054 = _994 * _840;
    float _1056 = _992 * _840;
    float _1058 = _996 * _840;
    float _1060 = _964 * _840;
    float _1062 = _998 * _840;
    float _1064 = _966 * _840;
    float _1066 = _1000 * _840;
    float _1068 = _968 * _840;
    float _1070 = _1002 * _840;
    float _1072 = _970 * _840;
    float _1074 = _1004 * _840;
    float2 _4307 = float2(_1056, _958);
    float _1076 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4307, float2(0.0), isnan(_4307)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4307, float2(0.0), isnan(_4307)), level(0.0)).x;
    float2 _4315 = float2(_1054, _1060);
    float _1078 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4315, float2(0.0), isnan(_4315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4315, float2(0.0), isnan(_4315)), level(0.0)).x;
    float2 _4323 = float2(_1058, _1064);
    float _1080 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4323, float2(0.0), isnan(_4323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4323, float2(0.0), isnan(_4323)), level(0.0)).x;
    float2 _4331 = float2(_1062, _1068);
    float _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4331, float2(0.0), isnan(_4331)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4331, float2(0.0), isnan(_4331)), level(0.0)).x;
    float2 _4339 = float2(_1066, _1072);
    float _1084 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4339, float2(0.0), isnan(_4339)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4339, float2(0.0), isnan(_4339)), level(0.0)).x;
    float _1086 = _972 * _840;
    float _1088 = _1006 * _840;
    float _1090 = _974 * _840;
    float _1092 = _1008 * _840;
    float _1094 = _976 * _840;
    float _1096 = _1012 * _840;
    float _1098 = _978 * _840;
    float _1100 = _980 * _840;
    float2 _4371 = float2(_1070, _1086);
    float _1102 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4371, float2(0.0), isnan(_4371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4371, float2(0.0), isnan(_4371)), level(0.0)).x;
    float2 _4379 = float2(_1074, _1090);
    float _1104 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4379, float2(0.0), isnan(_4379)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4379, float2(0.0), isnan(_4379)), level(0.0)).x;
    float2 _4387 = float2(_1088, _1094);
    float _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4387, float2(0.0), isnan(_4387)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4387, float2(0.0), isnan(_4387)), level(0.0)).x;
    float2 _4395 = float2(_1092, _1098);
    float _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4395, float2(0.0), isnan(_4395)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4395, float2(0.0), isnan(_4395)), level(0.0)).x;
    float2 _4403 = float2(_1096, _1100);
    float _1110 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_4403, float2(0.0), isnan(_4403)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_4403, float2(0.0), isnan(_4403)), level(0.0)).x;
    float _1112 = -_770;
    float _1114 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[18].w, _640);
    float _1116 = -_772;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[18].w, _656);
    float _1120 = in.m_47.x;
    float _1122 = in.m_47.y;
    float _1124 = -_780;
    float _1126 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[18].w, _666);
    float _1128 = _1114 * _1114;
    float _1130 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _208);
    float _1132 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _200);
    float _1134 = fma(_1118, _1118, _1128);
    bool _1136 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1138 = isnan(0.5);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1144 = _1140 || _1142;
    float _1146 = fma(_1126, _1126, _1134);
    float _1148 = sqrt(_1146);
    float _1150 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1152 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1154 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1156 = _728 * _1148;
    float _1158 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1160 = _1156 * _1154;
    float _1162 = _1156 * _1158;
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1166 = _1164 * 0.5;
    float _1168 = _1130 * _1162;
    float _1170 = _1132 * _1160;
    float _1172 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1174 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1178 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1172);
    float _1180 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1174);
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1176);
    float _1184 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1178);
    float _1186 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1180);
    float _1188 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1182);
    float _1190 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1192 = _1186 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1194 = _1188 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1196 = _778 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1198 = _652 + _1190;
    float _1200 = _636 + _1192;
    float _1202 = _562 + _1194;
    float _1204 = fma(_784, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1196);
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1208 = _1198 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1212 = _1200 + _1210;
    float _1214 = _1208 * _1208;
    float _1216 = fma(_1212, _1212, _1214);
    float _1218 = sqrt(_1216);
    bool _1220 = _1218 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1222 = _1166;
    float _1224 = _1194;
    float _1226 = _1202;
    if (!_1220)
    {
        _1222 = _1200;
    }
    float _1228 = _1222;
    float _1230 = _1228;
    if (!_1220)
    {
        _1224 = _1198;
    }
    float _1232 = _1224;
    bool _1234 = !_1220;
    float _1236 = _1232;
    if (!_1234)
    {
        float _1238 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1242 = _1218 + _1240;
        float _1244 = _1202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = rsqrt(_1216);
        float _1248 = _1242 * _1238;
        float _1250 = _1248 * 0.15915493667125701904296875;
        float _1252 = _1250 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = _1250 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = _1254 + (-1.0);
        float _1262 = fma(_1258, _1244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1264 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = _1246 * _1262;
        float _1268 = fma(_1202, _1254, _1264);
        float _1270 = fma(_1212, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1272 = fma(_1208, _1266, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1230 = _1270;
        _1236 = _1272;
        _1226 = _1268;
    }
    float _1274 = _1230;
    float _1276 = _1236;
    float _1278 = _1226;
    float _1280 = -_772;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1284 = fma(_792, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1204);
    float _1286 = -_780;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1276);
    float _1290 = -_770;
    float _1292 = fma(_1290, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1278);
    float _1294 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1296 = _1292;
    float _1298 = _1288;
    if (_1144)
    {
        _810 = _1282;
    }
    float _1300 = _810;
    float _1302 = _1300;
    if (!_1144)
    {
        float _1304 = _788 * _788;
        float _1306 = 1.0 / _1156;
        float _1308 = -_652;
        float _1310 = _1308 + _1276;
        float _1312 = fma(_796, _796, _1304);
        float _1314 = fma(_802, _802, _1312);
        float _1316 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1318 = sqrt(_1314);
        float _1320 = precise::min(_1318, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1322 = _1320 * _1316;
        float _1324 = -_636;
        float _1326 = _1324 + _1274;
        float _1328 = _1322 * _1306;
        float _1330 = -_562;
        float _1332 = _1330 + _1278;
        float _1334 = fma(_1326, _1328, _784);
        float _1336 = fma(_1332, _1328, _778);
        float _1338 = fma(_1310, _1328, _792);
        _1296 = _1336;
        _1302 = _1334;
        _1298 = _1338;
    }
    float _1340 = _1296;
    float _1342 = _1302;
    float _1344 = _1298;
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1348 = _1294 + _834;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1352 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1354 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1346);
    float _1356 = _1340 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1358 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1350);
    float _1360 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1352);
    float _1362 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1354);
    float _1364 = fma(_1342, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1356);
    float _1366 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1358);
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1360);
    float _1370 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1372 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1364);
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1376 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1378 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1380 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1382 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1378);
    float _1388 = _1348 * _840;
    float _1390 = _1388 * 0.5;
    float _1392 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1382);
    float _1394 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1396 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1380);
    float _1398 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1400 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1386);
    float _1402 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1404 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1402);
    float _1406 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1392);
    float _1408 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1396);
    float _1410 = fma(_1376, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1394);
    float _1412 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1400);
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1416 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1414);
    float _1418 = 1.0 / _1404;
    float _1420 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1410);
    float _1422 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1408);
    float _1424 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1406);
    float _1426 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1428 = fma(_1030, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1426);
    float _1430 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1432 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1430);
    float _1434 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1436 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1434);
    float _1438 = _1412 + _1420;
    float _1440 = 1.0 / _1416;
    out.gl_Position.x = _1422;
    out.gl_Position.y = _1424;
    out.gl_Position.z = _1412;
    out.gl_Position.w = _1420;
    float _1442 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1444 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1442);
    float _1446 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1448 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1446);
    float _1450 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1452 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1450);
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1456 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1454);
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1460 = fma(_910, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1458);
    float _1462 = 1.0 / _1432;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1466 = _1418 * _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1470 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1468);
    float _1472 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1474 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1472);
    float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1478 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1476);
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1482 = fma(_1046, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1480);
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1486 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1484);
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1490 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1488);
    float _1492 = 1.0 / _1428;
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1496 = -_1466;
    float _1498 = fma(_1440, _1494, _1496);
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1502 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1500);
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1506 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1504);
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1510 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1508);
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1514 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1512);
    bool _1516 = _1498 >= 0.0;
    bool _1518 = isnan(_1498);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan(0.0);
    bool _1524 = _1520 || _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1528 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1526);
    float _1530 = 1.0 / _1436;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1534 = -_1466;
    float _1536 = fma(_1462, _1532, _1534);
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1540 = fma(_1026, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1538);
    float _1542 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1544 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1542);
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1548 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1546);
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1552 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1550);
    bool _1554 = _1536 >= 0.0;
    bool _1556 = isnan(_1536);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan(0.0);
    bool _1562 = _1558 || _1560;
    float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1566 = fma(_1082, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1564);
    float _1568 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1570 = -_1466;
    float _1572 = fma(_1492, _1568, _1570);
    float _1574 = 1.0 / _1444;
    bool _1576 = !_1562;
    float _1578 = _1576 ? 0.0 : 2.0;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1582 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1586 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1584);
    bool _1588 = _1572 >= 0.0;
    bool _1590 = isnan(_1572);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan(0.0);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1602 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1600);
    bool _1604 = !_1524;
    float _1606 = _1604 ? 0.0 : 2.0;
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1610 = -_1466;
    float _1612 = fma(_1530, _1608, _1610);
    float _1614 = 1.0 / _1452;
    float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1618 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1616);
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1622 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1620);
    float _1624 = _1606 + _1598;
    bool _1626 = _1612 >= 0.0;
    bool _1628 = isnan(_1612);
    bool _1630 = _1626 || _1628;
    bool _1632 = isnan(0.0);
    bool _1634 = _1630 || _1632;
    float _1636 = float(_1634);
    float _1638 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1640 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1638);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1644 = fma(_1110, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1642);
    float _1646 = _1624 + _1578;
    float _1648 = 1.0 / _1448;
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1652 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1650);
    float _1654 = _1438 * 0.5;
    float _1656 = _1646 + _1636;
    float _1658 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1660 = -_1466;
    float _1662 = fma(_1574, _1658, _1660);
    out.m_55.z = _1654;
    out.m_55.w = _1420;
    float _1664 = 1.0 / _1460;
    bool _1666 = _1662 >= 0.0;
    bool _1668 = isnan(_1662);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.0);
    bool _1674 = _1670 || _1672;
    float _1676 = float(_1674);
    float _1678 = _1656 + _1676;
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1682 = -_1466;
    float _1684 = fma(_1614, _1680, _1682);
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1688 = -_1466;
    float _1690 = fma(_1648, _1686, _1688);
    float _1692 = 1.0 / _1474;
    bool _1694 = _1684 >= 0.0;
    bool _1696 = isnan(_1684);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan(0.0);
    bool _1702 = _1698 || _1700;
    bool _1704 = _1690 >= 0.0;
    bool _1706 = isnan(_1690);
    bool _1708 = _1704 || _1706;
    bool _1710 = isnan(0.0);
    bool _1712 = _1708 || _1710;
    float _1714 = float(_1712);
    bool _1716 = !_1702;
    float _1718 = _1716 ? 0.0 : 2.0;
    float _1720 = 1.0 / _1456;
    float _1722 = _1678 + _1718;
    float _1724 = _1722 + _1714;
    float _1726 = 1.0 / _1486;
    float _1728 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1730 = -_1466;
    float _1732 = fma(_1720, _1728, _1730);
    float _1734 = 1.0 / _1490;
    bool _1736 = _1732 >= 0.0;
    bool _1738 = isnan(_1732);
    bool _1740 = _1736 || _1738;
    bool _1742 = isnan(0.0);
    bool _1744 = _1740 || _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1748 = -_1466;
    float _1750 = fma(_1664, _1746, _1748);
    float _1752 = 1.0 / _1470;
    bool _1754 = _1750 >= 0.0;
    bool _1756 = isnan(_1750);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan(0.0);
    bool _1762 = _1758 || _1760;
    bool _1764 = !_1744;
    float _1766 = _1764 ? 0.0 : 2.0;
    bool _1768 = !_1762;
    float _1770 = _1768 ? 0.0 : 2.0;
    float _1772 = 1.0 / _1506;
    float _1774 = _1724 + _1766;
    float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1778 = -_1466;
    float _1780 = fma(_1726, _1776, _1778);
    float _1782 = _1774 + _1770;
    bool _1784 = _1780 >= 0.0;
    bool _1786 = isnan(_1780);
    bool _1788 = _1784 || _1786;
    bool _1790 = isnan(0.0);
    bool _1792 = _1788 || _1790;
    float _1794 = float(_1792);
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1798 = -_1466;
    float _1800 = fma(_1752, _1796, _1798);
    float _1802 = 1.0 / _1540;
    bool _1804 = _1800 >= 0.0;
    bool _1806 = isnan(_1800);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(0.0);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = 1.0 / _1478;
    float _1818 = _1782 + _1814;
    float _1820 = 1.0 / _1544;
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1824 = -_1466;
    float _1826 = fma(_1816, _1822, _1824);
    float _1828 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1830 = -_1466;
    float _1832 = fma(_1692, _1828, _1830);
    float _1834 = 1.0 / _1548;
    bool _1836 = _1826 >= 0.0;
    bool _1838 = isnan(_1826);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan(0.0);
    bool _1844 = _1840 || _1842;
    bool _1846 = _1832 >= 0.0;
    bool _1848 = isnan(_1832);
    bool _1850 = _1846 || _1848;
    bool _1852 = isnan(0.0);
    bool _1854 = _1850 || _1852;
    float _1856 = float(_1854);
    bool _1858 = !_1844;
    float _1860 = _1858 ? 0.0 : 2.0;
    float _1862 = 1.0 / _1482;
    float _1864 = _1818 + _1860;
    float _1866 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1868 = -_1466;
    float _1870 = fma(_1734, _1866, _1868);
    float _1872 = _1864 + _1856;
    float _1874 = 1.0 / _1552;
    bool _1876 = _1870 >= 0.0;
    bool _1878 = isnan(_1870);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(0.0);
    bool _1884 = _1880 || _1882;
    float _1886 = _1872 + _1794;
    bool _1888 = !_1884;
    float _1890 = _1888 ? 0.0 : 2.0;
    float _1892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1894 = -_1466;
    float _1896 = fma(_1862, _1892, _1894);
    float _1898 = 1.0 / _1566;
    float _1900 = _1886 + _1890;
    bool _1902 = _1896 >= 0.0;
    bool _1904 = isnan(_1896);
    bool _1906 = _1902 || _1904;
    bool _1908 = isnan(0.0);
    bool _1910 = _1906 || _1908;
    float _1912 = float(_1910);
    float _1914 = 1.0 / _1502;
    float _1916 = _1900 + _1912;
    float _1918 = 1.0 / _1582;
    float _1920 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1922 = -_1466;
    float _1924 = fma(_1914, _1920, _1922);
    float _1926 = 1.0 / _1602;
    bool _1928 = _1924 >= 0.0;
    bool _1930 = isnan(_1924);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(0.0);
    bool _1936 = _1932 || _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1940 = -_1466;
    float _1942 = fma(_1772, _1938, _1940);
    float _1944 = 1.0 / _1510;
    bool _1946 = _1942 >= 0.0;
    bool _1948 = isnan(_1942);
    bool _1950 = _1946 || _1948;
    bool _1952 = isnan(0.0);
    bool _1954 = _1950 || _1952;
    bool _1956 = !_1936;
    float _1958 = _1956 ? 0.0 : 2.0;
    bool _1960 = !_1954;
    float _1962 = _1960 ? 0.0 : 2.0;
    float _1964 = 1.0 / _1618;
    float _1966 = _1916 + _1958;
    float _1968 = _1966 + _1962;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1972 = -_1466;
    float _1974 = fma(_1944, _1970, _1972);
    float _1976 = 1.0 / _1622;
    bool _1978 = _1974 >= 0.0;
    bool _1980 = isnan(_1974);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan(0.0);
    bool _1986 = _1982 || _1984;
    float _1988 = float(_1986);
    float _1990 = 1.0 / _1514;
    float _1992 = _1968 + _1988;
    float _1994 = 1.0 / _1640;
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1998 = -_1466;
    float _2000 = fma(_1990, _1996, _1998);
    float _2002 = 1.0 / _1644;
    bool _2004 = _2000 >= 0.0;
    bool _2006 = isnan(_2000);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.0);
    bool _2012 = _2008 || _2010;
    float _2014 = 1.0 / _1528;
    bool _2016 = !_2012;
    float _2018 = _2016 ? 0.0 : 2.0;
    float _2020 = _1992 + _2018;
    float _2022 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2024 = -_1466;
    float _2026 = fma(_1802, _2022, _2024);
    float _2028 = 1.0 / _1652;
    bool _2030 = _2026 >= 0.0;
    bool _2032 = isnan(_2026);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan(0.0);
    bool _2038 = _2034 || _2036;
    float _2040 = float(_2038);
    float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2044 = -_1466;
    float _2046 = fma(_2014, _2042, _2044);
    bool _2048 = _2046 >= 0.0;
    bool _2050 = isnan(_2046);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan(0.0);
    bool _2056 = _2052 || _2054;
    float _2058 = float(_2056);
    float _2060 = 1.0 / _1586;
    float _2062 = _2020 + _2058;
    float _2064 = _2062 + _2040;
    float _2066 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2068 = -_1466;
    float _2070 = fma(_1820, _2066, _2068);
    bool _2072 = _2070 >= 0.0;
    bool _2074 = isnan(_2070);
    bool _2076 = _2072 || _2074;
    bool _2078 = isnan(0.0);
    bool _2080 = _2076 || _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2084 = -_1466;
    float _2086 = fma(_2060, _2082, _2084);
    bool _2088 = !_2080;
    float _2090 = _2088 ? 0.0 : 2.0;
    bool _2092 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2094 = isnan(0.5);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2100 = _2096 || _2098;
    bool _2102 = _2086 >= 0.0;
    bool _2104 = isnan(_2086);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan(0.0);
    bool _2110 = _2106 || _2108;
    float _2112 = float(_2110);
    float _2114 = _2064 + _2090;
    float _2116 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2118 = -_1466;
    float _2120 = fma(_1834, _2116, _2118);
    float _2122 = _2114 + _2112;
    float _2124 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2126 = -_1466;
    float _2128 = fma(_1926, _2124, _2126);
    bool _2130 = _2120 >= 0.0;
    bool _2132 = isnan(_2120);
    bool _2134 = _2130 || _2132;
    bool _2136 = isnan(0.0);
    bool _2138 = _2134 || _2136;
    float _2140 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2142 = -_1466;
    float _2144 = fma(_1874, _2140, _2142);
    float _2146 = _1510;
    float _2148 = _1448;
    float _2150 = _1466;
    if (!_2100)
    {
        _192 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2152 = _192;
    float _2154 = _2152;
    if (!_2100)
    {
        float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2158 = _1466 + _2156;
        _2146 = _2158;
    }
    float _2160 = _2146;
    bool _2162 = _2144 >= 0.0;
    bool _2164 = isnan(_2144);
    bool _2166 = _2162 || _2164;
    bool _2168 = isnan(0.0);
    bool _2170 = _2166 || _2168;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2174 = -_1466;
    float _2176 = fma(_1898, _2172, _2174);
    if (!_2100)
    {
        _2148 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2178 = _2148;
    float _2180 = _2178;
    if (!_2100)
    {
        float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2184 = _2152 + _2182;
        _2154 = _2184;
    }
    float _2186 = _2154;
    bool _2188 = _2176 >= 0.0;
    bool _2190 = isnan(_2176);
    bool _2192 = _2188 || _2190;
    bool _2194 = isnan(0.0);
    bool _2196 = _2192 || _2194;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2200 = -_1466;
    float _2202 = fma(_1918, _2198, _2200);
    float _2204 = _1482;
    if (!_2100)
    {
        float _2206 = 1.0 / _2186;
        _2204 = _2206;
    }
    float _2208 = _2204;
    if (!_2100)
    {
        float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2212 = _2178 + _2210;
        _2180 = _2212;
    }
    float _2214 = _2180;
    bool _2216 = !_2196;
    float _2218 = _2216 ? 0.0 : 3.0;
    bool _2220 = _2202 >= 0.0;
    bool _2222 = isnan(_2202);
    bool _2224 = _2220 || _2222;
    bool _2226 = isnan(0.0);
    bool _2228 = _2224 || _2226;
    bool _2230 = !_2170;
    float _2232 = _2230 ? 0.0 : 3.0;
    bool _2234 = _2128 >= 0.0;
    bool _2236 = isnan(_2128);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan(0.0);
    bool _2242 = _2238 || _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2246 = -_1466;
    float _2248 = fma(_1976, _2244, _2246);
    bool _2250 = !_2228;
    float _2252 = _2250 ? 0.0 : 3.0;
    float _2254 = _2232 + _2218;
    bool _2256 = !_2138;
    float _2258 = _2256 ? 0.0 : 2.0;
    float _2260 = _2214;
    if (!_2100)
    {
        float _2262 = 1.0 / _2214;
        _2260 = _2262;
    }
    float _2264 = _2260;
    bool _2266 = !_2242;
    float _2268 = _2266 ? 0.0 : 3.0;
    float _2270 = _2254 + _2252;
    float _2272 = _2122 + _2258;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2276 = -_1466;
    float _2278 = fma(_1964, _2274, _2276);
    float _2280 = _2270 + _2268;
    bool _2282 = _2278 >= 0.0;
    bool _2284 = isnan(_2278);
    bool _2286 = _2282 || _2284;
    bool _2288 = isnan(0.0);
    bool _2290 = _2286 || _2288;
    float _2292 = _2278;
    float _2294 = _2272;
    if (_2100)
    {
        _2292 = 1.0;
    }
    float _2296 = _2292;
    float _2298 = _2296;
    if (!_2100)
    {
        float _2300 = _2160 * _2208;
        float _2302 = precise::clamp(_2300, 0.0, 1.0);
        _2298 = _2302;
    }
    float _2304 = _2298;
    bool _2306 = !_2290;
    float _2308 = _2306 ? 0.0 : 3.0;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2312 = -_1466;
    float _2314 = fma(_1994, _2310, _2312);
    bool _2316 = _2248 >= 0.0;
    bool _2318 = isnan(_2248);
    bool _2320 = _2316 || _2318;
    bool _2322 = isnan(0.0);
    bool _2324 = _2320 || _2322;
    float _2326 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2328 = -_1466;
    float _2330 = fma(_2002, _2326, _2328);
    float _2332 = _2280 + _2308;
    bool _2334 = _2314 >= 0.0;
    bool _2336 = isnan(_2314);
    bool _2338 = _2334 || _2336;
    bool _2340 = isnan(0.0);
    bool _2342 = _2338 || _2340;
    float _2344 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2346 = -_1466;
    float _2348 = fma(_2028, _2344, _2346);
    bool _2350 = !_2324;
    float _2352 = _2350 ? 0.0 : 3.0;
    if (!_2100)
    {
        float _2354 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2356 = _1466 + _2354;
        _2150 = _2356;
    }
    float _2358 = _2150;
    bool _2360 = _2330 >= 0.0;
    bool _2362 = isnan(_2330);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan(0.0);
    bool _2368 = _2364 || _2366;
    bool _2370 = !_2342;
    float _2372 = _2370 ? 0.0 : 3.0;
    float _2374 = _2332 + _2352;
    bool _2376 = _2348 >= 0.0;
    bool _2378 = isnan(_2348);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan(0.0);
    bool _2384 = _2380 || _2382;
    float _2386 = _2358;
    if (!_2100)
    {
        float _2388 = _2358 * _2264;
        float _2390 = precise::clamp(_2388, 0.0, 1.0);
        _2386 = _2390;
    }
    float _2392 = _2386;
    bool _2394 = !_2368;
    float _2396 = _2394 ? 0.0 : 3.0;
    float _2398 = _2374 + _2372;
    bool _2400 = !_2384;
    float _2402 = _2400 ? 0.0 : 5.0;
    float _2404 = _2398 + _2396;
    float _2406 = _2272 * 0.02857142873108386993408203125;
    float _2408 = precise::clamp(_2406, 0.0, 1.0);
    if (_2100)
    {
        _2294 = 1.0;
    }
    float _2410 = _2294;
    float _2412 = _2410;
    if (!_2100)
    {
        float _2414 = -_2392;
        float _2416 = _2414 + 1.0;
        _2412 = _2416;
    }
    float _2418 = _2412;
    float _2420 = _2404 + _2402;
    bool _2422 = _2304 > 0.0;
    bool _2424 = isnan(_2304);
    bool _2426 = _2422 || _2424;
    bool _2428 = isnan(0.0);
    bool _2430 = _2426 || _2428;
    float _2432 = _2420 * 0.14285714924335479736328125;
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    bool _2436 = _2418 <= 0.0;
    bool _2438 = !_2430;
    bool _2440 = _2436 || _2438;
    float _2442 = _2408 * _2434;
    float _2444 = _2442 * _2304;
    float _2446 = _2444 * _2418;
    float _2448 = _2446 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2450 = _356 * _2448;
    float _2452 = _2450 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_38.x = _2452;
    if (!_2440)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2454 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_38.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2454;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_38.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_38.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_38.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_38.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

