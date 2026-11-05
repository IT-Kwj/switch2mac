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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _553 = false;
    bool _335 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3618 = as_type<float>(_113);
        out.gl_Position.z = _3618;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3687 = as_type<float>(_151);
        out.gl_Position.z = _3687;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _157 = in.m_52.w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = in.m_47.x;
    float _171 = in.m_47.y;
    float _173 = in.m_47.z;
    float _175 = in.m_42.x;
    float _177 = in.m_42.y;
    float _179 = in.m_42.z;
    int _181 = as_type<int>(_153) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_153) & 2;
    bool _187 = _185 != 0;
    float _189 = _153;
    if (!_167)
    {
        float _191 = _155 * _155;
        float _193 = _191 * 0.5;
        _189 = _193;
    }
    float _195 = _189;
    bool _197 = !_183;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _195;
    if (!_167)
    {
        float _203 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_187;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_167;
    float _213 = _205;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _155 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _155);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _251 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _255 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _257 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _259 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[8].x, _253);
    float _261 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[8].y, _255);
    float _263 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[8].z, _257);
    float _265 = _255;
    if (!_167)
    {
        _265 = _155;
    }
    float _267 = _265;
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[10].x, _259);
    bool _271 = !_167;
    float _273 = _267;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _155 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _273 = _293;
    }
    float _295 = _273;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _299 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[10].y, _261);
    float _301 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[10].z, _263);
    float _303 = fma(_295, _169, _269);
    float _305 = fma(_295, _171, _299);
    float _307 = fma(_295, _173, _301);
    float _309 = fma(_303, _157, _175);
    float _311 = fma(_305, _157, _177);
    float _313 = fma(_307, _157, _179);
    bool _315 = !_297;
    float _333;
    if (!_315)
    {
        float _317 = in.m_54.x;
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _321 = _317 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        float _337 = float(_97);
        float _339 = 1.0 / _337;
        float _341 = _131 * _339;
        _333 = _341;
    }
    _335 = false;
    float _343 = _333;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _343 + _345;
    float _349 = in.m_54.x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _343 + _363;
    float _367 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _369 = 1.0 / _353;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _373 = 1.0 / _361;
    float _375 = 1.0 / _357;
    float _377 = _347 * _369;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = _343 + _379;
    bool _383 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _385 = isnan(_343);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _395;
    float _399 = _367 * _349;
    float _401 = _381 * _373;
    bool _403 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _405 = isnan(_343);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _415;
    float _419 = trunc(_399);
    int _421 = int(_419);
    float _423 = -_413;
    float _425 = _423 + 1.0;
    float _427 = fma(_417, _377, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = _365 * _375;
    bool _431 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _433 = isnan(_343);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = _393 * _425;
    float _445 = -_393;
    float _447 = _445 + 1.0;
    float _449 = fma(_397, _377, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _451 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _453 = isnan(_343);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = _441 * _447;
    float _473 = -_441;
    float _475 = _473 + 1.0;
    float _477 = fma(_465, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = fma(_469, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _481 = _461 * _475;
    float _483 = in.m_52.x;
    float _485 = in.m_52.y;
    float _487 = -_461;
    float _489 = _487 + 1.0;
    float _491 = _449 * _481;
    float _493 = _427 * _481;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _499;
    float _503 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _505 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _493);
    float _507 = fma(_497, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _509 = fma(_501, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_477, _471, _503);
    float _513 = fma(_479, _471, _505);
    float _515 = fma(_507, _443, _511);
    float _517 = fma(_509, _443, _513);
    float _519 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[146].x, _515);
    float _521 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[146].y, _517);
    int _523 = _421 << 4;
    int _525 = _523 + 1712;
    float _527 = _519 * _483;
    float _529 = _521 * _485;
    bool _531 = !_371;
    float _533 = _511;
    float _535 = _401;
    float _551;
    if (!_531)
    {
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _539 = _349 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_97);
        float _557 = 1.0 / _555;
        float _559 = _131 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _565 = int(_563);
    float _567 = in.m_54.y;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _571 = _569 != 0;
    float _573 = in.m_54.w;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _577 = int(_575);
    float _579 = float(_565);
    float _581 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _583 = int(_581);
    if (_571)
    {
        _533 = 1.0;
    }
    float _585 = _533;
    float _587 = _585;
    if (!_571)
    {
        _587 = 7.345489978790283203125;
    }
    float _589 = _587;
    float _591 = 0.0;
    if (_571)
    {
        _591 = 1.0;
    }
    float _593 = _591;
    float _595 = float(_577);
    float _597 = 1.0 / _579;
    float _599 = _589 * _349;
    bool _601 = _567 > 0.5;
    float _603 = _593;
    if (_571)
    {
        _535 = _349;
    }
    float _605 = _535;
    float _607 = 1.0 / _595;
    float _609 = float(uint(_583));
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _613 = int(_611);
    float _615 = _597 * _131;
    float _617 = 1.0 / _609;
    float _619 = _607 * _131;
    float _621 = trunc(_615);
    int _623 = int(_621);
    float _625 = float(uint(_613));
    int _627 = ~_613;
    int _629 = _627 + 1;
    int _631 = ~_613;
    int _633 = _631 + 1;
    float _635 = 1.0 / _625;
    int _637 = as_type<int>(_617) + (-2);
    float _639 = trunc(_619);
    int _641 = int(_639);
    float _643 = float(uint(_623));
    float _645 = in.m_54.z;
    float _647 = as_type<float>(_637) * _643;
    int _649 = as_type<int>(_635) + (-2);
    float _651 = floor(_599);
    int _653 = ~_583;
    int _655 = _653 + 1;
    float _657 = float(uint(_641));
    float _659 = trunc(_647);
    float _661 = precise::max(_659, 0.0);
    uint _664 = uint(_661);
    float _666 = as_type<float>(_649) * _657;
    float _668 = trunc(_666);
    float _670 = precise::max(_668, 0.0);
    uint _672 = uint(_670);
    int _674 = ~_613;
    int _676 = _674 + 1;
    float _678 = -_651;
    float _680 = _599 + _678;
    bool _682 = _645 > 0.5;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _686 = _684 != 0;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _690 = _688 != 0;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _694 = _692 != 0;
    int _696 = _655 * int(_664);
    int _698 = _696 + _623;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _702 = _700 != 0;
    float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _706 = float(uint(_698));
    bool _708 = !_702;
    int _710 = _708 ? 0 : 1;
    int _712 = _676 * int(_672);
    int _714 = _712 + _641;
    float _716 = as_type<float>(_637) * _706;
    float _718 = -_199;
    int _720 = _601 ? as_type<int>(_718) : as_type<int>(_199);
    float _722 = float(uint(_714));
    float _724 = trunc(_716);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = -_209;
    int _732 = _682 ? as_type<int>(_730) : as_type<int>(_209);
    bool _734 = !_690;
    float _736 = _734 ? _199 : as_type<float>(_720);
    float _738 = as_type<float>(_649) * _722;
    bool _740 = !_694;
    float _742 = _740 ? _209 : as_type<float>(_732);
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _746 = _744 != 0;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _750 = _748 != 0;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _758 = _756 != 0;
    float _760 = trunc(_738);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    float _766 = float(_97);
    bool _768 = !_750;
    int _770 = _768 ? 0 : 1;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _774 = _772 != 0;
    bool _776 = !_758;
    int _778 = _776 ? 0 : 1;
    float _780 = 1.0 / _766;
    int _782 = int(_664) + int(_728);
    int _784 = ~_583;
    int _786 = _784 + 1;
    bool _788 = _573 > 0.5;
    float _790 = float(_623);
    int _792 = _786 * _782;
    int _794 = _792 + _623;
    int _796 = int(_672) + int(_764);
    float _798 = _605;
    if (!_774)
    {
        _603 = 1.2345600128173828125;
    }
    float _800 = _603;
    if (!_774)
    {
        _798 = _567;
    }
    float _802 = _798;
    int _804 = _629 * _796;
    int _806 = _804 + _641;
    float _808 = float(_583);
    float _810 = _780 * _131;
    float _812 = float(_613);
    float _814 = _800 * _802;
    bool _816 = _790 >= _808;
    bool _818 = isnan(_790);
    bool _820 = _816 || _818;
    bool _822 = isnan(_808);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = _680 * _808;
    float _830 = -_209;
    int _832 = _788 ? as_type<int>(_830) : as_type<int>(_209);
    float _834 = floor(_814);
    bool _836 = uint(_794) >= uint(_583);
    float _838 = _808 * _810;
    float _840 = float(_641);
    bool _842 = uint(_806) >= uint(_613);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _846 = _844 != 0;
    float _848 = trunc(_826);
    int _850 = int(_848);
    bool _852 = !_836;
    int _854 = _852 ? 0 : (-1);
    bool _856 = _840 >= _812;
    bool _858 = isnan(_840);
    bool _860 = _856 || _858;
    bool _862 = isnan(_812);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    bool _868 = !_842;
    int _870 = _868 ? 0 : (-1);
    bool _872 = !_686;
    float _874 = _872 ? _209 : as_type<float>(_832);
    float _876 = -_834;
    float _878 = _814 + _876;
    bool _880 = !_846;
    int _882 = _880 ? 0 : 1;
    float _884 = trunc(_866);
    int _886 = int(_884);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _902 = _900 != 0;
    int _904 = ~_782;
    int _906 = _904 + _854;
    int _908 = _906 + 1;
    int _910 = ~_796;
    int _912 = _910 + _870;
    int _914 = _912 + 1;
    int _916 = abs(_710);
    float _918 = _878 * _812;
    bool _920 = !_894;
    int _922 = _920 ? 0 : 1;
    int _924 = _583 * _908;
    int _926 = _924 + _623;
    bool _928 = _583 == 0;
    float _930 = trunc(_838);
    int _932 = int(_930);
    int _934 = ~_850;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    int _940 = _613 * _914;
    int _942 = _940 + _641;
    bool _944 = !_928;
    int _946 = _944 ? _926 : (-1);
    float _948 = _812 * _810;
    int _950 = abs(_770);
    bool _952 = !_746;
    int _954 = _952 ? 0 : 1;
    int _956 = _946 * _938;
    float _958 = trunc(_918);
    int _960 = int(_958);
    int _962 = _583 + (-1);
    bool _964 = _613 == 0;
    int _966 = abs(_882);
    int _968 = _850 * _962;
    int _970 = _968 + _956;
    float _972 = trunc(_828);
    int _974 = int(_972);
    int _976 = ~_886;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    bool _982 = !_964;
    int _984 = _982 ? _942 : (-1);
    int _986 = _970 * _950;
    int _988 = abs(_954);
    float _990 = trunc(_948);
    int _992 = int(_990);
    bool _994 = !_754;
    int _996 = _994 ? 0 : 1;
    int _998 = _984 * _980;
    int _1000 = _613 + (-1);
    int _1002 = _932 * _988;
    int _1004 = _1002 + _986;
    bool _1006 = !_898;
    int _1008 = _1006 ? 0 : 1;
    int _1010 = _960 * _966;
    int _1012 = _1010 + _641;
    int _1014 = abs(_996);
    int _1016 = _974 * _916;
    int _1018 = _1016 + _623;
    int _1020 = abs(_778);
    int _1022 = _886 * _1000;
    int _1024 = _1022 + _998;
    bool _1026 = !_890;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _1018 * _1014;
    int _1032 = _1030 + _1004;
    int _1034 = abs(_922);
    int _1036 = abs(_1008);
    int _1038 = _1024 * _1034;
    bool _1040 = !_902;
    int _1042 = _1040 ? 0 : 1;
    int _1044 = abs(_1028);
    int _1046 = _974 * _1020;
    int _1048 = _1046 + _1032;
    int _1050 = abs(_1042);
    int _1052 = _992 * _1044;
    int _1054 = _1052 + _1038;
    float _1056 = float(uint(_1048));
    int _1058 = _1012 * _1036;
    int _1060 = _1058 + _1054;
    float _1062 = float(uint(_1018));
    int _1064 = ~_583;
    int _1066 = _1064 + 1;
    int _1068 = _960 * _1050;
    int _1070 = _1068 + _1060;
    float _1072 = as_type<float>(_637) * _1056;
    float _1074 = as_type<float>(_637) * _1062;
    int _1076 = ~_613;
    int _1078 = _1076 + 1;
    float _1080 = trunc(_1072);
    float _1082 = precise::max(_1080, 0.0);
    uint _1084 = uint(_1082);
    float _1086 = float(uint(_1070));
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1090 = _1088 != 0;
    float _1092 = as_type<float>(_649) * _1086;
    int _1094 = ~_583;
    int _1096 = _1094 + 1;
    float _1098 = trunc(_1074);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = trunc(_1092);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    int _1110 = _1096 * int(_1084);
    int _1112 = _1110 + _1048;
    float _1114 = float(uint(_1112));
    float _1116 = as_type<float>(_637) * _1114;
    int _1118 = _1066 * int(_1102);
    int _1120 = _1118 + _1018;
    int _1122 = _1078 * int(_1108);
    int _1124 = _1122 + _1070;
    float _1126 = trunc(_1116);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = float(uint(_1120));
    int _1134 = ~_583;
    int _1136 = _1134 + 1;
    float _1138 = float(uint(_1124));
    float _1140 = as_type<float>(_637) * _1132;
    float _1142 = float(uint(_1012));
    float _1144 = as_type<float>(_649) * _1138;
    float _1146 = trunc(_1140);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    float _1152 = as_type<float>(_649) * _1142;
    int _1154 = int(_1084) + int(_1130);
    float _1156 = trunc(_1144);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    int _1162 = _1136 * _1154;
    int _1164 = _1162 + _1048;
    bool _1166 = uint(_1164) >= uint(_583);
    float _1168 = trunc(_1152);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = ~_613;
    int _1176 = _1174 + 1;
    int _1178 = int(_1102) + int(_1150);
    bool _1180 = !_1166;
    int _1182 = _1180 ? 0 : (-1);
    int _1184 = int(_1108) + int(_1160);
    int _1186 = ~_1154;
    int _1188 = _1186 + _1182;
    int _1190 = _1188 + 1;
    int _1192 = _1176 * _1184;
    int _1194 = _1192 + _1070;
    int _1196 = _583 * _1190;
    int _1198 = _1196 + _1048;
    bool _1200 = uint(_1194) >= uint(_613);
    int _1202 = _1078 * int(_1172);
    int _1204 = _1202 + _1012;
    bool _1206 = !_928;
    int _1208 = _1206 ? _1198 : (-1);
    int _1210 = _1136 * _1178;
    int _1212 = _1210 + _1018;
    bool _1214 = !_1200;
    int _1216 = _1214 ? 0 : (-1);
    float _1218 = float(uint(_1204));
    int _1220 = ~_1184;
    int _1222 = _1220 + _1216;
    int _1224 = _1222 + 1;
    bool _1226 = uint(_1212) >= uint(_583);
    float _1228 = as_type<float>(_649) * _1218;
    int _1230 = _1208 >> 31;
    int _1232 = _613 * _1224;
    int _1234 = _1232 + _1070;
    bool _1236 = !_1226;
    int _1238 = _1236 ? 0 : (-1);
    float _1240 = trunc(_1228);
    float _1242 = precise::max(_1240, 0.0);
    uint _1244 = uint(_1242);
    int _1246 = _1230 & 3;
    int _1248 = _1208 & 3;
    bool _1250 = _1248 != 0;
    int _1252 = _1208 & 3;
    bool _1254 = _1252 != 0;
    int _1256 = _1208 + _1246;
    int _1258 = ~_1178;
    int _1260 = _1258 + _1238;
    int _1262 = _1260 + 1;
    bool _1264 = !_964;
    int _1266 = _1264 ? _1234 : (-1);
    int _1268 = _1256 >> 2;
    int _1270 = _583 * _1262;
    int _1272 = _1270 + _1018;
    int _1274 = _1266 >> 31;
    bool _1276 = !_1250;
    int _1278 = _1276 ? 0 : 1;
    bool _1280 = uint(_1248) >= 2u;
    int _1282 = _1268 << 4;
    int _1284 = _1282 + 368;
    int _1286 = _1274 & 3;
    int _1288 = _1280 ? 0 : 1;
    uint _1290 = uint(int(uint(_1284) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[int(_1300)][_1302];
    bool _1306 = _1248 != 3;
    int _1308 = _1266 + _1286;
    float _1310 = -_209;
    float _1312 = _1310 + 0.5;
    int _1314 = _1254 ? 0 : 1;
    bool _1316 = uint(_1248) > 1u;
    int _1318 = _1308 >> 2;
    int _1320 = ~_1288;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    int _1326 = _1318 << 4;
    int _1328 = _1326 + 512;
    int _1330 = _1324;
    if (_1306)
    {
        int _1332 = ~_1288;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    bool _1338 = !_928;
    int _1340 = _1338 ? _1272 : (-1);
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1344 = _1342 != 0;
    uint _1346 = uint(int(uint(_1328) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[int(_1356)][_1358];
    int _1362 = _1266 & 3;
    bool _1364 = _1362 != 0;
    int _1366 = ~_1314;
    int _1368 = _1366 + 1;
    int _1370 = _1368 + 1;
    int _1372 = int(_1172) + int(_1244);
    int _1374 = _1370;
    if (!_1316)
    {
        int _1376 = ~_1314;
        int _1378 = _1376 + 1;
        _1374 = _1378;
    }
    int _1380 = _1374;
    bool _1382 = _1248 != 3;
    int _1384 = _1328 + 8;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    uint _1388 = uint(int(uint(int(_1386)) >> uint(2)));
    int _1390 = int(_1386) & 3;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[int(_1388)][_1390];
    int _1394 = int(_1386) + 1;
    uint _1396 = uint(int(uint(_1394) >> uint(2)));
    int _1398 = _1394 & 3;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[int(_1396)][_1398];
    bool _1402 = !_1344;
    int _1404 = _1402 ? 0 : 1;
    int _1406 = _633 * _1372;
    int _1408 = _1406 + _1012;
    bool _1410 = uint(_1362) > 1u;
    bool _1412 = !_1382;
    int _1414 = _1412 ? 0 : (-1);
    int _1416 = _1266 & 3;
    bool _1418 = _1416 != 0;
    int _1420 = _1284 + 8;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    uint _1424 = uint(int(uint(int(_1422)) >> uint(2)));
    int _1426 = int(_1422) & 3;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[int(_1424)][_1426];
    int _1430 = int(_1422) + 1;
    uint _1432 = uint(int(uint(_1430) >> uint(2)));
    int _1434 = _1430 & 3;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[int(_1432)][_1434];
    float _1438 = _199 + 0.5;
    bool _1440 = !_1364;
    int _1442 = _1440 ? 0 : 1;
    int _1444 = _1418 ? 0 : 1;
    out.m_56.x = _1438;
    out.m_56.y = _1312;
    bool _1446 = _1362 != 3;
    int _1448 = ~_1444;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    int _1454 = _1452;
    if (!_1410)
    {
        int _1456 = ~_1444;
        int _1458 = _1456 + 1;
        _1454 = _1458;
    }
    int _1460 = _1454;
    bool _1462 = uint(_1408) >= uint(_613);
    int _1464 = abs(_1380);
    bool _1466 = !_1462;
    int _1468 = _1466 ? 0 : (-1);
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1472 = _1470 != 0;
    int _1474 = ~_1464;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    int _1480 = abs(_1278);
    bool _1482 = uint(_1362) >= 2u;
    int _1484 = ~_1372;
    int _1486 = _1484 + _1468;
    int _1488 = _1486 + 1;
    int _1490 = _1478 * as_type<int>(_1304);
    float _1492 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1494 = int(_1492);
    int _1496 = abs(_1460);
    int _1498 = _613 * _1488;
    int _1500 = _1498 + _1012;
    int _1502 = _1482 ? 0 : 1;
    int _1504 = ~_1480;
    int _1506 = _1504 + 1;
    int _1508 = _1506 + 1;
    int _1510 = abs(_1442);
    int _1512 = _1508 * as_type<int>(_1296);
    int _1514 = _1512 + _1490;
    int _1516 = ~_1502;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    int _1522 = abs(_1336);
    int _1524 = _1520;
    if (_1446)
    {
        int _1526 = ~_1502;
        int _1528 = _1526 + 1;
        _1524 = _1528;
    }
    int _1530 = _1524;
    int _1532 = ~_1496;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    int _1538 = abs(_1530);
    int _1540 = _1536 * as_type<int>(_1360);
    int _1542 = ~_1510;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = ~_1522;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    int _1554 = _1546 * as_type<int>(_1352);
    int _1556 = _1554 + _1540;
    bool _1558 = _1362 != 3;
    int _1560 = _1552 * as_type<int>(_1428);
    int _1562 = _1560 + _1514;
    int _1564 = ~_1538;
    int _1566 = _1564 + 1;
    int _1568 = _1566 + 1;
    float _1570 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1572 = int(_1570);
    int _1574 = abs(_1414);
    float _1576 = _311 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1578 = !_1558;
    int _1580 = _1578 ? 0 : (-1);
    int _1582 = _1568 * as_type<int>(_1392);
    int _1584 = _1582 + _1556;
    bool _1586 = !_1090;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1576);
    float _1592 = float(uint(_1494));
    int _1594 = ~_1574;
    int _1596 = _1594 + 1;
    int _1598 = _1596 + 1;
    int _1600 = abs(_1580);
    int _1602 = abs(_1588);
    float _1604 = 1.0 / _1592;
    int _1606 = ~_1600;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    int _1612 = _1598 * as_type<int>(_1436);
    int _1614 = _1612 + _1562;
    int _1616 = ~_1602;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = _311 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1624 = float(uint(_1572));
    int _1626 = _1610 * as_type<int>(_1400);
    int _1628 = _1626 + _1584;
    int _1630 = abs(_1404);
    int _1632 = _1614 * _1620;
    float _1634 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1622);
    int _1636 = ~_1630;
    int _1638 = _1636 + 1;
    int _1640 = _1638 + 1;
    int _1642 = _1340 * _1602;
    int _1644 = _1642 + _1632;
    int _1646 = abs(_1494);
    float _1648 = 1.0 / _1624;
    int _1650 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1652 = _1650 != 0;
    int _1654 = _1628 * _1640;
    int _1656 = as_type<int>(_1604) + (-2);
    float _1658 = _311 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1660 = float(uint(_1644));
    float _1662 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1658);
    bool _1664 = !_964;
    int _1666 = _1664 ? _1500 : (-1);
    float _1668 = as_type<float>(_1656) * _1660;
    float _1670 = float(uint(_1646));
    int _1672 = abs(_1572);
    int _1674 = _1666 * _1630;
    int _1676 = _1674 + _1654;
    float _1678 = 1.0 / _1670;
    float _1680 = _349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1682 = float(uint(_1676));
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1686 = float(uint(_1672));
    float _1688 = trunc(_1668);
    float _1690 = precise::max(_1688, 0.0);
    uint _1692 = uint(_1690);
    int _1694 = as_type<int>(_1648) + (-2);
    float _1696 = -_1684;
    float _1698 = fma(_1680, 2.0, _1696);
    float _1700 = _567 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1702 = ~_1494;
    int _1704 = _1702 + 1;
    float _1706 = as_type<float>(_1694) * _1682;
    int _1708 = abs(_1644);
    float _1710 = 1.0 / _1686;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1714 = as_type<int>(_1678) + (-2);
    float _1716 = _349 * 2.0;
    float _1718 = float(uint(_1708));
    float _1720 = fma(_1700, -2.0, _1712);
    int _1722 = ~_1572;
    int _1724 = _1722 + 1;
    float _1726 = trunc(_1706);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = _1704 * int(_1692);
    int _1734 = _1732 + _1644;
    int _1736 = abs(_1676);
    float _1738 = as_type<float>(_1714) * _1718;
    bool _1740 = _349 > 0.5;
    float _1742 = float(uint(_1734));
    int _1744 = as_type<int>(_1710) + (-2);
    float _1746 = floor(_1716);
    float _1748 = float(uint(_1736));
    float _1750 = as_type<float>(_1656) * _1742;
    int _1752 = ~_1646;
    int _1754 = _1752 + 1;
    float _1756 = as_type<float>(_1744) * _1748;
    float _1758 = -_199;
    int _1760 = _1740 ? as_type<int>(_1758) : as_type<int>(_199);
    float _1762 = trunc(_1738);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    int _1768 = _1724 * int(_1730);
    int _1770 = _1768 + _1676;
    int _1772 = as_type<int>(_1716);
    int _1774 = as_type<int>(_1710);
    float _1776 = as_type<float>(_1744);
    float _1778 = as_type<float>(_1730);
    if (_774)
    {
        _1772 = 0;
    }
    int _1780 = _1772;
    int _1782 = _1780;
    if (!_774)
    {
        _1782 = 1;
    }
    int _1784 = _1782;
    float _1786 = float(uint(_1770));
    float _1788 = trunc(_1756);
    float _1790 = precise::max(_1788, 0.0);
    uint _1792 = uint(_1790);
    bool _1794 = _1746 > 0.0;
    bool _1796 = _1746 >= 0.0;
    bool _1798 = isnan(_1746);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan(0.0);
    bool _1804 = _1800 || _1802;
    float _1806 = as_type<float>(_1694) * _1786;
    int _1808 = ~_1672;
    int _1810 = _1808 + 1;
    bool _1812 = !_1652;
    float _1814 = _1812 ? _199 : as_type<float>(_1760);
    int _1816 = _1754 * int(_1766);
    int _1818 = _1816 + _1708;
    float _1820 = trunc(_1750);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    bool _1826 = _1784 != 1;
    float _1828 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1590);
    float _1830 = float(uint(_1818));
    float _1832 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1662);
    int _1834 = _1804 ? 0 : 1;
    int _1836 = _1810 * int(_1792);
    int _1838 = _1836 + _1736;
    float _1840 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1634);
    float _1842 = as_type<float>(_1714) * _1830;
    float _1844 = trunc(_1806);
    float _1846 = precise::max(_1844, 0.0);
    uint _1848 = uint(_1846);
    int _1850 = ~_1834;
    int _1852 = _1850 + 1;
    int _1854 = _1852 + 1;
    float _1856 = _1840 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1858 = float(uint(_1838));
    float _1860 = _1828 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1862 = _1854;
    float _1864 = _1842;
    float _1866 = _1860;
    if (!_1794)
    {
        int _1868 = ~_1834;
        int _1870 = _1868 + 1;
        _1862 = _1870;
    }
    int _1872 = _1862;
    int _1874 = int(_1692) + int(_1824);
    float _1876 = trunc(_1842);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = as_type<float>(_1744) * _1858;
    if (_774)
    {
        _1774 = 0;
    }
    int _1884 = _1774;
    int _1886 = _1884;
    if (!_774)
    {
        _1886 = 2;
    }
    int _1888 = _1886;
    int _1890 = ~_1494;
    int _1892 = _1890 + 1;
    float _1894 = trunc(_1882);
    float _1896 = precise::max(_1894, 0.0);
    uint _1898 = uint(_1896);
    bool _1900 = _1888 != 2;
    float _1902 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1904 = _1892 * _1874;
    int _1906 = _1904 + _1644;
    float _1908 = as_type<float>(_1888);
    float _1910 = as_type<float>(_1906);
    if (!_1826)
    {
        _1908 = _567;
    }
    float _1912 = _1908;
    int _1914 = int(_1730) + int(_1848);
    float _1916 = _1902 * _349;
    int _1918 = int(_1766) + int(_1880);
    int _1920 = ~_1646;
    int _1922 = _1920 + 1;
    float _1924 = trunc(_1916);
    int _1926 = int(_1924);
    float _1928 = _1912;
    if (!_1826)
    {
        _1776 = _645;
    }
    float _1930 = _1776;
    float _1932 = _1930;
    if (!_1826)
    {
        _1864 = _1912;
    }
    float _1934 = _1864;
    int _1936 = _1922 * _1918;
    int _1938 = _1936 + _1708;
    float _1940 = _1934;
    if (!_1826)
    {
        _1778 = _645;
    }
    float _1942 = _1778;
    float _1944 = _567 * 2.0;
    float _1946 = _1942;
    if (_1826)
    {
        _1940 = _349;
    }
    float _1948 = _1940;
    if (_1826)
    {
        _1928 = _349;
    }
    float _1950 = _1928;
    if (_1826)
    {
        _1932 = _567;
    }
    float _1952 = _1932;
    float _1954 = floor(_1944);
    if (_1826)
    {
        _1946 = _567;
    }
    float _1956 = _1946;
    bool _1958 = uint(_1906) >= uint(_1494);
    int _1960 = ~_1572;
    int _1962 = _1960 + 1;
    int _1964 = int(_1792) + int(_1898);
    int _1966 = ~_1672;
    int _1968 = _1966 + 1;
    int _1970 = _1962 * _1914;
    int _1972 = _1970 + _1676;
    bool _1974 = !_1958;
    int _1976 = _1974 ? 0 : (-1);
    bool _1978 = uint(_1938) >= uint(_1646);
    int _1980 = _1968 * _1964;
    int _1982 = _1980 + _1736;
    int _1984 = ~_1874;
    int _1986 = _1984 + _1976;
    int _1988 = _1986 + 1;
    float _1990 = as_type<float>(_1898);
    if (_1900)
    {
        _1990 = _349;
    }
    float _1992 = _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1998 = _1992;
    if (_1900)
    {
        _1910 = _567;
    }
    float _2000 = _1910;
    int _2002 = _1494 * _1988;
    int _2004 = _2002 + _1644;
    float _2006 = _2000;
    if (!_1900)
    {
        _1998 = _645;
    }
    float _2008 = _1998;
    if (!_1900)
    {
        _2006 = _349;
    }
    float _2010 = _2006;
    bool _2012 = uint(_1972) >= uint(_1572);
    float _2014 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2016 = uint(_1982) >= uint(_1672);
    float _2018 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2020 = 1.0 / _1996;
    bool _2022 = !_2012;
    int _2024 = _2022 ? 0 : (-1);
    int _2026 = _1926 << 4;
    int _2028 = _2026 + 1968;
    bool _2030 = !_1978;
    int _2032 = _2030 ? 0 : (-1);
    bool _2034 = _1494 == 0;
    int _2036 = _2028 + 8;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    bool _2046 = _1494 == 0;
    int _2048 = _1644 ^ _1494;
    uint _2050 = uint(int(uint(_2048) >> uint(31)));
    uint _2052 = uint(int(uint(_2028) >> uint(2)));
    uint _2054 = uint(int(uint(int(_2052)) >> uint(2)));
    int _2056 = int(_2052) & 3;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[int(_2054)][_2056];
    int _2060 = int(_2052) + 1;
    uint _2062 = uint(int(uint(_2060) >> uint(2)));
    int _2064 = _2060 & 3;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[int(_2062)][_2064];
    bool _2068 = !_2016;
    int _2070 = _2068 ? 0 : (-1);
    float _2072 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2072;
    bool _2076 = !_2034;
    int _2078 = _2076 ? _2004 : (-1);
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2082 = _561 + _2080;
    bool _2084 = _1954 > 0.0;
    bool _2086 = _1954 >= 0.0;
    bool _2088 = isnan(_1954);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan(0.0);
    bool _2094 = _2090 || _2092;
    float _2096 = _349 + _567;
    int _2098 = ~_2032;
    int _2100 = _1918 + _2098;
    int _2102 = _2100 + 1;
    float _2104 = _2074 * _2020;
    int _2106 = ~int(_2050);
    int _2108 = _2106 + 1;
    float _2110 = _645 * 2.0;
    int _2112 = ~_1914;
    int _2114 = _2112 + _2024;
    int _2116 = _2114 + 1;
    float _2118 = _2096 + (-1.0);
    int _2120 = _2102 ^ _2108;
    float _2122 = floor(_2110);
    int _2124 = _2094 ? 0 : 1;
    int _2126 = _1572 * _2116;
    int _2128 = _2126 + _1676;
    bool _2130 = _1572 == 0;
    int _2132 = ~_2108;
    int _2134 = _2132 + _2120;
    int _2136 = _2134 + 1;
    int _2138 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2140 = _2138 != 0;
    int _2142 = ~_2124;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    int _2148 = _525 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = _2146;
    if (!_2084)
    {
        int _2160 = ~_2124;
        int _2162 = _2160 + 1;
        _2158 = _2162;
    }
    int _2164 = _2158;
    bool _2166 = !_2130;
    int _2168 = _2166 ? _2128 : (-1);
    bool _2170 = !_2046;
    int _2172 = _2170 ? _2136 : (-1);
    int _2174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2176 = _2174 != 0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2180 = _2178 != 0;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2184 = _2182 != 0;
    uint _2186 = uint(int(uint(_525) >> uint(2)));
    uint _2188 = uint(int(uint(int(_2186)) >> uint(2)));
    int _2190 = int(_2186) & 3;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[int(_2188)][_2190];
    int _2194 = int(_2186) + 1;
    uint _2196 = uint(int(uint(_2194) >> uint(2)));
    int _2198 = _2194 & 3;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[int(_2196)][_2198];
    bool _2202 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2204 = isnan(_561);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    bool _2214 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2216 = isnan(_561);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -_2212;
    float _2228 = _2226 + 1.0;
    float _2230 = fma(_2104, _2082, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2232 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2234 = _2122 >= 0.0;
    bool _2236 = isnan(_2122);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan(0.0);
    bool _2242 = _2238 || _2240;
    float _2244 = _2224 * _2228;
    int _2246 = _1676 ^ _1572;
    float _2248 = -_2224;
    float _2250 = _2248 + 1.0;
    float _2252 = _2058 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2254 = _2230 * _2244;
    int _2256 = _2242 ? 0 : 1;
    float _2258 = _2066 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2260 = _1572 == 0;
    float _2262 = _2044 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2264 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2266 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2272 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2254);
    int _2274 = ~_2070;
    int _2276 = _1964 + _2274;
    int _2278 = _2276 + 1;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _1856 + _2280;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2286 = _2122 > 0.0;
    out.m_58.x = _2264;
    out.m_58.y = _2266;
    out.m_58.z = _2268;
    out.m_58.w = _2270;
    uint _2288 = uint(int(uint(_2246) >> uint(31)));
    float _2290 = -_2284;
    float _2292 = fma(_2014, 2.0, _2290);
    float _2294 = _1832 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2296 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2272);
    int _2298 = ~int(_2288);
    int _2300 = _2298 + 1;
    float _2302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2304 = _1860 + _2302;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2308 = _2294 + _2306;
    int _2310 = ~_2256;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    float _2316 = -_131;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2292);
    int _2320 = _2278 ^ _2300;
    float _2322 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2324 = _2314;
    if (!_2286)
    {
        int _2326 = ~_2256;
        int _2328 = _2326 + 1;
        _2324 = _2328;
    }
    int _2330 = _2324;
    float _2332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2334 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2336 = _2156 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2338 = _2192 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2340 = _2200 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2342 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2334);
    float _2344 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2346 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2348 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2350 = _2296 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2352 = ~_2300;
    int _2354 = _2352 + _2320;
    int _2356 = _2354 + 1;
    float _2358 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2342);
    float _2360 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    out.m_60.x = _2346;
    out.m_60.y = _2348;
    out.m_60.z = _2344;
    out.m_60.w = _2350;
    bool _2362 = !_2180;
    int _2364 = _2362 ? 0 : 1;
    float _2366 = _736 + 0.5;
    bool _2368 = !_2260;
    int _2370 = _2368 ? _2356 : (-1);
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2374 = _2358 >= 0.0;
    float _2376 = _704 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2378 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2360);
    int _2380 = abs(_2364);
    float _2382 = -_2372;
    float _2384 = fma(_2322, 2.0, _2382);
    float _2386 = fma(_2376, _2366, _2318);
    float _2388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2390 = float(_1872);
    float _2392 = _2282 * _2282;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2396 = fma(_2308, _2308, _2392);
    float _2398 = float(_2380);
    float _2400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2402 = log2(_2400);
    float _2404 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2406 = fma(_2304, _2304, _2396);
    bool _2408 = !_2176;
    int _2410 = _2408 ? 0 : 1;
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2414 = fma(_2018, -2.0, _2394);
    float _2416 = _2398 * _2390;
    float _2418 = rsqrt(_2406);
    float _2420 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2412);
    float _2422 = _2396;
    if (_2374)
    {
        _2422 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2424 = _2422;
    int _2426 = abs(_2410);
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2430 = float(_2330);
    int _2432 = as_type<int>(_2424);
    if (_2374)
    {
        float _2434 = _2424 * 5.0;
        _2432 = as_type<int>(_2434);
    }
    int _2436 = _2432;
    float _2438 = _2402 * _131;
    float _2440 = fma(_2404, -2.0, _2428);
    float _2442 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2374)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7014 = as_type<float>(_2436);
        out.gl_Position.z = _7014;
    }
    bool _2446 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2448 = isnan(0.0);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2454 = _2450 || _2452;
    float _2456 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2458 = _2282 * _2418;
    float _2460 = _2308 * _2418;
    float _2462 = _742 + (-0.5);
    float _2464 = exp2(_2438);
    float _2466 = -_2458;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2282);
    float _2470 = -_2460;
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2308);
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2476 = float(_2168);
    float _2478 = -_131;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1698);
    float _2482 = float(_2426);
    float _2484 = _2468 * _2468;
    float _2486 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2414);
    float _2488 = float(_2078);
    float _2490 = _2482 * _2430;
    float _2492 = fma(_2472, _2472, _2484);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2496 = 1.0 + _2494;
    float _2498 = fma(_2442, _2488, _2480);
    float _2500 = -_2464;
    float _2502 = _2500 + 1.0;
    float _2504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2506 = _2444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2508 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2510 = _2454 ? _2502 : 0.0;
    float _2512 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2514 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2516 = isnan(1.0);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2522 = _2518 || _2520;
    float _2524 = 1.0 / _2496;
    float _2526 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2528 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2474);
    float _2530 = -_2456;
    float _2532 = -_2486;
    float _2534 = fma(_2530, _2462, _2532);
    float _2536 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2508);
    float _2538 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2512);
    float _2540 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2526);
    float _2542 = _1814 + 0.5;
    float _2544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2546 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1720);
    float _2548 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2528);
    float _2550 = -_131;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2384);
    float _2554 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2440);
    bool _2556 = _567 > 0.5;
    float _2558 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2536);
    float _2560 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2538);
    float _2562 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2540);
    float _2564 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2420);
    float _2566 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2378);
    float _2568 = fma(_2442, _2542, _2498);
    if (_2522)
    {
        float _2570 = _2510 * _2524;
        _135 = _2570;
    }
    float _2572 = _135;
    bool _2574 = _645 > 0.5;
    float _2576 = _2504 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2578 = fma(_2506, _2476, _2552);
    float _2580 = in.m_62.x;
    float _2582 = in.m_62.y;
    float _2584 = in.m_62.z;
    float _2586 = -_209;
    int _2588 = _2556 ? as_type<int>(_2586) : as_type<int>(_209);
    float _2590 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2592 = -_199;
    int _2594 = _2574 ? as_type<int>(_2592) : as_type<int>(_199);
    float _2596 = -_2560;
    float _2598 = _2596 + 1.0;
    float _2600 = float(_2370);
    float _2602 = -_2562;
    float _2604 = _2602 + 1.0;
    float _2606 = float(_2172);
    float _2608 = -_2564;
    float _2610 = _2608 + 1.0;
    bool _2612 = !_2140;
    float _2614 = _2612 ? _209 : as_type<float>(_2588);
    float _2616 = -_2554;
    float _2618 = fma(_2576, _2600, _2616);
    bool _2620 = !_1472;
    float _2622 = _2620 ? _199 : as_type<float>(_2594);
    float _2624 = -_2546;
    float _2626 = fma(_2590, _2606, _2624);
    float _2628 = _874 + (-0.5);
    float _2630 = _2614 + (-0.5);
    float _2632 = -_2566;
    float _2634 = _2632 + 1.0;
    float _2636 = _2622 + 0.5;
    float _2638 = -_2576;
    float _2640 = fma(_2638, _2628, _2618);
    float _2642 = -_2590;
    float _2644 = fma(_2642, _2630, _2626);
    float _2646 = -_2598;
    float _2648 = fma(_736, _2646, _2386);
    float _2650 = fma(_2506, _2636, _2578);
    float _2652 = -_2558;
    float _2654 = _2652 + 1.0;
    float _2656 = -_2548;
    float _2658 = _2656 + 1.0;
    float _2660 = fma(_742, _2604, _2534);
    float _2662 = -_2610;
    float _2664 = fma(_2622, _2662, _2650);
    float _2666 = -_2654;
    float _2668 = fma(_1814, _2666, _2568);
    float _2670 = fma(_2614, _2658, _2644);
    float _2672 = _2304 * _2418;
    float _2674 = _2490 * (-2.0);
    float _2676 = fma(_874, _2634, _2640);
    float _2678 = _349 + (-0.5);
    float _2680 = -_2672;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2304);
    float _2684 = fma(_2674, _2580, _2580);
    out.m_64.x = _2648;
    out.m_64.y = _2660;
    float _2686 = fma(_2232, _2674, _2232);
    float _2688 = fma(_2682, _2682, _2492);
    float _2690 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2684);
    out.m_66.x = _2668;
    out.m_66.y = _2670;
    out.m_66.z = _2664;
    out.m_66.w = _2676;
    float _2692 = _645 + _567;
    bool _2694 = !_2184;
    int _2696 = _2694 ? 0 : 1;
    float _2698 = _2584;
    if (_2374)
    {
        out.m_45.x = 0.0;
    }
    if (_2374)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2700 = -_2458;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1856);
    float _2704 = -_2460;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2294);
    int _2708 = abs(_2696);
    float _2710 = -_2672;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1860);
    float _2714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2716 = _2702 + _2714;
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2720 = _2706 + _2718;
    float _2722 = float(_2164);
    float _2724 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2726 = _2712 + _2724;
    float _2728 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2730 = fma(_2686, _2572, _2690);
    float _2732 = _2692 + (-1.0);
    float _2734 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2728);
    float _2736 = _567 + (-0.5);
    float _2738 = float(_2708);
    float _2740 = fma(_2732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2742 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2734);
    float _2744 = _2416 * (-2.0);
    float _2746 = _2730 * 0.15915493667125701904296875;
    float _2748 = _2738 * _2722;
    float _2750 = _349 + _645;
    float _2752 = fma(_2744, _2582, _2582);
    bool _2754 = _2742 >= 0.0;
    float _2756 = fma(_2740, _2744, _2740);
    float _2758 = _2748 * (-2.0);
    float _2760 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2752);
    float _2762 = _2750 + (-1.0);
    float _2764 = sqrt(_2688);
    float _2766 = fma(_2756, _2572, _2760);
    float _2768 = fma(_2758, _2584, _2584);
    float _2770 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2772 = _645 + (-0.5);
    float _2774 = _2766 * 0.15915493667125701904296875;
    float _2776 = _2726;
    if (_2754)
    {
        _2698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2778 = _2698;
    float _2780 = _2746 * 6.283185482025146484375;
    float _2782 = sin(_2780);
    float _2784 = fma(_2772, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2768);
    float _2786 = fma(_2770, _2758, _2770);
    int _2788 = as_type<int>(_2778);
    if (_2754)
    {
        float _2790 = _2778 * 5.0;
        _2788 = as_type<int>(_2790);
    }
    int _2792 = _2788;
    if (_2754)
    {
        out.m_45.x = 0.0;
    }
    float _2794 = fma(_2786, _2572, _2784);
    float _2796 = _2746 * 6.283185482025146484375;
    float _2798 = cos(_2796);
    if (_2754)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7613 = as_type<float>(_2792);
        out.gl_Position.z = _7613;
    }
    float _2800 = _2794 * 0.15915493667125701904296875;
    float _2802 = _2774 * 6.283185482025146484375;
    float _2804 = sin(_2802);
    float _2806 = _2774 * 6.283185482025146484375;
    float _2808 = cos(_2806);
    if (_2754)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2810 = _2800 * 6.283185482025146484375;
    float _2812 = cos(_2810);
    float _2814 = _2418 * _2764;
    float _2816 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _2820 = _527 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2822 = _2798 * _2808;
    float _2824 = _2814 * _2816;
    float _2826 = _2782 * _2808;
    float _2828 = _2800 * 6.283185482025146484375;
    float _2830 = sin(_2828);
    float _2832 = _2814 * _2820;
    float _2834 = _2818 * _2824;
    float _2836 = _2782 * _2804;
    float _2838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _2840 = _2798 * _2804;
    bool _2842 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2844 = isnan(0.5);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2850 = _2846 || _2848;
    float _2852 = _2798 * _2812;
    float _2854 = _2808 * _2812;
    float _2856 = _2782 * _2812;
    float _2858 = _2804 * _2812;
    float _2860 = _2838 * _2832;
    float _2862 = _2852 * _2834;
    float _2864 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2866 = _2864 * 0.5;
    float _2868 = fma(_2830, _2822, _2836);
    float _2870 = -_2826;
    float _2872 = fma(_2830, _2840, _2870);
    float _2874 = -_2834;
    float _2876 = _2830 * _2874;
    float _2878 = -_2840;
    float _2880 = fma(_2830, _2826, _2878);
    float _2882 = fma(_2868, _2860, _2862);
    float _2884 = _2856 * _2834;
    float _2886 = fma(_2854, _2860, _2876);
    float _2888 = fma(_2830, _2836, _2822);
    float _2890 = fma(_2872, _2866, _2882);
    float _2892 = fma(_2880, _2860, _2884);
    float _2894 = fma(_2858, _2866, _2886);
    float _2896 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2898 = fma(_2888, _2866, _2892);
    float _2900 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2902 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2904 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2896);
    float _2906 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2900);
    float _2908 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2902);
    float _2910 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2904);
    float _2912 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2906);
    float _2914 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2908);
    float _2916 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2918 = _2912 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2920 = _2914 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2922 = _1860 + _2916;
    float _2924 = _2294 + _2918;
    float _2926 = _1856 + _2920;
    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2930 = _2922 + _2928;
    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2934 = _2924 + _2932;
    float _2936 = _2930 * _2930;
    float _2938 = fma(_2934, _2934, _2936);
    float _2940 = sqrt(_2938);
    bool _2942 = _2940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2944 = _2860;
    float _2946 = _2924;
    float _2948 = _2922;
    if (!_2942)
    {
        _2944 = _2926;
    }
    float _2950 = _2944;
    bool _2952 = !_2942;
    float _2954 = _2950;
    if (!_2952)
    {
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2960 = _2940 + _2958;
        float _2962 = rsqrt(_2938);
        float _2964 = _2960 * _2956;
        float _2966 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2968 = _2964 * 0.15915493667125701904296875;
        float _2970 = _2968 * 6.283185482025146484375;
        float _2972 = cos(_2970);
        float _2974 = _2968 * 6.283185482025146484375;
        float _2976 = sin(_2974);
        float _2978 = _2972 + (-1.0);
        float _2980 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2982 = fma(_2976, _2966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2984 = fma(_2926, _2972, _2980);
        float _2986 = _2962 * _2982;
        float _2988 = fma(_2934, _2986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2990 = fma(_2930, _2986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2946 = _2988;
        _2954 = _2984;
        _2948 = _2990;
    }
    float _2992 = _2946;
    float _2994 = _2954;
    float _2996 = _2948;
    float _2998 = -_2460;
    float _3000 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2992);
    float _3002 = -_2458;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2994);
    float _3006 = -_2672;
    float _3008 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2996);
    float _3010 = _3004;
    float _3012 = _3000;
    float _3014 = _3008;
    if (!_2850)
    {
        float _3016 = _2716 * _2716;
        float _3018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3020 = -_1860;
        float _3022 = _3020 + _2996;
        float _3024 = fma(_2720, _2720, _3016);
        float _3026 = fma(_2726, _2726, _3024);
        float _3028 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3030 = sqrt(_3026);
        float _3032 = 1.0 / _2814;
        float _3034 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3036 = precise::min(_3030, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3038 = _3036 * _3018;
        float _3040 = _3038 * _3032;
        float _3042 = -_2294;
        float _3044 = _3042 + _2992;
        float _3046 = -_1856;
        float _3048 = _3046 + _2994;
        float _3050 = _3034 * _3040;
        float _3052 = _3022 * _3040;
        float _3054 = fma(_3044, _3050, _2706);
        float _3056 = fma(_3048, _3050, _2702);
        float _3058 = fma(_3034, _3052, _2712);
        _3010 = _3056;
        _3012 = _3054;
        _3014 = _3058;
        _1866 = _3052;
    }
    float _3060 = _3010;
    float _3062 = _3012;
    float _3064 = _3014;
    float _3066 = _1866;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3070 = _3060 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3074 = _3062 + _3072;
    float _3076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3078 = _3064 + _3076;
    float _3080 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3082 = _3070 * _3070;
    float _3084 = fma(_3074, _3074, _3082);
    float _3086 = fma(_3078, _3078, _3084);
    float _3088 = rsqrt(_3086);
    float _3090 = sqrt(_3086);
    float _3092 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3094 = _3074 * _3092;
    float _3096 = _3078 * _3092;
    float _3098 = _3094 * _3094;
    float _3100 = _3096 * _3096;
    float _3102 = _3098 + _3100;
    float _3104 = sqrt(_3102);
    bool _3106 = _3104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3110 = _3104 + _3108;
    float _3112 = _3088;
    float _3114 = _3102;
    float _3116 = _3110;
    float _3118 = _3070;
    float _3120 = _3066;
    if (_3106)
    {
        float _3122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3112 = _3122;
    }
    float _3124 = _3112;
    if (_3106)
    {
        float _3126 = rsqrt(_3102);
        _3114 = _3126;
    }
    float _3128 = _3114;
    float _3130 = _3128;
    if (_3106)
    {
        float _3132 = _3110 * _3124;
        _3116 = _3132;
    }
    float _3134 = _3116;
    if (_3106)
    {
        float _3136 = _3134 * 0.15915493667125701904296875;
        _2776 = _3136;
    }
    float _3138 = _2776;
    float _3140 = _3078;
    float _3142 = _3138;
    if (_3106)
    {
        float _3144 = _3138 * 6.283185482025146484375;
        float _3146 = sin(_3144);
        _3140 = _3146;
    }
    float _3148 = _3140;
    float _3150 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3152 = precise::max(0.0, _3150);
    float _3154 = _3124;
    float _3156 = _3152;
    if (_3106)
    {
        float _3158 = _3138 * 6.283185482025146484375;
        float _3160 = cos(_3158);
        _3154 = _3160;
    }
    float _3162 = _3154;
    float _3164 = -_3092;
    float _3166 = -_3152;
    float _3168 = fma(_3070, _3164, _3166);
    if (_3106)
    {
        float _3170 = _3168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3118 = _3170;
    }
    float _3172 = _3118;
    float _3174 = _3172;
    float _3176 = _3148;
    if (_3106)
    {
        float _3178 = fma(_3148, _3172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3174 = _3178;
    }
    float _3180 = _3174;
    float _3182 = _3180;
    if (!_3106)
    {
        _3176 = _3094;
    }
    float _3184 = _3176;
    float _3186 = _3184;
    float _3188 = _3162;
    if (_3106)
    {
        float _3190 = _3162 + (-1.0);
        _3156 = _3190;
    }
    float _3192 = _3156;
    float _3194 = _3192;
    if (_3106)
    {
        float _3196 = _3128 * _3180;
        _3120 = _3196;
    }
    float _3198 = _3120;
    if (!_3106)
    {
        _3182 = _3168;
    }
    float _3200 = _3182;
    float _3202 = _3200;
    if (_3106)
    {
        float _3204 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3142 = _3204;
    }
    float _3206 = _3142;
    if (_3106)
    {
        float _3208 = _3094 * _3198;
        _3186 = _3208;
    }
    float _3210 = _3186;
    if (!_3106)
    {
        _3194 = _3096;
    }
    float _3212 = _3194;
    float _3214 = _3212;
    if (_3106)
    {
        float _3216 = _3096 * _3198;
        _3214 = _3216;
    }
    float _3218 = _3214;
    if (!_3106)
    {
        _3130 = _3098;
    }
    float _3220 = _3130;
    float _3222 = _3220;
    if (_3106)
    {
        float _3224 = fma(_3168, _3162, _3206);
        _3202 = _3224;
    }
    float _3226 = _3202;
    if (_3106)
    {
        float _3228 = _3210 * _3210;
        _3222 = _3228;
    }
    float _3230 = _3222;
    if (!_3106)
    {
        _3188 = _3100;
    }
    float _3232 = _3188;
    float _3234 = _3232;
    if (_3106)
    {
        float _3236 = _3218 * _3218;
        _3234 = _3236;
    }
    float _3238 = _3234;
    float _3240 = fma(_3226, _3226, _3230);
    float _3242 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3244 = _3240 + _3238;
    float _3246 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3242);
    float _3248 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3252 = fma(_3090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3250);
    float _3254 = precise::clamp(_3252, 0.0, 1.0);
    float _3256 = rsqrt(_3244);
    float _3258 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3246);
    float _3260 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3262 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3248);
    float _3264 = -_3254;
    float _3266 = _3264 + 1.0;
    float _3268 = _3258 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3270 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3272 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3260);
    float _3274 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3262);
    float _3276 = abs(_3266);
    float _3278 = log2(_3276);
    float _3280 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3282 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3270);
    float _3284 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3272);
    float _3286 = _3274 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3288 = -_3280;
    float _3290 = fma(_3288, _3080, 1.0);
    float _3292 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3282);
    float _3294 = _3256 * _3210;
    float _3296 = _3256 * _3226;
    float _3298 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3300 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3302 = _3294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3304 = _3256 * _3218;
    float _3306 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3308 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3300);
    float _3310 = -_3302;
    float _3312 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3310);
    float _3314 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3316 = log2(_3290);
    float _3318 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3308);
    float _3320 = -_3304;
    float _3322 = fma(_3320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3312);
    float _3324 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3326 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3328 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3318);
    float _3330 = fma(_3322, -0.5, 0.5);
    float _3332 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3324);
    float _3334 = exp2(_3314);
    float _3336 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3326);
    float _3338 = fma(_3322, 0.5, 0.5);
    float _3340 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3332);
    float _3342 = _3296 + 1.0;
    float _3344 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3336);
    float _3346 = fma(_3338, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3348 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3340);
    float _3350 = 1.0 / _3328;
    float _3352 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3344);
    float _3354 = fma(_3338, _3346, -0.212114393711090087890625);
    float _3356 = _3316 * 0.693147182464599609375;
    float _3358 = fma(_3338, _3354, 1.570728778839111328125);
    float _3360 = _3356 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3362 = sqrt(_3330);
    float _3364 = -_3296;
    float _3366 = fma(_3334, _3342, _3364);
    float _3368 = fma(_3366, 0.5, 0.5);
    float _3370 = _3348 * _3350;
    float _3372 = _3352 * _3350;
    float _3374 = fma(_3370, 0.5, 0.5);
    float _3376 = fma(_3372, -0.5, 0.5);
    float _3378 = _3362 * 0.636619746685028076171875;
    float3 _8560 = float3(_3374, _3376, _3360);
    float _3380 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8560, float3(0.0), isnan(_8560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8560, float3(0.0), isnan(_8560)), level(0.0)).x;
    float3 _8571 = float3(_3374, _3376, _3360);
    float4 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8571, float3(0.0), isnan(_8571)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8571, float3(0.0), isnan(_8571)), level(0.0)).xyzw;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3383.w;
    float _3393 = -_3358;
    float _3395 = fma(_3378, _3393, 1.0);
    float2 _8593 = float2(_3395, _3368);
    float3 _3399 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8593, float2(0.0), isnan(_8593)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8593, float2(0.0), isnan(_8593)), level(0.0)).xyz;
    float _3401 = _3399.x;
    float _3403 = _3399.y;
    float _3405 = _3399.z;
    float _3407 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3409 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3411 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3413 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3415 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3417 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3419 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3421 = fma(_3407, _3407, 1.0);
    float _3423 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3413);
    float _3425 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3409);
    float _3427 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3411);
    float _3429 = rsqrt(_3421);
    float _3431 = -_2830;
    float _3433 = fma(_3431, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3415);
    float _3435 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3437 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3439 = -_2830;
    float _3441 = fma(_3439, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3417);
    float _3443 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3445 = -_2830;
    float _3447 = fma(_3445, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3419);
    float _3449 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3433);
    float _3451 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3441);
    float _3453 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3443);
    float _3455 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3447);
    float _3457 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3459 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3437);
    float _3461 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3435);
    float _3463 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3465 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3457);
    float _3467 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3425);
    float _3469 = _3407 * _3449;
    float _3471 = _3407 * _3451;
    float _3473 = _3407 * _3455;
    float _3475 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3459);
    float _3477 = _3407 * _3429;
    float _3479 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3461);
    float _3481 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3427);
    float _3483 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3423);
    float _3485 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3465);
    float _3487 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3453);
    float _3489 = -_3475;
    float _3491 = _3477 * _3489;
    float _3493 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3495 = fma(_3463, _3467, _3469);
    float _3497 = fma(_3463, _3481, _3471);
    float _3499 = fma(_3463, _3483, _3473);
    float _3501 = -_3479;
    float _3503 = _3477 * _3501;
    float _3505 = -_3487;
    float _3507 = _3477 * _3505;
    float _3509 = fma(_3429, _3451, _3491);
    out.m_68.x = _3467;
    out.m_68.y = _3481;
    out.m_68.z = _3483;
    float _3511 = exp2(_3493);
    float _3513 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3485);
    float _3515 = fma(_3429, _3449, _3503);
    float _3517 = _3348 + _3328;
    float _3519 = fma(_3429, _3455, _3507);
    float _3521 = _3513 + _3328;
    float _3523 = _3475 + _3497;
    float _3525 = _3487 + _3499;
    out.m_70.x = _3062;
    out.m_70.y = _3060;
    out.m_70.z = _3064;
    float _3527 = _3328 * 0.5;
    float _3529 = _3479 + _3495;
    float _3531 = _3521 * 0.5;
    float _3533 = fma(_3352, -0.5, _3527);
    float _3535 = _3517 * 0.5;
    float _3537 = -_3511;
    float _3539 = _3537 + 1.0;
    float _3541 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _3515;
    out.m_72.y = _3509;
    out.m_72.z = _3519;
    float _3543 = _3539 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _3529;
    out.m_74.y = _3523;
    out.m_74.z = _3525;
    out.gl_Position.x = _3348;
    out.gl_Position.y = _3352;
    out.gl_Position.z = _3513;
    out.gl_Position.w = _3328;
    out.m_76.x = _3535;
    out.m_76.y = _3533;
    out.m_76.z = _3531;
    out.m_76.w = _3328;
    out.m_45.x = _3541;
    float _3545 = _3543 * _3380;
    float _3547 = -_3543;
    float _3549 = _3547 + 1.0;
    float _3551 = _3391 * _3545;
    float _3553 = _3391 * _3549;
    float _3555 = _3405 * _3545;
    float _3557 = fma(_3401, _3551, _3385);
    float _3559 = fma(_3403, _3551, _3387);
    float _3561 = fma(_3391, _3555, _3389);
    out.m_78.x = _3557;
    out.m_78.y = _3559;
    out.m_78.z = _3561;
    out.m_78.w = _3553;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _553 = false;
    bool _335 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3618 = as_type<float>(_113);
        out.gl_Position.z = _3618;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3687 = as_type<float>(_151);
        out.gl_Position.z = _3687;
    }
    if (_145)
    {
        return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _157 = in.m_52.w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = in.m_47.x;
    float _171 = in.m_47.y;
    float _173 = in.m_47.z;
    float _175 = in.m_42.x;
    float _177 = in.m_42.y;
    float _179 = in.m_42.z;
    int _181 = as_type<int>(_153) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_153) & 2;
    bool _187 = _185 != 0;
    float _189 = _153;
    if (!_167)
    {
        float _191 = _155 * _155;
        float _193 = _191 * 0.5;
        _189 = _193;
    }
    float _195 = _189;
    bool _197 = !_183;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _195;
    if (!_167)
    {
        float _203 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_187;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_167;
    float _213 = _205;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _155 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _155);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _251 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _255 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _257 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _259 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[8].x, _253);
    float _261 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[8].y, _255);
    float _263 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[8].z, _257);
    float _265 = _255;
    if (!_167)
    {
        _265 = _155;
    }
    float _267 = _265;
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[10].x, _259);
    bool _271 = !_167;
    float _273 = _267;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _155 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _273 = _293;
    }
    float _295 = _273;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _299 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[10].y, _261);
    float _301 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[10].z, _263);
    float _303 = fma(_295, _169, _269);
    float _305 = fma(_295, _171, _299);
    float _307 = fma(_295, _173, _301);
    float _309 = fma(_303, _157, _175);
    float _311 = fma(_305, _157, _177);
    float _313 = fma(_307, _157, _179);
    bool _315 = !_297;
    float _333;
    if (!_315)
    {
        float _317 = in.m_54.x;
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _321 = _317 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        float _337 = float(_97);
        float _339 = 1.0 / _337;
        float _341 = _131 * _339;
        _333 = _341;
    }
    _335 = false;
    float _343 = _333;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _343 + _345;
    float _349 = in.m_54.x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _343 + _363;
    float _367 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _369 = 1.0 / _353;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _373 = 1.0 / _361;
    float _375 = 1.0 / _357;
    float _377 = _347 * _369;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = _343 + _379;
    bool _383 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _385 = isnan(_343);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _395;
    float _399 = _367 * _349;
    float _401 = _381 * _373;
    bool _403 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _405 = isnan(_343);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _415;
    float _419 = trunc(_399);
    int _421 = int(_419);
    float _423 = -_413;
    float _425 = _423 + 1.0;
    float _427 = fma(_417, _377, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = _365 * _375;
    bool _431 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _433 = isnan(_343);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = _393 * _425;
    float _445 = -_393;
    float _447 = _445 + 1.0;
    float _449 = fma(_397, _377, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _451 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _453 = isnan(_343);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = _441 * _447;
    float _473 = -_441;
    float _475 = _473 + 1.0;
    float _477 = fma(_465, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = fma(_469, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _481 = _461 * _475;
    float _483 = in.m_52.x;
    float _485 = in.m_52.y;
    float _487 = -_461;
    float _489 = _487 + 1.0;
    float _491 = _449 * _481;
    float _493 = _427 * _481;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _499;
    float _503 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _505 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _493);
    float _507 = fma(_497, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _509 = fma(_501, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_477, _471, _503);
    float _513 = fma(_479, _471, _505);
    float _515 = fma(_507, _443, _511);
    float _517 = fma(_509, _443, _513);
    float _519 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[146].x, _515);
    float _521 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[146].y, _517);
    int _523 = _421 << 4;
    int _525 = _523 + 1712;
    float _527 = _519 * _483;
    float _529 = _521 * _485;
    bool _531 = !_371;
    float _533 = _511;
    float _535 = _401;
    float _551;
    if (!_531)
    {
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _539 = _349 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_97);
        float _557 = 1.0 / _555;
        float _559 = _131 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _565 = int(_563);
    float _567 = in.m_54.y;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _571 = _569 != 0;
    float _573 = in.m_54.w;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _577 = int(_575);
    float _579 = float(_565);
    float _581 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _583 = int(_581);
    if (_571)
    {
        _533 = 1.0;
    }
    float _585 = _533;
    float _587 = _585;
    if (!_571)
    {
        _587 = 7.345489978790283203125;
    }
    float _589 = _587;
    float _591 = 0.0;
    if (_571)
    {
        _591 = 1.0;
    }
    float _593 = _591;
    float _595 = float(_577);
    float _597 = 1.0 / _579;
    float _599 = _589 * _349;
    bool _601 = _567 > 0.5;
    float _603 = _593;
    if (_571)
    {
        _535 = _349;
    }
    float _605 = _535;
    float _607 = 1.0 / _595;
    float _609 = float(uint(_583));
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _613 = int(_611);
    float _615 = _597 * _131;
    float _617 = 1.0 / _609;
    float _619 = _607 * _131;
    float _621 = trunc(_615);
    int _623 = int(_621);
    float _625 = float(uint(_613));
    int _627 = ~_613;
    int _629 = _627 + 1;
    int _631 = ~_613;
    int _633 = _631 + 1;
    float _635 = 1.0 / _625;
    int _637 = as_type<int>(_617) + (-2);
    float _639 = trunc(_619);
    int _641 = int(_639);
    float _643 = float(uint(_623));
    float _645 = in.m_54.z;
    float _647 = as_type<float>(_637) * _643;
    int _649 = as_type<int>(_635) + (-2);
    float _651 = floor(_599);
    int _653 = ~_583;
    int _655 = _653 + 1;
    float _657 = float(uint(_641));
    float _659 = trunc(_647);
    float _661 = precise::max(_659, 0.0);
    uint _664 = uint(_661);
    float _666 = as_type<float>(_649) * _657;
    float _668 = trunc(_666);
    float _670 = precise::max(_668, 0.0);
    uint _672 = uint(_670);
    int _674 = ~_613;
    int _676 = _674 + 1;
    float _678 = -_651;
    float _680 = _599 + _678;
    bool _682 = _645 > 0.5;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _686 = _684 != 0;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _690 = _688 != 0;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _694 = _692 != 0;
    int _696 = _655 * int(_664);
    int _698 = _696 + _623;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _702 = _700 != 0;
    float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _706 = float(uint(_698));
    bool _708 = !_702;
    int _710 = _708 ? 0 : 1;
    int _712 = _676 * int(_672);
    int _714 = _712 + _641;
    float _716 = as_type<float>(_637) * _706;
    float _718 = -_199;
    int _720 = _601 ? as_type<int>(_718) : as_type<int>(_199);
    float _722 = float(uint(_714));
    float _724 = trunc(_716);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = -_209;
    int _732 = _682 ? as_type<int>(_730) : as_type<int>(_209);
    bool _734 = !_690;
    float _736 = _734 ? _199 : as_type<float>(_720);
    float _738 = as_type<float>(_649) * _722;
    bool _740 = !_694;
    float _742 = _740 ? _209 : as_type<float>(_732);
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _746 = _744 != 0;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _750 = _748 != 0;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _758 = _756 != 0;
    float _760 = trunc(_738);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    float _766 = float(_97);
    bool _768 = !_750;
    int _770 = _768 ? 0 : 1;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _774 = _772 != 0;
    bool _776 = !_758;
    int _778 = _776 ? 0 : 1;
    float _780 = 1.0 / _766;
    int _782 = int(_664) + int(_728);
    int _784 = ~_583;
    int _786 = _784 + 1;
    bool _788 = _573 > 0.5;
    float _790 = float(_623);
    int _792 = _786 * _782;
    int _794 = _792 + _623;
    int _796 = int(_672) + int(_764);
    float _798 = _605;
    if (!_774)
    {
        _603 = 1.2345600128173828125;
    }
    float _800 = _603;
    if (!_774)
    {
        _798 = _567;
    }
    float _802 = _798;
    int _804 = _629 * _796;
    int _806 = _804 + _641;
    float _808 = float(_583);
    float _810 = _780 * _131;
    float _812 = float(_613);
    float _814 = _800 * _802;
    bool _816 = _790 >= _808;
    bool _818 = isnan(_790);
    bool _820 = _816 || _818;
    bool _822 = isnan(_808);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = _680 * _808;
    float _830 = -_209;
    int _832 = _788 ? as_type<int>(_830) : as_type<int>(_209);
    float _834 = floor(_814);
    bool _836 = uint(_794) >= uint(_583);
    float _838 = _808 * _810;
    float _840 = float(_641);
    bool _842 = uint(_806) >= uint(_613);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _846 = _844 != 0;
    float _848 = trunc(_826);
    int _850 = int(_848);
    bool _852 = !_836;
    int _854 = _852 ? 0 : (-1);
    bool _856 = _840 >= _812;
    bool _858 = isnan(_840);
    bool _860 = _856 || _858;
    bool _862 = isnan(_812);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    bool _868 = !_842;
    int _870 = _868 ? 0 : (-1);
    bool _872 = !_686;
    float _874 = _872 ? _209 : as_type<float>(_832);
    float _876 = -_834;
    float _878 = _814 + _876;
    bool _880 = !_846;
    int _882 = _880 ? 0 : 1;
    float _884 = trunc(_866);
    int _886 = int(_884);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _902 = _900 != 0;
    int _904 = ~_782;
    int _906 = _904 + _854;
    int _908 = _906 + 1;
    int _910 = ~_796;
    int _912 = _910 + _870;
    int _914 = _912 + 1;
    int _916 = abs(_710);
    float _918 = _878 * _812;
    bool _920 = !_894;
    int _922 = _920 ? 0 : 1;
    int _924 = _583 * _908;
    int _926 = _924 + _623;
    bool _928 = _583 == 0;
    float _930 = trunc(_838);
    int _932 = int(_930);
    int _934 = ~_850;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    int _940 = _613 * _914;
    int _942 = _940 + _641;
    bool _944 = !_928;
    int _946 = _944 ? _926 : (-1);
    float _948 = _812 * _810;
    int _950 = abs(_770);
    bool _952 = !_746;
    int _954 = _952 ? 0 : 1;
    int _956 = _946 * _938;
    float _958 = trunc(_918);
    int _960 = int(_958);
    int _962 = _583 + (-1);
    bool _964 = _613 == 0;
    int _966 = abs(_882);
    int _968 = _850 * _962;
    int _970 = _968 + _956;
    float _972 = trunc(_828);
    int _974 = int(_972);
    int _976 = ~_886;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    bool _982 = !_964;
    int _984 = _982 ? _942 : (-1);
    int _986 = _970 * _950;
    int _988 = abs(_954);
    float _990 = trunc(_948);
    int _992 = int(_990);
    bool _994 = !_754;
    int _996 = _994 ? 0 : 1;
    int _998 = _984 * _980;
    int _1000 = _613 + (-1);
    int _1002 = _932 * _988;
    int _1004 = _1002 + _986;
    bool _1006 = !_898;
    int _1008 = _1006 ? 0 : 1;
    int _1010 = _960 * _966;
    int _1012 = _1010 + _641;
    int _1014 = abs(_996);
    int _1016 = _974 * _916;
    int _1018 = _1016 + _623;
    int _1020 = abs(_778);
    int _1022 = _886 * _1000;
    int _1024 = _1022 + _998;
    bool _1026 = !_890;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _1018 * _1014;
    int _1032 = _1030 + _1004;
    int _1034 = abs(_922);
    int _1036 = abs(_1008);
    int _1038 = _1024 * _1034;
    bool _1040 = !_902;
    int _1042 = _1040 ? 0 : 1;
    int _1044 = abs(_1028);
    int _1046 = _974 * _1020;
    int _1048 = _1046 + _1032;
    int _1050 = abs(_1042);
    int _1052 = _992 * _1044;
    int _1054 = _1052 + _1038;
    float _1056 = float(uint(_1048));
    int _1058 = _1012 * _1036;
    int _1060 = _1058 + _1054;
    float _1062 = float(uint(_1018));
    int _1064 = ~_583;
    int _1066 = _1064 + 1;
    int _1068 = _960 * _1050;
    int _1070 = _1068 + _1060;
    float _1072 = as_type<float>(_637) * _1056;
    float _1074 = as_type<float>(_637) * _1062;
    int _1076 = ~_613;
    int _1078 = _1076 + 1;
    float _1080 = trunc(_1072);
    float _1082 = precise::max(_1080, 0.0);
    uint _1084 = uint(_1082);
    float _1086 = float(uint(_1070));
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1090 = _1088 != 0;
    float _1092 = as_type<float>(_649) * _1086;
    int _1094 = ~_583;
    int _1096 = _1094 + 1;
    float _1098 = trunc(_1074);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = trunc(_1092);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    int _1110 = _1096 * int(_1084);
    int _1112 = _1110 + _1048;
    float _1114 = float(uint(_1112));
    float _1116 = as_type<float>(_637) * _1114;
    int _1118 = _1066 * int(_1102);
    int _1120 = _1118 + _1018;
    int _1122 = _1078 * int(_1108);
    int _1124 = _1122 + _1070;
    float _1126 = trunc(_1116);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = float(uint(_1120));
    int _1134 = ~_583;
    int _1136 = _1134 + 1;
    float _1138 = float(uint(_1124));
    float _1140 = as_type<float>(_637) * _1132;
    float _1142 = float(uint(_1012));
    float _1144 = as_type<float>(_649) * _1138;
    float _1146 = trunc(_1140);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    float _1152 = as_type<float>(_649) * _1142;
    int _1154 = int(_1084) + int(_1130);
    float _1156 = trunc(_1144);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    int _1162 = _1136 * _1154;
    int _1164 = _1162 + _1048;
    bool _1166 = uint(_1164) >= uint(_583);
    float _1168 = trunc(_1152);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = ~_613;
    int _1176 = _1174 + 1;
    int _1178 = int(_1102) + int(_1150);
    bool _1180 = !_1166;
    int _1182 = _1180 ? 0 : (-1);
    int _1184 = int(_1108) + int(_1160);
    int _1186 = ~_1154;
    int _1188 = _1186 + _1182;
    int _1190 = _1188 + 1;
    int _1192 = _1176 * _1184;
    int _1194 = _1192 + _1070;
    int _1196 = _583 * _1190;
    int _1198 = _1196 + _1048;
    bool _1200 = uint(_1194) >= uint(_613);
    int _1202 = _1078 * int(_1172);
    int _1204 = _1202 + _1012;
    bool _1206 = !_928;
    int _1208 = _1206 ? _1198 : (-1);
    int _1210 = _1136 * _1178;
    int _1212 = _1210 + _1018;
    bool _1214 = !_1200;
    int _1216 = _1214 ? 0 : (-1);
    float _1218 = float(uint(_1204));
    int _1220 = ~_1184;
    int _1222 = _1220 + _1216;
    int _1224 = _1222 + 1;
    bool _1226 = uint(_1212) >= uint(_583);
    float _1228 = as_type<float>(_649) * _1218;
    int _1230 = _1208 >> 31;
    int _1232 = _613 * _1224;
    int _1234 = _1232 + _1070;
    bool _1236 = !_1226;
    int _1238 = _1236 ? 0 : (-1);
    float _1240 = trunc(_1228);
    float _1242 = precise::max(_1240, 0.0);
    uint _1244 = uint(_1242);
    int _1246 = _1230 & 3;
    int _1248 = _1208 & 3;
    bool _1250 = _1248 != 0;
    int _1252 = _1208 & 3;
    bool _1254 = _1252 != 0;
    int _1256 = _1208 + _1246;
    int _1258 = ~_1178;
    int _1260 = _1258 + _1238;
    int _1262 = _1260 + 1;
    bool _1264 = !_964;
    int _1266 = _1264 ? _1234 : (-1);
    int _1268 = _1256 >> 2;
    int _1270 = _583 * _1262;
    int _1272 = _1270 + _1018;
    int _1274 = _1266 >> 31;
    bool _1276 = !_1250;
    int _1278 = _1276 ? 0 : 1;
    bool _1280 = uint(_1248) >= 2u;
    int _1282 = _1268 << 4;
    int _1284 = _1282 + 368;
    int _1286 = _1274 & 3;
    int _1288 = _1280 ? 0 : 1;
    uint _1290 = uint(int(uint(_1284) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[int(_1300)][_1302];
    bool _1306 = _1248 != 3;
    int _1308 = _1266 + _1286;
    float _1310 = -_209;
    float _1312 = _1310 + 0.5;
    int _1314 = _1254 ? 0 : 1;
    bool _1316 = uint(_1248) > 1u;
    int _1318 = _1308 >> 2;
    int _1320 = ~_1288;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    int _1326 = _1318 << 4;
    int _1328 = _1326 + 512;
    int _1330 = _1324;
    if (_1306)
    {
        int _1332 = ~_1288;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    bool _1338 = !_928;
    int _1340 = _1338 ? _1272 : (-1);
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1344 = _1342 != 0;
    uint _1346 = uint(int(uint(_1328) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[int(_1356)][_1358];
    int _1362 = _1266 & 3;
    bool _1364 = _1362 != 0;
    int _1366 = ~_1314;
    int _1368 = _1366 + 1;
    int _1370 = _1368 + 1;
    int _1372 = int(_1172) + int(_1244);
    int _1374 = _1370;
    if (!_1316)
    {
        int _1376 = ~_1314;
        int _1378 = _1376 + 1;
        _1374 = _1378;
    }
    int _1380 = _1374;
    bool _1382 = _1248 != 3;
    int _1384 = _1328 + 8;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    uint _1388 = uint(int(uint(int(_1386)) >> uint(2)));
    int _1390 = int(_1386) & 3;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[int(_1388)][_1390];
    int _1394 = int(_1386) + 1;
    uint _1396 = uint(int(uint(_1394) >> uint(2)));
    int _1398 = _1394 & 3;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[int(_1396)][_1398];
    bool _1402 = !_1344;
    int _1404 = _1402 ? 0 : 1;
    int _1406 = _633 * _1372;
    int _1408 = _1406 + _1012;
    bool _1410 = uint(_1362) > 1u;
    bool _1412 = !_1382;
    int _1414 = _1412 ? 0 : (-1);
    int _1416 = _1266 & 3;
    bool _1418 = _1416 != 0;
    int _1420 = _1284 + 8;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    uint _1424 = uint(int(uint(int(_1422)) >> uint(2)));
    int _1426 = int(_1422) & 3;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[int(_1424)][_1426];
    int _1430 = int(_1422) + 1;
    uint _1432 = uint(int(uint(_1430) >> uint(2)));
    int _1434 = _1430 & 3;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[int(_1432)][_1434];
    float _1438 = _199 + 0.5;
    bool _1440 = !_1364;
    int _1442 = _1440 ? 0 : 1;
    int _1444 = _1418 ? 0 : 1;
    out.m_56.x = _1438;
    out.m_56.y = _1312;
    bool _1446 = _1362 != 3;
    int _1448 = ~_1444;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    int _1454 = _1452;
    if (!_1410)
    {
        int _1456 = ~_1444;
        int _1458 = _1456 + 1;
        _1454 = _1458;
    }
    int _1460 = _1454;
    bool _1462 = uint(_1408) >= uint(_613);
    int _1464 = abs(_1380);
    bool _1466 = !_1462;
    int _1468 = _1466 ? 0 : (-1);
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1472 = _1470 != 0;
    int _1474 = ~_1464;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    int _1480 = abs(_1278);
    bool _1482 = uint(_1362) >= 2u;
    int _1484 = ~_1372;
    int _1486 = _1484 + _1468;
    int _1488 = _1486 + 1;
    int _1490 = _1478 * as_type<int>(_1304);
    float _1492 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1494 = int(_1492);
    int _1496 = abs(_1460);
    int _1498 = _613 * _1488;
    int _1500 = _1498 + _1012;
    int _1502 = _1482 ? 0 : 1;
    int _1504 = ~_1480;
    int _1506 = _1504 + 1;
    int _1508 = _1506 + 1;
    int _1510 = abs(_1442);
    int _1512 = _1508 * as_type<int>(_1296);
    int _1514 = _1512 + _1490;
    int _1516 = ~_1502;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    int _1522 = abs(_1336);
    int _1524 = _1520;
    if (_1446)
    {
        int _1526 = ~_1502;
        int _1528 = _1526 + 1;
        _1524 = _1528;
    }
    int _1530 = _1524;
    int _1532 = ~_1496;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    int _1538 = abs(_1530);
    int _1540 = _1536 * as_type<int>(_1360);
    int _1542 = ~_1510;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = ~_1522;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    int _1554 = _1546 * as_type<int>(_1352);
    int _1556 = _1554 + _1540;
    bool _1558 = _1362 != 3;
    int _1560 = _1552 * as_type<int>(_1428);
    int _1562 = _1560 + _1514;
    int _1564 = ~_1538;
    int _1566 = _1564 + 1;
    int _1568 = _1566 + 1;
    float _1570 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1572 = int(_1570);
    int _1574 = abs(_1414);
    float _1576 = _311 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1578 = !_1558;
    int _1580 = _1578 ? 0 : (-1);
    int _1582 = _1568 * as_type<int>(_1392);
    int _1584 = _1582 + _1556;
    bool _1586 = !_1090;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1576);
    float _1592 = float(uint(_1494));
    int _1594 = ~_1574;
    int _1596 = _1594 + 1;
    int _1598 = _1596 + 1;
    int _1600 = abs(_1580);
    int _1602 = abs(_1588);
    float _1604 = 1.0 / _1592;
    int _1606 = ~_1600;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    int _1612 = _1598 * as_type<int>(_1436);
    int _1614 = _1612 + _1562;
    int _1616 = ~_1602;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = _311 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1624 = float(uint(_1572));
    int _1626 = _1610 * as_type<int>(_1400);
    int _1628 = _1626 + _1584;
    int _1630 = abs(_1404);
    int _1632 = _1614 * _1620;
    float _1634 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1622);
    int _1636 = ~_1630;
    int _1638 = _1636 + 1;
    int _1640 = _1638 + 1;
    int _1642 = _1340 * _1602;
    int _1644 = _1642 + _1632;
    int _1646 = abs(_1494);
    float _1648 = 1.0 / _1624;
    int _1650 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1652 = _1650 != 0;
    int _1654 = _1628 * _1640;
    int _1656 = as_type<int>(_1604) + (-2);
    float _1658 = _311 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1660 = float(uint(_1644));
    float _1662 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1658);
    bool _1664 = !_964;
    int _1666 = _1664 ? _1500 : (-1);
    float _1668 = as_type<float>(_1656) * _1660;
    float _1670 = float(uint(_1646));
    int _1672 = abs(_1572);
    int _1674 = _1666 * _1630;
    int _1676 = _1674 + _1654;
    float _1678 = 1.0 / _1670;
    float _1680 = _349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1682 = float(uint(_1676));
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1686 = float(uint(_1672));
    float _1688 = trunc(_1668);
    float _1690 = precise::max(_1688, 0.0);
    uint _1692 = uint(_1690);
    int _1694 = as_type<int>(_1648) + (-2);
    float _1696 = -_1684;
    float _1698 = fma(_1680, 2.0, _1696);
    float _1700 = _567 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1702 = ~_1494;
    int _1704 = _1702 + 1;
    float _1706 = as_type<float>(_1694) * _1682;
    int _1708 = abs(_1644);
    float _1710 = 1.0 / _1686;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1714 = as_type<int>(_1678) + (-2);
    float _1716 = _349 * 2.0;
    float _1718 = float(uint(_1708));
    float _1720 = fma(_1700, -2.0, _1712);
    int _1722 = ~_1572;
    int _1724 = _1722 + 1;
    float _1726 = trunc(_1706);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = _1704 * int(_1692);
    int _1734 = _1732 + _1644;
    int _1736 = abs(_1676);
    float _1738 = as_type<float>(_1714) * _1718;
    bool _1740 = _349 > 0.5;
    float _1742 = float(uint(_1734));
    int _1744 = as_type<int>(_1710) + (-2);
    float _1746 = floor(_1716);
    float _1748 = float(uint(_1736));
    float _1750 = as_type<float>(_1656) * _1742;
    int _1752 = ~_1646;
    int _1754 = _1752 + 1;
    float _1756 = as_type<float>(_1744) * _1748;
    float _1758 = -_199;
    int _1760 = _1740 ? as_type<int>(_1758) : as_type<int>(_199);
    float _1762 = trunc(_1738);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    int _1768 = _1724 * int(_1730);
    int _1770 = _1768 + _1676;
    int _1772 = as_type<int>(_1716);
    int _1774 = as_type<int>(_1710);
    float _1776 = as_type<float>(_1744);
    float _1778 = as_type<float>(_1730);
    if (_774)
    {
        _1772 = 0;
    }
    int _1780 = _1772;
    int _1782 = _1780;
    if (!_774)
    {
        _1782 = 1;
    }
    int _1784 = _1782;
    float _1786 = float(uint(_1770));
    float _1788 = trunc(_1756);
    float _1790 = precise::max(_1788, 0.0);
    uint _1792 = uint(_1790);
    bool _1794 = _1746 > 0.0;
    bool _1796 = _1746 >= 0.0;
    bool _1798 = isnan(_1746);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan(0.0);
    bool _1804 = _1800 || _1802;
    float _1806 = as_type<float>(_1694) * _1786;
    int _1808 = ~_1672;
    int _1810 = _1808 + 1;
    bool _1812 = !_1652;
    float _1814 = _1812 ? _199 : as_type<float>(_1760);
    int _1816 = _1754 * int(_1766);
    int _1818 = _1816 + _1708;
    float _1820 = trunc(_1750);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    bool _1826 = _1784 != 1;
    float _1828 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1590);
    float _1830 = float(uint(_1818));
    float _1832 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1662);
    int _1834 = _1804 ? 0 : 1;
    int _1836 = _1810 * int(_1792);
    int _1838 = _1836 + _1736;
    float _1840 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1634);
    float _1842 = as_type<float>(_1714) * _1830;
    float _1844 = trunc(_1806);
    float _1846 = precise::max(_1844, 0.0);
    uint _1848 = uint(_1846);
    int _1850 = ~_1834;
    int _1852 = _1850 + 1;
    int _1854 = _1852 + 1;
    float _1856 = _1840 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1858 = float(uint(_1838));
    float _1860 = _1828 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1862 = _1854;
    float _1864 = _1842;
    float _1866 = _1860;
    if (!_1794)
    {
        int _1868 = ~_1834;
        int _1870 = _1868 + 1;
        _1862 = _1870;
    }
    int _1872 = _1862;
    int _1874 = int(_1692) + int(_1824);
    float _1876 = trunc(_1842);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = as_type<float>(_1744) * _1858;
    if (_774)
    {
        _1774 = 0;
    }
    int _1884 = _1774;
    int _1886 = _1884;
    if (!_774)
    {
        _1886 = 2;
    }
    int _1888 = _1886;
    int _1890 = ~_1494;
    int _1892 = _1890 + 1;
    float _1894 = trunc(_1882);
    float _1896 = precise::max(_1894, 0.0);
    uint _1898 = uint(_1896);
    bool _1900 = _1888 != 2;
    float _1902 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1904 = _1892 * _1874;
    int _1906 = _1904 + _1644;
    float _1908 = as_type<float>(_1888);
    float _1910 = as_type<float>(_1906);
    if (!_1826)
    {
        _1908 = _567;
    }
    float _1912 = _1908;
    int _1914 = int(_1730) + int(_1848);
    float _1916 = _1902 * _349;
    int _1918 = int(_1766) + int(_1880);
    int _1920 = ~_1646;
    int _1922 = _1920 + 1;
    float _1924 = trunc(_1916);
    int _1926 = int(_1924);
    float _1928 = _1912;
    if (!_1826)
    {
        _1776 = _645;
    }
    float _1930 = _1776;
    float _1932 = _1930;
    if (!_1826)
    {
        _1864 = _1912;
    }
    float _1934 = _1864;
    int _1936 = _1922 * _1918;
    int _1938 = _1936 + _1708;
    float _1940 = _1934;
    if (!_1826)
    {
        _1778 = _645;
    }
    float _1942 = _1778;
    float _1944 = _567 * 2.0;
    float _1946 = _1942;
    if (_1826)
    {
        _1940 = _349;
    }
    float _1948 = _1940;
    if (_1826)
    {
        _1928 = _349;
    }
    float _1950 = _1928;
    if (_1826)
    {
        _1932 = _567;
    }
    float _1952 = _1932;
    float _1954 = floor(_1944);
    if (_1826)
    {
        _1946 = _567;
    }
    float _1956 = _1946;
    bool _1958 = uint(_1906) >= uint(_1494);
    int _1960 = ~_1572;
    int _1962 = _1960 + 1;
    int _1964 = int(_1792) + int(_1898);
    int _1966 = ~_1672;
    int _1968 = _1966 + 1;
    int _1970 = _1962 * _1914;
    int _1972 = _1970 + _1676;
    bool _1974 = !_1958;
    int _1976 = _1974 ? 0 : (-1);
    bool _1978 = uint(_1938) >= uint(_1646);
    int _1980 = _1968 * _1964;
    int _1982 = _1980 + _1736;
    int _1984 = ~_1874;
    int _1986 = _1984 + _1976;
    int _1988 = _1986 + 1;
    float _1990 = as_type<float>(_1898);
    if (_1900)
    {
        _1990 = _349;
    }
    float _1992 = _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1998 = _1992;
    if (_1900)
    {
        _1910 = _567;
    }
    float _2000 = _1910;
    int _2002 = _1494 * _1988;
    int _2004 = _2002 + _1644;
    float _2006 = _2000;
    if (!_1900)
    {
        _1998 = _645;
    }
    float _2008 = _1998;
    if (!_1900)
    {
        _2006 = _349;
    }
    float _2010 = _2006;
    bool _2012 = uint(_1972) >= uint(_1572);
    float _2014 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2016 = uint(_1982) >= uint(_1672);
    float _2018 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2020 = 1.0 / _1996;
    bool _2022 = !_2012;
    int _2024 = _2022 ? 0 : (-1);
    int _2026 = _1926 << 4;
    int _2028 = _2026 + 1968;
    bool _2030 = !_1978;
    int _2032 = _2030 ? 0 : (-1);
    bool _2034 = _1494 == 0;
    int _2036 = _2028 + 8;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    bool _2046 = _1494 == 0;
    int _2048 = _1644 ^ _1494;
    uint _2050 = uint(int(uint(_2048) >> uint(31)));
    uint _2052 = uint(int(uint(_2028) >> uint(2)));
    uint _2054 = uint(int(uint(int(_2052)) >> uint(2)));
    int _2056 = int(_2052) & 3;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[int(_2054)][_2056];
    int _2060 = int(_2052) + 1;
    uint _2062 = uint(int(uint(_2060) >> uint(2)));
    int _2064 = _2060 & 3;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[int(_2062)][_2064];
    bool _2068 = !_2016;
    int _2070 = _2068 ? 0 : (-1);
    float _2072 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2072;
    bool _2076 = !_2034;
    int _2078 = _2076 ? _2004 : (-1);
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2082 = _561 + _2080;
    bool _2084 = _1954 > 0.0;
    bool _2086 = _1954 >= 0.0;
    bool _2088 = isnan(_1954);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan(0.0);
    bool _2094 = _2090 || _2092;
    float _2096 = _349 + _567;
    int _2098 = ~_2032;
    int _2100 = _1918 + _2098;
    int _2102 = _2100 + 1;
    float _2104 = _2074 * _2020;
    int _2106 = ~int(_2050);
    int _2108 = _2106 + 1;
    float _2110 = _645 * 2.0;
    int _2112 = ~_1914;
    int _2114 = _2112 + _2024;
    int _2116 = _2114 + 1;
    float _2118 = _2096 + (-1.0);
    int _2120 = _2102 ^ _2108;
    float _2122 = floor(_2110);
    int _2124 = _2094 ? 0 : 1;
    int _2126 = _1572 * _2116;
    int _2128 = _2126 + _1676;
    bool _2130 = _1572 == 0;
    int _2132 = ~_2108;
    int _2134 = _2132 + _2120;
    int _2136 = _2134 + 1;
    int _2138 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2140 = _2138 != 0;
    int _2142 = ~_2124;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    int _2148 = _525 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = _2146;
    if (!_2084)
    {
        int _2160 = ~_2124;
        int _2162 = _2160 + 1;
        _2158 = _2162;
    }
    int _2164 = _2158;
    bool _2166 = !_2130;
    int _2168 = _2166 ? _2128 : (-1);
    bool _2170 = !_2046;
    int _2172 = _2170 ? _2136 : (-1);
    int _2174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2176 = _2174 != 0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2180 = _2178 != 0;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2184 = _2182 != 0;
    uint _2186 = uint(int(uint(_525) >> uint(2)));
    uint _2188 = uint(int(uint(int(_2186)) >> uint(2)));
    int _2190 = int(_2186) & 3;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[int(_2188)][_2190];
    int _2194 = int(_2186) + 1;
    uint _2196 = uint(int(uint(_2194) >> uint(2)));
    int _2198 = _2194 & 3;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[int(_2196)][_2198];
    bool _2202 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2204 = isnan(_561);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    bool _2214 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2216 = isnan(_561);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -_2212;
    float _2228 = _2226 + 1.0;
    float _2230 = fma(_2104, _2082, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2232 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2234 = _2122 >= 0.0;
    bool _2236 = isnan(_2122);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan(0.0);
    bool _2242 = _2238 || _2240;
    float _2244 = _2224 * _2228;
    int _2246 = _1676 ^ _1572;
    float _2248 = -_2224;
    float _2250 = _2248 + 1.0;
    float _2252 = _2058 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2254 = _2230 * _2244;
    int _2256 = _2242 ? 0 : 1;
    float _2258 = _2066 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2260 = _1572 == 0;
    float _2262 = _2044 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2264 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2266 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2272 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2254);
    int _2274 = ~_2070;
    int _2276 = _1964 + _2274;
    int _2278 = _2276 + 1;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _1856 + _2280;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2286 = _2122 > 0.0;
    out.m_58.x = _2264;
    out.m_58.y = _2266;
    out.m_58.z = _2268;
    out.m_58.w = _2270;
    uint _2288 = uint(int(uint(_2246) >> uint(31)));
    float _2290 = -_2284;
    float _2292 = fma(_2014, 2.0, _2290);
    float _2294 = _1832 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2296 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2272);
    int _2298 = ~int(_2288);
    int _2300 = _2298 + 1;
    float _2302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2304 = _1860 + _2302;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2308 = _2294 + _2306;
    int _2310 = ~_2256;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    float _2316 = -_131;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2292);
    int _2320 = _2278 ^ _2300;
    float _2322 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2324 = _2314;
    if (!_2286)
    {
        int _2326 = ~_2256;
        int _2328 = _2326 + 1;
        _2324 = _2328;
    }
    int _2330 = _2324;
    float _2332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2334 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2336 = _2156 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2338 = _2192 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2340 = _2200 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2342 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2334);
    float _2344 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2346 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2348 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2350 = _2296 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2352 = ~_2300;
    int _2354 = _2352 + _2320;
    int _2356 = _2354 + 1;
    float _2358 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2342);
    float _2360 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    out.m_60.x = _2346;
    out.m_60.y = _2348;
    out.m_60.z = _2344;
    out.m_60.w = _2350;
    bool _2362 = !_2180;
    int _2364 = _2362 ? 0 : 1;
    float _2366 = _736 + 0.5;
    bool _2368 = !_2260;
    int _2370 = _2368 ? _2356 : (-1);
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2374 = _2358 >= 0.0;
    float _2376 = _704 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2378 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2360);
    int _2380 = abs(_2364);
    float _2382 = -_2372;
    float _2384 = fma(_2322, 2.0, _2382);
    float _2386 = fma(_2376, _2366, _2318);
    float _2388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2390 = float(_1872);
    float _2392 = _2282 * _2282;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2396 = fma(_2308, _2308, _2392);
    float _2398 = float(_2380);
    float _2400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2402 = log2(_2400);
    float _2404 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2406 = fma(_2304, _2304, _2396);
    bool _2408 = !_2176;
    int _2410 = _2408 ? 0 : 1;
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2414 = fma(_2018, -2.0, _2394);
    float _2416 = _2398 * _2390;
    float _2418 = rsqrt(_2406);
    float _2420 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2412);
    float _2422 = _2396;
    if (_2374)
    {
        _2422 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2424 = _2422;
    int _2426 = abs(_2410);
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2430 = float(_2330);
    int _2432 = as_type<int>(_2424);
    if (_2374)
    {
        float _2434 = _2424 * 5.0;
        _2432 = as_type<int>(_2434);
    }
    int _2436 = _2432;
    float _2438 = _2402 * _131;
    float _2440 = fma(_2404, -2.0, _2428);
    float _2442 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2374)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7014 = as_type<float>(_2436);
        out.gl_Position.z = _7014;
    }
    bool _2446 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2448 = isnan(0.0);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2454 = _2450 || _2452;
    float _2456 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2458 = _2282 * _2418;
    float _2460 = _2308 * _2418;
    float _2462 = _742 + (-0.5);
    float _2464 = exp2(_2438);
    float _2466 = -_2458;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2282);
    float _2470 = -_2460;
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2308);
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2476 = float(_2168);
    float _2478 = -_131;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1698);
    float _2482 = float(_2426);
    float _2484 = _2468 * _2468;
    float _2486 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2414);
    float _2488 = float(_2078);
    float _2490 = _2482 * _2430;
    float _2492 = fma(_2472, _2472, _2484);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2496 = 1.0 + _2494;
    float _2498 = fma(_2442, _2488, _2480);
    float _2500 = -_2464;
    float _2502 = _2500 + 1.0;
    float _2504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2506 = _2444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2508 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2510 = _2454 ? _2502 : 0.0;
    float _2512 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2514 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2516 = isnan(1.0);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2522 = _2518 || _2520;
    float _2524 = 1.0 / _2496;
    float _2526 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2528 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2474);
    float _2530 = -_2456;
    float _2532 = -_2486;
    float _2534 = fma(_2530, _2462, _2532);
    float _2536 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2508);
    float _2538 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2512);
    float _2540 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2526);
    float _2542 = _1814 + 0.5;
    float _2544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2546 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1720);
    float _2548 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2528);
    float _2550 = -_131;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2384);
    float _2554 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2440);
    bool _2556 = _567 > 0.5;
    float _2558 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2536);
    float _2560 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2538);
    float _2562 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2540);
    float _2564 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2420);
    float _2566 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2378);
    float _2568 = fma(_2442, _2542, _2498);
    if (_2522)
    {
        float _2570 = _2510 * _2524;
        _135 = _2570;
    }
    float _2572 = _135;
    bool _2574 = _645 > 0.5;
    float _2576 = _2504 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2578 = fma(_2506, _2476, _2552);
    float _2580 = in.m_62.x;
    float _2582 = in.m_62.y;
    float _2584 = in.m_62.z;
    float _2586 = -_209;
    int _2588 = _2556 ? as_type<int>(_2586) : as_type<int>(_209);
    float _2590 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2592 = -_199;
    int _2594 = _2574 ? as_type<int>(_2592) : as_type<int>(_199);
    float _2596 = -_2560;
    float _2598 = _2596 + 1.0;
    float _2600 = float(_2370);
    float _2602 = -_2562;
    float _2604 = _2602 + 1.0;
    float _2606 = float(_2172);
    float _2608 = -_2564;
    float _2610 = _2608 + 1.0;
    bool _2612 = !_2140;
    float _2614 = _2612 ? _209 : as_type<float>(_2588);
    float _2616 = -_2554;
    float _2618 = fma(_2576, _2600, _2616);
    bool _2620 = !_1472;
    float _2622 = _2620 ? _199 : as_type<float>(_2594);
    float _2624 = -_2546;
    float _2626 = fma(_2590, _2606, _2624);
    float _2628 = _874 + (-0.5);
    float _2630 = _2614 + (-0.5);
    float _2632 = -_2566;
    float _2634 = _2632 + 1.0;
    float _2636 = _2622 + 0.5;
    float _2638 = -_2576;
    float _2640 = fma(_2638, _2628, _2618);
    float _2642 = -_2590;
    float _2644 = fma(_2642, _2630, _2626);
    float _2646 = -_2598;
    float _2648 = fma(_736, _2646, _2386);
    float _2650 = fma(_2506, _2636, _2578);
    float _2652 = -_2558;
    float _2654 = _2652 + 1.0;
    float _2656 = -_2548;
    float _2658 = _2656 + 1.0;
    float _2660 = fma(_742, _2604, _2534);
    float _2662 = -_2610;
    float _2664 = fma(_2622, _2662, _2650);
    float _2666 = -_2654;
    float _2668 = fma(_1814, _2666, _2568);
    float _2670 = fma(_2614, _2658, _2644);
    float _2672 = _2304 * _2418;
    float _2674 = _2490 * (-2.0);
    float _2676 = fma(_874, _2634, _2640);
    float _2678 = _349 + (-0.5);
    float _2680 = -_2672;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2304);
    float _2684 = fma(_2674, _2580, _2580);
    out.m_64.x = _2648;
    out.m_64.y = _2660;
    float _2686 = fma(_2232, _2674, _2232);
    float _2688 = fma(_2682, _2682, _2492);
    float _2690 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2684);
    out.m_66.x = _2668;
    out.m_66.y = _2670;
    out.m_66.z = _2664;
    out.m_66.w = _2676;
    float _2692 = _645 + _567;
    bool _2694 = !_2184;
    int _2696 = _2694 ? 0 : 1;
    float _2698 = _2584;
    if (_2374)
    {
        out.m_45.x = 0.0;
    }
    if (_2374)
    {
        return out;
    }
    float _2700 = -_2458;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1856);
    float _2704 = -_2460;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2294);
    int _2708 = abs(_2696);
    float _2710 = -_2672;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1860);
    float _2714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2716 = _2702 + _2714;
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2720 = _2706 + _2718;
    float _2722 = float(_2164);
    float _2724 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2726 = _2712 + _2724;
    float _2728 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2730 = fma(_2686, _2572, _2690);
    float _2732 = _2692 + (-1.0);
    float _2734 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2728);
    float _2736 = _567 + (-0.5);
    float _2738 = float(_2708);
    float _2740 = fma(_2732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2742 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2734);
    float _2744 = _2416 * (-2.0);
    float _2746 = _2730 * 0.15915493667125701904296875;
    float _2748 = _2738 * _2722;
    float _2750 = _349 + _645;
    float _2752 = fma(_2744, _2582, _2582);
    bool _2754 = _2742 >= 0.0;
    float _2756 = fma(_2740, _2744, _2740);
    float _2758 = _2748 * (-2.0);
    float _2760 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2752);
    float _2762 = _2750 + (-1.0);
    float _2764 = sqrt(_2688);
    float _2766 = fma(_2756, _2572, _2760);
    float _2768 = fma(_2758, _2584, _2584);
    float _2770 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2772 = _645 + (-0.5);
    float _2774 = _2766 * 0.15915493667125701904296875;
    float _2776 = _2726;
    if (_2754)
    {
        _2698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2778 = _2698;
    float _2780 = _2746 * 6.283185482025146484375;
    float _2782 = sin(_2780);
    float _2784 = fma(_2772, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2768);
    float _2786 = fma(_2770, _2758, _2770);
    int _2788 = as_type<int>(_2778);
    if (_2754)
    {
        float _2790 = _2778 * 5.0;
        _2788 = as_type<int>(_2790);
    }
    int _2792 = _2788;
    if (_2754)
    {
        out.m_45.x = 0.0;
    }
    float _2794 = fma(_2786, _2572, _2784);
    float _2796 = _2746 * 6.283185482025146484375;
    float _2798 = cos(_2796);
    if (_2754)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7613 = as_type<float>(_2792);
        out.gl_Position.z = _7613;
    }
    float _2800 = _2794 * 0.15915493667125701904296875;
    float _2802 = _2774 * 6.283185482025146484375;
    float _2804 = sin(_2802);
    float _2806 = _2774 * 6.283185482025146484375;
    float _2808 = cos(_2806);
    if (_2754)
    {
        return out;
    }
    float _2810 = _2800 * 6.283185482025146484375;
    float _2812 = cos(_2810);
    float _2814 = _2418 * _2764;
    float _2816 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _2820 = _527 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2822 = _2798 * _2808;
    float _2824 = _2814 * _2816;
    float _2826 = _2782 * _2808;
    float _2828 = _2800 * 6.283185482025146484375;
    float _2830 = sin(_2828);
    float _2832 = _2814 * _2820;
    float _2834 = _2818 * _2824;
    float _2836 = _2782 * _2804;
    float _2838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _2840 = _2798 * _2804;
    bool _2842 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2844 = isnan(0.5);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2850 = _2846 || _2848;
    float _2852 = _2798 * _2812;
    float _2854 = _2808 * _2812;
    float _2856 = _2782 * _2812;
    float _2858 = _2804 * _2812;
    float _2860 = _2838 * _2832;
    float _2862 = _2852 * _2834;
    float _2864 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2866 = _2864 * 0.5;
    float _2868 = fma(_2830, _2822, _2836);
    float _2870 = -_2826;
    float _2872 = fma(_2830, _2840, _2870);
    float _2874 = -_2834;
    float _2876 = _2830 * _2874;
    float _2878 = -_2840;
    float _2880 = fma(_2830, _2826, _2878);
    float _2882 = fma(_2868, _2860, _2862);
    float _2884 = _2856 * _2834;
    float _2886 = fma(_2854, _2860, _2876);
    float _2888 = fma(_2830, _2836, _2822);
    float _2890 = fma(_2872, _2866, _2882);
    float _2892 = fma(_2880, _2860, _2884);
    float _2894 = fma(_2858, _2866, _2886);
    float _2896 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2898 = fma(_2888, _2866, _2892);
    float _2900 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2902 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2904 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2896);
    float _2906 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2900);
    float _2908 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2902);
    float _2910 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2904);
    float _2912 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2906);
    float _2914 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2908);
    float _2916 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2918 = _2912 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2920 = _2914 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2922 = _1860 + _2916;
    float _2924 = _2294 + _2918;
    float _2926 = _1856 + _2920;
    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2930 = _2922 + _2928;
    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2934 = _2924 + _2932;
    float _2936 = _2930 * _2930;
    float _2938 = fma(_2934, _2934, _2936);
    float _2940 = sqrt(_2938);
    bool _2942 = _2940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2944 = _2860;
    float _2946 = _2924;
    float _2948 = _2922;
    if (!_2942)
    {
        _2944 = _2926;
    }
    float _2950 = _2944;
    bool _2952 = !_2942;
    float _2954 = _2950;
    if (!_2952)
    {
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2960 = _2940 + _2958;
        float _2962 = rsqrt(_2938);
        float _2964 = _2960 * _2956;
        float _2966 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2968 = _2964 * 0.15915493667125701904296875;
        float _2970 = _2968 * 6.283185482025146484375;
        float _2972 = cos(_2970);
        float _2974 = _2968 * 6.283185482025146484375;
        float _2976 = sin(_2974);
        float _2978 = _2972 + (-1.0);
        float _2980 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2982 = fma(_2976, _2966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2984 = fma(_2926, _2972, _2980);
        float _2986 = _2962 * _2982;
        float _2988 = fma(_2934, _2986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2990 = fma(_2930, _2986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2946 = _2988;
        _2954 = _2984;
        _2948 = _2990;
    }
    float _2992 = _2946;
    float _2994 = _2954;
    float _2996 = _2948;
    float _2998 = -_2460;
    float _3000 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2992);
    float _3002 = -_2458;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2994);
    float _3006 = -_2672;
    float _3008 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2996);
    float _3010 = _3004;
    float _3012 = _3000;
    float _3014 = _3008;
    if (!_2850)
    {
        float _3016 = _2716 * _2716;
        float _3018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3020 = -_1860;
        float _3022 = _3020 + _2996;
        float _3024 = fma(_2720, _2720, _3016);
        float _3026 = fma(_2726, _2726, _3024);
        float _3028 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3030 = sqrt(_3026);
        float _3032 = 1.0 / _2814;
        float _3034 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3036 = precise::min(_3030, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3038 = _3036 * _3018;
        float _3040 = _3038 * _3032;
        float _3042 = -_2294;
        float _3044 = _3042 + _2992;
        float _3046 = -_1856;
        float _3048 = _3046 + _2994;
        float _3050 = _3034 * _3040;
        float _3052 = _3022 * _3040;
        float _3054 = fma(_3044, _3050, _2706);
        float _3056 = fma(_3048, _3050, _2702);
        float _3058 = fma(_3034, _3052, _2712);
        _3010 = _3056;
        _3012 = _3054;
        _3014 = _3058;
        _1866 = _3052;
    }
    float _3060 = _3010;
    float _3062 = _3012;
    float _3064 = _3014;
    float _3066 = _1866;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3070 = _3060 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3074 = _3062 + _3072;
    float _3076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3078 = _3064 + _3076;
    float _3080 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3082 = _3070 * _3070;
    float _3084 = fma(_3074, _3074, _3082);
    float _3086 = fma(_3078, _3078, _3084);
    float _3088 = rsqrt(_3086);
    float _3090 = sqrt(_3086);
    float _3092 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3094 = _3074 * _3092;
    float _3096 = _3078 * _3092;
    float _3098 = _3094 * _3094;
    float _3100 = _3096 * _3096;
    float _3102 = _3098 + _3100;
    float _3104 = sqrt(_3102);
    bool _3106 = _3104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3110 = _3104 + _3108;
    float _3112 = _3088;
    float _3114 = _3102;
    float _3116 = _3110;
    float _3118 = _3070;
    float _3120 = _3066;
    if (_3106)
    {
        float _3122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3112 = _3122;
    }
    float _3124 = _3112;
    if (_3106)
    {
        float _3126 = rsqrt(_3102);
        _3114 = _3126;
    }
    float _3128 = _3114;
    float _3130 = _3128;
    if (_3106)
    {
        float _3132 = _3110 * _3124;
        _3116 = _3132;
    }
    float _3134 = _3116;
    if (_3106)
    {
        float _3136 = _3134 * 0.15915493667125701904296875;
        _2776 = _3136;
    }
    float _3138 = _2776;
    float _3140 = _3078;
    float _3142 = _3138;
    if (_3106)
    {
        float _3144 = _3138 * 6.283185482025146484375;
        float _3146 = sin(_3144);
        _3140 = _3146;
    }
    float _3148 = _3140;
    float _3150 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3152 = precise::max(0.0, _3150);
    float _3154 = _3124;
    float _3156 = _3152;
    if (_3106)
    {
        float _3158 = _3138 * 6.283185482025146484375;
        float _3160 = cos(_3158);
        _3154 = _3160;
    }
    float _3162 = _3154;
    float _3164 = -_3092;
    float _3166 = -_3152;
    float _3168 = fma(_3070, _3164, _3166);
    if (_3106)
    {
        float _3170 = _3168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3118 = _3170;
    }
    float _3172 = _3118;
    float _3174 = _3172;
    float _3176 = _3148;
    if (_3106)
    {
        float _3178 = fma(_3148, _3172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3174 = _3178;
    }
    float _3180 = _3174;
    float _3182 = _3180;
    if (!_3106)
    {
        _3176 = _3094;
    }
    float _3184 = _3176;
    float _3186 = _3184;
    float _3188 = _3162;
    if (_3106)
    {
        float _3190 = _3162 + (-1.0);
        _3156 = _3190;
    }
    float _3192 = _3156;
    float _3194 = _3192;
    if (_3106)
    {
        float _3196 = _3128 * _3180;
        _3120 = _3196;
    }
    float _3198 = _3120;
    if (!_3106)
    {
        _3182 = _3168;
    }
    float _3200 = _3182;
    float _3202 = _3200;
    if (_3106)
    {
        float _3204 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3142 = _3204;
    }
    float _3206 = _3142;
    if (_3106)
    {
        float _3208 = _3094 * _3198;
        _3186 = _3208;
    }
    float _3210 = _3186;
    if (!_3106)
    {
        _3194 = _3096;
    }
    float _3212 = _3194;
    float _3214 = _3212;
    if (_3106)
    {
        float _3216 = _3096 * _3198;
        _3214 = _3216;
    }
    float _3218 = _3214;
    if (!_3106)
    {
        _3130 = _3098;
    }
    float _3220 = _3130;
    float _3222 = _3220;
    if (_3106)
    {
        float _3224 = fma(_3168, _3162, _3206);
        _3202 = _3224;
    }
    float _3226 = _3202;
    if (_3106)
    {
        float _3228 = _3210 * _3210;
        _3222 = _3228;
    }
    float _3230 = _3222;
    if (!_3106)
    {
        _3188 = _3100;
    }
    float _3232 = _3188;
    float _3234 = _3232;
    if (_3106)
    {
        float _3236 = _3218 * _3218;
        _3234 = _3236;
    }
    float _3238 = _3234;
    float _3240 = fma(_3226, _3226, _3230);
    float _3242 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3244 = _3240 + _3238;
    float _3246 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3242);
    float _3248 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3252 = fma(_3090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3250);
    float _3254 = precise::clamp(_3252, 0.0, 1.0);
    float _3256 = rsqrt(_3244);
    float _3258 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3246);
    float _3260 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3262 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3248);
    float _3264 = -_3254;
    float _3266 = _3264 + 1.0;
    float _3268 = _3258 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3270 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3272 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3260);
    float _3274 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3262);
    float _3276 = abs(_3266);
    float _3278 = log2(_3276);
    float _3280 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3282 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3270);
    float _3284 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3272);
    float _3286 = _3274 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3288 = -_3280;
    float _3290 = fma(_3288, _3080, 1.0);
    float _3292 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3282);
    float _3294 = _3256 * _3210;
    float _3296 = _3256 * _3226;
    float _3298 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3300 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3302 = _3294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3304 = _3256 * _3218;
    float _3306 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3308 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3300);
    float _3310 = -_3302;
    float _3312 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3310);
    float _3314 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3316 = log2(_3290);
    float _3318 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3308);
    float _3320 = -_3304;
    float _3322 = fma(_3320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3312);
    float _3324 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3326 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3328 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3318);
    float _3330 = fma(_3322, -0.5, 0.5);
    float _3332 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3324);
    float _3334 = exp2(_3314);
    float _3336 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3326);
    float _3338 = fma(_3322, 0.5, 0.5);
    float _3340 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3332);
    float _3342 = _3296 + 1.0;
    float _3344 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3336);
    float _3346 = fma(_3338, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3348 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3340);
    float _3350 = 1.0 / _3328;
    float _3352 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3344);
    float _3354 = fma(_3338, _3346, -0.212114393711090087890625);
    float _3356 = _3316 * 0.693147182464599609375;
    float _3358 = fma(_3338, _3354, 1.570728778839111328125);
    float _3360 = _3356 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3362 = sqrt(_3330);
    float _3364 = -_3296;
    float _3366 = fma(_3334, _3342, _3364);
    float _3368 = fma(_3366, 0.5, 0.5);
    float _3370 = _3348 * _3350;
    float _3372 = _3352 * _3350;
    float _3374 = fma(_3370, 0.5, 0.5);
    float _3376 = fma(_3372, -0.5, 0.5);
    float _3378 = _3362 * 0.636619746685028076171875;
    float3 _8560 = float3(_3374, _3376, _3360);
    float _3380 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8560, float3(0.0), isnan(_8560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8560, float3(0.0), isnan(_8560)), level(0.0)).x;
    float3 _8571 = float3(_3374, _3376, _3360);
    float4 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8571, float3(0.0), isnan(_8571)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8571, float3(0.0), isnan(_8571)), level(0.0)).xyzw;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3383.w;
    float _3393 = -_3358;
    float _3395 = fma(_3378, _3393, 1.0);
    float2 _8593 = float2(_3395, _3368);
    float3 _3399 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8593, float2(0.0), isnan(_8593)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8593, float2(0.0), isnan(_8593)), level(0.0)).xyz;
    float _3401 = _3399.x;
    float _3403 = _3399.y;
    float _3405 = _3399.z;
    float _3407 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3409 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3411 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3413 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3415 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3417 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3419 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3421 = fma(_3407, _3407, 1.0);
    float _3423 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3413);
    float _3425 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3409);
    float _3427 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3411);
    float _3429 = rsqrt(_3421);
    float _3431 = -_2830;
    float _3433 = fma(_3431, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3415);
    float _3435 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3437 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3439 = -_2830;
    float _3441 = fma(_3439, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3417);
    float _3443 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3445 = -_2830;
    float _3447 = fma(_3445, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3419);
    float _3449 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3433);
    float _3451 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3441);
    float _3453 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3443);
    float _3455 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3447);
    float _3457 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3459 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3437);
    float _3461 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3435);
    float _3463 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3465 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3457);
    float _3467 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3425);
    float _3469 = _3407 * _3449;
    float _3471 = _3407 * _3451;
    float _3473 = _3407 * _3455;
    float _3475 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3459);
    float _3477 = _3407 * _3429;
    float _3479 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3461);
    float _3481 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3427);
    float _3483 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3423);
    float _3485 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3465);
    float _3487 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3453);
    float _3489 = -_3475;
    float _3491 = _3477 * _3489;
    float _3493 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3495 = fma(_3463, _3467, _3469);
    float _3497 = fma(_3463, _3481, _3471);
    float _3499 = fma(_3463, _3483, _3473);
    float _3501 = -_3479;
    float _3503 = _3477 * _3501;
    float _3505 = -_3487;
    float _3507 = _3477 * _3505;
    float _3509 = fma(_3429, _3451, _3491);
    out.m_68.x = _3467;
    out.m_68.y = _3481;
    out.m_68.z = _3483;
    float _3511 = exp2(_3493);
    float _3513 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3485);
    float _3515 = fma(_3429, _3449, _3503);
    float _3517 = _3348 + _3328;
    float _3519 = fma(_3429, _3455, _3507);
    float _3521 = _3513 + _3328;
    float _3523 = _3475 + _3497;
    float _3525 = _3487 + _3499;
    out.m_70.x = _3062;
    out.m_70.y = _3060;
    out.m_70.z = _3064;
    float _3527 = _3328 * 0.5;
    float _3529 = _3479 + _3495;
    float _3531 = _3521 * 0.5;
    float _3533 = fma(_3352, -0.5, _3527);
    float _3535 = _3517 * 0.5;
    float _3537 = -_3511;
    float _3539 = _3537 + 1.0;
    float _3541 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _3515;
    out.m_72.y = _3509;
    out.m_72.z = _3519;
    float _3543 = _3539 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _3529;
    out.m_74.y = _3523;
    out.m_74.z = _3525;
    out.gl_Position.x = _3348;
    out.gl_Position.y = _3352;
    out.gl_Position.z = _3513;
    out.gl_Position.w = _3328;
    out.m_76.x = _3535;
    out.m_76.y = _3533;
    out.m_76.z = _3531;
    out.m_76.w = _3328;
    out.m_45.x = _3541;
    float _3545 = _3543 * _3380;
    float _3547 = -_3543;
    float _3549 = _3547 + 1.0;
    float _3551 = _3391 * _3545;
    float _3553 = _3391 * _3549;
    float _3555 = _3405 * _3545;
    float _3557 = fma(_3401, _3551, _3385);
    float _3559 = fma(_3403, _3551, _3387);
    float _3561 = fma(_3391, _3555, _3389);
    out.m_78.x = _3557;
    out.m_78.y = _3559;
    out.m_78.z = _3561;
    out.m_78.w = _3553;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _553 = false;
    bool _335 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3618 = as_type<float>(_113);
        out.gl_Position.z = _3618;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_47.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_45.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3687 = as_type<float>(_151);
        out.gl_Position.z = _3687;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _157 = in.m_52.w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = in.m_47.x;
    float _171 = in.m_47.y;
    float _173 = in.m_47.z;
    float _175 = in.m_42.x;
    float _177 = in.m_42.y;
    float _179 = in.m_42.z;
    int _181 = as_type<int>(_153) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_153) & 2;
    bool _187 = _185 != 0;
    float _189 = _153;
    if (!_167)
    {
        float _191 = _155 * _155;
        float _193 = _191 * 0.5;
        _189 = _193;
    }
    float _195 = _189;
    bool _197 = !_183;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _195;
    if (!_167)
    {
        float _203 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    bool _207 = !_187;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_167;
    float _213 = _205;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _155 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _155);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _251 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _253 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _255 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _257 = _247 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _259 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[8].x, _253);
    float _261 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[8].y, _255);
    float _263 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[8].z, _257);
    float _265 = _255;
    if (!_167)
    {
        _265 = _155;
    }
    float _267 = _265;
    float _269 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[10].x, _259);
    bool _271 = !_167;
    float _273 = _267;
    if (!_271)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _155 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _273 = _293;
    }
    float _295 = _273;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _299 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[10].y, _261);
    float _301 = fma(_251, (*spvDescriptorSet0.vp_c10)._m0[10].z, _263);
    float _303 = fma(_295, _169, _269);
    float _305 = fma(_295, _171, _299);
    float _307 = fma(_295, _173, _301);
    float _309 = fma(_303, _157, _175);
    float _311 = fma(_305, _157, _177);
    float _313 = fma(_307, _157, _179);
    bool _315 = !_297;
    float _333;
    if (!_315)
    {
        float _317 = in.m_54.x;
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _321 = _317 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        float _337 = float(_97);
        float _339 = 1.0 / _337;
        float _341 = _131 * _339;
        _333 = _341;
    }
    _335 = false;
    float _343 = _333;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _347 = _343 + _345;
    float _349 = in.m_54.x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _359;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _365 = _343 + _363;
    float _367 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _369 = 1.0 / _353;
    bool _371 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _373 = 1.0 / _361;
    float _375 = 1.0 / _357;
    float _377 = _347 * _369;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = _343 + _379;
    bool _383 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _385 = isnan(_343);
    bool _387 = _383 || _385;
    bool _389 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _391 = _387 || _389;
    float _393 = float(_391);
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _395;
    float _399 = _367 * _349;
    float _401 = _381 * _373;
    bool _403 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _405 = isnan(_343);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _415;
    float _419 = trunc(_399);
    int _421 = int(_419);
    float _423 = -_413;
    float _425 = _423 + 1.0;
    float _427 = fma(_417, _377, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = _365 * _375;
    bool _431 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _433 = isnan(_343);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = _393 * _425;
    float _445 = -_393;
    float _447 = _445 + 1.0;
    float _449 = fma(_397, _377, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _451 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _453 = isnan(_343);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = _441 * _447;
    float _473 = -_441;
    float _475 = _473 + 1.0;
    float _477 = fma(_465, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = fma(_469, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _481 = _461 * _475;
    float _483 = in.m_52.x;
    float _485 = in.m_52.y;
    float _487 = -_461;
    float _489 = _487 + 1.0;
    float _491 = _449 * _481;
    float _493 = _427 * _481;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _499;
    float _503 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _505 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _493);
    float _507 = fma(_497, _401, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _509 = fma(_501, _401, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _511 = fma(_477, _471, _503);
    float _513 = fma(_479, _471, _505);
    float _515 = fma(_507, _443, _511);
    float _517 = fma(_509, _443, _513);
    float _519 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[146].x, _515);
    float _521 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[146].y, _517);
    int _523 = _421 << 4;
    int _525 = _523 + 1712;
    float _527 = _519 * _483;
    float _529 = _521 * _485;
    bool _531 = !_371;
    float _533 = _511;
    float _535 = _401;
    float _551;
    if (!_531)
    {
        float _537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _539 = _349 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _541 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _543 = _541 * _537;
        float _545 = floor(_543);
        float _547 = -_545;
        float _549 = _543 + _547;
        _551 = _549;
        _553 = true;
    }
    else
    {
        float _555 = float(_97);
        float _557 = 1.0 / _555;
        float _559 = _131 * _557;
        _551 = _559;
    }
    _553 = false;
    float _561 = _551;
    float _563 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _565 = int(_563);
    float _567 = in.m_54.y;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _571 = _569 != 0;
    float _573 = in.m_54.w;
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _577 = int(_575);
    float _579 = float(_565);
    float _581 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _583 = int(_581);
    if (_571)
    {
        _533 = 1.0;
    }
    float _585 = _533;
    float _587 = _585;
    if (!_571)
    {
        _587 = 7.345489978790283203125;
    }
    float _589 = _587;
    float _591 = 0.0;
    if (_571)
    {
        _591 = 1.0;
    }
    float _593 = _591;
    float _595 = float(_577);
    float _597 = 1.0 / _579;
    float _599 = _589 * _349;
    bool _601 = _567 > 0.5;
    float _603 = _593;
    if (_571)
    {
        _535 = _349;
    }
    float _605 = _535;
    float _607 = 1.0 / _595;
    float _609 = float(uint(_583));
    float _611 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _613 = int(_611);
    float _615 = _597 * _131;
    float _617 = 1.0 / _609;
    float _619 = _607 * _131;
    float _621 = trunc(_615);
    int _623 = int(_621);
    float _625 = float(uint(_613));
    int _627 = ~_613;
    int _629 = _627 + 1;
    int _631 = ~_613;
    int _633 = _631 + 1;
    float _635 = 1.0 / _625;
    int _637 = as_type<int>(_617) + (-2);
    float _639 = trunc(_619);
    int _641 = int(_639);
    float _643 = float(uint(_623));
    float _645 = in.m_54.z;
    float _647 = as_type<float>(_637) * _643;
    int _649 = as_type<int>(_635) + (-2);
    float _651 = floor(_599);
    int _653 = ~_583;
    int _655 = _653 + 1;
    float _657 = float(uint(_641));
    float _659 = trunc(_647);
    float _661 = precise::max(_659, 0.0);
    uint _664 = uint(_661);
    float _666 = as_type<float>(_649) * _657;
    float _668 = trunc(_666);
    float _670 = precise::max(_668, 0.0);
    uint _672 = uint(_670);
    int _674 = ~_613;
    int _676 = _674 + 1;
    float _678 = -_651;
    float _680 = _599 + _678;
    bool _682 = _645 > 0.5;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _686 = _684 != 0;
    int _688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _690 = _688 != 0;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _694 = _692 != 0;
    int _696 = _655 * int(_664);
    int _698 = _696 + _623;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _702 = _700 != 0;
    float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _706 = float(uint(_698));
    bool _708 = !_702;
    int _710 = _708 ? 0 : 1;
    int _712 = _676 * int(_672);
    int _714 = _712 + _641;
    float _716 = as_type<float>(_637) * _706;
    float _718 = -_199;
    int _720 = _601 ? as_type<int>(_718) : as_type<int>(_199);
    float _722 = float(uint(_714));
    float _724 = trunc(_716);
    float _726 = precise::max(_724, 0.0);
    uint _728 = uint(_726);
    float _730 = -_209;
    int _732 = _682 ? as_type<int>(_730) : as_type<int>(_209);
    bool _734 = !_690;
    float _736 = _734 ? _199 : as_type<float>(_720);
    float _738 = as_type<float>(_649) * _722;
    bool _740 = !_694;
    float _742 = _740 ? _209 : as_type<float>(_732);
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _746 = _744 != 0;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _750 = _748 != 0;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _758 = _756 != 0;
    float _760 = trunc(_738);
    float _762 = precise::max(_760, 0.0);
    uint _764 = uint(_762);
    float _766 = float(_97);
    bool _768 = !_750;
    int _770 = _768 ? 0 : 1;
    int _772 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _774 = _772 != 0;
    bool _776 = !_758;
    int _778 = _776 ? 0 : 1;
    float _780 = 1.0 / _766;
    int _782 = int(_664) + int(_728);
    int _784 = ~_583;
    int _786 = _784 + 1;
    bool _788 = _573 > 0.5;
    float _790 = float(_623);
    int _792 = _786 * _782;
    int _794 = _792 + _623;
    int _796 = int(_672) + int(_764);
    float _798 = _605;
    if (!_774)
    {
        _603 = 1.2345600128173828125;
    }
    float _800 = _603;
    if (!_774)
    {
        _798 = _567;
    }
    float _802 = _798;
    int _804 = _629 * _796;
    int _806 = _804 + _641;
    float _808 = float(_583);
    float _810 = _780 * _131;
    float _812 = float(_613);
    float _814 = _800 * _802;
    bool _816 = _790 >= _808;
    bool _818 = isnan(_790);
    bool _820 = _816 || _818;
    bool _822 = isnan(_808);
    bool _824 = _820 || _822;
    float _826 = float(_824);
    float _828 = _680 * _808;
    float _830 = -_209;
    int _832 = _788 ? as_type<int>(_830) : as_type<int>(_209);
    float _834 = floor(_814);
    bool _836 = uint(_794) >= uint(_583);
    float _838 = _808 * _810;
    float _840 = float(_641);
    bool _842 = uint(_806) >= uint(_613);
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _846 = _844 != 0;
    float _848 = trunc(_826);
    int _850 = int(_848);
    bool _852 = !_836;
    int _854 = _852 ? 0 : (-1);
    bool _856 = _840 >= _812;
    bool _858 = isnan(_840);
    bool _860 = _856 || _858;
    bool _862 = isnan(_812);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    bool _868 = !_842;
    int _870 = _868 ? 0 : (-1);
    bool _872 = !_686;
    float _874 = _872 ? _209 : as_type<float>(_832);
    float _876 = -_834;
    float _878 = _814 + _876;
    bool _880 = !_846;
    int _882 = _880 ? 0 : 1;
    float _884 = trunc(_866);
    int _886 = int(_884);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _890 = _888 != 0;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _898 = _896 != 0;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _902 = _900 != 0;
    int _904 = ~_782;
    int _906 = _904 + _854;
    int _908 = _906 + 1;
    int _910 = ~_796;
    int _912 = _910 + _870;
    int _914 = _912 + 1;
    int _916 = abs(_710);
    float _918 = _878 * _812;
    bool _920 = !_894;
    int _922 = _920 ? 0 : 1;
    int _924 = _583 * _908;
    int _926 = _924 + _623;
    bool _928 = _583 == 0;
    float _930 = trunc(_838);
    int _932 = int(_930);
    int _934 = ~_850;
    int _936 = _934 + 1;
    int _938 = _936 + 1;
    int _940 = _613 * _914;
    int _942 = _940 + _641;
    bool _944 = !_928;
    int _946 = _944 ? _926 : (-1);
    float _948 = _812 * _810;
    int _950 = abs(_770);
    bool _952 = !_746;
    int _954 = _952 ? 0 : 1;
    int _956 = _946 * _938;
    float _958 = trunc(_918);
    int _960 = int(_958);
    int _962 = _583 + (-1);
    bool _964 = _613 == 0;
    int _966 = abs(_882);
    int _968 = _850 * _962;
    int _970 = _968 + _956;
    float _972 = trunc(_828);
    int _974 = int(_972);
    int _976 = ~_886;
    int _978 = _976 + 1;
    int _980 = _978 + 1;
    bool _982 = !_964;
    int _984 = _982 ? _942 : (-1);
    int _986 = _970 * _950;
    int _988 = abs(_954);
    float _990 = trunc(_948);
    int _992 = int(_990);
    bool _994 = !_754;
    int _996 = _994 ? 0 : 1;
    int _998 = _984 * _980;
    int _1000 = _613 + (-1);
    int _1002 = _932 * _988;
    int _1004 = _1002 + _986;
    bool _1006 = !_898;
    int _1008 = _1006 ? 0 : 1;
    int _1010 = _960 * _966;
    int _1012 = _1010 + _641;
    int _1014 = abs(_996);
    int _1016 = _974 * _916;
    int _1018 = _1016 + _623;
    int _1020 = abs(_778);
    int _1022 = _886 * _1000;
    int _1024 = _1022 + _998;
    bool _1026 = !_890;
    int _1028 = _1026 ? 0 : 1;
    int _1030 = _1018 * _1014;
    int _1032 = _1030 + _1004;
    int _1034 = abs(_922);
    int _1036 = abs(_1008);
    int _1038 = _1024 * _1034;
    bool _1040 = !_902;
    int _1042 = _1040 ? 0 : 1;
    int _1044 = abs(_1028);
    int _1046 = _974 * _1020;
    int _1048 = _1046 + _1032;
    int _1050 = abs(_1042);
    int _1052 = _992 * _1044;
    int _1054 = _1052 + _1038;
    float _1056 = float(uint(_1048));
    int _1058 = _1012 * _1036;
    int _1060 = _1058 + _1054;
    float _1062 = float(uint(_1018));
    int _1064 = ~_583;
    int _1066 = _1064 + 1;
    int _1068 = _960 * _1050;
    int _1070 = _1068 + _1060;
    float _1072 = as_type<float>(_637) * _1056;
    float _1074 = as_type<float>(_637) * _1062;
    int _1076 = ~_613;
    int _1078 = _1076 + 1;
    float _1080 = trunc(_1072);
    float _1082 = precise::max(_1080, 0.0);
    uint _1084 = uint(_1082);
    float _1086 = float(uint(_1070));
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1090 = _1088 != 0;
    float _1092 = as_type<float>(_649) * _1086;
    int _1094 = ~_583;
    int _1096 = _1094 + 1;
    float _1098 = trunc(_1074);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = trunc(_1092);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    int _1110 = _1096 * int(_1084);
    int _1112 = _1110 + _1048;
    float _1114 = float(uint(_1112));
    float _1116 = as_type<float>(_637) * _1114;
    int _1118 = _1066 * int(_1102);
    int _1120 = _1118 + _1018;
    int _1122 = _1078 * int(_1108);
    int _1124 = _1122 + _1070;
    float _1126 = trunc(_1116);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = float(uint(_1120));
    int _1134 = ~_583;
    int _1136 = _1134 + 1;
    float _1138 = float(uint(_1124));
    float _1140 = as_type<float>(_637) * _1132;
    float _1142 = float(uint(_1012));
    float _1144 = as_type<float>(_649) * _1138;
    float _1146 = trunc(_1140);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    float _1152 = as_type<float>(_649) * _1142;
    int _1154 = int(_1084) + int(_1130);
    float _1156 = trunc(_1144);
    float _1158 = precise::max(_1156, 0.0);
    uint _1160 = uint(_1158);
    int _1162 = _1136 * _1154;
    int _1164 = _1162 + _1048;
    bool _1166 = uint(_1164) >= uint(_583);
    float _1168 = trunc(_1152);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = ~_613;
    int _1176 = _1174 + 1;
    int _1178 = int(_1102) + int(_1150);
    bool _1180 = !_1166;
    int _1182 = _1180 ? 0 : (-1);
    int _1184 = int(_1108) + int(_1160);
    int _1186 = ~_1154;
    int _1188 = _1186 + _1182;
    int _1190 = _1188 + 1;
    int _1192 = _1176 * _1184;
    int _1194 = _1192 + _1070;
    int _1196 = _583 * _1190;
    int _1198 = _1196 + _1048;
    bool _1200 = uint(_1194) >= uint(_613);
    int _1202 = _1078 * int(_1172);
    int _1204 = _1202 + _1012;
    bool _1206 = !_928;
    int _1208 = _1206 ? _1198 : (-1);
    int _1210 = _1136 * _1178;
    int _1212 = _1210 + _1018;
    bool _1214 = !_1200;
    int _1216 = _1214 ? 0 : (-1);
    float _1218 = float(uint(_1204));
    int _1220 = ~_1184;
    int _1222 = _1220 + _1216;
    int _1224 = _1222 + 1;
    bool _1226 = uint(_1212) >= uint(_583);
    float _1228 = as_type<float>(_649) * _1218;
    int _1230 = _1208 >> 31;
    int _1232 = _613 * _1224;
    int _1234 = _1232 + _1070;
    bool _1236 = !_1226;
    int _1238 = _1236 ? 0 : (-1);
    float _1240 = trunc(_1228);
    float _1242 = precise::max(_1240, 0.0);
    uint _1244 = uint(_1242);
    int _1246 = _1230 & 3;
    int _1248 = _1208 & 3;
    bool _1250 = _1248 != 0;
    int _1252 = _1208 & 3;
    bool _1254 = _1252 != 0;
    int _1256 = _1208 + _1246;
    int _1258 = ~_1178;
    int _1260 = _1258 + _1238;
    int _1262 = _1260 + 1;
    bool _1264 = !_964;
    int _1266 = _1264 ? _1234 : (-1);
    int _1268 = _1256 >> 2;
    int _1270 = _583 * _1262;
    int _1272 = _1270 + _1018;
    int _1274 = _1266 >> 31;
    bool _1276 = !_1250;
    int _1278 = _1276 ? 0 : 1;
    bool _1280 = uint(_1248) >= 2u;
    int _1282 = _1268 << 4;
    int _1284 = _1282 + 368;
    int _1286 = _1274 & 3;
    int _1288 = _1280 ? 0 : 1;
    uint _1290 = uint(int(uint(_1284) >> uint(2)));
    uint _1292 = uint(int(uint(int(_1290)) >> uint(2)));
    int _1294 = int(_1290) & 3;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[int(_1292)][_1294];
    int _1298 = int(_1290) + 1;
    uint _1300 = uint(int(uint(_1298) >> uint(2)));
    int _1302 = _1298 & 3;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[int(_1300)][_1302];
    bool _1306 = _1248 != 3;
    int _1308 = _1266 + _1286;
    float _1310 = -_209;
    float _1312 = _1310 + 0.5;
    int _1314 = _1254 ? 0 : 1;
    bool _1316 = uint(_1248) > 1u;
    int _1318 = _1308 >> 2;
    int _1320 = ~_1288;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    int _1326 = _1318 << 4;
    int _1328 = _1326 + 512;
    int _1330 = _1324;
    if (_1306)
    {
        int _1332 = ~_1288;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    bool _1338 = !_928;
    int _1340 = _1338 ? _1272 : (-1);
    int _1342 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1344 = _1342 != 0;
    uint _1346 = uint(int(uint(_1328) >> uint(2)));
    uint _1348 = uint(int(uint(int(_1346)) >> uint(2)));
    int _1350 = int(_1346) & 3;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[int(_1348)][_1350];
    int _1354 = int(_1346) + 1;
    uint _1356 = uint(int(uint(_1354) >> uint(2)));
    int _1358 = _1354 & 3;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[int(_1356)][_1358];
    int _1362 = _1266 & 3;
    bool _1364 = _1362 != 0;
    int _1366 = ~_1314;
    int _1368 = _1366 + 1;
    int _1370 = _1368 + 1;
    int _1372 = int(_1172) + int(_1244);
    int _1374 = _1370;
    if (!_1316)
    {
        int _1376 = ~_1314;
        int _1378 = _1376 + 1;
        _1374 = _1378;
    }
    int _1380 = _1374;
    bool _1382 = _1248 != 3;
    int _1384 = _1328 + 8;
    uint _1386 = uint(int(uint(_1384) >> uint(2)));
    uint _1388 = uint(int(uint(int(_1386)) >> uint(2)));
    int _1390 = int(_1386) & 3;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[int(_1388)][_1390];
    int _1394 = int(_1386) + 1;
    uint _1396 = uint(int(uint(_1394) >> uint(2)));
    int _1398 = _1394 & 3;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[int(_1396)][_1398];
    bool _1402 = !_1344;
    int _1404 = _1402 ? 0 : 1;
    int _1406 = _633 * _1372;
    int _1408 = _1406 + _1012;
    bool _1410 = uint(_1362) > 1u;
    bool _1412 = !_1382;
    int _1414 = _1412 ? 0 : (-1);
    int _1416 = _1266 & 3;
    bool _1418 = _1416 != 0;
    int _1420 = _1284 + 8;
    uint _1422 = uint(int(uint(_1420) >> uint(2)));
    uint _1424 = uint(int(uint(int(_1422)) >> uint(2)));
    int _1426 = int(_1422) & 3;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[int(_1424)][_1426];
    int _1430 = int(_1422) + 1;
    uint _1432 = uint(int(uint(_1430) >> uint(2)));
    int _1434 = _1430 & 3;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[int(_1432)][_1434];
    float _1438 = _199 + 0.5;
    bool _1440 = !_1364;
    int _1442 = _1440 ? 0 : 1;
    int _1444 = _1418 ? 0 : 1;
    out.m_56.x = _1438;
    out.m_56.y = _1312;
    bool _1446 = _1362 != 3;
    int _1448 = ~_1444;
    int _1450 = _1448 + 1;
    int _1452 = _1450 + 1;
    int _1454 = _1452;
    if (!_1410)
    {
        int _1456 = ~_1444;
        int _1458 = _1456 + 1;
        _1454 = _1458;
    }
    int _1460 = _1454;
    bool _1462 = uint(_1408) >= uint(_613);
    int _1464 = abs(_1380);
    bool _1466 = !_1462;
    int _1468 = _1466 ? 0 : (-1);
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1472 = _1470 != 0;
    int _1474 = ~_1464;
    int _1476 = _1474 + 1;
    int _1478 = _1476 + 1;
    int _1480 = abs(_1278);
    bool _1482 = uint(_1362) >= 2u;
    int _1484 = ~_1372;
    int _1486 = _1484 + _1468;
    int _1488 = _1486 + 1;
    int _1490 = _1478 * as_type<int>(_1304);
    float _1492 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1494 = int(_1492);
    int _1496 = abs(_1460);
    int _1498 = _613 * _1488;
    int _1500 = _1498 + _1012;
    int _1502 = _1482 ? 0 : 1;
    int _1504 = ~_1480;
    int _1506 = _1504 + 1;
    int _1508 = _1506 + 1;
    int _1510 = abs(_1442);
    int _1512 = _1508 * as_type<int>(_1296);
    int _1514 = _1512 + _1490;
    int _1516 = ~_1502;
    int _1518 = _1516 + 1;
    int _1520 = _1518 + 1;
    int _1522 = abs(_1336);
    int _1524 = _1520;
    if (_1446)
    {
        int _1526 = ~_1502;
        int _1528 = _1526 + 1;
        _1524 = _1528;
    }
    int _1530 = _1524;
    int _1532 = ~_1496;
    int _1534 = _1532 + 1;
    int _1536 = _1534 + 1;
    int _1538 = abs(_1530);
    int _1540 = _1536 * as_type<int>(_1360);
    int _1542 = ~_1510;
    int _1544 = _1542 + 1;
    int _1546 = _1544 + 1;
    int _1548 = ~_1522;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    int _1554 = _1546 * as_type<int>(_1352);
    int _1556 = _1554 + _1540;
    bool _1558 = _1362 != 3;
    int _1560 = _1552 * as_type<int>(_1428);
    int _1562 = _1560 + _1514;
    int _1564 = ~_1538;
    int _1566 = _1564 + 1;
    int _1568 = _1566 + 1;
    float _1570 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _1572 = int(_1570);
    int _1574 = abs(_1414);
    float _1576 = _311 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1578 = !_1558;
    int _1580 = _1578 ? 0 : (-1);
    int _1582 = _1568 * as_type<int>(_1392);
    int _1584 = _1582 + _1556;
    bool _1586 = !_1090;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1576);
    float _1592 = float(uint(_1494));
    int _1594 = ~_1574;
    int _1596 = _1594 + 1;
    int _1598 = _1596 + 1;
    int _1600 = abs(_1580);
    int _1602 = abs(_1588);
    float _1604 = 1.0 / _1592;
    int _1606 = ~_1600;
    int _1608 = _1606 + 1;
    int _1610 = _1608 + 1;
    int _1612 = _1598 * as_type<int>(_1436);
    int _1614 = _1612 + _1562;
    int _1616 = ~_1602;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    float _1622 = _311 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1624 = float(uint(_1572));
    int _1626 = _1610 * as_type<int>(_1400);
    int _1628 = _1626 + _1584;
    int _1630 = abs(_1404);
    int _1632 = _1614 * _1620;
    float _1634 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1622);
    int _1636 = ~_1630;
    int _1638 = _1636 + 1;
    int _1640 = _1638 + 1;
    int _1642 = _1340 * _1602;
    int _1644 = _1642 + _1632;
    int _1646 = abs(_1494);
    float _1648 = 1.0 / _1624;
    int _1650 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1652 = _1650 != 0;
    int _1654 = _1628 * _1640;
    int _1656 = as_type<int>(_1604) + (-2);
    float _1658 = _311 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1660 = float(uint(_1644));
    float _1662 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1658);
    bool _1664 = !_964;
    int _1666 = _1664 ? _1500 : (-1);
    float _1668 = as_type<float>(_1656) * _1660;
    float _1670 = float(uint(_1646));
    int _1672 = abs(_1572);
    int _1674 = _1666 * _1630;
    int _1676 = _1674 + _1654;
    float _1678 = 1.0 / _1670;
    float _1680 = _349 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1682 = float(uint(_1676));
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1686 = float(uint(_1672));
    float _1688 = trunc(_1668);
    float _1690 = precise::max(_1688, 0.0);
    uint _1692 = uint(_1690);
    int _1694 = as_type<int>(_1648) + (-2);
    float _1696 = -_1684;
    float _1698 = fma(_1680, 2.0, _1696);
    float _1700 = _567 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1702 = ~_1494;
    int _1704 = _1702 + 1;
    float _1706 = as_type<float>(_1694) * _1682;
    int _1708 = abs(_1644);
    float _1710 = 1.0 / _1686;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1714 = as_type<int>(_1678) + (-2);
    float _1716 = _349 * 2.0;
    float _1718 = float(uint(_1708));
    float _1720 = fma(_1700, -2.0, _1712);
    int _1722 = ~_1572;
    int _1724 = _1722 + 1;
    float _1726 = trunc(_1706);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = _1704 * int(_1692);
    int _1734 = _1732 + _1644;
    int _1736 = abs(_1676);
    float _1738 = as_type<float>(_1714) * _1718;
    bool _1740 = _349 > 0.5;
    float _1742 = float(uint(_1734));
    int _1744 = as_type<int>(_1710) + (-2);
    float _1746 = floor(_1716);
    float _1748 = float(uint(_1736));
    float _1750 = as_type<float>(_1656) * _1742;
    int _1752 = ~_1646;
    int _1754 = _1752 + 1;
    float _1756 = as_type<float>(_1744) * _1748;
    float _1758 = -_199;
    int _1760 = _1740 ? as_type<int>(_1758) : as_type<int>(_199);
    float _1762 = trunc(_1738);
    float _1764 = precise::max(_1762, 0.0);
    uint _1766 = uint(_1764);
    int _1768 = _1724 * int(_1730);
    int _1770 = _1768 + _1676;
    int _1772 = as_type<int>(_1716);
    int _1774 = as_type<int>(_1710);
    float _1776 = as_type<float>(_1744);
    float _1778 = as_type<float>(_1730);
    if (_774)
    {
        _1772 = 0;
    }
    int _1780 = _1772;
    int _1782 = _1780;
    if (!_774)
    {
        _1782 = 1;
    }
    int _1784 = _1782;
    float _1786 = float(uint(_1770));
    float _1788 = trunc(_1756);
    float _1790 = precise::max(_1788, 0.0);
    uint _1792 = uint(_1790);
    bool _1794 = _1746 > 0.0;
    bool _1796 = _1746 >= 0.0;
    bool _1798 = isnan(_1746);
    bool _1800 = _1796 || _1798;
    bool _1802 = isnan(0.0);
    bool _1804 = _1800 || _1802;
    float _1806 = as_type<float>(_1694) * _1786;
    int _1808 = ~_1672;
    int _1810 = _1808 + 1;
    bool _1812 = !_1652;
    float _1814 = _1812 ? _199 : as_type<float>(_1760);
    int _1816 = _1754 * int(_1766);
    int _1818 = _1816 + _1708;
    float _1820 = trunc(_1750);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    bool _1826 = _1784 != 1;
    float _1828 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1590);
    float _1830 = float(uint(_1818));
    float _1832 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1662);
    int _1834 = _1804 ? 0 : 1;
    int _1836 = _1810 * int(_1792);
    int _1838 = _1836 + _1736;
    float _1840 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1634);
    float _1842 = as_type<float>(_1714) * _1830;
    float _1844 = trunc(_1806);
    float _1846 = precise::max(_1844, 0.0);
    uint _1848 = uint(_1846);
    int _1850 = ~_1834;
    int _1852 = _1850 + 1;
    int _1854 = _1852 + 1;
    float _1856 = _1840 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1858 = float(uint(_1838));
    float _1860 = _1828 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1862 = _1854;
    float _1864 = _1842;
    float _1866 = _1860;
    if (!_1794)
    {
        int _1868 = ~_1834;
        int _1870 = _1868 + 1;
        _1862 = _1870;
    }
    int _1872 = _1862;
    int _1874 = int(_1692) + int(_1824);
    float _1876 = trunc(_1842);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = as_type<float>(_1744) * _1858;
    if (_774)
    {
        _1774 = 0;
    }
    int _1884 = _1774;
    int _1886 = _1884;
    if (!_774)
    {
        _1886 = 2;
    }
    int _1888 = _1886;
    int _1890 = ~_1494;
    int _1892 = _1890 + 1;
    float _1894 = trunc(_1882);
    float _1896 = precise::max(_1894, 0.0);
    uint _1898 = uint(_1896);
    bool _1900 = _1888 != 2;
    float _1902 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    int _1904 = _1892 * _1874;
    int _1906 = _1904 + _1644;
    float _1908 = as_type<float>(_1888);
    float _1910 = as_type<float>(_1906);
    if (!_1826)
    {
        _1908 = _567;
    }
    float _1912 = _1908;
    int _1914 = int(_1730) + int(_1848);
    float _1916 = _1902 * _349;
    int _1918 = int(_1766) + int(_1880);
    int _1920 = ~_1646;
    int _1922 = _1920 + 1;
    float _1924 = trunc(_1916);
    int _1926 = int(_1924);
    float _1928 = _1912;
    if (!_1826)
    {
        _1776 = _645;
    }
    float _1930 = _1776;
    float _1932 = _1930;
    if (!_1826)
    {
        _1864 = _1912;
    }
    float _1934 = _1864;
    int _1936 = _1922 * _1918;
    int _1938 = _1936 + _1708;
    float _1940 = _1934;
    if (!_1826)
    {
        _1778 = _645;
    }
    float _1942 = _1778;
    float _1944 = _567 * 2.0;
    float _1946 = _1942;
    if (_1826)
    {
        _1940 = _349;
    }
    float _1948 = _1940;
    if (_1826)
    {
        _1928 = _349;
    }
    float _1950 = _1928;
    if (_1826)
    {
        _1932 = _567;
    }
    float _1952 = _1932;
    float _1954 = floor(_1944);
    if (_1826)
    {
        _1946 = _567;
    }
    float _1956 = _1946;
    bool _1958 = uint(_1906) >= uint(_1494);
    int _1960 = ~_1572;
    int _1962 = _1960 + 1;
    int _1964 = int(_1792) + int(_1898);
    int _1966 = ~_1672;
    int _1968 = _1966 + 1;
    int _1970 = _1962 * _1914;
    int _1972 = _1970 + _1676;
    bool _1974 = !_1958;
    int _1976 = _1974 ? 0 : (-1);
    bool _1978 = uint(_1938) >= uint(_1646);
    int _1980 = _1968 * _1964;
    int _1982 = _1980 + _1736;
    int _1984 = ~_1874;
    int _1986 = _1984 + _1976;
    int _1988 = _1986 + 1;
    float _1990 = as_type<float>(_1898);
    if (_1900)
    {
        _1990 = _349;
    }
    float _1992 = _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1998 = _1992;
    if (_1900)
    {
        _1910 = _567;
    }
    float _2000 = _1910;
    int _2002 = _1494 * _1988;
    int _2004 = _2002 + _1644;
    float _2006 = _2000;
    if (!_1900)
    {
        _1998 = _645;
    }
    float _2008 = _1998;
    if (!_1900)
    {
        _2006 = _349;
    }
    float _2010 = _2006;
    bool _2012 = uint(_1972) >= uint(_1572);
    float _2014 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2016 = uint(_1982) >= uint(_1672);
    float _2018 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2020 = 1.0 / _1996;
    bool _2022 = !_2012;
    int _2024 = _2022 ? 0 : (-1);
    int _2026 = _1926 << 4;
    int _2028 = _2026 + 1968;
    bool _2030 = !_1978;
    int _2032 = _2030 ? 0 : (-1);
    bool _2034 = _1494 == 0;
    int _2036 = _2028 + 8;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    uint _2040 = uint(int(uint(int(_2038)) >> uint(2)));
    int _2042 = int(_2038) & 3;
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[int(_2040)][_2042];
    bool _2046 = _1494 == 0;
    int _2048 = _1644 ^ _1494;
    uint _2050 = uint(int(uint(_2048) >> uint(31)));
    uint _2052 = uint(int(uint(_2028) >> uint(2)));
    uint _2054 = uint(int(uint(int(_2052)) >> uint(2)));
    int _2056 = int(_2052) & 3;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[int(_2054)][_2056];
    int _2060 = int(_2052) + 1;
    uint _2062 = uint(int(uint(_2060) >> uint(2)));
    int _2064 = _2060 & 3;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[int(_2062)][_2064];
    bool _2068 = !_2016;
    int _2070 = _2068 ? 0 : (-1);
    float _2072 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2072;
    bool _2076 = !_2034;
    int _2078 = _2076 ? _2004 : (-1);
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2082 = _561 + _2080;
    bool _2084 = _1954 > 0.0;
    bool _2086 = _1954 >= 0.0;
    bool _2088 = isnan(_1954);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan(0.0);
    bool _2094 = _2090 || _2092;
    float _2096 = _349 + _567;
    int _2098 = ~_2032;
    int _2100 = _1918 + _2098;
    int _2102 = _2100 + 1;
    float _2104 = _2074 * _2020;
    int _2106 = ~int(_2050);
    int _2108 = _2106 + 1;
    float _2110 = _645 * 2.0;
    int _2112 = ~_1914;
    int _2114 = _2112 + _2024;
    int _2116 = _2114 + 1;
    float _2118 = _2096 + (-1.0);
    int _2120 = _2102 ^ _2108;
    float _2122 = floor(_2110);
    int _2124 = _2094 ? 0 : 1;
    int _2126 = _1572 * _2116;
    int _2128 = _2126 + _1676;
    bool _2130 = _1572 == 0;
    int _2132 = ~_2108;
    int _2134 = _2132 + _2120;
    int _2136 = _2134 + 1;
    int _2138 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2140 = _2138 != 0;
    int _2142 = ~_2124;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    int _2148 = _525 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = _2146;
    if (!_2084)
    {
        int _2160 = ~_2124;
        int _2162 = _2160 + 1;
        _2158 = _2162;
    }
    int _2164 = _2158;
    bool _2166 = !_2130;
    int _2168 = _2166 ? _2128 : (-1);
    bool _2170 = !_2046;
    int _2172 = _2170 ? _2136 : (-1);
    int _2174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2176 = _2174 != 0;
    int _2178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2180 = _2178 != 0;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2184 = _2182 != 0;
    uint _2186 = uint(int(uint(_525) >> uint(2)));
    uint _2188 = uint(int(uint(int(_2186)) >> uint(2)));
    int _2190 = int(_2186) & 3;
    float _2192 = (*spvDescriptorSet0.vp_c9)._m0[int(_2188)][_2190];
    int _2194 = int(_2186) + 1;
    uint _2196 = uint(int(uint(_2194) >> uint(2)));
    int _2198 = _2194 & 3;
    float _2200 = (*spvDescriptorSet0.vp_c9)._m0[int(_2196)][_2198];
    bool _2202 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2204 = isnan(_561);
    bool _2206 = _2202 || _2204;
    bool _2208 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2210 = _2206 || _2208;
    float _2212 = float(_2210);
    bool _2214 = _561 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2216 = isnan(_561);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -_2212;
    float _2228 = _2226 + 1.0;
    float _2230 = fma(_2104, _2082, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2232 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2234 = _2122 >= 0.0;
    bool _2236 = isnan(_2122);
    bool _2238 = _2234 || _2236;
    bool _2240 = isnan(0.0);
    bool _2242 = _2238 || _2240;
    float _2244 = _2224 * _2228;
    int _2246 = _1676 ^ _1572;
    float _2248 = -_2224;
    float _2250 = _2248 + 1.0;
    float _2252 = _2058 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2254 = _2230 * _2244;
    int _2256 = _2242 ? 0 : 1;
    float _2258 = _2066 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2260 = _1572 == 0;
    float _2262 = _2044 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2264 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2266 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2268 = _2262 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2272 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2254);
    int _2274 = ~_2070;
    int _2276 = _1964 + _2274;
    int _2278 = _2276 + 1;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2282 = _1856 + _2280;
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2286 = _2122 > 0.0;
    out.m_58.x = _2264;
    out.m_58.y = _2266;
    out.m_58.z = _2268;
    out.m_58.w = _2270;
    uint _2288 = uint(int(uint(_2246) >> uint(31)));
    float _2290 = -_2284;
    float _2292 = fma(_2014, 2.0, _2290);
    float _2294 = _1832 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2296 = fma(_2212, (*spvDescriptorSet0.vp_c9)._m0[116].x, _2272);
    int _2298 = ~int(_2288);
    int _2300 = _2298 + 1;
    float _2302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2304 = _1860 + _2302;
    float _2306 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2308 = _2294 + _2306;
    int _2310 = ~_2256;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    float _2316 = -_131;
    float _2318 = fma(_2316, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2292);
    int _2320 = _2278 ^ _2300;
    float _2322 = _1948 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2324 = _2314;
    if (!_2286)
    {
        int _2326 = ~_2256;
        int _2328 = _2326 + 1;
        _2324 = _2328;
    }
    int _2330 = _2324;
    float _2332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2334 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2336 = _2156 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2338 = _2192 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2340 = _2200 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2342 = fma(_2308, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2334);
    float _2344 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2346 = _2338 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2348 = _2340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2350 = _2296 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2352 = ~_2300;
    int _2354 = _2352 + _2320;
    int _2356 = _2354 + 1;
    float _2358 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2342);
    float _2360 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    out.m_60.x = _2346;
    out.m_60.y = _2348;
    out.m_60.z = _2344;
    out.m_60.w = _2350;
    bool _2362 = !_2180;
    int _2364 = _2362 ? 0 : 1;
    float _2366 = _736 + 0.5;
    bool _2368 = !_2260;
    int _2370 = _2368 ? _2356 : (-1);
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _2374 = _2358 >= 0.0;
    float _2376 = _704 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2378 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2360);
    int _2380 = abs(_2364);
    float _2382 = -_2372;
    float _2384 = fma(_2322, 2.0, _2382);
    float _2386 = fma(_2376, _2366, _2318);
    float _2388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2390 = float(_1872);
    float _2392 = _2282 * _2282;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2396 = fma(_2308, _2308, _2392);
    float _2398 = float(_2380);
    float _2400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2402 = log2(_2400);
    float _2404 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2406 = fma(_2304, _2304, _2396);
    bool _2408 = !_2176;
    int _2410 = _2408 ? 0 : 1;
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2414 = fma(_2018, -2.0, _2394);
    float _2416 = _2398 * _2390;
    float _2418 = rsqrt(_2406);
    float _2420 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2412);
    float _2422 = _2396;
    if (_2374)
    {
        _2422 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2424 = _2422;
    int _2426 = abs(_2410);
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2430 = float(_2330);
    int _2432 = as_type<int>(_2424);
    if (_2374)
    {
        float _2434 = _2424 * 5.0;
        _2432 = as_type<int>(_2434);
    }
    int _2436 = _2432;
    float _2438 = _2402 * _131;
    float _2440 = fma(_2404, -2.0, _2428);
    float _2442 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_2374)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7014 = as_type<float>(_2436);
        out.gl_Position.z = _7014;
    }
    bool _2446 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2448 = isnan(0.0);
    bool _2450 = _2446 || _2448;
    bool _2452 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2454 = _2450 || _2452;
    float _2456 = _2388 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2458 = _2282 * _2418;
    float _2460 = _2308 * _2418;
    float _2462 = _742 + (-0.5);
    float _2464 = exp2(_2438);
    float _2466 = -_2458;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2282);
    float _2470 = -_2460;
    float _2472 = fma(_2470, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2308);
    float _2474 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2476 = float(_2168);
    float _2478 = -_131;
    float _2480 = fma(_2478, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1698);
    float _2482 = float(_2426);
    float _2484 = _2468 * _2468;
    float _2486 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2414);
    float _2488 = float(_2078);
    float _2490 = _2482 * _2430;
    float _2492 = fma(_2472, _2472, _2484);
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2496 = 1.0 + _2494;
    float _2498 = fma(_2442, _2488, _2480);
    float _2500 = -_2464;
    float _2502 = _2500 + 1.0;
    float _2504 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2506 = _2444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2508 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2510 = _2454 ? _2502 : 0.0;
    float _2512 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2514 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2516 = isnan(1.0);
    bool _2518 = _2514 || _2516;
    bool _2520 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2522 = _2518 || _2520;
    float _2524 = 1.0 / _2496;
    float _2526 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2528 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2474);
    float _2530 = -_2456;
    float _2532 = -_2486;
    float _2534 = fma(_2530, _2462, _2532);
    float _2536 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2508);
    float _2538 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2512);
    float _2540 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2526);
    float _2542 = _1814 + 0.5;
    float _2544 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2546 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1720);
    float _2548 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2528);
    float _2550 = -_131;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2384);
    float _2554 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2440);
    bool _2556 = _567 > 0.5;
    float _2558 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2536);
    float _2560 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2538);
    float _2562 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2540);
    float _2564 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2420);
    float _2566 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2378);
    float _2568 = fma(_2442, _2542, _2498);
    if (_2522)
    {
        float _2570 = _2510 * _2524;
        _135 = _2570;
    }
    float _2572 = _135;
    bool _2574 = _645 > 0.5;
    float _2576 = _2504 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2578 = fma(_2506, _2476, _2552);
    float _2580 = in.m_62.x;
    float _2582 = in.m_62.y;
    float _2584 = in.m_62.z;
    float _2586 = -_209;
    int _2588 = _2556 ? as_type<int>(_2586) : as_type<int>(_209);
    float _2590 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2592 = -_199;
    int _2594 = _2574 ? as_type<int>(_2592) : as_type<int>(_199);
    float _2596 = -_2560;
    float _2598 = _2596 + 1.0;
    float _2600 = float(_2370);
    float _2602 = -_2562;
    float _2604 = _2602 + 1.0;
    float _2606 = float(_2172);
    float _2608 = -_2564;
    float _2610 = _2608 + 1.0;
    bool _2612 = !_2140;
    float _2614 = _2612 ? _209 : as_type<float>(_2588);
    float _2616 = -_2554;
    float _2618 = fma(_2576, _2600, _2616);
    bool _2620 = !_1472;
    float _2622 = _2620 ? _199 : as_type<float>(_2594);
    float _2624 = -_2546;
    float _2626 = fma(_2590, _2606, _2624);
    float _2628 = _874 + (-0.5);
    float _2630 = _2614 + (-0.5);
    float _2632 = -_2566;
    float _2634 = _2632 + 1.0;
    float _2636 = _2622 + 0.5;
    float _2638 = -_2576;
    float _2640 = fma(_2638, _2628, _2618);
    float _2642 = -_2590;
    float _2644 = fma(_2642, _2630, _2626);
    float _2646 = -_2598;
    float _2648 = fma(_736, _2646, _2386);
    float _2650 = fma(_2506, _2636, _2578);
    float _2652 = -_2558;
    float _2654 = _2652 + 1.0;
    float _2656 = -_2548;
    float _2658 = _2656 + 1.0;
    float _2660 = fma(_742, _2604, _2534);
    float _2662 = -_2610;
    float _2664 = fma(_2622, _2662, _2650);
    float _2666 = -_2654;
    float _2668 = fma(_1814, _2666, _2568);
    float _2670 = fma(_2614, _2658, _2644);
    float _2672 = _2304 * _2418;
    float _2674 = _2490 * (-2.0);
    float _2676 = fma(_874, _2634, _2640);
    float _2678 = _349 + (-0.5);
    float _2680 = -_2672;
    float _2682 = fma(_2680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2304);
    float _2684 = fma(_2674, _2580, _2580);
    out.m_64.x = _2648;
    out.m_64.y = _2660;
    float _2686 = fma(_2232, _2674, _2232);
    float _2688 = fma(_2682, _2682, _2492);
    float _2690 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2684);
    out.m_66.x = _2668;
    out.m_66.y = _2670;
    out.m_66.z = _2664;
    out.m_66.w = _2676;
    float _2692 = _645 + _567;
    bool _2694 = !_2184;
    int _2696 = _2694 ? 0 : 1;
    float _2698 = _2584;
    if (_2374)
    {
        out.m_45.x = 0.0;
    }
    if (_2374)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2700 = -_2458;
    float _2702 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1856);
    float _2704 = -_2460;
    float _2706 = fma(_2704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2294);
    int _2708 = abs(_2696);
    float _2710 = -_2672;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1860);
    float _2714 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2716 = _2702 + _2714;
    float _2718 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2720 = _2706 + _2718;
    float _2722 = float(_2164);
    float _2724 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2726 = _2712 + _2724;
    float _2728 = _2716 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2730 = fma(_2686, _2572, _2690);
    float _2732 = _2692 + (-1.0);
    float _2734 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2728);
    float _2736 = _567 + (-0.5);
    float _2738 = float(_2708);
    float _2740 = fma(_2732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2742 = fma(_2726, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2734);
    float _2744 = _2416 * (-2.0);
    float _2746 = _2730 * 0.15915493667125701904296875;
    float _2748 = _2738 * _2722;
    float _2750 = _349 + _645;
    float _2752 = fma(_2744, _2582, _2582);
    bool _2754 = _2742 >= 0.0;
    float _2756 = fma(_2740, _2744, _2740);
    float _2758 = _2748 * (-2.0);
    float _2760 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2752);
    float _2762 = _2750 + (-1.0);
    float _2764 = sqrt(_2688);
    float _2766 = fma(_2756, _2572, _2760);
    float _2768 = fma(_2758, _2584, _2584);
    float _2770 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2772 = _645 + (-0.5);
    float _2774 = _2766 * 0.15915493667125701904296875;
    float _2776 = _2726;
    if (_2754)
    {
        _2698 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2778 = _2698;
    float _2780 = _2746 * 6.283185482025146484375;
    float _2782 = sin(_2780);
    float _2784 = fma(_2772, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2768);
    float _2786 = fma(_2770, _2758, _2770);
    int _2788 = as_type<int>(_2778);
    if (_2754)
    {
        float _2790 = _2778 * 5.0;
        _2788 = as_type<int>(_2790);
    }
    int _2792 = _2788;
    if (_2754)
    {
        out.m_45.x = 0.0;
    }
    float _2794 = fma(_2786, _2572, _2784);
    float _2796 = _2746 * 6.283185482025146484375;
    float _2798 = cos(_2796);
    if (_2754)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7613 = as_type<float>(_2792);
        out.gl_Position.z = _7613;
    }
    float _2800 = _2794 * 0.15915493667125701904296875;
    float _2802 = _2774 * 6.283185482025146484375;
    float _2804 = sin(_2802);
    float _2806 = _2774 * 6.283185482025146484375;
    float _2808 = cos(_2806);
    if (_2754)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2810 = _2800 * 6.283185482025146484375;
    float _2812 = cos(_2810);
    float _2814 = _2418 * _2764;
    float _2816 = _529 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2818 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _2820 = _527 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2822 = _2798 * _2808;
    float _2824 = _2814 * _2816;
    float _2826 = _2782 * _2808;
    float _2828 = _2800 * 6.283185482025146484375;
    float _2830 = sin(_2828);
    float _2832 = _2814 * _2820;
    float _2834 = _2818 * _2824;
    float _2836 = _2782 * _2804;
    float _2838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _2840 = _2798 * _2804;
    bool _2842 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2844 = isnan(0.5);
    bool _2846 = _2842 || _2844;
    bool _2848 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2850 = _2846 || _2848;
    float _2852 = _2798 * _2812;
    float _2854 = _2808 * _2812;
    float _2856 = _2782 * _2812;
    float _2858 = _2804 * _2812;
    float _2860 = _2838 * _2832;
    float _2862 = _2852 * _2834;
    float _2864 = _2814 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2866 = _2864 * 0.5;
    float _2868 = fma(_2830, _2822, _2836);
    float _2870 = -_2826;
    float _2872 = fma(_2830, _2840, _2870);
    float _2874 = -_2834;
    float _2876 = _2830 * _2874;
    float _2878 = -_2840;
    float _2880 = fma(_2830, _2826, _2878);
    float _2882 = fma(_2868, _2860, _2862);
    float _2884 = _2856 * _2834;
    float _2886 = fma(_2854, _2860, _2876);
    float _2888 = fma(_2830, _2836, _2822);
    float _2890 = fma(_2872, _2866, _2882);
    float _2892 = fma(_2880, _2860, _2884);
    float _2894 = fma(_2858, _2866, _2886);
    float _2896 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2898 = fma(_2888, _2866, _2892);
    float _2900 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2902 = _2890 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2904 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2896);
    float _2906 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2900);
    float _2908 = fma(_2894, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2902);
    float _2910 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2904);
    float _2912 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2906);
    float _2914 = fma(_2898, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2908);
    float _2916 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2918 = _2912 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2920 = _2914 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2922 = _1860 + _2916;
    float _2924 = _2294 + _2918;
    float _2926 = _1856 + _2920;
    float _2928 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2930 = _2922 + _2928;
    float _2932 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2934 = _2924 + _2932;
    float _2936 = _2930 * _2930;
    float _2938 = fma(_2934, _2934, _2936);
    float _2940 = sqrt(_2938);
    bool _2942 = _2940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2944 = _2860;
    float _2946 = _2924;
    float _2948 = _2922;
    if (!_2942)
    {
        _2944 = _2926;
    }
    float _2950 = _2944;
    bool _2952 = !_2942;
    float _2954 = _2950;
    if (!_2952)
    {
        float _2956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2960 = _2940 + _2958;
        float _2962 = rsqrt(_2938);
        float _2964 = _2960 * _2956;
        float _2966 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2968 = _2964 * 0.15915493667125701904296875;
        float _2970 = _2968 * 6.283185482025146484375;
        float _2972 = cos(_2970);
        float _2974 = _2968 * 6.283185482025146484375;
        float _2976 = sin(_2974);
        float _2978 = _2972 + (-1.0);
        float _2980 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2982 = fma(_2976, _2966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2984 = fma(_2926, _2972, _2980);
        float _2986 = _2962 * _2982;
        float _2988 = fma(_2934, _2986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2990 = fma(_2930, _2986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2946 = _2988;
        _2954 = _2984;
        _2948 = _2990;
    }
    float _2992 = _2946;
    float _2994 = _2954;
    float _2996 = _2948;
    float _2998 = -_2460;
    float _3000 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2992);
    float _3002 = -_2458;
    float _3004 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2994);
    float _3006 = -_2672;
    float _3008 = fma(_3006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2996);
    float _3010 = _3004;
    float _3012 = _3000;
    float _3014 = _3008;
    if (!_2850)
    {
        float _3016 = _2716 * _2716;
        float _3018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3020 = -_1860;
        float _3022 = _3020 + _2996;
        float _3024 = fma(_2720, _2720, _3016);
        float _3026 = fma(_2726, _2726, _3024);
        float _3028 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3030 = sqrt(_3026);
        float _3032 = 1.0 / _2814;
        float _3034 = _3028 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3036 = precise::min(_3030, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3038 = _3036 * _3018;
        float _3040 = _3038 * _3032;
        float _3042 = -_2294;
        float _3044 = _3042 + _2992;
        float _3046 = -_1856;
        float _3048 = _3046 + _2994;
        float _3050 = _3034 * _3040;
        float _3052 = _3022 * _3040;
        float _3054 = fma(_3044, _3050, _2706);
        float _3056 = fma(_3048, _3050, _2702);
        float _3058 = fma(_3034, _3052, _2712);
        _3010 = _3056;
        _3012 = _3054;
        _3014 = _3058;
        _1866 = _3052;
    }
    float _3060 = _3010;
    float _3062 = _3012;
    float _3064 = _3014;
    float _3066 = _1866;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3070 = _3060 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3074 = _3062 + _3072;
    float _3076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3078 = _3064 + _3076;
    float _3080 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3082 = _3070 * _3070;
    float _3084 = fma(_3074, _3074, _3082);
    float _3086 = fma(_3078, _3078, _3084);
    float _3088 = rsqrt(_3086);
    float _3090 = sqrt(_3086);
    float _3092 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3094 = _3074 * _3092;
    float _3096 = _3078 * _3092;
    float _3098 = _3094 * _3094;
    float _3100 = _3096 * _3096;
    float _3102 = _3098 + _3100;
    float _3104 = sqrt(_3102);
    bool _3106 = _3104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3110 = _3104 + _3108;
    float _3112 = _3088;
    float _3114 = _3102;
    float _3116 = _3110;
    float _3118 = _3070;
    float _3120 = _3066;
    if (_3106)
    {
        float _3122 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3112 = _3122;
    }
    float _3124 = _3112;
    if (_3106)
    {
        float _3126 = rsqrt(_3102);
        _3114 = _3126;
    }
    float _3128 = _3114;
    float _3130 = _3128;
    if (_3106)
    {
        float _3132 = _3110 * _3124;
        _3116 = _3132;
    }
    float _3134 = _3116;
    if (_3106)
    {
        float _3136 = _3134 * 0.15915493667125701904296875;
        _2776 = _3136;
    }
    float _3138 = _2776;
    float _3140 = _3078;
    float _3142 = _3138;
    if (_3106)
    {
        float _3144 = _3138 * 6.283185482025146484375;
        float _3146 = sin(_3144);
        _3140 = _3146;
    }
    float _3148 = _3140;
    float _3150 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3152 = precise::max(0.0, _3150);
    float _3154 = _3124;
    float _3156 = _3152;
    if (_3106)
    {
        float _3158 = _3138 * 6.283185482025146484375;
        float _3160 = cos(_3158);
        _3154 = _3160;
    }
    float _3162 = _3154;
    float _3164 = -_3092;
    float _3166 = -_3152;
    float _3168 = fma(_3070, _3164, _3166);
    if (_3106)
    {
        float _3170 = _3168 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3118 = _3170;
    }
    float _3172 = _3118;
    float _3174 = _3172;
    float _3176 = _3148;
    if (_3106)
    {
        float _3178 = fma(_3148, _3172, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3174 = _3178;
    }
    float _3180 = _3174;
    float _3182 = _3180;
    if (!_3106)
    {
        _3176 = _3094;
    }
    float _3184 = _3176;
    float _3186 = _3184;
    float _3188 = _3162;
    if (_3106)
    {
        float _3190 = _3162 + (-1.0);
        _3156 = _3190;
    }
    float _3192 = _3156;
    float _3194 = _3192;
    if (_3106)
    {
        float _3196 = _3128 * _3180;
        _3120 = _3196;
    }
    float _3198 = _3120;
    if (!_3106)
    {
        _3182 = _3168;
    }
    float _3200 = _3182;
    float _3202 = _3200;
    if (_3106)
    {
        float _3204 = _3192 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3142 = _3204;
    }
    float _3206 = _3142;
    if (_3106)
    {
        float _3208 = _3094 * _3198;
        _3186 = _3208;
    }
    float _3210 = _3186;
    if (!_3106)
    {
        _3194 = _3096;
    }
    float _3212 = _3194;
    float _3214 = _3212;
    if (_3106)
    {
        float _3216 = _3096 * _3198;
        _3214 = _3216;
    }
    float _3218 = _3214;
    if (!_3106)
    {
        _3130 = _3098;
    }
    float _3220 = _3130;
    float _3222 = _3220;
    if (_3106)
    {
        float _3224 = fma(_3168, _3162, _3206);
        _3202 = _3224;
    }
    float _3226 = _3202;
    if (_3106)
    {
        float _3228 = _3210 * _3210;
        _3222 = _3228;
    }
    float _3230 = _3222;
    if (!_3106)
    {
        _3188 = _3100;
    }
    float _3232 = _3188;
    float _3234 = _3232;
    if (_3106)
    {
        float _3236 = _3218 * _3218;
        _3234 = _3236;
    }
    float _3238 = _3234;
    float _3240 = fma(_3226, _3226, _3230);
    float _3242 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3244 = _3240 + _3238;
    float _3246 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3242);
    float _3248 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3250 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3252 = fma(_3090, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3250);
    float _3254 = precise::clamp(_3252, 0.0, 1.0);
    float _3256 = rsqrt(_3244);
    float _3258 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3246);
    float _3260 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3262 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3248);
    float _3264 = -_3254;
    float _3266 = _3264 + 1.0;
    float _3268 = _3258 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3270 = _3060 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3272 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3260);
    float _3274 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3262);
    float _3276 = abs(_3266);
    float _3278 = log2(_3276);
    float _3280 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3282 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3270);
    float _3284 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3272);
    float _3286 = _3274 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3288 = -_3280;
    float _3290 = fma(_3288, _3080, 1.0);
    float _3292 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3282);
    float _3294 = _3256 * _3210;
    float _3296 = _3256 * _3226;
    float _3298 = _3284 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3300 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3302 = _3294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3304 = _3256 * _3218;
    float _3306 = _3292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3308 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3300);
    float _3310 = -_3302;
    float _3312 = fma(_3296, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3310);
    float _3314 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3316 = log2(_3290);
    float _3318 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3308);
    float _3320 = -_3304;
    float _3322 = fma(_3320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3312);
    float _3324 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3326 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3328 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3318);
    float _3330 = fma(_3322, -0.5, 0.5);
    float _3332 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3324);
    float _3334 = exp2(_3314);
    float _3336 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3326);
    float _3338 = fma(_3322, 0.5, 0.5);
    float _3340 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3332);
    float _3342 = _3296 + 1.0;
    float _3344 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3336);
    float _3346 = fma(_3338, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3348 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3340);
    float _3350 = 1.0 / _3328;
    float _3352 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3344);
    float _3354 = fma(_3338, _3346, -0.212114393711090087890625);
    float _3356 = _3316 * 0.693147182464599609375;
    float _3358 = fma(_3338, _3354, 1.570728778839111328125);
    float _3360 = _3356 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3362 = sqrt(_3330);
    float _3364 = -_3296;
    float _3366 = fma(_3334, _3342, _3364);
    float _3368 = fma(_3366, 0.5, 0.5);
    float _3370 = _3348 * _3350;
    float _3372 = _3352 * _3350;
    float _3374 = fma(_3370, 0.5, 0.5);
    float _3376 = fma(_3372, -0.5, 0.5);
    float _3378 = _3362 * 0.636619746685028076171875;
    float3 _8560 = float3(_3374, _3376, _3360);
    float _3380 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8560, float3(0.0), isnan(_8560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8560, float3(0.0), isnan(_8560)), level(0.0)).x;
    float3 _8571 = float3(_3374, _3376, _3360);
    float4 _3383 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8571, float3(0.0), isnan(_8571)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8571, float3(0.0), isnan(_8571)), level(0.0)).xyzw;
    float _3385 = _3383.x;
    float _3387 = _3383.y;
    float _3389 = _3383.z;
    float _3391 = _3383.w;
    float _3393 = -_3358;
    float _3395 = fma(_3378, _3393, 1.0);
    float2 _8593 = float2(_3395, _3368);
    float3 _3399 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8593, float2(0.0), isnan(_8593)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8593, float2(0.0), isnan(_8593)), level(0.0)).xyz;
    float _3401 = _3399.x;
    float _3403 = _3399.y;
    float _3405 = _3399.z;
    float _3407 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3409 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3411 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3413 = _2868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3415 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3417 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3419 = _2852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3421 = fma(_3407, _3407, 1.0);
    float _3423 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3413);
    float _3425 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3409);
    float _3427 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3411);
    float _3429 = rsqrt(_3421);
    float _3431 = -_2830;
    float _3433 = fma(_3431, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3415);
    float _3435 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3437 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3439 = -_2830;
    float _3441 = fma(_3439, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3417);
    float _3443 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3445 = -_2830;
    float _3447 = fma(_3445, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3419);
    float _3449 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3433);
    float _3451 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3441);
    float _3453 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3443);
    float _3455 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3447);
    float _3457 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3459 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3437);
    float _3461 = fma(_2858, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3435);
    float _3463 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3465 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3457);
    float _3467 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3425);
    float _3469 = _3407 * _3449;
    float _3471 = _3407 * _3451;
    float _3473 = _3407 * _3455;
    float _3475 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3459);
    float _3477 = _3407 * _3429;
    float _3479 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3461);
    float _3481 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3427);
    float _3483 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3423);
    float _3485 = fma(_3268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3465);
    float _3487 = fma(_2888, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3453);
    float _3489 = -_3475;
    float _3491 = _3477 * _3489;
    float _3493 = _3278 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3495 = fma(_3463, _3467, _3469);
    float _3497 = fma(_3463, _3481, _3471);
    float _3499 = fma(_3463, _3483, _3473);
    float _3501 = -_3479;
    float _3503 = _3477 * _3501;
    float _3505 = -_3487;
    float _3507 = _3477 * _3505;
    float _3509 = fma(_3429, _3451, _3491);
    out.m_68.x = _3467;
    out.m_68.y = _3481;
    out.m_68.z = _3483;
    float _3511 = exp2(_3493);
    float _3513 = fma(_3306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3485);
    float _3515 = fma(_3429, _3449, _3503);
    float _3517 = _3348 + _3328;
    float _3519 = fma(_3429, _3455, _3507);
    float _3521 = _3513 + _3328;
    float _3523 = _3475 + _3497;
    float _3525 = _3487 + _3499;
    out.m_70.x = _3062;
    out.m_70.y = _3060;
    out.m_70.z = _3064;
    float _3527 = _3328 * 0.5;
    float _3529 = _3479 + _3495;
    float _3531 = _3521 * 0.5;
    float _3533 = fma(_3352, -0.5, _3527);
    float _3535 = _3517 * 0.5;
    float _3537 = -_3511;
    float _3539 = _3537 + 1.0;
    float _3541 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _3515;
    out.m_72.y = _3509;
    out.m_72.z = _3519;
    float _3543 = _3539 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _3529;
    out.m_74.y = _3523;
    out.m_74.z = _3525;
    out.gl_Position.x = _3348;
    out.gl_Position.y = _3352;
    out.gl_Position.z = _3513;
    out.gl_Position.w = _3328;
    out.m_76.x = _3535;
    out.m_76.y = _3533;
    out.m_76.z = _3531;
    out.m_76.w = _3328;
    out.m_45.x = _3541;
    float _3545 = _3543 * _3380;
    float _3547 = -_3543;
    float _3549 = _3547 + 1.0;
    float _3551 = _3391 * _3545;
    float _3553 = _3391 * _3549;
    float _3555 = _3405 * _3545;
    float _3557 = fma(_3401, _3551, _3385);
    float _3559 = fma(_3403, _3551, _3387);
    float _3561 = fma(_3391, _3555, _3389);
    out.m_78.x = _3557;
    out.m_78.y = _3559;
    out.m_78.z = _3561;
    out.m_78.w = _3553;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

