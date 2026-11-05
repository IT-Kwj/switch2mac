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
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1032 = false;
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1630 = as_type<float>(_101);
        out.gl_Position.z = _1630;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1699 = as_type<float>(_137);
        out.gl_Position.z = _1699;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _143 * _141;
    float _167 = 0.0;
    float _169 = _147;
    if (!_163)
    {
        float _171 = _147 * _147;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _179 = _175;
    if (!_163)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _177 * 6.283185482025146484375;
    float _187 = floor(_177);
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    float _197 = _185 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _197 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_195;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = -_187;
    float _213 = _177 + _211;
    bool _215 = !_191;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_163;
    float _221 = _183;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _147 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _147);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_163;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _147 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _169 = _275;
    }
    float _277 = _169;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_56.w;
    float _289 = fma(_205, 0.5, 0.5);
    bool _291 = _213 < 0.5;
    float _293 = float(_291);
    float _295 = in.m_44.x;
    float _297 = in.m_44.y;
    float _299 = in.m_44.z;
    bool _301 = !_281;
    int _303 = _301 ? 0 : 1;
    float _305 = -_213;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = -_293;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _315 = -_289;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _319 = abs(_303);
    float _321 = fma(_277, _149, _309);
    bool _323 = !_201;
    int _325 = _323 ? 0 : 1;
    float _327 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = fma(_277, _151, _327);
    int _339 = abs(_325);
    float _341 = fma(_277, _153, _333);
    int _343 = abs(_331);
    float _345 = float(_319);
    float _347 = float(_339);
    float _349 = abs(_307);
    float _351 = _345 * _349;
    float _353 = fma(_337, _287, _297);
    float _355 = fma(_321, _287, _295);
    float _357 = float(_343);
    float _359 = fma(_347, _317, _351);
    float _361 = fma(_341, _287, _299);
    float _363 = abs(_313);
    float _365 = fma(_357, _363, _359);
    bool _367 = !_335;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_85);
        float _389 = 1.0 / _387;
        float _391 = _119 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _411 = 1.0 / _397;
    float _413 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _415 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _417 = 1.0 / _401;
    float _419 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _413);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _423 = _393 + _421;
    float _425 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _415);
    bool _427 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_393);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _441 = 1.0 / _405;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _445 = _393 + _443;
    float _447 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _439);
    bool _449 = _139 > 0.5;
    float _451 = _445 * _411;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _455 = _393 + _453;
    bool _457 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _459 = isnan(_393);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = 1.0 / _409;
    bool _471 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _473 = isnan(_393);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _423 * _417;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _487 = _393 + _485;
    float _489 = -_481;
    float _491 = _489 + 1.0;
    float _493 = _455 * _441;
    bool _495 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _497 = isnan(_393);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    bool _507 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _509 = isnan(_393);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = _487 * _469;
    float _521 = _505 * _491;
    float _523 = -_505;
    float _525 = _523 + 1.0;
    float _527 = -_517;
    float _529 = _527 + 1.0;
    float _531 = _517 * _525;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _533;
    float _537 = _437 * _529;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = -_437;
    float _545 = _543 + 1.0;
    float _547 = fma(_535, _451, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _553 = fma(_541, _451, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _555 = _467 * _545;
    float _557 = -_467;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _565 = _547 * _555;
    float _567 = _553 * _555;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _573;
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].x, _565);
    float _579 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].y, _567);
    float _581 = fma(_551, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _583 = fma(_571, _493, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _585 = fma(_575, _493, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _587 = fma(_563, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _589 = in.m_56.x;
    float _591 = in.m_56.y;
    float _593 = fma(_581, _537, _577);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _599 = fma(_587, _537, _579);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = fma(_597, _519, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _607 = fma(_603, _519, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _609 = fma(_583, _531, _593);
    float _611 = fma(_585, _531, _599);
    float _613 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _419);
    float _615 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _425);
    float _617 = fma(_605, _521, _609);
    float _619 = fma(_607, _521, _611);
    float _621 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _623 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _625 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _627 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _629 = sqrt(_613);
    float _631 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].x, _621);
    float _633 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].y, _623);
    float _635 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].z, _625);
    float _637 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].w, _627);
    float _639 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[147].x, _617);
    float _641 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[147].y, _619);
    float _643 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _447);
    float _645 = sqrt(_615);
    float _647 = _639 * _589;
    float _649 = _641 * _591;
    float _651 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].y, _633);
    float _653 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].x, _631);
    float _655 = _365 * _647;
    float _657 = _365 * _649;
    float _659 = _651 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _661 = sqrt(_643);
    float _663 = _653 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _665 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].z, _635);
    float _667 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].w, _637);
    float _669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _673 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _675 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _677 = _629 * _659;
    float _679 = _645 * _663;
    float _681 = _673 * _669;
    float _683 = _675 * _671;
    float _685 = _677 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _687 = _677 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _689 = _665 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _691 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _685);
    float _695 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _687);
    float _697 = _661 * _689;
    float _699 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _701 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _703 = _667 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[24].z, _693);
    float _707 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
    float _709 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _699);
    float _711 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _701);
    float _713 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[24].w, _705);
    float _715 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[26].w, _707);
    float _717 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _709);
    float _719 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _711);
    float _721 = _713 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _723 = _715 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _725 = _717 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _727 = _719 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _729 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _731 = in.m_51.y;
    float _733 = _721 + _725;
    float _735 = _723 + _727;
    float _737 = _677 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _739 = _729 * _139;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _733 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _747 = _735 + _745;
    float _749 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _737);
    float _751 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _753 = _743 * _743;
    float _755 = _747 * _747;
    float _757 = trunc(_739);
    int _759 = int(_757);
    float _761 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[25].z, _749);
    float _763 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
    float _765 = _753 + _755;
    float _767 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[25].w, _761);
    float _769 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _763);
    float _771 = sqrt(_765);
    float _773 = _767 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _775 = _769 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _779 = _777 != 0;
    bool _781 = _731 > 0.5;
    float _783 = _773 + _775;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _787 = _785 != 0;
    int _789 = _759 << 4;
    int _791 = _789 + 1968;
    float _793 = -_217;
    int _795 = _449 ? as_type<int>(_793) : as_type<int>(_217);
    int _797 = _791 + 8;
    uint _800 = uint(int(uint(_797) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[int(_802)][_804];
    bool _808 = _771 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _810 = uint(int(uint(_791) >> uint(2)));
    uint _812 = uint(int(uint(int(_810)) >> uint(2)));
    int _814 = int(_810) & 3;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[int(_812)][_814];
    int _818 = int(_810) + 1;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    int _822 = _818 & 3;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[int(_820)][_822];
    float _826 = _775;
    float _828 = as_type<float>(_791);
    float _830 = _767;
    float _832 = _691;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_808)
    {
        _826 = _755;
    }
    float _836 = _826;
    float _838 = _836;
    if (!_808)
    {
        _828 = _753;
    }
    float _840 = _828;
    float _842 = _840;
    if (!_808)
    {
        _830 = _733;
    }
    float _844 = _830;
    float _846 = _844;
    if (!_808)
    {
        _832 = _735;
    }
    float _848 = _832;
    float _850 = _848;
    if (!_808)
    {
        _834 = _783;
    }
    float _852 = _834;
    bool _854 = !_808;
    float _856 = _852;
    if (!_854)
    {
        float _858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _862 = _771 + _860;
        float _864 = rsqrt(_765);
        float _866 = _862 * _858;
        float _868 = _783 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _870 = _866 * 0.15915493667125701904296875;
        float _872 = _870 * 6.283185482025146484375;
        float _874 = sin(_872);
        float _876 = _870 * 6.283185482025146484375;
        float _878 = cos(_876);
        float _880 = fma(_874, _868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _882 = _864 * _880;
        float _884 = _878 + (-1.0);
        float _886 = fma(_743, _882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _888 = fma(_747, _882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _890 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _894 = _886 + _892;
        float _896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _898 = _888 + _896;
        float _900 = fma(_783, _878, _890);
        float _902 = _894 * _894;
        float _904 = _898 * _898;
        _856 = _900;
        _842 = _902;
        _838 = _904;
        _846 = _886;
        _850 = _888;
    }
    float _906 = _856;
    float _908 = _842;
    float _910 = _838;
    float _912 = _846;
    float _914 = _850;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _918 = _906 + _916;
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _922 = -_209;
    int _924 = _781 ? as_type<int>(_922) : as_type<int>(_209);
    float _926 = _806 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _928 = fma(_918, _918, _908);
    bool _930 = !_779;
    float _932 = _930 ? _217 : as_type<float>(_795);
    float _934 = _816 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _936 = !_787;
    float _938 = _936 ? _209 : as_type<float>(_924);
    float _940 = _928 + _910;
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _944 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = _932 + 0.5;
    float _948 = -_938;
    float _950 = _948 + 0.5;
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _954 = sqrt(_940);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _962 = _950 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _964 = _952 * _920;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _968 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _962 * _942;
    out.m_58.x = _968;
    out.m_58.y = _970;
    out.m_58.z = _972;
    out.m_58.w = _966;
    bool _982 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _984 = isnan(_954);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _990 = _986 || _988;
    out.m_60.x = _974;
    out.m_60.y = _976;
    out.m_60.z = _978;
    out.m_62.x = _964;
    out.m_62.y = _980;
    float _992 = _934;
    float _994 = _906;
    float _996 = _954;
    if (!_990)
    {
        _992 = 1.0;
    }
    float _998 = _992;
    bool _1000 = !_990;
    float _1002 = _998;
    if (!_1000)
    {
        bool _1004 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1006 = isnan(_954);
        bool _1008 = _1004 || _1006;
        bool _1010 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1012 = _1008 || _1010;
        if (!_1012)
        {
            float _1014 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1016 = _954 + _1014;
            float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1020 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1018;
            float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1024 = _1022 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1026 = 1.0 / _1020;
            float _1028 = _1016 * _1026;
            float _1030 = fma(_1028, _1024, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1002 = _1030;
            _1032 = true;
        }
        else
        {
            bool _1034 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1036 = isnan(_954);
            bool _1038 = _1034 || _1036;
            bool _1040 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1042 = _1038 || _1040;
            if (!_1042)
            {
                float _1044 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1046 = _954 + _1044;
                float _1048 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1050 = _1048 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1052 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1054 = _1052 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1056 = 1.0 / _1050;
                float _1058 = _1046 * _1056;
                float _1060 = fma(_1058, _1054, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1002 = _1060;
                _1032 = true;
            }
            else
            {
                _1002 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1032 = false;
    float _1062 = _1002;
    float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1066 = _906 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1070 = _912 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1074 = _914 + _1072;
    float _1076 = fma(_1066, _1062, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1078 = fma(_1070, _1062, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1080 = fma(_1074, _1062, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1084 = _1076 + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1088 = _1078 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1092 = _1080 + _1090;
    float _1094 = _1084 * _1084;
    float _1096 = fma(_1088, _1088, _1094);
    float _1098 = fma(_1092, _1092, _1096);
    float _1100 = rsqrt(_1098);
    float _1102 = _1100 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1104 = _1088 * _1102;
    float _1106 = _1092 * _1102;
    float _1108 = _1104 * _1104;
    float _1110 = _1106 * _1106;
    float _1112 = _1108 + _1110;
    float _1114 = sqrt(_1112);
    bool _1116 = _1114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1120 = _1114 + _1118;
    float _1122 = _1092;
    float _1124 = _1112;
    float _1126 = _1120;
    float _1128 = _1084;
    if (_1116)
    {
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1122 = _1130;
    }
    float _1132 = _1122;
    if (_1116)
    {
        float _1134 = rsqrt(_1112);
        _1124 = _1134;
    }
    float _1136 = _1124;
    if (_1116)
    {
        float _1138 = _1120 * _1132;
        _1126 = _1138;
    }
    float _1140 = _1126;
    if (_1116)
    {
        float _1142 = _1140 * 0.15915493667125701904296875;
        _994 = _1142;
    }
    float _1144 = _994;
    float _1146 = _1096;
    float _1148 = _1144;
    if (_1116)
    {
        float _1150 = _1144 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        _1146 = _1152;
    }
    float _1154 = _1146;
    float _1156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1158 = precise::max(0.0, _1156);
    float _1160 = _1100;
    float _1162 = _1158;
    float _1164 = _1156;
    if (_1116)
    {
        float _1166 = _1144 * 6.283185482025146484375;
        float _1168 = cos(_1166);
        _1160 = _1168;
    }
    float _1170 = _1160;
    float _1172 = -_1102;
    float _1174 = -_1158;
    float _1176 = fma(_1084, _1172, _1174);
    if (!_1116)
    {
        _1128 = _1104;
    }
    float _1178 = _1128;
    float _1180 = _1178;
    if (_1116)
    {
        float _1182 = _1176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1182;
    }
    float _1184 = _1162;
    float _1186 = _1154;
    float _1188 = _1184;
    if (_1116)
    {
        float _1190 = fma(_1154, _1184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1186 = _1190;
    }
    float _1192 = _1186;
    float _1194 = _1192;
    if (!_1116)
    {
        _1188 = _1176;
    }
    float _1196 = _1188;
    float _1198 = _1196;
    float _1200 = _1170;
    if (_1116)
    {
        float _1202 = _1170 + (-1.0);
        _1164 = _1202;
    }
    float _1204 = _1164;
    float _1206 = _1204;
    if (_1116)
    {
        float _1208 = _1136 * _1192;
        _996 = _1208;
    }
    float _1210 = _996;
    if (!_1116)
    {
        _1194 = _1108;
    }
    float _1212 = _1194;
    float _1214 = sqrt(_1098);
    float _1216 = _1212;
    if (_1116)
    {
        float _1218 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1148 = _1218;
    }
    float _1220 = _1148;
    if (_1116)
    {
        float _1222 = _1104 * _1210;
        _1180 = _1222;
    }
    float _1224 = _1180;
    if (!_1116)
    {
        _1206 = _1106;
    }
    float _1226 = _1206;
    float _1228 = _1226;
    if (_1116)
    {
        float _1230 = _1106 * _1210;
        _1228 = _1230;
    }
    float _1232 = _1228;
    if (_1116)
    {
        float _1234 = fma(_1176, _1170, _1220);
        _1198 = _1234;
    }
    float _1236 = _1198;
    if (_1116)
    {
        float _1238 = _1224 * _1224;
        _1216 = _1238;
    }
    float _1240 = _1216;
    if (!_1116)
    {
        _1200 = _1110;
    }
    float _1242 = _1200;
    float _1244 = _1242;
    if (_1116)
    {
        float _1246 = _1232 * _1232;
        _1244 = _1246;
    }
    float _1248 = _1244;
    float _1250 = fma(_1236, _1236, _1240);
    float _1252 = _1250 + _1248;
    float _1254 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1258 = fma(_1214, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1256);
    float _1260 = precise::clamp(_1258, 0.0, 1.0);
    float _1262 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1264 = rsqrt(_1252);
    float _1266 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1268 = -_1260;
    float _1270 = _1268 + 1.0;
    float _1272 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1262);
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1276 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1266);
    float _1278 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1280 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1282 = abs(_1270);
    float _1284 = log2(_1282);
    float _1286 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1288 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1278);
    float _1290 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1272);
    float _1292 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1280);
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1296 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1288);
    float _1298 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1300 = _1264 * _1224;
    float _1302 = -_1294;
    float _1304 = fma(_1302, _1274, 1.0);
    float _1306 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1308 = _1264 * _1236;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1312 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1292);
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1316 = _1264 * _1232;
    float _1318 = -_1310;
    float _1320 = fma(_1308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1318);
    float _1322 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1324 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1314);
    float _1326 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1328 = -_1316;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1320);
    float _1332 = log2(_1304);
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1324);
    float _1336 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1338 = fma(_1330, -0.5, 0.5);
    float _1340 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1342 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1344 = fma(_1330, 0.5, 0.5);
    float _1346 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1336);
    float _1348 = exp2(_1322);
    float _1350 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1340);
    float _1352 = _1308 + 1.0;
    float _1354 = fma(_1344, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1356 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1346);
    float _1358 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1350);
    float _1360 = fma(_1344, _1354, -0.212114393711090087890625);
    float _1362 = 1.0 / _1342;
    float _1364 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1358);
    float _1366 = _1332 * 0.693147182464599609375;
    float _1368 = fma(_1344, _1360, 1.570728778839111328125);
    float _1370 = sqrt(_1338);
    float _1372 = -_1308;
    float _1374 = fma(_1348, _1352, _1372);
    float _1376 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1356);
    float _1378 = fma(_1374, 0.5, 0.5);
    float _1380 = _1376 * _1362;
    float _1382 = _1364 * _1362;
    float _1384 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1386 = fma(_1380, 0.5, 0.5);
    float _1388 = fma(_1382, -0.5, 0.5);
    float _1390 = _1370 * 0.636619746685028076171875;
    float _1392 = -_1368;
    float _1394 = fma(_1390, _1392, 1.0);
    float3 _3801 = float3(_1386, _1388, _1384);
    float _1396 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3801, float3(0.0), isnan(_3801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3801, float3(0.0), isnan(_3801)), level(0.0)).x;
    float3 _3812 = float3(_1386, _1388, _1384);
    float4 _1399 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3812, float3(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3812, float3(0.0), isnan(_3812)), level(0.0)).xyzw;
    float _1401 = _1399.x;
    float _1403 = _1399.y;
    float _1405 = _1399.z;
    float _1407 = _1399.w;
    float2 _3829 = float2(_1394, _1378);
    float3 _1411 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3829, float2(0.0), isnan(_3829)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3829, float2(0.0), isnan(_3829)), level(0.0)).xyz;
    float _1413 = _1411.x;
    float _1415 = _1411.y;
    float _1417 = _1411.z;
    float _1419 = _773 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1421 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1423 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1419);
    float _1425 = _773 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1427 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1423);
    float _1429 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1425);
    float _1431 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1433 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1429);
    float _1435 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1437 = 1.0 / _1431;
    bool _1439 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan(0.5);
    bool _1447 = _1443 || _1445;
    float _1449 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1451 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1435);
    float _1453 = _1449 + _1431;
    float _1455 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1451);
    float _1457 = exp2(_1421);
    float _1459 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1455);
    float _1461 = _1453 * _1437;
    float _1463 = _1461 * 0.5;
    float _1465 = _1453;
    if (_1447)
    {
        _1465 = 1.0;
    }
    float _1467 = _1465;
    float _1469 = _1467;
    if (!_1447)
    {
        float _1471 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1475 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1473);
        float _1477 = _1471 * 0.15915493667125701904296875;
        float _1479 = _1477 * 6.283185482025146484375;
        float _1481 = cos(_1479);
        float _1483 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1485 = _1483 * 0.15915493667125701904296875;
        float _1487 = _1477 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = 1.0 / _1481;
        float _1493 = _1485 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = _1489 * _1491;
        float _1499 = 1.0 / _1475;
        float _1501 = _1495 * _1497;
        float _1503 = _1485 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1509 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1507;
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1513 = _1499 * _1511;
        float _1515 = 1.0 / _1501;
        float _1517 = 1.0 / _1509;
        float _1519 = _1505 * _1515;
        float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1523 = fma(_1519, _1513, _1521);
        float _1525 = _1523 * _1517;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        _1469 = _1527;
    }
    float _1529 = _1469;
    float _1531 = _1459 + _1342;
    float _1533 = -_1457;
    float _1535 = _1533 + 1.0;
    bool _1537 = _1529 > 0.0;
    bool _1539 = isnan(_1529);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(0.0);
    bool _1545 = _1541 || _1543;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1549 = _1531 * 0.5;
    float _1551 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1553 = _1547 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1555 = _1551 * _1396;
    float _1557 = -_1551;
    float _1559 = _1557 + 1.0;
    out.gl_Position.x = _1376;
    out.gl_Position.y = _1364;
    out.gl_Position.z = _1459;
    out.gl_Position.w = _1342;
    float _1561 = _1407 * _1555;
    float _1563 = _1417 * _1555;
    float _1565 = _1407 * _1559;
    out.m_64.z = _1549;
    out.m_64.w = _1342;
    float _1567 = fma(_1413, _1561, _1401);
    float _1569 = fma(_1415, _1561, _1403);
    float _1571 = fma(_1407, _1563, _1405);
    out.m_47.x = _1553;
    out.m_66.x = _1567;
    out.m_66.y = _1569;
    out.m_66.z = _1571;
    out.m_66.w = _1565;
    if (_1545)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1573 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1573;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1032 = false;
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1630 = as_type<float>(_101);
        out.gl_Position.z = _1630;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1699 = as_type<float>(_137);
        out.gl_Position.z = _1699;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _143 * _141;
    float _167 = 0.0;
    float _169 = _147;
    if (!_163)
    {
        float _171 = _147 * _147;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _179 = _175;
    if (!_163)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _177 * 6.283185482025146484375;
    float _187 = floor(_177);
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    float _197 = _185 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _197 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_195;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = -_187;
    float _213 = _177 + _211;
    bool _215 = !_191;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_163;
    float _221 = _183;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _147 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _147);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_163;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _147 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _169 = _275;
    }
    float _277 = _169;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_56.w;
    float _289 = fma(_205, 0.5, 0.5);
    bool _291 = _213 < 0.5;
    float _293 = float(_291);
    float _295 = in.m_44.x;
    float _297 = in.m_44.y;
    float _299 = in.m_44.z;
    bool _301 = !_281;
    int _303 = _301 ? 0 : 1;
    float _305 = -_213;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = -_293;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _315 = -_289;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _319 = abs(_303);
    float _321 = fma(_277, _149, _309);
    bool _323 = !_201;
    int _325 = _323 ? 0 : 1;
    float _327 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = fma(_277, _151, _327);
    int _339 = abs(_325);
    float _341 = fma(_277, _153, _333);
    int _343 = abs(_331);
    float _345 = float(_319);
    float _347 = float(_339);
    float _349 = abs(_307);
    float _351 = _345 * _349;
    float _353 = fma(_337, _287, _297);
    float _355 = fma(_321, _287, _295);
    float _357 = float(_343);
    float _359 = fma(_347, _317, _351);
    float _361 = fma(_341, _287, _299);
    float _363 = abs(_313);
    float _365 = fma(_357, _363, _359);
    bool _367 = !_335;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_85);
        float _389 = 1.0 / _387;
        float _391 = _119 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _411 = 1.0 / _397;
    float _413 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _415 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _417 = 1.0 / _401;
    float _419 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _413);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _423 = _393 + _421;
    float _425 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _415);
    bool _427 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_393);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _441 = 1.0 / _405;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _445 = _393 + _443;
    float _447 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _439);
    bool _449 = _139 > 0.5;
    float _451 = _445 * _411;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _455 = _393 + _453;
    bool _457 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _459 = isnan(_393);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = 1.0 / _409;
    bool _471 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _473 = isnan(_393);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _423 * _417;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _487 = _393 + _485;
    float _489 = -_481;
    float _491 = _489 + 1.0;
    float _493 = _455 * _441;
    bool _495 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _497 = isnan(_393);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    bool _507 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _509 = isnan(_393);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = _487 * _469;
    float _521 = _505 * _491;
    float _523 = -_505;
    float _525 = _523 + 1.0;
    float _527 = -_517;
    float _529 = _527 + 1.0;
    float _531 = _517 * _525;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _533;
    float _537 = _437 * _529;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = -_437;
    float _545 = _543 + 1.0;
    float _547 = fma(_535, _451, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _553 = fma(_541, _451, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _555 = _467 * _545;
    float _557 = -_467;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _565 = _547 * _555;
    float _567 = _553 * _555;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _573;
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].x, _565);
    float _579 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].y, _567);
    float _581 = fma(_551, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _583 = fma(_571, _493, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _585 = fma(_575, _493, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _587 = fma(_563, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _589 = in.m_56.x;
    float _591 = in.m_56.y;
    float _593 = fma(_581, _537, _577);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _599 = fma(_587, _537, _579);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = fma(_597, _519, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _607 = fma(_603, _519, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _609 = fma(_583, _531, _593);
    float _611 = fma(_585, _531, _599);
    float _613 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _419);
    float _615 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _425);
    float _617 = fma(_605, _521, _609);
    float _619 = fma(_607, _521, _611);
    float _621 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _623 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _625 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _627 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _629 = sqrt(_613);
    float _631 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].x, _621);
    float _633 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].y, _623);
    float _635 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].z, _625);
    float _637 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].w, _627);
    float _639 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[147].x, _617);
    float _641 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[147].y, _619);
    float _643 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _447);
    float _645 = sqrt(_615);
    float _647 = _639 * _589;
    float _649 = _641 * _591;
    float _651 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].y, _633);
    float _653 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].x, _631);
    float _655 = _365 * _647;
    float _657 = _365 * _649;
    float _659 = _651 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _661 = sqrt(_643);
    float _663 = _653 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _665 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].z, _635);
    float _667 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].w, _637);
    float _669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _673 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _675 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _677 = _629 * _659;
    float _679 = _645 * _663;
    float _681 = _673 * _669;
    float _683 = _675 * _671;
    float _685 = _677 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _687 = _677 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _689 = _665 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _691 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _685);
    float _695 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _687);
    float _697 = _661 * _689;
    float _699 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _701 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _703 = _667 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[24].z, _693);
    float _707 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
    float _709 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _699);
    float _711 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _701);
    float _713 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[24].w, _705);
    float _715 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[26].w, _707);
    float _717 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _709);
    float _719 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _711);
    float _721 = _713 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _723 = _715 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _725 = _717 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _727 = _719 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _729 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _731 = in.m_51.y;
    float _733 = _721 + _725;
    float _735 = _723 + _727;
    float _737 = _677 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _739 = _729 * _139;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _733 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _747 = _735 + _745;
    float _749 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _737);
    float _751 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _753 = _743 * _743;
    float _755 = _747 * _747;
    float _757 = trunc(_739);
    int _759 = int(_757);
    float _761 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[25].z, _749);
    float _763 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
    float _765 = _753 + _755;
    float _767 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[25].w, _761);
    float _769 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _763);
    float _771 = sqrt(_765);
    float _773 = _767 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _775 = _769 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _779 = _777 != 0;
    bool _781 = _731 > 0.5;
    float _783 = _773 + _775;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _787 = _785 != 0;
    int _789 = _759 << 4;
    int _791 = _789 + 1968;
    float _793 = -_217;
    int _795 = _449 ? as_type<int>(_793) : as_type<int>(_217);
    int _797 = _791 + 8;
    uint _800 = uint(int(uint(_797) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[int(_802)][_804];
    bool _808 = _771 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _810 = uint(int(uint(_791) >> uint(2)));
    uint _812 = uint(int(uint(int(_810)) >> uint(2)));
    int _814 = int(_810) & 3;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[int(_812)][_814];
    int _818 = int(_810) + 1;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    int _822 = _818 & 3;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[int(_820)][_822];
    float _826 = _775;
    float _828 = as_type<float>(_791);
    float _830 = _767;
    float _832 = _691;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_808)
    {
        _826 = _755;
    }
    float _836 = _826;
    float _838 = _836;
    if (!_808)
    {
        _828 = _753;
    }
    float _840 = _828;
    float _842 = _840;
    if (!_808)
    {
        _830 = _733;
    }
    float _844 = _830;
    float _846 = _844;
    if (!_808)
    {
        _832 = _735;
    }
    float _848 = _832;
    float _850 = _848;
    if (!_808)
    {
        _834 = _783;
    }
    float _852 = _834;
    bool _854 = !_808;
    float _856 = _852;
    if (!_854)
    {
        float _858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _862 = _771 + _860;
        float _864 = rsqrt(_765);
        float _866 = _862 * _858;
        float _868 = _783 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _870 = _866 * 0.15915493667125701904296875;
        float _872 = _870 * 6.283185482025146484375;
        float _874 = sin(_872);
        float _876 = _870 * 6.283185482025146484375;
        float _878 = cos(_876);
        float _880 = fma(_874, _868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _882 = _864 * _880;
        float _884 = _878 + (-1.0);
        float _886 = fma(_743, _882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _888 = fma(_747, _882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _890 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _894 = _886 + _892;
        float _896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _898 = _888 + _896;
        float _900 = fma(_783, _878, _890);
        float _902 = _894 * _894;
        float _904 = _898 * _898;
        _856 = _900;
        _842 = _902;
        _838 = _904;
        _846 = _886;
        _850 = _888;
    }
    float _906 = _856;
    float _908 = _842;
    float _910 = _838;
    float _912 = _846;
    float _914 = _850;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _918 = _906 + _916;
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _922 = -_209;
    int _924 = _781 ? as_type<int>(_922) : as_type<int>(_209);
    float _926 = _806 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _928 = fma(_918, _918, _908);
    bool _930 = !_779;
    float _932 = _930 ? _217 : as_type<float>(_795);
    float _934 = _816 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _936 = !_787;
    float _938 = _936 ? _209 : as_type<float>(_924);
    float _940 = _928 + _910;
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _944 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = _932 + 0.5;
    float _948 = -_938;
    float _950 = _948 + 0.5;
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _954 = sqrt(_940);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _962 = _950 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _964 = _952 * _920;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _968 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _962 * _942;
    out.m_58.x = _968;
    out.m_58.y = _970;
    out.m_58.z = _972;
    out.m_58.w = _966;
    bool _982 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _984 = isnan(_954);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _990 = _986 || _988;
    out.m_60.x = _974;
    out.m_60.y = _976;
    out.m_60.z = _978;
    out.m_62.x = _964;
    out.m_62.y = _980;
    float _992 = _934;
    float _994 = _906;
    float _996 = _954;
    if (!_990)
    {
        _992 = 1.0;
    }
    float _998 = _992;
    bool _1000 = !_990;
    float _1002 = _998;
    if (!_1000)
    {
        bool _1004 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1006 = isnan(_954);
        bool _1008 = _1004 || _1006;
        bool _1010 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1012 = _1008 || _1010;
        if (!_1012)
        {
            float _1014 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1016 = _954 + _1014;
            float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1020 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1018;
            float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1024 = _1022 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1026 = 1.0 / _1020;
            float _1028 = _1016 * _1026;
            float _1030 = fma(_1028, _1024, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1002 = _1030;
            _1032 = true;
        }
        else
        {
            bool _1034 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1036 = isnan(_954);
            bool _1038 = _1034 || _1036;
            bool _1040 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1042 = _1038 || _1040;
            if (!_1042)
            {
                float _1044 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1046 = _954 + _1044;
                float _1048 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1050 = _1048 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1052 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1054 = _1052 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1056 = 1.0 / _1050;
                float _1058 = _1046 * _1056;
                float _1060 = fma(_1058, _1054, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1002 = _1060;
                _1032 = true;
            }
            else
            {
                _1002 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1032 = false;
    float _1062 = _1002;
    float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1066 = _906 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1070 = _912 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1074 = _914 + _1072;
    float _1076 = fma(_1066, _1062, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1078 = fma(_1070, _1062, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1080 = fma(_1074, _1062, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1084 = _1076 + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1088 = _1078 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1092 = _1080 + _1090;
    float _1094 = _1084 * _1084;
    float _1096 = fma(_1088, _1088, _1094);
    float _1098 = fma(_1092, _1092, _1096);
    float _1100 = rsqrt(_1098);
    float _1102 = _1100 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1104 = _1088 * _1102;
    float _1106 = _1092 * _1102;
    float _1108 = _1104 * _1104;
    float _1110 = _1106 * _1106;
    float _1112 = _1108 + _1110;
    float _1114 = sqrt(_1112);
    bool _1116 = _1114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1120 = _1114 + _1118;
    float _1122 = _1092;
    float _1124 = _1112;
    float _1126 = _1120;
    float _1128 = _1084;
    if (_1116)
    {
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1122 = _1130;
    }
    float _1132 = _1122;
    if (_1116)
    {
        float _1134 = rsqrt(_1112);
        _1124 = _1134;
    }
    float _1136 = _1124;
    if (_1116)
    {
        float _1138 = _1120 * _1132;
        _1126 = _1138;
    }
    float _1140 = _1126;
    if (_1116)
    {
        float _1142 = _1140 * 0.15915493667125701904296875;
        _994 = _1142;
    }
    float _1144 = _994;
    float _1146 = _1096;
    float _1148 = _1144;
    if (_1116)
    {
        float _1150 = _1144 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        _1146 = _1152;
    }
    float _1154 = _1146;
    float _1156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1158 = precise::max(0.0, _1156);
    float _1160 = _1100;
    float _1162 = _1158;
    float _1164 = _1156;
    if (_1116)
    {
        float _1166 = _1144 * 6.283185482025146484375;
        float _1168 = cos(_1166);
        _1160 = _1168;
    }
    float _1170 = _1160;
    float _1172 = -_1102;
    float _1174 = -_1158;
    float _1176 = fma(_1084, _1172, _1174);
    if (!_1116)
    {
        _1128 = _1104;
    }
    float _1178 = _1128;
    float _1180 = _1178;
    if (_1116)
    {
        float _1182 = _1176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1182;
    }
    float _1184 = _1162;
    float _1186 = _1154;
    float _1188 = _1184;
    if (_1116)
    {
        float _1190 = fma(_1154, _1184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1186 = _1190;
    }
    float _1192 = _1186;
    float _1194 = _1192;
    if (!_1116)
    {
        _1188 = _1176;
    }
    float _1196 = _1188;
    float _1198 = _1196;
    float _1200 = _1170;
    if (_1116)
    {
        float _1202 = _1170 + (-1.0);
        _1164 = _1202;
    }
    float _1204 = _1164;
    float _1206 = _1204;
    if (_1116)
    {
        float _1208 = _1136 * _1192;
        _996 = _1208;
    }
    float _1210 = _996;
    if (!_1116)
    {
        _1194 = _1108;
    }
    float _1212 = _1194;
    float _1214 = sqrt(_1098);
    float _1216 = _1212;
    if (_1116)
    {
        float _1218 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1148 = _1218;
    }
    float _1220 = _1148;
    if (_1116)
    {
        float _1222 = _1104 * _1210;
        _1180 = _1222;
    }
    float _1224 = _1180;
    if (!_1116)
    {
        _1206 = _1106;
    }
    float _1226 = _1206;
    float _1228 = _1226;
    if (_1116)
    {
        float _1230 = _1106 * _1210;
        _1228 = _1230;
    }
    float _1232 = _1228;
    if (_1116)
    {
        float _1234 = fma(_1176, _1170, _1220);
        _1198 = _1234;
    }
    float _1236 = _1198;
    if (_1116)
    {
        float _1238 = _1224 * _1224;
        _1216 = _1238;
    }
    float _1240 = _1216;
    if (!_1116)
    {
        _1200 = _1110;
    }
    float _1242 = _1200;
    float _1244 = _1242;
    if (_1116)
    {
        float _1246 = _1232 * _1232;
        _1244 = _1246;
    }
    float _1248 = _1244;
    float _1250 = fma(_1236, _1236, _1240);
    float _1252 = _1250 + _1248;
    float _1254 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1258 = fma(_1214, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1256);
    float _1260 = precise::clamp(_1258, 0.0, 1.0);
    float _1262 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1264 = rsqrt(_1252);
    float _1266 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1268 = -_1260;
    float _1270 = _1268 + 1.0;
    float _1272 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1262);
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1276 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1266);
    float _1278 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1280 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1282 = abs(_1270);
    float _1284 = log2(_1282);
    float _1286 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1288 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1278);
    float _1290 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1272);
    float _1292 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1280);
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1296 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1288);
    float _1298 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1300 = _1264 * _1224;
    float _1302 = -_1294;
    float _1304 = fma(_1302, _1274, 1.0);
    float _1306 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1308 = _1264 * _1236;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1312 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1292);
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1316 = _1264 * _1232;
    float _1318 = -_1310;
    float _1320 = fma(_1308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1318);
    float _1322 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1324 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1314);
    float _1326 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1328 = -_1316;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1320);
    float _1332 = log2(_1304);
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1324);
    float _1336 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1338 = fma(_1330, -0.5, 0.5);
    float _1340 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1342 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1344 = fma(_1330, 0.5, 0.5);
    float _1346 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1336);
    float _1348 = exp2(_1322);
    float _1350 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1340);
    float _1352 = _1308 + 1.0;
    float _1354 = fma(_1344, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1356 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1346);
    float _1358 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1350);
    float _1360 = fma(_1344, _1354, -0.212114393711090087890625);
    float _1362 = 1.0 / _1342;
    float _1364 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1358);
    float _1366 = _1332 * 0.693147182464599609375;
    float _1368 = fma(_1344, _1360, 1.570728778839111328125);
    float _1370 = sqrt(_1338);
    float _1372 = -_1308;
    float _1374 = fma(_1348, _1352, _1372);
    float _1376 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1356);
    float _1378 = fma(_1374, 0.5, 0.5);
    float _1380 = _1376 * _1362;
    float _1382 = _1364 * _1362;
    float _1384 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1386 = fma(_1380, 0.5, 0.5);
    float _1388 = fma(_1382, -0.5, 0.5);
    float _1390 = _1370 * 0.636619746685028076171875;
    float _1392 = -_1368;
    float _1394 = fma(_1390, _1392, 1.0);
    float3 _3801 = float3(_1386, _1388, _1384);
    float _1396 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3801, float3(0.0), isnan(_3801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3801, float3(0.0), isnan(_3801)), level(0.0)).x;
    float3 _3812 = float3(_1386, _1388, _1384);
    float4 _1399 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3812, float3(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3812, float3(0.0), isnan(_3812)), level(0.0)).xyzw;
    float _1401 = _1399.x;
    float _1403 = _1399.y;
    float _1405 = _1399.z;
    float _1407 = _1399.w;
    float2 _3829 = float2(_1394, _1378);
    float3 _1411 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3829, float2(0.0), isnan(_3829)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3829, float2(0.0), isnan(_3829)), level(0.0)).xyz;
    float _1413 = _1411.x;
    float _1415 = _1411.y;
    float _1417 = _1411.z;
    float _1419 = _773 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1421 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1423 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1419);
    float _1425 = _773 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1427 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1423);
    float _1429 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1425);
    float _1431 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1433 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1429);
    float _1435 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1437 = 1.0 / _1431;
    bool _1439 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan(0.5);
    bool _1447 = _1443 || _1445;
    float _1449 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1451 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1435);
    float _1453 = _1449 + _1431;
    float _1455 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1451);
    float _1457 = exp2(_1421);
    float _1459 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1455);
    float _1461 = _1453 * _1437;
    float _1463 = _1461 * 0.5;
    float _1465 = _1453;
    if (_1447)
    {
        _1465 = 1.0;
    }
    float _1467 = _1465;
    float _1469 = _1467;
    if (!_1447)
    {
        float _1471 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1475 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1473);
        float _1477 = _1471 * 0.15915493667125701904296875;
        float _1479 = _1477 * 6.283185482025146484375;
        float _1481 = cos(_1479);
        float _1483 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1485 = _1483 * 0.15915493667125701904296875;
        float _1487 = _1477 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = 1.0 / _1481;
        float _1493 = _1485 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = _1489 * _1491;
        float _1499 = 1.0 / _1475;
        float _1501 = _1495 * _1497;
        float _1503 = _1485 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1509 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1507;
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1513 = _1499 * _1511;
        float _1515 = 1.0 / _1501;
        float _1517 = 1.0 / _1509;
        float _1519 = _1505 * _1515;
        float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1523 = fma(_1519, _1513, _1521);
        float _1525 = _1523 * _1517;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        _1469 = _1527;
    }
    float _1529 = _1469;
    float _1531 = _1459 + _1342;
    float _1533 = -_1457;
    float _1535 = _1533 + 1.0;
    bool _1537 = _1529 > 0.0;
    bool _1539 = isnan(_1529);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(0.0);
    bool _1545 = _1541 || _1543;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1549 = _1531 * 0.5;
    float _1551 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1553 = _1547 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1555 = _1551 * _1396;
    float _1557 = -_1551;
    float _1559 = _1557 + 1.0;
    out.gl_Position.x = _1376;
    out.gl_Position.y = _1364;
    out.gl_Position.z = _1459;
    out.gl_Position.w = _1342;
    float _1561 = _1407 * _1555;
    float _1563 = _1417 * _1555;
    float _1565 = _1407 * _1559;
    out.m_64.z = _1549;
    out.m_64.w = _1342;
    float _1567 = fma(_1413, _1561, _1401);
    float _1569 = fma(_1415, _1561, _1403);
    float _1571 = fma(_1407, _1563, _1405);
    out.m_47.x = _1553;
    out.m_66.x = _1567;
    out.m_66.y = _1569;
    out.m_66.z = _1571;
    out.m_66.w = _1565;
    if (_1545)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1573 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1573;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1032 = false;
    bool _385 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1630 = as_type<float>(_101);
        out.gl_Position.z = _1630;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1699 = as_type<float>(_137);
        out.gl_Position.z = _1699;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_49.x;
    float _151 = in.m_49.y;
    float _153 = in.m_49.z;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _143 * _141;
    float _167 = 0.0;
    float _169 = _147;
    if (!_163)
    {
        float _171 = _147 * _147;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _179 = _175;
    if (!_163)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = _177 * 6.283185482025146484375;
    float _187 = floor(_177);
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    float _197 = _185 * 0.15915493667125701904296875;
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _197 * 6.283185482025146484375;
    float _205 = cos(_203);
    bool _207 = !_195;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = -_187;
    float _213 = _177 + _211;
    bool _215 = !_191;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_163;
    float _221 = _183;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _147 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _147);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_163;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _147 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _169 = _275;
    }
    float _277 = _169;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = in.m_56.w;
    float _289 = fma(_205, 0.5, 0.5);
    bool _291 = _213 < 0.5;
    float _293 = float(_291);
    float _295 = in.m_44.x;
    float _297 = in.m_44.y;
    float _299 = in.m_44.z;
    bool _301 = !_281;
    int _303 = _301 ? 0 : 1;
    float _305 = -_213;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _309 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = -_293;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _315 = -_289;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _319 = abs(_303);
    float _321 = fma(_277, _149, _309);
    bool _323 = !_201;
    int _325 = _323 ? 0 : 1;
    float _327 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = fma(_277, _151, _327);
    int _339 = abs(_325);
    float _341 = fma(_277, _153, _333);
    int _343 = abs(_331);
    float _345 = float(_319);
    float _347 = float(_339);
    float _349 = abs(_307);
    float _351 = _345 * _349;
    float _353 = fma(_337, _287, _297);
    float _355 = fma(_321, _287, _295);
    float _357 = float(_343);
    float _359 = fma(_347, _317, _351);
    float _361 = fma(_341, _287, _299);
    float _363 = abs(_313);
    float _365 = fma(_357, _363, _359);
    bool _367 = !_335;
    float _383;
    if (!_367)
    {
        float _369 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _371 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _373 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _375 = _373 * _369;
        float _377 = floor(_375);
        float _379 = -_377;
        float _381 = _375 + _379;
        _383 = _381;
        _385 = true;
    }
    else
    {
        float _387 = float(_85);
        float _389 = 1.0 / _387;
        float _391 = _119 * _389;
        _383 = _391;
    }
    _385 = false;
    float _393 = _383;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _411 = 1.0 / _397;
    float _413 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _415 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _417 = 1.0 / _401;
    float _419 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _413);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _423 = _393 + _421;
    float _425 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _415);
    bool _427 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _429 = isnan(_393);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _441 = 1.0 / _405;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _445 = _393 + _443;
    float _447 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _439);
    bool _449 = _139 > 0.5;
    float _451 = _445 * _411;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _455 = _393 + _453;
    bool _457 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _459 = isnan(_393);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = 1.0 / _409;
    bool _471 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _473 = isnan(_393);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = _423 * _417;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _487 = _393 + _485;
    float _489 = -_481;
    float _491 = _489 + 1.0;
    float _493 = _455 * _441;
    bool _495 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _497 = isnan(_393);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    bool _507 = _393 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _509 = isnan(_393);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = _487 * _469;
    float _521 = _505 * _491;
    float _523 = -_505;
    float _525 = _523 + 1.0;
    float _527 = -_517;
    float _529 = _527 + 1.0;
    float _531 = _517 * _525;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _533;
    float _537 = _437 * _529;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _539;
    float _543 = -_437;
    float _545 = _543 + 1.0;
    float _547 = fma(_535, _451, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _553 = fma(_541, _451, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _555 = _467 * _545;
    float _557 = -_467;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _565 = _547 * _555;
    float _567 = _553 * _555;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _573;
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].x, _565);
    float _579 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].y, _567);
    float _581 = fma(_551, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _583 = fma(_571, _493, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _585 = fma(_575, _493, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _587 = fma(_563, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _589 = in.m_56.x;
    float _591 = in.m_56.y;
    float _593 = fma(_581, _537, _577);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _599 = fma(_587, _537, _579);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = fma(_597, _519, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _607 = fma(_603, _519, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _609 = fma(_583, _531, _593);
    float _611 = fma(_585, _531, _599);
    float _613 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _419);
    float _615 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _425);
    float _617 = fma(_605, _521, _609);
    float _619 = fma(_607, _521, _611);
    float _621 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _623 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _625 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _627 = _353 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _629 = sqrt(_613);
    float _631 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].x, _621);
    float _633 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].y, _623);
    float _635 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].z, _625);
    float _637 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[14].w, _627);
    float _639 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[147].x, _617);
    float _641 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[147].y, _619);
    float _643 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _447);
    float _645 = sqrt(_615);
    float _647 = _639 * _589;
    float _649 = _641 * _591;
    float _651 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].y, _633);
    float _653 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].x, _631);
    float _655 = _365 * _647;
    float _657 = _365 * _649;
    float _659 = _651 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _661 = sqrt(_643);
    float _663 = _653 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _665 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].z, _635);
    float _667 = fma(_361, (*spvDescriptorSet0.vp_c10)._m0[16].w, _637);
    float _669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _671 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _673 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _675 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _677 = _629 * _659;
    float _679 = _645 * _663;
    float _681 = _673 * _669;
    float _683 = _675 * _671;
    float _685 = _677 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _687 = _677 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _689 = _665 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _691 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].x, _685);
    float _695 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].x, _687);
    float _697 = _661 * _689;
    float _699 = _683 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _701 = _683 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _703 = _667 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _705 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[24].z, _693);
    float _707 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
    float _709 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _699);
    float _711 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _701);
    float _713 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[24].w, _705);
    float _715 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[26].w, _707);
    float _717 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[24].z, _709);
    float _719 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[26].z, _711);
    float _721 = _713 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _723 = _715 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _725 = _717 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _727 = _719 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _729 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _731 = in.m_51.y;
    float _733 = _721 + _725;
    float _735 = _723 + _727;
    float _737 = _677 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _739 = _729 * _139;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _733 + _741;
    float _745 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _747 = _735 + _745;
    float _749 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].x, _737);
    float _751 = _683 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _753 = _743 * _743;
    float _755 = _747 * _747;
    float _757 = trunc(_739);
    int _759 = int(_757);
    float _761 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[25].z, _749);
    float _763 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _751);
    float _765 = _753 + _755;
    float _767 = fma(_703, (*spvDescriptorSet0.vp_c8)._m0[25].w, _761);
    float _769 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[25].z, _763);
    float _771 = sqrt(_765);
    float _773 = _767 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _775 = _769 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _779 = _777 != 0;
    bool _781 = _731 > 0.5;
    float _783 = _773 + _775;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _787 = _785 != 0;
    int _789 = _759 << 4;
    int _791 = _789 + 1968;
    float _793 = -_217;
    int _795 = _449 ? as_type<int>(_793) : as_type<int>(_217);
    int _797 = _791 + 8;
    uint _800 = uint(int(uint(_797) >> uint(2)));
    uint _802 = uint(int(uint(int(_800)) >> uint(2)));
    int _804 = int(_800) & 3;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[int(_802)][_804];
    bool _808 = _771 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _810 = uint(int(uint(_791) >> uint(2)));
    uint _812 = uint(int(uint(int(_810)) >> uint(2)));
    int _814 = int(_810) & 3;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[int(_812)][_814];
    int _818 = int(_810) + 1;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    int _822 = _818 & 3;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[int(_820)][_822];
    float _826 = _775;
    float _828 = as_type<float>(_791);
    float _830 = _767;
    float _832 = _691;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_808)
    {
        _826 = _755;
    }
    float _836 = _826;
    float _838 = _836;
    if (!_808)
    {
        _828 = _753;
    }
    float _840 = _828;
    float _842 = _840;
    if (!_808)
    {
        _830 = _733;
    }
    float _844 = _830;
    float _846 = _844;
    if (!_808)
    {
        _832 = _735;
    }
    float _848 = _832;
    float _850 = _848;
    if (!_808)
    {
        _834 = _783;
    }
    float _852 = _834;
    bool _854 = !_808;
    float _856 = _852;
    if (!_854)
    {
        float _858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _862 = _771 + _860;
        float _864 = rsqrt(_765);
        float _866 = _862 * _858;
        float _868 = _783 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _870 = _866 * 0.15915493667125701904296875;
        float _872 = _870 * 6.283185482025146484375;
        float _874 = sin(_872);
        float _876 = _870 * 6.283185482025146484375;
        float _878 = cos(_876);
        float _880 = fma(_874, _868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _882 = _864 * _880;
        float _884 = _878 + (-1.0);
        float _886 = fma(_743, _882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _888 = fma(_747, _882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _890 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _894 = _886 + _892;
        float _896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _898 = _888 + _896;
        float _900 = fma(_783, _878, _890);
        float _902 = _894 * _894;
        float _904 = _898 * _898;
        _856 = _900;
        _842 = _902;
        _838 = _904;
        _846 = _886;
        _850 = _888;
    }
    float _906 = _856;
    float _908 = _842;
    float _910 = _838;
    float _912 = _846;
    float _914 = _850;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _918 = _906 + _916;
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _922 = -_209;
    int _924 = _781 ? as_type<int>(_922) : as_type<int>(_209);
    float _926 = _806 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _928 = fma(_918, _918, _908);
    bool _930 = !_779;
    float _932 = _930 ? _217 : as_type<float>(_795);
    float _934 = _816 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _936 = !_787;
    float _938 = _936 ? _209 : as_type<float>(_924);
    float _940 = _928 + _910;
    float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _944 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = _932 + 0.5;
    float _948 = -_938;
    float _950 = _948 + 0.5;
    float _952 = _946 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _954 = sqrt(_940);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _962 = _950 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _964 = _952 * _920;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _968 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _962 * _942;
    out.m_58.x = _968;
    out.m_58.y = _970;
    out.m_58.z = _972;
    out.m_58.w = _966;
    bool _982 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _984 = isnan(_954);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _990 = _986 || _988;
    out.m_60.x = _974;
    out.m_60.y = _976;
    out.m_60.z = _978;
    out.m_62.x = _964;
    out.m_62.y = _980;
    float _992 = _934;
    float _994 = _906;
    float _996 = _954;
    if (!_990)
    {
        _992 = 1.0;
    }
    float _998 = _992;
    bool _1000 = !_990;
    float _1002 = _998;
    if (!_1000)
    {
        bool _1004 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1006 = isnan(_954);
        bool _1008 = _1004 || _1006;
        bool _1010 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1012 = _1008 || _1010;
        if (!_1012)
        {
            float _1014 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1016 = _954 + _1014;
            float _1018 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1020 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1018;
            float _1022 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1024 = _1022 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1026 = 1.0 / _1020;
            float _1028 = _1016 * _1026;
            float _1030 = fma(_1028, _1024, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1002 = _1030;
            _1032 = true;
        }
        else
        {
            bool _1034 = _954 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1036 = isnan(_954);
            bool _1038 = _1034 || _1036;
            bool _1040 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1042 = _1038 || _1040;
            if (!_1042)
            {
                float _1044 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1046 = _954 + _1044;
                float _1048 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1050 = _1048 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1052 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1054 = _1052 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1056 = 1.0 / _1050;
                float _1058 = _1046 * _1056;
                float _1060 = fma(_1058, _1054, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1002 = _1060;
                _1032 = true;
            }
            else
            {
                _1002 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1032 = false;
    float _1062 = _1002;
    float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1066 = _906 + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1070 = _912 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1074 = _914 + _1072;
    float _1076 = fma(_1066, _1062, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1078 = fma(_1070, _1062, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1080 = fma(_1074, _1062, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1084 = _1076 + _1082;
    float _1086 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1088 = _1078 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1092 = _1080 + _1090;
    float _1094 = _1084 * _1084;
    float _1096 = fma(_1088, _1088, _1094);
    float _1098 = fma(_1092, _1092, _1096);
    float _1100 = rsqrt(_1098);
    float _1102 = _1100 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1104 = _1088 * _1102;
    float _1106 = _1092 * _1102;
    float _1108 = _1104 * _1104;
    float _1110 = _1106 * _1106;
    float _1112 = _1108 + _1110;
    float _1114 = sqrt(_1112);
    bool _1116 = _1114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1118 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1120 = _1114 + _1118;
    float _1122 = _1092;
    float _1124 = _1112;
    float _1126 = _1120;
    float _1128 = _1084;
    if (_1116)
    {
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1122 = _1130;
    }
    float _1132 = _1122;
    if (_1116)
    {
        float _1134 = rsqrt(_1112);
        _1124 = _1134;
    }
    float _1136 = _1124;
    if (_1116)
    {
        float _1138 = _1120 * _1132;
        _1126 = _1138;
    }
    float _1140 = _1126;
    if (_1116)
    {
        float _1142 = _1140 * 0.15915493667125701904296875;
        _994 = _1142;
    }
    float _1144 = _994;
    float _1146 = _1096;
    float _1148 = _1144;
    if (_1116)
    {
        float _1150 = _1144 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        _1146 = _1152;
    }
    float _1154 = _1146;
    float _1156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1158 = precise::max(0.0, _1156);
    float _1160 = _1100;
    float _1162 = _1158;
    float _1164 = _1156;
    if (_1116)
    {
        float _1166 = _1144 * 6.283185482025146484375;
        float _1168 = cos(_1166);
        _1160 = _1168;
    }
    float _1170 = _1160;
    float _1172 = -_1102;
    float _1174 = -_1158;
    float _1176 = fma(_1084, _1172, _1174);
    if (!_1116)
    {
        _1128 = _1104;
    }
    float _1178 = _1128;
    float _1180 = _1178;
    if (_1116)
    {
        float _1182 = _1176 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1182;
    }
    float _1184 = _1162;
    float _1186 = _1154;
    float _1188 = _1184;
    if (_1116)
    {
        float _1190 = fma(_1154, _1184, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1186 = _1190;
    }
    float _1192 = _1186;
    float _1194 = _1192;
    if (!_1116)
    {
        _1188 = _1176;
    }
    float _1196 = _1188;
    float _1198 = _1196;
    float _1200 = _1170;
    if (_1116)
    {
        float _1202 = _1170 + (-1.0);
        _1164 = _1202;
    }
    float _1204 = _1164;
    float _1206 = _1204;
    if (_1116)
    {
        float _1208 = _1136 * _1192;
        _996 = _1208;
    }
    float _1210 = _996;
    if (!_1116)
    {
        _1194 = _1108;
    }
    float _1212 = _1194;
    float _1214 = sqrt(_1098);
    float _1216 = _1212;
    if (_1116)
    {
        float _1218 = _1204 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1148 = _1218;
    }
    float _1220 = _1148;
    if (_1116)
    {
        float _1222 = _1104 * _1210;
        _1180 = _1222;
    }
    float _1224 = _1180;
    if (!_1116)
    {
        _1206 = _1106;
    }
    float _1226 = _1206;
    float _1228 = _1226;
    if (_1116)
    {
        float _1230 = _1106 * _1210;
        _1228 = _1230;
    }
    float _1232 = _1228;
    if (_1116)
    {
        float _1234 = fma(_1176, _1170, _1220);
        _1198 = _1234;
    }
    float _1236 = _1198;
    if (_1116)
    {
        float _1238 = _1224 * _1224;
        _1216 = _1238;
    }
    float _1240 = _1216;
    if (!_1116)
    {
        _1200 = _1110;
    }
    float _1242 = _1200;
    float _1244 = _1242;
    if (_1116)
    {
        float _1246 = _1232 * _1232;
        _1244 = _1246;
    }
    float _1248 = _1244;
    float _1250 = fma(_1236, _1236, _1240);
    float _1252 = _1250 + _1248;
    float _1254 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1258 = fma(_1214, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1256);
    float _1260 = precise::clamp(_1258, 0.0, 1.0);
    float _1262 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1264 = rsqrt(_1252);
    float _1266 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1254);
    float _1268 = -_1260;
    float _1270 = _1268 + 1.0;
    float _1272 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1262);
    float _1274 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1276 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1266);
    float _1278 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1280 = _1076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1282 = abs(_1270);
    float _1284 = log2(_1282);
    float _1286 = _1276 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1288 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1278);
    float _1290 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1272);
    float _1292 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1280);
    float _1294 = _1286 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1296 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1288);
    float _1298 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1300 = _1264 * _1224;
    float _1302 = -_1294;
    float _1304 = fma(_1302, _1274, 1.0);
    float _1306 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1308 = _1264 * _1236;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1312 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1292);
    float _1314 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1316 = _1264 * _1232;
    float _1318 = -_1310;
    float _1320 = fma(_1308, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1318);
    float _1322 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1324 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1314);
    float _1326 = _1312 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1328 = -_1316;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1320);
    float _1332 = log2(_1304);
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1324);
    float _1336 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1338 = fma(_1330, -0.5, 0.5);
    float _1340 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1342 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1334);
    float _1344 = fma(_1330, 0.5, 0.5);
    float _1346 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1336);
    float _1348 = exp2(_1322);
    float _1350 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1340);
    float _1352 = _1308 + 1.0;
    float _1354 = fma(_1344, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1356 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1346);
    float _1358 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1350);
    float _1360 = fma(_1344, _1354, -0.212114393711090087890625);
    float _1362 = 1.0 / _1342;
    float _1364 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1358);
    float _1366 = _1332 * 0.693147182464599609375;
    float _1368 = fma(_1344, _1360, 1.570728778839111328125);
    float _1370 = sqrt(_1338);
    float _1372 = -_1308;
    float _1374 = fma(_1348, _1352, _1372);
    float _1376 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1356);
    float _1378 = fma(_1374, 0.5, 0.5);
    float _1380 = _1376 * _1362;
    float _1382 = _1364 * _1362;
    float _1384 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1386 = fma(_1380, 0.5, 0.5);
    float _1388 = fma(_1382, -0.5, 0.5);
    float _1390 = _1370 * 0.636619746685028076171875;
    float _1392 = -_1368;
    float _1394 = fma(_1390, _1392, 1.0);
    float3 _3801 = float3(_1386, _1388, _1384);
    float _1396 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3801, float3(0.0), isnan(_3801)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3801, float3(0.0), isnan(_3801)), level(0.0)).x;
    float3 _3812 = float3(_1386, _1388, _1384);
    float4 _1399 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3812, float3(0.0), isnan(_3812)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3812, float3(0.0), isnan(_3812)), level(0.0)).xyzw;
    float _1401 = _1399.x;
    float _1403 = _1399.y;
    float _1405 = _1399.z;
    float _1407 = _1399.w;
    float2 _3829 = float2(_1394, _1378);
    float3 _1411 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3829, float2(0.0), isnan(_3829)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3829, float2(0.0), isnan(_3829)), level(0.0)).xyz;
    float _1413 = _1411.x;
    float _1415 = _1411.y;
    float _1417 = _1411.z;
    float _1419 = _773 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1421 = _1284 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1423 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1419);
    float _1425 = _773 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1427 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1423);
    float _1429 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1425);
    float _1431 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1433 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1429);
    float _1435 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1437 = 1.0 / _1431;
    bool _1439 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1441 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1443 = _1439 || _1441;
    bool _1445 = isnan(0.5);
    bool _1447 = _1443 || _1445;
    float _1449 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1451 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1435);
    float _1453 = _1449 + _1431;
    float _1455 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1451);
    float _1457 = exp2(_1421);
    float _1459 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1455);
    float _1461 = _1453 * _1437;
    float _1463 = _1461 * 0.5;
    float _1465 = _1453;
    if (_1447)
    {
        _1465 = 1.0;
    }
    float _1467 = _1465;
    float _1469 = _1467;
    if (!_1447)
    {
        float _1471 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1475 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1473);
        float _1477 = _1471 * 0.15915493667125701904296875;
        float _1479 = _1477 * 6.283185482025146484375;
        float _1481 = cos(_1479);
        float _1483 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1485 = _1483 * 0.15915493667125701904296875;
        float _1487 = _1477 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = 1.0 / _1481;
        float _1493 = _1485 * 6.283185482025146484375;
        float _1495 = cos(_1493);
        float _1497 = _1489 * _1491;
        float _1499 = 1.0 / _1475;
        float _1501 = _1495 * _1497;
        float _1503 = _1485 * 6.283185482025146484375;
        float _1505 = sin(_1503);
        float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1509 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1507;
        float _1511 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1513 = _1499 * _1511;
        float _1515 = 1.0 / _1501;
        float _1517 = 1.0 / _1509;
        float _1519 = _1505 * _1515;
        float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1523 = fma(_1519, _1513, _1521);
        float _1525 = _1523 * _1517;
        float _1527 = precise::clamp(_1525, 0.0, 1.0);
        _1469 = _1527;
    }
    float _1529 = _1469;
    float _1531 = _1459 + _1342;
    float _1533 = -_1457;
    float _1535 = _1533 + 1.0;
    bool _1537 = _1529 > 0.0;
    bool _1539 = isnan(_1529);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan(0.0);
    bool _1545 = _1541 || _1543;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1549 = _1531 * 0.5;
    float _1551 = _1535 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1553 = _1547 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1555 = _1551 * _1396;
    float _1557 = -_1551;
    float _1559 = _1557 + 1.0;
    out.gl_Position.x = _1376;
    out.gl_Position.y = _1364;
    out.gl_Position.z = _1459;
    out.gl_Position.w = _1342;
    float _1561 = _1407 * _1555;
    float _1563 = _1417 * _1555;
    float _1565 = _1407 * _1559;
    out.m_64.z = _1549;
    out.m_64.w = _1342;
    float _1567 = fma(_1413, _1561, _1401);
    float _1569 = fma(_1415, _1561, _1403);
    float _1571 = fma(_1407, _1563, _1405);
    out.m_47.x = _1553;
    out.m_66.x = _1567;
    out.m_66.y = _1569;
    out.m_66.z = _1571;
    out.m_66.w = _1565;
    if (_1545)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1573 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1573;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

