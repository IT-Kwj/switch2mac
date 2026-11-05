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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_93 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_87 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2457 = false;
    bool _1900 = false;
    bool _530 = false;
    bool _316 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = in.m_48.w;
    float _111 = trunc(_107);
    int _114 = int(_111);
    float _116 = -_109;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _118;
    bool _122 = _114 >= 1;
    float _124 = 0.0;
    float _126 = _118;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    float _130 = _128;
    if (!_122)
    {
        out.m_53.x = 0.0;
    }
    int _132 = 0;
    if (!_122)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2751 = as_type<float>(_136);
        out.gl_Position.z = _2751;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _140 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_109);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = in.m_55.x;
    float _152 = float(_114);
    float _154 = in.m_55.y;
    bool _156 = _118 >= _152;
    bool _158 = !_148;
    bool _160 = _156 || _158;
    float _162 = 1.0 / _152;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _130;
    float _166 = _164;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _168 = _164 * 5.0;
        _138 = as_type<int>(_168);
    }
    int _170 = _138;
    float _172 = _118 * _162;
    out.m_57.x = _150;
    float _174 = _172;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2819 = as_type<float>(_170);
        out.gl_Position.z = _2819;
    }
    out.m_57.y = _154;
    out.m_51.x = _172;
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_59.w;
    float _178 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_48.x;
    float _192 = in.m_48.y;
    float _194 = in.m_48.z;
    float _196 = in.m_46.x;
    float _198 = in.m_46.y;
    float _200 = in.m_46.z;
    float _202 = _178;
    if (!_188)
    {
        float _204 = _178 * _178;
        float _206 = _204 * 0.5;
        _166 = _206;
    }
    float _208 = _166;
    float _210 = _208;
    if (!_188)
    {
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_188;
    float _218 = _214;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _178 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _178);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_188;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _178 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _202 = _272;
    }
    float _274 = _202;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _282 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _284 = fma(_274, _190, _278);
    float _286 = fma(_274, _192, _280);
    float _288 = fma(_274, _194, _282);
    float _290 = fma(_284, _176, _196);
    float _292 = fma(_286, _176, _198);
    float _294 = fma(_288, _176, _200);
    bool _296 = !_276;
    float _298 = _294;
    float _314;
    if (!_296)
    {
        float _300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _302 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _306 = _304 * _300;
        float _308 = floor(_306);
        float _310 = -_308;
        float _312 = _306 + _310;
        _314 = _312;
        _316 = true;
    }
    else
    {
        _314 = _172;
    }
    _316 = false;
    float _318 = _314;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _318 + _324;
    bool _328 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _330 = isnan(_318);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _346 = _318 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _356 = 1.0 / _342;
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _360 = 1.0 / _354;
    float _362 = 1.0 / _350;
    float _364 = _322 * _356;
    bool _366 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_318);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_338;
    float _380 = _378 + 1.0;
    float _382 = _376 * _380;
    float _384 = _326 * _360;
    bool _386 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_318);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    bool _402 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _404 = isnan(_318);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -_376;
    float _420 = _418 + 1.0;
    float _422 = -_396;
    float _424 = _422 + 1.0;
    float _426 = _346 * _362;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    float _436 = _412 * _424;
    float _438 = fma(_400, _426, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _440 = fma(_430, _426, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = fma(_434, _426, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = _396 * _420;
    float _446 = -_412;
    float _448 = _446 + 1.0;
    float _450 = _440 * _436;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = _442 * _436;
    float _462 = _438 * _436;
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _450);
    float _466 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _468 = fma(_416, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _470 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _472;
    float _476 = fma(_454, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = fma(_458, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_468, _444, _464);
    float _490 = fma(_474, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_482, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_486, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_476, _444, _466);
    float _498 = fma(_478, _444, _470);
    float _500 = fma(_490, _382, _488);
    float _502 = fma(_492, _382, _496);
    float _504 = fma(_494, _382, _498);
    float _506 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[146].x, _500);
    float _508 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[146].z, _504);
    bool _512 = !_358;
    float _528;
    if (!_512)
    {
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _516 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        _528 = _172;
    }
    _530 = false;
    float _532 = _528;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _532 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _550 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_532);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _540;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _570 = isnan(_532);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    bool _580 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _582 = 1.0 / _548;
    float _584 = _544 * _562;
    bool _586 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = isnan(_532);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _566;
    float _600 = -_560;
    float _602 = _600 + 1.0;
    float _604 = fma(_584, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _610 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _612 = isnan(_532);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -_596;
    float _624 = _622 + 1.0;
    float _626 = _596 * _602;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _632 = 1.0 / _608;
    float _634 = -_620;
    float _636 = _634 + 1.0;
    float _638 = _578 * _624;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _640;
    float _644 = _630 * _582;
    float _646 = _560 * _636;
    float _648 = _604 * _638;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _652 = _532 + _650;
    float _654 = -_578;
    float _656 = _654 + 1.0;
    bool _658 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _660 = isnan(_532);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _642 * _598;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _678 = _532 + _676;
    float _680 = fma(_644, _652, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _674 * _632;
    float _690 = fma(_670, _678, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _694 = _532 + _692;
    float _696 = fma(_680, _626, _682);
    float _698 = _620 * _686;
    float _700 = fma(_688, _694, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _702 = fma(_690, _646, _696);
    float _704 = fma(_700, _698, _702);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[119].x, _704);
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _720 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = in.m_59.x;
    float _724 = in.m_59.y;
    float _726 = in.m_59.z;
    out.m_61.x = _714;
    out.m_61.y = _716;
    out.m_61.z = _720;
    out.m_61.w = _718;
    float _728 = _510 * _726;
    float _730 = _508 * _724;
    float _732 = _506 * _722;
    bool _734 = !_580;
    if (!_734)
    {
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _738 = _150 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[14].x, _118);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _174 = _748;
    }
    float _750 = _174;
    float _752 = in.m_63.y;
    float _754 = _150 * 2.0;
    float _756 = in.m_55.z;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _760 = _758 != 0;
    float _762 = floor(_754);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _766 = _764 != 0;
    float _768 = in.m_65.x;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _772 = _770 != 0;
    float _774 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _780 = _154 * 2.0;
    float _782 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _784 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _786 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _788 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].z, _782);
    float _790 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _792 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _794 = log2(_792);
    float _796 = -_752;
    float _798 = _796 + 1.0;
    float _800 = _784;
    float _802 = _752;
    if (_766)
    {
        _800 = _154;
    }
    float _804 = _800;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _810 = _804;
    if (!_766)
    {
        _810 = _150;
    }
    float _812 = _810;
    float _814 = _756 * 2.0;
    bool _816 = _756 > 0.5;
    float _818 = 1.0 / _808;
    out.m_67.x = _768;
    if (_760)
    {
        float _820 = _816 ? _798 : _752;
        _802 = _820;
    }
    float _822 = _802;
    float _824 = _150 + _154;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _832 = _830 != 0;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _836 = _834 != 0;
    float _838 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].z, _786);
    bool _840 = _762 > 0.0;
    float _842 = floor(_814);
    float _844 = _824 + (-1.0);
    bool _846 = _762 >= 0.0;
    bool _848 = isnan(_762);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    float _856 = _812 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _858 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _860 = _154 + (-0.5);
    float _862 = floor(_780);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    if (_766)
    {
        _298 = _150;
    }
    float _868 = _298;
    float _870 = _788 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _872 = _868;
    if (!_766)
    {
        _872 = _756;
    }
    float _874 = _872;
    float _876 = _838 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _878 = _150 + _756;
    bool _880 = _842 >= 0.0;
    bool _882 = isnan(_842);
    bool _884 = _880 || _882;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    float _890 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _892 = 1.0 / _866;
    int _894 = _854 ? 0 : 1;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _900 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _890);
    float _902 = _878 + (-1.0);
    int _904 = _888 ? 0 : 1;
    float _906 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _908 = _862 > 0.0;
    float _910 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _912 = _862 >= 0.0;
    bool _914 = isnan(_862);
    bool _916 = _912 || _914;
    bool _918 = isnan(0.0);
    bool _920 = _916 || _918;
    float _922 = 1.0 / _898;
    float _924 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _910);
    float _926 = _154 + _756;
    float _928 = _756 + (-0.5);
    float _930 = _926 + (-1.0);
    float _932 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _938;
    int _942 = _920 ? 0 : 1;
    float _944 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _932);
    float _946 = _936 * _818;
    float _948 = _940 * _892;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _954 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _956 = _842 > 0.0;
    float _958 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _960 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _944);
    float _962 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _968 = ~_894;
    int _970 = _968 + 1;
    int _972 = _970 + 1;
    float _974 = -_964;
    float _976 = fma(_962, 2.0, _974);
    float _978 = _794 * _118;
    float _980 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _900);
    float _982 = fma(_856, -2.0, _966);
    float _984 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _924);
    int _986 = _972;
    if (!_840)
    {
        int _988 = ~_894;
        int _990 = _988 + 1;
        _986 = _990;
    }
    int _992 = _986;
    float _994 = exp2(_978);
    int _996 = ~_904;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1004 = 1.0 + _1002;
    float _1006 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[86].y, _982);
    int _1008 = _1000;
    if (!_956)
    {
        int _1010 = ~_904;
        int _1012 = _1010 + 1;
        _1008 = _1012;
    }
    int _1014 = _1008;
    float _1016 = _952 * _922;
    bool _1018 = !_832;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = 1.0 / _1004;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1026 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1028 = isnan(1.0);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1034 = _1030 || _1032;
    float _1036 = in.m_63.x;
    int _1038 = abs(_1020);
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1042 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1024);
    float _1044 = -_994;
    float _1046 = _1044 + 1.0;
    bool _1048 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    float _1058 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1040);
    float _1060 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1042);
    int _1062 = ~_942;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    float _1068 = _150 + (-0.5);
    int _1070 = _1066;
    float _1072 = _1036;
    float _1074 = _1060;
    if (!_908)
    {
        int _1076 = ~_942;
        int _1078 = _1076 + 1;
        _1070 = _1078;
    }
    int _1080 = _1070;
    float _1082 = rsqrt(_960);
    float _1084 = _1056 ? _1046 : 0.0;
    float _1086 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1058);
    float _1088 = float(_1038);
    float _1090 = -_118;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[86].x, _976);
    float _1094 = float(_992);
    if (_1034)
    {
        float _1096 = _1084 * _1022;
        _126 = _1096;
    }
    float _1098 = _126;
    bool _1100 = _154 > 0.5;
    bool _1102 = _1100 && _772;
    float _1104 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1106 = !_828;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = _1088 * _1094;
    bool _1112 = !_836;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = in.m_69.x;
    float _1118 = in.m_69.y;
    float _1120 = in.m_69.z;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1124 = _1104 + _1122;
    int _1126 = abs(_1108);
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1130 = _870 + _1128;
    int _1132 = abs(_1114);
    float _1134 = _1124 * _1124;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1138 = _876 + _1136;
    float _1140 = float(_1014);
    float _1142 = rsqrt(_984);
    float _1144 = fma(_1130, _1130, _1134);
    float _1146 = float(_1132);
    float _1148 = _1110 * (-2.0);
    float _1150 = float(_1126);
    float _1152 = fma(_1138, _1138, _1144);
    float _1154 = float(_1080);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1158 = _750 + _1156;
    float _1160 = rsqrt(_1152);
    float _1162 = _1150 * _1140;
    float _1164 = _1146 * _1154;
    float _1166 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1168 = fma(_1148, _1118, _1118);
    float _1170 = fma(_958, _1148, _958);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1176 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1168);
    float _1178 = _1164 * (-2.0);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1188 = fma(_1170, _1098, _1176);
    float _1190 = fma(_1178, _1120, _1120);
    float _1192 = 1.0 / _1174;
    float _1194 = _1188 * 0.15915493667125701904296875;
    float _1196 = _1162 * (-2.0);
    float _1198 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1190);
    float _1200 = _1124 * _1160;
    float _1202 = fma(_1166, _1178, _1166);
    float _1204 = fma(_858, _1196, _858);
    float _1206 = fma(_1196, _1116, _1116);
    float _1208 = _1130 * _1160;
    float _1210 = -_1200;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1214 = 1.0 / _1182;
    float _1216 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1206);
    float _1218 = -_1208;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1130);
    float _1222 = _1212 * _1212;
    float _1224 = _1138 * _1160;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1232 = _1230 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1234 = fma(_1220, _1220, _1222);
    float _1236 = 1.0 / _1186;
    float _1238 = -_1224;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1138);
    float _1242 = fma(_1202, _1098, _1198);
    float _1244 = in.m_71.x;
    float _1246 = in.m_71.y;
    float _1248 = in.m_71.z;
    float _1250 = fma(_1240, _1240, _1234);
    float _1252 = fma(_1204, _1098, _1216);
    float _1254 = _1228 * _1192;
    float _1256 = _1194 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1268 = _1242 * 0.15915493667125701904296875;
    float _1270 = 0.0;
    float _1272 = _1224;
    float _1274 = _1208;
    float _1276 = _1200;
    if (_772)
    {
        _1270 = _1036;
    }
    float _1278 = _1270;
    float _1280 = _1262 * _1214;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1284 = _750 + _1282;
    float _1286 = _1194 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    float _1290 = _1278;
    if (_1102)
    {
        float _1292 = -_1278;
        float _1294 = _1292 + 1.0;
        _1290 = _1294;
    }
    float _1296 = _1290;
    float _1298 = fma(_948, _1284, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1302 = _750 + _1300;
    if (_772)
    {
        _1072 = _1296;
    }
    float _1304 = _1072;
    float _1306 = 1.0 / _1232;
    float _1308 = _1082 * _1246;
    float _1310 = _1142 * _1248;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1312;
    float _1316 = _1252 * 0.15915493667125701904296875;
    float _1318 = sqrt(_1250);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1322 = _750 + _1320;
    float _1324 = _1314 * _1236;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1328 = _750 + _1326;
    float _1330 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1332 = fma(_946, _1322, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1334 = fma(_1254, _1328, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1336 = rsqrt(_980);
    float _1338 = _1266 * _1306;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1342 = _750 + _1340;
    float _1344 = fma(_1338, _1158, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1346 = fma(_1016, _1342, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1348 = fma(_1280, _1302, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1350 = sqrt(_980);
    float _1352 = _1160 * _1318;
    float _1354 = _906 * _1352;
    float _1356 = _954 * _1352;
    float _1358 = _1268 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _1336 * _1244;
    float _1364 = _1316 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1350 * _1362;
    float _1370 = _1350 * _1308;
    float _1372 = _1350 * _1310;
    bool _1374 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1376 = isnan(_750);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1368);
    bool _1388 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1390 = isnan(_750);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1372);
    float _1402 = _1316 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1258 * _1360;
    float _1408 = _1288 * _1360;
    float _1410 = -_1384;
    float _1412 = _1410 + 1.0;
    float _1414 = -_1398;
    float _1416 = _1414 + 1.0;
    float _1418 = _1354 * _1400;
    bool _1420 = _1370 != 0.0;
    bool _1422 = isnan(_1370);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(0.0);
    bool _1428 = _1424 || _1426;
    float _1430 = _1398 * _1412;
    float _1432 = _1268 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = _1366 * _1258;
    float _1438 = _1366 * _1288;
    float _1440 = _1366 * _1360;
    bool _1442 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1444 = isnan(_750);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1450 = _1446 || _1448;
    float _1452 = float(_1450);
    bool _1454 = _1368 == 0.0;
    bool _1456 = !_1428;
    bool _1458 = _1454 && _1456;
    float _1460 = _1404 * _1258;
    float _1462 = _1404 * _1360;
    float _1464 = _1330 * _1352;
    bool _1466 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1468 = isnan(_750);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = _1404 * _1288;
    float _1480 = -_1452;
    float _1482 = _1480 + 1.0;
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1486 = _1372 == 0.0;
    bool _1488 = _1486 && _1458;
    float _1490 = -_1460;
    float _1492 = fma(_1434, _1438, _1490);
    float _1494 = -_1438;
    float _1496 = fma(_1434, _1460, _1494);
    float _1498 = -_1476;
    float _1500 = _1498 + 1.0;
    float _1502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1370);
    float _1504 = fma(_1434, _1478, _1436);
    float _1506 = fma(_1434, _1436, _1478);
    float _1508 = _1476 * _1416;
    bool _1510 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1512 = isnan(_750);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = _1452 * _1500;
    float _1524 = _1464 * _1502;
    bool _1526 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1528 = isnan(_750);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = _1356 * _1386;
    float _1540 = -_1520;
    float _1542 = _1540 + 1.0;
    float _1544 = _1462 * _1524;
    bool _1546 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1548 = isnan(_750);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = -_1536;
    float _1560 = _1558 + 1.0;
    float _1562 = -_1524;
    float _1564 = _1434 * _1562;
    float _1566 = fma(_1504, _1538, _1544);
    float _1568 = _1520 * _1482;
    float _1570 = _1536 * _1542;
    bool _1572 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1574 = isnan(_750);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1580 = _1576 || _1578;
    float _1582 = float(_1580);
    float _1584 = _1556 * _1560;
    float _1586 = -_1556;
    float _1588 = _1586 + 1.0;
    float _1590 = _1440 * _1524;
    float _1592 = fma(_1408, _1538, _1564);
    float _1594 = fma(_1496, _1418, _1566);
    float _1596 = _1582 * _1588;
    float _1598 = fma(_1492, _1538, _1590);
    float _1600 = fma(_1406, _1418, _1592);
    float _1602 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1604 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1606 = _1332 * _1596;
    float _1608 = fma(_1506, _1418, _1598);
    float _1610 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1602);
    float _1612 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1604);
    float _1614 = -_1582;
    float _1616 = _1614 + 1.0;
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1620 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1610);
    float _1622 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1612);
    float _1624 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1606);
    float _1626 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1628 = _870 + _1620;
    float _1630 = _876 + _1622;
    float _1632 = fma(_1346, _1584, _1624);
    float _1634 = fma(_1626, _822, -0.5);
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1628 + _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1642 = _1630 + _1640;
    float _1644 = in.m_73.x;
    float _1646 = in.m_73.y;
    float _1648 = in.m_73.z;
    float _1650 = fma(_1298, _1570, _1632);
    float _1652 = _1638 * _1638;
    float _1654 = _1642 * _1642;
    float _1656 = in.m_65.w;
    float _1658 = fma(_1334, _1568, _1650);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1662 = _750 + _1660;
    float _1664 = _1652 + _1654;
    float _1666 = in.m_65.y;
    float _1668 = fma(_1348, _1522, _1658);
    float _1670 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1672 = sqrt(_1664);
    float _1674 = fma(_1324, _1662, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1676 = fma(_1344, _1508, _1668);
    float _1678 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1680 = fma(_1670, _1304, -0.5);
    float _1682 = -_1006;
    float _1684 = fma(_1086, _1634, _1682);
    float _1686 = fma(_1674, _1430, _1676);
    float _1688 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1678);
    float _1690 = fma(_1060, _1680, _1092);
    float _1692 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1686);
    float _1694 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1688);
    float _1696 = _1646;
    float _1698 = _1644;
    float _1700 = _1652;
    float _1702 = _1654;
    float _1704 = _1628;
    float _1706 = _1630;
    float _1708 = _1648;
    float _1710 = _1684;
    if (!_1488)
    {
        float _1712 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1646);
        _1696 = _1712;
    }
    float _1714 = _1696;
    if (!_1488)
    {
        float _1716 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1644);
        _1698 = _1716;
    }
    float _1718 = _1698;
    float _1720 = _1104 + _1694;
    bool _1722 = _1672 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1462 * _1714;
    float _1726 = -_1714;
    float _1728 = _1434 * _1726;
    float _1730 = _1440 * _1714;
    float _1732 = fma(_1504, _1718, _1724);
    float _1734 = _1672;
    float _1736 = _1720;
    if (!_1722)
    {
        _1074 = _1720;
    }
    float _1738 = _1074;
    bool _1740 = !_1722;
    float _1742 = _1738;
    if (!_1740)
    {
        float _1744 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1748 = _1672 + _1746;
        float _1750 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1752 = rsqrt(_1664);
        float _1754 = _1748 * _1744;
        float _1756 = _1754 * 0.15915493667125701904296875;
        float _1758 = _1756 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = _1756 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = fma(_1760, _1750, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1768 = _1752 * _1766;
        float _1770 = _1764 + (-1.0);
        float _1772 = fma(_1638, _1768, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1774 = fma(_1642, _1768, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1776 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1780 = _1772 + _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1784 = _1774 + _1782;
        float _1786 = fma(_1720, _1764, _1776);
        float _1788 = _1780 * _1780;
        float _1790 = _1784 * _1784;
        _1742 = _1786;
        _1700 = _1788;
        _1702 = _1790;
        _1704 = _1772;
        _1706 = _1774;
        _1734 = _1748;
    }
    float _1792 = _1742;
    float _1794 = _1700;
    float _1796 = _1702;
    float _1798 = _1704;
    float _1800 = _1706;
    float _1802 = _1734;
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1806 = _1792 + _1804;
    float _1808 = _1802;
    if (!_1488)
    {
        float _1810 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1648);
        _1708 = _1810;
    }
    float _1812 = _1708;
    float _1814 = fma(_1408, _1718, _1728);
    float _1816 = fma(_1492, _1718, _1730);
    float _1818 = fma(_1806, _1806, _1794);
    float _1820 = fma(_1496, _1812, _1732);
    float _1822 = fma(_1406, _1812, _1814);
    float _1824 = fma(_1506, _1812, _1816);
    float _1826 = _1818 + _1796;
    float _1828 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1834 = _1690 + 0.5;
    float _1836 = fma(_1822, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1828);
    float _1838 = sqrt(_1826);
    float _1840 = fma(_1822, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1830);
    float _1842 = fma(_1822, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1832);
    float _1844 = fma(_1824, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1836);
    float _1846 = _1684 + 0.5;
    float _1848 = fma(_1824, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1840);
    float _1850 = fma(_1824, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1842);
    out.m_67.y = _1666;
    out.m_67.w = _1656;
    out.m_75.x = _1834;
    out.m_75.y = _1846;
    bool _1852 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1854 = isnan(_1838);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1860 = _1856 || _1858;
    out.m_77.x = _1692;
    out.m_79.x = _1844;
    out.m_79.y = _1848;
    out.m_79.z = _1850;
    float _1862 = _1846;
    float _1864 = _1822;
    if (!_1860)
    {
        _1710 = 1.0;
    }
    float _1866 = _1710;
    bool _1868 = !_1860;
    float _1870 = _1866;
    if (!_1868)
    {
        bool _1872 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1874 = isnan(_1838);
        bool _1876 = _1872 || _1874;
        bool _1878 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1880 = _1876 || _1878;
        if (!_1880)
        {
            float _1882 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1884 = _1838 + _1882;
            float _1886 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1888 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1886;
            float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1892 = _1890 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1894 = 1.0 / _1888;
            float _1896 = _1884 * _1894;
            float _1898 = fma(_1896, _1892, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1870 = _1898;
            _1900 = true;
        }
        else
        {
            bool _1902 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1904 = isnan(_1838);
            bool _1906 = _1902 || _1904;
            bool _1908 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1910 = _1906 || _1908;
            if (!_1910)
            {
                float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1914 = _1838 + _1912;
                float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1918 = _1916 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1920 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1922 = _1920 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1924 = 1.0 / _1918;
                float _1926 = _1914 * _1924;
                float _1928 = fma(_1926, _1922, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1870 = _1928;
                _1900 = true;
            }
            else
            {
                _1870 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1900 = false;
    float _1930 = _1870;
    float _1932 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1934 = _1792 + _1932;
    float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1938 = _1798 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1942 = _1800 + _1940;
    float _1944 = fma(_1934, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1946 = fma(_1938, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1948 = fma(_1942, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1950 = -_1200;
    float _1952 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1944);
    float _1954 = -_1208;
    float _1956 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1946);
    float _1958 = -_1224;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1948);
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1964 = _1952 + _1962;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1968 = _1956 + _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1972 = _1960 + _1970;
    float _1974 = _1964 * _1964;
    float _1976 = fma(_1968, _1968, _1974);
    float _1978 = fma(_1972, _1972, _1976);
    float _1980 = rsqrt(_1978);
    float _1982 = _1980 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1984 = _1968 * _1982;
    float _1986 = _1972 * _1982;
    float _1988 = _1984 * _1984;
    float _1990 = _1986 * _1986;
    float _1992 = _1988 + _1990;
    float _1994 = sqrt(_1992);
    bool _1996 = _1994 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2000 = _1994 + _1998;
    float _2002 = _1972;
    float _2004 = _2000;
    float _2006 = _1964;
    float _2008 = _1984;
    if (_1996)
    {
        float _2010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2002 = _2010;
    }
    float _2012 = _2002;
    if (_1996)
    {
        float _2014 = rsqrt(_1992);
        _1862 = _2014;
    }
    float _2016 = _1862;
    float _2018 = _2016;
    if (_1996)
    {
        float _2020 = _2000 * _2012;
        _2004 = _2020;
    }
    float _2022 = _2004;
    if (_1996)
    {
        float _2024 = _2022 * 0.15915493667125701904296875;
        _1808 = _2024;
    }
    float _2026 = _1808;
    float _2028 = _1980;
    float _2030 = _2026;
    if (_1996)
    {
        float _2032 = _2026 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _2028 = _2034;
    }
    float _2036 = _2028;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = precise::max(0.0, _2038);
    float _2042 = _2012;
    float _2044 = _2040;
    if (_1996)
    {
        float _2046 = _2026 * 6.283185482025146484375;
        float _2048 = cos(_2046);
        _2042 = _2048;
    }
    float _2050 = _2042;
    float _2052 = -_1982;
    float _2054 = -_2040;
    float _2056 = fma(_1964, _2052, _2054);
    if (_1996)
    {
        float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2058;
    }
    float _2060 = _2006;
    float _2062 = _2060;
    if (!_1996)
    {
        _2030 = _1988;
    }
    float _2064 = _2030;
    float _2066 = _2036;
    float _2068 = _2064;
    if (_1996)
    {
        float _2070 = fma(_2036, _2060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2066 = _2070;
    }
    float _2072 = _2066;
    float _2074 = _2072;
    if (!_1996)
    {
        _2062 = _1990;
    }
    float _2076 = _2062;
    float _2078 = _2076;
    if (_1996)
    {
        float _2080 = _2050 + (-1.0);
        _2044 = _2080;
    }
    float _2082 = _2044;
    if (_1996)
    {
        float _2084 = _2016 * _2072;
        _1864 = _2084;
    }
    float _2086 = _1864;
    if (!_1996)
    {
        _2018 = _2056;
    }
    float _2088 = _2018;
    float _2090 = _2088;
    if (_1996)
    {
        float _2092 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _2092;
    }
    float _2094 = _1736;
    if (_1996)
    {
        float _2096 = _1984 * _2086;
        _2008 = _2096;
    }
    float _2098 = _2008;
    float _2100 = sqrt(_1978);
    if (!_1996)
    {
        _2074 = _1986;
    }
    float _2102 = _2074;
    float _2104 = _2102;
    if (_1996)
    {
        float _2106 = fma(_2056, _2050, _2094);
        _2090 = _2106;
    }
    float _2108 = _2090;
    if (_1996)
    {
        float _2110 = _1986 * _2086;
        _2104 = _2110;
    }
    float _2112 = _2104;
    if (_1996)
    {
        float _2114 = _2098 * _2098;
        _2068 = _2114;
    }
    float _2116 = _2068;
    float _2118 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1996)
    {
        float _2120 = _2112 * _2112;
        _2078 = _2120;
    }
    float _2122 = _2078;
    float _2124 = fma(_2108, _2108, _2116);
    float _2126 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2128 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2118);
    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2132 = _2124 + _2122;
    float _2134 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2136 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2128);
    float _2138 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2126);
    float _2140 = rsqrt(_2132);
    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2144 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2142);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2134);
    float _2150 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2152 = -_2146;
    float _2154 = _2152 + 1.0;
    float _2156 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2158 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2148);
    float _2160 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2162 = abs(_2154);
    float _2164 = log2(_2162);
    float _2166 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2156);
    float _2168 = -_2160;
    float _2170 = fma(_2168, _2130, 1.0);
    float _2172 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2138);
    float _2174 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2166);
    float _2176 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = _2140 * _2098;
    float _2180 = _2140 * _2108;
    float _2182 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2184 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2186 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2188 = _2140 * _2112;
    float _2190 = log2(_2170);
    float _2192 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2184);
    float _2194 = -_2186;
    float _2196 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2194);
    float _2198 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2202 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2192);
    float _2204 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2206 = _2180 + 1.0;
    float _2208 = -_2188;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2196);
    float _2212 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2202);
    float _2214 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2216 = exp2(_2200);
    float _2218 = fma(_2210, -0.5, 0.5);
    float _2220 = fma(_2210, 0.5, 0.5);
    float _2222 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2204);
    float _2224 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2214);
    float _2226 = fma(_2220, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2228 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2222);
    float _2230 = 1.0 / _2212;
    float _2232 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2224);
    float _2234 = fma(_2220, _2226, -0.212114393711090087890625);
    float _2236 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2228);
    float _2238 = _2190 * 0.693147182464599609375;
    float _2240 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2232);
    float _2242 = fma(_2220, _2234, 1.570728778839111328125);
    float _2244 = sqrt(_2218);
    float _2246 = -_2180;
    float _2248 = fma(_2216, _2206, _2246);
    float _2250 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2252 = _2236 * _2230;
    float _2254 = _2240 * _2230;
    float _2256 = fma(_2252, 0.5, 0.5);
    float _2258 = fma(_2254, -0.5, 0.5);
    float _2260 = _2244 * 0.636619746685028076171875;
    float3 _6177 = float3(_2256, _2258, _2250);
    float _2262 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6177, float3(0.0), isnan(_6177)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6177, float3(0.0), isnan(_6177)), level(0.0)).x;
    float _2264 = -_2242;
    float _2266 = fma(_2260, _2264, 1.0);
    float _2268 = fma(_2248, 0.5, 0.5);
    float3 _6195 = float3(_2256, _2258, _2250);
    float4 _2271 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6195, float3(0.0), isnan(_6195)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6195, float3(0.0), isnan(_6195)), level(0.0)).xyzw;
    float _2273 = _2271.x;
    float _2275 = _2271.y;
    float _2277 = _2271.z;
    float _2279 = _2271.w;
    float2 _6212 = float2(_2266, _2268);
    float3 _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6212, float2(0.0), isnan(_6212)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6212, float2(0.0), isnan(_6212)), level(0.0)).xyz;
    float _2285 = _2283.x;
    float _2287 = _2283.y;
    float _2289 = _2283.z;
    float _2291 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2293 = -_1200;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1104);
    float _2297 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2299 = -_1208;
    float _2301 = fma(_2299, (*spvDescriptorSet0.vp_c9)._m0[18].w, _870);
    float _2303 = -_1224;
    float _2305 = fma(_2303, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    out.m_81.x = _1956;
    out.m_81.y = _1952;
    out.m_81.z = _1960;
    float _2307 = exp2(_2291);
    float _2309 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2297);
    bool _2311 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2313 = isnan(_2100);
    bool _2315 = _2311 || _2313;
    bool _2317 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2319 = _2315 || _2317;
    out.m_83.x = _2301;
    out.m_83.y = _2295;
    out.m_83.z = _2305;
    float _2321 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2309);
    float _2323 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2321);
    float _2325 = _2323 + _2212;
    out.gl_Position.x = _2236;
    out.gl_Position.y = _2240;
    out.gl_Position.z = _2323;
    out.gl_Position.w = _2212;
    float _2327 = _2212;
    if (!_2319)
    {
        _1272 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2329 = _1272;
    float _2331 = -_2307;
    float _2333 = _2331 + 1.0;
    float _2335 = _2325 * 0.5;
    float _2337 = _2335;
    float _2339 = _2329;
    float _2341 = _2329;
    if (!_2319)
    {
        _1274 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2343 = _1274;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2347 = _2343;
    float _2349 = _2343;
    if (!_2319)
    {
        _1276 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2351 = _1276;
    out.m_85.z = _2335;
    out.m_85.w = _2212;
    float _2353 = _2351;
    float _2355 = _2351;
    if (!_2319)
    {
        _2327 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2357 = _2327;
    float _2359 = _2357;
    float _2361 = _2357;
    if (!_2319)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2363 = _2337;
    float _2365 = _2345 * _2262;
    float _2367 = -_2345;
    float _2369 = _2367 + 1.0;
    float _2371 = _2279 * _2365;
    float _2373 = _2279 * _2369;
    float _2375 = _2369;
    float _2377 = _2363;
    float _2379 = _2363;
    if (!_2319)
    {
        _2375 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2381 = _2375;
    float _2383 = _2289 * _2365;
    float _2385 = fma(_2285, _2371, _2273);
    float _2387 = fma(_2287, _2371, _2275);
    float _2389 = fma(_2279, _2383, _2277);
    out.m_87.x = _2385;
    out.m_87.y = _2387;
    out.m_87.z = _2389;
    out.m_87.w = _2373;
    bool _2391 = !_2319;
    float _2393 = _2381;
    float _2395 = _2381;
    if (!_2391)
    {
        bool _2397 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2399 = isnan(_2100);
        bool _2401 = _2397 || _2399;
        bool _2403 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2405 = _2401 || _2403;
        if (!_2405)
        {
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2409 = _2100 + _2407;
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2413 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2411;
            float _2415 = 1.0 / _2413;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2437 = _2409 * _2415;
            float _2439 = precise::clamp(_2437, 0.0, 1.0);
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2445 = fma(_2439, _2419, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2447 = fma(_2439, _2443, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2449 = fma(_2439, _2423, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2451 = fma(_2439, _2427, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2453 = fma(_2439, _2431, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2455 = fma(_2439, _2435, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2349 = _2447;
            _2361 = _2453;
            _2341 = _2445;
            _2395 = _2451;
            _2355 = _2449;
            _2379 = _2455;
            _2457 = true;
        }
        else
        {
            bool _2459 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2461 = isnan(_2100);
            bool _2463 = _2459 || _2461;
            bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2467 = _2463 || _2465;
            if (!_2467)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2469 = _2339;
            _2341 = _2469;
            if (!_2467)
            {
                _2347 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2471 = _2347;
            _2349 = _2471;
            if (!_2467)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2473 = _2353;
            _2355 = _2473;
            if (!_2467)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2475 = _2393;
            _2395 = _2475;
            if (!_2467)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2477 = _2359;
            _2361 = _2477;
            if (!_2467)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2479 = _2377;
            bool _2481 = !_2467;
            _2379 = _2479;
            if (!_2481)
            {
                bool _2483 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2485 = isnan(_2100);
                bool _2487 = _2483 || _2485;
                bool _2489 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2491 = _2487 || _2489;
                if (!_2491)
                {
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2495 = _2100 + _2493;
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2499 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2497;
                    float _2501 = 1.0 / _2499;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2523 = _2495 * _2501;
                    float _2525 = precise::clamp(_2523, 0.0, 1.0);
                    float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2531 = fma(_2525, _2505, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2533 = fma(_2525, _2529, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2535 = fma(_2525, _2509, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2537 = fma(_2525, _2513, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2539 = fma(_2525, _2517, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2541 = fma(_2525, _2521, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2349 = _2533;
                    _2361 = _2539;
                    _2341 = _2531;
                    _2395 = _2537;
                    _2355 = _2535;
                    _2379 = _2541;
                    _2457 = true;
                }
                else
                {
                    _2349 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2457 = false;
    float _2543 = _2349;
    float _2545 = _2361;
    float _2547 = _2341;
    float _2549 = _2395;
    float _2551 = _2355;
    float _2553 = _2379;
    float _2555 = fma(_1848, -0.5, 0.5);
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = -_2543;
    float _2561 = _2559 + _2545;
    float _2563 = -_2547;
    float _2565 = _2563 + _2549;
    float _2567 = -_2551;
    float _2569 = _2567 + _2553;
    bool _2571 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2573 = fma(_2557, _2561, _2543);
    float _2575 = fma(_2557, _2565, _2547);
    float _2577 = fma(_2557, _2569, _2551);
    float _2579 = _2573 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2581 = fma(_2575, 0.298911988735198974609375, _2579);
    out.m_89.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2583 = fma(_2577, 0.114477999508380889892578125, _2581);
    out.m_91.x = 0.0;
    float _2585 = -_2583;
    float _2587 = _2575 + _2585;
    float _2589 = -_2583;
    float _2591 = _2573 + _2589;
    float _2593 = -_2583;
    float _2595 = _2577 + _2593;
    float _2597 = fma(_2587, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2583);
    float _2599 = fma(_2591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2583);
    float _2601 = fma(_2595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2583);
    out.m_93.x = _2597;
    out.m_93.y = _2599;
    out.m_93.z = _2601;
    if (!_2571)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2603 = -_1952;
    float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2607 = -_1956;
    float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2611 = -_1960;
    float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2615 = _2605 * _2605;
    float _2617 = fma(_2609, _2609, _2615);
    float _2619 = fma(_2613, _2613, _2617);
    float _2621 = sqrt(_2619);
    float _2623 = rsqrt(_2619);
    float _2625 = -_2621;
    float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2629 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2631 = precise::clamp(_2629, 0.0, 1.0);
    float _2633 = _2609 * _2623;
    float _2635 = _2605 * _2623;
    float _2637 = abs(_2631);
    float _2639 = log2(_2637);
    float _2641 = _2613 * _2623;
    float _2643 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2645 = _1848 * _2635;
    float _2647 = -_2635;
    float _2649 = -_2643;
    float _2651 = fma(_2647, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2649);
    float _2653 = fma(_1844, _2633, _2645);
    float _2655 = -_2641;
    float _2657 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2651);
    float _2659 = fma(_1850, _2641, _2653);
    float _2661 = precise::clamp(_2659, 0.0, 1.0);
    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2665 = _2657 + _2663;
    float _2667 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2669 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2671 = precise::clamp(_2669, 0.0, 1.0);
    float _2673 = exp2(_2667);
    float _2675 = _2673 * _2671;
    float _2677 = _2661 * _2675;
    float _2679 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2681 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2683 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2679;
    out.m_91.y = _2681;
    out.m_91.z = _2683;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2457 = false;
    bool _1900 = false;
    bool _530 = false;
    bool _316 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = in.m_48.w;
    float _111 = trunc(_107);
    int _114 = int(_111);
    float _116 = -_109;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _118;
    bool _122 = _114 >= 1;
    float _124 = 0.0;
    float _126 = _118;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    float _130 = _128;
    if (!_122)
    {
        out.m_53.x = 0.0;
    }
    int _132 = 0;
    if (!_122)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2751 = as_type<float>(_136);
        out.gl_Position.z = _2751;
    }
    if (!_122)
    {
        return out;
    }
    bool _140 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_109);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = in.m_55.x;
    float _152 = float(_114);
    float _154 = in.m_55.y;
    bool _156 = _118 >= _152;
    bool _158 = !_148;
    bool _160 = _156 || _158;
    float _162 = 1.0 / _152;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _130;
    float _166 = _164;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _168 = _164 * 5.0;
        _138 = as_type<int>(_168);
    }
    int _170 = _138;
    float _172 = _118 * _162;
    out.m_57.x = _150;
    float _174 = _172;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2819 = as_type<float>(_170);
        out.gl_Position.z = _2819;
    }
    out.m_57.y = _154;
    out.m_51.x = _172;
    if (_160)
    {
        return out;
    }
    float _176 = in.m_59.w;
    float _178 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_48.x;
    float _192 = in.m_48.y;
    float _194 = in.m_48.z;
    float _196 = in.m_46.x;
    float _198 = in.m_46.y;
    float _200 = in.m_46.z;
    float _202 = _178;
    if (!_188)
    {
        float _204 = _178 * _178;
        float _206 = _204 * 0.5;
        _166 = _206;
    }
    float _208 = _166;
    float _210 = _208;
    if (!_188)
    {
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_188;
    float _218 = _214;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _178 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _178);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_188;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _178 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _202 = _272;
    }
    float _274 = _202;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _282 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _284 = fma(_274, _190, _278);
    float _286 = fma(_274, _192, _280);
    float _288 = fma(_274, _194, _282);
    float _290 = fma(_284, _176, _196);
    float _292 = fma(_286, _176, _198);
    float _294 = fma(_288, _176, _200);
    bool _296 = !_276;
    float _298 = _294;
    float _314;
    if (!_296)
    {
        float _300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _302 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _306 = _304 * _300;
        float _308 = floor(_306);
        float _310 = -_308;
        float _312 = _306 + _310;
        _314 = _312;
        _316 = true;
    }
    else
    {
        _314 = _172;
    }
    _316 = false;
    float _318 = _314;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _318 + _324;
    bool _328 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _330 = isnan(_318);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _346 = _318 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _356 = 1.0 / _342;
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _360 = 1.0 / _354;
    float _362 = 1.0 / _350;
    float _364 = _322 * _356;
    bool _366 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_318);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_338;
    float _380 = _378 + 1.0;
    float _382 = _376 * _380;
    float _384 = _326 * _360;
    bool _386 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_318);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    bool _402 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _404 = isnan(_318);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -_376;
    float _420 = _418 + 1.0;
    float _422 = -_396;
    float _424 = _422 + 1.0;
    float _426 = _346 * _362;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    float _436 = _412 * _424;
    float _438 = fma(_400, _426, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _440 = fma(_430, _426, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = fma(_434, _426, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = _396 * _420;
    float _446 = -_412;
    float _448 = _446 + 1.0;
    float _450 = _440 * _436;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = _442 * _436;
    float _462 = _438 * _436;
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _450);
    float _466 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _468 = fma(_416, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _470 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _472;
    float _476 = fma(_454, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = fma(_458, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_468, _444, _464);
    float _490 = fma(_474, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_482, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_486, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_476, _444, _466);
    float _498 = fma(_478, _444, _470);
    float _500 = fma(_490, _382, _488);
    float _502 = fma(_492, _382, _496);
    float _504 = fma(_494, _382, _498);
    float _506 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[146].x, _500);
    float _508 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[146].z, _504);
    bool _512 = !_358;
    float _528;
    if (!_512)
    {
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _516 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        _528 = _172;
    }
    _530 = false;
    float _532 = _528;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _532 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _550 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_532);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _540;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _570 = isnan(_532);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    bool _580 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _582 = 1.0 / _548;
    float _584 = _544 * _562;
    bool _586 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = isnan(_532);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _566;
    float _600 = -_560;
    float _602 = _600 + 1.0;
    float _604 = fma(_584, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _610 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _612 = isnan(_532);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -_596;
    float _624 = _622 + 1.0;
    float _626 = _596 * _602;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _632 = 1.0 / _608;
    float _634 = -_620;
    float _636 = _634 + 1.0;
    float _638 = _578 * _624;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _640;
    float _644 = _630 * _582;
    float _646 = _560 * _636;
    float _648 = _604 * _638;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _652 = _532 + _650;
    float _654 = -_578;
    float _656 = _654 + 1.0;
    bool _658 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _660 = isnan(_532);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _642 * _598;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _678 = _532 + _676;
    float _680 = fma(_644, _652, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _674 * _632;
    float _690 = fma(_670, _678, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _694 = _532 + _692;
    float _696 = fma(_680, _626, _682);
    float _698 = _620 * _686;
    float _700 = fma(_688, _694, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _702 = fma(_690, _646, _696);
    float _704 = fma(_700, _698, _702);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[119].x, _704);
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _720 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = in.m_59.x;
    float _724 = in.m_59.y;
    float _726 = in.m_59.z;
    out.m_61.x = _714;
    out.m_61.y = _716;
    out.m_61.z = _720;
    out.m_61.w = _718;
    float _728 = _510 * _726;
    float _730 = _508 * _724;
    float _732 = _506 * _722;
    bool _734 = !_580;
    if (!_734)
    {
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _738 = _150 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[14].x, _118);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _174 = _748;
    }
    float _750 = _174;
    float _752 = in.m_63.y;
    float _754 = _150 * 2.0;
    float _756 = in.m_55.z;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _760 = _758 != 0;
    float _762 = floor(_754);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _766 = _764 != 0;
    float _768 = in.m_65.x;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _772 = _770 != 0;
    float _774 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _780 = _154 * 2.0;
    float _782 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _784 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _786 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _788 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].z, _782);
    float _790 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _792 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _794 = log2(_792);
    float _796 = -_752;
    float _798 = _796 + 1.0;
    float _800 = _784;
    float _802 = _752;
    if (_766)
    {
        _800 = _154;
    }
    float _804 = _800;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _810 = _804;
    if (!_766)
    {
        _810 = _150;
    }
    float _812 = _810;
    float _814 = _756 * 2.0;
    bool _816 = _756 > 0.5;
    float _818 = 1.0 / _808;
    out.m_67.x = _768;
    if (_760)
    {
        float _820 = _816 ? _798 : _752;
        _802 = _820;
    }
    float _822 = _802;
    float _824 = _150 + _154;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _832 = _830 != 0;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _836 = _834 != 0;
    float _838 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].z, _786);
    bool _840 = _762 > 0.0;
    float _842 = floor(_814);
    float _844 = _824 + (-1.0);
    bool _846 = _762 >= 0.0;
    bool _848 = isnan(_762);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    float _856 = _812 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _858 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _860 = _154 + (-0.5);
    float _862 = floor(_780);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    if (_766)
    {
        _298 = _150;
    }
    float _868 = _298;
    float _870 = _788 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _872 = _868;
    if (!_766)
    {
        _872 = _756;
    }
    float _874 = _872;
    float _876 = _838 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _878 = _150 + _756;
    bool _880 = _842 >= 0.0;
    bool _882 = isnan(_842);
    bool _884 = _880 || _882;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    float _890 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _892 = 1.0 / _866;
    int _894 = _854 ? 0 : 1;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _900 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _890);
    float _902 = _878 + (-1.0);
    int _904 = _888 ? 0 : 1;
    float _906 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _908 = _862 > 0.0;
    float _910 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _912 = _862 >= 0.0;
    bool _914 = isnan(_862);
    bool _916 = _912 || _914;
    bool _918 = isnan(0.0);
    bool _920 = _916 || _918;
    float _922 = 1.0 / _898;
    float _924 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _910);
    float _926 = _154 + _756;
    float _928 = _756 + (-0.5);
    float _930 = _926 + (-1.0);
    float _932 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _938;
    int _942 = _920 ? 0 : 1;
    float _944 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _932);
    float _946 = _936 * _818;
    float _948 = _940 * _892;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _954 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _956 = _842 > 0.0;
    float _958 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _960 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _944);
    float _962 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _968 = ~_894;
    int _970 = _968 + 1;
    int _972 = _970 + 1;
    float _974 = -_964;
    float _976 = fma(_962, 2.0, _974);
    float _978 = _794 * _118;
    float _980 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _900);
    float _982 = fma(_856, -2.0, _966);
    float _984 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _924);
    int _986 = _972;
    if (!_840)
    {
        int _988 = ~_894;
        int _990 = _988 + 1;
        _986 = _990;
    }
    int _992 = _986;
    float _994 = exp2(_978);
    int _996 = ~_904;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1004 = 1.0 + _1002;
    float _1006 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[86].y, _982);
    int _1008 = _1000;
    if (!_956)
    {
        int _1010 = ~_904;
        int _1012 = _1010 + 1;
        _1008 = _1012;
    }
    int _1014 = _1008;
    float _1016 = _952 * _922;
    bool _1018 = !_832;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = 1.0 / _1004;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1026 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1028 = isnan(1.0);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1034 = _1030 || _1032;
    float _1036 = in.m_63.x;
    int _1038 = abs(_1020);
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1042 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1024);
    float _1044 = -_994;
    float _1046 = _1044 + 1.0;
    bool _1048 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    float _1058 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1040);
    float _1060 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1042);
    int _1062 = ~_942;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    float _1068 = _150 + (-0.5);
    int _1070 = _1066;
    float _1072 = _1036;
    float _1074 = _1060;
    if (!_908)
    {
        int _1076 = ~_942;
        int _1078 = _1076 + 1;
        _1070 = _1078;
    }
    int _1080 = _1070;
    float _1082 = rsqrt(_960);
    float _1084 = _1056 ? _1046 : 0.0;
    float _1086 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1058);
    float _1088 = float(_1038);
    float _1090 = -_118;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[86].x, _976);
    float _1094 = float(_992);
    if (_1034)
    {
        float _1096 = _1084 * _1022;
        _126 = _1096;
    }
    float _1098 = _126;
    bool _1100 = _154 > 0.5;
    bool _1102 = _1100 && _772;
    float _1104 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1106 = !_828;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = _1088 * _1094;
    bool _1112 = !_836;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = in.m_69.x;
    float _1118 = in.m_69.y;
    float _1120 = in.m_69.z;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1124 = _1104 + _1122;
    int _1126 = abs(_1108);
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1130 = _870 + _1128;
    int _1132 = abs(_1114);
    float _1134 = _1124 * _1124;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1138 = _876 + _1136;
    float _1140 = float(_1014);
    float _1142 = rsqrt(_984);
    float _1144 = fma(_1130, _1130, _1134);
    float _1146 = float(_1132);
    float _1148 = _1110 * (-2.0);
    float _1150 = float(_1126);
    float _1152 = fma(_1138, _1138, _1144);
    float _1154 = float(_1080);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1158 = _750 + _1156;
    float _1160 = rsqrt(_1152);
    float _1162 = _1150 * _1140;
    float _1164 = _1146 * _1154;
    float _1166 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1168 = fma(_1148, _1118, _1118);
    float _1170 = fma(_958, _1148, _958);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1176 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1168);
    float _1178 = _1164 * (-2.0);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1188 = fma(_1170, _1098, _1176);
    float _1190 = fma(_1178, _1120, _1120);
    float _1192 = 1.0 / _1174;
    float _1194 = _1188 * 0.15915493667125701904296875;
    float _1196 = _1162 * (-2.0);
    float _1198 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1190);
    float _1200 = _1124 * _1160;
    float _1202 = fma(_1166, _1178, _1166);
    float _1204 = fma(_858, _1196, _858);
    float _1206 = fma(_1196, _1116, _1116);
    float _1208 = _1130 * _1160;
    float _1210 = -_1200;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1214 = 1.0 / _1182;
    float _1216 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1206);
    float _1218 = -_1208;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1130);
    float _1222 = _1212 * _1212;
    float _1224 = _1138 * _1160;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1232 = _1230 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1234 = fma(_1220, _1220, _1222);
    float _1236 = 1.0 / _1186;
    float _1238 = -_1224;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1138);
    float _1242 = fma(_1202, _1098, _1198);
    float _1244 = in.m_71.x;
    float _1246 = in.m_71.y;
    float _1248 = in.m_71.z;
    float _1250 = fma(_1240, _1240, _1234);
    float _1252 = fma(_1204, _1098, _1216);
    float _1254 = _1228 * _1192;
    float _1256 = _1194 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1268 = _1242 * 0.15915493667125701904296875;
    float _1270 = 0.0;
    float _1272 = _1224;
    float _1274 = _1208;
    float _1276 = _1200;
    if (_772)
    {
        _1270 = _1036;
    }
    float _1278 = _1270;
    float _1280 = _1262 * _1214;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1284 = _750 + _1282;
    float _1286 = _1194 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    float _1290 = _1278;
    if (_1102)
    {
        float _1292 = -_1278;
        float _1294 = _1292 + 1.0;
        _1290 = _1294;
    }
    float _1296 = _1290;
    float _1298 = fma(_948, _1284, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1302 = _750 + _1300;
    if (_772)
    {
        _1072 = _1296;
    }
    float _1304 = _1072;
    float _1306 = 1.0 / _1232;
    float _1308 = _1082 * _1246;
    float _1310 = _1142 * _1248;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1312;
    float _1316 = _1252 * 0.15915493667125701904296875;
    float _1318 = sqrt(_1250);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1322 = _750 + _1320;
    float _1324 = _1314 * _1236;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1328 = _750 + _1326;
    float _1330 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1332 = fma(_946, _1322, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1334 = fma(_1254, _1328, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1336 = rsqrt(_980);
    float _1338 = _1266 * _1306;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1342 = _750 + _1340;
    float _1344 = fma(_1338, _1158, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1346 = fma(_1016, _1342, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1348 = fma(_1280, _1302, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1350 = sqrt(_980);
    float _1352 = _1160 * _1318;
    float _1354 = _906 * _1352;
    float _1356 = _954 * _1352;
    float _1358 = _1268 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _1336 * _1244;
    float _1364 = _1316 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1350 * _1362;
    float _1370 = _1350 * _1308;
    float _1372 = _1350 * _1310;
    bool _1374 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1376 = isnan(_750);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1368);
    bool _1388 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1390 = isnan(_750);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1372);
    float _1402 = _1316 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1258 * _1360;
    float _1408 = _1288 * _1360;
    float _1410 = -_1384;
    float _1412 = _1410 + 1.0;
    float _1414 = -_1398;
    float _1416 = _1414 + 1.0;
    float _1418 = _1354 * _1400;
    bool _1420 = _1370 != 0.0;
    bool _1422 = isnan(_1370);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(0.0);
    bool _1428 = _1424 || _1426;
    float _1430 = _1398 * _1412;
    float _1432 = _1268 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = _1366 * _1258;
    float _1438 = _1366 * _1288;
    float _1440 = _1366 * _1360;
    bool _1442 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1444 = isnan(_750);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1450 = _1446 || _1448;
    float _1452 = float(_1450);
    bool _1454 = _1368 == 0.0;
    bool _1456 = !_1428;
    bool _1458 = _1454 && _1456;
    float _1460 = _1404 * _1258;
    float _1462 = _1404 * _1360;
    float _1464 = _1330 * _1352;
    bool _1466 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1468 = isnan(_750);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = _1404 * _1288;
    float _1480 = -_1452;
    float _1482 = _1480 + 1.0;
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1486 = _1372 == 0.0;
    bool _1488 = _1486 && _1458;
    float _1490 = -_1460;
    float _1492 = fma(_1434, _1438, _1490);
    float _1494 = -_1438;
    float _1496 = fma(_1434, _1460, _1494);
    float _1498 = -_1476;
    float _1500 = _1498 + 1.0;
    float _1502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1370);
    float _1504 = fma(_1434, _1478, _1436);
    float _1506 = fma(_1434, _1436, _1478);
    float _1508 = _1476 * _1416;
    bool _1510 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1512 = isnan(_750);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = _1452 * _1500;
    float _1524 = _1464 * _1502;
    bool _1526 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1528 = isnan(_750);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = _1356 * _1386;
    float _1540 = -_1520;
    float _1542 = _1540 + 1.0;
    float _1544 = _1462 * _1524;
    bool _1546 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1548 = isnan(_750);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = -_1536;
    float _1560 = _1558 + 1.0;
    float _1562 = -_1524;
    float _1564 = _1434 * _1562;
    float _1566 = fma(_1504, _1538, _1544);
    float _1568 = _1520 * _1482;
    float _1570 = _1536 * _1542;
    bool _1572 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1574 = isnan(_750);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1580 = _1576 || _1578;
    float _1582 = float(_1580);
    float _1584 = _1556 * _1560;
    float _1586 = -_1556;
    float _1588 = _1586 + 1.0;
    float _1590 = _1440 * _1524;
    float _1592 = fma(_1408, _1538, _1564);
    float _1594 = fma(_1496, _1418, _1566);
    float _1596 = _1582 * _1588;
    float _1598 = fma(_1492, _1538, _1590);
    float _1600 = fma(_1406, _1418, _1592);
    float _1602 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1604 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1606 = _1332 * _1596;
    float _1608 = fma(_1506, _1418, _1598);
    float _1610 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1602);
    float _1612 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1604);
    float _1614 = -_1582;
    float _1616 = _1614 + 1.0;
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1620 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1610);
    float _1622 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1612);
    float _1624 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1606);
    float _1626 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1628 = _870 + _1620;
    float _1630 = _876 + _1622;
    float _1632 = fma(_1346, _1584, _1624);
    float _1634 = fma(_1626, _822, -0.5);
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1628 + _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1642 = _1630 + _1640;
    float _1644 = in.m_73.x;
    float _1646 = in.m_73.y;
    float _1648 = in.m_73.z;
    float _1650 = fma(_1298, _1570, _1632);
    float _1652 = _1638 * _1638;
    float _1654 = _1642 * _1642;
    float _1656 = in.m_65.w;
    float _1658 = fma(_1334, _1568, _1650);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1662 = _750 + _1660;
    float _1664 = _1652 + _1654;
    float _1666 = in.m_65.y;
    float _1668 = fma(_1348, _1522, _1658);
    float _1670 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1672 = sqrt(_1664);
    float _1674 = fma(_1324, _1662, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1676 = fma(_1344, _1508, _1668);
    float _1678 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1680 = fma(_1670, _1304, -0.5);
    float _1682 = -_1006;
    float _1684 = fma(_1086, _1634, _1682);
    float _1686 = fma(_1674, _1430, _1676);
    float _1688 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1678);
    float _1690 = fma(_1060, _1680, _1092);
    float _1692 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1686);
    float _1694 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1688);
    float _1696 = _1646;
    float _1698 = _1644;
    float _1700 = _1652;
    float _1702 = _1654;
    float _1704 = _1628;
    float _1706 = _1630;
    float _1708 = _1648;
    float _1710 = _1684;
    if (!_1488)
    {
        float _1712 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1646);
        _1696 = _1712;
    }
    float _1714 = _1696;
    if (!_1488)
    {
        float _1716 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1644);
        _1698 = _1716;
    }
    float _1718 = _1698;
    float _1720 = _1104 + _1694;
    bool _1722 = _1672 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1462 * _1714;
    float _1726 = -_1714;
    float _1728 = _1434 * _1726;
    float _1730 = _1440 * _1714;
    float _1732 = fma(_1504, _1718, _1724);
    float _1734 = _1672;
    float _1736 = _1720;
    if (!_1722)
    {
        _1074 = _1720;
    }
    float _1738 = _1074;
    bool _1740 = !_1722;
    float _1742 = _1738;
    if (!_1740)
    {
        float _1744 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1748 = _1672 + _1746;
        float _1750 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1752 = rsqrt(_1664);
        float _1754 = _1748 * _1744;
        float _1756 = _1754 * 0.15915493667125701904296875;
        float _1758 = _1756 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = _1756 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = fma(_1760, _1750, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1768 = _1752 * _1766;
        float _1770 = _1764 + (-1.0);
        float _1772 = fma(_1638, _1768, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1774 = fma(_1642, _1768, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1776 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1780 = _1772 + _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1784 = _1774 + _1782;
        float _1786 = fma(_1720, _1764, _1776);
        float _1788 = _1780 * _1780;
        float _1790 = _1784 * _1784;
        _1742 = _1786;
        _1700 = _1788;
        _1702 = _1790;
        _1704 = _1772;
        _1706 = _1774;
        _1734 = _1748;
    }
    float _1792 = _1742;
    float _1794 = _1700;
    float _1796 = _1702;
    float _1798 = _1704;
    float _1800 = _1706;
    float _1802 = _1734;
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1806 = _1792 + _1804;
    float _1808 = _1802;
    if (!_1488)
    {
        float _1810 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1648);
        _1708 = _1810;
    }
    float _1812 = _1708;
    float _1814 = fma(_1408, _1718, _1728);
    float _1816 = fma(_1492, _1718, _1730);
    float _1818 = fma(_1806, _1806, _1794);
    float _1820 = fma(_1496, _1812, _1732);
    float _1822 = fma(_1406, _1812, _1814);
    float _1824 = fma(_1506, _1812, _1816);
    float _1826 = _1818 + _1796;
    float _1828 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1834 = _1690 + 0.5;
    float _1836 = fma(_1822, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1828);
    float _1838 = sqrt(_1826);
    float _1840 = fma(_1822, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1830);
    float _1842 = fma(_1822, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1832);
    float _1844 = fma(_1824, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1836);
    float _1846 = _1684 + 0.5;
    float _1848 = fma(_1824, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1840);
    float _1850 = fma(_1824, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1842);
    out.m_67.y = _1666;
    out.m_67.w = _1656;
    out.m_75.x = _1834;
    out.m_75.y = _1846;
    bool _1852 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1854 = isnan(_1838);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1860 = _1856 || _1858;
    out.m_77.x = _1692;
    out.m_79.x = _1844;
    out.m_79.y = _1848;
    out.m_79.z = _1850;
    float _1862 = _1846;
    float _1864 = _1822;
    if (!_1860)
    {
        _1710 = 1.0;
    }
    float _1866 = _1710;
    bool _1868 = !_1860;
    float _1870 = _1866;
    if (!_1868)
    {
        bool _1872 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1874 = isnan(_1838);
        bool _1876 = _1872 || _1874;
        bool _1878 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1880 = _1876 || _1878;
        if (!_1880)
        {
            float _1882 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1884 = _1838 + _1882;
            float _1886 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1888 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1886;
            float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1892 = _1890 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1894 = 1.0 / _1888;
            float _1896 = _1884 * _1894;
            float _1898 = fma(_1896, _1892, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1870 = _1898;
            _1900 = true;
        }
        else
        {
            bool _1902 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1904 = isnan(_1838);
            bool _1906 = _1902 || _1904;
            bool _1908 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1910 = _1906 || _1908;
            if (!_1910)
            {
                float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1914 = _1838 + _1912;
                float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1918 = _1916 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1920 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1922 = _1920 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1924 = 1.0 / _1918;
                float _1926 = _1914 * _1924;
                float _1928 = fma(_1926, _1922, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1870 = _1928;
                _1900 = true;
            }
            else
            {
                _1870 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1900 = false;
    float _1930 = _1870;
    float _1932 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1934 = _1792 + _1932;
    float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1938 = _1798 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1942 = _1800 + _1940;
    float _1944 = fma(_1934, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1946 = fma(_1938, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1948 = fma(_1942, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1950 = -_1200;
    float _1952 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1944);
    float _1954 = -_1208;
    float _1956 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1946);
    float _1958 = -_1224;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1948);
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1964 = _1952 + _1962;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1968 = _1956 + _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1972 = _1960 + _1970;
    float _1974 = _1964 * _1964;
    float _1976 = fma(_1968, _1968, _1974);
    float _1978 = fma(_1972, _1972, _1976);
    float _1980 = rsqrt(_1978);
    float _1982 = _1980 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1984 = _1968 * _1982;
    float _1986 = _1972 * _1982;
    float _1988 = _1984 * _1984;
    float _1990 = _1986 * _1986;
    float _1992 = _1988 + _1990;
    float _1994 = sqrt(_1992);
    bool _1996 = _1994 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2000 = _1994 + _1998;
    float _2002 = _1972;
    float _2004 = _2000;
    float _2006 = _1964;
    float _2008 = _1984;
    if (_1996)
    {
        float _2010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2002 = _2010;
    }
    float _2012 = _2002;
    if (_1996)
    {
        float _2014 = rsqrt(_1992);
        _1862 = _2014;
    }
    float _2016 = _1862;
    float _2018 = _2016;
    if (_1996)
    {
        float _2020 = _2000 * _2012;
        _2004 = _2020;
    }
    float _2022 = _2004;
    if (_1996)
    {
        float _2024 = _2022 * 0.15915493667125701904296875;
        _1808 = _2024;
    }
    float _2026 = _1808;
    float _2028 = _1980;
    float _2030 = _2026;
    if (_1996)
    {
        float _2032 = _2026 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _2028 = _2034;
    }
    float _2036 = _2028;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = precise::max(0.0, _2038);
    float _2042 = _2012;
    float _2044 = _2040;
    if (_1996)
    {
        float _2046 = _2026 * 6.283185482025146484375;
        float _2048 = cos(_2046);
        _2042 = _2048;
    }
    float _2050 = _2042;
    float _2052 = -_1982;
    float _2054 = -_2040;
    float _2056 = fma(_1964, _2052, _2054);
    if (_1996)
    {
        float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2058;
    }
    float _2060 = _2006;
    float _2062 = _2060;
    if (!_1996)
    {
        _2030 = _1988;
    }
    float _2064 = _2030;
    float _2066 = _2036;
    float _2068 = _2064;
    if (_1996)
    {
        float _2070 = fma(_2036, _2060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2066 = _2070;
    }
    float _2072 = _2066;
    float _2074 = _2072;
    if (!_1996)
    {
        _2062 = _1990;
    }
    float _2076 = _2062;
    float _2078 = _2076;
    if (_1996)
    {
        float _2080 = _2050 + (-1.0);
        _2044 = _2080;
    }
    float _2082 = _2044;
    if (_1996)
    {
        float _2084 = _2016 * _2072;
        _1864 = _2084;
    }
    float _2086 = _1864;
    if (!_1996)
    {
        _2018 = _2056;
    }
    float _2088 = _2018;
    float _2090 = _2088;
    if (_1996)
    {
        float _2092 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _2092;
    }
    float _2094 = _1736;
    if (_1996)
    {
        float _2096 = _1984 * _2086;
        _2008 = _2096;
    }
    float _2098 = _2008;
    float _2100 = sqrt(_1978);
    if (!_1996)
    {
        _2074 = _1986;
    }
    float _2102 = _2074;
    float _2104 = _2102;
    if (_1996)
    {
        float _2106 = fma(_2056, _2050, _2094);
        _2090 = _2106;
    }
    float _2108 = _2090;
    if (_1996)
    {
        float _2110 = _1986 * _2086;
        _2104 = _2110;
    }
    float _2112 = _2104;
    if (_1996)
    {
        float _2114 = _2098 * _2098;
        _2068 = _2114;
    }
    float _2116 = _2068;
    float _2118 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1996)
    {
        float _2120 = _2112 * _2112;
        _2078 = _2120;
    }
    float _2122 = _2078;
    float _2124 = fma(_2108, _2108, _2116);
    float _2126 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2128 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2118);
    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2132 = _2124 + _2122;
    float _2134 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2136 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2128);
    float _2138 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2126);
    float _2140 = rsqrt(_2132);
    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2144 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2142);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2134);
    float _2150 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2152 = -_2146;
    float _2154 = _2152 + 1.0;
    float _2156 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2158 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2148);
    float _2160 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2162 = abs(_2154);
    float _2164 = log2(_2162);
    float _2166 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2156);
    float _2168 = -_2160;
    float _2170 = fma(_2168, _2130, 1.0);
    float _2172 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2138);
    float _2174 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2166);
    float _2176 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = _2140 * _2098;
    float _2180 = _2140 * _2108;
    float _2182 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2184 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2186 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2188 = _2140 * _2112;
    float _2190 = log2(_2170);
    float _2192 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2184);
    float _2194 = -_2186;
    float _2196 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2194);
    float _2198 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2202 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2192);
    float _2204 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2206 = _2180 + 1.0;
    float _2208 = -_2188;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2196);
    float _2212 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2202);
    float _2214 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2216 = exp2(_2200);
    float _2218 = fma(_2210, -0.5, 0.5);
    float _2220 = fma(_2210, 0.5, 0.5);
    float _2222 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2204);
    float _2224 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2214);
    float _2226 = fma(_2220, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2228 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2222);
    float _2230 = 1.0 / _2212;
    float _2232 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2224);
    float _2234 = fma(_2220, _2226, -0.212114393711090087890625);
    float _2236 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2228);
    float _2238 = _2190 * 0.693147182464599609375;
    float _2240 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2232);
    float _2242 = fma(_2220, _2234, 1.570728778839111328125);
    float _2244 = sqrt(_2218);
    float _2246 = -_2180;
    float _2248 = fma(_2216, _2206, _2246);
    float _2250 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2252 = _2236 * _2230;
    float _2254 = _2240 * _2230;
    float _2256 = fma(_2252, 0.5, 0.5);
    float _2258 = fma(_2254, -0.5, 0.5);
    float _2260 = _2244 * 0.636619746685028076171875;
    float3 _6177 = float3(_2256, _2258, _2250);
    float _2262 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6177, float3(0.0), isnan(_6177)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6177, float3(0.0), isnan(_6177)), level(0.0)).x;
    float _2264 = -_2242;
    float _2266 = fma(_2260, _2264, 1.0);
    float _2268 = fma(_2248, 0.5, 0.5);
    float3 _6195 = float3(_2256, _2258, _2250);
    float4 _2271 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6195, float3(0.0), isnan(_6195)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6195, float3(0.0), isnan(_6195)), level(0.0)).xyzw;
    float _2273 = _2271.x;
    float _2275 = _2271.y;
    float _2277 = _2271.z;
    float _2279 = _2271.w;
    float2 _6212 = float2(_2266, _2268);
    float3 _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6212, float2(0.0), isnan(_6212)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6212, float2(0.0), isnan(_6212)), level(0.0)).xyz;
    float _2285 = _2283.x;
    float _2287 = _2283.y;
    float _2289 = _2283.z;
    float _2291 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2293 = -_1200;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1104);
    float _2297 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2299 = -_1208;
    float _2301 = fma(_2299, (*spvDescriptorSet0.vp_c9)._m0[18].w, _870);
    float _2303 = -_1224;
    float _2305 = fma(_2303, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    out.m_81.x = _1956;
    out.m_81.y = _1952;
    out.m_81.z = _1960;
    float _2307 = exp2(_2291);
    float _2309 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2297);
    bool _2311 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2313 = isnan(_2100);
    bool _2315 = _2311 || _2313;
    bool _2317 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2319 = _2315 || _2317;
    out.m_83.x = _2301;
    out.m_83.y = _2295;
    out.m_83.z = _2305;
    float _2321 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2309);
    float _2323 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2321);
    float _2325 = _2323 + _2212;
    out.gl_Position.x = _2236;
    out.gl_Position.y = _2240;
    out.gl_Position.z = _2323;
    out.gl_Position.w = _2212;
    float _2327 = _2212;
    if (!_2319)
    {
        _1272 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2329 = _1272;
    float _2331 = -_2307;
    float _2333 = _2331 + 1.0;
    float _2335 = _2325 * 0.5;
    float _2337 = _2335;
    float _2339 = _2329;
    float _2341 = _2329;
    if (!_2319)
    {
        _1274 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2343 = _1274;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2347 = _2343;
    float _2349 = _2343;
    if (!_2319)
    {
        _1276 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2351 = _1276;
    out.m_85.z = _2335;
    out.m_85.w = _2212;
    float _2353 = _2351;
    float _2355 = _2351;
    if (!_2319)
    {
        _2327 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2357 = _2327;
    float _2359 = _2357;
    float _2361 = _2357;
    if (!_2319)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2363 = _2337;
    float _2365 = _2345 * _2262;
    float _2367 = -_2345;
    float _2369 = _2367 + 1.0;
    float _2371 = _2279 * _2365;
    float _2373 = _2279 * _2369;
    float _2375 = _2369;
    float _2377 = _2363;
    float _2379 = _2363;
    if (!_2319)
    {
        _2375 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2381 = _2375;
    float _2383 = _2289 * _2365;
    float _2385 = fma(_2285, _2371, _2273);
    float _2387 = fma(_2287, _2371, _2275);
    float _2389 = fma(_2279, _2383, _2277);
    out.m_87.x = _2385;
    out.m_87.y = _2387;
    out.m_87.z = _2389;
    out.m_87.w = _2373;
    bool _2391 = !_2319;
    float _2393 = _2381;
    float _2395 = _2381;
    if (!_2391)
    {
        bool _2397 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2399 = isnan(_2100);
        bool _2401 = _2397 || _2399;
        bool _2403 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2405 = _2401 || _2403;
        if (!_2405)
        {
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2409 = _2100 + _2407;
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2413 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2411;
            float _2415 = 1.0 / _2413;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2437 = _2409 * _2415;
            float _2439 = precise::clamp(_2437, 0.0, 1.0);
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2445 = fma(_2439, _2419, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2447 = fma(_2439, _2443, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2449 = fma(_2439, _2423, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2451 = fma(_2439, _2427, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2453 = fma(_2439, _2431, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2455 = fma(_2439, _2435, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2349 = _2447;
            _2361 = _2453;
            _2341 = _2445;
            _2395 = _2451;
            _2355 = _2449;
            _2379 = _2455;
            _2457 = true;
        }
        else
        {
            bool _2459 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2461 = isnan(_2100);
            bool _2463 = _2459 || _2461;
            bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2467 = _2463 || _2465;
            if (!_2467)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2469 = _2339;
            _2341 = _2469;
            if (!_2467)
            {
                _2347 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2471 = _2347;
            _2349 = _2471;
            if (!_2467)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2473 = _2353;
            _2355 = _2473;
            if (!_2467)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2475 = _2393;
            _2395 = _2475;
            if (!_2467)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2477 = _2359;
            _2361 = _2477;
            if (!_2467)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2479 = _2377;
            bool _2481 = !_2467;
            _2379 = _2479;
            if (!_2481)
            {
                bool _2483 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2485 = isnan(_2100);
                bool _2487 = _2483 || _2485;
                bool _2489 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2491 = _2487 || _2489;
                if (!_2491)
                {
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2495 = _2100 + _2493;
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2499 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2497;
                    float _2501 = 1.0 / _2499;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2523 = _2495 * _2501;
                    float _2525 = precise::clamp(_2523, 0.0, 1.0);
                    float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2531 = fma(_2525, _2505, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2533 = fma(_2525, _2529, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2535 = fma(_2525, _2509, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2537 = fma(_2525, _2513, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2539 = fma(_2525, _2517, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2541 = fma(_2525, _2521, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2349 = _2533;
                    _2361 = _2539;
                    _2341 = _2531;
                    _2395 = _2537;
                    _2355 = _2535;
                    _2379 = _2541;
                    _2457 = true;
                }
                else
                {
                    _2349 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2457 = false;
    float _2543 = _2349;
    float _2545 = _2361;
    float _2547 = _2341;
    float _2549 = _2395;
    float _2551 = _2355;
    float _2553 = _2379;
    float _2555 = fma(_1848, -0.5, 0.5);
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = -_2543;
    float _2561 = _2559 + _2545;
    float _2563 = -_2547;
    float _2565 = _2563 + _2549;
    float _2567 = -_2551;
    float _2569 = _2567 + _2553;
    bool _2571 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2573 = fma(_2557, _2561, _2543);
    float _2575 = fma(_2557, _2565, _2547);
    float _2577 = fma(_2557, _2569, _2551);
    float _2579 = _2573 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2581 = fma(_2575, 0.298911988735198974609375, _2579);
    out.m_89.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2583 = fma(_2577, 0.114477999508380889892578125, _2581);
    out.m_91.x = 0.0;
    float _2585 = -_2583;
    float _2587 = _2575 + _2585;
    float _2589 = -_2583;
    float _2591 = _2573 + _2589;
    float _2593 = -_2583;
    float _2595 = _2577 + _2593;
    float _2597 = fma(_2587, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2583);
    float _2599 = fma(_2591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2583);
    float _2601 = fma(_2595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2583);
    out.m_93.x = _2597;
    out.m_93.y = _2599;
    out.m_93.z = _2601;
    if (!_2571)
    {
        return out;
    }
    float _2603 = -_1952;
    float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2607 = -_1956;
    float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2611 = -_1960;
    float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2615 = _2605 * _2605;
    float _2617 = fma(_2609, _2609, _2615);
    float _2619 = fma(_2613, _2613, _2617);
    float _2621 = sqrt(_2619);
    float _2623 = rsqrt(_2619);
    float _2625 = -_2621;
    float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2629 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2631 = precise::clamp(_2629, 0.0, 1.0);
    float _2633 = _2609 * _2623;
    float _2635 = _2605 * _2623;
    float _2637 = abs(_2631);
    float _2639 = log2(_2637);
    float _2641 = _2613 * _2623;
    float _2643 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2645 = _1848 * _2635;
    float _2647 = -_2635;
    float _2649 = -_2643;
    float _2651 = fma(_2647, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2649);
    float _2653 = fma(_1844, _2633, _2645);
    float _2655 = -_2641;
    float _2657 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2651);
    float _2659 = fma(_1850, _2641, _2653);
    float _2661 = precise::clamp(_2659, 0.0, 1.0);
    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2665 = _2657 + _2663;
    float _2667 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2669 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2671 = precise::clamp(_2669, 0.0, 1.0);
    float _2673 = exp2(_2667);
    float _2675 = _2673 * _2671;
    float _2677 = _2661 * _2675;
    float _2679 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2681 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2683 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2679;
    out.m_91.y = _2681;
    out.m_91.z = _2683;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2457 = false;
    bool _1900 = false;
    bool _530 = false;
    bool _316 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = in.m_48.w;
    float _111 = trunc(_107);
    int _114 = int(_111);
    float _116 = -_109;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _118;
    bool _122 = _114 >= 1;
    float _124 = 0.0;
    float _126 = _118;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    float _130 = _128;
    if (!_122)
    {
        out.m_53.x = 0.0;
    }
    int _132 = 0;
    if (!_122)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2751 = as_type<float>(_136);
        out.gl_Position.z = _2751;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _140 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_109);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = in.m_55.x;
    float _152 = float(_114);
    float _154 = in.m_55.y;
    bool _156 = _118 >= _152;
    bool _158 = !_148;
    bool _160 = _156 || _158;
    float _162 = 1.0 / _152;
    if (_160)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _130;
    float _166 = _164;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _168 = _164 * 5.0;
        _138 = as_type<int>(_168);
    }
    int _170 = _138;
    float _172 = _118 * _162;
    out.m_57.x = _150;
    float _174 = _172;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2819 = as_type<float>(_170);
        out.gl_Position.z = _2819;
    }
    out.m_57.y = _154;
    out.m_51.x = _172;
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_59.w;
    float _178 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_48.x;
    float _192 = in.m_48.y;
    float _194 = in.m_48.z;
    float _196 = in.m_46.x;
    float _198 = in.m_46.y;
    float _200 = in.m_46.z;
    float _202 = _178;
    if (!_188)
    {
        float _204 = _178 * _178;
        float _206 = _204 * 0.5;
        _166 = _206;
    }
    float _208 = _166;
    float _210 = _208;
    if (!_188)
    {
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_188;
    float _218 = _214;
    if (!_216)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _178 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _178);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _248;
    }
    float _250 = _218;
    bool _252 = !_188;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _178 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _202 = _272;
    }
    float _274 = _202;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _278 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _282 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _284 = fma(_274, _190, _278);
    float _286 = fma(_274, _192, _280);
    float _288 = fma(_274, _194, _282);
    float _290 = fma(_284, _176, _196);
    float _292 = fma(_286, _176, _198);
    float _294 = fma(_288, _176, _200);
    bool _296 = !_276;
    float _298 = _294;
    float _314;
    if (!_296)
    {
        float _300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _302 = _150 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _306 = _304 * _300;
        float _308 = floor(_306);
        float _310 = -_308;
        float _312 = _306 + _310;
        _314 = _312;
        _316 = true;
    }
    else
    {
        _314 = _172;
    }
    _316 = false;
    float _318 = _314;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _318 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _318 + _324;
    bool _328 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _330 = isnan(_318);
    bool _332 = _328 || _330;
    bool _334 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _336 = _332 || _334;
    float _338 = float(_336);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _346 = _318 + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _356 = 1.0 / _342;
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _360 = 1.0 / _354;
    float _362 = 1.0 / _350;
    float _364 = _322 * _356;
    bool _366 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _368 = isnan(_318);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_338;
    float _380 = _378 + 1.0;
    float _382 = _376 * _380;
    float _384 = _326 * _360;
    bool _386 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _388 = isnan(_318);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _398;
    bool _402 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _404 = isnan(_318);
    bool _406 = _402 || _404;
    bool _408 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _410 = _406 || _408;
    float _412 = float(_410);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _418 = -_376;
    float _420 = _418 + 1.0;
    float _422 = -_396;
    float _424 = _422 + 1.0;
    float _426 = _346 * _362;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _432;
    float _436 = _412 * _424;
    float _438 = fma(_400, _426, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _440 = fma(_430, _426, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _442 = fma(_434, _426, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = _396 * _420;
    float _446 = -_412;
    float _448 = _446 + 1.0;
    float _450 = _440 * _436;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = _442 * _436;
    float _462 = _438 * _436;
    float _464 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].x, _450);
    float _466 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].y, _460);
    float _468 = fma(_416, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _470 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[143].z, _462);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _472;
    float _476 = fma(_454, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = fma(_458, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_468, _444, _464);
    float _490 = fma(_474, _364, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _492 = fma(_482, _364, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _494 = fma(_486, _364, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _496 = fma(_476, _444, _466);
    float _498 = fma(_478, _444, _470);
    float _500 = fma(_490, _382, _488);
    float _502 = fma(_492, _382, _496);
    float _504 = fma(_494, _382, _498);
    float _506 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[146].x, _500);
    float _508 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[146].z, _504);
    bool _512 = !_358;
    float _528;
    if (!_512)
    {
        float _514 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _516 = _150 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _518 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _520 = _518 * _514;
        float _522 = floor(_520);
        float _524 = -_522;
        float _526 = _520 + _524;
        _528 = _526;
        _530 = true;
    }
    else
    {
        _528 = _172;
    }
    _530 = false;
    float _532 = _528;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _532 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _550 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_532);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _540;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _570 = isnan(_532);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    bool _580 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _582 = 1.0 / _548;
    float _584 = _544 * _562;
    bool _586 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _588 = isnan(_532);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = 1.0 / _566;
    float _600 = -_560;
    float _602 = _600 + 1.0;
    float _604 = fma(_584, _536, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _610 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _612 = isnan(_532);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -_596;
    float _624 = _622 + 1.0;
    float _626 = _596 * _602;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _632 = 1.0 / _608;
    float _634 = -_620;
    float _636 = _634 + 1.0;
    float _638 = _578 * _624;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _640;
    float _644 = _630 * _582;
    float _646 = _560 * _636;
    float _648 = _604 * _638;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _652 = _532 + _650;
    float _654 = -_578;
    float _656 = _654 + 1.0;
    bool _658 = _532 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _660 = isnan(_532);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = _642 * _598;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _674 = _672 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _678 = _532 + _676;
    float _680 = fma(_644, _652, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _682 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _684 = -_668;
    float _686 = _684 + 1.0;
    float _688 = _674 * _632;
    float _690 = fma(_670, _678, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _694 = _532 + _692;
    float _696 = fma(_680, _626, _682);
    float _698 = _620 * _686;
    float _700 = fma(_688, _694, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _702 = fma(_690, _646, _696);
    float _704 = fma(_700, _698, _702);
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[119].x, _704);
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _720 = _712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _722 = in.m_59.x;
    float _724 = in.m_59.y;
    float _726 = in.m_59.z;
    out.m_61.x = _714;
    out.m_61.y = _716;
    out.m_61.z = _720;
    out.m_61.w = _718;
    float _728 = _510 * _726;
    float _730 = _508 * _724;
    float _732 = _506 * _722;
    bool _734 = !_580;
    if (!_734)
    {
        float _736 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _738 = _150 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[14].x, _118);
        float _742 = _740 * _736;
        float _744 = floor(_742);
        float _746 = -_744;
        float _748 = _742 + _746;
        _174 = _748;
    }
    float _750 = _174;
    float _752 = in.m_63.y;
    float _754 = _150 * 2.0;
    float _756 = in.m_55.z;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _760 = _758 != 0;
    float _762 = floor(_754);
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _766 = _764 != 0;
    float _768 = in.m_65.x;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _772 = _770 != 0;
    float _774 = _292 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _776 = _292 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = _292 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _780 = _154 * 2.0;
    float _782 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].x, _774);
    float _784 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _786 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _788 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[4].z, _782);
    float _790 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[5].z, _784);
    float _792 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _794 = log2(_792);
    float _796 = -_752;
    float _798 = _796 + 1.0;
    float _800 = _784;
    float _802 = _752;
    if (_766)
    {
        _800 = _154;
    }
    float _804 = _800;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _810 = _804;
    if (!_766)
    {
        _810 = _150;
    }
    float _812 = _810;
    float _814 = _756 * 2.0;
    bool _816 = _756 > 0.5;
    float _818 = 1.0 / _808;
    out.m_67.x = _768;
    if (_760)
    {
        float _820 = _816 ? _798 : _752;
        _802 = _820;
    }
    float _822 = _802;
    float _824 = _150 + _154;
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _832 = _830 != 0;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _836 = _834 != 0;
    float _838 = fma(_294, (*spvDescriptorSet0.vp_c10)._m0[6].z, _786);
    bool _840 = _762 > 0.0;
    float _842 = floor(_814);
    float _844 = _824 + (-1.0);
    bool _846 = _762 >= 0.0;
    bool _848 = isnan(_762);
    bool _850 = _846 || _848;
    bool _852 = isnan(0.0);
    bool _854 = _850 || _852;
    float _856 = _812 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _858 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _860 = _154 + (-0.5);
    float _862 = floor(_780);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    if (_766)
    {
        _298 = _150;
    }
    float _868 = _298;
    float _870 = _788 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _872 = _868;
    if (!_766)
    {
        _872 = _756;
    }
    float _874 = _872;
    float _876 = _838 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _878 = _150 + _756;
    bool _880 = _842 >= 0.0;
    bool _882 = isnan(_842);
    bool _884 = _880 || _882;
    bool _886 = isnan(0.0);
    bool _888 = _884 || _886;
    float _890 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _892 = 1.0 / _866;
    int _894 = _854 ? 0 : 1;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _900 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _890);
    float _902 = _878 + (-1.0);
    int _904 = _888 ? 0 : 1;
    float _906 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _908 = _862 > 0.0;
    float _910 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _912 = _862 >= 0.0;
    bool _914 = isnan(_862);
    bool _916 = _912 || _914;
    bool _918 = isnan(0.0);
    bool _920 = _916 || _918;
    float _922 = 1.0 / _898;
    float _924 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _910);
    float _926 = _154 + _756;
    float _928 = _756 + (-0.5);
    float _930 = _926 + (-1.0);
    float _932 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _938;
    int _942 = _920 ? 0 : 1;
    float _944 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _932);
    float _946 = _936 * _818;
    float _948 = _940 * _892;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _954 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _956 = _842 > 0.0;
    float _958 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _960 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _944);
    float _962 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _968 = ~_894;
    int _970 = _968 + 1;
    int _972 = _970 + 1;
    float _974 = -_964;
    float _976 = fma(_962, 2.0, _974);
    float _978 = _794 * _118;
    float _980 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _900);
    float _982 = fma(_856, -2.0, _966);
    float _984 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _924);
    int _986 = _972;
    if (!_840)
    {
        int _988 = ~_894;
        int _990 = _988 + 1;
        _986 = _990;
    }
    int _992 = _986;
    float _994 = exp2(_978);
    int _996 = ~_904;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1004 = 1.0 + _1002;
    float _1006 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[86].y, _982);
    int _1008 = _1000;
    if (!_956)
    {
        int _1010 = ~_904;
        int _1012 = _1010 + 1;
        _1008 = _1012;
    }
    int _1014 = _1008;
    float _1016 = _952 * _922;
    bool _1018 = !_832;
    int _1020 = _1018 ? 0 : 1;
    float _1022 = 1.0 / _1004;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1026 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1028 = isnan(1.0);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1034 = _1030 || _1032;
    float _1036 = in.m_63.x;
    int _1038 = abs(_1020);
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1042 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1024);
    float _1044 = -_994;
    float _1046 = _1044 + 1.0;
    bool _1048 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1050 = isnan(0.0);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1056 = _1052 || _1054;
    float _1058 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1040);
    float _1060 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1042);
    int _1062 = ~_942;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    float _1068 = _150 + (-0.5);
    int _1070 = _1066;
    float _1072 = _1036;
    float _1074 = _1060;
    if (!_908)
    {
        int _1076 = ~_942;
        int _1078 = _1076 + 1;
        _1070 = _1078;
    }
    int _1080 = _1070;
    float _1082 = rsqrt(_960);
    float _1084 = _1056 ? _1046 : 0.0;
    float _1086 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1058);
    float _1088 = float(_1038);
    float _1090 = -_118;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[86].x, _976);
    float _1094 = float(_992);
    if (_1034)
    {
        float _1096 = _1084 * _1022;
        _126 = _1096;
    }
    float _1098 = _126;
    bool _1100 = _154 > 0.5;
    bool _1102 = _1100 && _772;
    float _1104 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1106 = !_828;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = _1088 * _1094;
    bool _1112 = !_836;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = in.m_69.x;
    float _1118 = in.m_69.y;
    float _1120 = in.m_69.z;
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1124 = _1104 + _1122;
    int _1126 = abs(_1108);
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1130 = _870 + _1128;
    int _1132 = abs(_1114);
    float _1134 = _1124 * _1124;
    float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1138 = _876 + _1136;
    float _1140 = float(_1014);
    float _1142 = rsqrt(_984);
    float _1144 = fma(_1130, _1130, _1134);
    float _1146 = float(_1132);
    float _1148 = _1110 * (-2.0);
    float _1150 = float(_1126);
    float _1152 = fma(_1138, _1138, _1144);
    float _1154 = float(_1080);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1158 = _750 + _1156;
    float _1160 = rsqrt(_1152);
    float _1162 = _1150 * _1140;
    float _1164 = _1146 * _1154;
    float _1166 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1168 = fma(_1148, _1118, _1118);
    float _1170 = fma(_958, _1148, _958);
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1174 = _1172 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1176 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1168);
    float _1178 = _1164 * (-2.0);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1182 = _1180 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1184 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1186 = _1184 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1188 = fma(_1170, _1098, _1176);
    float _1190 = fma(_1178, _1120, _1120);
    float _1192 = 1.0 / _1174;
    float _1194 = _1188 * 0.15915493667125701904296875;
    float _1196 = _1162 * (-2.0);
    float _1198 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1190);
    float _1200 = _1124 * _1160;
    float _1202 = fma(_1166, _1178, _1166);
    float _1204 = fma(_858, _1196, _858);
    float _1206 = fma(_1196, _1116, _1116);
    float _1208 = _1130 * _1160;
    float _1210 = -_1200;
    float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1124);
    float _1214 = 1.0 / _1182;
    float _1216 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1206);
    float _1218 = -_1208;
    float _1220 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1130);
    float _1222 = _1212 * _1212;
    float _1224 = _1138 * _1160;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1232 = _1230 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1234 = fma(_1220, _1220, _1222);
    float _1236 = 1.0 / _1186;
    float _1238 = -_1224;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1138);
    float _1242 = fma(_1202, _1098, _1198);
    float _1244 = in.m_71.x;
    float _1246 = in.m_71.y;
    float _1248 = in.m_71.z;
    float _1250 = fma(_1240, _1240, _1234);
    float _1252 = fma(_1204, _1098, _1216);
    float _1254 = _1228 * _1192;
    float _1256 = _1194 * 6.283185482025146484375;
    float _1258 = sin(_1256);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1268 = _1242 * 0.15915493667125701904296875;
    float _1270 = 0.0;
    float _1272 = _1224;
    float _1274 = _1208;
    float _1276 = _1200;
    if (_772)
    {
        _1270 = _1036;
    }
    float _1278 = _1270;
    float _1280 = _1262 * _1214;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1284 = _750 + _1282;
    float _1286 = _1194 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    float _1290 = _1278;
    if (_1102)
    {
        float _1292 = -_1278;
        float _1294 = _1292 + 1.0;
        _1290 = _1294;
    }
    float _1296 = _1290;
    float _1298 = fma(_948, _1284, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1302 = _750 + _1300;
    if (_772)
    {
        _1072 = _1296;
    }
    float _1304 = _1072;
    float _1306 = 1.0 / _1232;
    float _1308 = _1082 * _1246;
    float _1310 = _1142 * _1248;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1312;
    float _1316 = _1252 * 0.15915493667125701904296875;
    float _1318 = sqrt(_1250);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1322 = _750 + _1320;
    float _1324 = _1314 * _1236;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1328 = _750 + _1326;
    float _1330 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1332 = fma(_946, _1322, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1334 = fma(_1254, _1328, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1336 = rsqrt(_980);
    float _1338 = _1266 * _1306;
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1342 = _750 + _1340;
    float _1344 = fma(_1338, _1158, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1346 = fma(_1016, _1342, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1348 = fma(_1280, _1302, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1350 = sqrt(_980);
    float _1352 = _1160 * _1318;
    float _1354 = _906 * _1352;
    float _1356 = _954 * _1352;
    float _1358 = _1268 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _1336 * _1244;
    float _1364 = _1316 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1350 * _1362;
    float _1370 = _1350 * _1308;
    float _1372 = _1350 * _1310;
    bool _1374 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1376 = isnan(_750);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1368);
    bool _1388 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1390 = isnan(_750);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1372);
    float _1402 = _1316 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1258 * _1360;
    float _1408 = _1288 * _1360;
    float _1410 = -_1384;
    float _1412 = _1410 + 1.0;
    float _1414 = -_1398;
    float _1416 = _1414 + 1.0;
    float _1418 = _1354 * _1400;
    bool _1420 = _1370 != 0.0;
    bool _1422 = isnan(_1370);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan(0.0);
    bool _1428 = _1424 || _1426;
    float _1430 = _1398 * _1412;
    float _1432 = _1268 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = _1366 * _1258;
    float _1438 = _1366 * _1288;
    float _1440 = _1366 * _1360;
    bool _1442 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1444 = isnan(_750);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1450 = _1446 || _1448;
    float _1452 = float(_1450);
    bool _1454 = _1368 == 0.0;
    bool _1456 = !_1428;
    bool _1458 = _1454 && _1456;
    float _1460 = _1404 * _1258;
    float _1462 = _1404 * _1360;
    float _1464 = _1330 * _1352;
    bool _1466 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1468 = isnan(_750);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = _1404 * _1288;
    float _1480 = -_1452;
    float _1482 = _1480 + 1.0;
    float _1484 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1486 = _1372 == 0.0;
    bool _1488 = _1486 && _1458;
    float _1490 = -_1460;
    float _1492 = fma(_1434, _1438, _1490);
    float _1494 = -_1438;
    float _1496 = fma(_1434, _1460, _1494);
    float _1498 = -_1476;
    float _1500 = _1498 + 1.0;
    float _1502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1370);
    float _1504 = fma(_1434, _1478, _1436);
    float _1506 = fma(_1434, _1436, _1478);
    float _1508 = _1476 * _1416;
    bool _1510 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1512 = isnan(_750);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = _1452 * _1500;
    float _1524 = _1464 * _1502;
    bool _1526 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1528 = isnan(_750);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = _1356 * _1386;
    float _1540 = -_1520;
    float _1542 = _1540 + 1.0;
    float _1544 = _1462 * _1524;
    bool _1546 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1548 = isnan(_750);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    float _1558 = -_1536;
    float _1560 = _1558 + 1.0;
    float _1562 = -_1524;
    float _1564 = _1434 * _1562;
    float _1566 = fma(_1504, _1538, _1544);
    float _1568 = _1520 * _1482;
    float _1570 = _1536 * _1542;
    bool _1572 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1574 = isnan(_750);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1580 = _1576 || _1578;
    float _1582 = float(_1580);
    float _1584 = _1556 * _1560;
    float _1586 = -_1556;
    float _1588 = _1586 + 1.0;
    float _1590 = _1440 * _1524;
    float _1592 = fma(_1408, _1538, _1564);
    float _1594 = fma(_1496, _1418, _1566);
    float _1596 = _1582 * _1588;
    float _1598 = fma(_1492, _1538, _1590);
    float _1600 = fma(_1406, _1418, _1592);
    float _1602 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1604 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1606 = _1332 * _1596;
    float _1608 = fma(_1506, _1418, _1598);
    float _1610 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1602);
    float _1612 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1604);
    float _1614 = -_1582;
    float _1616 = _1614 + 1.0;
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1620 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1610);
    float _1622 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1612);
    float _1624 = fma(_1616, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1606);
    float _1626 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1628 = _870 + _1620;
    float _1630 = _876 + _1622;
    float _1632 = fma(_1346, _1584, _1624);
    float _1634 = fma(_1626, _822, -0.5);
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1638 = _1628 + _1636;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1642 = _1630 + _1640;
    float _1644 = in.m_73.x;
    float _1646 = in.m_73.y;
    float _1648 = in.m_73.z;
    float _1650 = fma(_1298, _1570, _1632);
    float _1652 = _1638 * _1638;
    float _1654 = _1642 * _1642;
    float _1656 = in.m_65.w;
    float _1658 = fma(_1334, _1568, _1650);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1662 = _750 + _1660;
    float _1664 = _1652 + _1654;
    float _1666 = in.m_65.y;
    float _1668 = fma(_1348, _1522, _1658);
    float _1670 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1672 = sqrt(_1664);
    float _1674 = fma(_1324, _1662, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1676 = fma(_1344, _1508, _1668);
    float _1678 = _1594 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1680 = fma(_1670, _1304, -0.5);
    float _1682 = -_1006;
    float _1684 = fma(_1086, _1634, _1682);
    float _1686 = fma(_1674, _1430, _1676);
    float _1688 = fma(_1600, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1678);
    float _1690 = fma(_1060, _1680, _1092);
    float _1692 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1686);
    float _1694 = fma(_1608, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1688);
    float _1696 = _1646;
    float _1698 = _1644;
    float _1700 = _1652;
    float _1702 = _1654;
    float _1704 = _1628;
    float _1706 = _1630;
    float _1708 = _1648;
    float _1710 = _1684;
    if (!_1488)
    {
        float _1712 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1646);
        _1696 = _1712;
    }
    float _1714 = _1696;
    if (!_1488)
    {
        float _1716 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1644);
        _1698 = _1716;
    }
    float _1718 = _1698;
    float _1720 = _1104 + _1694;
    bool _1722 = _1672 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1462 * _1714;
    float _1726 = -_1714;
    float _1728 = _1434 * _1726;
    float _1730 = _1440 * _1714;
    float _1732 = fma(_1504, _1718, _1724);
    float _1734 = _1672;
    float _1736 = _1720;
    if (!_1722)
    {
        _1074 = _1720;
    }
    float _1738 = _1074;
    bool _1740 = !_1722;
    float _1742 = _1738;
    if (!_1740)
    {
        float _1744 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1748 = _1672 + _1746;
        float _1750 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1752 = rsqrt(_1664);
        float _1754 = _1748 * _1744;
        float _1756 = _1754 * 0.15915493667125701904296875;
        float _1758 = _1756 * 6.283185482025146484375;
        float _1760 = sin(_1758);
        float _1762 = _1756 * 6.283185482025146484375;
        float _1764 = cos(_1762);
        float _1766 = fma(_1760, _1750, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1768 = _1752 * _1766;
        float _1770 = _1764 + (-1.0);
        float _1772 = fma(_1638, _1768, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1774 = fma(_1642, _1768, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1776 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1780 = _1772 + _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1784 = _1774 + _1782;
        float _1786 = fma(_1720, _1764, _1776);
        float _1788 = _1780 * _1780;
        float _1790 = _1784 * _1784;
        _1742 = _1786;
        _1700 = _1788;
        _1702 = _1790;
        _1704 = _1772;
        _1706 = _1774;
        _1734 = _1748;
    }
    float _1792 = _1742;
    float _1794 = _1700;
    float _1796 = _1702;
    float _1798 = _1704;
    float _1800 = _1706;
    float _1802 = _1734;
    float _1804 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1806 = _1792 + _1804;
    float _1808 = _1802;
    if (!_1488)
    {
        float _1810 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1648);
        _1708 = _1810;
    }
    float _1812 = _1708;
    float _1814 = fma(_1408, _1718, _1728);
    float _1816 = fma(_1492, _1718, _1730);
    float _1818 = fma(_1806, _1806, _1794);
    float _1820 = fma(_1496, _1812, _1732);
    float _1822 = fma(_1406, _1812, _1814);
    float _1824 = fma(_1506, _1812, _1816);
    float _1826 = _1818 + _1796;
    float _1828 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1832 = _1820 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1834 = _1690 + 0.5;
    float _1836 = fma(_1822, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1828);
    float _1838 = sqrt(_1826);
    float _1840 = fma(_1822, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1830);
    float _1842 = fma(_1822, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1832);
    float _1844 = fma(_1824, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1836);
    float _1846 = _1684 + 0.5;
    float _1848 = fma(_1824, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1840);
    float _1850 = fma(_1824, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1842);
    out.m_67.y = _1666;
    out.m_67.w = _1656;
    out.m_75.x = _1834;
    out.m_75.y = _1846;
    bool _1852 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1854 = isnan(_1838);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1860 = _1856 || _1858;
    out.m_77.x = _1692;
    out.m_79.x = _1844;
    out.m_79.y = _1848;
    out.m_79.z = _1850;
    float _1862 = _1846;
    float _1864 = _1822;
    if (!_1860)
    {
        _1710 = 1.0;
    }
    float _1866 = _1710;
    bool _1868 = !_1860;
    float _1870 = _1866;
    if (!_1868)
    {
        bool _1872 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1874 = isnan(_1838);
        bool _1876 = _1872 || _1874;
        bool _1878 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1880 = _1876 || _1878;
        if (!_1880)
        {
            float _1882 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1884 = _1838 + _1882;
            float _1886 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1888 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1886;
            float _1890 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1892 = _1890 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1894 = 1.0 / _1888;
            float _1896 = _1884 * _1894;
            float _1898 = fma(_1896, _1892, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1870 = _1898;
            _1900 = true;
        }
        else
        {
            bool _1902 = _1838 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1904 = isnan(_1838);
            bool _1906 = _1902 || _1904;
            bool _1908 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1910 = _1906 || _1908;
            if (!_1910)
            {
                float _1912 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1914 = _1838 + _1912;
                float _1916 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1918 = _1916 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1920 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1922 = _1920 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1924 = 1.0 / _1918;
                float _1926 = _1914 * _1924;
                float _1928 = fma(_1926, _1922, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1870 = _1928;
                _1900 = true;
            }
            else
            {
                _1870 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1900 = false;
    float _1930 = _1870;
    float _1932 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1934 = _1792 + _1932;
    float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1938 = _1798 + _1936;
    float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1942 = _1800 + _1940;
    float _1944 = fma(_1934, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1946 = fma(_1938, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1948 = fma(_1942, _1930, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1950 = -_1200;
    float _1952 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1944);
    float _1954 = -_1208;
    float _1956 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1946);
    float _1958 = -_1224;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1948);
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1964 = _1952 + _1962;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1968 = _1956 + _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1972 = _1960 + _1970;
    float _1974 = _1964 * _1964;
    float _1976 = fma(_1968, _1968, _1974);
    float _1978 = fma(_1972, _1972, _1976);
    float _1980 = rsqrt(_1978);
    float _1982 = _1980 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1984 = _1968 * _1982;
    float _1986 = _1972 * _1982;
    float _1988 = _1984 * _1984;
    float _1990 = _1986 * _1986;
    float _1992 = _1988 + _1990;
    float _1994 = sqrt(_1992);
    bool _1996 = _1994 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2000 = _1994 + _1998;
    float _2002 = _1972;
    float _2004 = _2000;
    float _2006 = _1964;
    float _2008 = _1984;
    if (_1996)
    {
        float _2010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2002 = _2010;
    }
    float _2012 = _2002;
    if (_1996)
    {
        float _2014 = rsqrt(_1992);
        _1862 = _2014;
    }
    float _2016 = _1862;
    float _2018 = _2016;
    if (_1996)
    {
        float _2020 = _2000 * _2012;
        _2004 = _2020;
    }
    float _2022 = _2004;
    if (_1996)
    {
        float _2024 = _2022 * 0.15915493667125701904296875;
        _1808 = _2024;
    }
    float _2026 = _1808;
    float _2028 = _1980;
    float _2030 = _2026;
    if (_1996)
    {
        float _2032 = _2026 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _2028 = _2034;
    }
    float _2036 = _2028;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = precise::max(0.0, _2038);
    float _2042 = _2012;
    float _2044 = _2040;
    if (_1996)
    {
        float _2046 = _2026 * 6.283185482025146484375;
        float _2048 = cos(_2046);
        _2042 = _2048;
    }
    float _2050 = _2042;
    float _2052 = -_1982;
    float _2054 = -_2040;
    float _2056 = fma(_1964, _2052, _2054);
    if (_1996)
    {
        float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2058;
    }
    float _2060 = _2006;
    float _2062 = _2060;
    if (!_1996)
    {
        _2030 = _1988;
    }
    float _2064 = _2030;
    float _2066 = _2036;
    float _2068 = _2064;
    if (_1996)
    {
        float _2070 = fma(_2036, _2060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2066 = _2070;
    }
    float _2072 = _2066;
    float _2074 = _2072;
    if (!_1996)
    {
        _2062 = _1990;
    }
    float _2076 = _2062;
    float _2078 = _2076;
    if (_1996)
    {
        float _2080 = _2050 + (-1.0);
        _2044 = _2080;
    }
    float _2082 = _2044;
    if (_1996)
    {
        float _2084 = _2016 * _2072;
        _1864 = _2084;
    }
    float _2086 = _1864;
    if (!_1996)
    {
        _2018 = _2056;
    }
    float _2088 = _2018;
    float _2090 = _2088;
    if (_1996)
    {
        float _2092 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _2092;
    }
    float _2094 = _1736;
    if (_1996)
    {
        float _2096 = _1984 * _2086;
        _2008 = _2096;
    }
    float _2098 = _2008;
    float _2100 = sqrt(_1978);
    if (!_1996)
    {
        _2074 = _1986;
    }
    float _2102 = _2074;
    float _2104 = _2102;
    if (_1996)
    {
        float _2106 = fma(_2056, _2050, _2094);
        _2090 = _2106;
    }
    float _2108 = _2090;
    if (_1996)
    {
        float _2110 = _1986 * _2086;
        _2104 = _2110;
    }
    float _2112 = _2104;
    if (_1996)
    {
        float _2114 = _2098 * _2098;
        _2068 = _2114;
    }
    float _2116 = _2068;
    float _2118 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1996)
    {
        float _2120 = _2112 * _2112;
        _2078 = _2120;
    }
    float _2122 = _2078;
    float _2124 = fma(_2108, _2108, _2116);
    float _2126 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2128 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2118);
    float _2130 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2132 = _2124 + _2122;
    float _2134 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2136 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2128);
    float _2138 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2126);
    float _2140 = rsqrt(_2132);
    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2144 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2142);
    float _2146 = precise::clamp(_2144, 0.0, 1.0);
    float _2148 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2134);
    float _2150 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2152 = -_2146;
    float _2154 = _2152 + 1.0;
    float _2156 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2158 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2148);
    float _2160 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2162 = abs(_2154);
    float _2164 = log2(_2162);
    float _2166 = fma(_1956, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2156);
    float _2168 = -_2160;
    float _2170 = fma(_2168, _2130, 1.0);
    float _2172 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2138);
    float _2174 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2166);
    float _2176 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = _2140 * _2098;
    float _2180 = _2140 * _2108;
    float _2182 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2184 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2186 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2188 = _2140 * _2112;
    float _2190 = log2(_2170);
    float _2192 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2184);
    float _2194 = -_2186;
    float _2196 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2194);
    float _2198 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2202 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2192);
    float _2204 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2206 = _2180 + 1.0;
    float _2208 = -_2188;
    float _2210 = fma(_2208, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2196);
    float _2212 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2202);
    float _2214 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2216 = exp2(_2200);
    float _2218 = fma(_2210, -0.5, 0.5);
    float _2220 = fma(_2210, 0.5, 0.5);
    float _2222 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2204);
    float _2224 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2214);
    float _2226 = fma(_2220, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2228 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2222);
    float _2230 = 1.0 / _2212;
    float _2232 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2224);
    float _2234 = fma(_2220, _2226, -0.212114393711090087890625);
    float _2236 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2228);
    float _2238 = _2190 * 0.693147182464599609375;
    float _2240 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2232);
    float _2242 = fma(_2220, _2234, 1.570728778839111328125);
    float _2244 = sqrt(_2218);
    float _2246 = -_2180;
    float _2248 = fma(_2216, _2206, _2246);
    float _2250 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2252 = _2236 * _2230;
    float _2254 = _2240 * _2230;
    float _2256 = fma(_2252, 0.5, 0.5);
    float _2258 = fma(_2254, -0.5, 0.5);
    float _2260 = _2244 * 0.636619746685028076171875;
    float3 _6177 = float3(_2256, _2258, _2250);
    float _2262 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6177, float3(0.0), isnan(_6177)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6177, float3(0.0), isnan(_6177)), level(0.0)).x;
    float _2264 = -_2242;
    float _2266 = fma(_2260, _2264, 1.0);
    float _2268 = fma(_2248, 0.5, 0.5);
    float3 _6195 = float3(_2256, _2258, _2250);
    float4 _2271 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6195, float3(0.0), isnan(_6195)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6195, float3(0.0), isnan(_6195)), level(0.0)).xyzw;
    float _2273 = _2271.x;
    float _2275 = _2271.y;
    float _2277 = _2271.z;
    float _2279 = _2271.w;
    float2 _6212 = float2(_2266, _2268);
    float3 _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6212, float2(0.0), isnan(_6212)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6212, float2(0.0), isnan(_6212)), level(0.0)).xyz;
    float _2285 = _2283.x;
    float _2287 = _2283.y;
    float _2289 = _2283.z;
    float _2291 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2293 = -_1200;
    float _2295 = fma(_2293, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1104);
    float _2297 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2299 = -_1208;
    float _2301 = fma(_2299, (*spvDescriptorSet0.vp_c9)._m0[18].w, _870);
    float _2303 = -_1224;
    float _2305 = fma(_2303, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    out.m_81.x = _1956;
    out.m_81.y = _1952;
    out.m_81.z = _1960;
    float _2307 = exp2(_2291);
    float _2309 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2297);
    bool _2311 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2313 = isnan(_2100);
    bool _2315 = _2311 || _2313;
    bool _2317 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2319 = _2315 || _2317;
    out.m_83.x = _2301;
    out.m_83.y = _2295;
    out.m_83.z = _2305;
    float _2321 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2309);
    float _2323 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2321);
    float _2325 = _2323 + _2212;
    out.gl_Position.x = _2236;
    out.gl_Position.y = _2240;
    out.gl_Position.z = _2323;
    out.gl_Position.w = _2212;
    float _2327 = _2212;
    if (!_2319)
    {
        _1272 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2329 = _1272;
    float _2331 = -_2307;
    float _2333 = _2331 + 1.0;
    float _2335 = _2325 * 0.5;
    float _2337 = _2335;
    float _2339 = _2329;
    float _2341 = _2329;
    if (!_2319)
    {
        _1274 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2343 = _1274;
    float _2345 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2347 = _2343;
    float _2349 = _2343;
    if (!_2319)
    {
        _1276 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2351 = _1276;
    out.m_85.z = _2335;
    out.m_85.w = _2212;
    float _2353 = _2351;
    float _2355 = _2351;
    if (!_2319)
    {
        _2327 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2357 = _2327;
    float _2359 = _2357;
    float _2361 = _2357;
    if (!_2319)
    {
        _2337 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2363 = _2337;
    float _2365 = _2345 * _2262;
    float _2367 = -_2345;
    float _2369 = _2367 + 1.0;
    float _2371 = _2279 * _2365;
    float _2373 = _2279 * _2369;
    float _2375 = _2369;
    float _2377 = _2363;
    float _2379 = _2363;
    if (!_2319)
    {
        _2375 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2381 = _2375;
    float _2383 = _2289 * _2365;
    float _2385 = fma(_2285, _2371, _2273);
    float _2387 = fma(_2287, _2371, _2275);
    float _2389 = fma(_2279, _2383, _2277);
    out.m_87.x = _2385;
    out.m_87.y = _2387;
    out.m_87.z = _2389;
    out.m_87.w = _2373;
    bool _2391 = !_2319;
    float _2393 = _2381;
    float _2395 = _2381;
    if (!_2391)
    {
        bool _2397 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2399 = isnan(_2100);
        bool _2401 = _2397 || _2399;
        bool _2403 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2405 = _2401 || _2403;
        if (!_2405)
        {
            float _2407 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2409 = _2100 + _2407;
            float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2413 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2411;
            float _2415 = 1.0 / _2413;
            float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2419 = _2417 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2423 = _2421 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2429 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2431 = _2429 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2433 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2435 = _2433 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2437 = _2409 * _2415;
            float _2439 = precise::clamp(_2437, 0.0, 1.0);
            float _2441 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2443 = _2441 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2445 = fma(_2439, _2419, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2447 = fma(_2439, _2443, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2449 = fma(_2439, _2423, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2451 = fma(_2439, _2427, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2453 = fma(_2439, _2431, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2455 = fma(_2439, _2435, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2349 = _2447;
            _2361 = _2453;
            _2341 = _2445;
            _2395 = _2451;
            _2355 = _2449;
            _2379 = _2455;
            _2457 = true;
        }
        else
        {
            bool _2459 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2461 = isnan(_2100);
            bool _2463 = _2459 || _2461;
            bool _2465 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2467 = _2463 || _2465;
            if (!_2467)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2469 = _2339;
            _2341 = _2469;
            if (!_2467)
            {
                _2347 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2471 = _2347;
            _2349 = _2471;
            if (!_2467)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2473 = _2353;
            _2355 = _2473;
            if (!_2467)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2475 = _2393;
            _2395 = _2475;
            if (!_2467)
            {
                _2359 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2477 = _2359;
            _2361 = _2477;
            if (!_2467)
            {
                _2377 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2479 = _2377;
            bool _2481 = !_2467;
            _2379 = _2479;
            if (!_2481)
            {
                bool _2483 = _2100 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2485 = isnan(_2100);
                bool _2487 = _2483 || _2485;
                bool _2489 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2491 = _2487 || _2489;
                if (!_2491)
                {
                    float _2493 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2495 = _2100 + _2493;
                    float _2497 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2499 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2497;
                    float _2501 = 1.0 / _2499;
                    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2505 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2507 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2511 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2521 = _2519 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2523 = _2495 * _2501;
                    float _2525 = precise::clamp(_2523, 0.0, 1.0);
                    float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2531 = fma(_2525, _2505, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2533 = fma(_2525, _2529, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2535 = fma(_2525, _2509, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2537 = fma(_2525, _2513, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2539 = fma(_2525, _2517, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2541 = fma(_2525, _2521, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2349 = _2533;
                    _2361 = _2539;
                    _2341 = _2531;
                    _2395 = _2537;
                    _2355 = _2535;
                    _2379 = _2541;
                    _2457 = true;
                }
                else
                {
                    _2349 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2361 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2379 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2457 = false;
    float _2543 = _2349;
    float _2545 = _2361;
    float _2547 = _2341;
    float _2549 = _2395;
    float _2551 = _2355;
    float _2553 = _2379;
    float _2555 = fma(_1848, -0.5, 0.5);
    float _2557 = precise::clamp(_2555, 0.0, 1.0);
    float _2559 = -_2543;
    float _2561 = _2559 + _2545;
    float _2563 = -_2547;
    float _2565 = _2563 + _2549;
    float _2567 = -_2551;
    float _2569 = _2567 + _2553;
    bool _2571 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2573 = fma(_2557, _2561, _2543);
    float _2575 = fma(_2557, _2565, _2547);
    float _2577 = fma(_2557, _2569, _2551);
    float _2579 = _2573 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2581 = fma(_2575, 0.298911988735198974609375, _2579);
    out.m_89.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2583 = fma(_2577, 0.114477999508380889892578125, _2581);
    out.m_91.x = 0.0;
    float _2585 = -_2583;
    float _2587 = _2575 + _2585;
    float _2589 = -_2583;
    float _2591 = _2573 + _2589;
    float _2593 = -_2583;
    float _2595 = _2577 + _2593;
    float _2597 = fma(_2587, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2583);
    float _2599 = fma(_2591, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2583);
    float _2601 = fma(_2595, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2583);
    out.m_93.x = _2597;
    out.m_93.y = _2599;
    out.m_93.z = _2601;
    if (!_2571)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2603 = -_1952;
    float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2607 = -_1956;
    float _2609 = _2607 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2611 = -_1960;
    float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2615 = _2605 * _2605;
    float _2617 = fma(_2609, _2609, _2615);
    float _2619 = fma(_2613, _2613, _2617);
    float _2621 = sqrt(_2619);
    float _2623 = rsqrt(_2619);
    float _2625 = -_2621;
    float _2627 = _2625 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2629 = _2627 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2631 = precise::clamp(_2629, 0.0, 1.0);
    float _2633 = _2609 * _2623;
    float _2635 = _2605 * _2623;
    float _2637 = abs(_2631);
    float _2639 = log2(_2637);
    float _2641 = _2613 * _2623;
    float _2643 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2645 = _1848 * _2635;
    float _2647 = -_2635;
    float _2649 = -_2643;
    float _2651 = fma(_2647, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2649);
    float _2653 = fma(_1844, _2633, _2645);
    float _2655 = -_2641;
    float _2657 = fma(_2655, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2651);
    float _2659 = fma(_1850, _2641, _2653);
    float _2661 = precise::clamp(_2659, 0.0, 1.0);
    float _2663 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2665 = _2657 + _2663;
    float _2667 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2669 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2671 = precise::clamp(_2669, 0.0, 1.0);
    float _2673 = exp2(_2667);
    float _2675 = _2673 * _2671;
    float _2677 = _2661 * _2675;
    float _2679 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2681 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2683 = _2677 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2679;
    out.m_91.y = _2681;
    out.m_91.z = _2683;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

