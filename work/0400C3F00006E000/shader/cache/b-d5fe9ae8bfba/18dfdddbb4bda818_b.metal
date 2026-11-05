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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_84 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_60 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2984 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3684 = as_type<float>(_121);
        out.gl_Position.z = _3684;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    float _161 = as_type<float>(_159);
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3755 = as_type<float>(_159);
        out.gl_Position.z = _3755;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_54.w;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_49.x;
    float _181 = in.m_49.y;
    float _183 = in.m_49.z;
    float _185 = in.m_44.x;
    float _187 = in.m_44.y;
    float _189 = in.m_44.z;
    float _191 = _165;
    if (!_177)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _161 = _195;
    }
    float _197 = _161;
    float _199 = _197;
    if (!_177)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    int _205 = as_type<int>(_163) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_163) & 2;
    bool _211 = _209 != 0;
    bool _213 = !_207;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_211;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_177;
    float _223 = _203;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _165 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _165);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_177;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _165 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _191 = _277;
    }
    float _279 = _191;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _179, _283);
    float _291 = fma(_279, _181, _285);
    float _293 = fma(_279, _183, _287);
    float _295 = fma(_289, _167, _185);
    float _297 = fma(_291, _167, _187);
    float _299 = fma(_293, _167, _189);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_56.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_105);
        float _325 = 1.0 / _323;
        float _327 = _139 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _333 = int(_331);
    float _335 = in.m_56.x;
    float _337 = _215 + 0.5;
    float _339 = in.m_56.y;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _343 = _341 != 0;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = _329 + _345;
    float _349 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _351 = int(_349);
    float _353 = in.m_56.z;
    float _355 = float(_333);
    float _357 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _359 = int(_357);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _365 = float(_351);
    float _367 = 1.0 / _355;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _377 = _339 > 0.5;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_329);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _397 = int(_395);
    float _399 = float(uint(_359));
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _405 = _353 > 0.5;
    int _407 = ~_359;
    int _409 = _407 + 1;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _421 = _419 != 0;
    float _423 = 1.0 / _365;
    float _425 = _367 * _139;
    float _427 = float(_359);
    bool _429 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _431 = isnan(_329);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = 1.0 / _399;
    float _443 = float(uint(_397));
    float _445 = _365;
    if (_343)
    {
        _445 = 1.0;
    }
    float _447 = _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = _447;
    if (!_343)
    {
        _453 = 7.345489978790283203125;
    }
    float _455 = _453;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _459 = _457 != 0;
    float _461 = trunc(_425);
    int _463 = int(_461);
    float _465 = _423 * _139;
    bool _467 = !_459;
    int _469 = _467 ? 0 : 1;
    float _471 = 1.0 / _443;
    int _473 = as_type<int>(_441) + (-2);
    int _475 = ~_359;
    int _477 = _475 + 1;
    float _479 = trunc(_465);
    int _481 = int(_479);
    float _483 = float(uint(_463));
    float _485 = as_type<float>(_473) * _483;
    int _487 = as_type<int>(_471) + (-2);
    float _489 = 1.0 / _371;
    float _491 = float(uint(_481));
    float _493 = trunc(_485);
    float _495 = precise::max(_493, 0.0);
    uint _498 = uint(_495);
    float _500 = as_type<float>(_487) * _491;
    int _502 = ~_397;
    int _504 = _502 + 1;
    float _506 = trunc(_500);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    float _512 = _455 * _335;
    float _514 = in.m_56.w;
    int _516 = _477 * int(_498);
    int _518 = _516 + _463;
    float _520 = floor(_512);
    float _522 = float(uint(_518));
    float _524 = -_219;
    int _526 = _405 ? as_type<int>(_524) : as_type<int>(_219);
    int _528 = _504 * int(_510);
    int _530 = _528 + _481;
    float _532 = 1.0 / _375;
    float _534 = as_type<float>(_473) * _522;
    bool _536 = !_421;
    float _538 = _536 ? _219 : as_type<float>(_526);
    float _540 = float(uint(_530));
    float _542 = trunc(_534);
    float _544 = precise::max(_542, 0.0);
    uint _546 = uint(_544);
    float _548 = as_type<float>(_487) * _540;
    float _550 = -_215;
    int _552 = _377 ? as_type<int>(_550) : as_type<int>(_215);
    float _554 = trunc(_548);
    float _556 = precise::max(_554, 0.0);
    uint _558 = uint(_556);
    bool _560 = !_417;
    float _562 = _560 ? _215 : as_type<float>(_552);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _574 = _572 != 0;
    bool _576 = _514 > 0.5;
    float _578 = -_520;
    float _580 = _512 + _578;
    int _582 = ~_397;
    int _584 = _582 + 1;
    int _586 = int(_498) + int(_546);
    float _588 = _580 * _427;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _592 = _590 != 0;
    float _594 = trunc(_588);
    int _596 = int(_594);
    float _598 = float(_105);
    int _600 = _409 * _586;
    int _602 = _600 + _463;
    int _604 = int(_510) + int(_558);
    float _606 = -_219;
    int _608 = _576 ? as_type<int>(_606) : as_type<int>(_219);
    float _610 = 1.0 / _598;
    bool _612 = !_592;
    int _614 = _612 ? 0 : 1;
    int _616 = _584 * _604;
    int _618 = _616 + _481;
    bool _620 = uint(_602) >= uint(_359);
    bool _622 = !_413;
    float _624 = _622 ? _219 : as_type<float>(_608);
    float _626 = float(_463);
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _630 = _628 != 0;
    bool _632 = _626 >= _427;
    bool _634 = isnan(_626);
    bool _636 = _632 || _634;
    bool _638 = isnan(_427);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    bool _644 = uint(_618) >= uint(_397);
    bool _646 = !_630;
    int _648 = _646 ? 0 : 1;
    float _650 = trunc(_642);
    int _652 = int(_650);
    bool _654 = !_620;
    float _656 = _654 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _658 = !_644;
    int _660 = _658 ? 0 : (-1);
    bool _662 = !_570;
    int _664 = _662 ? 0 : 1;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _684 = _682 != 0;
    float _686 = _610 * _139;
    int _688 = ~_586;
    int _690 = _688 + as_type<int>(_656);
    int _692 = _690 + 1;
    bool _694 = !_672;
    int _696 = _694 ? 0 : 1;
    float _698 = _427 * _686;
    bool _700 = _359 == 0;
    int _702 = _359 * _692;
    int _704 = _702 + _463;
    int _706 = abs(_469);
    int _708 = ~_652;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    float _714 = trunc(_698);
    int _716 = int(_714);
    bool _718 = !_700;
    int _720 = _718 ? _704 : (-1);
    float _722 = _656;
    float _724 = as_type<float>(_586);
    if (_684)
    {
        _722 = 1.0;
    }
    float _726 = _722;
    float _728 = _726;
    if (_684)
    {
        _724 = _335;
    }
    float _730 = _724;
    int _732 = _720 * _712;
    float _734 = _730;
    if (!_684)
    {
        _728 = 1.2345600128173828125;
    }
    float _736 = _728;
    if (!_684)
    {
        _734 = _339;
    }
    float _738 = _734;
    int _740 = _359 + (-1);
    bool _742 = !_566;
    int _744 = _742 ? 0 : 1;
    float _746 = _736 * _738;
    bool _748 = !_574;
    int _750 = _748 ? 0 : 1;
    int _752 = _652 * _740;
    int _754 = _752 + _732;
    int _756 = abs(_664);
    float _758 = floor(_746);
    float _760 = float(_397);
    float _762 = float(_481);
    int _764 = _754 * _756;
    int _766 = abs(_744);
    int _768 = abs(_750);
    int _770 = _596 * _706;
    int _772 = _770 + _463;
    int _774 = abs(_614);
    int _776 = _716 * _766;
    int _778 = _776 + _764;
    bool _780 = _762 >= _760;
    bool _782 = isnan(_762);
    bool _784 = _780 || _782;
    bool _786 = isnan(_760);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -_758;
    float _794 = _746 + _792;
    float _796 = trunc(_790);
    int _798 = int(_796);
    int _800 = _772 * _768;
    int _802 = _800 + _778;
    int _804 = ~_604;
    int _806 = _804 + _660;
    int _808 = _806 + 1;
    bool _810 = !_668;
    int _812 = _810 ? 0 : 1;
    int _814 = _596 * _774;
    int _816 = _814 + _802;
    float _818 = _794 * _760;
    int _820 = _397 * _808;
    int _822 = _820 + _481;
    bool _824 = _397 == 0;
    float _826 = _760 * _686;
    float _828 = float(uint(_816));
    float _830 = trunc(_818);
    int _832 = int(_830);
    bool _834 = !_824;
    int _836 = _834 ? _822 : (-1);
    int _838 = abs(_696);
    float _840 = as_type<float>(_473) * _828;
    int _842 = ~_798;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = _397 + (-1);
    float _850 = trunc(_826);
    int _852 = int(_850);
    int _854 = _836 * _846;
    int _856 = ~_359;
    int _858 = _856 + 1;
    int _860 = abs(_812);
    int _862 = _798 * _848;
    int _864 = _862 + _854;
    float _866 = trunc(_840);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    int _872 = _864 * _838;
    int _874 = abs(_648);
    bool _876 = !_676;
    int _878 = _876 ? 0 : 1;
    int _880 = _852 * _860;
    int _882 = _880 + _872;
    int _884 = abs(_878);
    bool _886 = !_680;
    int _888 = _886 ? 0 : 1;
    int _890 = _832 * _874;
    int _892 = _890 + _481;
    int _894 = ~_397;
    int _896 = _894 + 1;
    int _898 = _858 * int(_870);
    int _900 = _898 + _816;
    int _902 = abs(_888);
    float _904 = _339 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _906 = float(uint(_900));
    int _908 = _892 * _884;
    int _910 = _908 + _882;
    float _912 = float(uint(_772));
    float _914 = as_type<float>(_473) * _906;
    int _916 = _832 * _902;
    int _918 = _916 + _910;
    float _920 = float(uint(_892));
    float _922 = as_type<float>(_473) * _912;
    float _924 = trunc(_914);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    float _930 = float(uint(_918));
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _934 = as_type<float>(_487) * _920;
    float _936 = as_type<float>(_487) * _930;
    int _938 = ~_359;
    int _940 = _938 + 1;
    float _942 = trunc(_934);
    float _944 = precise::max(_942, 0.0);
    uint _946 = uint(_944);
    int _948 = int(_870) + int(_928);
    float _950 = trunc(_936);
    float _952 = precise::max(_950, 0.0);
    uint _954 = uint(_952);
    int _956 = _940 * _948;
    int _958 = _956 + _816;
    float _960 = trunc(_922);
    float _962 = precise::max(_960, 0.0);
    uint _964 = uint(_962);
    bool _966 = uint(_958) >= uint(_359);
    bool _968 = !_966;
    int _970 = _968 ? 0 : (-1);
    int _972 = _896 * int(_954);
    int _974 = _972 + _918;
    int _976 = ~_948;
    int _978 = _976 + _970;
    int _980 = _978 + 1;
    int _982 = ~_397;
    int _984 = _982 + 1;
    float _986 = float(uint(_974));
    int _988 = _359 * _980;
    int _990 = _988 + _816;
    float _992 = as_type<float>(_487) * _986;
    bool _994 = !_700;
    int _996 = _994 ? _990 : (-1);
    int _998 = ~_359;
    int _1000 = _998 + 1;
    int _1002 = _996 & 3;
    bool _1004 = _1002 != 0;
    float _1006 = trunc(_992);
    float _1008 = precise::max(_1006, 0.0);
    uint _1010 = uint(_1008);
    int _1012 = _996 & 3;
    bool _1014 = _1012 != 0;
    int _1016 = _1000 * int(_964);
    int _1018 = _1016 + _772;
    int _1020 = _1004 ? 0 : 1;
    bool _1022 = uint(_1012) > 1u;
    float _1024 = float(uint(_1018));
    int _1026 = ~_1020;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    bool _1032 = !_1014;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = as_type<float>(_473) * _1024;
    int _1038 = int(_954) + int(_1010);
    float _1040 = trunc(_1036);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    int _1046 = _1030;
    float _1048 = as_type<float>(_816);
    float _1050 = as_type<float>(_984);
    if (!_1022)
    {
        int _1052 = ~_1020;
        int _1054 = _1052 + 1;
        _1046 = _1054;
    }
    int _1056 = _1046;
    bool _1058 = uint(_1012) >= 2u;
    int _1060 = _984 * _1038;
    int _1062 = _1060 + _918;
    int _1064 = ~_359;
    int _1066 = _1064 + 1;
    int _1068 = _1058 ? 0 : 1;
    bool _1070 = uint(_1062) >= uint(_397);
    int _1072 = ~_1068;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    bool _1078 = !_1070;
    int _1080 = _1078 ? 0 : (-1);
    bool _1082 = _1012 != 3;
    int _1084 = int(_964) + int(_1044);
    int _1086 = ~_1038;
    int _1088 = _1086 + _1080;
    int _1090 = _1088 + 1;
    float _1092 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1094 = log2(_1092);
    int _1096 = _1066 * _1084;
    int _1098 = _1096 + _772;
    int _1100 = int(_1044);
    int _1102 = _1076;
    int _1104 = _1068;
    float _1106 = as_type<float>(_1084);
    if (_684)
    {
        _1100 = 0;
    }
    int _1108 = _1100;
    int _1110 = _397 * _1090;
    int _1112 = _1110 + _918;
    int _1114 = _1108;
    float _1116 = as_type<float>(_1112);
    if (!_684)
    {
        _1114 = 2;
    }
    int _1118 = _1114;
    float _1120 = _335 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1122 = uint(_1098) >= uint(_359);
    float _1124 = _1120;
    if (_1082)
    {
        int _1126 = ~_1068;
        int _1128 = _1126 + 1;
        _1102 = _1128;
    }
    int _1130 = _1102;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1134 = _1132 != 0;
    bool _1136 = !_824;
    int _1138 = _1136 ? _1112 : (-1);
    bool _1140 = !_1134;
    int _1142 = _1140 ? 0 : 1;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1146 = _1144 != 0;
    float _1148 = _1094 * _139;
    bool _1150 = !_1122;
    int _1152 = _1150 ? 0 : (-1);
    bool _1154 = !_1146;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1138 & 3;
    bool _1160 = _1158 != 0;
    float _1162 = exp2(_1148);
    int _1164 = _1138 & 3;
    bool _1166 = _1164 != 0;
    int _1168 = _1160 ? 0 : 1;
    bool _1170 = uint(_1164) > 1u;
    int _1172 = ~_1168;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    int _1178 = _1176;
    if (_684)
    {
        _1104 = 0;
    }
    int _1180 = _1104;
    int _1182 = _1180;
    if (!_684)
    {
        _1182 = 1;
    }
    int _1184 = _1182;
    int _1186 = abs(_1056);
    int _1188 = abs(_1156);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1192 = as_type<float>(_1184);
    if (!_1170)
    {
        int _1194 = ~_1168;
        int _1196 = _1194 + 1;
        _1178 = _1196;
    }
    int _1198 = _1178;
    bool _1200 = uint(_1164) >= 2u;
    int _1202 = abs(_1198);
    int _1204 = _1200 ? 0 : 1;
    bool _1206 = _1164 != 3;
    int _1208 = ~_1204;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    int _1214 = _1212;
    if (_1206)
    {
        int _1216 = ~_1204;
        int _1218 = _1216 + 1;
        _1214 = _1218;
    }
    int _1220 = _1214;
    bool _1222 = _1184 != 1;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1226 = fma(_904, -2.0, _1224);
    if (!_1222)
    {
        _1116 = _339;
    }
    float _1228 = _1116;
    float _1230 = _1228;
    if (!_1222)
    {
        _1192 = _353;
    }
    float _1232 = _1192;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1236 = _1232;
    if (!_1222)
    {
        _1048 = _1228;
    }
    float _1238 = _1048;
    float _1240 = _1238;
    if (!_1222)
    {
        _1050 = _353;
    }
    float _1242 = _1050;
    float _1244 = _1242;
    if (_1222)
    {
        _1240 = _335;
    }
    float _1246 = _1240;
    if (_1222)
    {
        _1230 = _335;
    }
    float _1248 = _1230;
    if (_1222)
    {
        _1236 = _339;
    }
    float _1250 = _1236;
    if (_1222)
    {
        _1244 = _339;
    }
    float _1252 = _1244;
    float _1254 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1190);
    bool _1256 = _1118 != 2;
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1260 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1234);
    float _1262 = -_1162;
    float _1264 = _1262 + 1.0;
    float _1266 = _335 * 2.0;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1270 = _339 * 2.0;
    float _1272 = -_1268;
    float _1274 = fma(_1120, 2.0, _1272);
    if (_1256)
    {
        _1124 = _335;
    }
    float _1276 = _1124;
    float _1278 = floor(_1270);
    float _1280 = _1276;
    if (!_1256)
    {
        _1280 = _353;
    }
    float _1282 = _1280;
    float _1284 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1286 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1288 = -_361;
    float _1290 = fma(_1284, 2.0, _1288);
    float _1292 = -_932;
    float _1294 = fma(_1286, 2.0, _1292);
    int _1296 = ~_1084;
    int _1298 = _1296 + _1152;
    int _1300 = _1298 + 1;
    float _1302 = floor(_1266);
    if (_1256)
    {
        _1106 = _339;
    }
    float _1304 = _1106;
    float _1306 = -_139;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1290);
    float _1310 = _1304;
    if (!_1256)
    {
        _1310 = _335;
    }
    float _1312 = _1310;
    int _1314 = _359 * _1300;
    int _1316 = _1314 + _772;
    bool _1318 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1320 = isnan(0.0);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1326 = _1322 || _1324;
    float _1328 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1330 = _1326 ? _1264 : 0.0;
    bool _1332 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1334 = isnan(1.0);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1340 = _1336 || _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1344 = 1.0 + _1342;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1348 = fma(_1328, -2.0, _363);
    float _1350 = 1.0 / _1344;
    float _1352 = fma(_1258, -2.0, _1346);
    float _1354 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1348);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1360 = !_700;
    int _1362 = _1360 ? _1316 : (-1);
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1366 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1356);
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1370 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1358);
    float _1372 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1364);
    float _1374 = -_139;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1274);
    float _1378 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1368);
    float _1380 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1366);
    float _1382 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1226);
    float _1384 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1370);
    float _1386 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1372);
    float _1388 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1378);
    float _1390 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1254);
    float _1392 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1260);
    float _1394 = -_139;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1294);
    float _1398 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1352);
    if (_1340)
    {
        float _1400 = _1330 * _1350;
        _143 = _1400;
    }
    float _1402 = _143;
    bool _1404 = _1302 > 0.0;
    float _1406 = in.m_58.x;
    float _1408 = in.m_58.y;
    float _1410 = in.m_58.z;
    bool _1412 = _1302 >= 0.0;
    bool _1414 = isnan(_1302);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    float _1422 = -_219;
    float _1424 = _1422 + 0.5;
    bool _1426 = _1278 >= 0.0;
    bool _1428 = isnan(_1278);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan(0.0);
    bool _1434 = _1430 || _1432;
    int _1436 = _1420 ? 0 : 1;
    bool _1438 = _1278 > 0.0;
    out.m_60.x = _337;
    out.m_60.y = _1424;
    int _1440 = ~_1436;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    int _1446 = _1434 ? 0 : 1;
    int _1448 = _1444;
    if (!_1404)
    {
        int _1450 = ~_1436;
        int _1452 = _1450 + 1;
        _1448 = _1452;
    }
    int _1454 = _1448;
    float _1456 = in.m_62.x;
    float _1458 = in.m_62.y;
    float _1460 = in.m_62.z;
    bool _1462 = _1012 != 3;
    bool _1464 = !_1166;
    int _1466 = _1464 ? 0 : 1;
    float _1468 = in.m_64.x;
    float _1470 = in.m_64.y;
    float _1472 = in.m_64.z;
    bool _1474 = _1164 != 3;
    int _1476 = ~_1446;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    bool _1482 = !_1462;
    int _1484 = _1482 ? 0 : (-1);
    float _1486 = _297 * _1408;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1498 = _1496 != 0;
    int _1500 = _1480;
    if (!_1438)
    {
        int _1502 = ~_1446;
        int _1504 = _1502 + 1;
        _1500 = _1504;
    }
    int _1506 = _1500;
    float _1508 = fma(_295, _1406, _1486);
    int _1510 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1512 = _1510 != 0;
    float _1514 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1516 = fma(_299, _1410, _1508);
    int _1518 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1520 = _1518 != 0;
    float _1522 = _297 * _1458;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1526 = _329 + _1524;
    float _1528 = _297 * _1470;
    float _1530 = fma(_295, _1456, _1522);
    float _1532 = _1514 * _335;
    float _1534 = _1526 * _489;
    float _1536 = fma(_295, _1468, _1528);
    float _1538 = _335 + _339;
    float _1540 = fma(_299, _1460, _1530);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1544 = _329 + _1542;
    float _1546 = trunc(_1532);
    int _1548 = int(_1546);
    float _1550 = fma(_299, _1472, _1536);
    float _1552 = _1538 + (-1.0);
    float _1554 = _1544 * _532;
    float _1556 = _353 * 2.0;
    float _1558 = _335 + _353;
    float _1560 = _353 + _339;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1562;
    float _1566 = _1558 + (-1.0);
    float _1568 = floor(_1556);
    float _1570 = _1560 + (-1.0);
    float _1572 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1574 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1576 = !_1490;
    int _1578 = _1576 ? 0 : 1;
    float _1580 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1582 = _1548 << 4;
    int _1584 = _1582 + 1712;
    float _1586 = fma(_381, _1534, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1588 = 1.0 / _1564;
    bool _1590 = !_1494;
    int _1592 = _1590 ? 0 : 1;
    uint _1594 = uint(int(uint(_1584) >> uint(2)));
    uint _1596 = uint(int(uint(int(_1594)) >> uint(2)));
    int _1598 = int(_1594) & 3;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[int(_1596)][_1598];
    int _1602 = int(_1594) + 1;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    int _1606 = _1602 & 3;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[int(_1604)][_1606];
    float _1610 = float(_1454);
    float _1612 = _1540 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1614 = !_1474;
    int _1616 = _1614 ? 0 : (-1);
    float _1618 = _1550 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1622 = _1620 != 0;
    int _1624 = _1584 + 8;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
    int _1630 = int(_1626) & 3;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[int(_1628)][_1630];
    bool _1634 = _1568 >= 0.0;
    bool _1636 = isnan(_1568);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    bool _1644 = !_1498;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1656 = _347 * _1588;
    int _1658 = _1642 ? 0 : 1;
    float _1660 = fma(_1650, _1534, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1662 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1664 = isnan(_329);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1670 = _1666 || _1668;
    float _1672 = float(_1670);
    bool _1674 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1676 = isnan(_329);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1682 = _1678 || _1680;
    float _1684 = float(_1682);
    bool _1686 = _1568 > 0.0;
    float _1688 = -_1672;
    float _1690 = _1688 + 1.0;
    int _1692 = ~_397;
    int _1694 = _1692 + 1;
    float _1696 = _1684 * _1690;
    float _1698 = -_1684;
    float _1700 = _1698 + 1.0;
    int _1702 = _1694 * int(_946);
    int _1704 = _1702 + _892;
    float _1706 = -_439;
    float _1708 = _1706 + 1.0;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1710;
    float _1714 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1716 = _439 * _1700;
    float _1718 = fma(_403, _1554, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1720 = float(uint(_1704));
    float _1722 = fma(_451, _1656, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1724 = _1714 * _335;
    float _1726 = fma(_1654, _1554, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1728 = fma(_1712, _1656, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1730 = as_type<float>(_487) * _1720;
    float _1732 = _393 * _1708;
    int _1734 = abs(_1592);
    float _1736 = trunc(_1724);
    int _1738 = int(_1736);
    float _1740 = -_393;
    float _1742 = _1740 + 1.0;
    float _1744 = _1586 * _1732;
    float _1746 = _1660 * _1732;
    float _1748 = float(_1734);
    float _1750 = _1600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1752 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1754 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1744);
    float _1756 = in.m_66.x;
    float _1758 = in.m_66.y;
    float _1760 = in.m_66.z;
    float _1762 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1746);
    float _1764 = _1748 * _1610;
    float _1766 = fma(_1718, _1716, _1754);
    float _1768 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1770 = fma(_1726, _1716, _1762);
    int _1772 = _1738 << 4;
    int _1774 = _1772 + 1968;
    float _1776 = trunc(_1730);
    float _1778 = precise::max(_1776, 0.0);
    uint _1780 = uint(_1778);
    int _1782 = ~_1658;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    float _1788 = _1764 * (-2.0);
    int _1790 = _1786;
    if (!_1686)
    {
        int _1792 = ~_1658;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1800 = uint(int(uint(_1774) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    float _1816 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1818 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = fma(_1580, _1788, _1580);
    float _1824 = fma(_1722, _1696, _1766);
    float _1826 = fma(_1728, _1696, _1770);
    float _1828 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    out.m_68.x = _1816;
    out.m_68.y = _1818;
    out.m_68.z = _1820;
    out.m_68.w = _1798;
    float _1830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1832 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1824);
    float _1834 = fma(_1788, _1758, _1758);
    int _1836 = int(_946) + int(_1780);
    int _1838 = _1774 + 8;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    float _1848 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1826);
    int _1850 = abs(_1466);
    int _1852 = ~_397;
    int _1854 = _1852 + 1;
    float _1856 = _339 + (-0.5);
    int _1858 = abs(_1578);
    float _1860 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1834);
    int _1862 = abs(_1646);
    float _1864 = in.m_54.x;
    float _1866 = in.m_54.y;
    float _1868 = float(_1506);
    int _1870 = _1854 * _1836;
    int _1872 = _1870 + _892;
    float _1874 = float(_1796);
    float _1876 = fma(_1822, _1402, _1860);
    float _1878 = float(_1858);
    float _1880 = float(_1862);
    float _1882 = _1876 * 0.15915493667125701904296875;
    bool _1884 = uint(_1872) >= uint(_397);
    float _1886 = _1878 * _1874;
    float _1888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _1890 = _1880 * _1868;
    bool _1892 = !_1884;
    int _1894 = _1892 ? 0 : (-1);
    float _1896 = _1886 * (-2.0);
    bool _1898 = _335 > 0.5;
    float _1900 = _1890 * (-2.0);
    float _1902 = _335 + (-0.5);
    float _1904 = fma(_1896, _1756, _1756);
    float _1906 = fma(_1572, _1896, _1572);
    float _1908 = fma(_1900, _1760, _1760);
    float _1910 = fma(_1574, _1900, _1574);
    float _1912 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1904);
    float _1914 = _353 + (-0.5);
    float _1916 = _1832 * _1864;
    float _1918 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1920 = _562 + 0.5;
    float _1922 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1908);
    float _1924 = fma(_1906, _1402, _1912);
    float _1926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1928 = fma(_1918, _1920, _1308);
    float _1930 = fma(_1910, _1402, _1922);
    int _1932 = _996 >> 31;
    float _1934 = _1924 * 0.15915493667125701904296875;
    float _1936 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1938 = _1814 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1940 = _1932 & 3;
    float _1942 = _1934 * 6.283185482025146484375;
    float _1944 = sin(_1942);
    float _1946 = _1930 * 0.15915493667125701904296875;
    float _1948 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1950 = _996 + _1940;
    float _1952 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1954 = _1138 >> 31;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1958 = _1882 * 6.283185482025146484375;
    float _1960 = sin(_1958);
    float _1962 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1964 = _1954 & 3;
    float _1966 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1970 = _538 + (-0.5);
    int _1972 = _1138 + _1964;
    float _1974 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1976 = _1882 * 6.283185482025146484375;
    float _1978 = cos(_1976);
    out.m_70.x = _1962;
    out.m_70.y = _1952;
    out.m_70.z = _1966;
    out.m_70.w = _1956;
    int _1980 = _1972 >> 2;
    float _1982 = -_1968;
    float _1984 = -_1354;
    float _1986 = fma(_1982, _1970, _1984);
    float _1988 = _1974 * _1888;
    float _1990 = _1848 * _1866;
    int _1992 = _1980 << 4;
    int _1994 = _1992 + 512;
    float _1996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _1998 = _1934 * 6.283185482025146484375;
    float _2000 = cos(_1998);
    int _2002 = _1950 >> 2;
    float _2004 = _1990 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _2006 = ~_1836;
    int _2008 = _2006 + _1894;
    int _2010 = _2008 + 1;
    int _2012 = _2002 << 4;
    int _2014 = _2012 + 368;
    float _2016 = _2004 * _1996;
    float _2018 = _1944 * _1960;
    float _2020 = _1946 * 6.283185482025146484375;
    float _2022 = cos(_2020);
    uint _2024 = uint(int(uint(_2014) >> uint(2)));
    uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
    int _2028 = int(_2024) & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    int _2032 = int(_2024) + 1;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    int _2036 = _2032 & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    float _2040 = _1944 * _1978;
    int _2042 = _397 * _2010;
    int _2044 = _2042 + _892;
    float _2046 = _1946 * 6.283185482025146484375;
    float _2048 = sin(_2046);
    float _2050 = _2000 * _1978;
    float _2052 = _2000 * _1960;
    float _2054 = _2000 * _2022;
    float _2056 = _1944 * _2022;
    float _2058 = _1960 * _2022;
    float _2060 = _1978 * _2022;
    float _2062 = _2054 * _2016;
    float _2064 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2066 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2068 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2070 = fma(_2048, _2050, _2018);
    float _2072 = fma(_2048, _2018, _2050);
    float _2074 = -_2052;
    float _2076 = fma(_2048, _2040, _2074);
    uint _2078 = uint(int(uint(_1994) >> uint(2)));
    uint _2080 = uint(int(uint(int(_2078)) >> uint(2)));
    int _2082 = int(_2078) & 3;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[int(_2080)][_2082];
    int _2086 = int(_2078) + 1;
    uint _2088 = uint(int(uint(_2086) >> uint(2)));
    int _2090 = _2086 & 3;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[int(_2088)][_2090];
    float _2094 = -_2040;
    float _2096 = fma(_2048, _2052, _2094);
    float _2098 = -_2016;
    float _2100 = _2048 * _2098;
    float _2102 = _2056 * _2016;
    float _2104 = fma(_2070, _1988, _2062);
    float _2106 = -_2048;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2064);
    float _2110 = fma(_2060, _1988, _2100);
    float _2112 = -_2048;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2066);
    int _2116 = _1994 + 8;
    uint _2118 = uint(int(uint(_2116) >> uint(2)));
    uint _2120 = uint(int(uint(int(_2118)) >> uint(2)));
    int _2122 = int(_2118) & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    int _2126 = int(_2118) + 1;
    uint _2128 = uint(int(uint(_2126) >> uint(2)));
    int _2130 = _2126 & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    float _2134 = -_2048;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2068);
    float _2138 = fma(_2076, _1988, _2102);
    float _2140 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2142 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2144 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2146 = abs(_1034);
    float _2148 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    int _2150 = _2014 + 8;
    uint _2152 = uint(int(uint(_2150) >> uint(2)));
    uint _2154 = uint(int(uint(int(_2152)) >> uint(2)));
    int _2156 = int(_2152) & 3;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[int(_2154)][_2156];
    int _2160 = int(_2152) + 1;
    uint _2162 = uint(int(uint(_2160) >> uint(2)));
    int _2164 = _2160 & 3;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[int(_2162)][_2164];
    float _2168 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2142);
    float _2170 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2144);
    float _2172 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2108);
    int _2174 = ~_1186;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2114);
    float _2182 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2136);
    float _2184 = fma(_2096, _1828, _2104);
    int _2186 = ~_2146;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = _2178 * as_type<int>(_2038);
    float _2194 = fma(_2058, _1828, _2110);
    float _2196 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2198 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2200 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2202 = ~_1202;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = _2190 * as_type<int>(_2030);
    int _2210 = _2208 + _2192;
    float _2212 = fma(_2072, _1828, _2138);
    int _2214 = abs(_1220);
    float _2216 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2196);
    int _2218 = ~_1850;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2226 = int(_2224);
    int _2228 = ~_2214;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2198);
    int _2236 = abs(_1130);
    float _2238 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2200);
    int _2240 = abs(_1484);
    float _2242 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2244 = ~_2236;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    float _2250 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2216);
    int _2252 = _2206 * as_type<int>(_2092);
    int _2254 = ~_2240;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    float _2260 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2262 = int(_2260);
    int _2264 = abs(_1142);
    int _2266 = _2222 * as_type<int>(_2084);
    int _2268 = _2266 + _2252;
    float _2270 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2242);
    float _2272 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2274 = float(uint(_2226));
    int _2276 = _2232 * as_type<int>(_2124);
    int _2278 = _2276 + _2268;
    int _2280 = abs(_1616);
    float _2282 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2270);
    int _2284 = ~_2226;
    int _2286 = _2284 + 1;
    float _2288 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    int _2290 = ~_2280;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    float _2296 = 1.0 / _2274;
    float _2298 = _2282 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2300 = _2248 * as_type<int>(_2158);
    int _2302 = _2300 + _2210;
    float _2304 = float(uint(_2262));
    int _2306 = _2294 * as_type<int>(_2132);
    int _2308 = _2306 + _2278;
    int _2310 = ~_1188;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = _2258 * as_type<int>(_2166);
    int _2318 = _2316 + _2302;
    int _2320 = ~_2264;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    float _2326 = 1.0 / _2304;
    bool _2328 = !_824;
    int _2330 = _2328 ? _2044 : (-1);
    int _2332 = _2308 * _2314;
    int _2334 = abs(_2262);
    int _2336 = _2318 * _2324;
    int _2338 = abs(_2226);
    int _2340 = _2330 * _1188;
    int _2342 = _2340 + _2332;
    float _2344 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2346 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2348 = _1362 * _2264;
    int _2350 = _2348 + _2336;
    float _2352 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2344);
    float _2354 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2346);
    float _2356 = float(uint(_2334));
    float _2358 = _1516 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2360 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2352);
    float _2362 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2354);
    int _2364 = as_type<int>(_2326) + (-2);
    float _2366 = _1618 + _2298;
    float _2368 = float(uint(_2350));
    float _2370 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2372 = float(uint(_2338));
    float _2374 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2376 = 1.0 / _2356;
    float _2378 = as_type<float>(_2364) * _2368;
    int _2380 = as_type<int>(_2296) + (-2);
    float _2382 = _1612 + _2370;
    float _2384 = float(uint(_2342));
    float _2386 = _2358 + _2374;
    int _2388 = abs(_2342);
    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2392 = _2382 + _2390;
    float _2394 = 1.0 / _2372;
    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2398 = _2386 + _2396;
    float _2400 = as_type<float>(_2380) * _2384;
    float _2402 = _2392 * _2392;
    int _2404 = ~_2262;
    int _2406 = _2404 + 1;
    float _2408 = _2398 * _2398;
    float _2410 = float(uint(_2388));
    float _2412 = trunc(_2378);
    float _2414 = precise::max(_2412, 0.0);
    uint _2416 = uint(_2414);
    float _2418 = _2402 + _2408;
    int _2420 = as_type<int>(_2376) + (-2);
    float _2422 = trunc(_2400);
    float _2424 = precise::max(_2422, 0.0);
    uint _2426 = uint(_2424);
    int _2428 = abs(_2350);
    int _2430 = as_type<int>(_2394) + (-2);
    float _2432 = float(uint(_2428));
    float _2434 = sqrt(_2418);
    int _2436 = _2406 * int(_2416);
    int _2438 = _2436 + _2350;
    float _2440 = as_type<float>(_2420) * _2432;
    float _2442 = as_type<float>(_2430) * _2410;
    float _2444 = float(uint(_2438));
    float _2446 = trunc(_2440);
    float _2448 = precise::max(_2446, 0.0);
    uint _2450 = uint(_2448);
    int _2452 = _2286 * int(_2426);
    int _2454 = _2452 + _2342;
    float _2456 = as_type<float>(_2364) * _2444;
    int _2458 = ~_2334;
    int _2460 = _2458 + 1;
    float _2462 = float(uint(_2454));
    float _2464 = trunc(_2442);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    bool _2470 = _2434 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2472 = as_type<float>(_2380) * _2462;
    int _2474 = ~_2338;
    int _2476 = _2474 + 1;
    float _2478 = trunc(_2456);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    int _2484 = _2460 * int(_2450);
    int _2486 = _2484 + _2428;
    float _2488 = _2072;
    float _2490 = _2402;
    float _2492 = _2408;
    float _2494 = _2382;
    float _2496 = _2386;
    if (!_2470)
    {
        _2488 = _2402;
    }
    float _2498 = _2488;
    int _2500 = _2476 * int(_2468);
    int _2502 = _2500 + _2388;
    float _2504 = float(uint(_2486));
    float _2506 = _2498;
    if (!_2470)
    {
        _2490 = _2366;
    }
    float _2508 = _2490;
    float _2510 = float(uint(_2502));
    bool _2512 = !_2470;
    float _2514 = _2508;
    if (!_2512)
    {
        float _2516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2520 = _2434 + _2518;
        float _2522 = rsqrt(_2418);
        float _2524 = _2520 * _2516;
        float _2526 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2528 = _2524 * 0.15915493667125701904296875;
        float _2530 = _2528 * 6.283185482025146484375;
        float _2532 = sin(_2530);
        float _2534 = _2528 * 6.283185482025146484375;
        float _2536 = cos(_2534);
        float _2538 = fma(_2532, _2526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2540 = _2522 * _2538;
        float _2542 = _2536 + (-1.0);
        float _2544 = fma(_2392, _2540, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2546 = fma(_2398, _2540, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2548 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2552 = _2544 + _2550;
        float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2556 = _2546 + _2554;
        float _2558 = fma(_2366, _2536, _2548);
        float _2560 = _2552 * _2552;
        float _2562 = _2556 * _2556;
        _2514 = _2558;
        _2506 = _2560;
        _2492 = _2562;
        _2494 = _2544;
        _2496 = _2546;
    }
    float _2564 = _2514;
    float _2566 = _2506;
    float _2568 = _2492;
    float _2570 = _2494;
    float _2572 = _2496;
    float _2574 = as_type<float>(_2430) * _2510;
    float _2576 = as_type<float>(_2420) * _2504;
    float _2578 = trunc(_2472);
    float _2580 = precise::max(_2578, 0.0);
    uint _2582 = uint(_2580);
    bool _2584 = _339 > 0.5;
    float _2586 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2148);
    float _2588 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2168);
    float _2590 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2170);
    float _2592 = -_219;
    int _2594 = _2584 ? as_type<int>(_2592) : as_type<int>(_219);
    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2598 = _2564 + _2596;
    bool _2600 = _353 > 0.5;
    float _2602 = trunc(_2576);
    float _2604 = precise::max(_2602, 0.0);
    uint _2606 = uint(_2604);
    float _2608 = -_215;
    int _2610 = _1898 ? as_type<int>(_2608) : as_type<int>(_215);
    float _2612 = fma(_2598, _2598, _2566);
    float _2614 = -_215;
    int _2616 = _2600 ? as_type<int>(_2614) : as_type<int>(_215);
    float _2618 = -_1390;
    float _2620 = _2618 + 1.0;
    bool _2622 = !_1512;
    float _2624 = _2622 ? _219 : as_type<float>(_2594);
    float _2626 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2628 = int(_2416) + int(_2482);
    float _2630 = trunc(_2574);
    float _2632 = precise::max(_2630, 0.0);
    uint _2634 = uint(_2632);
    int _2636 = ~_2262;
    int _2638 = _2636 + 1;
    float _2640 = _2626 * _2172;
    bool _2642 = !_1622;
    float _2644 = _2642 ? _215 : as_type<float>(_2616);
    float _2646 = _2626 * _2180;
    bool _2648 = !_1520;
    float _2650 = _2648 ? _215 : as_type<float>(_2610);
    float _2652 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2654 = _2626 * _2182;
    int _2656 = int(_2426) + int(_2582);
    int _2658 = _2638 * _2628;
    int _2660 = _2658 + _2350;
    int _2662 = ~_2226;
    int _2664 = _2662 + 1;
    float _2666 = fma(_2652, _2586, _2640);
    float _2668 = fma(_2652, _2588, _2646);
    float _2670 = fma(_2652, _2590, _2654);
    int _2672 = int(_2450) + int(_2606);
    int _2674 = _2664 * _2656;
    int _2676 = _2674 + _2342;
    int _2678 = ~_2334;
    int _2680 = _2678 + 1;
    float _2682 = _2612 + _2568;
    int _2684 = ~_2338;
    int _2686 = _2684 + 1;
    float _2688 = -_1384;
    float _2690 = _2688 + 1.0;
    int _2692 = int(_2468) + int(_2634);
    int _2694 = _2680 * _2672;
    int _2696 = _2694 + _2428;
    bool _2698 = uint(_2660) >= uint(_2262);
    float _2700 = sqrt(_2682);
    bool _2702 = uint(_2676) >= uint(_2226);
    int _2704 = _2686 * _2692;
    int _2706 = _2704 + _2388;
    bool _2708 = !_2698;
    int _2710 = _2708 ? 0 : (-1);
    float _2712 = -_1386;
    float _2714 = _2712 + 1.0;
    bool _2716 = uint(_2696) >= uint(_2334);
    float _2718 = -_2690;
    float _2720 = fma(_562, _2718, _1928);
    bool _2722 = !_2702;
    int _2724 = _2722 ? 0 : (-1);
    float _2726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2728 = uint(_2706) >= uint(_2338);
    out.m_72.x = _2586;
    out.m_72.y = _2588;
    out.m_72.z = _2590;
    int _2730 = ~_2628;
    int _2732 = _2730 + _2710;
    int _2734 = _2732 + 1;
    int _2736 = _2350 ^ _2262;
    int _2738 = ~_2656;
    int _2740 = _2738 + _2724;
    int _2742 = _2740 + 1;
    int _2744 = _2262 * _2734;
    int _2746 = _2744 + _2350;
    bool _2748 = !_2716;
    int _2750 = _2748 ? 0 : (-1);
    float _2752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2754 = uint(int(uint(_2736) >> uint(31)));
    int _2756 = _2226 * _2742;
    int _2758 = _2756 + _2342;
    bool _2760 = _2262 == 0;
    bool _2762 = _2262 == 0;
    int _2764 = ~_2750;
    int _2766 = _2672 + _2764;
    int _2768 = _2766 + 1;
    float _2770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2772 = ~int(_2754);
    int _2774 = _2772 + 1;
    int _2776 = _2342 ^ _2226;
    bool _2778 = !_2760;
    int _2780 = _2778 ? _2746 : (-1);
    int _2782 = _2768 ^ _2774;
    float _2784 = _2752 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2786 = _2226 == 0;
    bool _2788 = !_2728;
    int _2790 = _2788 ? 0 : (-1);
    uint _2792 = uint(int(uint(_2776) >> uint(31)));
    float _2794 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2796 = _2226 == 0;
    float _2798 = float(_2780);
    int _2800 = ~_2774;
    int _2802 = _2800 + _2782;
    int _2804 = _2802 + 1;
    int _2806 = ~_2790;
    int _2808 = _2692 + _2806;
    int _2810 = _2808 + 1;
    float _2812 = fma(_2794, _2798, _1376);
    int _2814 = ~int(_2792);
    int _2816 = _2814 + 1;
    float _2818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2820 = !_2786;
    int _2822 = _2820 ? _2758 : (-1);
    float _2824 = fma(_2626, _2626, 1.0);
    int _2826 = _2810 ^ _2816;
    float _2828 = float(_2822);
    float _2830 = _2650 + 0.5;
    int _2832 = ~_2816;
    int _2834 = _2832 + _2826;
    int _2836 = _2834 + 1;
    float _2838 = rsqrt(_2824);
    bool _2840 = _2700 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2842 = isnan(_2700);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2848 = _2844 || _2846;
    float _2850 = fma(_2784, _2828, _1396);
    bool _2852 = !_2762;
    int _2854 = _2852 ? _2804 : (-1);
    float _2856 = fma(_2794, _2830, _2812);
    bool _2858 = !_2796;
    int _2860 = _2858 ? _2836 : (-1);
    float _2862 = _2644 + 0.5;
    float _2864 = float(_2854);
    float _2866 = _2770 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2868 = float(_2860);
    float _2870 = _2818 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2872 = fma(_2784, _2862, _2850);
    float _2874 = -_1382;
    float _2876 = fma(_2866, _2864, _2874);
    float _2878 = _2624 + (-0.5);
    float _2880 = -_1398;
    float _2882 = fma(_2870, _2868, _2880);
    float _2884 = _624 + (-0.5);
    float _2886 = _2288 + _2670;
    float _2888 = -_2866;
    float _2890 = fma(_2888, _2878, _2876);
    float _2892 = _2626 * _2838;
    float _2894 = -_2870;
    float _2896 = fma(_2894, _2884, _2882);
    float _2898 = -_1388;
    float _2900 = _2898 + 1.0;
    float _2902 = -_2272;
    float _2904 = _2892 * _2902;
    float _2906 = -_2250;
    float _2908 = _2892 * _2906;
    float _2910 = -_2288;
    float _2912 = _2892 * _2910;
    float _2914 = fma(_538, _2900, _1986);
    float _2916 = fma(_2838, _2180, _2904);
    float _2918 = -_1380;
    float _2920 = _2918 + 1.0;
    float _2922 = -_1392;
    float _2924 = _2922 + 1.0;
    float _2926 = fma(_2838, _2172, _2908);
    float _2928 = fma(_2838, _2182, _2912);
    float _2930 = -_2920;
    float _2932 = fma(_2650, _2930, _2856);
    float _2934 = -_2620;
    float _2936 = fma(_2644, _2934, _2872);
    float _2938 = _2250 + _2666;
    float _2940 = _2272 + _2668;
    float _2942 = fma(_2624, _2714, _2890);
    float _2944 = fma(_624, _2924, _2896);
    out.m_74.x = _2720;
    out.m_74.y = _2914;
    float _2946 = _2890;
    float _2948 = _2590;
    if (!_2848)
    {
        _2946 = 1.0;
    }
    float _2950 = _2946;
    out.m_76.x = _2938;
    out.m_76.y = _2940;
    out.m_76.z = _2886;
    out.m_78.x = _2926;
    out.m_78.y = _2916;
    out.m_78.z = _2928;
    out.m_80.x = _2932;
    out.m_80.y = _2942;
    out.m_80.z = _2936;
    out.m_80.w = _2944;
    bool _2952 = !_2848;
    float _2954 = _2950;
    if (!_2952)
    {
        bool _2956 = _2700 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2958 = isnan(_2700);
        bool _2960 = _2956 || _2958;
        bool _2962 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2964 = _2960 || _2962;
        if (!_2964)
        {
            float _2966 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2968 = _2700 + _2966;
            float _2970 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2972 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2970;
            float _2974 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2976 = _2974 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2978 = 1.0 / _2972;
            float _2980 = _2968 * _2978;
            float _2982 = fma(_2980, _2976, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2954 = _2982;
            _2984 = true;
        }
        else
        {
            bool _2986 = _2700 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2988 = isnan(_2700);
            bool _2990 = _2986 || _2988;
            bool _2992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2994 = _2990 || _2992;
            if (!_2994)
            {
                float _2996 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2998 = _2700 + _2996;
                float _3000 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3002 = _3000 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3004 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3006 = _3004 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3008 = 1.0 / _3002;
                float _3010 = _2998 * _3008;
                float _3012 = fma(_3010, _3006, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2954 = _3012;
                _2984 = true;
            }
            else
            {
                _2954 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2984 = false;
    float _3014 = _2954;
    float _3016 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3020 = _2570 + _3018;
    float _3022 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3024 = _2564 + _3022;
    float _3026 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3016);
    float _3028 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3030 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3032 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3034 = _3030 || _3032;
    bool _3036 = isnan(0.5);
    bool _3038 = _3034 || _3036;
    float _3040 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3042 = _2572 + _3040;
    float _3044 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3026);
    float _3046 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3028);
    float _3048 = fma(_3020, _3014, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3050 = fma(_3024, _3014, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3052 = _3044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3054 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3046);
    float _3056 = fma(_3042, _3014, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3058 = 1.0 / _3052;
    float _3060 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3062 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3066 = _3062 || _3064;
    bool _3068 = isnan(0.5);
    bool _3070 = _3066 || _3068;
    float _3072 = _3060 + _3052;
    float _3074 = _3060;
    float _3076 = _3028;
    float _3078 = _3044;
    float _3080 = _3052;
    if (_3038)
    {
        _3074 = _3048;
    }
    float _3082 = _3074;
    float _3084 = _3082;
    if (_3038)
    {
        _3076 = _3050;
    }
    float _3086 = _3076;
    float _3088 = _3086;
    if (_3038)
    {
        _3078 = _3056;
    }
    float _3090 = _3078;
    float _3092 = _3090;
    float _3094 = _3058;
    if (!_3038)
    {
        float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3098 = _1618 + _3096;
        float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3102 = _1612 + _3100;
        float _3104 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3106 = _3098 * _3098;
        float _3108 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3110 = _2358 + _3108;
        float _3112 = fma(_3102, _3102, _3106);
        float _3114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3116 = fma(_3110, _3110, _3112);
        float _3118 = sqrt(_3116);
        float _3120 = _3104 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3122 = -_1618;
        float _3124 = _3122 + _3050;
        float _3126 = precise::min(_3118, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3128 = _3126 * _3114;
        float _3130 = -_1612;
        float _3132 = _3130 + _3048;
        float _3134 = -_2358;
        float _3136 = _3134 + _3056;
        float _3138 = _3120 * _3128;
        float _3140 = fma(_3132, _3138, _1612);
        float _3142 = fma(_3124, _3138, _1618);
        float _3144 = fma(_3136, _3138, _2358);
        _3088 = _3142;
        _3084 = _3140;
        _3092 = _3144;
        _3080 = _3138;
    }
    float _3146 = _3088;
    float _3148 = _3084;
    float _3150 = _3092;
    float _3152 = _3080;
    float _3154 = _3152;
    if (_3070)
    {
        _3154 = 1.0;
    }
    float _3156 = _3154;
    float _3158 = _3072 * _3058;
    float _3160 = _3158 * 0.5;
    float _3162 = _3156;
    float _3164 = _3160;
    if (!_3070)
    {
        float _3166 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3168 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3170 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3168);
        float _3172 = _3166 * 0.15915493667125701904296875;
        float _3174 = _3172 * 6.283185482025146484375;
        float _3176 = cos(_3174);
        float _3178 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3180 = _3178 * 0.15915493667125701904296875;
        float _3182 = _3172 * 6.283185482025146484375;
        float _3184 = sin(_3182);
        float _3186 = 1.0 / _3176;
        float _3188 = _3180 * 6.283185482025146484375;
        float _3190 = cos(_3188);
        float _3192 = _3184 * _3186;
        float _3194 = 1.0 / _3170;
        float _3196 = _3190 * _3192;
        float _3198 = _3180 * 6.283185482025146484375;
        float _3200 = sin(_3198);
        float _3202 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3204 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3202;
        float _3206 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3208 = _3194 * _3206;
        float _3210 = 1.0 / _3196;
        float _3212 = 1.0 / _3204;
        float _3214 = _3200 * _3210;
        float _3216 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3218 = fma(_3214, _3208, _3216);
        float _3220 = _3218 * _3212;
        float _3222 = precise::clamp(_3220, 0.0, 1.0);
        float _3224 = -_3222;
        float _3226 = _3224 + 1.0;
        _3094 = _3210;
        _3162 = _3226;
    }
    float _3228 = _3094;
    float _3230 = _3162;
    float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3234 = _3146 + _3232;
    float _3236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3238 = _3148 + _3236;
    float _3240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3242 = _3150 + _3240;
    float _3244 = _3234 * _3234;
    float _3246 = fma(_3238, _3238, _3244);
    float _3248 = fma(_3242, _3242, _3246);
    float _3250 = rsqrt(_3248);
    float _3252 = sqrt(_3248);
    float _3254 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3256 = _3238 * _3254;
    float _3258 = _3242 * _3254;
    float _3260 = _3256 * _3256;
    float _3262 = _3258 * _3258;
    float _3264 = _3260 + _3262;
    float _3266 = sqrt(_3264);
    bool _3268 = _3266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3272 = _3266 + _3270;
    float _3274 = _3250;
    float _3276 = _3272;
    float _3278 = _3234;
    float _3280 = _3256;
    if (_3268)
    {
        float _3282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3274 = _3282;
    }
    float _3284 = _3274;
    float _3286 = _3284;
    if (_3268)
    {
        float _3288 = _3272 * _3284;
        _3276 = _3288;
    }
    float _3290 = _3276;
    if (_3268)
    {
        float _3292 = rsqrt(_3264);
        _3286 = _3292;
    }
    float _3294 = _3286;
    float _3296 = _3294;
    if (_3268)
    {
        float _3298 = _3290 * 0.15915493667125701904296875;
        _3164 = _3298;
    }
    float _3300 = _3164;
    float _3302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3304 = _3242;
    float _3306 = _3300;
    if (_3268)
    {
        float _3308 = _3300 * 6.283185482025146484375;
        float _3310 = sin(_3308);
        _3304 = _3310;
    }
    float _3312 = _3304;
    float _3314 = precise::max(0.0, _3302);
    float _3316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3318 = _3228;
    float _3320 = _3314;
    if (_3268)
    {
        float _3322 = _3300 * 6.283185482025146484375;
        float _3324 = cos(_3322);
        _3318 = _3324;
    }
    float _3326 = _3318;
    float _3328 = -_3254;
    float _3330 = -_3314;
    float _3332 = fma(_3234, _3328, _3330);
    if (_3268)
    {
        float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3278 = _3334;
    }
    float _3336 = _3278;
    float _3338 = _3312;
    float _3340 = _3336;
    if (_3268)
    {
        float _3342 = fma(_3312, _3336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3338 = _3342;
    }
    float _3344 = _3338;
    float _3346 = _3344;
    if (!_3268)
    {
        _3340 = _3262;
    }
    float _3348 = _3340;
    float _3350 = _3348;
    if (_3268)
    {
        float _3352 = _3294 * _3344;
        _2948 = _3352;
    }
    float _3354 = _2948;
    if (!_3268)
    {
        _3296 = _3332;
    }
    float _3356 = _3296;
    float _3358 = _3356;
    if (_3268)
    {
        float _3360 = _3326 + (-1.0);
        _3320 = _3360;
    }
    float _3362 = _3320;
    float _3364 = _3362;
    if (_3268)
    {
        float _3366 = _3256 * _3354;
        _3280 = _3366;
    }
    float _3368 = _3280;
    if (!_3268)
    {
        _3346 = _3258;
    }
    float _3370 = _3346;
    float _3372 = _3370;
    if (_3268)
    {
        float _3374 = _3258 * _3354;
        _3372 = _3374;
    }
    float _3376 = _3372;
    if (_3268)
    {
        float _3378 = _3362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3306 = _3378;
    }
    float _3380 = _3306;
    if (!_3268)
    {
        _3364 = _3260;
    }
    float _3382 = _3364;
    float _3384 = _3382;
    if (_3268)
    {
        float _3386 = _3368 * _3368;
        _3384 = _3386;
    }
    float _3388 = _3384;
    if (_3268)
    {
        float _3390 = _3376 * _3376;
        _3350 = _3390;
    }
    float _3392 = _3350;
    if (_3268)
    {
        float _3394 = fma(_3332, _3326, _3380);
        _3358 = _3394;
    }
    float _3396 = _3358;
    float _3398 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3400 = fma(_3396, _3396, _3388);
    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3404 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3402);
    float _3406 = precise::clamp(_3404, 0.0, 1.0);
    float _3408 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3398);
    float _3410 = _3400 + _3392;
    float _3412 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3414 = -_3406;
    float _3416 = _3414 + 1.0;
    float _3418 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3408);
    float _3420 = rsqrt(_3410);
    float _3422 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3412);
    float _3424 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3426 = _3418 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3428 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3422);
    float _3430 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3424);
    float _3432 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3434 = _3428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3436 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3430);
    float _3438 = abs(_3416);
    float _3440 = log2(_3438);
    float _3442 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3432);
    float _3444 = _3434 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3446 = _3436 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3448 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3442);
    float _3450 = _3420 * _3368;
    float _3452 = -_3444;
    float _3454 = fma(_3452, _3316, 1.0);
    float _3456 = _3420 * _3396;
    float _3458 = _3448 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3460 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3462 = _3450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3464 = _3420 * _3376;
    float _3466 = log2(_3454);
    float _3468 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3460);
    float _3470 = -_3462;
    float _3472 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3470);
    float _3474 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3476 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3478 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3468);
    float _3480 = -_3464;
    float _3482 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3472);
    float _3484 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3486 = exp2(_3474);
    float _3488 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3478);
    float _3490 = fma(_3482, -0.5, 0.5);
    float _3492 = fma(_3482, 0.5, 0.5);
    float _3494 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3484);
    float _3496 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3476);
    float _3498 = _3456 + 1.0;
    float _3500 = fma(_3492, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3502 = 1.0 / _3488;
    float _3504 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3494);
    float _3506 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3496);
    float _3508 = _3466 * 0.693147182464599609375;
    float _3510 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3504);
    float _3512 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3514 = sqrt(_3490);
    float _3516 = -_3456;
    float _3518 = fma(_3486, _3498, _3516);
    float _3520 = fma(_3492, _3500, -0.212114393711090087890625);
    float _3522 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3506);
    float _3524 = fma(_3518, 0.5, 0.5);
    float _3526 = fma(_3492, _3520, 1.570728778839111328125);
    float _3528 = _3510 * _3502;
    float _3530 = _3522 * _3502;
    float _3532 = fma(_3528, 0.5, 0.5);
    float _3534 = fma(_3530, -0.5, 0.5);
    float _3536 = _3514 * 0.636619746685028076171875;
    float3 _8838 = float3(_3532, _3534, _3512);
    float _3538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8838, float3(0.0), isnan(_8838)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8838, float3(0.0), isnan(_8838)), level(0.0)).x;
    float3 _8849 = float3(_3532, _3534, _3512);
    float4 _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8849, float3(0.0), isnan(_8849)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8849, float3(0.0), isnan(_8849)), level(0.0)).xyzw;
    float _3543 = _3541.x;
    float _3545 = _3541.y;
    float _3547 = _3541.z;
    float _3549 = _3541.w;
    float _3551 = -_3526;
    float _3553 = fma(_3536, _3551, 1.0);
    float2 _8871 = float2(_3553, _3524);
    float3 _3557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8871, float2(0.0), isnan(_8871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8871, float2(0.0), isnan(_8871)), level(0.0)).xyz;
    float _3559 = _3557.x;
    float _3561 = _3557.y;
    float _3563 = _3557.z;
    float _3565 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3567 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3569 = _3230 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3571 = _3488 * 0.5;
    bool _3573 = _3230 > 0.0;
    bool _3575 = isnan(_3230);
    bool _3577 = _3573 || _3575;
    bool _3579 = isnan(0.0);
    bool _3581 = _3577 || _3579;
    float _3583 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3567);
    float _3585 = exp2(_3565);
    float _3587 = _3510 + _3488;
    out.m_82.x = _3148;
    out.m_82.y = _3146;
    out.m_82.z = _3150;
    float _3589 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3583);
    float _3591 = fma(_3522, -0.5, _3571);
    float _3593 = _3587 * 0.5;
    float _3595 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3589);
    float _3597 = _3595 + _3488;
    out.gl_Position.x = _3510;
    out.gl_Position.y = _3522;
    out.gl_Position.z = _3595;
    out.gl_Position.w = _3488;
    float _3599 = _3597 * 0.5;
    float _3601 = -_3585;
    float _3603 = _3601 + 1.0;
    float _3605 = _3569 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3607 = _3603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3593;
    out.m_84.y = _3591;
    out.m_84.z = _3599;
    out.m_84.w = _3488;
    float _3609 = -_3607;
    float _3611 = _3609 + 1.0;
    out.m_47.x = _3605;
    float _3613 = _3607 * _3538;
    float _3615 = _3549 * _3613;
    float _3617 = _3549 * _3611;
    float _3619 = _3563 * _3613;
    float _3621 = fma(_3559, _3615, _3543);
    float _3623 = fma(_3561, _3615, _3545);
    float _3625 = fma(_3549, _3619, _3547);
    out.m_86.x = _3621;
    out.m_86.y = _3623;
    out.m_86.z = _3625;
    out.m_86.w = _3617;
    if (_3581)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3627 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3627;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2984 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3684 = as_type<float>(_121);
        out.gl_Position.z = _3684;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    float _161 = as_type<float>(_159);
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3755 = as_type<float>(_159);
        out.gl_Position.z = _3755;
    }
    if (_153)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_54.w;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_49.x;
    float _181 = in.m_49.y;
    float _183 = in.m_49.z;
    float _185 = in.m_44.x;
    float _187 = in.m_44.y;
    float _189 = in.m_44.z;
    float _191 = _165;
    if (!_177)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _161 = _195;
    }
    float _197 = _161;
    float _199 = _197;
    if (!_177)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    int _205 = as_type<int>(_163) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_163) & 2;
    bool _211 = _209 != 0;
    bool _213 = !_207;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_211;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_177;
    float _223 = _203;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _165 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _165);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_177;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _165 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _191 = _277;
    }
    float _279 = _191;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _179, _283);
    float _291 = fma(_279, _181, _285);
    float _293 = fma(_279, _183, _287);
    float _295 = fma(_289, _167, _185);
    float _297 = fma(_291, _167, _187);
    float _299 = fma(_293, _167, _189);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_56.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_105);
        float _325 = 1.0 / _323;
        float _327 = _139 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _333 = int(_331);
    float _335 = in.m_56.x;
    float _337 = _215 + 0.5;
    float _339 = in.m_56.y;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _343 = _341 != 0;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = _329 + _345;
    float _349 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _351 = int(_349);
    float _353 = in.m_56.z;
    float _355 = float(_333);
    float _357 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _359 = int(_357);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _365 = float(_351);
    float _367 = 1.0 / _355;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _377 = _339 > 0.5;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_329);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _397 = int(_395);
    float _399 = float(uint(_359));
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _405 = _353 > 0.5;
    int _407 = ~_359;
    int _409 = _407 + 1;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _421 = _419 != 0;
    float _423 = 1.0 / _365;
    float _425 = _367 * _139;
    float _427 = float(_359);
    bool _429 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _431 = isnan(_329);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = 1.0 / _399;
    float _443 = float(uint(_397));
    float _445 = _365;
    if (_343)
    {
        _445 = 1.0;
    }
    float _447 = _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = _447;
    if (!_343)
    {
        _453 = 7.345489978790283203125;
    }
    float _455 = _453;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _459 = _457 != 0;
    float _461 = trunc(_425);
    int _463 = int(_461);
    float _465 = _423 * _139;
    bool _467 = !_459;
    int _469 = _467 ? 0 : 1;
    float _471 = 1.0 / _443;
    int _473 = as_type<int>(_441) + (-2);
    int _475 = ~_359;
    int _477 = _475 + 1;
    float _479 = trunc(_465);
    int _481 = int(_479);
    float _483 = float(uint(_463));
    float _485 = as_type<float>(_473) * _483;
    int _487 = as_type<int>(_471) + (-2);
    float _489 = 1.0 / _371;
    float _491 = float(uint(_481));
    float _493 = trunc(_485);
    float _495 = precise::max(_493, 0.0);
    uint _498 = uint(_495);
    float _500 = as_type<float>(_487) * _491;
    int _502 = ~_397;
    int _504 = _502 + 1;
    float _506 = trunc(_500);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    float _512 = _455 * _335;
    float _514 = in.m_56.w;
    int _516 = _477 * int(_498);
    int _518 = _516 + _463;
    float _520 = floor(_512);
    float _522 = float(uint(_518));
    float _524 = -_219;
    int _526 = _405 ? as_type<int>(_524) : as_type<int>(_219);
    int _528 = _504 * int(_510);
    int _530 = _528 + _481;
    float _532 = 1.0 / _375;
    float _534 = as_type<float>(_473) * _522;
    bool _536 = !_421;
    float _538 = _536 ? _219 : as_type<float>(_526);
    float _540 = float(uint(_530));
    float _542 = trunc(_534);
    float _544 = precise::max(_542, 0.0);
    uint _546 = uint(_544);
    float _548 = as_type<float>(_487) * _540;
    float _550 = -_215;
    int _552 = _377 ? as_type<int>(_550) : as_type<int>(_215);
    float _554 = trunc(_548);
    float _556 = precise::max(_554, 0.0);
    uint _558 = uint(_556);
    bool _560 = !_417;
    float _562 = _560 ? _215 : as_type<float>(_552);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _574 = _572 != 0;
    bool _576 = _514 > 0.5;
    float _578 = -_520;
    float _580 = _512 + _578;
    int _582 = ~_397;
    int _584 = _582 + 1;
    int _586 = int(_498) + int(_546);
    float _588 = _580 * _427;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _592 = _590 != 0;
    float _594 = trunc(_588);
    int _596 = int(_594);
    float _598 = float(_105);
    int _600 = _409 * _586;
    int _602 = _600 + _463;
    int _604 = int(_510) + int(_558);
    float _606 = -_219;
    int _608 = _576 ? as_type<int>(_606) : as_type<int>(_219);
    float _610 = 1.0 / _598;
    bool _612 = !_592;
    int _614 = _612 ? 0 : 1;
    int _616 = _584 * _604;
    int _618 = _616 + _481;
    bool _620 = uint(_602) >= uint(_359);
    bool _622 = !_413;
    float _624 = _622 ? _219 : as_type<float>(_608);
    float _626 = float(_463);
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _630 = _628 != 0;
    bool _632 = _626 >= _427;
    bool _634 = isnan(_626);
    bool _636 = _632 || _634;
    bool _638 = isnan(_427);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    bool _644 = uint(_618) >= uint(_397);
    bool _646 = !_630;
    int _648 = _646 ? 0 : 1;
    float _650 = trunc(_642);
    int _652 = int(_650);
    bool _654 = !_620;
    float _656 = _654 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _658 = !_644;
    int _660 = _658 ? 0 : (-1);
    bool _662 = !_570;
    int _664 = _662 ? 0 : 1;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _684 = _682 != 0;
    float _686 = _610 * _139;
    int _688 = ~_586;
    int _690 = _688 + as_type<int>(_656);
    int _692 = _690 + 1;
    bool _694 = !_672;
    int _696 = _694 ? 0 : 1;
    float _698 = _427 * _686;
    bool _700 = _359 == 0;
    int _702 = _359 * _692;
    int _704 = _702 + _463;
    int _706 = abs(_469);
    int _708 = ~_652;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    float _714 = trunc(_698);
    int _716 = int(_714);
    bool _718 = !_700;
    int _720 = _718 ? _704 : (-1);
    float _722 = _656;
    float _724 = as_type<float>(_586);
    if (_684)
    {
        _722 = 1.0;
    }
    float _726 = _722;
    float _728 = _726;
    if (_684)
    {
        _724 = _335;
    }
    float _730 = _724;
    int _732 = _720 * _712;
    float _734 = _730;
    if (!_684)
    {
        _728 = 1.2345600128173828125;
    }
    float _736 = _728;
    if (!_684)
    {
        _734 = _339;
    }
    float _738 = _734;
    int _740 = _359 + (-1);
    bool _742 = !_566;
    int _744 = _742 ? 0 : 1;
    float _746 = _736 * _738;
    bool _748 = !_574;
    int _750 = _748 ? 0 : 1;
    int _752 = _652 * _740;
    int _754 = _752 + _732;
    int _756 = abs(_664);
    float _758 = floor(_746);
    float _760 = float(_397);
    float _762 = float(_481);
    int _764 = _754 * _756;
    int _766 = abs(_744);
    int _768 = abs(_750);
    int _770 = _596 * _706;
    int _772 = _770 + _463;
    int _774 = abs(_614);
    int _776 = _716 * _766;
    int _778 = _776 + _764;
    bool _780 = _762 >= _760;
    bool _782 = isnan(_762);
    bool _784 = _780 || _782;
    bool _786 = isnan(_760);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -_758;
    float _794 = _746 + _792;
    float _796 = trunc(_790);
    int _798 = int(_796);
    int _800 = _772 * _768;
    int _802 = _800 + _778;
    int _804 = ~_604;
    int _806 = _804 + _660;
    int _808 = _806 + 1;
    bool _810 = !_668;
    int _812 = _810 ? 0 : 1;
    int _814 = _596 * _774;
    int _816 = _814 + _802;
    float _818 = _794 * _760;
    int _820 = _397 * _808;
    int _822 = _820 + _481;
    bool _824 = _397 == 0;
    float _826 = _760 * _686;
    float _828 = float(uint(_816));
    float _830 = trunc(_818);
    int _832 = int(_830);
    bool _834 = !_824;
    int _836 = _834 ? _822 : (-1);
    int _838 = abs(_696);
    float _840 = as_type<float>(_473) * _828;
    int _842 = ~_798;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = _397 + (-1);
    float _850 = trunc(_826);
    int _852 = int(_850);
    int _854 = _836 * _846;
    int _856 = ~_359;
    int _858 = _856 + 1;
    int _860 = abs(_812);
    int _862 = _798 * _848;
    int _864 = _862 + _854;
    float _866 = trunc(_840);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    int _872 = _864 * _838;
    int _874 = abs(_648);
    bool _876 = !_676;
    int _878 = _876 ? 0 : 1;
    int _880 = _852 * _860;
    int _882 = _880 + _872;
    int _884 = abs(_878);
    bool _886 = !_680;
    int _888 = _886 ? 0 : 1;
    int _890 = _832 * _874;
    int _892 = _890 + _481;
    int _894 = ~_397;
    int _896 = _894 + 1;
    int _898 = _858 * int(_870);
    int _900 = _898 + _816;
    int _902 = abs(_888);
    float _904 = _339 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _906 = float(uint(_900));
    int _908 = _892 * _884;
    int _910 = _908 + _882;
    float _912 = float(uint(_772));
    float _914 = as_type<float>(_473) * _906;
    int _916 = _832 * _902;
    int _918 = _916 + _910;
    float _920 = float(uint(_892));
    float _922 = as_type<float>(_473) * _912;
    float _924 = trunc(_914);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    float _930 = float(uint(_918));
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _934 = as_type<float>(_487) * _920;
    float _936 = as_type<float>(_487) * _930;
    int _938 = ~_359;
    int _940 = _938 + 1;
    float _942 = trunc(_934);
    float _944 = precise::max(_942, 0.0);
    uint _946 = uint(_944);
    int _948 = int(_870) + int(_928);
    float _950 = trunc(_936);
    float _952 = precise::max(_950, 0.0);
    uint _954 = uint(_952);
    int _956 = _940 * _948;
    int _958 = _956 + _816;
    float _960 = trunc(_922);
    float _962 = precise::max(_960, 0.0);
    uint _964 = uint(_962);
    bool _966 = uint(_958) >= uint(_359);
    bool _968 = !_966;
    int _970 = _968 ? 0 : (-1);
    int _972 = _896 * int(_954);
    int _974 = _972 + _918;
    int _976 = ~_948;
    int _978 = _976 + _970;
    int _980 = _978 + 1;
    int _982 = ~_397;
    int _984 = _982 + 1;
    float _986 = float(uint(_974));
    int _988 = _359 * _980;
    int _990 = _988 + _816;
    float _992 = as_type<float>(_487) * _986;
    bool _994 = !_700;
    int _996 = _994 ? _990 : (-1);
    int _998 = ~_359;
    int _1000 = _998 + 1;
    int _1002 = _996 & 3;
    bool _1004 = _1002 != 0;
    float _1006 = trunc(_992);
    float _1008 = precise::max(_1006, 0.0);
    uint _1010 = uint(_1008);
    int _1012 = _996 & 3;
    bool _1014 = _1012 != 0;
    int _1016 = _1000 * int(_964);
    int _1018 = _1016 + _772;
    int _1020 = _1004 ? 0 : 1;
    bool _1022 = uint(_1012) > 1u;
    float _1024 = float(uint(_1018));
    int _1026 = ~_1020;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    bool _1032 = !_1014;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = as_type<float>(_473) * _1024;
    int _1038 = int(_954) + int(_1010);
    float _1040 = trunc(_1036);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    int _1046 = _1030;
    float _1048 = as_type<float>(_816);
    float _1050 = as_type<float>(_984);
    if (!_1022)
    {
        int _1052 = ~_1020;
        int _1054 = _1052 + 1;
        _1046 = _1054;
    }
    int _1056 = _1046;
    bool _1058 = uint(_1012) >= 2u;
    int _1060 = _984 * _1038;
    int _1062 = _1060 + _918;
    int _1064 = ~_359;
    int _1066 = _1064 + 1;
    int _1068 = _1058 ? 0 : 1;
    bool _1070 = uint(_1062) >= uint(_397);
    int _1072 = ~_1068;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    bool _1078 = !_1070;
    int _1080 = _1078 ? 0 : (-1);
    bool _1082 = _1012 != 3;
    int _1084 = int(_964) + int(_1044);
    int _1086 = ~_1038;
    int _1088 = _1086 + _1080;
    int _1090 = _1088 + 1;
    float _1092 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1094 = log2(_1092);
    int _1096 = _1066 * _1084;
    int _1098 = _1096 + _772;
    int _1100 = int(_1044);
    int _1102 = _1076;
    int _1104 = _1068;
    float _1106 = as_type<float>(_1084);
    if (_684)
    {
        _1100 = 0;
    }
    int _1108 = _1100;
    int _1110 = _397 * _1090;
    int _1112 = _1110 + _918;
    int _1114 = _1108;
    float _1116 = as_type<float>(_1112);
    if (!_684)
    {
        _1114 = 2;
    }
    int _1118 = _1114;
    float _1120 = _335 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1122 = uint(_1098) >= uint(_359);
    float _1124 = _1120;
    if (_1082)
    {
        int _1126 = ~_1068;
        int _1128 = _1126 + 1;
        _1102 = _1128;
    }
    int _1130 = _1102;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1134 = _1132 != 0;
    bool _1136 = !_824;
    int _1138 = _1136 ? _1112 : (-1);
    bool _1140 = !_1134;
    int _1142 = _1140 ? 0 : 1;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1146 = _1144 != 0;
    float _1148 = _1094 * _139;
    bool _1150 = !_1122;
    int _1152 = _1150 ? 0 : (-1);
    bool _1154 = !_1146;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1138 & 3;
    bool _1160 = _1158 != 0;
    float _1162 = exp2(_1148);
    int _1164 = _1138 & 3;
    bool _1166 = _1164 != 0;
    int _1168 = _1160 ? 0 : 1;
    bool _1170 = uint(_1164) > 1u;
    int _1172 = ~_1168;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    int _1178 = _1176;
    if (_684)
    {
        _1104 = 0;
    }
    int _1180 = _1104;
    int _1182 = _1180;
    if (!_684)
    {
        _1182 = 1;
    }
    int _1184 = _1182;
    int _1186 = abs(_1056);
    int _1188 = abs(_1156);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1192 = as_type<float>(_1184);
    if (!_1170)
    {
        int _1194 = ~_1168;
        int _1196 = _1194 + 1;
        _1178 = _1196;
    }
    int _1198 = _1178;
    bool _1200 = uint(_1164) >= 2u;
    int _1202 = abs(_1198);
    int _1204 = _1200 ? 0 : 1;
    bool _1206 = _1164 != 3;
    int _1208 = ~_1204;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    int _1214 = _1212;
    if (_1206)
    {
        int _1216 = ~_1204;
        int _1218 = _1216 + 1;
        _1214 = _1218;
    }
    int _1220 = _1214;
    bool _1222 = _1184 != 1;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1226 = fma(_904, -2.0, _1224);
    if (!_1222)
    {
        _1116 = _339;
    }
    float _1228 = _1116;
    float _1230 = _1228;
    if (!_1222)
    {
        _1192 = _353;
    }
    float _1232 = _1192;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1236 = _1232;
    if (!_1222)
    {
        _1048 = _1228;
    }
    float _1238 = _1048;
    float _1240 = _1238;
    if (!_1222)
    {
        _1050 = _353;
    }
    float _1242 = _1050;
    float _1244 = _1242;
    if (_1222)
    {
        _1240 = _335;
    }
    float _1246 = _1240;
    if (_1222)
    {
        _1230 = _335;
    }
    float _1248 = _1230;
    if (_1222)
    {
        _1236 = _339;
    }
    float _1250 = _1236;
    if (_1222)
    {
        _1244 = _339;
    }
    float _1252 = _1244;
    float _1254 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1190);
    bool _1256 = _1118 != 2;
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1260 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1234);
    float _1262 = -_1162;
    float _1264 = _1262 + 1.0;
    float _1266 = _335 * 2.0;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1270 = _339 * 2.0;
    float _1272 = -_1268;
    float _1274 = fma(_1120, 2.0, _1272);
    if (_1256)
    {
        _1124 = _335;
    }
    float _1276 = _1124;
    float _1278 = floor(_1270);
    float _1280 = _1276;
    if (!_1256)
    {
        _1280 = _353;
    }
    float _1282 = _1280;
    float _1284 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1286 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1288 = -_361;
    float _1290 = fma(_1284, 2.0, _1288);
    float _1292 = -_932;
    float _1294 = fma(_1286, 2.0, _1292);
    int _1296 = ~_1084;
    int _1298 = _1296 + _1152;
    int _1300 = _1298 + 1;
    float _1302 = floor(_1266);
    if (_1256)
    {
        _1106 = _339;
    }
    float _1304 = _1106;
    float _1306 = -_139;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1290);
    float _1310 = _1304;
    if (!_1256)
    {
        _1310 = _335;
    }
    float _1312 = _1310;
    int _1314 = _359 * _1300;
    int _1316 = _1314 + _772;
    bool _1318 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1320 = isnan(0.0);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1326 = _1322 || _1324;
    float _1328 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1330 = _1326 ? _1264 : 0.0;
    bool _1332 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1334 = isnan(1.0);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1340 = _1336 || _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1344 = 1.0 + _1342;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1348 = fma(_1328, -2.0, _363);
    float _1350 = 1.0 / _1344;
    float _1352 = fma(_1258, -2.0, _1346);
    float _1354 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1348);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1360 = !_700;
    int _1362 = _1360 ? _1316 : (-1);
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1366 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1356);
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1370 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1358);
    float _1372 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1364);
    float _1374 = -_139;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1274);
    float _1378 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1368);
    float _1380 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1366);
    float _1382 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1226);
    float _1384 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1370);
    float _1386 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1372);
    float _1388 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1378);
    float _1390 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1254);
    float _1392 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1260);
    float _1394 = -_139;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1294);
    float _1398 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1352);
    if (_1340)
    {
        float _1400 = _1330 * _1350;
        _143 = _1400;
    }
    float _1402 = _143;
    bool _1404 = _1302 > 0.0;
    float _1406 = in.m_58.x;
    float _1408 = in.m_58.y;
    float _1410 = in.m_58.z;
    bool _1412 = _1302 >= 0.0;
    bool _1414 = isnan(_1302);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    float _1422 = -_219;
    float _1424 = _1422 + 0.5;
    bool _1426 = _1278 >= 0.0;
    bool _1428 = isnan(_1278);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan(0.0);
    bool _1434 = _1430 || _1432;
    int _1436 = _1420 ? 0 : 1;
    bool _1438 = _1278 > 0.0;
    out.m_60.x = _337;
    out.m_60.y = _1424;
    int _1440 = ~_1436;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    int _1446 = _1434 ? 0 : 1;
    int _1448 = _1444;
    if (!_1404)
    {
        int _1450 = ~_1436;
        int _1452 = _1450 + 1;
        _1448 = _1452;
    }
    int _1454 = _1448;
    float _1456 = in.m_62.x;
    float _1458 = in.m_62.y;
    float _1460 = in.m_62.z;
    bool _1462 = _1012 != 3;
    bool _1464 = !_1166;
    int _1466 = _1464 ? 0 : 1;
    float _1468 = in.m_64.x;
    float _1470 = in.m_64.y;
    float _1472 = in.m_64.z;
    bool _1474 = _1164 != 3;
    int _1476 = ~_1446;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    bool _1482 = !_1462;
    int _1484 = _1482 ? 0 : (-1);
    float _1486 = _297 * _1408;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1498 = _1496 != 0;
    int _1500 = _1480;
    if (!_1438)
    {
        int _1502 = ~_1446;
        int _1504 = _1502 + 1;
        _1500 = _1504;
    }
    int _1506 = _1500;
    float _1508 = fma(_295, _1406, _1486);
    int _1510 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1512 = _1510 != 0;
    float _1514 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1516 = fma(_299, _1410, _1508);
    int _1518 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1520 = _1518 != 0;
    float _1522 = _297 * _1458;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1526 = _329 + _1524;
    float _1528 = _297 * _1470;
    float _1530 = fma(_295, _1456, _1522);
    float _1532 = _1514 * _335;
    float _1534 = _1526 * _489;
    float _1536 = fma(_295, _1468, _1528);
    float _1538 = _335 + _339;
    float _1540 = fma(_299, _1460, _1530);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1544 = _329 + _1542;
    float _1546 = trunc(_1532);
    int _1548 = int(_1546);
    float _1550 = fma(_299, _1472, _1536);
    float _1552 = _1538 + (-1.0);
    float _1554 = _1544 * _532;
    float _1556 = _353 * 2.0;
    float _1558 = _335 + _353;
    float _1560 = _353 + _339;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1562;
    float _1566 = _1558 + (-1.0);
    float _1568 = floor(_1556);
    float _1570 = _1560 + (-1.0);
    float _1572 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1574 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1576 = !_1490;
    int _1578 = _1576 ? 0 : 1;
    float _1580 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1582 = _1548 << 4;
    int _1584 = _1582 + 1712;
    float _1586 = fma(_381, _1534, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1588 = 1.0 / _1564;
    bool _1590 = !_1494;
    int _1592 = _1590 ? 0 : 1;
    uint _1594 = uint(int(uint(_1584) >> uint(2)));
    uint _1596 = uint(int(uint(int(_1594)) >> uint(2)));
    int _1598 = int(_1594) & 3;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[int(_1596)][_1598];
    int _1602 = int(_1594) + 1;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    int _1606 = _1602 & 3;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[int(_1604)][_1606];
    float _1610 = float(_1454);
    float _1612 = _1540 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1614 = !_1474;
    int _1616 = _1614 ? 0 : (-1);
    float _1618 = _1550 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1622 = _1620 != 0;
    int _1624 = _1584 + 8;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
    int _1630 = int(_1626) & 3;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[int(_1628)][_1630];
    bool _1634 = _1568 >= 0.0;
    bool _1636 = isnan(_1568);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    bool _1644 = !_1498;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1656 = _347 * _1588;
    int _1658 = _1642 ? 0 : 1;
    float _1660 = fma(_1650, _1534, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1662 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1664 = isnan(_329);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1670 = _1666 || _1668;
    float _1672 = float(_1670);
    bool _1674 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1676 = isnan(_329);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1682 = _1678 || _1680;
    float _1684 = float(_1682);
    bool _1686 = _1568 > 0.0;
    float _1688 = -_1672;
    float _1690 = _1688 + 1.0;
    int _1692 = ~_397;
    int _1694 = _1692 + 1;
    float _1696 = _1684 * _1690;
    float _1698 = -_1684;
    float _1700 = _1698 + 1.0;
    int _1702 = _1694 * int(_946);
    int _1704 = _1702 + _892;
    float _1706 = -_439;
    float _1708 = _1706 + 1.0;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1710;
    float _1714 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1716 = _439 * _1700;
    float _1718 = fma(_403, _1554, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1720 = float(uint(_1704));
    float _1722 = fma(_451, _1656, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1724 = _1714 * _335;
    float _1726 = fma(_1654, _1554, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1728 = fma(_1712, _1656, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1730 = as_type<float>(_487) * _1720;
    float _1732 = _393 * _1708;
    int _1734 = abs(_1592);
    float _1736 = trunc(_1724);
    int _1738 = int(_1736);
    float _1740 = -_393;
    float _1742 = _1740 + 1.0;
    float _1744 = _1586 * _1732;
    float _1746 = _1660 * _1732;
    float _1748 = float(_1734);
    float _1750 = _1600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1752 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1754 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1744);
    float _1756 = in.m_66.x;
    float _1758 = in.m_66.y;
    float _1760 = in.m_66.z;
    float _1762 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1746);
    float _1764 = _1748 * _1610;
    float _1766 = fma(_1718, _1716, _1754);
    float _1768 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1770 = fma(_1726, _1716, _1762);
    int _1772 = _1738 << 4;
    int _1774 = _1772 + 1968;
    float _1776 = trunc(_1730);
    float _1778 = precise::max(_1776, 0.0);
    uint _1780 = uint(_1778);
    int _1782 = ~_1658;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    float _1788 = _1764 * (-2.0);
    int _1790 = _1786;
    if (!_1686)
    {
        int _1792 = ~_1658;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1800 = uint(int(uint(_1774) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    float _1816 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1818 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = fma(_1580, _1788, _1580);
    float _1824 = fma(_1722, _1696, _1766);
    float _1826 = fma(_1728, _1696, _1770);
    float _1828 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    out.m_68.x = _1816;
    out.m_68.y = _1818;
    out.m_68.z = _1820;
    out.m_68.w = _1798;
    float _1830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1832 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1824);
    float _1834 = fma(_1788, _1758, _1758);
    int _1836 = int(_946) + int(_1780);
    int _1838 = _1774 + 8;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    float _1848 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1826);
    int _1850 = abs(_1466);
    int _1852 = ~_397;
    int _1854 = _1852 + 1;
    float _1856 = _339 + (-0.5);
    int _1858 = abs(_1578);
    float _1860 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1834);
    int _1862 = abs(_1646);
    float _1864 = in.m_54.x;
    float _1866 = in.m_54.y;
    float _1868 = float(_1506);
    int _1870 = _1854 * _1836;
    int _1872 = _1870 + _892;
    float _1874 = float(_1796);
    float _1876 = fma(_1822, _1402, _1860);
    float _1878 = float(_1858);
    float _1880 = float(_1862);
    float _1882 = _1876 * 0.15915493667125701904296875;
    bool _1884 = uint(_1872) >= uint(_397);
    float _1886 = _1878 * _1874;
    float _1888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _1890 = _1880 * _1868;
    bool _1892 = !_1884;
    int _1894 = _1892 ? 0 : (-1);
    float _1896 = _1886 * (-2.0);
    bool _1898 = _335 > 0.5;
    float _1900 = _1890 * (-2.0);
    float _1902 = _335 + (-0.5);
    float _1904 = fma(_1896, _1756, _1756);
    float _1906 = fma(_1572, _1896, _1572);
    float _1908 = fma(_1900, _1760, _1760);
    float _1910 = fma(_1574, _1900, _1574);
    float _1912 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1904);
    float _1914 = _353 + (-0.5);
    float _1916 = _1832 * _1864;
    float _1918 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1920 = _562 + 0.5;
    float _1922 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1908);
    float _1924 = fma(_1906, _1402, _1912);
    float _1926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1928 = fma(_1918, _1920, _1308);
    float _1930 = fma(_1910, _1402, _1922);
    int _1932 = _996 >> 31;
    float _1934 = _1924 * 0.15915493667125701904296875;
    float _1936 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1938 = _1814 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1940 = _1932 & 3;
    float _1942 = _1934 * 6.283185482025146484375;
    float _1944 = sin(_1942);
    float _1946 = _1930 * 0.15915493667125701904296875;
    float _1948 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1950 = _996 + _1940;
    float _1952 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1954 = _1138 >> 31;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1958 = _1882 * 6.283185482025146484375;
    float _1960 = sin(_1958);
    float _1962 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1964 = _1954 & 3;
    float _1966 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1970 = _538 + (-0.5);
    int _1972 = _1138 + _1964;
    float _1974 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1976 = _1882 * 6.283185482025146484375;
    float _1978 = cos(_1976);
    out.m_70.x = _1962;
    out.m_70.y = _1952;
    out.m_70.z = _1966;
    out.m_70.w = _1956;
    int _1980 = _1972 >> 2;
    float _1982 = -_1968;
    float _1984 = -_1354;
    float _1986 = fma(_1982, _1970, _1984);
    float _1988 = _1974 * _1888;
    float _1990 = _1848 * _1866;
    int _1992 = _1980 << 4;
    int _1994 = _1992 + 512;
    float _1996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _1998 = _1934 * 6.283185482025146484375;
    float _2000 = cos(_1998);
    int _2002 = _1950 >> 2;
    float _2004 = _1990 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _2006 = ~_1836;
    int _2008 = _2006 + _1894;
    int _2010 = _2008 + 1;
    int _2012 = _2002 << 4;
    int _2014 = _2012 + 368;
    float _2016 = _2004 * _1996;
    float _2018 = _1944 * _1960;
    float _2020 = _1946 * 6.283185482025146484375;
    float _2022 = cos(_2020);
    uint _2024 = uint(int(uint(_2014) >> uint(2)));
    uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
    int _2028 = int(_2024) & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    int _2032 = int(_2024) + 1;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    int _2036 = _2032 & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    float _2040 = _1944 * _1978;
    int _2042 = _397 * _2010;
    int _2044 = _2042 + _892;
    float _2046 = _1946 * 6.283185482025146484375;
    float _2048 = sin(_2046);
    float _2050 = _2000 * _1978;
    float _2052 = _2000 * _1960;
    float _2054 = _2000 * _2022;
    float _2056 = _1944 * _2022;
    float _2058 = _1960 * _2022;
    float _2060 = _1978 * _2022;
    float _2062 = _2054 * _2016;
    float _2064 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2066 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2068 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2070 = fma(_2048, _2050, _2018);
    float _2072 = fma(_2048, _2018, _2050);
    float _2074 = -_2052;
    float _2076 = fma(_2048, _2040, _2074);
    uint _2078 = uint(int(uint(_1994) >> uint(2)));
    uint _2080 = uint(int(uint(int(_2078)) >> uint(2)));
    int _2082 = int(_2078) & 3;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[int(_2080)][_2082];
    int _2086 = int(_2078) + 1;
    uint _2088 = uint(int(uint(_2086) >> uint(2)));
    int _2090 = _2086 & 3;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[int(_2088)][_2090];
    float _2094 = -_2040;
    float _2096 = fma(_2048, _2052, _2094);
    float _2098 = -_2016;
    float _2100 = _2048 * _2098;
    float _2102 = _2056 * _2016;
    float _2104 = fma(_2070, _1988, _2062);
    float _2106 = -_2048;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2064);
    float _2110 = fma(_2060, _1988, _2100);
    float _2112 = -_2048;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2066);
    int _2116 = _1994 + 8;
    uint _2118 = uint(int(uint(_2116) >> uint(2)));
    uint _2120 = uint(int(uint(int(_2118)) >> uint(2)));
    int _2122 = int(_2118) & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    int _2126 = int(_2118) + 1;
    uint _2128 = uint(int(uint(_2126) >> uint(2)));
    int _2130 = _2126 & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    float _2134 = -_2048;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2068);
    float _2138 = fma(_2076, _1988, _2102);
    float _2140 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2142 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2144 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2146 = abs(_1034);
    float _2148 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    int _2150 = _2014 + 8;
    uint _2152 = uint(int(uint(_2150) >> uint(2)));
    uint _2154 = uint(int(uint(int(_2152)) >> uint(2)));
    int _2156 = int(_2152) & 3;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[int(_2154)][_2156];
    int _2160 = int(_2152) + 1;
    uint _2162 = uint(int(uint(_2160) >> uint(2)));
    int _2164 = _2160 & 3;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[int(_2162)][_2164];
    float _2168 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2142);
    float _2170 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2144);
    float _2172 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2108);
    int _2174 = ~_1186;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2114);
    float _2182 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2136);
    float _2184 = fma(_2096, _1828, _2104);
    int _2186 = ~_2146;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = _2178 * as_type<int>(_2038);
    float _2194 = fma(_2058, _1828, _2110);
    float _2196 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2198 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2200 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2202 = ~_1202;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = _2190 * as_type<int>(_2030);
    int _2210 = _2208 + _2192;
    float _2212 = fma(_2072, _1828, _2138);
    int _2214 = abs(_1220);
    float _2216 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2196);
    int _2218 = ~_1850;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2226 = int(_2224);
    int _2228 = ~_2214;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2198);
    int _2236 = abs(_1130);
    float _2238 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2200);
    int _2240 = abs(_1484);
    float _2242 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2244 = ~_2236;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    float _2250 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2216);
    int _2252 = _2206 * as_type<int>(_2092);
    int _2254 = ~_2240;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    float _2260 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2262 = int(_2260);
    int _2264 = abs(_1142);
    int _2266 = _2222 * as_type<int>(_2084);
    int _2268 = _2266 + _2252;
    float _2270 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2242);
    float _2272 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2274 = float(uint(_2226));
    int _2276 = _2232 * as_type<int>(_2124);
    int _2278 = _2276 + _2268;
    int _2280 = abs(_1616);
    float _2282 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2270);
    int _2284 = ~_2226;
    int _2286 = _2284 + 1;
    float _2288 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    int _2290 = ~_2280;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    float _2296 = 1.0 / _2274;
    float _2298 = _2282 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2300 = _2248 * as_type<int>(_2158);
    int _2302 = _2300 + _2210;
    float _2304 = float(uint(_2262));
    int _2306 = _2294 * as_type<int>(_2132);
    int _2308 = _2306 + _2278;
    int _2310 = ~_1188;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = _2258 * as_type<int>(_2166);
    int _2318 = _2316 + _2302;
    int _2320 = ~_2264;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    float _2326 = 1.0 / _2304;
    bool _2328 = !_824;
    int _2330 = _2328 ? _2044 : (-1);
    int _2332 = _2308 * _2314;
    int _2334 = abs(_2262);
    int _2336 = _2318 * _2324;
    int _2338 = abs(_2226);
    int _2340 = _2330 * _1188;
    int _2342 = _2340 + _2332;
    float _2344 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2346 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2348 = _1362 * _2264;
    int _2350 = _2348 + _2336;
    float _2352 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2344);
    float _2354 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2346);
    float _2356 = float(uint(_2334));
    float _2358 = _1516 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2360 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2352);
    float _2362 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2354);
    int _2364 = as_type<int>(_2326) + (-2);
    float _2366 = _1618 + _2298;
    float _2368 = float(uint(_2350));
    float _2370 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2372 = float(uint(_2338));
    float _2374 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2376 = 1.0 / _2356;
    float _2378 = as_type<float>(_2364) * _2368;
    int _2380 = as_type<int>(_2296) + (-2);
    float _2382 = _1612 + _2370;
    float _2384 = float(uint(_2342));
    float _2386 = _2358 + _2374;
    int _2388 = abs(_2342);
    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2392 = _2382 + _2390;
    float _2394 = 1.0 / _2372;
    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2398 = _2386 + _2396;
    float _2400 = as_type<float>(_2380) * _2384;
    float _2402 = _2392 * _2392;
    int _2404 = ~_2262;
    int _2406 = _2404 + 1;
    float _2408 = _2398 * _2398;
    float _2410 = float(uint(_2388));
    float _2412 = trunc(_2378);
    float _2414 = precise::max(_2412, 0.0);
    uint _2416 = uint(_2414);
    float _2418 = _2402 + _2408;
    int _2420 = as_type<int>(_2376) + (-2);
    float _2422 = trunc(_2400);
    float _2424 = precise::max(_2422, 0.0);
    uint _2426 = uint(_2424);
    int _2428 = abs(_2350);
    int _2430 = as_type<int>(_2394) + (-2);
    float _2432 = float(uint(_2428));
    float _2434 = sqrt(_2418);
    int _2436 = _2406 * int(_2416);
    int _2438 = _2436 + _2350;
    float _2440 = as_type<float>(_2420) * _2432;
    float _2442 = as_type<float>(_2430) * _2410;
    float _2444 = float(uint(_2438));
    float _2446 = trunc(_2440);
    float _2448 = precise::max(_2446, 0.0);
    uint _2450 = uint(_2448);
    int _2452 = _2286 * int(_2426);
    int _2454 = _2452 + _2342;
    float _2456 = as_type<float>(_2364) * _2444;
    int _2458 = ~_2334;
    int _2460 = _2458 + 1;
    float _2462 = float(uint(_2454));
    float _2464 = trunc(_2442);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    bool _2470 = _2434 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2472 = as_type<float>(_2380) * _2462;
    int _2474 = ~_2338;
    int _2476 = _2474 + 1;
    float _2478 = trunc(_2456);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    int _2484 = _2460 * int(_2450);
    int _2486 = _2484 + _2428;
    float _2488 = _2072;
    float _2490 = _2402;
    float _2492 = _2408;
    float _2494 = _2382;
    float _2496 = _2386;
    if (!_2470)
    {
        _2488 = _2402;
    }
    float _2498 = _2488;
    int _2500 = _2476 * int(_2468);
    int _2502 = _2500 + _2388;
    float _2504 = float(uint(_2486));
    float _2506 = _2498;
    if (!_2470)
    {
        _2490 = _2366;
    }
    float _2508 = _2490;
    float _2510 = float(uint(_2502));
    bool _2512 = !_2470;
    float _2514 = _2508;
    if (!_2512)
    {
        float _2516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2520 = _2434 + _2518;
        float _2522 = rsqrt(_2418);
        float _2524 = _2520 * _2516;
        float _2526 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2528 = _2524 * 0.15915493667125701904296875;
        float _2530 = _2528 * 6.283185482025146484375;
        float _2532 = sin(_2530);
        float _2534 = _2528 * 6.283185482025146484375;
        float _2536 = cos(_2534);
        float _2538 = fma(_2532, _2526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2540 = _2522 * _2538;
        float _2542 = _2536 + (-1.0);
        float _2544 = fma(_2392, _2540, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2546 = fma(_2398, _2540, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2548 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2552 = _2544 + _2550;
        float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2556 = _2546 + _2554;
        float _2558 = fma(_2366, _2536, _2548);
        float _2560 = _2552 * _2552;
        float _2562 = _2556 * _2556;
        _2514 = _2558;
        _2506 = _2560;
        _2492 = _2562;
        _2494 = _2544;
        _2496 = _2546;
    }
    float _2564 = _2514;
    float _2566 = _2506;
    float _2568 = _2492;
    float _2570 = _2494;
    float _2572 = _2496;
    float _2574 = as_type<float>(_2430) * _2510;
    float _2576 = as_type<float>(_2420) * _2504;
    float _2578 = trunc(_2472);
    float _2580 = precise::max(_2578, 0.0);
    uint _2582 = uint(_2580);
    bool _2584 = _339 > 0.5;
    float _2586 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2148);
    float _2588 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2168);
    float _2590 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2170);
    float _2592 = -_219;
    int _2594 = _2584 ? as_type<int>(_2592) : as_type<int>(_219);
    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2598 = _2564 + _2596;
    bool _2600 = _353 > 0.5;
    float _2602 = trunc(_2576);
    float _2604 = precise::max(_2602, 0.0);
    uint _2606 = uint(_2604);
    float _2608 = -_215;
    int _2610 = _1898 ? as_type<int>(_2608) : as_type<int>(_215);
    float _2612 = fma(_2598, _2598, _2566);
    float _2614 = -_215;
    int _2616 = _2600 ? as_type<int>(_2614) : as_type<int>(_215);
    float _2618 = -_1390;
    float _2620 = _2618 + 1.0;
    bool _2622 = !_1512;
    float _2624 = _2622 ? _219 : as_type<float>(_2594);
    float _2626 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2628 = int(_2416) + int(_2482);
    float _2630 = trunc(_2574);
    float _2632 = precise::max(_2630, 0.0);
    uint _2634 = uint(_2632);
    int _2636 = ~_2262;
    int _2638 = _2636 + 1;
    float _2640 = _2626 * _2172;
    bool _2642 = !_1622;
    float _2644 = _2642 ? _215 : as_type<float>(_2616);
    float _2646 = _2626 * _2180;
    bool _2648 = !_1520;
    float _2650 = _2648 ? _215 : as_type<float>(_2610);
    float _2652 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2654 = _2626 * _2182;
    int _2656 = int(_2426) + int(_2582);
    int _2658 = _2638 * _2628;
    int _2660 = _2658 + _2350;
    int _2662 = ~_2226;
    int _2664 = _2662 + 1;
    float _2666 = fma(_2652, _2586, _2640);
    float _2668 = fma(_2652, _2588, _2646);
    float _2670 = fma(_2652, _2590, _2654);
    int _2672 = int(_2450) + int(_2606);
    int _2674 = _2664 * _2656;
    int _2676 = _2674 + _2342;
    int _2678 = ~_2334;
    int _2680 = _2678 + 1;
    float _2682 = _2612 + _2568;
    int _2684 = ~_2338;
    int _2686 = _2684 + 1;
    float _2688 = -_1384;
    float _2690 = _2688 + 1.0;
    int _2692 = int(_2468) + int(_2634);
    int _2694 = _2680 * _2672;
    int _2696 = _2694 + _2428;
    bool _2698 = uint(_2660) >= uint(_2262);
    float _2700 = sqrt(_2682);
    bool _2702 = uint(_2676) >= uint(_2226);
    int _2704 = _2686 * _2692;
    int _2706 = _2704 + _2388;
    bool _2708 = !_2698;
    int _2710 = _2708 ? 0 : (-1);
    float _2712 = -_1386;
    float _2714 = _2712 + 1.0;
    bool _2716 = uint(_2696) >= uint(_2334);
    float _2718 = -_2690;
    float _2720 = fma(_562, _2718, _1928);
    bool _2722 = !_2702;
    int _2724 = _2722 ? 0 : (-1);
    float _2726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2728 = uint(_2706) >= uint(_2338);
    out.m_72.x = _2586;
    out.m_72.y = _2588;
    out.m_72.z = _2590;
    int _2730 = ~_2628;
    int _2732 = _2730 + _2710;
    int _2734 = _2732 + 1;
    int _2736 = _2350 ^ _2262;
    int _2738 = ~_2656;
    int _2740 = _2738 + _2724;
    int _2742 = _2740 + 1;
    int _2744 = _2262 * _2734;
    int _2746 = _2744 + _2350;
    bool _2748 = !_2716;
    int _2750 = _2748 ? 0 : (-1);
    float _2752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2754 = uint(int(uint(_2736) >> uint(31)));
    int _2756 = _2226 * _2742;
    int _2758 = _2756 + _2342;
    bool _2760 = _2262 == 0;
    bool _2762 = _2262 == 0;
    int _2764 = ~_2750;
    int _2766 = _2672 + _2764;
    int _2768 = _2766 + 1;
    float _2770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2772 = ~int(_2754);
    int _2774 = _2772 + 1;
    int _2776 = _2342 ^ _2226;
    bool _2778 = !_2760;
    int _2780 = _2778 ? _2746 : (-1);
    int _2782 = _2768 ^ _2774;
    float _2784 = _2752 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2786 = _2226 == 0;
    bool _2788 = !_2728;
    int _2790 = _2788 ? 0 : (-1);
    uint _2792 = uint(int(uint(_2776) >> uint(31)));
    float _2794 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2796 = _2226 == 0;
    float _2798 = float(_2780);
    int _2800 = ~_2774;
    int _2802 = _2800 + _2782;
    int _2804 = _2802 + 1;
    int _2806 = ~_2790;
    int _2808 = _2692 + _2806;
    int _2810 = _2808 + 1;
    float _2812 = fma(_2794, _2798, _1376);
    int _2814 = ~int(_2792);
    int _2816 = _2814 + 1;
    float _2818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2820 = !_2786;
    int _2822 = _2820 ? _2758 : (-1);
    float _2824 = fma(_2626, _2626, 1.0);
    int _2826 = _2810 ^ _2816;
    float _2828 = float(_2822);
    float _2830 = _2650 + 0.5;
    int _2832 = ~_2816;
    int _2834 = _2832 + _2826;
    int _2836 = _2834 + 1;
    float _2838 = rsqrt(_2824);
    bool _2840 = _2700 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2842 = isnan(_2700);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2848 = _2844 || _2846;
    float _2850 = fma(_2784, _2828, _1396);
    bool _2852 = !_2762;
    int _2854 = _2852 ? _2804 : (-1);
    float _2856 = fma(_2794, _2830, _2812);
    bool _2858 = !_2796;
    int _2860 = _2858 ? _2836 : (-1);
    float _2862 = _2644 + 0.5;
    float _2864 = float(_2854);
    float _2866 = _2770 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2868 = float(_2860);
    float _2870 = _2818 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2872 = fma(_2784, _2862, _2850);
    float _2874 = -_1382;
    float _2876 = fma(_2866, _2864, _2874);
    float _2878 = _2624 + (-0.5);
    float _2880 = -_1398;
    float _2882 = fma(_2870, _2868, _2880);
    float _2884 = _624 + (-0.5);
    float _2886 = _2288 + _2670;
    float _2888 = -_2866;
    float _2890 = fma(_2888, _2878, _2876);
    float _2892 = _2626 * _2838;
    float _2894 = -_2870;
    float _2896 = fma(_2894, _2884, _2882);
    float _2898 = -_1388;
    float _2900 = _2898 + 1.0;
    float _2902 = -_2272;
    float _2904 = _2892 * _2902;
    float _2906 = -_2250;
    float _2908 = _2892 * _2906;
    float _2910 = -_2288;
    float _2912 = _2892 * _2910;
    float _2914 = fma(_538, _2900, _1986);
    float _2916 = fma(_2838, _2180, _2904);
    float _2918 = -_1380;
    float _2920 = _2918 + 1.0;
    float _2922 = -_1392;
    float _2924 = _2922 + 1.0;
    float _2926 = fma(_2838, _2172, _2908);
    float _2928 = fma(_2838, _2182, _2912);
    float _2930 = -_2920;
    float _2932 = fma(_2650, _2930, _2856);
    float _2934 = -_2620;
    float _2936 = fma(_2644, _2934, _2872);
    float _2938 = _2250 + _2666;
    float _2940 = _2272 + _2668;
    float _2942 = fma(_2624, _2714, _2890);
    float _2944 = fma(_624, _2924, _2896);
    out.m_74.x = _2720;
    out.m_74.y = _2914;
    float _2946 = _2890;
    float _2948 = _2590;
    if (!_2848)
    {
        _2946 = 1.0;
    }
    float _2950 = _2946;
    out.m_76.x = _2938;
    out.m_76.y = _2940;
    out.m_76.z = _2886;
    out.m_78.x = _2926;
    out.m_78.y = _2916;
    out.m_78.z = _2928;
    out.m_80.x = _2932;
    out.m_80.y = _2942;
    out.m_80.z = _2936;
    out.m_80.w = _2944;
    bool _2952 = !_2848;
    float _2954 = _2950;
    if (!_2952)
    {
        bool _2956 = _2700 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2958 = isnan(_2700);
        bool _2960 = _2956 || _2958;
        bool _2962 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2964 = _2960 || _2962;
        if (!_2964)
        {
            float _2966 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2968 = _2700 + _2966;
            float _2970 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2972 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2970;
            float _2974 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2976 = _2974 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2978 = 1.0 / _2972;
            float _2980 = _2968 * _2978;
            float _2982 = fma(_2980, _2976, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2954 = _2982;
            _2984 = true;
        }
        else
        {
            bool _2986 = _2700 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2988 = isnan(_2700);
            bool _2990 = _2986 || _2988;
            bool _2992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2994 = _2990 || _2992;
            if (!_2994)
            {
                float _2996 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2998 = _2700 + _2996;
                float _3000 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3002 = _3000 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3004 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3006 = _3004 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3008 = 1.0 / _3002;
                float _3010 = _2998 * _3008;
                float _3012 = fma(_3010, _3006, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2954 = _3012;
                _2984 = true;
            }
            else
            {
                _2954 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2984 = false;
    float _3014 = _2954;
    float _3016 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3020 = _2570 + _3018;
    float _3022 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3024 = _2564 + _3022;
    float _3026 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3016);
    float _3028 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3030 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3032 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3034 = _3030 || _3032;
    bool _3036 = isnan(0.5);
    bool _3038 = _3034 || _3036;
    float _3040 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3042 = _2572 + _3040;
    float _3044 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3026);
    float _3046 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3028);
    float _3048 = fma(_3020, _3014, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3050 = fma(_3024, _3014, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3052 = _3044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3054 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3046);
    float _3056 = fma(_3042, _3014, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3058 = 1.0 / _3052;
    float _3060 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3062 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3066 = _3062 || _3064;
    bool _3068 = isnan(0.5);
    bool _3070 = _3066 || _3068;
    float _3072 = _3060 + _3052;
    float _3074 = _3060;
    float _3076 = _3028;
    float _3078 = _3044;
    float _3080 = _3052;
    if (_3038)
    {
        _3074 = _3048;
    }
    float _3082 = _3074;
    float _3084 = _3082;
    if (_3038)
    {
        _3076 = _3050;
    }
    float _3086 = _3076;
    float _3088 = _3086;
    if (_3038)
    {
        _3078 = _3056;
    }
    float _3090 = _3078;
    float _3092 = _3090;
    float _3094 = _3058;
    if (!_3038)
    {
        float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3098 = _1618 + _3096;
        float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3102 = _1612 + _3100;
        float _3104 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3106 = _3098 * _3098;
        float _3108 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3110 = _2358 + _3108;
        float _3112 = fma(_3102, _3102, _3106);
        float _3114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3116 = fma(_3110, _3110, _3112);
        float _3118 = sqrt(_3116);
        float _3120 = _3104 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3122 = -_1618;
        float _3124 = _3122 + _3050;
        float _3126 = precise::min(_3118, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3128 = _3126 * _3114;
        float _3130 = -_1612;
        float _3132 = _3130 + _3048;
        float _3134 = -_2358;
        float _3136 = _3134 + _3056;
        float _3138 = _3120 * _3128;
        float _3140 = fma(_3132, _3138, _1612);
        float _3142 = fma(_3124, _3138, _1618);
        float _3144 = fma(_3136, _3138, _2358);
        _3088 = _3142;
        _3084 = _3140;
        _3092 = _3144;
        _3080 = _3138;
    }
    float _3146 = _3088;
    float _3148 = _3084;
    float _3150 = _3092;
    float _3152 = _3080;
    float _3154 = _3152;
    if (_3070)
    {
        _3154 = 1.0;
    }
    float _3156 = _3154;
    float _3158 = _3072 * _3058;
    float _3160 = _3158 * 0.5;
    float _3162 = _3156;
    float _3164 = _3160;
    if (!_3070)
    {
        float _3166 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3168 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3170 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3168);
        float _3172 = _3166 * 0.15915493667125701904296875;
        float _3174 = _3172 * 6.283185482025146484375;
        float _3176 = cos(_3174);
        float _3178 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3180 = _3178 * 0.15915493667125701904296875;
        float _3182 = _3172 * 6.283185482025146484375;
        float _3184 = sin(_3182);
        float _3186 = 1.0 / _3176;
        float _3188 = _3180 * 6.283185482025146484375;
        float _3190 = cos(_3188);
        float _3192 = _3184 * _3186;
        float _3194 = 1.0 / _3170;
        float _3196 = _3190 * _3192;
        float _3198 = _3180 * 6.283185482025146484375;
        float _3200 = sin(_3198);
        float _3202 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3204 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3202;
        float _3206 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3208 = _3194 * _3206;
        float _3210 = 1.0 / _3196;
        float _3212 = 1.0 / _3204;
        float _3214 = _3200 * _3210;
        float _3216 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3218 = fma(_3214, _3208, _3216);
        float _3220 = _3218 * _3212;
        float _3222 = precise::clamp(_3220, 0.0, 1.0);
        float _3224 = -_3222;
        float _3226 = _3224 + 1.0;
        _3094 = _3210;
        _3162 = _3226;
    }
    float _3228 = _3094;
    float _3230 = _3162;
    float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3234 = _3146 + _3232;
    float _3236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3238 = _3148 + _3236;
    float _3240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3242 = _3150 + _3240;
    float _3244 = _3234 * _3234;
    float _3246 = fma(_3238, _3238, _3244);
    float _3248 = fma(_3242, _3242, _3246);
    float _3250 = rsqrt(_3248);
    float _3252 = sqrt(_3248);
    float _3254 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3256 = _3238 * _3254;
    float _3258 = _3242 * _3254;
    float _3260 = _3256 * _3256;
    float _3262 = _3258 * _3258;
    float _3264 = _3260 + _3262;
    float _3266 = sqrt(_3264);
    bool _3268 = _3266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3272 = _3266 + _3270;
    float _3274 = _3250;
    float _3276 = _3272;
    float _3278 = _3234;
    float _3280 = _3256;
    if (_3268)
    {
        float _3282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3274 = _3282;
    }
    float _3284 = _3274;
    float _3286 = _3284;
    if (_3268)
    {
        float _3288 = _3272 * _3284;
        _3276 = _3288;
    }
    float _3290 = _3276;
    if (_3268)
    {
        float _3292 = rsqrt(_3264);
        _3286 = _3292;
    }
    float _3294 = _3286;
    float _3296 = _3294;
    if (_3268)
    {
        float _3298 = _3290 * 0.15915493667125701904296875;
        _3164 = _3298;
    }
    float _3300 = _3164;
    float _3302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3304 = _3242;
    float _3306 = _3300;
    if (_3268)
    {
        float _3308 = _3300 * 6.283185482025146484375;
        float _3310 = sin(_3308);
        _3304 = _3310;
    }
    float _3312 = _3304;
    float _3314 = precise::max(0.0, _3302);
    float _3316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3318 = _3228;
    float _3320 = _3314;
    if (_3268)
    {
        float _3322 = _3300 * 6.283185482025146484375;
        float _3324 = cos(_3322);
        _3318 = _3324;
    }
    float _3326 = _3318;
    float _3328 = -_3254;
    float _3330 = -_3314;
    float _3332 = fma(_3234, _3328, _3330);
    if (_3268)
    {
        float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3278 = _3334;
    }
    float _3336 = _3278;
    float _3338 = _3312;
    float _3340 = _3336;
    if (_3268)
    {
        float _3342 = fma(_3312, _3336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3338 = _3342;
    }
    float _3344 = _3338;
    float _3346 = _3344;
    if (!_3268)
    {
        _3340 = _3262;
    }
    float _3348 = _3340;
    float _3350 = _3348;
    if (_3268)
    {
        float _3352 = _3294 * _3344;
        _2948 = _3352;
    }
    float _3354 = _2948;
    if (!_3268)
    {
        _3296 = _3332;
    }
    float _3356 = _3296;
    float _3358 = _3356;
    if (_3268)
    {
        float _3360 = _3326 + (-1.0);
        _3320 = _3360;
    }
    float _3362 = _3320;
    float _3364 = _3362;
    if (_3268)
    {
        float _3366 = _3256 * _3354;
        _3280 = _3366;
    }
    float _3368 = _3280;
    if (!_3268)
    {
        _3346 = _3258;
    }
    float _3370 = _3346;
    float _3372 = _3370;
    if (_3268)
    {
        float _3374 = _3258 * _3354;
        _3372 = _3374;
    }
    float _3376 = _3372;
    if (_3268)
    {
        float _3378 = _3362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3306 = _3378;
    }
    float _3380 = _3306;
    if (!_3268)
    {
        _3364 = _3260;
    }
    float _3382 = _3364;
    float _3384 = _3382;
    if (_3268)
    {
        float _3386 = _3368 * _3368;
        _3384 = _3386;
    }
    float _3388 = _3384;
    if (_3268)
    {
        float _3390 = _3376 * _3376;
        _3350 = _3390;
    }
    float _3392 = _3350;
    if (_3268)
    {
        float _3394 = fma(_3332, _3326, _3380);
        _3358 = _3394;
    }
    float _3396 = _3358;
    float _3398 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3400 = fma(_3396, _3396, _3388);
    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3404 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3402);
    float _3406 = precise::clamp(_3404, 0.0, 1.0);
    float _3408 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3398);
    float _3410 = _3400 + _3392;
    float _3412 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3414 = -_3406;
    float _3416 = _3414 + 1.0;
    float _3418 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3408);
    float _3420 = rsqrt(_3410);
    float _3422 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3412);
    float _3424 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3426 = _3418 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3428 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3422);
    float _3430 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3424);
    float _3432 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3434 = _3428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3436 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3430);
    float _3438 = abs(_3416);
    float _3440 = log2(_3438);
    float _3442 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3432);
    float _3444 = _3434 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3446 = _3436 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3448 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3442);
    float _3450 = _3420 * _3368;
    float _3452 = -_3444;
    float _3454 = fma(_3452, _3316, 1.0);
    float _3456 = _3420 * _3396;
    float _3458 = _3448 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3460 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3462 = _3450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3464 = _3420 * _3376;
    float _3466 = log2(_3454);
    float _3468 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3460);
    float _3470 = -_3462;
    float _3472 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3470);
    float _3474 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3476 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3478 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3468);
    float _3480 = -_3464;
    float _3482 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3472);
    float _3484 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3486 = exp2(_3474);
    float _3488 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3478);
    float _3490 = fma(_3482, -0.5, 0.5);
    float _3492 = fma(_3482, 0.5, 0.5);
    float _3494 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3484);
    float _3496 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3476);
    float _3498 = _3456 + 1.0;
    float _3500 = fma(_3492, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3502 = 1.0 / _3488;
    float _3504 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3494);
    float _3506 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3496);
    float _3508 = _3466 * 0.693147182464599609375;
    float _3510 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3504);
    float _3512 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3514 = sqrt(_3490);
    float _3516 = -_3456;
    float _3518 = fma(_3486, _3498, _3516);
    float _3520 = fma(_3492, _3500, -0.212114393711090087890625);
    float _3522 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3506);
    float _3524 = fma(_3518, 0.5, 0.5);
    float _3526 = fma(_3492, _3520, 1.570728778839111328125);
    float _3528 = _3510 * _3502;
    float _3530 = _3522 * _3502;
    float _3532 = fma(_3528, 0.5, 0.5);
    float _3534 = fma(_3530, -0.5, 0.5);
    float _3536 = _3514 * 0.636619746685028076171875;
    float3 _8838 = float3(_3532, _3534, _3512);
    float _3538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8838, float3(0.0), isnan(_8838)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8838, float3(0.0), isnan(_8838)), level(0.0)).x;
    float3 _8849 = float3(_3532, _3534, _3512);
    float4 _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8849, float3(0.0), isnan(_8849)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8849, float3(0.0), isnan(_8849)), level(0.0)).xyzw;
    float _3543 = _3541.x;
    float _3545 = _3541.y;
    float _3547 = _3541.z;
    float _3549 = _3541.w;
    float _3551 = -_3526;
    float _3553 = fma(_3536, _3551, 1.0);
    float2 _8871 = float2(_3553, _3524);
    float3 _3557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8871, float2(0.0), isnan(_8871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8871, float2(0.0), isnan(_8871)), level(0.0)).xyz;
    float _3559 = _3557.x;
    float _3561 = _3557.y;
    float _3563 = _3557.z;
    float _3565 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3567 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3569 = _3230 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3571 = _3488 * 0.5;
    bool _3573 = _3230 > 0.0;
    bool _3575 = isnan(_3230);
    bool _3577 = _3573 || _3575;
    bool _3579 = isnan(0.0);
    bool _3581 = _3577 || _3579;
    float _3583 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3567);
    float _3585 = exp2(_3565);
    float _3587 = _3510 + _3488;
    out.m_82.x = _3148;
    out.m_82.y = _3146;
    out.m_82.z = _3150;
    float _3589 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3583);
    float _3591 = fma(_3522, -0.5, _3571);
    float _3593 = _3587 * 0.5;
    float _3595 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3589);
    float _3597 = _3595 + _3488;
    out.gl_Position.x = _3510;
    out.gl_Position.y = _3522;
    out.gl_Position.z = _3595;
    out.gl_Position.w = _3488;
    float _3599 = _3597 * 0.5;
    float _3601 = -_3585;
    float _3603 = _3601 + 1.0;
    float _3605 = _3569 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3607 = _3603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3593;
    out.m_84.y = _3591;
    out.m_84.z = _3599;
    out.m_84.w = _3488;
    float _3609 = -_3607;
    float _3611 = _3609 + 1.0;
    out.m_47.x = _3605;
    float _3613 = _3607 * _3538;
    float _3615 = _3549 * _3613;
    float _3617 = _3549 * _3611;
    float _3619 = _3563 * _3613;
    float _3621 = fma(_3559, _3615, _3543);
    float _3623 = fma(_3561, _3615, _3545);
    float _3625 = fma(_3549, _3619, _3547);
    out.m_86.x = _3621;
    out.m_86.y = _3623;
    out.m_86.z = _3625;
    out.m_86.w = _3617;
    if (_3581)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3627 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3627;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2984 = false;
    bool _321 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3684 = as_type<float>(_121);
        out.gl_Position.z = _3684;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_47.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    float _161 = as_type<float>(_159);
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3755 = as_type<float>(_159);
        out.gl_Position.z = _3755;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _167 = in.m_54.w;
    bool _169 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _171 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _173 = _169 || _171;
    bool _175 = isnan(1.0);
    bool _177 = _173 || _175;
    float _179 = in.m_49.x;
    float _181 = in.m_49.y;
    float _183 = in.m_49.z;
    float _185 = in.m_44.x;
    float _187 = in.m_44.y;
    float _189 = in.m_44.z;
    float _191 = _165;
    if (!_177)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _161 = _195;
    }
    float _197 = _161;
    float _199 = _197;
    if (!_177)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    int _205 = as_type<int>(_163) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_163) & 2;
    bool _211 = _209 != 0;
    bool _213 = !_207;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_211;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_177;
    float _223 = _203;
    if (!_221)
    {
        float _225 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = log2(_225);
        float _229 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _231 = _229 + 1.0;
        float _233 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _235 = _165 * _227;
        float _237 = 1.0 / _231;
        float _239 = _233 * 0.693147182464599609375;
        float _241 = exp2(_235);
        float _243 = 1.0 / _239;
        float _245 = _241 + (-1.0);
        float _247 = -_245;
        float _249 = fma(_247, _243, _165);
        float _251 = _249 * _237;
        float _253 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _253;
    }
    float _255 = _223;
    bool _257 = !_177;
    if (!_257)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _165 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _191 = _277;
    }
    float _279 = _191;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _289 = fma(_279, _179, _283);
    float _291 = fma(_279, _181, _285);
    float _293 = fma(_279, _183, _287);
    float _295 = fma(_289, _167, _185);
    float _297 = fma(_291, _167, _187);
    float _299 = fma(_293, _167, _189);
    bool _301 = !_281;
    float _319;
    if (!_301)
    {
        float _303 = in.m_56.x;
        float _305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _307 = _303 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _311 = _309 * _305;
        float _313 = floor(_311);
        float _315 = -_313;
        float _317 = _311 + _315;
        _319 = _317;
        _321 = true;
    }
    else
    {
        float _323 = float(_105);
        float _325 = 1.0 / _323;
        float _327 = _139 * _325;
        _319 = _327;
    }
    _321 = false;
    float _329 = _319;
    float _331 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _333 = int(_331);
    float _335 = in.m_56.x;
    float _337 = _215 + 0.5;
    float _339 = in.m_56.y;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _343 = _341 != 0;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _347 = _329 + _345;
    float _349 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _351 = int(_349);
    float _353 = in.m_56.z;
    float _355 = float(_333);
    float _357 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _359 = int(_357);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _365 = float(_351);
    float _367 = 1.0 / _355;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _377 = _339 > 0.5;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    bool _383 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _385 = isnan(_329);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _397 = int(_395);
    float _399 = float(uint(_359));
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _405 = _353 > 0.5;
    int _407 = ~_359;
    int _409 = _407 + 1;
    int _411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _413 = _411 != 0;
    int _415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _417 = _415 != 0;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _421 = _419 != 0;
    float _423 = 1.0 / _365;
    float _425 = _367 * _139;
    float _427 = float(_359);
    bool _429 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _431 = isnan(_329);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = 1.0 / _399;
    float _443 = float(uint(_397));
    float _445 = _365;
    if (_343)
    {
        _445 = 1.0;
    }
    float _447 = _445;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = _447;
    if (!_343)
    {
        _453 = 7.345489978790283203125;
    }
    float _455 = _453;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _459 = _457 != 0;
    float _461 = trunc(_425);
    int _463 = int(_461);
    float _465 = _423 * _139;
    bool _467 = !_459;
    int _469 = _467 ? 0 : 1;
    float _471 = 1.0 / _443;
    int _473 = as_type<int>(_441) + (-2);
    int _475 = ~_359;
    int _477 = _475 + 1;
    float _479 = trunc(_465);
    int _481 = int(_479);
    float _483 = float(uint(_463));
    float _485 = as_type<float>(_473) * _483;
    int _487 = as_type<int>(_471) + (-2);
    float _489 = 1.0 / _371;
    float _491 = float(uint(_481));
    float _493 = trunc(_485);
    float _495 = precise::max(_493, 0.0);
    uint _498 = uint(_495);
    float _500 = as_type<float>(_487) * _491;
    int _502 = ~_397;
    int _504 = _502 + 1;
    float _506 = trunc(_500);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    float _512 = _455 * _335;
    float _514 = in.m_56.w;
    int _516 = _477 * int(_498);
    int _518 = _516 + _463;
    float _520 = floor(_512);
    float _522 = float(uint(_518));
    float _524 = -_219;
    int _526 = _405 ? as_type<int>(_524) : as_type<int>(_219);
    int _528 = _504 * int(_510);
    int _530 = _528 + _481;
    float _532 = 1.0 / _375;
    float _534 = as_type<float>(_473) * _522;
    bool _536 = !_421;
    float _538 = _536 ? _219 : as_type<float>(_526);
    float _540 = float(uint(_530));
    float _542 = trunc(_534);
    float _544 = precise::max(_542, 0.0);
    uint _546 = uint(_544);
    float _548 = as_type<float>(_487) * _540;
    float _550 = -_215;
    int _552 = _377 ? as_type<int>(_550) : as_type<int>(_215);
    float _554 = trunc(_548);
    float _556 = precise::max(_554, 0.0);
    uint _558 = uint(_556);
    bool _560 = !_417;
    float _562 = _560 ? _215 : as_type<float>(_552);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _566 = _564 != 0;
    int _568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _570 = _568 != 0;
    int _572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _574 = _572 != 0;
    bool _576 = _514 > 0.5;
    float _578 = -_520;
    float _580 = _512 + _578;
    int _582 = ~_397;
    int _584 = _582 + 1;
    int _586 = int(_498) + int(_546);
    float _588 = _580 * _427;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _592 = _590 != 0;
    float _594 = trunc(_588);
    int _596 = int(_594);
    float _598 = float(_105);
    int _600 = _409 * _586;
    int _602 = _600 + _463;
    int _604 = int(_510) + int(_558);
    float _606 = -_219;
    int _608 = _576 ? as_type<int>(_606) : as_type<int>(_219);
    float _610 = 1.0 / _598;
    bool _612 = !_592;
    int _614 = _612 ? 0 : 1;
    int _616 = _584 * _604;
    int _618 = _616 + _481;
    bool _620 = uint(_602) >= uint(_359);
    bool _622 = !_413;
    float _624 = _622 ? _219 : as_type<float>(_608);
    float _626 = float(_463);
    int _628 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _630 = _628 != 0;
    bool _632 = _626 >= _427;
    bool _634 = isnan(_626);
    bool _636 = _632 || _634;
    bool _638 = isnan(_427);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    bool _644 = uint(_618) >= uint(_397);
    bool _646 = !_630;
    int _648 = _646 ? 0 : 1;
    float _650 = trunc(_642);
    int _652 = int(_650);
    bool _654 = !_620;
    float _656 = _654 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _658 = !_644;
    int _660 = _658 ? 0 : (-1);
    bool _662 = !_570;
    int _664 = _662 ? 0 : 1;
    int _666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _668 = _666 != 0;
    int _670 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _672 = _670 != 0;
    int _674 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _676 = _674 != 0;
    int _678 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _680 = _678 != 0;
    int _682 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _684 = _682 != 0;
    float _686 = _610 * _139;
    int _688 = ~_586;
    int _690 = _688 + as_type<int>(_656);
    int _692 = _690 + 1;
    bool _694 = !_672;
    int _696 = _694 ? 0 : 1;
    float _698 = _427 * _686;
    bool _700 = _359 == 0;
    int _702 = _359 * _692;
    int _704 = _702 + _463;
    int _706 = abs(_469);
    int _708 = ~_652;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    float _714 = trunc(_698);
    int _716 = int(_714);
    bool _718 = !_700;
    int _720 = _718 ? _704 : (-1);
    float _722 = _656;
    float _724 = as_type<float>(_586);
    if (_684)
    {
        _722 = 1.0;
    }
    float _726 = _722;
    float _728 = _726;
    if (_684)
    {
        _724 = _335;
    }
    float _730 = _724;
    int _732 = _720 * _712;
    float _734 = _730;
    if (!_684)
    {
        _728 = 1.2345600128173828125;
    }
    float _736 = _728;
    if (!_684)
    {
        _734 = _339;
    }
    float _738 = _734;
    int _740 = _359 + (-1);
    bool _742 = !_566;
    int _744 = _742 ? 0 : 1;
    float _746 = _736 * _738;
    bool _748 = !_574;
    int _750 = _748 ? 0 : 1;
    int _752 = _652 * _740;
    int _754 = _752 + _732;
    int _756 = abs(_664);
    float _758 = floor(_746);
    float _760 = float(_397);
    float _762 = float(_481);
    int _764 = _754 * _756;
    int _766 = abs(_744);
    int _768 = abs(_750);
    int _770 = _596 * _706;
    int _772 = _770 + _463;
    int _774 = abs(_614);
    int _776 = _716 * _766;
    int _778 = _776 + _764;
    bool _780 = _762 >= _760;
    bool _782 = isnan(_762);
    bool _784 = _780 || _782;
    bool _786 = isnan(_760);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = -_758;
    float _794 = _746 + _792;
    float _796 = trunc(_790);
    int _798 = int(_796);
    int _800 = _772 * _768;
    int _802 = _800 + _778;
    int _804 = ~_604;
    int _806 = _804 + _660;
    int _808 = _806 + 1;
    bool _810 = !_668;
    int _812 = _810 ? 0 : 1;
    int _814 = _596 * _774;
    int _816 = _814 + _802;
    float _818 = _794 * _760;
    int _820 = _397 * _808;
    int _822 = _820 + _481;
    bool _824 = _397 == 0;
    float _826 = _760 * _686;
    float _828 = float(uint(_816));
    float _830 = trunc(_818);
    int _832 = int(_830);
    bool _834 = !_824;
    int _836 = _834 ? _822 : (-1);
    int _838 = abs(_696);
    float _840 = as_type<float>(_473) * _828;
    int _842 = ~_798;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = _397 + (-1);
    float _850 = trunc(_826);
    int _852 = int(_850);
    int _854 = _836 * _846;
    int _856 = ~_359;
    int _858 = _856 + 1;
    int _860 = abs(_812);
    int _862 = _798 * _848;
    int _864 = _862 + _854;
    float _866 = trunc(_840);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    int _872 = _864 * _838;
    int _874 = abs(_648);
    bool _876 = !_676;
    int _878 = _876 ? 0 : 1;
    int _880 = _852 * _860;
    int _882 = _880 + _872;
    int _884 = abs(_878);
    bool _886 = !_680;
    int _888 = _886 ? 0 : 1;
    int _890 = _832 * _874;
    int _892 = _890 + _481;
    int _894 = ~_397;
    int _896 = _894 + 1;
    int _898 = _858 * int(_870);
    int _900 = _898 + _816;
    int _902 = abs(_888);
    float _904 = _339 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _906 = float(uint(_900));
    int _908 = _892 * _884;
    int _910 = _908 + _882;
    float _912 = float(uint(_772));
    float _914 = as_type<float>(_473) * _906;
    int _916 = _832 * _902;
    int _918 = _916 + _910;
    float _920 = float(uint(_892));
    float _922 = as_type<float>(_473) * _912;
    float _924 = trunc(_914);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    float _930 = float(uint(_918));
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _934 = as_type<float>(_487) * _920;
    float _936 = as_type<float>(_487) * _930;
    int _938 = ~_359;
    int _940 = _938 + 1;
    float _942 = trunc(_934);
    float _944 = precise::max(_942, 0.0);
    uint _946 = uint(_944);
    int _948 = int(_870) + int(_928);
    float _950 = trunc(_936);
    float _952 = precise::max(_950, 0.0);
    uint _954 = uint(_952);
    int _956 = _940 * _948;
    int _958 = _956 + _816;
    float _960 = trunc(_922);
    float _962 = precise::max(_960, 0.0);
    uint _964 = uint(_962);
    bool _966 = uint(_958) >= uint(_359);
    bool _968 = !_966;
    int _970 = _968 ? 0 : (-1);
    int _972 = _896 * int(_954);
    int _974 = _972 + _918;
    int _976 = ~_948;
    int _978 = _976 + _970;
    int _980 = _978 + 1;
    int _982 = ~_397;
    int _984 = _982 + 1;
    float _986 = float(uint(_974));
    int _988 = _359 * _980;
    int _990 = _988 + _816;
    float _992 = as_type<float>(_487) * _986;
    bool _994 = !_700;
    int _996 = _994 ? _990 : (-1);
    int _998 = ~_359;
    int _1000 = _998 + 1;
    int _1002 = _996 & 3;
    bool _1004 = _1002 != 0;
    float _1006 = trunc(_992);
    float _1008 = precise::max(_1006, 0.0);
    uint _1010 = uint(_1008);
    int _1012 = _996 & 3;
    bool _1014 = _1012 != 0;
    int _1016 = _1000 * int(_964);
    int _1018 = _1016 + _772;
    int _1020 = _1004 ? 0 : 1;
    bool _1022 = uint(_1012) > 1u;
    float _1024 = float(uint(_1018));
    int _1026 = ~_1020;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    bool _1032 = !_1014;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = as_type<float>(_473) * _1024;
    int _1038 = int(_954) + int(_1010);
    float _1040 = trunc(_1036);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    int _1046 = _1030;
    float _1048 = as_type<float>(_816);
    float _1050 = as_type<float>(_984);
    if (!_1022)
    {
        int _1052 = ~_1020;
        int _1054 = _1052 + 1;
        _1046 = _1054;
    }
    int _1056 = _1046;
    bool _1058 = uint(_1012) >= 2u;
    int _1060 = _984 * _1038;
    int _1062 = _1060 + _918;
    int _1064 = ~_359;
    int _1066 = _1064 + 1;
    int _1068 = _1058 ? 0 : 1;
    bool _1070 = uint(_1062) >= uint(_397);
    int _1072 = ~_1068;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    bool _1078 = !_1070;
    int _1080 = _1078 ? 0 : (-1);
    bool _1082 = _1012 != 3;
    int _1084 = int(_964) + int(_1044);
    int _1086 = ~_1038;
    int _1088 = _1086 + _1080;
    int _1090 = _1088 + 1;
    float _1092 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1094 = log2(_1092);
    int _1096 = _1066 * _1084;
    int _1098 = _1096 + _772;
    int _1100 = int(_1044);
    int _1102 = _1076;
    int _1104 = _1068;
    float _1106 = as_type<float>(_1084);
    if (_684)
    {
        _1100 = 0;
    }
    int _1108 = _1100;
    int _1110 = _397 * _1090;
    int _1112 = _1110 + _918;
    int _1114 = _1108;
    float _1116 = as_type<float>(_1112);
    if (!_684)
    {
        _1114 = 2;
    }
    int _1118 = _1114;
    float _1120 = _335 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1122 = uint(_1098) >= uint(_359);
    float _1124 = _1120;
    if (_1082)
    {
        int _1126 = ~_1068;
        int _1128 = _1126 + 1;
        _1102 = _1128;
    }
    int _1130 = _1102;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1134 = _1132 != 0;
    bool _1136 = !_824;
    int _1138 = _1136 ? _1112 : (-1);
    bool _1140 = !_1134;
    int _1142 = _1140 ? 0 : 1;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1146 = _1144 != 0;
    float _1148 = _1094 * _139;
    bool _1150 = !_1122;
    int _1152 = _1150 ? 0 : (-1);
    bool _1154 = !_1146;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1138 & 3;
    bool _1160 = _1158 != 0;
    float _1162 = exp2(_1148);
    int _1164 = _1138 & 3;
    bool _1166 = _1164 != 0;
    int _1168 = _1160 ? 0 : 1;
    bool _1170 = uint(_1164) > 1u;
    int _1172 = ~_1168;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    int _1178 = _1176;
    if (_684)
    {
        _1104 = 0;
    }
    int _1180 = _1104;
    int _1182 = _1180;
    if (!_684)
    {
        _1182 = 1;
    }
    int _1184 = _1182;
    int _1186 = abs(_1056);
    int _1188 = abs(_1156);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1192 = as_type<float>(_1184);
    if (!_1170)
    {
        int _1194 = ~_1168;
        int _1196 = _1194 + 1;
        _1178 = _1196;
    }
    int _1198 = _1178;
    bool _1200 = uint(_1164) >= 2u;
    int _1202 = abs(_1198);
    int _1204 = _1200 ? 0 : 1;
    bool _1206 = _1164 != 3;
    int _1208 = ~_1204;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    int _1214 = _1212;
    if (_1206)
    {
        int _1216 = ~_1204;
        int _1218 = _1216 + 1;
        _1214 = _1218;
    }
    int _1220 = _1214;
    bool _1222 = _1184 != 1;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1226 = fma(_904, -2.0, _1224);
    if (!_1222)
    {
        _1116 = _339;
    }
    float _1228 = _1116;
    float _1230 = _1228;
    if (!_1222)
    {
        _1192 = _353;
    }
    float _1232 = _1192;
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1236 = _1232;
    if (!_1222)
    {
        _1048 = _1228;
    }
    float _1238 = _1048;
    float _1240 = _1238;
    if (!_1222)
    {
        _1050 = _353;
    }
    float _1242 = _1050;
    float _1244 = _1242;
    if (_1222)
    {
        _1240 = _335;
    }
    float _1246 = _1240;
    if (_1222)
    {
        _1230 = _335;
    }
    float _1248 = _1230;
    if (_1222)
    {
        _1236 = _339;
    }
    float _1250 = _1236;
    if (_1222)
    {
        _1244 = _339;
    }
    float _1252 = _1244;
    float _1254 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1190);
    bool _1256 = _1118 != 2;
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1260 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1234);
    float _1262 = -_1162;
    float _1264 = _1262 + 1.0;
    float _1266 = _335 * 2.0;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1270 = _339 * 2.0;
    float _1272 = -_1268;
    float _1274 = fma(_1120, 2.0, _1272);
    if (_1256)
    {
        _1124 = _335;
    }
    float _1276 = _1124;
    float _1278 = floor(_1270);
    float _1280 = _1276;
    if (!_1256)
    {
        _1280 = _353;
    }
    float _1282 = _1280;
    float _1284 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1286 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1288 = -_361;
    float _1290 = fma(_1284, 2.0, _1288);
    float _1292 = -_932;
    float _1294 = fma(_1286, 2.0, _1292);
    int _1296 = ~_1084;
    int _1298 = _1296 + _1152;
    int _1300 = _1298 + 1;
    float _1302 = floor(_1266);
    if (_1256)
    {
        _1106 = _339;
    }
    float _1304 = _1106;
    float _1306 = -_139;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1290);
    float _1310 = _1304;
    if (!_1256)
    {
        _1310 = _335;
    }
    float _1312 = _1310;
    int _1314 = _359 * _1300;
    int _1316 = _1314 + _772;
    bool _1318 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1320 = isnan(0.0);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1326 = _1322 || _1324;
    float _1328 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1330 = _1326 ? _1264 : 0.0;
    bool _1332 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1334 = isnan(1.0);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1340 = _1336 || _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1344 = 1.0 + _1342;
    float _1346 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1348 = fma(_1328, -2.0, _363);
    float _1350 = 1.0 / _1344;
    float _1352 = fma(_1258, -2.0, _1346);
    float _1354 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1348);
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1360 = !_700;
    int _1362 = _1360 ? _1316 : (-1);
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1366 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1356);
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1370 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1358);
    float _1372 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1364);
    float _1374 = -_139;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1274);
    float _1378 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1368);
    float _1380 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1366);
    float _1382 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1226);
    float _1384 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1370);
    float _1386 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1372);
    float _1388 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1378);
    float _1390 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1254);
    float _1392 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1260);
    float _1394 = -_139;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1294);
    float _1398 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1352);
    if (_1340)
    {
        float _1400 = _1330 * _1350;
        _143 = _1400;
    }
    float _1402 = _143;
    bool _1404 = _1302 > 0.0;
    float _1406 = in.m_58.x;
    float _1408 = in.m_58.y;
    float _1410 = in.m_58.z;
    bool _1412 = _1302 >= 0.0;
    bool _1414 = isnan(_1302);
    bool _1416 = _1412 || _1414;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    float _1422 = -_219;
    float _1424 = _1422 + 0.5;
    bool _1426 = _1278 >= 0.0;
    bool _1428 = isnan(_1278);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan(0.0);
    bool _1434 = _1430 || _1432;
    int _1436 = _1420 ? 0 : 1;
    bool _1438 = _1278 > 0.0;
    out.m_60.x = _337;
    out.m_60.y = _1424;
    int _1440 = ~_1436;
    int _1442 = _1440 + 1;
    int _1444 = _1442 + 1;
    int _1446 = _1434 ? 0 : 1;
    int _1448 = _1444;
    if (!_1404)
    {
        int _1450 = ~_1436;
        int _1452 = _1450 + 1;
        _1448 = _1452;
    }
    int _1454 = _1448;
    float _1456 = in.m_62.x;
    float _1458 = in.m_62.y;
    float _1460 = in.m_62.z;
    bool _1462 = _1012 != 3;
    bool _1464 = !_1166;
    int _1466 = _1464 ? 0 : 1;
    float _1468 = in.m_64.x;
    float _1470 = in.m_64.y;
    float _1472 = in.m_64.z;
    bool _1474 = _1164 != 3;
    int _1476 = ~_1446;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    bool _1482 = !_1462;
    int _1484 = _1482 ? 0 : (-1);
    float _1486 = _297 * _1408;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1498 = _1496 != 0;
    int _1500 = _1480;
    if (!_1438)
    {
        int _1502 = ~_1446;
        int _1504 = _1502 + 1;
        _1500 = _1504;
    }
    int _1506 = _1500;
    float _1508 = fma(_295, _1406, _1486);
    int _1510 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1512 = _1510 != 0;
    float _1514 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1516 = fma(_299, _1410, _1508);
    int _1518 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1520 = _1518 != 0;
    float _1522 = _297 * _1458;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1526 = _329 + _1524;
    float _1528 = _297 * _1470;
    float _1530 = fma(_295, _1456, _1522);
    float _1532 = _1514 * _335;
    float _1534 = _1526 * _489;
    float _1536 = fma(_295, _1468, _1528);
    float _1538 = _335 + _339;
    float _1540 = fma(_299, _1460, _1530);
    float _1542 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1544 = _329 + _1542;
    float _1546 = trunc(_1532);
    int _1548 = int(_1546);
    float _1550 = fma(_299, _1472, _1536);
    float _1552 = _1538 + (-1.0);
    float _1554 = _1544 * _532;
    float _1556 = _353 * 2.0;
    float _1558 = _335 + _353;
    float _1560 = _353 + _339;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1564 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1562;
    float _1566 = _1558 + (-1.0);
    float _1568 = floor(_1556);
    float _1570 = _1560 + (-1.0);
    float _1572 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1574 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1576 = !_1490;
    int _1578 = _1576 ? 0 : 1;
    float _1580 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1582 = _1548 << 4;
    int _1584 = _1582 + 1712;
    float _1586 = fma(_381, _1534, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1588 = 1.0 / _1564;
    bool _1590 = !_1494;
    int _1592 = _1590 ? 0 : 1;
    uint _1594 = uint(int(uint(_1584) >> uint(2)));
    uint _1596 = uint(int(uint(int(_1594)) >> uint(2)));
    int _1598 = int(_1594) & 3;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[int(_1596)][_1598];
    int _1602 = int(_1594) + 1;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    int _1606 = _1602 & 3;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[int(_1604)][_1606];
    float _1610 = float(_1454);
    float _1612 = _1540 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1614 = !_1474;
    int _1616 = _1614 ? 0 : (-1);
    float _1618 = _1550 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1620 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1622 = _1620 != 0;
    int _1624 = _1584 + 8;
    uint _1626 = uint(int(uint(_1624) >> uint(2)));
    uint _1628 = uint(int(uint(int(_1626)) >> uint(2)));
    int _1630 = int(_1626) & 3;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[int(_1628)][_1630];
    bool _1634 = _1568 >= 0.0;
    bool _1636 = isnan(_1568);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    bool _1644 = !_1498;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1656 = _347 * _1588;
    int _1658 = _1642 ? 0 : 1;
    float _1660 = fma(_1650, _1534, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1662 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1664 = isnan(_329);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1670 = _1666 || _1668;
    float _1672 = float(_1670);
    bool _1674 = _329 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1676 = isnan(_329);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1682 = _1678 || _1680;
    float _1684 = float(_1682);
    bool _1686 = _1568 > 0.0;
    float _1688 = -_1672;
    float _1690 = _1688 + 1.0;
    int _1692 = ~_397;
    int _1694 = _1692 + 1;
    float _1696 = _1684 * _1690;
    float _1698 = -_1684;
    float _1700 = _1698 + 1.0;
    int _1702 = _1694 * int(_946);
    int _1704 = _1702 + _892;
    float _1706 = -_439;
    float _1708 = _1706 + 1.0;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1710;
    float _1714 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1716 = _439 * _1700;
    float _1718 = fma(_403, _1554, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1720 = float(uint(_1704));
    float _1722 = fma(_451, _1656, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1724 = _1714 * _335;
    float _1726 = fma(_1654, _1554, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1728 = fma(_1712, _1656, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1730 = as_type<float>(_487) * _1720;
    float _1732 = _393 * _1708;
    int _1734 = abs(_1592);
    float _1736 = trunc(_1724);
    int _1738 = int(_1736);
    float _1740 = -_393;
    float _1742 = _1740 + 1.0;
    float _1744 = _1586 * _1732;
    float _1746 = _1660 * _1732;
    float _1748 = float(_1734);
    float _1750 = _1600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1752 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1754 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1744);
    float _1756 = in.m_66.x;
    float _1758 = in.m_66.y;
    float _1760 = in.m_66.z;
    float _1762 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1746);
    float _1764 = _1748 * _1610;
    float _1766 = fma(_1718, _1716, _1754);
    float _1768 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1770 = fma(_1726, _1716, _1762);
    int _1772 = _1738 << 4;
    int _1774 = _1772 + 1968;
    float _1776 = trunc(_1730);
    float _1778 = precise::max(_1776, 0.0);
    uint _1780 = uint(_1778);
    int _1782 = ~_1658;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    float _1788 = _1764 * (-2.0);
    int _1790 = _1786;
    if (!_1686)
    {
        int _1792 = ~_1658;
        int _1794 = _1792 + 1;
        _1790 = _1794;
    }
    int _1796 = _1790;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    uint _1800 = uint(int(uint(_1774) >> uint(2)));
    uint _1802 = uint(int(uint(int(_1800)) >> uint(2)));
    int _1804 = int(_1800) & 3;
    float _1806 = (*spvDescriptorSet0.vp_c9)._m0[int(_1802)][_1804];
    int _1808 = int(_1800) + 1;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    int _1812 = _1808 & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    float _1816 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1818 = _1752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = fma(_1580, _1788, _1580);
    float _1824 = fma(_1722, _1696, _1766);
    float _1826 = fma(_1728, _1696, _1770);
    float _1828 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    out.m_68.x = _1816;
    out.m_68.y = _1818;
    out.m_68.z = _1820;
    out.m_68.w = _1798;
    float _1830 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1832 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1824);
    float _1834 = fma(_1788, _1758, _1758);
    int _1836 = int(_946) + int(_1780);
    int _1838 = _1774 + 8;
    uint _1840 = uint(int(uint(_1838) >> uint(2)));
    uint _1842 = uint(int(uint(int(_1840)) >> uint(2)));
    int _1844 = int(_1840) & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    float _1848 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1826);
    int _1850 = abs(_1466);
    int _1852 = ~_397;
    int _1854 = _1852 + 1;
    float _1856 = _339 + (-0.5);
    int _1858 = abs(_1578);
    float _1860 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1834);
    int _1862 = abs(_1646);
    float _1864 = in.m_54.x;
    float _1866 = in.m_54.y;
    float _1868 = float(_1506);
    int _1870 = _1854 * _1836;
    int _1872 = _1870 + _892;
    float _1874 = float(_1796);
    float _1876 = fma(_1822, _1402, _1860);
    float _1878 = float(_1858);
    float _1880 = float(_1862);
    float _1882 = _1876 * 0.15915493667125701904296875;
    bool _1884 = uint(_1872) >= uint(_397);
    float _1886 = _1878 * _1874;
    float _1888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _1890 = _1880 * _1868;
    bool _1892 = !_1884;
    int _1894 = _1892 ? 0 : (-1);
    float _1896 = _1886 * (-2.0);
    bool _1898 = _335 > 0.5;
    float _1900 = _1890 * (-2.0);
    float _1902 = _335 + (-0.5);
    float _1904 = fma(_1896, _1756, _1756);
    float _1906 = fma(_1572, _1896, _1572);
    float _1908 = fma(_1900, _1760, _1760);
    float _1910 = fma(_1574, _1900, _1574);
    float _1912 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1904);
    float _1914 = _353 + (-0.5);
    float _1916 = _1832 * _1864;
    float _1918 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1920 = _562 + 0.5;
    float _1922 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1908);
    float _1924 = fma(_1906, _1402, _1912);
    float _1926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1928 = fma(_1918, _1920, _1308);
    float _1930 = fma(_1910, _1402, _1922);
    int _1932 = _996 >> 31;
    float _1934 = _1924 * 0.15915493667125701904296875;
    float _1936 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1938 = _1814 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1940 = _1932 & 3;
    float _1942 = _1934 * 6.283185482025146484375;
    float _1944 = sin(_1942);
    float _1946 = _1930 * 0.15915493667125701904296875;
    float _1948 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1950 = _996 + _1940;
    float _1952 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1954 = _1138 >> 31;
    float _1956 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1958 = _1882 * 6.283185482025146484375;
    float _1960 = sin(_1958);
    float _1962 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1964 = _1954 & 3;
    float _1966 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1970 = _538 + (-0.5);
    int _1972 = _1138 + _1964;
    float _1974 = _1916 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1976 = _1882 * 6.283185482025146484375;
    float _1978 = cos(_1976);
    out.m_70.x = _1962;
    out.m_70.y = _1952;
    out.m_70.z = _1966;
    out.m_70.w = _1956;
    int _1980 = _1972 >> 2;
    float _1982 = -_1968;
    float _1984 = -_1354;
    float _1986 = fma(_1982, _1970, _1984);
    float _1988 = _1974 * _1888;
    float _1990 = _1848 * _1866;
    int _1992 = _1980 << 4;
    int _1994 = _1992 + 512;
    float _1996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _1998 = _1934 * 6.283185482025146484375;
    float _2000 = cos(_1998);
    int _2002 = _1950 >> 2;
    float _2004 = _1990 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _2006 = ~_1836;
    int _2008 = _2006 + _1894;
    int _2010 = _2008 + 1;
    int _2012 = _2002 << 4;
    int _2014 = _2012 + 368;
    float _2016 = _2004 * _1996;
    float _2018 = _1944 * _1960;
    float _2020 = _1946 * 6.283185482025146484375;
    float _2022 = cos(_2020);
    uint _2024 = uint(int(uint(_2014) >> uint(2)));
    uint _2026 = uint(int(uint(int(_2024)) >> uint(2)));
    int _2028 = int(_2024) & 3;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[int(_2026)][_2028];
    int _2032 = int(_2024) + 1;
    uint _2034 = uint(int(uint(_2032) >> uint(2)));
    int _2036 = _2032 & 3;
    float _2038 = (*spvDescriptorSet0.vp_c9)._m0[int(_2034)][_2036];
    float _2040 = _1944 * _1978;
    int _2042 = _397 * _2010;
    int _2044 = _2042 + _892;
    float _2046 = _1946 * 6.283185482025146484375;
    float _2048 = sin(_2046);
    float _2050 = _2000 * _1978;
    float _2052 = _2000 * _1960;
    float _2054 = _2000 * _2022;
    float _2056 = _1944 * _2022;
    float _2058 = _1960 * _2022;
    float _2060 = _1978 * _2022;
    float _2062 = _2054 * _2016;
    float _2064 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2066 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2068 = _2054 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2070 = fma(_2048, _2050, _2018);
    float _2072 = fma(_2048, _2018, _2050);
    float _2074 = -_2052;
    float _2076 = fma(_2048, _2040, _2074);
    uint _2078 = uint(int(uint(_1994) >> uint(2)));
    uint _2080 = uint(int(uint(int(_2078)) >> uint(2)));
    int _2082 = int(_2078) & 3;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[int(_2080)][_2082];
    int _2086 = int(_2078) + 1;
    uint _2088 = uint(int(uint(_2086) >> uint(2)));
    int _2090 = _2086 & 3;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[int(_2088)][_2090];
    float _2094 = -_2040;
    float _2096 = fma(_2048, _2052, _2094);
    float _2098 = -_2016;
    float _2100 = _2048 * _2098;
    float _2102 = _2056 * _2016;
    float _2104 = fma(_2070, _1988, _2062);
    float _2106 = -_2048;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2064);
    float _2110 = fma(_2060, _1988, _2100);
    float _2112 = -_2048;
    float _2114 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2066);
    int _2116 = _1994 + 8;
    uint _2118 = uint(int(uint(_2116) >> uint(2)));
    uint _2120 = uint(int(uint(int(_2118)) >> uint(2)));
    int _2122 = int(_2118) & 3;
    float _2124 = (*spvDescriptorSet0.vp_c9)._m0[int(_2120)][_2122];
    int _2126 = int(_2118) + 1;
    uint _2128 = uint(int(uint(_2126) >> uint(2)));
    int _2130 = _2126 & 3;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[int(_2128)][_2130];
    float _2134 = -_2048;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2068);
    float _2138 = fma(_2076, _1988, _2102);
    float _2140 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2142 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2144 = _2070 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2146 = abs(_1034);
    float _2148 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2140);
    int _2150 = _2014 + 8;
    uint _2152 = uint(int(uint(_2150) >> uint(2)));
    uint _2154 = uint(int(uint(int(_2152)) >> uint(2)));
    int _2156 = int(_2152) & 3;
    float _2158 = (*spvDescriptorSet0.vp_c9)._m0[int(_2154)][_2156];
    int _2160 = int(_2152) + 1;
    uint _2162 = uint(int(uint(_2160) >> uint(2)));
    int _2164 = _2160 & 3;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[int(_2162)][_2164];
    float _2168 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2142);
    float _2170 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2144);
    float _2172 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2108);
    int _2174 = ~_1186;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2114);
    float _2182 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2136);
    float _2184 = fma(_2096, _1828, _2104);
    int _2186 = ~_2146;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = _2178 * as_type<int>(_2038);
    float _2194 = fma(_2058, _1828, _2110);
    float _2196 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2198 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2200 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2202 = ~_1202;
    int _2204 = _2202 + 1;
    int _2206 = _2204 + 1;
    int _2208 = _2190 * as_type<int>(_2030);
    int _2210 = _2208 + _2192;
    float _2212 = fma(_2072, _1828, _2138);
    int _2214 = abs(_1220);
    float _2216 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2196);
    int _2218 = ~_1850;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2226 = int(_2224);
    int _2228 = ~_2214;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2198);
    int _2236 = abs(_1130);
    float _2238 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2200);
    int _2240 = abs(_1484);
    float _2242 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2244 = ~_2236;
    int _2246 = _2244 + 1;
    int _2248 = _2246 + 1;
    float _2250 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2216);
    int _2252 = _2206 * as_type<int>(_2092);
    int _2254 = ~_2240;
    int _2256 = _2254 + 1;
    int _2258 = _2256 + 1;
    float _2260 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2262 = int(_2260);
    int _2264 = abs(_1142);
    int _2266 = _2222 * as_type<int>(_2084);
    int _2268 = _2266 + _2252;
    float _2270 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2242);
    float _2272 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2234);
    float _2274 = float(uint(_2226));
    int _2276 = _2232 * as_type<int>(_2124);
    int _2278 = _2276 + _2268;
    int _2280 = abs(_1616);
    float _2282 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2270);
    int _2284 = ~_2226;
    int _2286 = _2284 + 1;
    float _2288 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    int _2290 = ~_2280;
    int _2292 = _2290 + 1;
    int _2294 = _2292 + 1;
    float _2296 = 1.0 / _2274;
    float _2298 = _2282 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2300 = _2248 * as_type<int>(_2158);
    int _2302 = _2300 + _2210;
    float _2304 = float(uint(_2262));
    int _2306 = _2294 * as_type<int>(_2132);
    int _2308 = _2306 + _2278;
    int _2310 = ~_1188;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = _2258 * as_type<int>(_2166);
    int _2318 = _2316 + _2302;
    int _2320 = ~_2264;
    int _2322 = _2320 + 1;
    int _2324 = _2322 + 1;
    float _2326 = 1.0 / _2304;
    bool _2328 = !_824;
    int _2330 = _2328 ? _2044 : (-1);
    int _2332 = _2308 * _2314;
    int _2334 = abs(_2262);
    int _2336 = _2318 * _2324;
    int _2338 = abs(_2226);
    int _2340 = _2330 * _1188;
    int _2342 = _2340 + _2332;
    float _2344 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2346 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2348 = _1362 * _2264;
    int _2350 = _2348 + _2336;
    float _2352 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2344);
    float _2354 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2346);
    float _2356 = float(uint(_2334));
    float _2358 = _1516 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2360 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2352);
    float _2362 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2354);
    int _2364 = as_type<int>(_2326) + (-2);
    float _2366 = _1618 + _2298;
    float _2368 = float(uint(_2350));
    float _2370 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2372 = float(uint(_2338));
    float _2374 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2376 = 1.0 / _2356;
    float _2378 = as_type<float>(_2364) * _2368;
    int _2380 = as_type<int>(_2296) + (-2);
    float _2382 = _1612 + _2370;
    float _2384 = float(uint(_2342));
    float _2386 = _2358 + _2374;
    int _2388 = abs(_2342);
    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2392 = _2382 + _2390;
    float _2394 = 1.0 / _2372;
    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2398 = _2386 + _2396;
    float _2400 = as_type<float>(_2380) * _2384;
    float _2402 = _2392 * _2392;
    int _2404 = ~_2262;
    int _2406 = _2404 + 1;
    float _2408 = _2398 * _2398;
    float _2410 = float(uint(_2388));
    float _2412 = trunc(_2378);
    float _2414 = precise::max(_2412, 0.0);
    uint _2416 = uint(_2414);
    float _2418 = _2402 + _2408;
    int _2420 = as_type<int>(_2376) + (-2);
    float _2422 = trunc(_2400);
    float _2424 = precise::max(_2422, 0.0);
    uint _2426 = uint(_2424);
    int _2428 = abs(_2350);
    int _2430 = as_type<int>(_2394) + (-2);
    float _2432 = float(uint(_2428));
    float _2434 = sqrt(_2418);
    int _2436 = _2406 * int(_2416);
    int _2438 = _2436 + _2350;
    float _2440 = as_type<float>(_2420) * _2432;
    float _2442 = as_type<float>(_2430) * _2410;
    float _2444 = float(uint(_2438));
    float _2446 = trunc(_2440);
    float _2448 = precise::max(_2446, 0.0);
    uint _2450 = uint(_2448);
    int _2452 = _2286 * int(_2426);
    int _2454 = _2452 + _2342;
    float _2456 = as_type<float>(_2364) * _2444;
    int _2458 = ~_2334;
    int _2460 = _2458 + 1;
    float _2462 = float(uint(_2454));
    float _2464 = trunc(_2442);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    bool _2470 = _2434 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2472 = as_type<float>(_2380) * _2462;
    int _2474 = ~_2338;
    int _2476 = _2474 + 1;
    float _2478 = trunc(_2456);
    float _2480 = precise::max(_2478, 0.0);
    uint _2482 = uint(_2480);
    int _2484 = _2460 * int(_2450);
    int _2486 = _2484 + _2428;
    float _2488 = _2072;
    float _2490 = _2402;
    float _2492 = _2408;
    float _2494 = _2382;
    float _2496 = _2386;
    if (!_2470)
    {
        _2488 = _2402;
    }
    float _2498 = _2488;
    int _2500 = _2476 * int(_2468);
    int _2502 = _2500 + _2388;
    float _2504 = float(uint(_2486));
    float _2506 = _2498;
    if (!_2470)
    {
        _2490 = _2366;
    }
    float _2508 = _2490;
    float _2510 = float(uint(_2502));
    bool _2512 = !_2470;
    float _2514 = _2508;
    if (!_2512)
    {
        float _2516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2520 = _2434 + _2518;
        float _2522 = rsqrt(_2418);
        float _2524 = _2520 * _2516;
        float _2526 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2528 = _2524 * 0.15915493667125701904296875;
        float _2530 = _2528 * 6.283185482025146484375;
        float _2532 = sin(_2530);
        float _2534 = _2528 * 6.283185482025146484375;
        float _2536 = cos(_2534);
        float _2538 = fma(_2532, _2526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2540 = _2522 * _2538;
        float _2542 = _2536 + (-1.0);
        float _2544 = fma(_2392, _2540, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2546 = fma(_2398, _2540, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2548 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2552 = _2544 + _2550;
        float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2556 = _2546 + _2554;
        float _2558 = fma(_2366, _2536, _2548);
        float _2560 = _2552 * _2552;
        float _2562 = _2556 * _2556;
        _2514 = _2558;
        _2506 = _2560;
        _2492 = _2562;
        _2494 = _2544;
        _2496 = _2546;
    }
    float _2564 = _2514;
    float _2566 = _2506;
    float _2568 = _2492;
    float _2570 = _2494;
    float _2572 = _2496;
    float _2574 = as_type<float>(_2430) * _2510;
    float _2576 = as_type<float>(_2420) * _2504;
    float _2578 = trunc(_2472);
    float _2580 = precise::max(_2578, 0.0);
    uint _2582 = uint(_2580);
    bool _2584 = _339 > 0.5;
    float _2586 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2148);
    float _2588 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2168);
    float _2590 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2170);
    float _2592 = -_219;
    int _2594 = _2584 ? as_type<int>(_2592) : as_type<int>(_219);
    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2598 = _2564 + _2596;
    bool _2600 = _353 > 0.5;
    float _2602 = trunc(_2576);
    float _2604 = precise::max(_2602, 0.0);
    uint _2606 = uint(_2604);
    float _2608 = -_215;
    int _2610 = _1898 ? as_type<int>(_2608) : as_type<int>(_215);
    float _2612 = fma(_2598, _2598, _2566);
    float _2614 = -_215;
    int _2616 = _2600 ? as_type<int>(_2614) : as_type<int>(_215);
    float _2618 = -_1390;
    float _2620 = _2618 + 1.0;
    bool _2622 = !_1512;
    float _2624 = _2622 ? _219 : as_type<float>(_2594);
    float _2626 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2628 = int(_2416) + int(_2482);
    float _2630 = trunc(_2574);
    float _2632 = precise::max(_2630, 0.0);
    uint _2634 = uint(_2632);
    int _2636 = ~_2262;
    int _2638 = _2636 + 1;
    float _2640 = _2626 * _2172;
    bool _2642 = !_1622;
    float _2644 = _2642 ? _215 : as_type<float>(_2616);
    float _2646 = _2626 * _2180;
    bool _2648 = !_1520;
    float _2650 = _2648 ? _215 : as_type<float>(_2610);
    float _2652 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2654 = _2626 * _2182;
    int _2656 = int(_2426) + int(_2582);
    int _2658 = _2638 * _2628;
    int _2660 = _2658 + _2350;
    int _2662 = ~_2226;
    int _2664 = _2662 + 1;
    float _2666 = fma(_2652, _2586, _2640);
    float _2668 = fma(_2652, _2588, _2646);
    float _2670 = fma(_2652, _2590, _2654);
    int _2672 = int(_2450) + int(_2606);
    int _2674 = _2664 * _2656;
    int _2676 = _2674 + _2342;
    int _2678 = ~_2334;
    int _2680 = _2678 + 1;
    float _2682 = _2612 + _2568;
    int _2684 = ~_2338;
    int _2686 = _2684 + 1;
    float _2688 = -_1384;
    float _2690 = _2688 + 1.0;
    int _2692 = int(_2468) + int(_2634);
    int _2694 = _2680 * _2672;
    int _2696 = _2694 + _2428;
    bool _2698 = uint(_2660) >= uint(_2262);
    float _2700 = sqrt(_2682);
    bool _2702 = uint(_2676) >= uint(_2226);
    int _2704 = _2686 * _2692;
    int _2706 = _2704 + _2388;
    bool _2708 = !_2698;
    int _2710 = _2708 ? 0 : (-1);
    float _2712 = -_1386;
    float _2714 = _2712 + 1.0;
    bool _2716 = uint(_2696) >= uint(_2334);
    float _2718 = -_2690;
    float _2720 = fma(_562, _2718, _1928);
    bool _2722 = !_2702;
    int _2724 = _2722 ? 0 : (-1);
    float _2726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2728 = uint(_2706) >= uint(_2338);
    out.m_72.x = _2586;
    out.m_72.y = _2588;
    out.m_72.z = _2590;
    int _2730 = ~_2628;
    int _2732 = _2730 + _2710;
    int _2734 = _2732 + 1;
    int _2736 = _2350 ^ _2262;
    int _2738 = ~_2656;
    int _2740 = _2738 + _2724;
    int _2742 = _2740 + 1;
    int _2744 = _2262 * _2734;
    int _2746 = _2744 + _2350;
    bool _2748 = !_2716;
    int _2750 = _2748 ? 0 : (-1);
    float _2752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2754 = uint(int(uint(_2736) >> uint(31)));
    int _2756 = _2226 * _2742;
    int _2758 = _2756 + _2342;
    bool _2760 = _2262 == 0;
    bool _2762 = _2262 == 0;
    int _2764 = ~_2750;
    int _2766 = _2672 + _2764;
    int _2768 = _2766 + 1;
    float _2770 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2772 = ~int(_2754);
    int _2774 = _2772 + 1;
    int _2776 = _2342 ^ _2226;
    bool _2778 = !_2760;
    int _2780 = _2778 ? _2746 : (-1);
    int _2782 = _2768 ^ _2774;
    float _2784 = _2752 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2786 = _2226 == 0;
    bool _2788 = !_2728;
    int _2790 = _2788 ? 0 : (-1);
    uint _2792 = uint(int(uint(_2776) >> uint(31)));
    float _2794 = _2726 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2796 = _2226 == 0;
    float _2798 = float(_2780);
    int _2800 = ~_2774;
    int _2802 = _2800 + _2782;
    int _2804 = _2802 + 1;
    int _2806 = ~_2790;
    int _2808 = _2692 + _2806;
    int _2810 = _2808 + 1;
    float _2812 = fma(_2794, _2798, _1376);
    int _2814 = ~int(_2792);
    int _2816 = _2814 + 1;
    float _2818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2820 = !_2786;
    int _2822 = _2820 ? _2758 : (-1);
    float _2824 = fma(_2626, _2626, 1.0);
    int _2826 = _2810 ^ _2816;
    float _2828 = float(_2822);
    float _2830 = _2650 + 0.5;
    int _2832 = ~_2816;
    int _2834 = _2832 + _2826;
    int _2836 = _2834 + 1;
    float _2838 = rsqrt(_2824);
    bool _2840 = _2700 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2842 = isnan(_2700);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2848 = _2844 || _2846;
    float _2850 = fma(_2784, _2828, _1396);
    bool _2852 = !_2762;
    int _2854 = _2852 ? _2804 : (-1);
    float _2856 = fma(_2794, _2830, _2812);
    bool _2858 = !_2796;
    int _2860 = _2858 ? _2836 : (-1);
    float _2862 = _2644 + 0.5;
    float _2864 = float(_2854);
    float _2866 = _2770 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2868 = float(_2860);
    float _2870 = _2818 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2872 = fma(_2784, _2862, _2850);
    float _2874 = -_1382;
    float _2876 = fma(_2866, _2864, _2874);
    float _2878 = _2624 + (-0.5);
    float _2880 = -_1398;
    float _2882 = fma(_2870, _2868, _2880);
    float _2884 = _624 + (-0.5);
    float _2886 = _2288 + _2670;
    float _2888 = -_2866;
    float _2890 = fma(_2888, _2878, _2876);
    float _2892 = _2626 * _2838;
    float _2894 = -_2870;
    float _2896 = fma(_2894, _2884, _2882);
    float _2898 = -_1388;
    float _2900 = _2898 + 1.0;
    float _2902 = -_2272;
    float _2904 = _2892 * _2902;
    float _2906 = -_2250;
    float _2908 = _2892 * _2906;
    float _2910 = -_2288;
    float _2912 = _2892 * _2910;
    float _2914 = fma(_538, _2900, _1986);
    float _2916 = fma(_2838, _2180, _2904);
    float _2918 = -_1380;
    float _2920 = _2918 + 1.0;
    float _2922 = -_1392;
    float _2924 = _2922 + 1.0;
    float _2926 = fma(_2838, _2172, _2908);
    float _2928 = fma(_2838, _2182, _2912);
    float _2930 = -_2920;
    float _2932 = fma(_2650, _2930, _2856);
    float _2934 = -_2620;
    float _2936 = fma(_2644, _2934, _2872);
    float _2938 = _2250 + _2666;
    float _2940 = _2272 + _2668;
    float _2942 = fma(_2624, _2714, _2890);
    float _2944 = fma(_624, _2924, _2896);
    out.m_74.x = _2720;
    out.m_74.y = _2914;
    float _2946 = _2890;
    float _2948 = _2590;
    if (!_2848)
    {
        _2946 = 1.0;
    }
    float _2950 = _2946;
    out.m_76.x = _2938;
    out.m_76.y = _2940;
    out.m_76.z = _2886;
    out.m_78.x = _2926;
    out.m_78.y = _2916;
    out.m_78.z = _2928;
    out.m_80.x = _2932;
    out.m_80.y = _2942;
    out.m_80.z = _2936;
    out.m_80.w = _2944;
    bool _2952 = !_2848;
    float _2954 = _2950;
    if (!_2952)
    {
        bool _2956 = _2700 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2958 = isnan(_2700);
        bool _2960 = _2956 || _2958;
        bool _2962 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2964 = _2960 || _2962;
        if (!_2964)
        {
            float _2966 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2968 = _2700 + _2966;
            float _2970 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2972 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2970;
            float _2974 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2976 = _2974 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2978 = 1.0 / _2972;
            float _2980 = _2968 * _2978;
            float _2982 = fma(_2980, _2976, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2954 = _2982;
            _2984 = true;
        }
        else
        {
            bool _2986 = _2700 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2988 = isnan(_2700);
            bool _2990 = _2986 || _2988;
            bool _2992 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2994 = _2990 || _2992;
            if (!_2994)
            {
                float _2996 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2998 = _2700 + _2996;
                float _3000 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3002 = _3000 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3004 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3006 = _3004 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3008 = 1.0 / _3002;
                float _3010 = _2998 * _3008;
                float _3012 = fma(_3010, _3006, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2954 = _3012;
                _2984 = true;
            }
            else
            {
                _2954 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2984 = false;
    float _3014 = _2954;
    float _3016 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3018 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3020 = _2570 + _3018;
    float _3022 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3024 = _2564 + _3022;
    float _3026 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3016);
    float _3028 = _1618 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3030 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3032 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3034 = _3030 || _3032;
    bool _3036 = isnan(0.5);
    bool _3038 = _3034 || _3036;
    float _3040 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3042 = _2572 + _3040;
    float _3044 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3026);
    float _3046 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3028);
    float _3048 = fma(_3020, _3014, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3050 = fma(_3024, _3014, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3052 = _3044 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3054 = fma(_2358, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3046);
    float _3056 = fma(_3042, _3014, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3058 = 1.0 / _3052;
    float _3060 = _3054 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _3062 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3066 = _3062 || _3064;
    bool _3068 = isnan(0.5);
    bool _3070 = _3066 || _3068;
    float _3072 = _3060 + _3052;
    float _3074 = _3060;
    float _3076 = _3028;
    float _3078 = _3044;
    float _3080 = _3052;
    if (_3038)
    {
        _3074 = _3048;
    }
    float _3082 = _3074;
    float _3084 = _3082;
    if (_3038)
    {
        _3076 = _3050;
    }
    float _3086 = _3076;
    float _3088 = _3086;
    if (_3038)
    {
        _3078 = _3056;
    }
    float _3090 = _3078;
    float _3092 = _3090;
    float _3094 = _3058;
    if (!_3038)
    {
        float _3096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3098 = _1618 + _3096;
        float _3100 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3102 = _1612 + _3100;
        float _3104 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3106 = _3098 * _3098;
        float _3108 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3110 = _2358 + _3108;
        float _3112 = fma(_3102, _3102, _3106);
        float _3114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3116 = fma(_3110, _3110, _3112);
        float _3118 = sqrt(_3116);
        float _3120 = _3104 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3122 = -_1618;
        float _3124 = _3122 + _3050;
        float _3126 = precise::min(_3118, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3128 = _3126 * _3114;
        float _3130 = -_1612;
        float _3132 = _3130 + _3048;
        float _3134 = -_2358;
        float _3136 = _3134 + _3056;
        float _3138 = _3120 * _3128;
        float _3140 = fma(_3132, _3138, _1612);
        float _3142 = fma(_3124, _3138, _1618);
        float _3144 = fma(_3136, _3138, _2358);
        _3088 = _3142;
        _3084 = _3140;
        _3092 = _3144;
        _3080 = _3138;
    }
    float _3146 = _3088;
    float _3148 = _3084;
    float _3150 = _3092;
    float _3152 = _3080;
    float _3154 = _3152;
    if (_3070)
    {
        _3154 = 1.0;
    }
    float _3156 = _3154;
    float _3158 = _3072 * _3058;
    float _3160 = _3158 * 0.5;
    float _3162 = _3156;
    float _3164 = _3160;
    if (!_3070)
    {
        float _3166 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3168 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3170 = fma(_3160, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3168);
        float _3172 = _3166 * 0.15915493667125701904296875;
        float _3174 = _3172 * 6.283185482025146484375;
        float _3176 = cos(_3174);
        float _3178 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3180 = _3178 * 0.15915493667125701904296875;
        float _3182 = _3172 * 6.283185482025146484375;
        float _3184 = sin(_3182);
        float _3186 = 1.0 / _3176;
        float _3188 = _3180 * 6.283185482025146484375;
        float _3190 = cos(_3188);
        float _3192 = _3184 * _3186;
        float _3194 = 1.0 / _3170;
        float _3196 = _3190 * _3192;
        float _3198 = _3180 * 6.283185482025146484375;
        float _3200 = sin(_3198);
        float _3202 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3204 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3202;
        float _3206 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3208 = _3194 * _3206;
        float _3210 = 1.0 / _3196;
        float _3212 = 1.0 / _3204;
        float _3214 = _3200 * _3210;
        float _3216 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3218 = fma(_3214, _3208, _3216);
        float _3220 = _3218 * _3212;
        float _3222 = precise::clamp(_3220, 0.0, 1.0);
        float _3224 = -_3222;
        float _3226 = _3224 + 1.0;
        _3094 = _3210;
        _3162 = _3226;
    }
    float _3228 = _3094;
    float _3230 = _3162;
    float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3234 = _3146 + _3232;
    float _3236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3238 = _3148 + _3236;
    float _3240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3242 = _3150 + _3240;
    float _3244 = _3234 * _3234;
    float _3246 = fma(_3238, _3238, _3244);
    float _3248 = fma(_3242, _3242, _3246);
    float _3250 = rsqrt(_3248);
    float _3252 = sqrt(_3248);
    float _3254 = _3250 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3256 = _3238 * _3254;
    float _3258 = _3242 * _3254;
    float _3260 = _3256 * _3256;
    float _3262 = _3258 * _3258;
    float _3264 = _3260 + _3262;
    float _3266 = sqrt(_3264);
    bool _3268 = _3266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3272 = _3266 + _3270;
    float _3274 = _3250;
    float _3276 = _3272;
    float _3278 = _3234;
    float _3280 = _3256;
    if (_3268)
    {
        float _3282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3274 = _3282;
    }
    float _3284 = _3274;
    float _3286 = _3284;
    if (_3268)
    {
        float _3288 = _3272 * _3284;
        _3276 = _3288;
    }
    float _3290 = _3276;
    if (_3268)
    {
        float _3292 = rsqrt(_3264);
        _3286 = _3292;
    }
    float _3294 = _3286;
    float _3296 = _3294;
    if (_3268)
    {
        float _3298 = _3290 * 0.15915493667125701904296875;
        _3164 = _3298;
    }
    float _3300 = _3164;
    float _3302 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3304 = _3242;
    float _3306 = _3300;
    if (_3268)
    {
        float _3308 = _3300 * 6.283185482025146484375;
        float _3310 = sin(_3308);
        _3304 = _3310;
    }
    float _3312 = _3304;
    float _3314 = precise::max(0.0, _3302);
    float _3316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3318 = _3228;
    float _3320 = _3314;
    if (_3268)
    {
        float _3322 = _3300 * 6.283185482025146484375;
        float _3324 = cos(_3322);
        _3318 = _3324;
    }
    float _3326 = _3318;
    float _3328 = -_3254;
    float _3330 = -_3314;
    float _3332 = fma(_3234, _3328, _3330);
    if (_3268)
    {
        float _3334 = _3332 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3278 = _3334;
    }
    float _3336 = _3278;
    float _3338 = _3312;
    float _3340 = _3336;
    if (_3268)
    {
        float _3342 = fma(_3312, _3336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3338 = _3342;
    }
    float _3344 = _3338;
    float _3346 = _3344;
    if (!_3268)
    {
        _3340 = _3262;
    }
    float _3348 = _3340;
    float _3350 = _3348;
    if (_3268)
    {
        float _3352 = _3294 * _3344;
        _2948 = _3352;
    }
    float _3354 = _2948;
    if (!_3268)
    {
        _3296 = _3332;
    }
    float _3356 = _3296;
    float _3358 = _3356;
    if (_3268)
    {
        float _3360 = _3326 + (-1.0);
        _3320 = _3360;
    }
    float _3362 = _3320;
    float _3364 = _3362;
    if (_3268)
    {
        float _3366 = _3256 * _3354;
        _3280 = _3366;
    }
    float _3368 = _3280;
    if (!_3268)
    {
        _3346 = _3258;
    }
    float _3370 = _3346;
    float _3372 = _3370;
    if (_3268)
    {
        float _3374 = _3258 * _3354;
        _3372 = _3374;
    }
    float _3376 = _3372;
    if (_3268)
    {
        float _3378 = _3362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3306 = _3378;
    }
    float _3380 = _3306;
    if (!_3268)
    {
        _3364 = _3260;
    }
    float _3382 = _3364;
    float _3384 = _3382;
    if (_3268)
    {
        float _3386 = _3368 * _3368;
        _3384 = _3386;
    }
    float _3388 = _3384;
    if (_3268)
    {
        float _3390 = _3376 * _3376;
        _3350 = _3390;
    }
    float _3392 = _3350;
    if (_3268)
    {
        float _3394 = fma(_3332, _3326, _3380);
        _3358 = _3394;
    }
    float _3396 = _3358;
    float _3398 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3400 = fma(_3396, _3396, _3388);
    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3404 = fma(_3252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3402);
    float _3406 = precise::clamp(_3404, 0.0, 1.0);
    float _3408 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3398);
    float _3410 = _3400 + _3392;
    float _3412 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3414 = -_3406;
    float _3416 = _3414 + 1.0;
    float _3418 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3408);
    float _3420 = rsqrt(_3410);
    float _3422 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3412);
    float _3424 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3426 = _3418 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3428 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3422);
    float _3430 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3424);
    float _3432 = _3146 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3434 = _3428 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3436 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3430);
    float _3438 = abs(_3416);
    float _3440 = log2(_3438);
    float _3442 = fma(_3148, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3432);
    float _3444 = _3434 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3446 = _3436 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3448 = fma(_3150, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3442);
    float _3450 = _3420 * _3368;
    float _3452 = -_3444;
    float _3454 = fma(_3452, _3316, 1.0);
    float _3456 = _3420 * _3396;
    float _3458 = _3448 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3460 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3462 = _3450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3464 = _3420 * _3376;
    float _3466 = log2(_3454);
    float _3468 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3460);
    float _3470 = -_3462;
    float _3472 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3470);
    float _3474 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3476 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3478 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3468);
    float _3480 = -_3464;
    float _3482 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3472);
    float _3484 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3486 = exp2(_3474);
    float _3488 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3478);
    float _3490 = fma(_3482, -0.5, 0.5);
    float _3492 = fma(_3482, 0.5, 0.5);
    float _3494 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3484);
    float _3496 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3476);
    float _3498 = _3456 + 1.0;
    float _3500 = fma(_3492, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3502 = 1.0 / _3488;
    float _3504 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3494);
    float _3506 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3496);
    float _3508 = _3466 * 0.693147182464599609375;
    float _3510 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3504);
    float _3512 = _3508 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3514 = sqrt(_3490);
    float _3516 = -_3456;
    float _3518 = fma(_3486, _3498, _3516);
    float _3520 = fma(_3492, _3500, -0.212114393711090087890625);
    float _3522 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3506);
    float _3524 = fma(_3518, 0.5, 0.5);
    float _3526 = fma(_3492, _3520, 1.570728778839111328125);
    float _3528 = _3510 * _3502;
    float _3530 = _3522 * _3502;
    float _3532 = fma(_3528, 0.5, 0.5);
    float _3534 = fma(_3530, -0.5, 0.5);
    float _3536 = _3514 * 0.636619746685028076171875;
    float3 _8838 = float3(_3532, _3534, _3512);
    float _3538 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8838, float3(0.0), isnan(_8838)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8838, float3(0.0), isnan(_8838)), level(0.0)).x;
    float3 _8849 = float3(_3532, _3534, _3512);
    float4 _3541 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8849, float3(0.0), isnan(_8849)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8849, float3(0.0), isnan(_8849)), level(0.0)).xyzw;
    float _3543 = _3541.x;
    float _3545 = _3541.y;
    float _3547 = _3541.z;
    float _3549 = _3541.w;
    float _3551 = -_3526;
    float _3553 = fma(_3536, _3551, 1.0);
    float2 _8871 = float2(_3553, _3524);
    float3 _3557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8871, float2(0.0), isnan(_8871)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8871, float2(0.0), isnan(_8871)), level(0.0)).xyz;
    float _3559 = _3557.x;
    float _3561 = _3557.y;
    float _3563 = _3557.z;
    float _3565 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3567 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3569 = _3230 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3571 = _3488 * 0.5;
    bool _3573 = _3230 > 0.0;
    bool _3575 = isnan(_3230);
    bool _3577 = _3573 || _3575;
    bool _3579 = isnan(0.0);
    bool _3581 = _3577 || _3579;
    float _3583 = fma(_3458, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3567);
    float _3585 = exp2(_3565);
    float _3587 = _3510 + _3488;
    out.m_82.x = _3148;
    out.m_82.y = _3146;
    out.m_82.z = _3150;
    float _3589 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3583);
    float _3591 = fma(_3522, -0.5, _3571);
    float _3593 = _3587 * 0.5;
    float _3595 = fma(_3426, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3589);
    float _3597 = _3595 + _3488;
    out.gl_Position.x = _3510;
    out.gl_Position.y = _3522;
    out.gl_Position.z = _3595;
    out.gl_Position.w = _3488;
    float _3599 = _3597 * 0.5;
    float _3601 = -_3585;
    float _3603 = _3601 + 1.0;
    float _3605 = _3569 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3607 = _3603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3593;
    out.m_84.y = _3591;
    out.m_84.z = _3599;
    out.m_84.w = _3488;
    float _3609 = -_3607;
    float _3611 = _3609 + 1.0;
    out.m_47.x = _3605;
    float _3613 = _3607 * _3538;
    float _3615 = _3549 * _3613;
    float _3617 = _3549 * _3611;
    float _3619 = _3563 * _3613;
    float _3621 = fma(_3559, _3615, _3543);
    float _3623 = fma(_3561, _3615, _3545);
    float _3625 = fma(_3549, _3619, _3547);
    out.m_86.x = _3621;
    out.m_86.y = _3623;
    out.m_86.z = _3625;
    out.m_86.w = _3617;
    if (_3581)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3627 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3627;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

