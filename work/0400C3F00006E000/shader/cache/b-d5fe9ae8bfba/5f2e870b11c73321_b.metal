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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _535 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_99);
        out.gl_Position.z = _2820;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2889 = as_type<float>(_135);
        out.gl_Position.z = _2889;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = _141 * _139;
    float _161 = 0.0;
    float _163 = _143;
    if (!_153)
    {
        float _165 = _143 * _143;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _173 = _169;
    if (!_153)
    {
        float _175 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    float _179 = in.m_47.x;
    float _181 = in.m_47.y;
    float _183 = in.m_47.z;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = floor(_171);
    float _189 = _185 * 0.15915493667125701904296875;
    float _191 = _189 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = -_187;
    float _197 = _171 + _195;
    bool _199 = !_153;
    float _201 = _177;
    float _203 = _181;
    if (!_199)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _143 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _143);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _233;
    }
    float _235 = _201;
    bool _237 = !_153;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _143 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _163 = _257;
    }
    float _259 = _163;
    float _261 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = in.m_51.w;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _261 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _269 = in.m_42.x;
    float _271 = in.m_42.y;
    float _273 = in.m_42.z;
    float _275 = _261 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _277 = _261 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _279 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[8].x, _267);
    bool _281 = _197 < 0.5;
    float _283 = float(_281);
    float _285 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[8].y, _275);
    float _287 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[8].z, _277);
    float _289 = fma(_193, 0.5, 0.5);
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _293 = -_197;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_283;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_289;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[10].x, _279);
    float _307 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[10].y, _285);
    float _309 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[10].z, _287);
    float _311 = _287;
    float _313 = _309;
    if (!_153)
    {
        float _315 = _117 * _117;
        float _317 = _315 * 0.5;
        _311 = _317;
    }
    float _319 = _311;
    float _321 = fma(_259, _179, _305);
    float _323 = fma(_259, _181, _307);
    float _325 = fma(_259, _183, _309);
    float _327 = _319;
    if (!_153)
    {
        _313 = _117;
    }
    float _329 = _313;
    float _331 = _329;
    if (!_153)
    {
        float _333 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _333;
    }
    float _335 = _327;
    bool _337 = !_153;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = _117 * _343;
        float _353 = exp2(_351);
        float _355 = _349 * 0.693147182464599609375;
        float _357 = 1.0 / _355;
        float _359 = 1.0 / _347;
        float _361 = _353 + (-1.0);
        float _363 = -_361;
        float _365 = fma(_363, _357, _117);
        float _367 = _365 * _359;
        float _369 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _339 = _369;
    }
    float _371 = _339;
    bool _373 = !_153;
    if (!_373)
    {
        float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = log2(_375);
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = 1.0 / _381;
        float _385 = _117 * _377;
        float _387 = exp2(_385);
        float _389 = -_387;
        float _391 = _389 + 1.0;
        float _393 = _391 * _383;
        _331 = _393;
    }
    float _395 = _331;
    float _397 = fma(_323, _263, _271);
    float _399 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _401 = fma(_321, _263, _269);
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _409 = _407 != 0;
    float _411 = fma(_325, _263, _273);
    float _413 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _415 = _399 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _417 = _399 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _419 = !_405;
    int _421 = _419 ? 0 : 1;
    float _423 = _399 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _425 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[8].x, _415);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[8].y, _417);
    int _431 = abs(_421);
    float _433 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[8].z, _423);
    bool _435 = !_157;
    int _437 = _435 ? 0 : 1;
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[10].x, _427);
    float _441 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[10].y, _429);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[10].z, _433);
    int _445 = abs(_437);
    float _447 = fma(_395, _181, _441);
    float _449 = float(_431);
    float _451 = fma(_395, _179, _439);
    float _453 = -_447;
    float _455 = _323 + _453;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _459 = abs(_295);
    float _461 = _449 * _459;
    bool _463 = !_409;
    int _465 = _463 ? 0 : 1;
    float _467 = fma(_395, _183, _443);
    float _469 = float(_445);
    float _471 = _455 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _473 = abs(_465);
    float _475 = _455 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _477 = -_451;
    float _479 = _321 + _477;
    float _481 = _455 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _483 = float(_473);
    float _485 = -_467;
    float _487 = _325 + _485;
    float _489 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[4].x, _475);
    float _491 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[5].x, _471);
    float _493 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[6].x, _481);
    float _495 = fma(_469, _303, _461);
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[4].z, _489);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[5].z, _491);
    float _501 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[6].z, _493);
    float _503 = abs(_299);
    float _505 = fma(_483, _503, _495);
    bool _507 = !_457;
    float _509 = _499;
    float _511 = _497;
    float _513 = _501;
    float _531;
    float _533;
    if (!_507)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _517 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _519 = float(_83);
        float _521 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _523 = _521 * _515;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _531 = _529;
        _533 = _519;
        _535 = true;
    }
    else
    {
        float _537 = float(_83);
        float _539 = 1.0 / _537;
        float _541 = _117 * _539;
        _531 = _541;
        _533 = _537;
    }
    _535 = false;
    float _543 = _531;
    float _545 = _533;
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _549 = int(_547);
    float _551 = in.m_49.y;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _555 = _543 + _553;
    float _557 = in.m_49.z;
    float _559 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _563 = int(_561);
    float _565 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _567;
    float _571 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _573 = _137 + (-0.5);
    bool _575 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _577 = isnan(_543);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = float(_549);
    float _589 = 1.0 / _545;
    bool _591 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _593 = isnan(_543);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_585;
    float _605 = _603 + 1.0;
    float _607 = float(uint(_563));
    float _609 = 1.0 / _587;
    int _611 = ~_563;
    int _613 = _611 + 1;
    int _615 = ~_563;
    int _617 = _615 + 1;
    bool _619 = _563 == 0;
    float _621 = _557 * 2.0;
    float _623 = 1.0 / _607;
    float _625 = _117 * _609;
    float _627 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _629 = log2(_627);
    int _631 = as_type<int>(_623) + (-2);
    float _633 = trunc(_625);
    int _635 = int(_633);
    float _637 = 1.0 / _569;
    float _639 = float(uint(_635));
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _643 = _543 + _641;
    float _645 = as_type<float>(_631) * _639;
    float _647 = trunc(_645);
    float _649 = precise::max(_647, 0.0);
    uint _652 = uint(_649);
    int _654 = _613 * int(_652);
    int _656 = _654 + _635;
    float _658 = float(uint(_656));
    float _660 = as_type<float>(_631) * _658;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _664 = _662 != 0;
    float _666 = trunc(_660);
    float _668 = precise::max(_666, 0.0);
    uint _670 = uint(_668);
    bool _672 = !_664;
    float _674 = _672 ? 7.345489978790283203125 : 1.0;
    float _676 = float(_563);
    float _678 = _674 * _137;
    float _680 = floor(_678);
    int _682 = int(_652) + int(_670);
    float _684 = float(_635);
    int _686 = _617 * _682;
    int _688 = _686 + _635;
    bool _690 = _684 >= _676;
    bool _692 = isnan(_684);
    bool _694 = _690 || _692;
    bool _696 = isnan(_676);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    bool _702 = uint(_688) >= uint(_563);
    float _704 = trunc(_700);
    int _706 = int(_704);
    float _708 = -_680;
    float _710 = _678 + _708;
    bool _712 = !_702;
    int _714 = _712 ? 0 : (-1);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _726 = _724 != 0;
    float _728 = _710 * _676;
    int _730 = ~_682;
    int _732 = _730 + _714;
    int _734 = _732 + 1;
    float _736 = _117 * _676;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _740 = _738 != 0;
    float _742 = trunc(_728);
    int _744 = int(_742);
    int _746 = _563 * _734;
    int _748 = _746 + _635;
    float _750 = _736 * _589;
    bool _752 = !_718;
    int _754 = _752 ? 0 : 1;
    int _756 = ~_706;
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    bool _762 = !_619;
    int _764 = _762 ? _748 : (-1);
    float _766 = trunc(_750);
    int _768 = int(_766);
    bool _770 = !_740;
    int _772 = _770 ? 0 : 1;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _776 = _774 != 0;
    int _778 = _764 * _760;
    int _780 = _563 + (-1);
    int _782 = abs(_754);
    int _784 = abs(_772);
    int _786 = _706 * _780;
    int _788 = _786 + _778;
    bool _790 = !_722;
    int _792 = _790 ? 0 : 1;
    bool _794 = !_776;
    int _796 = _794 ? 0 : 1;
    int _798 = _744 * _784;
    int _800 = _798 + _635;
    int _802 = abs(_792);
    bool _804 = !_726;
    int _806 = _804 ? 0 : 1;
    int _808 = abs(_796);
    int _810 = _788 * _802;
    int _812 = abs(_806);
    int _814 = ~_563;
    int _816 = _814 + 1;
    int _818 = _768 * _782;
    int _820 = _818 + _810;
    int _822 = _800 * _812;
    int _824 = _822 + _820;
    int _826 = ~_563;
    int _828 = _826 + 1;
    int _830 = _744 * _808;
    int _832 = _830 + _824;
    float _834 = as_type<float>(int(gl_VertexIndex));
    float _836 = float(uint(_832));
    float _838 = as_type<float>(_631) * _836;
    float _840 = trunc(_838);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = _828 * int(_844);
    int _848 = _846 + _832;
    float _850 = float(uint(_848));
    float _852 = as_type<float>(_631) * _850;
    float _854 = trunc(_852);
    float _856 = precise::max(_854, 0.0);
    uint _858 = uint(_856);
    int _860 = int(_844) + int(_858);
    float _862 = _137 * 2.0;
    int _864 = _816 * _860;
    int _866 = _864 + _832;
    float _868 = floor(_862);
    bool _870 = uint(_866) >= uint(_563);
    bool _872 = !_870;
    int _874 = _872 ? 0 : (-1);
    int _876 = ~_860;
    int _878 = _876 + _874;
    int _880 = _878 + 1;
    int _882 = _563 * _880;
    int _884 = _882 + _832;
    float _886 = _551 * 2.0;
    bool _888 = _868 > 0.0;
    bool _890 = _868 >= 0.0;
    bool _892 = isnan(_868);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    bool _900 = !_619;
    int _902 = _900 ? _884 : (-1);
    float _904 = floor(_886);
    int _906 = _898 ? 0 : 1;
    int _908 = _902 & 3;
    bool _910 = _908 != 0;
    int _912 = _902 & 3;
    bool _914 = _912 != 0;
    bool _916 = uint(_908) > 1u;
    int _918 = _914 ? 0 : 1;
    int _920 = ~_906;
    int _922 = _920 + 1;
    int _924 = _922 + 1;
    int _926 = ~_918;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = _924;
    int _934 = _930;
    if (!_888)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _932 = _938;
    }
    int _940 = _932;
    bool _942 = _904 >= 0.0;
    bool _944 = isnan(_904);
    bool _946 = _942 || _944;
    bool _948 = isnan(0.0);
    bool _950 = _946 || _948;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _954 = _952 != 0;
    if (!_916)
    {
        int _956 = ~_918;
        int _958 = _956 + 1;
        _934 = _958;
    }
    int _960 = _934;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _962;
    bool _966 = _904 > 0.0;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _972 = _950 ? 0 : 1;
    float _974 = 1.0 / _964;
    bool _976 = !_954;
    int _978 = _976 ? 0 : 1;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    int _994 = ~_972;
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    bool _1000 = !_910;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = 1.0 / _970;
    float _1006 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1008 = !_986;
    int _1010 = _1008 ? 0 : 1;
    float _1012 = _137 + _551;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1016 = _1014 != 0;
    float _1018 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1006);
    int _1020 = _998;
    if (!_966)
    {
        int _1022 = ~_972;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = _1012 + (-1.0);
    float _1030 = _555 * _974;
    float _1032 = _117 * _629;
    int _1034 = as_type<int>(_834) & 1;
    bool _1036 = _1034 != 0;
    int _1038 = as_type<int>(_834) & 2;
    bool _1040 = _1038 != 0;
    float _1042 = floor(_621);
    float _1044 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _565);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1048 = _543 + _1046;
    float _1050 = _643 * _1004;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1054 = exp2(_1032);
    float _1056 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1058 = _551 + _557;
    float _1060 = -_1052;
    float _1062 = fma(_571, 2.0, _1060);
    float _1064 = _137 + _557;
    bool _1066 = !_982;
    int _1068 = _1066 ? 0 : 1;
    float _1070 = _1058 + (-1.0);
    float _1072 = _1064 + (-1.0);
    bool _1074 = _1042 >= 0.0;
    bool _1076 = isnan(_1042);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan(0.0);
    bool _1082 = _1078 || _1080;
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1086 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1088 = isnan(_543);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1100 = _1082 ? 0 : 1;
    float _1102 = _1048 * _637;
    float _1104 = -_1054;
    float _1106 = _1104 + 1.0;
    bool _1108 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1116 = _1112 || _1114;
    float _1118 = -_1096;
    float _1120 = _1118 + 1.0;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1126;
    float _1130 = _1116 ? _1106 : 0.0;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1136 = _1042 > 0.0;
    float _1138 = fma(_1124, _1030, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1140 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1142 = isnan(_543);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    float _1152 = _585 * _1120;
    float _1154 = fma(_1128, _1030, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1156 = float(uint(_800));
    float _1158 = _601 * _605;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1162 = 1.0 + _1160;
    float _1164 = -_601;
    float _1166 = _1164 + 1.0;
    float _1168 = as_type<float>(_631) * _1156;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1170;
    float _1174 = 1.0 / _1162;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1176;
    float _1180 = _1150 * _1166;
    float _1182 = fma(_1134, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1184 = ~_563;
    int _1186 = _1184 + 1;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1192 = _1138 * _1180;
    float _1194 = _1154 * _1180;
    float _1196 = trunc(_1168);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    int _1202 = abs(_1010);
    float _1204 = -_1150;
    float _1206 = _1204 + 1.0;
    bool _1208 = !_990;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = fma(_1190, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1214 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1192);
    int _1216 = ~_1100;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = _1130 * _1174;
    int _1224 = _1220;
    if (!_1136)
    {
        int _1226 = ~_1100;
        int _1228 = _1226 + 1;
        _1224 = _1228;
    }
    int _1230 = _1224;
    float _1232 = fma(_1182, _1158, _1214);
    float _1234 = float(_940);
    float _1236 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1194);
    float _1238 = float(_1202);
    float _1240 = fma(_1172, _1102, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1242 = abs(_1068);
    int _1244 = _1186 * int(_1200);
    int _1246 = _1244 + _800;
    bool _1248 = uint(_908) >= 2u;
    float _1250 = _1238 * _1234;
    float _1252 = float(_1026);
    float _1254 = fma(_1178, _1102, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1256 = float(uint(_1246));
    float _1258 = _1250 * (-2.0);
    int _1260 = abs(_1210);
    float _1262 = -_117;
    float _1264 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1062);
    float _1266 = float(_1242);
    float _1268 = as_type<float>(_631) * _1256;
    int _1270 = _902 >> 31;
    float _1272 = in.m_56.x;
    float _1274 = in.m_56.y;
    float _1276 = in.m_56.z;
    float _1278 = float(_1260);
    int _1280 = _1270 & 3;
    float _1282 = trunc(_1268);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    float _1288 = float(_1230);
    float _1290 = _1278 * _1252;
    int _1292 = _902 + _1280;
    float _1294 = fma(_1084, _1258, _1084);
    int _1296 = _1248 ? 0 : 1;
    float _1298 = _1266 * _1288;
    bool _1300 = _908 != 3;
    float _1302 = _1290 * (-2.0);
    int _1304 = _1292 >> 2;
    float _1306 = _1298 * (-2.0);
    bool _1308 = !_1300;
    int _1310 = _1308 ? 0 : (-1);
    bool _1312 = _908 != 3;
    float _1314 = fma(_1056, _1306, _1056);
    int _1316 = ~_563;
    int _1318 = _1316 + 1;
    int _1320 = _1304 << 4;
    int _1322 = _1320 + 368;
    float _1324 = fma(_1258, _1274, _1274);
    uint _1326 = uint(int(uint(_1322) >> uint(2)));
    uint _1328 = uint(int(uint(int(_1326)) >> uint(2)));
    int _1330 = int(_1326) & 3;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[int(_1328)][_1330];
    int _1334 = int(_1326) + 1;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    int _1338 = _1334 & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = ~_1296;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    float _1348 = fma(_1306, _1272, _1272);
    int _1350 = int(_1200) + int(_1286);
    int _1352 = _1346;
    if (_1312)
    {
        int _1354 = ~_1296;
        int _1356 = _1354 + 1;
        _1352 = _1356;
    }
    int _1358 = _1352;
    float _1360 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1362 = int(_1360);
    int _1364 = _1322 + 8;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    uint _1368 = uint(int(uint(int(_1366)) >> uint(2)));
    int _1370 = int(_1366) & 3;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[int(_1368)][_1370];
    int _1374 = int(_1366) + 1;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    int _1378 = _1374 & 3;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[int(_1376)][_1378];
    int _1382 = _1318 * _1350;
    int _1384 = _1382 + _800;
    float _1386 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1388 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1348);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1392 = abs(_1002);
    bool _1394 = uint(_1384) >= uint(_563);
    float _1396 = _551 + (-0.5);
    float _1398 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1390);
    int _1400 = abs(_1310);
    bool _1402 = !_1394;
    int _1404 = _1402 ? 0 : (-1);
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1324);
    bool _1408 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1410 = isnan(1.0);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1416 = _1412 || _1414;
    int _1418 = ~_1350;
    int _1420 = _1418 + _1404;
    int _1422 = _1420 + 1;
    bool _1424 = !_1416;
    float _1426 = _1424 ? _117 : _1222;
    float _1428 = _1386 * _137;
    int _1430 = abs(_1362);
    int _1432 = _563 * _1422;
    int _1434 = _1432 + _800;
    bool _1436 = _137 > 0.5;
    float _1438 = fma(_1426, _1294, _1406);
    float _1440 = fma(_1302, _1276, _1276);
    int _1442 = abs(_960);
    float _1444 = _1438 * 0.15915493667125701904296875;
    int _1446 = abs(_1358);
    float _1448 = fma(_1426, _1314, _1388);
    int _1450 = ~_1442;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = trunc(_1428);
    int _1458 = int(_1456);
    int _1460 = ~_1392;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    float _1466 = _1448 * 0.15915493667125701904296875;
    int _1468 = abs(_978);
    float _1470 = _557 + (-0.5);
    int _1472 = _1454 * as_type<int>(_1340);
    int _1474 = ~_1446;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    float _1480 = fma(_1098, _1302, _1098);
    float _1482 = float(uint(_1362));
    int _1484 = _1464 * as_type<int>(_1332);
    int _1486 = _1484 + _1472;
    int _1488 = ~_1400;
    int _1490 = _1488 + 1;
    int _1492 = _1490 + 1;
    float _1494 = _1444 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    int _1498 = _1478 * as_type<int>(_1372);
    int _1500 = _1498 + _1486;
    bool _1502 = !_619;
    int _1504 = _1502 ? _1434 : (-1);
    int _1506 = ~_1468;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = _1492 * as_type<int>(_1380);
    int _1514 = _1512 + _1500;
    float _1516 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1440);
    float _1518 = 1.0 / _1482;
    float _1520 = float(uint(_1430));
    int _1522 = _1514 * _1510;
    float _1524 = fma(_1212, _1158, _1236);
    float _1526 = in.m_51.x;
    float _1528 = in.m_51.y;
    int _1530 = _1504 * _1468;
    int _1532 = _1530 + _1522;
    float _1534 = fma(_1240, _1152, _1232);
    float _1536 = 1.0 / _1520;
    float _1538 = fma(_1254, _1152, _1524);
    float _1540 = fma(_1426, _1480, _1516);
    float _1542 = float(uint(_1532));
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1546 = abs(_1532);
    float _1548 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1534);
    float _1550 = _1540 * 0.15915493667125701904296875;
    int _1552 = as_type<int>(_1518) + (-2);
    float _1554 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1538);
    float _1556 = _551 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1558 = _1444 * 6.283185482025146484375;
    float _1560 = cos(_1558);
    float _1562 = as_type<float>(_1552) * _1542;
    float _1564 = float(uint(_1546));
    float _1566 = fma(_1556, -2.0, _1544);
    int _1568 = as_type<int>(_1536) + (-2);
    int _1570 = ~_1362;
    int _1572 = _1570 + 1;
    float _1574 = trunc(_1562);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    float _1580 = _1548 * _1526;
    float _1582 = as_type<float>(_1568) * _1564;
    float _1584 = _1554 * _1528;
    bool _1586 = !_1036;
    float _1588 = _1586 ? (-0.5) : 0.5;
    float _1590 = _505 * _1580;
    int _1592 = ~_1430;
    int _1594 = _1592 + 1;
    float _1596 = _505 * _1584;
    float _1598 = _1466 * 6.283185482025146484375;
    float _1600 = sin(_1598);
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1604 = !_1040;
    float _1606 = _1604 ? (-0.5) : 0.5;
    float _1608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1588);
    float _1610 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1612 = _551 > 0.5;
    float _1614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1606);
    float _1616 = _1466 * 6.283185482025146484375;
    float _1618 = cos(_1616);
    int _1620 = _1572 * int(_1578);
    int _1622 = _1620 + _1532;
    float _1624 = _1602 * _1608;
    int _1626 = _1458 << 4;
    int _1628 = _1626 + 1712;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1632 = _1630 != 0;
    float _1634 = float(uint(_1622));
    float _1636 = _1550 * 6.283185482025146484375;
    float _1638 = sin(_1636);
    float _1640 = _1600 * _1560;
    float _1642 = _1610 * _1614;
    float _1644 = _1600 * _1496;
    float _1646 = as_type<float>(_1552) * _1634;
    float _1648 = trunc(_1582);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = _1550 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = _1618 * _1496;
    float _1660 = -_1658;
    float _1662 = fma(_1638, _1640, _1660);
    float _1664 = -_1640;
    float _1666 = fma(_1638, _1658, _1664);
    float _1668 = _1618 * _1560;
    int _1670 = _1594 * int(_1652);
    int _1672 = _1670 + _1546;
    float _1674 = float(uint(_1672));
    float _1676 = _1496 * _1656;
    float _1678 = _1656 * _1642;
    float _1680 = trunc(_1646);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    float _1686 = _1560 * _1656;
    float _1688 = fma(_1638, _1668, _1644);
    float _1690 = _1618 * _1678;
    float _1692 = -_1642;
    float _1694 = _1638 * _1692;
    float _1696 = fma(_1638, _1644, _1668);
    float _1698 = as_type<float>(_1568) * _1674;
    float _1700 = fma(_1688, _1624, _1690);
    float _1702 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1704 = _1600 * _1678;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1708 = trunc(_1698);
    float _1710 = precise::max(_1708, 0.0);
    uint _1712 = uint(_1710);
    float _1714 = fma(_1686, _1624, _1694);
    float _1716 = fma(_1666, _1702, _1700);
    float _1718 = fma(_1662, _1624, _1704);
    float _1720 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1706);
    float _1722 = fma(_1676, _1702, _1714);
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1726 = int(_1578) + int(_1684);
    float _1728 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1730 = fma(_1696, _1702, _1718);
    float _1732 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1734 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1044);
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1728);
    float _1738 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1740 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1732);
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1744 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1736);
    int _1746 = int(_1652) + int(_1712);
    float _1748 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1750 = _1738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1752 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1754 = _1628 + 8;
    uint _1756 = uint(int(uint(_1754) >> uint(2)));
    uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
    int _1760 = int(_1756) & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    float _1764 = _1742 + _1748;
    int _1766 = ~_1430;
    int _1768 = _1766 + 1;
    float _1770 = _1750 + _1752;
    int _1772 = ~_1362;
    int _1774 = _1772 + 1;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1778 = _1764 + _1776;
    float _1780 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _992);
    float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1784 = _1770 + _1782;
    uint _1786 = uint(int(uint(_1628) >> uint(2)));
    uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
    int _1790 = int(_1786) & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    int _1794 = int(_1786) + 1;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    int _1798 = _1794 & 3;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[int(_1796)][_1798];
    float _1802 = _1778 * _1778;
    int _1804 = _1768 * _1746;
    int _1806 = _1804 + _1546;
    float _1808 = -_1588;
    int _1810 = _1436 ? as_type<int>(_1808) : as_type<int>(_1588);
    int _1812 = _1774 * _1726;
    int _1814 = _1812 + _1532;
    float _1816 = fma(_1784, _1784, _1802);
    float _1818 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1820 = !_1632;
    float _1822 = _1820 ? _1588 : as_type<float>(_1810);
    float _1824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1826 = uint(_1814) >= uint(_1362);
    float _1828 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1818);
    int _1830 = _1532 ^ _1362;
    float _1832 = _1780 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1834 = !_1826;
    int _1836 = _1834 ? 0 : (-1);
    float _1838 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1828);
    uint _1840 = uint(int(uint(_1830) >> uint(31)));
    float _1842 = sqrt(_1816);
    int _1844 = ~_1726;
    int _1846 = _1844 + _1836;
    int _1848 = _1846 + 1;
    bool _1850 = uint(_1806) >= uint(_1430);
    int _1852 = ~int(_1840);
    int _1854 = _1852 + 1;
    int _1856 = _1362 * _1848;
    int _1858 = _1856 + _1532;
    bool _1860 = !_1850;
    int _1862 = _1860 ? 0 : (-1);
    float _1864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1866 = _1362 == 0;
    float _1868 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1870 = ~_1862;
    int _1872 = _1746 + _1870;
    int _1874 = _1872 + 1;
    float _1876 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1878 = -_1606;
    int _1880 = _1612 ? as_type<int>(_1878) : as_type<int>(_1606);
    float _1882 = _1832 + _1868;
    bool _1884 = !_1866;
    float _1886 = _1884 ? as_type<float>(_1858) : as_type<float>(0xffffffffu /* nan */);
    bool _1888 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1890 = _1874 ^ _1854;
    bool _1892 = !_1016;
    float _1894 = _1892 ? _1606 : as_type<float>(_1880);
    float _1896 = float(as_type<int>(_1886));
    bool _1898 = _1362 == 0;
    int _1900 = ~_1854;
    int _1902 = _1900 + _1890;
    int _1904 = _1902 + 1;
    float _1906 = _1606;
    float _1908 = _1868;
    float _1910 = _1886;
    float _1912 = _1832;
    if (!_1888)
    {
        _1906 = _1770;
    }
    float _1914 = _1906;
    float _1916 = _1914;
    if (!_1888)
    {
        _1908 = _1764;
    }
    float _1918 = _1908;
    float _1920 = _1918;
    if (!_1888)
    {
        _1910 = _1882;
    }
    float _1922 = _1910;
    bool _1924 = !_1888;
    float _1926 = _1922;
    if (!_1924)
    {
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1932 = _1842 + _1930;
        float _1934 = rsqrt(_1816);
        float _1936 = _1932 * _1928;
        float _1938 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = _1936 * 0.15915493667125701904296875;
        float _1942 = _1940 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        float _1946 = _1940 * 6.283185482025146484375;
        float _1948 = sin(_1946);
        float _1950 = _1944 + (-1.0);
        float _1952 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1954 = fma(_1948, _1938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1956 = fma(_1882, _1944, _1952);
        float _1958 = _1934 * _1954;
        float _1960 = fma(_1784, _1958, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1962 = fma(_1778, _1958, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1926 = _1956;
        _1916 = _1960;
        _1920 = _1962;
    }
    float _1964 = _1926;
    float _1966 = _1916;
    float _1968 = _1920;
    bool _1970 = !_1898;
    int _1972 = _1970 ? _1904 : (-1);
    float _1974 = fma(_1876, _1896, _1264);
    float _1976 = _1822 + 0.5;
    float _1978 = -_1832;
    float _1980 = _1978 + _1964;
    float _1982 = float(_1972);
    float _1984 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1566);
    float _1986 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1988 = fma(_1876, _1976, _1974);
    float _1990 = -_1750;
    float _1992 = _1990 + _1966;
    float _1994 = _1980 * _1980;
    float _1996 = -_1984;
    float _1998 = fma(_1986, _1982, _1996);
    float _2000 = -_1742;
    float _2002 = _2000 + _1968;
    float _2004 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1398);
    float _2006 = fma(_1992, _1992, _1994);
    float _2008 = _1894 + (-0.5);
    float _2010 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1720);
    float _2012 = -_2004;
    float _2014 = _2012 + 1.0;
    float _2016 = fma(_2002, _2002, _2006);
    float _2018 = -_1986;
    float _2020 = fma(_2018, _2008, _1998);
    float _2022 = _1792 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2024 = sqrt(_2016);
    float _2026 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2028 = -_2014;
    float _2030 = fma(_1822, _2028, _1988);
    float _2032 = _1762 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2034 = -_2010;
    float _2036 = _2034 + 1.0;
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2042 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2044 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = fma(_1894, _2036, _2020);
    out.m_58.x = _2042;
    out.m_58.y = _2038;
    out.m_58.z = _2044;
    out.m_58.w = _2040;
    bool _2048 = _2024 > 0.0;
    out.m_60.x = _2030;
    out.m_60.y = _2046;
    bool _2050 = !_2048;
    float _2052 = _2030;
    float _2054 = _2038;
    float _2056 = _1966;
    float _2058 = _1964;
    float _2060 = _1968;
    float _2062 = _2046;
    float _2064 = _2030;
    float _2066 = _2042;
    float _2068 = _2044;
    float _2070 = _2038;
    if (!_2050)
    {
        bool _2072 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2074 = _2046;
        if (_2072)
        {
            float _2076 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2074 = _2076;
        }
        float _2078 = _2074;
        float _2080 = _2078;
        if (_2072)
        {
            float _2082 = _497 * _2078;
            _2052 = _2082;
        }
        float _2084 = _2052;
        float _2086 = _2084;
        float _2088 = _2084;
        if (_2072)
        {
            float _2090 = _499 * _2078;
            _2054 = _2090;
        }
        float _2092 = _2054;
        float _2094 = _2092;
        if (_2072)
        {
            float _2096 = _501 * _2078;
            _2080 = _2096;
        }
        float _2098 = _2080;
        float _2100 = _2098;
        if (!_2072)
        {
            float _2102 = _117 + 1.0;
            float _2104 = _2102;
            if (!_153)
            {
                float _2106 = _2102 * _2102;
                float _2108 = _2106 * 0.5;
                _2086 = _2108;
            }
            float _2110 = _2086;
            float _2112 = _2110;
            if (!_153)
            {
                float _2114 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2112 = _2114;
            }
            float _2116 = _2112;
            bool _2118 = !_153;
            float _2120 = _2116;
            if (!_2118)
            {
                float _2122 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2124 = log2(_2122);
                float _2126 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2128 = _2124 * _2102;
                float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2132 = 1.0 + _2130;
                float _2134 = 1.0 / _2132;
                float _2136 = _2126 * 0.693147182464599609375;
                float _2138 = exp2(_2128);
                float _2140 = 1.0 / _2136;
                float _2142 = _2138 + (-1.0);
                float _2144 = -_2142;
                float _2146 = fma(_2144, _2140, _2102);
                float _2148 = _2146 * _2134;
                float _2150 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2120 = _2150;
            }
            float _2152 = _2120;
            float _2154 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2156 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2158 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2160 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2162 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2164 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2166 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2160);
            float _2168 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2162);
            float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2166);
            bool _2172 = !_153;
            if (!_2172)
            {
                float _2174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2176 = log2(_2174);
                float _2178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2180 = 1.0 + _2178;
                float _2182 = 1.0 / _2180;
                float _2184 = _2176 * _2102;
                float _2186 = exp2(_2184);
                float _2188 = -_2186;
                float _2190 = _2188 + 1.0;
                float _2192 = _2190 * _2182;
                _2104 = _2192;
            }
            float _2194 = _2104;
            float _2196 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2164);
            float _2198 = fma(_2158, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2168);
            float _2200 = fma(_2194, _181, _2170);
            float _2202 = fma(_2158, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2196);
            float _2204 = fma(_2194, _179, _2198);
            float _2206 = -_447;
            float _2208 = _2206 + _2200;
            float _2210 = fma(_2194, _183, _2202);
            float _2212 = -_451;
            float _2214 = _2212 + _2204;
            float _2216 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2218 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2220 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2222 = -_467;
            float _2224 = _2222 + _2210;
            float _2226 = fma(_2214, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2216);
            float _2228 = fma(_2214, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2218);
            float _2230 = fma(_2214, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2220);
            float _2232 = fma(_2224, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2226);
            float _2234 = fma(_2224, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2228);
            float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2230);
            _509 = _2234;
            _511 = _2232;
            _513 = _2236;
            _2088 = _2232;
            _2094 = _2234;
            _2100 = _2236;
        }
        float _2238 = _509;
        float _2240 = _511;
        float _2242 = _513;
        float _2244 = _2088;
        float _2246 = _2094;
        float _2248 = _2100;
        float _2250 = _2238 * _2238;
        float _2252 = rsqrt(_2016);
        float _2254 = fma(_2240, _2240, _2250);
        float _2256 = fma(_2242, _2242, _2254);
        float _2258 = sqrt(_2256);
        float _2260 = _1992 * _2252;
        float _2262 = _1980 * _2252;
        float _2264 = _2002 * _2252;
        bool _2266 = _2258 > 0.0;
        bool _2268 = !_2266;
        _2062 = _2248;
        _2064 = _2244;
        _203 = _2254;
        _2066 = _2260;
        _2068 = _2256;
        _2070 = _2246;
        if (!_2268)
        {
            float _2270 = rsqrt(_2256);
            float _2272 = _2270 * _2238;
            float _2274 = _2270 * _2240;
            float _2276 = _2270 * _2242;
            float _2278 = _2262 * _2272;
            float _2280 = fma(_2260, _2274, _2278);
            float _2282 = fma(_2264, _2276, _2280);
            float _2284 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2286 = fma(_2244, _2284, _1966);
            float _2288 = fma(_2246, _2284, _1964);
            float _2290 = fma(_2248, _2284, _1968);
            _2056 = _2286;
            _2058 = _2288;
            _2060 = _2290;
            _203 = _2276;
        }
    }
    float _2292 = _2056;
    float _2294 = _2058;
    float _2296 = _2060;
    float _2298 = _2062;
    float _2300 = _2064;
    float _2302 = _203;
    float _2304 = _2066;
    float _2306 = _2068;
    float _2308 = _2070;
    bool _2310 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2312 = isnan(0.5);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2318 = _2314 || _2316;
    float _2320 = _2300;
    float _2322 = _2298;
    float _2324 = _2302;
    float _2326 = _2308;
    float _2328 = _2306;
    if (_2318)
    {
        _2320 = _2292;
    }
    float _2330 = _2320;
    float _2332 = _2330;
    if (_2318)
    {
        _2322 = _2294;
    }
    float _2334 = _2322;
    float _2336 = _2334;
    if (_2318)
    {
        _2324 = _2296;
    }
    float _2338 = _2324;
    float _2340 = _2338;
    if (!_2318)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2344 = _1832 + _2342;
        float _2346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2348 = _1750 + _2346;
        float _2350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2352 = -_1750;
        float _2354 = _2352 + _2292;
        float _2356 = _2344 * _2344;
        float _2358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2360 = _1742 + _2358;
        float _2362 = -_1832;
        float _2364 = _2362 + _2294;
        float _2366 = -_1742;
        float _2368 = _2366 + _2296;
        float _2370 = fma(_2348, _2348, _2356);
        float _2372 = fma(_2360, _2360, _2370);
        float _2374 = sqrt(_2372);
        float _2376 = precise::min(_2374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2378 = _2376 * _2350;
        float _2380 = fma(_2354, _2378, _1750);
        float _2382 = fma(_2364, _2378, _1832);
        float _2384 = fma(_2368, _2378, _1742);
        _2336 = _2382;
        _2332 = _2380;
        _2340 = _2384;
    }
    float _2386 = _2336;
    float _2388 = _2332;
    float _2390 = _2340;
    float _2392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2394 = _2386 + _2392;
    float _2396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2398 = _2388 + _2396;
    float _2400 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2402 = _2390 + _2400;
    float _2404 = _2394 * _2394;
    float _2406 = fma(_2398, _2398, _2404);
    float _2408 = fma(_2402, _2402, _2406);
    float _2410 = rsqrt(_2408);
    float _2412 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2414 = _2398 * _2412;
    float _2416 = _2402 * _2412;
    float _2418 = _2414 * _2414;
    float _2420 = _2416 * _2416;
    float _2422 = _2418 + _2420;
    float _2424 = sqrt(_2422);
    bool _2426 = _2424 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2430 = _2424 + _2428;
    float _2432 = _2410;
    float _2434 = _2430;
    float _2436 = _2412;
    float _2438 = _2418;
    if (_2426)
    {
        float _2440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2432 = _2440;
    }
    float _2442 = _2432;
    if (_2426)
    {
        float _2444 = rsqrt(_2422);
        _2326 = _2444;
    }
    float _2446 = _2326;
    float _2448 = _2446;
    if (_2426)
    {
        float _2450 = _2430 * _2442;
        _2434 = _2450;
    }
    float _2452 = _2434;
    if (_2426)
    {
        float _2454 = _2452 * 0.15915493667125701904296875;
        _2328 = _2454;
    }
    float _2456 = _2328;
    float _2458 = _2304;
    if (_2426)
    {
        float _2460 = _2456 * 6.283185482025146484375;
        float _2462 = sin(_2460);
        _2458 = _2462;
    }
    float _2464 = _2458;
    float _2466 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2468 = precise::max(0.0, _2466);
    float _2470 = _2402;
    float _2472 = _2468;
    float _2474 = _2466;
    if (_2426)
    {
        float _2476 = _2456 * 6.283185482025146484375;
        float _2478 = cos(_2476);
        _2470 = _2478;
    }
    float _2480 = _2470;
    float _2482 = -_2412;
    float _2484 = -_2468;
    float _2486 = fma(_2394, _2482, _2484);
    if (_2426)
    {
        float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2472 = _2488;
    }
    float _2490 = _2472;
    float _2492 = sqrt(_2408);
    float _2494 = _2464;
    float _2496 = _2490;
    if (_2426)
    {
        float _2498 = fma(_2464, _2490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2494 = _2498;
    }
    float _2500 = _2494;
    float _2502 = _2500;
    if (!_2426)
    {
        _2496 = _2416;
    }
    float _2504 = _2496;
    float _2506 = _2504;
    if (_2426)
    {
        float _2508 = _2480 + (-1.0);
        _2474 = _2508;
    }
    float _2510 = _2474;
    float _2512 = _2510;
    if (_2426)
    {
        float _2514 = _2446 * _2500;
        _1912 = _2514;
    }
    float _2516 = _1912;
    if (!_2426)
    {
        _2448 = _2414;
    }
    float _2518 = _2448;
    float _2520 = _2518;
    if (_2426)
    {
        float _2522 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2436 = _2522;
    }
    float _2524 = _2436;
    if (_2426)
    {
        float _2526 = _2414 * _2516;
        _2520 = _2526;
    }
    float _2528 = _2520;
    if (!_2426)
    {
        _2502 = _2486;
    }
    float _2530 = _2502;
    float _2532 = _2530;
    if (_2426)
    {
        float _2534 = _2416 * _2516;
        _2506 = _2534;
    }
    float _2536 = _2506;
    if (_2426)
    {
        float _2538 = fma(_2486, _2480, _2524);
        _2532 = _2538;
    }
    float _2540 = _2532;
    if (_2426)
    {
        float _2542 = _2528 * _2528;
        _2438 = _2542;
    }
    float _2544 = _2438;
    if (!_2426)
    {
        _2512 = _2420;
    }
    float _2546 = _2512;
    float _2548 = _2546;
    if (_2426)
    {
        float _2550 = _2536 * _2536;
        _2548 = _2550;
    }
    float _2552 = _2548;
    float _2554 = fma(_2540, _2540, _2544);
    float _2556 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2558 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2560 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2562 = _2554 + _2552;
    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2566 = fma(_2492, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2564);
    float _2568 = precise::clamp(_2566, 0.0, 1.0);
    float _2570 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2556);
    float _2572 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2574 = rsqrt(_2562);
    float _2576 = -_2568;
    float _2578 = _2576 + 1.0;
    float _2580 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2582 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2572);
    float _2584 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2560);
    float _2586 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2570);
    float _2588 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2580);
    float _2590 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2582);
    float _2592 = abs(_2578);
    float _2594 = log2(_2592);
    float _2596 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2584);
    float _2598 = _2586 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2600 = _2590 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2602 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2588);
    float _2604 = _2596 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2606 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2608 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2610 = _2574 * _2528;
    float _2612 = _2574 * _2540;
    float _2614 = _2574 * _2536;
    float _2616 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2608);
    float _2618 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2620 = -_2606;
    float _2622 = fma(_2620, _2558, 1.0);
    float _2624 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2626 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2616);
    float _2628 = -_2618;
    float _2630 = fma(_2612, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2628);
    float _2632 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2634 = log2(_2622);
    float _2636 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2638 = -_2614;
    float _2640 = fma(_2638, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2630);
    float _2642 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2644 = fma(_2640, -0.5, 0.5);
    float _2646 = fma(_2640, 0.5, 0.5);
    float _2648 = exp2(_2632);
    float _2650 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2626);
    float _2652 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2642);
    float _2654 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2636);
    float _2656 = _2612 + 1.0;
    float _2658 = fma(_2646, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2660 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2652);
    float _2662 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2654);
    float _2664 = 1.0 / _2650;
    float _2666 = fma(_2646, _2658, -0.212114393711090087890625);
    float _2668 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2660);
    float _2670 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2662);
    float _2672 = fma(_2646, _2666, 1.570728778839111328125);
    float _2674 = sqrt(_2644);
    float _2676 = -_2612;
    float _2678 = fma(_2648, _2656, _2676);
    float _2680 = _2634 * 0.693147182464599609375;
    float _2682 = fma(_2678, 0.5, 0.5);
    float _2684 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2686 = _2668 * _2664;
    float _2688 = _2670 * _2664;
    float _2690 = fma(_2686, 0.5, 0.5);
    float _2692 = fma(_2688, -0.5, 0.5);
    float _2694 = _2674 * 0.636619746685028076171875;
    float3 _6732 = float3(_2690, _2692, _2684);
    float _2696 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6732, float3(0.0), isnan(_6732)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6732, float3(0.0), isnan(_6732)), level(0.0)).x;
    float3 _6743 = float3(_2690, _2692, _2684);
    float4 _2699 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6743, float3(0.0), isnan(_6743)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6743, float3(0.0), isnan(_6743)), level(0.0)).xyzw;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2699.w;
    float _2709 = -_2672;
    float _2711 = fma(_2694, _2709, 1.0);
    float2 _6765 = float2(_2711, _2682);
    float3 _2715 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6765, float2(0.0), isnan(_6765)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6765, float2(0.0), isnan(_6765)), level(0.0)).xyz;
    float _2717 = _2715.x;
    float _2719 = _2715.y;
    float _2721 = _2715.z;
    float _2723 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2725 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2727 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2725);
    float _2729 = exp2(_2723);
    float _2731 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2727);
    float _2733 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2731);
    float _2735 = _2733 + _2650;
    float _2737 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2668;
    out.gl_Position.y = _2670;
    out.gl_Position.z = _2733;
    out.gl_Position.w = _2650;
    float _2739 = _2735 * 0.5;
    float _2741 = -_2729;
    float _2743 = _2741 + 1.0;
    out.m_45.x = _2737;
    float _2745 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2739;
    out.m_62.w = _2650;
    float _2747 = _2745 * _2696;
    float _2749 = -_2745;
    float _2751 = _2749 + 1.0;
    float _2753 = _2707 * _2747;
    float _2755 = _2707 * _2751;
    float _2757 = _2721 * _2747;
    float _2759 = fma(_2717, _2753, _2701);
    float _2761 = fma(_2719, _2753, _2703);
    float _2763 = fma(_2707, _2757, _2705);
    out.m_64.x = _2759;
    out.m_64.y = _2761;
    out.m_64.z = _2763;
    out.m_64.w = _2755;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _535 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_99);
        out.gl_Position.z = _2820;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2889 = as_type<float>(_135);
        out.gl_Position.z = _2889;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = _141 * _139;
    float _161 = 0.0;
    float _163 = _143;
    if (!_153)
    {
        float _165 = _143 * _143;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _173 = _169;
    if (!_153)
    {
        float _175 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    float _179 = in.m_47.x;
    float _181 = in.m_47.y;
    float _183 = in.m_47.z;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = floor(_171);
    float _189 = _185 * 0.15915493667125701904296875;
    float _191 = _189 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = -_187;
    float _197 = _171 + _195;
    bool _199 = !_153;
    float _201 = _177;
    float _203 = _181;
    if (!_199)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _143 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _143);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _233;
    }
    float _235 = _201;
    bool _237 = !_153;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _143 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _163 = _257;
    }
    float _259 = _163;
    float _261 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = in.m_51.w;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _261 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _269 = in.m_42.x;
    float _271 = in.m_42.y;
    float _273 = in.m_42.z;
    float _275 = _261 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _277 = _261 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _279 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[8].x, _267);
    bool _281 = _197 < 0.5;
    float _283 = float(_281);
    float _285 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[8].y, _275);
    float _287 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[8].z, _277);
    float _289 = fma(_193, 0.5, 0.5);
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _293 = -_197;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_283;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_289;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[10].x, _279);
    float _307 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[10].y, _285);
    float _309 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[10].z, _287);
    float _311 = _287;
    float _313 = _309;
    if (!_153)
    {
        float _315 = _117 * _117;
        float _317 = _315 * 0.5;
        _311 = _317;
    }
    float _319 = _311;
    float _321 = fma(_259, _179, _305);
    float _323 = fma(_259, _181, _307);
    float _325 = fma(_259, _183, _309);
    float _327 = _319;
    if (!_153)
    {
        _313 = _117;
    }
    float _329 = _313;
    float _331 = _329;
    if (!_153)
    {
        float _333 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _333;
    }
    float _335 = _327;
    bool _337 = !_153;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = _117 * _343;
        float _353 = exp2(_351);
        float _355 = _349 * 0.693147182464599609375;
        float _357 = 1.0 / _355;
        float _359 = 1.0 / _347;
        float _361 = _353 + (-1.0);
        float _363 = -_361;
        float _365 = fma(_363, _357, _117);
        float _367 = _365 * _359;
        float _369 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _339 = _369;
    }
    float _371 = _339;
    bool _373 = !_153;
    if (!_373)
    {
        float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = log2(_375);
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = 1.0 / _381;
        float _385 = _117 * _377;
        float _387 = exp2(_385);
        float _389 = -_387;
        float _391 = _389 + 1.0;
        float _393 = _391 * _383;
        _331 = _393;
    }
    float _395 = _331;
    float _397 = fma(_323, _263, _271);
    float _399 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _401 = fma(_321, _263, _269);
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _409 = _407 != 0;
    float _411 = fma(_325, _263, _273);
    float _413 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _415 = _399 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _417 = _399 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _419 = !_405;
    int _421 = _419 ? 0 : 1;
    float _423 = _399 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _425 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[8].x, _415);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[8].y, _417);
    int _431 = abs(_421);
    float _433 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[8].z, _423);
    bool _435 = !_157;
    int _437 = _435 ? 0 : 1;
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[10].x, _427);
    float _441 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[10].y, _429);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[10].z, _433);
    int _445 = abs(_437);
    float _447 = fma(_395, _181, _441);
    float _449 = float(_431);
    float _451 = fma(_395, _179, _439);
    float _453 = -_447;
    float _455 = _323 + _453;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _459 = abs(_295);
    float _461 = _449 * _459;
    bool _463 = !_409;
    int _465 = _463 ? 0 : 1;
    float _467 = fma(_395, _183, _443);
    float _469 = float(_445);
    float _471 = _455 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _473 = abs(_465);
    float _475 = _455 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _477 = -_451;
    float _479 = _321 + _477;
    float _481 = _455 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _483 = float(_473);
    float _485 = -_467;
    float _487 = _325 + _485;
    float _489 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[4].x, _475);
    float _491 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[5].x, _471);
    float _493 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[6].x, _481);
    float _495 = fma(_469, _303, _461);
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[4].z, _489);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[5].z, _491);
    float _501 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[6].z, _493);
    float _503 = abs(_299);
    float _505 = fma(_483, _503, _495);
    bool _507 = !_457;
    float _509 = _499;
    float _511 = _497;
    float _513 = _501;
    float _531;
    float _533;
    if (!_507)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _517 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _519 = float(_83);
        float _521 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _523 = _521 * _515;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _531 = _529;
        _533 = _519;
        _535 = true;
    }
    else
    {
        float _537 = float(_83);
        float _539 = 1.0 / _537;
        float _541 = _117 * _539;
        _531 = _541;
        _533 = _537;
    }
    _535 = false;
    float _543 = _531;
    float _545 = _533;
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _549 = int(_547);
    float _551 = in.m_49.y;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _555 = _543 + _553;
    float _557 = in.m_49.z;
    float _559 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _563 = int(_561);
    float _565 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _567;
    float _571 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _573 = _137 + (-0.5);
    bool _575 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _577 = isnan(_543);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = float(_549);
    float _589 = 1.0 / _545;
    bool _591 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _593 = isnan(_543);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_585;
    float _605 = _603 + 1.0;
    float _607 = float(uint(_563));
    float _609 = 1.0 / _587;
    int _611 = ~_563;
    int _613 = _611 + 1;
    int _615 = ~_563;
    int _617 = _615 + 1;
    bool _619 = _563 == 0;
    float _621 = _557 * 2.0;
    float _623 = 1.0 / _607;
    float _625 = _117 * _609;
    float _627 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _629 = log2(_627);
    int _631 = as_type<int>(_623) + (-2);
    float _633 = trunc(_625);
    int _635 = int(_633);
    float _637 = 1.0 / _569;
    float _639 = float(uint(_635));
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _643 = _543 + _641;
    float _645 = as_type<float>(_631) * _639;
    float _647 = trunc(_645);
    float _649 = precise::max(_647, 0.0);
    uint _652 = uint(_649);
    int _654 = _613 * int(_652);
    int _656 = _654 + _635;
    float _658 = float(uint(_656));
    float _660 = as_type<float>(_631) * _658;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _664 = _662 != 0;
    float _666 = trunc(_660);
    float _668 = precise::max(_666, 0.0);
    uint _670 = uint(_668);
    bool _672 = !_664;
    float _674 = _672 ? 7.345489978790283203125 : 1.0;
    float _676 = float(_563);
    float _678 = _674 * _137;
    float _680 = floor(_678);
    int _682 = int(_652) + int(_670);
    float _684 = float(_635);
    int _686 = _617 * _682;
    int _688 = _686 + _635;
    bool _690 = _684 >= _676;
    bool _692 = isnan(_684);
    bool _694 = _690 || _692;
    bool _696 = isnan(_676);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    bool _702 = uint(_688) >= uint(_563);
    float _704 = trunc(_700);
    int _706 = int(_704);
    float _708 = -_680;
    float _710 = _678 + _708;
    bool _712 = !_702;
    int _714 = _712 ? 0 : (-1);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _726 = _724 != 0;
    float _728 = _710 * _676;
    int _730 = ~_682;
    int _732 = _730 + _714;
    int _734 = _732 + 1;
    float _736 = _117 * _676;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _740 = _738 != 0;
    float _742 = trunc(_728);
    int _744 = int(_742);
    int _746 = _563 * _734;
    int _748 = _746 + _635;
    float _750 = _736 * _589;
    bool _752 = !_718;
    int _754 = _752 ? 0 : 1;
    int _756 = ~_706;
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    bool _762 = !_619;
    int _764 = _762 ? _748 : (-1);
    float _766 = trunc(_750);
    int _768 = int(_766);
    bool _770 = !_740;
    int _772 = _770 ? 0 : 1;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _776 = _774 != 0;
    int _778 = _764 * _760;
    int _780 = _563 + (-1);
    int _782 = abs(_754);
    int _784 = abs(_772);
    int _786 = _706 * _780;
    int _788 = _786 + _778;
    bool _790 = !_722;
    int _792 = _790 ? 0 : 1;
    bool _794 = !_776;
    int _796 = _794 ? 0 : 1;
    int _798 = _744 * _784;
    int _800 = _798 + _635;
    int _802 = abs(_792);
    bool _804 = !_726;
    int _806 = _804 ? 0 : 1;
    int _808 = abs(_796);
    int _810 = _788 * _802;
    int _812 = abs(_806);
    int _814 = ~_563;
    int _816 = _814 + 1;
    int _818 = _768 * _782;
    int _820 = _818 + _810;
    int _822 = _800 * _812;
    int _824 = _822 + _820;
    int _826 = ~_563;
    int _828 = _826 + 1;
    int _830 = _744 * _808;
    int _832 = _830 + _824;
    float _834 = as_type<float>(int(gl_VertexIndex));
    float _836 = float(uint(_832));
    float _838 = as_type<float>(_631) * _836;
    float _840 = trunc(_838);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = _828 * int(_844);
    int _848 = _846 + _832;
    float _850 = float(uint(_848));
    float _852 = as_type<float>(_631) * _850;
    float _854 = trunc(_852);
    float _856 = precise::max(_854, 0.0);
    uint _858 = uint(_856);
    int _860 = int(_844) + int(_858);
    float _862 = _137 * 2.0;
    int _864 = _816 * _860;
    int _866 = _864 + _832;
    float _868 = floor(_862);
    bool _870 = uint(_866) >= uint(_563);
    bool _872 = !_870;
    int _874 = _872 ? 0 : (-1);
    int _876 = ~_860;
    int _878 = _876 + _874;
    int _880 = _878 + 1;
    int _882 = _563 * _880;
    int _884 = _882 + _832;
    float _886 = _551 * 2.0;
    bool _888 = _868 > 0.0;
    bool _890 = _868 >= 0.0;
    bool _892 = isnan(_868);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    bool _900 = !_619;
    int _902 = _900 ? _884 : (-1);
    float _904 = floor(_886);
    int _906 = _898 ? 0 : 1;
    int _908 = _902 & 3;
    bool _910 = _908 != 0;
    int _912 = _902 & 3;
    bool _914 = _912 != 0;
    bool _916 = uint(_908) > 1u;
    int _918 = _914 ? 0 : 1;
    int _920 = ~_906;
    int _922 = _920 + 1;
    int _924 = _922 + 1;
    int _926 = ~_918;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = _924;
    int _934 = _930;
    if (!_888)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _932 = _938;
    }
    int _940 = _932;
    bool _942 = _904 >= 0.0;
    bool _944 = isnan(_904);
    bool _946 = _942 || _944;
    bool _948 = isnan(0.0);
    bool _950 = _946 || _948;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _954 = _952 != 0;
    if (!_916)
    {
        int _956 = ~_918;
        int _958 = _956 + 1;
        _934 = _958;
    }
    int _960 = _934;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _962;
    bool _966 = _904 > 0.0;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _972 = _950 ? 0 : 1;
    float _974 = 1.0 / _964;
    bool _976 = !_954;
    int _978 = _976 ? 0 : 1;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    int _994 = ~_972;
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    bool _1000 = !_910;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = 1.0 / _970;
    float _1006 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1008 = !_986;
    int _1010 = _1008 ? 0 : 1;
    float _1012 = _137 + _551;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1016 = _1014 != 0;
    float _1018 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1006);
    int _1020 = _998;
    if (!_966)
    {
        int _1022 = ~_972;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = _1012 + (-1.0);
    float _1030 = _555 * _974;
    float _1032 = _117 * _629;
    int _1034 = as_type<int>(_834) & 1;
    bool _1036 = _1034 != 0;
    int _1038 = as_type<int>(_834) & 2;
    bool _1040 = _1038 != 0;
    float _1042 = floor(_621);
    float _1044 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _565);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1048 = _543 + _1046;
    float _1050 = _643 * _1004;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1054 = exp2(_1032);
    float _1056 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1058 = _551 + _557;
    float _1060 = -_1052;
    float _1062 = fma(_571, 2.0, _1060);
    float _1064 = _137 + _557;
    bool _1066 = !_982;
    int _1068 = _1066 ? 0 : 1;
    float _1070 = _1058 + (-1.0);
    float _1072 = _1064 + (-1.0);
    bool _1074 = _1042 >= 0.0;
    bool _1076 = isnan(_1042);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan(0.0);
    bool _1082 = _1078 || _1080;
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1086 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1088 = isnan(_543);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1100 = _1082 ? 0 : 1;
    float _1102 = _1048 * _637;
    float _1104 = -_1054;
    float _1106 = _1104 + 1.0;
    bool _1108 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1116 = _1112 || _1114;
    float _1118 = -_1096;
    float _1120 = _1118 + 1.0;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1126;
    float _1130 = _1116 ? _1106 : 0.0;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1136 = _1042 > 0.0;
    float _1138 = fma(_1124, _1030, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1140 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1142 = isnan(_543);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    float _1152 = _585 * _1120;
    float _1154 = fma(_1128, _1030, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1156 = float(uint(_800));
    float _1158 = _601 * _605;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1162 = 1.0 + _1160;
    float _1164 = -_601;
    float _1166 = _1164 + 1.0;
    float _1168 = as_type<float>(_631) * _1156;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1170;
    float _1174 = 1.0 / _1162;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1176;
    float _1180 = _1150 * _1166;
    float _1182 = fma(_1134, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1184 = ~_563;
    int _1186 = _1184 + 1;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1192 = _1138 * _1180;
    float _1194 = _1154 * _1180;
    float _1196 = trunc(_1168);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    int _1202 = abs(_1010);
    float _1204 = -_1150;
    float _1206 = _1204 + 1.0;
    bool _1208 = !_990;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = fma(_1190, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1214 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1192);
    int _1216 = ~_1100;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = _1130 * _1174;
    int _1224 = _1220;
    if (!_1136)
    {
        int _1226 = ~_1100;
        int _1228 = _1226 + 1;
        _1224 = _1228;
    }
    int _1230 = _1224;
    float _1232 = fma(_1182, _1158, _1214);
    float _1234 = float(_940);
    float _1236 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1194);
    float _1238 = float(_1202);
    float _1240 = fma(_1172, _1102, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1242 = abs(_1068);
    int _1244 = _1186 * int(_1200);
    int _1246 = _1244 + _800;
    bool _1248 = uint(_908) >= 2u;
    float _1250 = _1238 * _1234;
    float _1252 = float(_1026);
    float _1254 = fma(_1178, _1102, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1256 = float(uint(_1246));
    float _1258 = _1250 * (-2.0);
    int _1260 = abs(_1210);
    float _1262 = -_117;
    float _1264 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1062);
    float _1266 = float(_1242);
    float _1268 = as_type<float>(_631) * _1256;
    int _1270 = _902 >> 31;
    float _1272 = in.m_56.x;
    float _1274 = in.m_56.y;
    float _1276 = in.m_56.z;
    float _1278 = float(_1260);
    int _1280 = _1270 & 3;
    float _1282 = trunc(_1268);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    float _1288 = float(_1230);
    float _1290 = _1278 * _1252;
    int _1292 = _902 + _1280;
    float _1294 = fma(_1084, _1258, _1084);
    int _1296 = _1248 ? 0 : 1;
    float _1298 = _1266 * _1288;
    bool _1300 = _908 != 3;
    float _1302 = _1290 * (-2.0);
    int _1304 = _1292 >> 2;
    float _1306 = _1298 * (-2.0);
    bool _1308 = !_1300;
    int _1310 = _1308 ? 0 : (-1);
    bool _1312 = _908 != 3;
    float _1314 = fma(_1056, _1306, _1056);
    int _1316 = ~_563;
    int _1318 = _1316 + 1;
    int _1320 = _1304 << 4;
    int _1322 = _1320 + 368;
    float _1324 = fma(_1258, _1274, _1274);
    uint _1326 = uint(int(uint(_1322) >> uint(2)));
    uint _1328 = uint(int(uint(int(_1326)) >> uint(2)));
    int _1330 = int(_1326) & 3;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[int(_1328)][_1330];
    int _1334 = int(_1326) + 1;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    int _1338 = _1334 & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = ~_1296;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    float _1348 = fma(_1306, _1272, _1272);
    int _1350 = int(_1200) + int(_1286);
    int _1352 = _1346;
    if (_1312)
    {
        int _1354 = ~_1296;
        int _1356 = _1354 + 1;
        _1352 = _1356;
    }
    int _1358 = _1352;
    float _1360 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1362 = int(_1360);
    int _1364 = _1322 + 8;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    uint _1368 = uint(int(uint(int(_1366)) >> uint(2)));
    int _1370 = int(_1366) & 3;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[int(_1368)][_1370];
    int _1374 = int(_1366) + 1;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    int _1378 = _1374 & 3;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[int(_1376)][_1378];
    int _1382 = _1318 * _1350;
    int _1384 = _1382 + _800;
    float _1386 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1388 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1348);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1392 = abs(_1002);
    bool _1394 = uint(_1384) >= uint(_563);
    float _1396 = _551 + (-0.5);
    float _1398 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1390);
    int _1400 = abs(_1310);
    bool _1402 = !_1394;
    int _1404 = _1402 ? 0 : (-1);
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1324);
    bool _1408 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1410 = isnan(1.0);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1416 = _1412 || _1414;
    int _1418 = ~_1350;
    int _1420 = _1418 + _1404;
    int _1422 = _1420 + 1;
    bool _1424 = !_1416;
    float _1426 = _1424 ? _117 : _1222;
    float _1428 = _1386 * _137;
    int _1430 = abs(_1362);
    int _1432 = _563 * _1422;
    int _1434 = _1432 + _800;
    bool _1436 = _137 > 0.5;
    float _1438 = fma(_1426, _1294, _1406);
    float _1440 = fma(_1302, _1276, _1276);
    int _1442 = abs(_960);
    float _1444 = _1438 * 0.15915493667125701904296875;
    int _1446 = abs(_1358);
    float _1448 = fma(_1426, _1314, _1388);
    int _1450 = ~_1442;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = trunc(_1428);
    int _1458 = int(_1456);
    int _1460 = ~_1392;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    float _1466 = _1448 * 0.15915493667125701904296875;
    int _1468 = abs(_978);
    float _1470 = _557 + (-0.5);
    int _1472 = _1454 * as_type<int>(_1340);
    int _1474 = ~_1446;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    float _1480 = fma(_1098, _1302, _1098);
    float _1482 = float(uint(_1362));
    int _1484 = _1464 * as_type<int>(_1332);
    int _1486 = _1484 + _1472;
    int _1488 = ~_1400;
    int _1490 = _1488 + 1;
    int _1492 = _1490 + 1;
    float _1494 = _1444 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    int _1498 = _1478 * as_type<int>(_1372);
    int _1500 = _1498 + _1486;
    bool _1502 = !_619;
    int _1504 = _1502 ? _1434 : (-1);
    int _1506 = ~_1468;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = _1492 * as_type<int>(_1380);
    int _1514 = _1512 + _1500;
    float _1516 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1440);
    float _1518 = 1.0 / _1482;
    float _1520 = float(uint(_1430));
    int _1522 = _1514 * _1510;
    float _1524 = fma(_1212, _1158, _1236);
    float _1526 = in.m_51.x;
    float _1528 = in.m_51.y;
    int _1530 = _1504 * _1468;
    int _1532 = _1530 + _1522;
    float _1534 = fma(_1240, _1152, _1232);
    float _1536 = 1.0 / _1520;
    float _1538 = fma(_1254, _1152, _1524);
    float _1540 = fma(_1426, _1480, _1516);
    float _1542 = float(uint(_1532));
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1546 = abs(_1532);
    float _1548 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1534);
    float _1550 = _1540 * 0.15915493667125701904296875;
    int _1552 = as_type<int>(_1518) + (-2);
    float _1554 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1538);
    float _1556 = _551 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1558 = _1444 * 6.283185482025146484375;
    float _1560 = cos(_1558);
    float _1562 = as_type<float>(_1552) * _1542;
    float _1564 = float(uint(_1546));
    float _1566 = fma(_1556, -2.0, _1544);
    int _1568 = as_type<int>(_1536) + (-2);
    int _1570 = ~_1362;
    int _1572 = _1570 + 1;
    float _1574 = trunc(_1562);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    float _1580 = _1548 * _1526;
    float _1582 = as_type<float>(_1568) * _1564;
    float _1584 = _1554 * _1528;
    bool _1586 = !_1036;
    float _1588 = _1586 ? (-0.5) : 0.5;
    float _1590 = _505 * _1580;
    int _1592 = ~_1430;
    int _1594 = _1592 + 1;
    float _1596 = _505 * _1584;
    float _1598 = _1466 * 6.283185482025146484375;
    float _1600 = sin(_1598);
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1604 = !_1040;
    float _1606 = _1604 ? (-0.5) : 0.5;
    float _1608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1588);
    float _1610 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1612 = _551 > 0.5;
    float _1614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1606);
    float _1616 = _1466 * 6.283185482025146484375;
    float _1618 = cos(_1616);
    int _1620 = _1572 * int(_1578);
    int _1622 = _1620 + _1532;
    float _1624 = _1602 * _1608;
    int _1626 = _1458 << 4;
    int _1628 = _1626 + 1712;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1632 = _1630 != 0;
    float _1634 = float(uint(_1622));
    float _1636 = _1550 * 6.283185482025146484375;
    float _1638 = sin(_1636);
    float _1640 = _1600 * _1560;
    float _1642 = _1610 * _1614;
    float _1644 = _1600 * _1496;
    float _1646 = as_type<float>(_1552) * _1634;
    float _1648 = trunc(_1582);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = _1550 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = _1618 * _1496;
    float _1660 = -_1658;
    float _1662 = fma(_1638, _1640, _1660);
    float _1664 = -_1640;
    float _1666 = fma(_1638, _1658, _1664);
    float _1668 = _1618 * _1560;
    int _1670 = _1594 * int(_1652);
    int _1672 = _1670 + _1546;
    float _1674 = float(uint(_1672));
    float _1676 = _1496 * _1656;
    float _1678 = _1656 * _1642;
    float _1680 = trunc(_1646);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    float _1686 = _1560 * _1656;
    float _1688 = fma(_1638, _1668, _1644);
    float _1690 = _1618 * _1678;
    float _1692 = -_1642;
    float _1694 = _1638 * _1692;
    float _1696 = fma(_1638, _1644, _1668);
    float _1698 = as_type<float>(_1568) * _1674;
    float _1700 = fma(_1688, _1624, _1690);
    float _1702 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1704 = _1600 * _1678;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1708 = trunc(_1698);
    float _1710 = precise::max(_1708, 0.0);
    uint _1712 = uint(_1710);
    float _1714 = fma(_1686, _1624, _1694);
    float _1716 = fma(_1666, _1702, _1700);
    float _1718 = fma(_1662, _1624, _1704);
    float _1720 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1706);
    float _1722 = fma(_1676, _1702, _1714);
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1726 = int(_1578) + int(_1684);
    float _1728 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1730 = fma(_1696, _1702, _1718);
    float _1732 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1734 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1044);
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1728);
    float _1738 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1740 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1732);
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1744 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1736);
    int _1746 = int(_1652) + int(_1712);
    float _1748 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1750 = _1738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1752 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1754 = _1628 + 8;
    uint _1756 = uint(int(uint(_1754) >> uint(2)));
    uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
    int _1760 = int(_1756) & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    float _1764 = _1742 + _1748;
    int _1766 = ~_1430;
    int _1768 = _1766 + 1;
    float _1770 = _1750 + _1752;
    int _1772 = ~_1362;
    int _1774 = _1772 + 1;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1778 = _1764 + _1776;
    float _1780 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _992);
    float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1784 = _1770 + _1782;
    uint _1786 = uint(int(uint(_1628) >> uint(2)));
    uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
    int _1790 = int(_1786) & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    int _1794 = int(_1786) + 1;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    int _1798 = _1794 & 3;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[int(_1796)][_1798];
    float _1802 = _1778 * _1778;
    int _1804 = _1768 * _1746;
    int _1806 = _1804 + _1546;
    float _1808 = -_1588;
    int _1810 = _1436 ? as_type<int>(_1808) : as_type<int>(_1588);
    int _1812 = _1774 * _1726;
    int _1814 = _1812 + _1532;
    float _1816 = fma(_1784, _1784, _1802);
    float _1818 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1820 = !_1632;
    float _1822 = _1820 ? _1588 : as_type<float>(_1810);
    float _1824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1826 = uint(_1814) >= uint(_1362);
    float _1828 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1818);
    int _1830 = _1532 ^ _1362;
    float _1832 = _1780 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1834 = !_1826;
    int _1836 = _1834 ? 0 : (-1);
    float _1838 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1828);
    uint _1840 = uint(int(uint(_1830) >> uint(31)));
    float _1842 = sqrt(_1816);
    int _1844 = ~_1726;
    int _1846 = _1844 + _1836;
    int _1848 = _1846 + 1;
    bool _1850 = uint(_1806) >= uint(_1430);
    int _1852 = ~int(_1840);
    int _1854 = _1852 + 1;
    int _1856 = _1362 * _1848;
    int _1858 = _1856 + _1532;
    bool _1860 = !_1850;
    int _1862 = _1860 ? 0 : (-1);
    float _1864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1866 = _1362 == 0;
    float _1868 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1870 = ~_1862;
    int _1872 = _1746 + _1870;
    int _1874 = _1872 + 1;
    float _1876 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1878 = -_1606;
    int _1880 = _1612 ? as_type<int>(_1878) : as_type<int>(_1606);
    float _1882 = _1832 + _1868;
    bool _1884 = !_1866;
    float _1886 = _1884 ? as_type<float>(_1858) : as_type<float>(0xffffffffu /* nan */);
    bool _1888 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1890 = _1874 ^ _1854;
    bool _1892 = !_1016;
    float _1894 = _1892 ? _1606 : as_type<float>(_1880);
    float _1896 = float(as_type<int>(_1886));
    bool _1898 = _1362 == 0;
    int _1900 = ~_1854;
    int _1902 = _1900 + _1890;
    int _1904 = _1902 + 1;
    float _1906 = _1606;
    float _1908 = _1868;
    float _1910 = _1886;
    float _1912 = _1832;
    if (!_1888)
    {
        _1906 = _1770;
    }
    float _1914 = _1906;
    float _1916 = _1914;
    if (!_1888)
    {
        _1908 = _1764;
    }
    float _1918 = _1908;
    float _1920 = _1918;
    if (!_1888)
    {
        _1910 = _1882;
    }
    float _1922 = _1910;
    bool _1924 = !_1888;
    float _1926 = _1922;
    if (!_1924)
    {
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1932 = _1842 + _1930;
        float _1934 = rsqrt(_1816);
        float _1936 = _1932 * _1928;
        float _1938 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = _1936 * 0.15915493667125701904296875;
        float _1942 = _1940 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        float _1946 = _1940 * 6.283185482025146484375;
        float _1948 = sin(_1946);
        float _1950 = _1944 + (-1.0);
        float _1952 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1954 = fma(_1948, _1938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1956 = fma(_1882, _1944, _1952);
        float _1958 = _1934 * _1954;
        float _1960 = fma(_1784, _1958, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1962 = fma(_1778, _1958, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1926 = _1956;
        _1916 = _1960;
        _1920 = _1962;
    }
    float _1964 = _1926;
    float _1966 = _1916;
    float _1968 = _1920;
    bool _1970 = !_1898;
    int _1972 = _1970 ? _1904 : (-1);
    float _1974 = fma(_1876, _1896, _1264);
    float _1976 = _1822 + 0.5;
    float _1978 = -_1832;
    float _1980 = _1978 + _1964;
    float _1982 = float(_1972);
    float _1984 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1566);
    float _1986 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1988 = fma(_1876, _1976, _1974);
    float _1990 = -_1750;
    float _1992 = _1990 + _1966;
    float _1994 = _1980 * _1980;
    float _1996 = -_1984;
    float _1998 = fma(_1986, _1982, _1996);
    float _2000 = -_1742;
    float _2002 = _2000 + _1968;
    float _2004 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1398);
    float _2006 = fma(_1992, _1992, _1994);
    float _2008 = _1894 + (-0.5);
    float _2010 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1720);
    float _2012 = -_2004;
    float _2014 = _2012 + 1.0;
    float _2016 = fma(_2002, _2002, _2006);
    float _2018 = -_1986;
    float _2020 = fma(_2018, _2008, _1998);
    float _2022 = _1792 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2024 = sqrt(_2016);
    float _2026 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2028 = -_2014;
    float _2030 = fma(_1822, _2028, _1988);
    float _2032 = _1762 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2034 = -_2010;
    float _2036 = _2034 + 1.0;
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2042 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2044 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = fma(_1894, _2036, _2020);
    out.m_58.x = _2042;
    out.m_58.y = _2038;
    out.m_58.z = _2044;
    out.m_58.w = _2040;
    bool _2048 = _2024 > 0.0;
    out.m_60.x = _2030;
    out.m_60.y = _2046;
    bool _2050 = !_2048;
    float _2052 = _2030;
    float _2054 = _2038;
    float _2056 = _1966;
    float _2058 = _1964;
    float _2060 = _1968;
    float _2062 = _2046;
    float _2064 = _2030;
    float _2066 = _2042;
    float _2068 = _2044;
    float _2070 = _2038;
    if (!_2050)
    {
        bool _2072 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2074 = _2046;
        if (_2072)
        {
            float _2076 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2074 = _2076;
        }
        float _2078 = _2074;
        float _2080 = _2078;
        if (_2072)
        {
            float _2082 = _497 * _2078;
            _2052 = _2082;
        }
        float _2084 = _2052;
        float _2086 = _2084;
        float _2088 = _2084;
        if (_2072)
        {
            float _2090 = _499 * _2078;
            _2054 = _2090;
        }
        float _2092 = _2054;
        float _2094 = _2092;
        if (_2072)
        {
            float _2096 = _501 * _2078;
            _2080 = _2096;
        }
        float _2098 = _2080;
        float _2100 = _2098;
        if (!_2072)
        {
            float _2102 = _117 + 1.0;
            float _2104 = _2102;
            if (!_153)
            {
                float _2106 = _2102 * _2102;
                float _2108 = _2106 * 0.5;
                _2086 = _2108;
            }
            float _2110 = _2086;
            float _2112 = _2110;
            if (!_153)
            {
                float _2114 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2112 = _2114;
            }
            float _2116 = _2112;
            bool _2118 = !_153;
            float _2120 = _2116;
            if (!_2118)
            {
                float _2122 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2124 = log2(_2122);
                float _2126 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2128 = _2124 * _2102;
                float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2132 = 1.0 + _2130;
                float _2134 = 1.0 / _2132;
                float _2136 = _2126 * 0.693147182464599609375;
                float _2138 = exp2(_2128);
                float _2140 = 1.0 / _2136;
                float _2142 = _2138 + (-1.0);
                float _2144 = -_2142;
                float _2146 = fma(_2144, _2140, _2102);
                float _2148 = _2146 * _2134;
                float _2150 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2120 = _2150;
            }
            float _2152 = _2120;
            float _2154 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2156 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2158 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2160 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2162 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2164 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2166 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2160);
            float _2168 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2162);
            float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2166);
            bool _2172 = !_153;
            if (!_2172)
            {
                float _2174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2176 = log2(_2174);
                float _2178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2180 = 1.0 + _2178;
                float _2182 = 1.0 / _2180;
                float _2184 = _2176 * _2102;
                float _2186 = exp2(_2184);
                float _2188 = -_2186;
                float _2190 = _2188 + 1.0;
                float _2192 = _2190 * _2182;
                _2104 = _2192;
            }
            float _2194 = _2104;
            float _2196 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2164);
            float _2198 = fma(_2158, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2168);
            float _2200 = fma(_2194, _181, _2170);
            float _2202 = fma(_2158, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2196);
            float _2204 = fma(_2194, _179, _2198);
            float _2206 = -_447;
            float _2208 = _2206 + _2200;
            float _2210 = fma(_2194, _183, _2202);
            float _2212 = -_451;
            float _2214 = _2212 + _2204;
            float _2216 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2218 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2220 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2222 = -_467;
            float _2224 = _2222 + _2210;
            float _2226 = fma(_2214, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2216);
            float _2228 = fma(_2214, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2218);
            float _2230 = fma(_2214, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2220);
            float _2232 = fma(_2224, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2226);
            float _2234 = fma(_2224, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2228);
            float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2230);
            _509 = _2234;
            _511 = _2232;
            _513 = _2236;
            _2088 = _2232;
            _2094 = _2234;
            _2100 = _2236;
        }
        float _2238 = _509;
        float _2240 = _511;
        float _2242 = _513;
        float _2244 = _2088;
        float _2246 = _2094;
        float _2248 = _2100;
        float _2250 = _2238 * _2238;
        float _2252 = rsqrt(_2016);
        float _2254 = fma(_2240, _2240, _2250);
        float _2256 = fma(_2242, _2242, _2254);
        float _2258 = sqrt(_2256);
        float _2260 = _1992 * _2252;
        float _2262 = _1980 * _2252;
        float _2264 = _2002 * _2252;
        bool _2266 = _2258 > 0.0;
        bool _2268 = !_2266;
        _2062 = _2248;
        _2064 = _2244;
        _203 = _2254;
        _2066 = _2260;
        _2068 = _2256;
        _2070 = _2246;
        if (!_2268)
        {
            float _2270 = rsqrt(_2256);
            float _2272 = _2270 * _2238;
            float _2274 = _2270 * _2240;
            float _2276 = _2270 * _2242;
            float _2278 = _2262 * _2272;
            float _2280 = fma(_2260, _2274, _2278);
            float _2282 = fma(_2264, _2276, _2280);
            float _2284 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2286 = fma(_2244, _2284, _1966);
            float _2288 = fma(_2246, _2284, _1964);
            float _2290 = fma(_2248, _2284, _1968);
            _2056 = _2286;
            _2058 = _2288;
            _2060 = _2290;
            _203 = _2276;
        }
    }
    float _2292 = _2056;
    float _2294 = _2058;
    float _2296 = _2060;
    float _2298 = _2062;
    float _2300 = _2064;
    float _2302 = _203;
    float _2304 = _2066;
    float _2306 = _2068;
    float _2308 = _2070;
    bool _2310 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2312 = isnan(0.5);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2318 = _2314 || _2316;
    float _2320 = _2300;
    float _2322 = _2298;
    float _2324 = _2302;
    float _2326 = _2308;
    float _2328 = _2306;
    if (_2318)
    {
        _2320 = _2292;
    }
    float _2330 = _2320;
    float _2332 = _2330;
    if (_2318)
    {
        _2322 = _2294;
    }
    float _2334 = _2322;
    float _2336 = _2334;
    if (_2318)
    {
        _2324 = _2296;
    }
    float _2338 = _2324;
    float _2340 = _2338;
    if (!_2318)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2344 = _1832 + _2342;
        float _2346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2348 = _1750 + _2346;
        float _2350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2352 = -_1750;
        float _2354 = _2352 + _2292;
        float _2356 = _2344 * _2344;
        float _2358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2360 = _1742 + _2358;
        float _2362 = -_1832;
        float _2364 = _2362 + _2294;
        float _2366 = -_1742;
        float _2368 = _2366 + _2296;
        float _2370 = fma(_2348, _2348, _2356);
        float _2372 = fma(_2360, _2360, _2370);
        float _2374 = sqrt(_2372);
        float _2376 = precise::min(_2374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2378 = _2376 * _2350;
        float _2380 = fma(_2354, _2378, _1750);
        float _2382 = fma(_2364, _2378, _1832);
        float _2384 = fma(_2368, _2378, _1742);
        _2336 = _2382;
        _2332 = _2380;
        _2340 = _2384;
    }
    float _2386 = _2336;
    float _2388 = _2332;
    float _2390 = _2340;
    float _2392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2394 = _2386 + _2392;
    float _2396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2398 = _2388 + _2396;
    float _2400 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2402 = _2390 + _2400;
    float _2404 = _2394 * _2394;
    float _2406 = fma(_2398, _2398, _2404);
    float _2408 = fma(_2402, _2402, _2406);
    float _2410 = rsqrt(_2408);
    float _2412 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2414 = _2398 * _2412;
    float _2416 = _2402 * _2412;
    float _2418 = _2414 * _2414;
    float _2420 = _2416 * _2416;
    float _2422 = _2418 + _2420;
    float _2424 = sqrt(_2422);
    bool _2426 = _2424 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2430 = _2424 + _2428;
    float _2432 = _2410;
    float _2434 = _2430;
    float _2436 = _2412;
    float _2438 = _2418;
    if (_2426)
    {
        float _2440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2432 = _2440;
    }
    float _2442 = _2432;
    if (_2426)
    {
        float _2444 = rsqrt(_2422);
        _2326 = _2444;
    }
    float _2446 = _2326;
    float _2448 = _2446;
    if (_2426)
    {
        float _2450 = _2430 * _2442;
        _2434 = _2450;
    }
    float _2452 = _2434;
    if (_2426)
    {
        float _2454 = _2452 * 0.15915493667125701904296875;
        _2328 = _2454;
    }
    float _2456 = _2328;
    float _2458 = _2304;
    if (_2426)
    {
        float _2460 = _2456 * 6.283185482025146484375;
        float _2462 = sin(_2460);
        _2458 = _2462;
    }
    float _2464 = _2458;
    float _2466 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2468 = precise::max(0.0, _2466);
    float _2470 = _2402;
    float _2472 = _2468;
    float _2474 = _2466;
    if (_2426)
    {
        float _2476 = _2456 * 6.283185482025146484375;
        float _2478 = cos(_2476);
        _2470 = _2478;
    }
    float _2480 = _2470;
    float _2482 = -_2412;
    float _2484 = -_2468;
    float _2486 = fma(_2394, _2482, _2484);
    if (_2426)
    {
        float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2472 = _2488;
    }
    float _2490 = _2472;
    float _2492 = sqrt(_2408);
    float _2494 = _2464;
    float _2496 = _2490;
    if (_2426)
    {
        float _2498 = fma(_2464, _2490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2494 = _2498;
    }
    float _2500 = _2494;
    float _2502 = _2500;
    if (!_2426)
    {
        _2496 = _2416;
    }
    float _2504 = _2496;
    float _2506 = _2504;
    if (_2426)
    {
        float _2508 = _2480 + (-1.0);
        _2474 = _2508;
    }
    float _2510 = _2474;
    float _2512 = _2510;
    if (_2426)
    {
        float _2514 = _2446 * _2500;
        _1912 = _2514;
    }
    float _2516 = _1912;
    if (!_2426)
    {
        _2448 = _2414;
    }
    float _2518 = _2448;
    float _2520 = _2518;
    if (_2426)
    {
        float _2522 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2436 = _2522;
    }
    float _2524 = _2436;
    if (_2426)
    {
        float _2526 = _2414 * _2516;
        _2520 = _2526;
    }
    float _2528 = _2520;
    if (!_2426)
    {
        _2502 = _2486;
    }
    float _2530 = _2502;
    float _2532 = _2530;
    if (_2426)
    {
        float _2534 = _2416 * _2516;
        _2506 = _2534;
    }
    float _2536 = _2506;
    if (_2426)
    {
        float _2538 = fma(_2486, _2480, _2524);
        _2532 = _2538;
    }
    float _2540 = _2532;
    if (_2426)
    {
        float _2542 = _2528 * _2528;
        _2438 = _2542;
    }
    float _2544 = _2438;
    if (!_2426)
    {
        _2512 = _2420;
    }
    float _2546 = _2512;
    float _2548 = _2546;
    if (_2426)
    {
        float _2550 = _2536 * _2536;
        _2548 = _2550;
    }
    float _2552 = _2548;
    float _2554 = fma(_2540, _2540, _2544);
    float _2556 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2558 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2560 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2562 = _2554 + _2552;
    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2566 = fma(_2492, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2564);
    float _2568 = precise::clamp(_2566, 0.0, 1.0);
    float _2570 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2556);
    float _2572 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2574 = rsqrt(_2562);
    float _2576 = -_2568;
    float _2578 = _2576 + 1.0;
    float _2580 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2582 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2572);
    float _2584 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2560);
    float _2586 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2570);
    float _2588 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2580);
    float _2590 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2582);
    float _2592 = abs(_2578);
    float _2594 = log2(_2592);
    float _2596 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2584);
    float _2598 = _2586 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2600 = _2590 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2602 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2588);
    float _2604 = _2596 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2606 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2608 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2610 = _2574 * _2528;
    float _2612 = _2574 * _2540;
    float _2614 = _2574 * _2536;
    float _2616 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2608);
    float _2618 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2620 = -_2606;
    float _2622 = fma(_2620, _2558, 1.0);
    float _2624 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2626 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2616);
    float _2628 = -_2618;
    float _2630 = fma(_2612, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2628);
    float _2632 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2634 = log2(_2622);
    float _2636 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2638 = -_2614;
    float _2640 = fma(_2638, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2630);
    float _2642 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2644 = fma(_2640, -0.5, 0.5);
    float _2646 = fma(_2640, 0.5, 0.5);
    float _2648 = exp2(_2632);
    float _2650 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2626);
    float _2652 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2642);
    float _2654 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2636);
    float _2656 = _2612 + 1.0;
    float _2658 = fma(_2646, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2660 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2652);
    float _2662 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2654);
    float _2664 = 1.0 / _2650;
    float _2666 = fma(_2646, _2658, -0.212114393711090087890625);
    float _2668 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2660);
    float _2670 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2662);
    float _2672 = fma(_2646, _2666, 1.570728778839111328125);
    float _2674 = sqrt(_2644);
    float _2676 = -_2612;
    float _2678 = fma(_2648, _2656, _2676);
    float _2680 = _2634 * 0.693147182464599609375;
    float _2682 = fma(_2678, 0.5, 0.5);
    float _2684 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2686 = _2668 * _2664;
    float _2688 = _2670 * _2664;
    float _2690 = fma(_2686, 0.5, 0.5);
    float _2692 = fma(_2688, -0.5, 0.5);
    float _2694 = _2674 * 0.636619746685028076171875;
    float3 _6732 = float3(_2690, _2692, _2684);
    float _2696 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6732, float3(0.0), isnan(_6732)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6732, float3(0.0), isnan(_6732)), level(0.0)).x;
    float3 _6743 = float3(_2690, _2692, _2684);
    float4 _2699 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6743, float3(0.0), isnan(_6743)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6743, float3(0.0), isnan(_6743)), level(0.0)).xyzw;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2699.w;
    float _2709 = -_2672;
    float _2711 = fma(_2694, _2709, 1.0);
    float2 _6765 = float2(_2711, _2682);
    float3 _2715 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6765, float2(0.0), isnan(_6765)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6765, float2(0.0), isnan(_6765)), level(0.0)).xyz;
    float _2717 = _2715.x;
    float _2719 = _2715.y;
    float _2721 = _2715.z;
    float _2723 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2725 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2727 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2725);
    float _2729 = exp2(_2723);
    float _2731 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2727);
    float _2733 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2731);
    float _2735 = _2733 + _2650;
    float _2737 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2668;
    out.gl_Position.y = _2670;
    out.gl_Position.z = _2733;
    out.gl_Position.w = _2650;
    float _2739 = _2735 * 0.5;
    float _2741 = -_2729;
    float _2743 = _2741 + 1.0;
    out.m_45.x = _2737;
    float _2745 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2739;
    out.m_62.w = _2650;
    float _2747 = _2745 * _2696;
    float _2749 = -_2745;
    float _2751 = _2749 + 1.0;
    float _2753 = _2707 * _2747;
    float _2755 = _2707 * _2751;
    float _2757 = _2721 * _2747;
    float _2759 = fma(_2717, _2753, _2701);
    float _2761 = fma(_2719, _2753, _2703);
    float _2763 = fma(_2707, _2757, _2705);
    out.m_64.x = _2759;
    out.m_64.y = _2761;
    out.m_64.z = _2763;
    out.m_64.w = _2755;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _535 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2820 = as_type<float>(_99);
        out.gl_Position.z = _2820;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2889 = as_type<float>(_135);
        out.gl_Position.z = _2889;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    int _155 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _157 = _155 != 0;
    float _159 = _141 * _139;
    float _161 = 0.0;
    float _163 = _143;
    if (!_153)
    {
        float _165 = _143 * _143;
        float _167 = _165 * 0.5;
        _161 = _167;
    }
    float _169 = _161;
    float _171 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _173 = _169;
    if (!_153)
    {
        float _175 = _169 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    float _179 = in.m_47.x;
    float _181 = in.m_47.y;
    float _183 = in.m_47.z;
    float _185 = _171 * 6.283185482025146484375;
    float _187 = floor(_171);
    float _189 = _185 * 0.15915493667125701904296875;
    float _191 = _189 * 6.283185482025146484375;
    float _193 = cos(_191);
    float _195 = -_187;
    float _197 = _171 + _195;
    bool _199 = !_153;
    float _201 = _177;
    float _203 = _181;
    if (!_199)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _143 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _143);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _233;
    }
    float _235 = _201;
    bool _237 = !_153;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _143 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _163 = _257;
    }
    float _259 = _163;
    float _261 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = in.m_51.w;
    float _265 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _261 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _269 = in.m_42.x;
    float _271 = in.m_42.y;
    float _273 = in.m_42.z;
    float _275 = _261 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _277 = _261 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _279 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[8].x, _267);
    bool _281 = _197 < 0.5;
    float _283 = float(_281);
    float _285 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[8].y, _275);
    float _287 = fma(_265, (*spvDescriptorSet0.vp_c10)._m0[8].z, _277);
    float _289 = fma(_193, 0.5, 0.5);
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _293 = -_197;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_283;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _301 = -_289;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[10].x, _279);
    float _307 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[10].y, _285);
    float _309 = fma(_291, (*spvDescriptorSet0.vp_c10)._m0[10].z, _287);
    float _311 = _287;
    float _313 = _309;
    if (!_153)
    {
        float _315 = _117 * _117;
        float _317 = _315 * 0.5;
        _311 = _317;
    }
    float _319 = _311;
    float _321 = fma(_259, _179, _305);
    float _323 = fma(_259, _181, _307);
    float _325 = fma(_259, _183, _309);
    float _327 = _319;
    if (!_153)
    {
        _313 = _117;
    }
    float _329 = _313;
    float _331 = _329;
    if (!_153)
    {
        float _333 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _333;
    }
    float _335 = _327;
    bool _337 = !_153;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _351 = _117 * _343;
        float _353 = exp2(_351);
        float _355 = _349 * 0.693147182464599609375;
        float _357 = 1.0 / _355;
        float _359 = 1.0 / _347;
        float _361 = _353 + (-1.0);
        float _363 = -_361;
        float _365 = fma(_363, _357, _117);
        float _367 = _365 * _359;
        float _369 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _339 = _369;
    }
    float _371 = _339;
    bool _373 = !_153;
    if (!_373)
    {
        float _375 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _377 = log2(_375);
        float _379 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _381 = _379 + 1.0;
        float _383 = 1.0 / _381;
        float _385 = _117 * _377;
        float _387 = exp2(_385);
        float _389 = -_387;
        float _391 = _389 + 1.0;
        float _393 = _391 * _383;
        _331 = _393;
    }
    float _395 = _331;
    float _397 = fma(_323, _263, _271);
    float _399 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _401 = fma(_321, _263, _269);
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _405 = _403 != 0;
    int _407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _409 = _407 != 0;
    float _411 = fma(_325, _263, _273);
    float _413 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _415 = _399 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _417 = _399 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _419 = !_405;
    int _421 = _419 ? 0 : 1;
    float _423 = _399 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _425 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _427 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[8].x, _415);
    float _429 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[8].y, _417);
    int _431 = abs(_421);
    float _433 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[8].z, _423);
    bool _435 = !_157;
    int _437 = _435 ? 0 : 1;
    float _439 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[10].x, _427);
    float _441 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[10].y, _429);
    float _443 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[10].z, _433);
    int _445 = abs(_437);
    float _447 = fma(_395, _181, _441);
    float _449 = float(_431);
    float _451 = fma(_395, _179, _439);
    float _453 = -_447;
    float _455 = _323 + _453;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _459 = abs(_295);
    float _461 = _449 * _459;
    bool _463 = !_409;
    int _465 = _463 ? 0 : 1;
    float _467 = fma(_395, _183, _443);
    float _469 = float(_445);
    float _471 = _455 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _473 = abs(_465);
    float _475 = _455 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _477 = -_451;
    float _479 = _321 + _477;
    float _481 = _455 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _483 = float(_473);
    float _485 = -_467;
    float _487 = _325 + _485;
    float _489 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[4].x, _475);
    float _491 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[5].x, _471);
    float _493 = fma(_479, (*spvDescriptorSet0.vp_c10)._m0[6].x, _481);
    float _495 = fma(_469, _303, _461);
    float _497 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[4].z, _489);
    float _499 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[5].z, _491);
    float _501 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[6].z, _493);
    float _503 = abs(_299);
    float _505 = fma(_483, _503, _495);
    bool _507 = !_457;
    float _509 = _499;
    float _511 = _497;
    float _513 = _501;
    float _531;
    float _533;
    if (!_507)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _517 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _519 = float(_83);
        float _521 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _523 = _521 * _515;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _531 = _529;
        _533 = _519;
        _535 = true;
    }
    else
    {
        float _537 = float(_83);
        float _539 = 1.0 / _537;
        float _541 = _117 * _539;
        _531 = _541;
        _533 = _537;
    }
    _535 = false;
    float _543 = _531;
    float _545 = _533;
    float _547 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _549 = int(_547);
    float _551 = in.m_49.y;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _555 = _543 + _553;
    float _557 = in.m_49.z;
    float _559 = _397 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _561 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _563 = int(_561);
    float _565 = _397 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _567;
    float _571 = _137 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _573 = _137 + (-0.5);
    bool _575 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _577 = isnan(_543);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = float(_549);
    float _589 = 1.0 / _545;
    bool _591 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _593 = isnan(_543);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = -_585;
    float _605 = _603 + 1.0;
    float _607 = float(uint(_563));
    float _609 = 1.0 / _587;
    int _611 = ~_563;
    int _613 = _611 + 1;
    int _615 = ~_563;
    int _617 = _615 + 1;
    bool _619 = _563 == 0;
    float _621 = _557 * 2.0;
    float _623 = 1.0 / _607;
    float _625 = _117 * _609;
    float _627 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _629 = log2(_627);
    int _631 = as_type<int>(_623) + (-2);
    float _633 = trunc(_625);
    int _635 = int(_633);
    float _637 = 1.0 / _569;
    float _639 = float(uint(_635));
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _643 = _543 + _641;
    float _645 = as_type<float>(_631) * _639;
    float _647 = trunc(_645);
    float _649 = precise::max(_647, 0.0);
    uint _652 = uint(_649);
    int _654 = _613 * int(_652);
    int _656 = _654 + _635;
    float _658 = float(uint(_656));
    float _660 = as_type<float>(_631) * _658;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _664 = _662 != 0;
    float _666 = trunc(_660);
    float _668 = precise::max(_666, 0.0);
    uint _670 = uint(_668);
    bool _672 = !_664;
    float _674 = _672 ? 7.345489978790283203125 : 1.0;
    float _676 = float(_563);
    float _678 = _674 * _137;
    float _680 = floor(_678);
    int _682 = int(_652) + int(_670);
    float _684 = float(_635);
    int _686 = _617 * _682;
    int _688 = _686 + _635;
    bool _690 = _684 >= _676;
    bool _692 = isnan(_684);
    bool _694 = _690 || _692;
    bool _696 = isnan(_676);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    bool _702 = uint(_688) >= uint(_563);
    float _704 = trunc(_700);
    int _706 = int(_704);
    float _708 = -_680;
    float _710 = _678 + _708;
    bool _712 = !_702;
    int _714 = _712 ? 0 : (-1);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _718 = _716 != 0;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _726 = _724 != 0;
    float _728 = _710 * _676;
    int _730 = ~_682;
    int _732 = _730 + _714;
    int _734 = _732 + 1;
    float _736 = _117 * _676;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _740 = _738 != 0;
    float _742 = trunc(_728);
    int _744 = int(_742);
    int _746 = _563 * _734;
    int _748 = _746 + _635;
    float _750 = _736 * _589;
    bool _752 = !_718;
    int _754 = _752 ? 0 : 1;
    int _756 = ~_706;
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    bool _762 = !_619;
    int _764 = _762 ? _748 : (-1);
    float _766 = trunc(_750);
    int _768 = int(_766);
    bool _770 = !_740;
    int _772 = _770 ? 0 : 1;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _776 = _774 != 0;
    int _778 = _764 * _760;
    int _780 = _563 + (-1);
    int _782 = abs(_754);
    int _784 = abs(_772);
    int _786 = _706 * _780;
    int _788 = _786 + _778;
    bool _790 = !_722;
    int _792 = _790 ? 0 : 1;
    bool _794 = !_776;
    int _796 = _794 ? 0 : 1;
    int _798 = _744 * _784;
    int _800 = _798 + _635;
    int _802 = abs(_792);
    bool _804 = !_726;
    int _806 = _804 ? 0 : 1;
    int _808 = abs(_796);
    int _810 = _788 * _802;
    int _812 = abs(_806);
    int _814 = ~_563;
    int _816 = _814 + 1;
    int _818 = _768 * _782;
    int _820 = _818 + _810;
    int _822 = _800 * _812;
    int _824 = _822 + _820;
    int _826 = ~_563;
    int _828 = _826 + 1;
    int _830 = _744 * _808;
    int _832 = _830 + _824;
    float _834 = as_type<float>(int(gl_VertexIndex));
    float _836 = float(uint(_832));
    float _838 = as_type<float>(_631) * _836;
    float _840 = trunc(_838);
    float _842 = precise::max(_840, 0.0);
    uint _844 = uint(_842);
    int _846 = _828 * int(_844);
    int _848 = _846 + _832;
    float _850 = float(uint(_848));
    float _852 = as_type<float>(_631) * _850;
    float _854 = trunc(_852);
    float _856 = precise::max(_854, 0.0);
    uint _858 = uint(_856);
    int _860 = int(_844) + int(_858);
    float _862 = _137 * 2.0;
    int _864 = _816 * _860;
    int _866 = _864 + _832;
    float _868 = floor(_862);
    bool _870 = uint(_866) >= uint(_563);
    bool _872 = !_870;
    int _874 = _872 ? 0 : (-1);
    int _876 = ~_860;
    int _878 = _876 + _874;
    int _880 = _878 + 1;
    int _882 = _563 * _880;
    int _884 = _882 + _832;
    float _886 = _551 * 2.0;
    bool _888 = _868 > 0.0;
    bool _890 = _868 >= 0.0;
    bool _892 = isnan(_868);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    bool _900 = !_619;
    int _902 = _900 ? _884 : (-1);
    float _904 = floor(_886);
    int _906 = _898 ? 0 : 1;
    int _908 = _902 & 3;
    bool _910 = _908 != 0;
    int _912 = _902 & 3;
    bool _914 = _912 != 0;
    bool _916 = uint(_908) > 1u;
    int _918 = _914 ? 0 : 1;
    int _920 = ~_906;
    int _922 = _920 + 1;
    int _924 = _922 + 1;
    int _926 = ~_918;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    int _932 = _924;
    int _934 = _930;
    if (!_888)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _932 = _938;
    }
    int _940 = _932;
    bool _942 = _904 >= 0.0;
    bool _944 = isnan(_904);
    bool _946 = _942 || _944;
    bool _948 = isnan(0.0);
    bool _950 = _946 || _948;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _954 = _952 != 0;
    if (!_916)
    {
        int _956 = ~_918;
        int _958 = _956 + 1;
        _934 = _958;
    }
    int _960 = _934;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _962;
    bool _966 = _904 > 0.0;
    float _968 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _970 = _968 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _972 = _950 ? 0 : 1;
    float _974 = 1.0 / _964;
    bool _976 = !_954;
    int _978 = _976 ? 0 : 1;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[5].x, _559);
    int _994 = ~_972;
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    bool _1000 = !_910;
    int _1002 = _1000 ? 0 : 1;
    float _1004 = 1.0 / _970;
    float _1006 = _397 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1008 = !_986;
    int _1010 = _1008 ? 0 : 1;
    float _1012 = _137 + _551;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1016 = _1014 != 0;
    float _1018 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1006);
    int _1020 = _998;
    if (!_966)
    {
        int _1022 = ~_972;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = _1012 + (-1.0);
    float _1030 = _555 * _974;
    float _1032 = _117 * _629;
    int _1034 = as_type<int>(_834) & 1;
    bool _1036 = _1034 != 0;
    int _1038 = as_type<int>(_834) & 2;
    bool _1040 = _1038 != 0;
    float _1042 = floor(_621);
    float _1044 = fma(_401, (*spvDescriptorSet0.vp_c10)._m0[6].x, _565);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1048 = _543 + _1046;
    float _1050 = _643 * _1004;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1054 = exp2(_1032);
    float _1056 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1058 = _551 + _557;
    float _1060 = -_1052;
    float _1062 = fma(_571, 2.0, _1060);
    float _1064 = _137 + _557;
    bool _1066 = !_982;
    int _1068 = _1066 ? 0 : 1;
    float _1070 = _1058 + (-1.0);
    float _1072 = _1064 + (-1.0);
    bool _1074 = _1042 >= 0.0;
    bool _1076 = isnan(_1042);
    bool _1078 = _1074 || _1076;
    bool _1080 = isnan(0.0);
    bool _1082 = _1078 || _1080;
    float _1084 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1086 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1088 = isnan(_543);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    float _1098 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1100 = _1082 ? 0 : 1;
    float _1102 = _1048 * _637;
    float _1104 = -_1054;
    float _1106 = _1104 + 1.0;
    bool _1108 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1116 = _1112 || _1114;
    float _1118 = -_1096;
    float _1120 = _1118 + 1.0;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1126;
    float _1130 = _1116 ? _1106 : 0.0;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _1136 = _1042 > 0.0;
    float _1138 = fma(_1124, _1030, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _1140 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1142 = isnan(_543);
    bool _1144 = _1140 || _1142;
    bool _1146 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1148 = _1144 || _1146;
    float _1150 = float(_1148);
    float _1152 = _585 * _1120;
    float _1154 = fma(_1128, _1030, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1156 = float(uint(_800));
    float _1158 = _601 * _605;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1162 = 1.0 + _1160;
    float _1164 = -_601;
    float _1166 = _1164 + 1.0;
    float _1168 = as_type<float>(_631) * _1156;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1170;
    float _1174 = 1.0 / _1162;
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1176;
    float _1180 = _1150 * _1166;
    float _1182 = fma(_1134, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _1184 = ~_563;
    int _1186 = _1184 + 1;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1192 = _1138 * _1180;
    float _1194 = _1154 * _1180;
    float _1196 = trunc(_1168);
    float _1198 = precise::max(_1196, 0.0);
    uint _1200 = uint(_1198);
    int _1202 = abs(_1010);
    float _1204 = -_1150;
    float _1206 = _1204 + 1.0;
    bool _1208 = !_990;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = fma(_1190, _1050, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1214 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1192);
    int _1216 = ~_1100;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = _1130 * _1174;
    int _1224 = _1220;
    if (!_1136)
    {
        int _1226 = ~_1100;
        int _1228 = _1226 + 1;
        _1224 = _1228;
    }
    int _1230 = _1224;
    float _1232 = fma(_1182, _1158, _1214);
    float _1234 = float(_940);
    float _1236 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1194);
    float _1238 = float(_1202);
    float _1240 = fma(_1172, _1102, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _1242 = abs(_1068);
    int _1244 = _1186 * int(_1200);
    int _1246 = _1244 + _800;
    bool _1248 = uint(_908) >= 2u;
    float _1250 = _1238 * _1234;
    float _1252 = float(_1026);
    float _1254 = fma(_1178, _1102, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1256 = float(uint(_1246));
    float _1258 = _1250 * (-2.0);
    int _1260 = abs(_1210);
    float _1262 = -_117;
    float _1264 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1062);
    float _1266 = float(_1242);
    float _1268 = as_type<float>(_631) * _1256;
    int _1270 = _902 >> 31;
    float _1272 = in.m_56.x;
    float _1274 = in.m_56.y;
    float _1276 = in.m_56.z;
    float _1278 = float(_1260);
    int _1280 = _1270 & 3;
    float _1282 = trunc(_1268);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    float _1288 = float(_1230);
    float _1290 = _1278 * _1252;
    int _1292 = _902 + _1280;
    float _1294 = fma(_1084, _1258, _1084);
    int _1296 = _1248 ? 0 : 1;
    float _1298 = _1266 * _1288;
    bool _1300 = _908 != 3;
    float _1302 = _1290 * (-2.0);
    int _1304 = _1292 >> 2;
    float _1306 = _1298 * (-2.0);
    bool _1308 = !_1300;
    int _1310 = _1308 ? 0 : (-1);
    bool _1312 = _908 != 3;
    float _1314 = fma(_1056, _1306, _1056);
    int _1316 = ~_563;
    int _1318 = _1316 + 1;
    int _1320 = _1304 << 4;
    int _1322 = _1320 + 368;
    float _1324 = fma(_1258, _1274, _1274);
    uint _1326 = uint(int(uint(_1322) >> uint(2)));
    uint _1328 = uint(int(uint(int(_1326)) >> uint(2)));
    int _1330 = int(_1326) & 3;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[int(_1328)][_1330];
    int _1334 = int(_1326) + 1;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    int _1338 = _1334 & 3;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[int(_1336)][_1338];
    int _1342 = ~_1296;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    float _1348 = fma(_1306, _1272, _1272);
    int _1350 = int(_1200) + int(_1286);
    int _1352 = _1346;
    if (_1312)
    {
        int _1354 = ~_1296;
        int _1356 = _1354 + 1;
        _1352 = _1356;
    }
    int _1358 = _1352;
    float _1360 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1362 = int(_1360);
    int _1364 = _1322 + 8;
    uint _1366 = uint(int(uint(_1364) >> uint(2)));
    uint _1368 = uint(int(uint(int(_1366)) >> uint(2)));
    int _1370 = int(_1366) & 3;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[int(_1368)][_1370];
    int _1374 = int(_1366) + 1;
    uint _1376 = uint(int(uint(_1374) >> uint(2)));
    int _1378 = _1374 & 3;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[int(_1376)][_1378];
    int _1382 = _1318 * _1350;
    int _1384 = _1382 + _800;
    float _1386 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1388 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1348);
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1392 = abs(_1002);
    bool _1394 = uint(_1384) >= uint(_563);
    float _1396 = _551 + (-0.5);
    float _1398 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1390);
    int _1400 = abs(_1310);
    bool _1402 = !_1394;
    int _1404 = _1402 ? 0 : (-1);
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1324);
    bool _1408 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1410 = isnan(1.0);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1416 = _1412 || _1414;
    int _1418 = ~_1350;
    int _1420 = _1418 + _1404;
    int _1422 = _1420 + 1;
    bool _1424 = !_1416;
    float _1426 = _1424 ? _117 : _1222;
    float _1428 = _1386 * _137;
    int _1430 = abs(_1362);
    int _1432 = _563 * _1422;
    int _1434 = _1432 + _800;
    bool _1436 = _137 > 0.5;
    float _1438 = fma(_1426, _1294, _1406);
    float _1440 = fma(_1302, _1276, _1276);
    int _1442 = abs(_960);
    float _1444 = _1438 * 0.15915493667125701904296875;
    int _1446 = abs(_1358);
    float _1448 = fma(_1426, _1314, _1388);
    int _1450 = ~_1442;
    int _1452 = _1450 + 1;
    int _1454 = _1452 + 1;
    float _1456 = trunc(_1428);
    int _1458 = int(_1456);
    int _1460 = ~_1392;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    float _1466 = _1448 * 0.15915493667125701904296875;
    int _1468 = abs(_978);
    float _1470 = _557 + (-0.5);
    int _1472 = _1454 * as_type<int>(_1340);
    int _1474 = ~_1446;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    float _1480 = fma(_1098, _1302, _1098);
    float _1482 = float(uint(_1362));
    int _1484 = _1464 * as_type<int>(_1332);
    int _1486 = _1484 + _1472;
    int _1488 = ~_1400;
    int _1490 = _1488 + 1;
    int _1492 = _1490 + 1;
    float _1494 = _1444 * 6.283185482025146484375;
    float _1496 = sin(_1494);
    int _1498 = _1478 * as_type<int>(_1372);
    int _1500 = _1498 + _1486;
    bool _1502 = !_619;
    int _1504 = _1502 ? _1434 : (-1);
    int _1506 = ~_1468;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    int _1512 = _1492 * as_type<int>(_1380);
    int _1514 = _1512 + _1500;
    float _1516 = fma(_1470, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1440);
    float _1518 = 1.0 / _1482;
    float _1520 = float(uint(_1430));
    int _1522 = _1514 * _1510;
    float _1524 = fma(_1212, _1158, _1236);
    float _1526 = in.m_51.x;
    float _1528 = in.m_51.y;
    int _1530 = _1504 * _1468;
    int _1532 = _1530 + _1522;
    float _1534 = fma(_1240, _1152, _1232);
    float _1536 = 1.0 / _1520;
    float _1538 = fma(_1254, _1152, _1524);
    float _1540 = fma(_1426, _1480, _1516);
    float _1542 = float(uint(_1532));
    float _1544 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1546 = abs(_1532);
    float _1548 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1534);
    float _1550 = _1540 * 0.15915493667125701904296875;
    int _1552 = as_type<int>(_1518) + (-2);
    float _1554 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1538);
    float _1556 = _551 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1558 = _1444 * 6.283185482025146484375;
    float _1560 = cos(_1558);
    float _1562 = as_type<float>(_1552) * _1542;
    float _1564 = float(uint(_1546));
    float _1566 = fma(_1556, -2.0, _1544);
    int _1568 = as_type<int>(_1536) + (-2);
    int _1570 = ~_1362;
    int _1572 = _1570 + 1;
    float _1574 = trunc(_1562);
    float _1576 = precise::max(_1574, 0.0);
    uint _1578 = uint(_1576);
    float _1580 = _1548 * _1526;
    float _1582 = as_type<float>(_1568) * _1564;
    float _1584 = _1554 * _1528;
    bool _1586 = !_1036;
    float _1588 = _1586 ? (-0.5) : 0.5;
    float _1590 = _505 * _1580;
    int _1592 = ~_1430;
    int _1594 = _1592 + 1;
    float _1596 = _505 * _1584;
    float _1598 = _1466 * 6.283185482025146484375;
    float _1600 = sin(_1598);
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1604 = !_1040;
    float _1606 = _1604 ? (-0.5) : 0.5;
    float _1608 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1588);
    float _1610 = _1596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1612 = _551 > 0.5;
    float _1614 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1606);
    float _1616 = _1466 * 6.283185482025146484375;
    float _1618 = cos(_1616);
    int _1620 = _1572 * int(_1578);
    int _1622 = _1620 + _1532;
    float _1624 = _1602 * _1608;
    int _1626 = _1458 << 4;
    int _1628 = _1626 + 1712;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1632 = _1630 != 0;
    float _1634 = float(uint(_1622));
    float _1636 = _1550 * 6.283185482025146484375;
    float _1638 = sin(_1636);
    float _1640 = _1600 * _1560;
    float _1642 = _1610 * _1614;
    float _1644 = _1600 * _1496;
    float _1646 = as_type<float>(_1552) * _1634;
    float _1648 = trunc(_1582);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = _1550 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = _1618 * _1496;
    float _1660 = -_1658;
    float _1662 = fma(_1638, _1640, _1660);
    float _1664 = -_1640;
    float _1666 = fma(_1638, _1658, _1664);
    float _1668 = _1618 * _1560;
    int _1670 = _1594 * int(_1652);
    int _1672 = _1670 + _1546;
    float _1674 = float(uint(_1672));
    float _1676 = _1496 * _1656;
    float _1678 = _1656 * _1642;
    float _1680 = trunc(_1646);
    float _1682 = precise::max(_1680, 0.0);
    uint _1684 = uint(_1682);
    float _1686 = _1560 * _1656;
    float _1688 = fma(_1638, _1668, _1644);
    float _1690 = _1618 * _1678;
    float _1692 = -_1642;
    float _1694 = _1638 * _1692;
    float _1696 = fma(_1638, _1644, _1668);
    float _1698 = as_type<float>(_1568) * _1674;
    float _1700 = fma(_1688, _1624, _1690);
    float _1702 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1704 = _1600 * _1678;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1708 = trunc(_1698);
    float _1710 = precise::max(_1708, 0.0);
    uint _1712 = uint(_1710);
    float _1714 = fma(_1686, _1624, _1694);
    float _1716 = fma(_1666, _1702, _1700);
    float _1718 = fma(_1662, _1624, _1704);
    float _1720 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1706);
    float _1722 = fma(_1676, _1702, _1714);
    float _1724 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1726 = int(_1578) + int(_1684);
    float _1728 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1730 = fma(_1696, _1702, _1718);
    float _1732 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1724);
    float _1734 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1044);
    float _1736 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1728);
    float _1738 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1740 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1732);
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1744 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1736);
    int _1746 = int(_1652) + int(_1712);
    float _1748 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1750 = _1738 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1752 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1754 = _1628 + 8;
    uint _1756 = uint(int(uint(_1754) >> uint(2)));
    uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
    int _1760 = int(_1756) & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    float _1764 = _1742 + _1748;
    int _1766 = ~_1430;
    int _1768 = _1766 + 1;
    float _1770 = _1750 + _1752;
    int _1772 = ~_1362;
    int _1774 = _1772 + 1;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1778 = _1764 + _1776;
    float _1780 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _992);
    float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1784 = _1770 + _1782;
    uint _1786 = uint(int(uint(_1628) >> uint(2)));
    uint _1788 = uint(int(uint(int(_1786)) >> uint(2)));
    int _1790 = int(_1786) & 3;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[int(_1788)][_1790];
    int _1794 = int(_1786) + 1;
    uint _1796 = uint(int(uint(_1794) >> uint(2)));
    int _1798 = _1794 & 3;
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[int(_1796)][_1798];
    float _1802 = _1778 * _1778;
    int _1804 = _1768 * _1746;
    int _1806 = _1804 + _1546;
    float _1808 = -_1588;
    int _1810 = _1436 ? as_type<int>(_1808) : as_type<int>(_1588);
    int _1812 = _1774 * _1726;
    int _1814 = _1812 + _1532;
    float _1816 = fma(_1784, _1784, _1802);
    float _1818 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1820 = !_1632;
    float _1822 = _1820 ? _1588 : as_type<float>(_1810);
    float _1824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1826 = uint(_1814) >= uint(_1362);
    float _1828 = fma(_1722, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1818);
    int _1830 = _1532 ^ _1362;
    float _1832 = _1780 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1834 = !_1826;
    int _1836 = _1834 ? 0 : (-1);
    float _1838 = fma(_1730, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1828);
    uint _1840 = uint(int(uint(_1830) >> uint(31)));
    float _1842 = sqrt(_1816);
    int _1844 = ~_1726;
    int _1846 = _1844 + _1836;
    int _1848 = _1846 + 1;
    bool _1850 = uint(_1806) >= uint(_1430);
    int _1852 = ~int(_1840);
    int _1854 = _1852 + 1;
    int _1856 = _1362 * _1848;
    int _1858 = _1856 + _1532;
    bool _1860 = !_1850;
    int _1862 = _1860 ? 0 : (-1);
    float _1864 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1866 = _1362 == 0;
    float _1868 = _1838 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1870 = ~_1862;
    int _1872 = _1746 + _1870;
    int _1874 = _1872 + 1;
    float _1876 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1878 = -_1606;
    int _1880 = _1612 ? as_type<int>(_1878) : as_type<int>(_1606);
    float _1882 = _1832 + _1868;
    bool _1884 = !_1866;
    float _1886 = _1884 ? as_type<float>(_1858) : as_type<float>(0xffffffffu /* nan */);
    bool _1888 = _1842 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1890 = _1874 ^ _1854;
    bool _1892 = !_1016;
    float _1894 = _1892 ? _1606 : as_type<float>(_1880);
    float _1896 = float(as_type<int>(_1886));
    bool _1898 = _1362 == 0;
    int _1900 = ~_1854;
    int _1902 = _1900 + _1890;
    int _1904 = _1902 + 1;
    float _1906 = _1606;
    float _1908 = _1868;
    float _1910 = _1886;
    float _1912 = _1832;
    if (!_1888)
    {
        _1906 = _1770;
    }
    float _1914 = _1906;
    float _1916 = _1914;
    if (!_1888)
    {
        _1908 = _1764;
    }
    float _1918 = _1908;
    float _1920 = _1918;
    if (!_1888)
    {
        _1910 = _1882;
    }
    float _1922 = _1910;
    bool _1924 = !_1888;
    float _1926 = _1922;
    if (!_1924)
    {
        float _1928 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1932 = _1842 + _1930;
        float _1934 = rsqrt(_1816);
        float _1936 = _1932 * _1928;
        float _1938 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = _1936 * 0.15915493667125701904296875;
        float _1942 = _1940 * 6.283185482025146484375;
        float _1944 = cos(_1942);
        float _1946 = _1940 * 6.283185482025146484375;
        float _1948 = sin(_1946);
        float _1950 = _1944 + (-1.0);
        float _1952 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1954 = fma(_1948, _1938, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1956 = fma(_1882, _1944, _1952);
        float _1958 = _1934 * _1954;
        float _1960 = fma(_1784, _1958, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1962 = fma(_1778, _1958, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1926 = _1956;
        _1916 = _1960;
        _1920 = _1962;
    }
    float _1964 = _1926;
    float _1966 = _1916;
    float _1968 = _1920;
    bool _1970 = !_1898;
    int _1972 = _1970 ? _1904 : (-1);
    float _1974 = fma(_1876, _1896, _1264);
    float _1976 = _1822 + 0.5;
    float _1978 = -_1832;
    float _1980 = _1978 + _1964;
    float _1982 = float(_1972);
    float _1984 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1566);
    float _1986 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1988 = fma(_1876, _1976, _1974);
    float _1990 = -_1750;
    float _1992 = _1990 + _1966;
    float _1994 = _1980 * _1980;
    float _1996 = -_1984;
    float _1998 = fma(_1986, _1982, _1996);
    float _2000 = -_1742;
    float _2002 = _2000 + _1968;
    float _2004 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1398);
    float _2006 = fma(_1992, _1992, _1994);
    float _2008 = _1894 + (-0.5);
    float _2010 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1720);
    float _2012 = -_2004;
    float _2014 = _2012 + 1.0;
    float _2016 = fma(_2002, _2002, _2006);
    float _2018 = -_1986;
    float _2020 = fma(_2018, _2008, _1998);
    float _2022 = _1792 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2024 = sqrt(_2016);
    float _2026 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2028 = -_2014;
    float _2030 = fma(_1822, _2028, _1988);
    float _2032 = _1762 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2034 = -_2010;
    float _2036 = _2034 + 1.0;
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2042 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2044 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = fma(_1894, _2036, _2020);
    out.m_58.x = _2042;
    out.m_58.y = _2038;
    out.m_58.z = _2044;
    out.m_58.w = _2040;
    bool _2048 = _2024 > 0.0;
    out.m_60.x = _2030;
    out.m_60.y = _2046;
    bool _2050 = !_2048;
    float _2052 = _2030;
    float _2054 = _2038;
    float _2056 = _1966;
    float _2058 = _1964;
    float _2060 = _1968;
    float _2062 = _2046;
    float _2064 = _2030;
    float _2066 = _2042;
    float _2068 = _2044;
    float _2070 = _2038;
    if (!_2050)
    {
        bool _2072 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2074 = _2046;
        if (_2072)
        {
            float _2076 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2074 = _2076;
        }
        float _2078 = _2074;
        float _2080 = _2078;
        if (_2072)
        {
            float _2082 = _497 * _2078;
            _2052 = _2082;
        }
        float _2084 = _2052;
        float _2086 = _2084;
        float _2088 = _2084;
        if (_2072)
        {
            float _2090 = _499 * _2078;
            _2054 = _2090;
        }
        float _2092 = _2054;
        float _2094 = _2092;
        if (_2072)
        {
            float _2096 = _501 * _2078;
            _2080 = _2096;
        }
        float _2098 = _2080;
        float _2100 = _2098;
        if (!_2072)
        {
            float _2102 = _117 + 1.0;
            float _2104 = _2102;
            if (!_153)
            {
                float _2106 = _2102 * _2102;
                float _2108 = _2106 * 0.5;
                _2086 = _2108;
            }
            float _2110 = _2086;
            float _2112 = _2110;
            if (!_153)
            {
                float _2114 = _2110 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2112 = _2114;
            }
            float _2116 = _2112;
            bool _2118 = !_153;
            float _2120 = _2116;
            if (!_2118)
            {
                float _2122 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2124 = log2(_2122);
                float _2126 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2128 = _2124 * _2102;
                float _2130 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2132 = 1.0 + _2130;
                float _2134 = 1.0 / _2132;
                float _2136 = _2126 * 0.693147182464599609375;
                float _2138 = exp2(_2128);
                float _2140 = 1.0 / _2136;
                float _2142 = _2138 + (-1.0);
                float _2144 = -_2142;
                float _2146 = fma(_2144, _2140, _2102);
                float _2148 = _2146 * _2134;
                float _2150 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2120 = _2150;
            }
            float _2152 = _2120;
            float _2154 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2156 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2158 = _2152 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2160 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2162 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2164 = _2154 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2166 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2160);
            float _2168 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2162);
            float _2170 = fma(_2158, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2166);
            bool _2172 = !_153;
            if (!_2172)
            {
                float _2174 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2176 = log2(_2174);
                float _2178 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2180 = 1.0 + _2178;
                float _2182 = 1.0 / _2180;
                float _2184 = _2176 * _2102;
                float _2186 = exp2(_2184);
                float _2188 = -_2186;
                float _2190 = _2188 + 1.0;
                float _2192 = _2190 * _2182;
                _2104 = _2192;
            }
            float _2194 = _2104;
            float _2196 = fma(_2156, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2164);
            float _2198 = fma(_2158, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2168);
            float _2200 = fma(_2194, _181, _2170);
            float _2202 = fma(_2158, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2196);
            float _2204 = fma(_2194, _179, _2198);
            float _2206 = -_447;
            float _2208 = _2206 + _2200;
            float _2210 = fma(_2194, _183, _2202);
            float _2212 = -_451;
            float _2214 = _2212 + _2204;
            float _2216 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2218 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2220 = _2208 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2222 = -_467;
            float _2224 = _2222 + _2210;
            float _2226 = fma(_2214, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2216);
            float _2228 = fma(_2214, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2218);
            float _2230 = fma(_2214, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2220);
            float _2232 = fma(_2224, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2226);
            float _2234 = fma(_2224, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2228);
            float _2236 = fma(_2224, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2230);
            _509 = _2234;
            _511 = _2232;
            _513 = _2236;
            _2088 = _2232;
            _2094 = _2234;
            _2100 = _2236;
        }
        float _2238 = _509;
        float _2240 = _511;
        float _2242 = _513;
        float _2244 = _2088;
        float _2246 = _2094;
        float _2248 = _2100;
        float _2250 = _2238 * _2238;
        float _2252 = rsqrt(_2016);
        float _2254 = fma(_2240, _2240, _2250);
        float _2256 = fma(_2242, _2242, _2254);
        float _2258 = sqrt(_2256);
        float _2260 = _1992 * _2252;
        float _2262 = _1980 * _2252;
        float _2264 = _2002 * _2252;
        bool _2266 = _2258 > 0.0;
        bool _2268 = !_2266;
        _2062 = _2248;
        _2064 = _2244;
        _203 = _2254;
        _2066 = _2260;
        _2068 = _2256;
        _2070 = _2246;
        if (!_2268)
        {
            float _2270 = rsqrt(_2256);
            float _2272 = _2270 * _2238;
            float _2274 = _2270 * _2240;
            float _2276 = _2270 * _2242;
            float _2278 = _2262 * _2272;
            float _2280 = fma(_2260, _2274, _2278);
            float _2282 = fma(_2264, _2276, _2280);
            float _2284 = _2282 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2286 = fma(_2244, _2284, _1966);
            float _2288 = fma(_2246, _2284, _1964);
            float _2290 = fma(_2248, _2284, _1968);
            _2056 = _2286;
            _2058 = _2288;
            _2060 = _2290;
            _203 = _2276;
        }
    }
    float _2292 = _2056;
    float _2294 = _2058;
    float _2296 = _2060;
    float _2298 = _2062;
    float _2300 = _2064;
    float _2302 = _203;
    float _2304 = _2066;
    float _2306 = _2068;
    float _2308 = _2070;
    bool _2310 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2312 = isnan(0.5);
    bool _2314 = _2310 || _2312;
    bool _2316 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2318 = _2314 || _2316;
    float _2320 = _2300;
    float _2322 = _2298;
    float _2324 = _2302;
    float _2326 = _2308;
    float _2328 = _2306;
    if (_2318)
    {
        _2320 = _2292;
    }
    float _2330 = _2320;
    float _2332 = _2330;
    if (_2318)
    {
        _2322 = _2294;
    }
    float _2334 = _2322;
    float _2336 = _2334;
    if (_2318)
    {
        _2324 = _2296;
    }
    float _2338 = _2324;
    float _2340 = _2338;
    if (!_2318)
    {
        float _2342 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2344 = _1832 + _2342;
        float _2346 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2348 = _1750 + _2346;
        float _2350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2352 = -_1750;
        float _2354 = _2352 + _2292;
        float _2356 = _2344 * _2344;
        float _2358 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2360 = _1742 + _2358;
        float _2362 = -_1832;
        float _2364 = _2362 + _2294;
        float _2366 = -_1742;
        float _2368 = _2366 + _2296;
        float _2370 = fma(_2348, _2348, _2356);
        float _2372 = fma(_2360, _2360, _2370);
        float _2374 = sqrt(_2372);
        float _2376 = precise::min(_2374, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2378 = _2376 * _2350;
        float _2380 = fma(_2354, _2378, _1750);
        float _2382 = fma(_2364, _2378, _1832);
        float _2384 = fma(_2368, _2378, _1742);
        _2336 = _2382;
        _2332 = _2380;
        _2340 = _2384;
    }
    float _2386 = _2336;
    float _2388 = _2332;
    float _2390 = _2340;
    float _2392 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2394 = _2386 + _2392;
    float _2396 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2398 = _2388 + _2396;
    float _2400 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2402 = _2390 + _2400;
    float _2404 = _2394 * _2394;
    float _2406 = fma(_2398, _2398, _2404);
    float _2408 = fma(_2402, _2402, _2406);
    float _2410 = rsqrt(_2408);
    float _2412 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2414 = _2398 * _2412;
    float _2416 = _2402 * _2412;
    float _2418 = _2414 * _2414;
    float _2420 = _2416 * _2416;
    float _2422 = _2418 + _2420;
    float _2424 = sqrt(_2422);
    bool _2426 = _2424 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2430 = _2424 + _2428;
    float _2432 = _2410;
    float _2434 = _2430;
    float _2436 = _2412;
    float _2438 = _2418;
    if (_2426)
    {
        float _2440 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2432 = _2440;
    }
    float _2442 = _2432;
    if (_2426)
    {
        float _2444 = rsqrt(_2422);
        _2326 = _2444;
    }
    float _2446 = _2326;
    float _2448 = _2446;
    if (_2426)
    {
        float _2450 = _2430 * _2442;
        _2434 = _2450;
    }
    float _2452 = _2434;
    if (_2426)
    {
        float _2454 = _2452 * 0.15915493667125701904296875;
        _2328 = _2454;
    }
    float _2456 = _2328;
    float _2458 = _2304;
    if (_2426)
    {
        float _2460 = _2456 * 6.283185482025146484375;
        float _2462 = sin(_2460);
        _2458 = _2462;
    }
    float _2464 = _2458;
    float _2466 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2468 = precise::max(0.0, _2466);
    float _2470 = _2402;
    float _2472 = _2468;
    float _2474 = _2466;
    if (_2426)
    {
        float _2476 = _2456 * 6.283185482025146484375;
        float _2478 = cos(_2476);
        _2470 = _2478;
    }
    float _2480 = _2470;
    float _2482 = -_2412;
    float _2484 = -_2468;
    float _2486 = fma(_2394, _2482, _2484);
    if (_2426)
    {
        float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2472 = _2488;
    }
    float _2490 = _2472;
    float _2492 = sqrt(_2408);
    float _2494 = _2464;
    float _2496 = _2490;
    if (_2426)
    {
        float _2498 = fma(_2464, _2490, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2494 = _2498;
    }
    float _2500 = _2494;
    float _2502 = _2500;
    if (!_2426)
    {
        _2496 = _2416;
    }
    float _2504 = _2496;
    float _2506 = _2504;
    if (_2426)
    {
        float _2508 = _2480 + (-1.0);
        _2474 = _2508;
    }
    float _2510 = _2474;
    float _2512 = _2510;
    if (_2426)
    {
        float _2514 = _2446 * _2500;
        _1912 = _2514;
    }
    float _2516 = _1912;
    if (!_2426)
    {
        _2448 = _2414;
    }
    float _2518 = _2448;
    float _2520 = _2518;
    if (_2426)
    {
        float _2522 = _2510 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2436 = _2522;
    }
    float _2524 = _2436;
    if (_2426)
    {
        float _2526 = _2414 * _2516;
        _2520 = _2526;
    }
    float _2528 = _2520;
    if (!_2426)
    {
        _2502 = _2486;
    }
    float _2530 = _2502;
    float _2532 = _2530;
    if (_2426)
    {
        float _2534 = _2416 * _2516;
        _2506 = _2534;
    }
    float _2536 = _2506;
    if (_2426)
    {
        float _2538 = fma(_2486, _2480, _2524);
        _2532 = _2538;
    }
    float _2540 = _2532;
    if (_2426)
    {
        float _2542 = _2528 * _2528;
        _2438 = _2542;
    }
    float _2544 = _2438;
    if (!_2426)
    {
        _2512 = _2420;
    }
    float _2546 = _2512;
    float _2548 = _2546;
    if (_2426)
    {
        float _2550 = _2536 * _2536;
        _2548 = _2550;
    }
    float _2552 = _2548;
    float _2554 = fma(_2540, _2540, _2544);
    float _2556 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2558 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2560 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2562 = _2554 + _2552;
    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2566 = fma(_2492, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2564);
    float _2568 = precise::clamp(_2566, 0.0, 1.0);
    float _2570 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2556);
    float _2572 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2574 = rsqrt(_2562);
    float _2576 = -_2568;
    float _2578 = _2576 + 1.0;
    float _2580 = _2386 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2582 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2572);
    float _2584 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2560);
    float _2586 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2570);
    float _2588 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2580);
    float _2590 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2582);
    float _2592 = abs(_2578);
    float _2594 = log2(_2592);
    float _2596 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2584);
    float _2598 = _2586 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2600 = _2590 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2602 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2588);
    float _2604 = _2596 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2606 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2608 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2610 = _2574 * _2528;
    float _2612 = _2574 * _2540;
    float _2614 = _2574 * _2536;
    float _2616 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2608);
    float _2618 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2620 = -_2606;
    float _2622 = fma(_2620, _2558, 1.0);
    float _2624 = _2602 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2626 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2616);
    float _2628 = -_2618;
    float _2630 = fma(_2612, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2628);
    float _2632 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2634 = log2(_2622);
    float _2636 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2638 = -_2614;
    float _2640 = fma(_2638, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2630);
    float _2642 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2644 = fma(_2640, -0.5, 0.5);
    float _2646 = fma(_2640, 0.5, 0.5);
    float _2648 = exp2(_2632);
    float _2650 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2626);
    float _2652 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2642);
    float _2654 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2636);
    float _2656 = _2612 + 1.0;
    float _2658 = fma(_2646, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2660 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2652);
    float _2662 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2654);
    float _2664 = 1.0 / _2650;
    float _2666 = fma(_2646, _2658, -0.212114393711090087890625);
    float _2668 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2660);
    float _2670 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2662);
    float _2672 = fma(_2646, _2666, 1.570728778839111328125);
    float _2674 = sqrt(_2644);
    float _2676 = -_2612;
    float _2678 = fma(_2648, _2656, _2676);
    float _2680 = _2634 * 0.693147182464599609375;
    float _2682 = fma(_2678, 0.5, 0.5);
    float _2684 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2686 = _2668 * _2664;
    float _2688 = _2670 * _2664;
    float _2690 = fma(_2686, 0.5, 0.5);
    float _2692 = fma(_2688, -0.5, 0.5);
    float _2694 = _2674 * 0.636619746685028076171875;
    float3 _6732 = float3(_2690, _2692, _2684);
    float _2696 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6732, float3(0.0), isnan(_6732)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6732, float3(0.0), isnan(_6732)), level(0.0)).x;
    float3 _6743 = float3(_2690, _2692, _2684);
    float4 _2699 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6743, float3(0.0), isnan(_6743)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6743, float3(0.0), isnan(_6743)), level(0.0)).xyzw;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2699.w;
    float _2709 = -_2672;
    float _2711 = fma(_2694, _2709, 1.0);
    float2 _6765 = float2(_2711, _2682);
    float3 _2715 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6765, float2(0.0), isnan(_6765)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6765, float2(0.0), isnan(_6765)), level(0.0)).xyz;
    float _2717 = _2715.x;
    float _2719 = _2715.y;
    float _2721 = _2715.z;
    float _2723 = _2594 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2725 = _2600 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2727 = fma(_2604, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2725);
    float _2729 = exp2(_2723);
    float _2731 = fma(_2598, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2727);
    float _2733 = fma(_2624, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2731);
    float _2735 = _2733 + _2650;
    float _2737 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2668;
    out.gl_Position.y = _2670;
    out.gl_Position.z = _2733;
    out.gl_Position.w = _2650;
    float _2739 = _2735 * 0.5;
    float _2741 = -_2729;
    float _2743 = _2741 + 1.0;
    out.m_45.x = _2737;
    float _2745 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2739;
    out.m_62.w = _2650;
    float _2747 = _2745 * _2696;
    float _2749 = -_2745;
    float _2751 = _2749 + 1.0;
    float _2753 = _2707 * _2747;
    float _2755 = _2707 * _2751;
    float _2757 = _2721 * _2747;
    float _2759 = fma(_2717, _2753, _2701);
    float _2761 = fma(_2719, _2753, _2703);
    float _2763 = fma(_2707, _2757, _2705);
    out.m_64.x = _2759;
    out.m_64.y = _2761;
    out.m_64.z = _2763;
    out.m_64.w = _2755;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

