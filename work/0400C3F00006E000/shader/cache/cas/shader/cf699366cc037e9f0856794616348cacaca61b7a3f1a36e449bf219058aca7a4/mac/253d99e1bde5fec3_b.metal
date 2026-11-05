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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_60 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_78 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3271 = false;
    bool _923 = false;
    bool _731 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3576 = as_type<float>(_113);
        out.gl_Position.z = _3576;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _3645 = as_type<float>(_151);
        out.gl_Position.z = _3645;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_51.x;
    float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_56.x;
    float _163 = in.m_56.y;
    float _165 = in.m_56.z;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _169 = _157 * _155;
    float _171 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _175 = _171 * _167;
    float _177 = floor(_173);
    int _179 = as_type<int>(_159) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_159) & 2;
    bool _185 = _183 != 0;
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].y, _175);
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = _173 * 6.283185482025146484375;
    float _201 = _187 * 6.283185482025146484375;
    float _203 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _209 = _199 * 0.15915493667125701904296875;
    float _211 = _201 * 0.15915493667125701904296875;
    float _213 = floor(_187);
    bool _215 = !_191;
    int _217 = _215 ? 0 : 1;
    float _219 = -_177;
    float _221 = _173 + _219;
    bool _223 = !_185;
    float _225 = _223 ? (-0.5) : 0.5;
    int _227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _229 = _227 != 0;
    int _231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _233 = _231 != 0;
    int _235 = abs(_217);
    float _237 = _209 * 6.283185482025146484375;
    float _239 = cos(_237);
    bool _241 = !_229;
    int _243 = _241 ? 0 : 1;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _247 = abs(_243);
    float _249 = _211 * 6.283185482025146484375;
    float _251 = cos(_249);
    bool _253 = _221 < 0.5;
    float _255 = float(_253);
    float _257 = -_213;
    float _259 = _187 + _257;
    bool _261 = !_233;
    int _263 = _261 ? 0 : 1;
    float _265 = -_221;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = -_255;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = float(_235);
    float _275 = fma(_239, 0.5, 0.5);
    float _277 = float(_247);
    float _279 = -_259;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _283 = _259 < 0.5;
    float _285 = float(_283);
    float _287 = -_275;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _291 = abs(_263);
    float _293 = abs(_267);
    float _295 = _277 * _293;
    float _297 = abs(_281);
    float _299 = _277 * _297;
    float _301 = fma(_251, 0.5, 0.5);
    float _303 = float(_291);
    float _305 = fma(_273, _289, _295);
    float _307 = -_285;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _311 = -_301;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _315 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _317 = abs(_271);
    float _319 = fma(_303, _317, _305);
    float _321 = fma(_273, _313, _299);
    float _323 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _325 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _327 = !_181;
    float _329 = _327 ? (-0.5) : 0.5;
    float _331 = abs(_309);
    float _333 = fma(_303, _331, _321);
    bool _335 = !_245;
    float _337 = _325;
    float _353;
    if (!_335)
    {
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_97);
        float _359 = 1.0 / _357;
        float _361 = _131 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = 1.0 / _371;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _395 = 1.0 / _379;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _363 + _397;
    bool _401 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _403 = 1.0 / _375;
    float _405 = _399 * _385;
    bool _407 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _409 = isnan(_363);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _421 = _363 + _419;
    bool _423 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _425 = isnan(_363);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _383;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _363 + _441;
    float _445 = _443 * _395;
    float _447 = -_417;
    float _449 = _447 + 1.0;
    float _451 = 1.0 / _439;
    float _453 = _367 * _403;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _457 = _363 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _461 = _363 + _459;
    float _463 = 1.0 / _389;
    float _465 = _433 * _449;
    float _467 = _457 * _435;
    float _469 = -_433;
    float _471 = _469 + 1.0;
    bool _473 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _475 = isnan(_363);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _485;
    float _489 = 1.0 / _393;
    bool _491 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _493 = isnan(_363);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = _461 * _451;
    bool _505 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _507 = isnan(_363);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = -_483;
    float _519 = _517 + 1.0;
    float _521 = fma(_487, _405, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _523 = _501 * _471;
    float _525 = -_501;
    float _527 = _525 + 1.0;
    float _529 = _421 * _463;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _533 = _363 + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _535;
    float _539 = _483 * _527;
    float _541 = -_515;
    float _543 = _541 + 1.0;
    float _545 = _515 * _519;
    float _547 = fma(_537, _405, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _549 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _551 = isnan(_363);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _533 * _489;
    bool _563 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _565 = isnan(_363);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    bool _575 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _577 = isnan(_363);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -_559;
    float _589 = _587 + 1.0;
    float _591 = _573 * _543;
    float _593 = -_573;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _601 = _585 * _589;
    float _603 = _559 * _595;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _609;
    float _613 = fma(_599, _453, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _615;
    float _619 = fma(_607, _453, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _621 = fma(_611, _445, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _623 = _521 * _601;
    float _625 = -_585;
    float _627 = _625 + 1.0;
    float _629 = _547 * _601;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = fma(_617, _445, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _641 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[143].x, _623);
    float _643 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[143].y, _629);
    float _645 = fma(_633, _467, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _647 = fma(_613, _603, _641);
    float _649 = fma(_639, _467, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _651 = fma(_619, _603, _643);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _657;
    float _661 = fma(_621, _591, _647);
    float _663 = fma(_635, _591, _651);
    float _665 = fma(_655, _529, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _667 = fma(_659, _529, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _677 = fma(_645, _545, _661);
    float _679 = fma(_649, _545, _663);
    float _681 = fma(_671, _561, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _683 = fma(_675, _561, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _685;
    float _689 = fma(_665, _539, _677);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _691;
    float _695 = fma(_667, _539, _679);
    float _697 = fma(_687, _503, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _699 = fma(_681, _523, _689);
    float _701 = fma(_693, _503, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _703 = fma(_683, _523, _695);
    float _705 = fma(_697, _465, _699);
    float _707 = fma(_701, _465, _703);
    float _709 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[150].x, _705);
    float _711 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[150].y, _707);
    bool _713 = !_401;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _717 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_97);
        float _735 = 1.0 / _733;
        float _737 = _131 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = _739 + _741;
    bool _745 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _747 = isnan(_739);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _759 = _739 + _757;
    bool _761 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _763 = isnan(_739);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _781 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _783 = isnan(_739);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = 1.0 / _779;
    float _795 = -_791;
    float _797 = _795 + 1.0;
    bool _799 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _801 = 1.0 / _775;
    float _803 = _771 * _797;
    float _805 = -_771;
    float _807 = _805 + 1.0;
    float _809 = _759 * _793;
    float _811 = _743 * _801;
    float _813 = -_755;
    float _815 = _813 + 1.0;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _817;
    float _821 = _791 * _815;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _827;
    float _831 = fma(_819, _811, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _833 = fma(_825, _811, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _835 = fma(_829, _811, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _837 = _831 * _803;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _843 = _833 * _803;
    float _845 = _835 * _803;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _855 = fma(_841, _809, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _857 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].x, _843);
    float _859 = fma(_849, _809, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _861 = fma(_853, _809, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _863 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].y, _837);
    float _865 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].z, _845);
    float _867 = fma(_859, _821, _857);
    float _869 = fma(_855, _821, _863);
    float _871 = fma(_861, _821, _865);
    float _873 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].x, _867);
    float _875 = in.m_58.x;
    float _877 = in.m_58.y;
    float _879 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].y, _869);
    float _881 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].z, _871);
    float _883 = _873 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _887 = _879 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _891;
    out.m_60.y = _893;
    out.m_60.z = _895;
    out.m_60.w = _885;
    float _897 = _711 * _877;
    float _899 = _709 * _875;
    bool _901 = !_799;
    float _919;
    float _921;
    if (!_901)
    {
        float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _905 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _907 = float(_97);
        float _909 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _911 = _909 * _903;
        float _913 = floor(_911);
        float _915 = -_913;
        float _917 = _911 + _915;
        _919 = _917;
        _921 = _907;
        _923 = true;
    }
    else
    {
        float _925 = float(_97);
        float _927 = 1.0 / _925;
        float _929 = _131 * _927;
        _919 = _929;
        _921 = _925;
    }
    _923 = false;
    float _931 = _919;
    float _933 = _921;
    float _935 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _937 = int(_935);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _941 = _931 + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _945 = _931 + _943;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _949 = int(_947);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _955;
    float _959 = float(_937);
    float _961 = 1.0 / _933;
    float _963 = float(uint(_949));
    float _965 = 1.0 / _959;
    int _967 = ~_949;
    int _969 = _967 + 1;
    int _971 = ~_949;
    int _973 = _971 + 1;
    int _975 = ~_949;
    int _977 = _975 + 1;
    float _979 = 1.0 / _963;
    float _981 = _965 * _131;
    float _983 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _985 = log2(_983);
    int _987 = as_type<int>(_979) + (-2);
    float _989 = trunc(_981);
    int _991 = int(_989);
    float _993 = _985 * _131;
    float _995 = exp2(_993);
    float _997 = float(uint(_991));
    float _999 = as_type<float>(_987) * _997;
    float _1001 = trunc(_999);
    float _1003 = precise::max(_1001, 0.0);
    uint _1006 = uint(_1003);
    float _1008 = -_995;
    float _1010 = _1008 + 1.0;
    float _1012 = float(_949);
    int _1014 = _969 * int(_1006);
    int _1016 = _1014 + _991;
    float _1018 = float(uint(_1016));
    float _1020 = as_type<float>(_987) * _1018;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1024 = _1022 != 0;
    bool _1026 = !_1024;
    float _1028 = _1026 ? 7.345489978790283203125 : 1.0;
    float _1030 = trunc(_1020);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = _1028 * _153;
    float _1038 = floor(_1036);
    int _1040 = int(_1006) + int(_1034);
    float _1042 = float(_991);
    int _1044 = _973 * _1040;
    int _1046 = _1044 + _991;
    bool _1048 = _1042 >= _1012;
    bool _1050 = isnan(_1042);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(_1012);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -_1038;
    float _1062 = _1036 + _1060;
    bool _1064 = uint(_1046) >= uint(_949);
    float _1066 = trunc(_1058);
    int _1068 = int(_1066);
    bool _1070 = !_1064;
    int _1072 = _1070 ? 0 : (-1);
    bool _1074 = _949 == 0;
    int _1076 = ~_1040;
    int _1078 = _1076 + _1072;
    int _1080 = _1078 + 1;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1092 = _1090 != 0;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1096 = _1094 != 0;
    int _1098 = _949 * _1080;
    int _1100 = _1098 + _991;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1104 = _1102 != 0;
    bool _1106 = !_1084;
    int _1108 = _1106 ? 0 : 1;
    bool _1110 = !_1074;
    int _1112 = _1110 ? _1100 : (-1);
    float _1114 = _1062 * _1012;
    float _1116 = _1012 * _131;
    int _1118 = ~_1068;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = trunc(_1114);
    int _1126 = int(_1124);
    float _1128 = _1116 * _961;
    bool _1130 = !_1088;
    int _1132 = _1130 ? 0 : 1;
    int _1134 = _1112 * _1122;
    int _1136 = _949 + (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1140 = _1138 != 0;
    float _1142 = trunc(_1128);
    int _1144 = int(_1142);
    int _1146 = _1068 * _1136;
    int _1148 = _1146 + _1134;
    int _1150 = abs(_1132);
    bool _1152 = !_1096;
    int _1154 = _1152 ? 0 : 1;
    bool _1156 = !_1092;
    int _1158 = _1156 ? 0 : 1;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1162 = _1160 != 0;
    int _1164 = abs(_1154);
    int _1166 = abs(_1108);
    int _1168 = abs(_1158);
    int _1170 = _1148 * _1150;
    bool _1172 = !_1162;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _1126 * _1164;
    int _1178 = _1176 + _991;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1182 = _1180 != 0;
    int _1184 = _1144 * _1166;
    int _1186 = _1184 + _1170;
    int _1188 = abs(_1174);
    float _1190 = in.m_51.y;
    float _1192 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1194 = _1178 * _1168;
    int _1196 = _1194 + _1186;
    int _1198 = ~_949;
    int _1200 = _1198 + 1;
    float _1202 = -_951;
    float _1204 = fma(_1192, 2.0, _1202);
    int _1206 = _1126 * _1188;
    int _1208 = _1206 + _1196;
    float _1210 = _153 * 2.0;
    float _1212 = -_131;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1204);
    bool _1216 = _153 > 0.5;
    float _1218 = floor(_1210);
    float _1220 = float(uint(_1208));
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1230 = as_type<float>(_987) * _1220;
    float _1232 = 1.0 / _1224;
    float _1234 = in.m_44.x;
    float _1236 = in.m_44.y;
    float _1238 = in.m_44.z;
    float _1240 = _1190 * 2.0;
    float _1242 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1244 = trunc(_1230);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    bool _1250 = _1218 > 0.0;
    float _1252 = fma(_1242, -2.0, _953);
    bool _1254 = _1218 >= 0.0;
    bool _1256 = isnan(_1218);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan(0.0);
    bool _1262 = _1258 || _1260;
    float _1264 = in.m_51.z;
    float _1266 = floor(_1240);
    float _1268 = _941 * _1232;
    int _1270 = ~_949;
    int _1272 = _1270 + 1;
    int _1274 = _1200 * int(_1248);
    int _1276 = _1274 + _1208;
    float _1278 = -_329;
    int _1280 = _1216 ? as_type<int>(_1278) : as_type<int>(_329);
    float _1282 = 1.0 / _1228;
    bool _1284 = _1190 > 0.5;
    float _1286 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1288 = float(uint(_1276));
    float _1290 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1292 = _1262 ? 0 : 1;
    bool _1294 = !_1140;
    float _1296 = _1294 ? _329 : as_type<float>(_1280);
    float _1298 = as_type<float>(_987) * _1288;
    int _1300 = ~_1292;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = -_225;
    int _1308 = _1284 ? as_type<int>(_1306) : as_type<int>(_225);
    float _1310 = trunc(_1298);
    float _1312 = precise::max(_1310, 0.0);
    uint _1314 = uint(_1312);
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1326 = _1324 != 0;
    float _1328 = _1190 + _1264;
    int _1330 = _1304;
    if (!_1250)
    {
        int _1332 = ~_1292;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1340 = _1266 >= 0.0;
    bool _1342 = isnan(_1266);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan(0.0);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1286);
    float _1352 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1290);
    float _1354 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1338);
    int _1356 = _1348 ? 0 : 1;
    float _1358 = _153 + _1190;
    bool _1360 = _1266 > 0.0;
    float _1362 = _1264 * 2.0;
    float _1364 = _1358 + (-1.0);
    float _1366 = _1328 + (-1.0);
    int _1368 = int(_1248) + int(_1314);
    float _1370 = _945 * _1282;
    float _1372 = floor(_1362);
    float _1374 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1352);
    int _1376 = _1272 * _1368;
    int _1378 = _1376 + _1208;
    bool _1380 = !_1104;
    float _1382 = _1380 ? _225 : as_type<float>(_1308);
    int _1384 = ~_1356;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    float _1390 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1392 = uint(_1378) >= uint(_949);
    float _1394 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1396 = _1388;
    if (!_1360)
    {
        int _1398 = ~_1356;
        int _1400 = _1398 + 1;
        _1396 = _1400;
    }
    int _1402 = _1396;
    float _1404 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1350);
    float _1406 = _1374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1408 = _1404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1410 = !_1392;
    int _1412 = _1410 ? 0 : (-1);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1414;
    bool _1418 = _1372 > 0.0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1420;
    bool _1424 = _1372 >= 0.0;
    bool _1426 = isnan(_1372);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(0.0);
    bool _1432 = _1428 || _1430;
    float _1434 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1354);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1440 = _1296 + 0.5;
    int _1442 = ~_1368;
    int _1444 = _1442 + _1412;
    int _1446 = _1444 + 1;
    float _1448 = fma(_1422, _1268, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1450 = fma(_1438, _1370, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1452 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1214);
    bool _1454 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1456 = isnan(_931);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1462 = _1458 || _1460;
    float _1464 = float(_1462);
    float _1466 = fma(_1416, _1268, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1468 = fma(_957, _1268, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1470 = _1432 ? 0 : 1;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1476 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1484 = _1480 || _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1490 = _949 * _1446;
    int _1492 = _1490 + _1208;
    bool _1494 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1496 = isnan(_931);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = -_1464;
    float _1508 = _1506 + 1.0;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1512 = 1.0 + _1510;
    float _1514 = _1484 ? _1010 : 0.0;
    float _1516 = fma(_1474, _1370, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1518 = float(uint(_1178));
    float _1520 = _1504 * _1508;
    float _1522 = -_1504;
    float _1524 = _1522 + 1.0;
    float _1526 = fma(_1488, _1370, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1528 = 1.0 / _1512;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1532 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1534 = isnan(_931);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = as_type<float>(_987) * _1518;
    float _1546 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    bool _1548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1550 = isnan(1.0);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1556 = _1552 || _1554;
    float _1558 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1252);
    float _1560 = trunc(_1544);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1568 = !_1074;
    int _1570 = _1568 ? _1492 : (-1);
    float _1572 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1546);
    float _1574 = _1382 + (-0.5);
    float _1576 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1566);
    int _1578 = _1570 >> 31;
    float _1580 = -_1572;
    float _1582 = _1580 + 1.0;
    float _1584 = _1434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1586 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1576);
    float _1588 = _1542 * _1524;
    float _1590 = _1408;
    float _1592 = _1406;
    if (_1556)
    {
        float _1594 = _1514 * _1528;
        _135 = _1594;
    }
    float _1596 = _135;
    float _1598 = -_1542;
    float _1600 = _1598 + 1.0;
    int _1602 = _1578 & 3;
    float _1604 = _1466 * _1588;
    float _1606 = _1468 * _1588;
    float _1608 = -_1574;
    float _1610 = -_1558;
    float _1612 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1610);
    int _1614 = _1570 + _1602;
    int _1616 = _977 * int(_1564);
    int _1618 = _1616 + _1178;
    float _1620 = _1448 * _1588;
    float _1622 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1604);
    int _1624 = _1614 >> 2;
    float _1626 = _1190 + (-0.5);
    float _1628 = float(uint(_1618));
    float _1630 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1620);
    float _1632 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1606);
    int _1634 = _1624 << 4;
    int _1636 = _1634 + 368;
    float _1638 = fma(_1450, _1520, _1622);
    bool _1640 = !_1322;
    int _1642 = _1640 ? 0 : 1;
    float _1644 = as_type<float>(_987) * _1628;
    uint _1646 = uint(int(uint(_1636) >> uint(2)));
    uint _1648 = uint(int(uint(int(_1646)) >> uint(2)));
    int _1650 = int(_1646) & 3;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[int(_1648)][_1650];
    int _1654 = int(_1646) + 1;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    int _1658 = _1654 & 3;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[int(_1656)][_1658];
    float _1662 = -_1586;
    float _1664 = _1662 + 1.0;
    int _1666 = abs(_1642);
    float _1668 = fma(_1516, _1520, _1630);
    int _1670 = ~_1470;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = -_1664;
    float _1678 = fma(_1296, _1676, _1452);
    float _1680 = float(_1336);
    float _1682 = fma(_1382, _1582, _1612);
    float _1684 = float(_1666);
    float _1686 = trunc(_1644);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = _1674;
    float _1694 = _1626;
    if (!_1418)
    {
        int _1696 = ~_1470;
        int _1698 = _1696 + 1;
        _1692 = _1698;
    }
    int _1700 = _1692;
    float _1702 = fma(_1526, _1520, _1632);
    int _1704 = _1570 & 3;
    bool _1706 = _1704 != 0;
    float _1708 = _1684 * _1680;
    bool _1710 = !_1318;
    int _1712 = _1710 ? 0 : 1;
    out.m_62.x = _1678;
    out.m_62.y = _1682;
    bool _1714 = uint(_1704) > 1u;
    int _1716 = _1570 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = abs(_1712);
    int _1722 = _1636 + 8;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = _1718 ? 0 : 1;
    int _1742 = int(_1564) + int(_1690);
    float _1744 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1668);
    int _1746 = ~_1740;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    float _1752 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1638);
    int _1754 = _1750;
    if (!_1714)
    {
        int _1756 = ~_1740;
        int _1758 = _1756 + 1;
        _1754 = _1758;
    }
    int _1760 = _1754;
    float _1762 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1702);
    bool _1764 = !_1706;
    int _1766 = _1764 ? 0 : 1;
    float _1768 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1770 = abs(_1760);
    float _1772 = float(_1720);
    int _1774 = abs(_1766);
    float _1776 = float(_1700);
    int _1778 = ~_949;
    int _1780 = _1778 + 1;
    int _1782 = ~_1770;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    float _1788 = _1772 * _1776;
    bool _1790 = _1704 != 3;
    int _1792 = _1780 * _1742;
    int _1794 = _1792 + _1178;
    int _1796 = ~_1774;
    int _1798 = _1796 + 1;
    int _1800 = _1798 + 1;
    int _1802 = _1786 * as_type<int>(_1660);
    bool _1804 = uint(_1704) >= 2u;
    bool _1806 = uint(_1794) >= uint(_949);
    int _1808 = _1800 * as_type<int>(_1652);
    int _1810 = _1808 + _1802;
    int _1812 = _1804 ? 0 : 1;
    float _1814 = in.m_64.x;
    float _1816 = in.m_64.y;
    float _1818 = in.m_64.z;
    bool _1820 = _1704 != 3;
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1824 = _1408 + _1822;
    int _1826 = ~_1812;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1830;
    if (_1790)
    {
        int _1834 = ~_1812;
        int _1836 = _1834 + 1;
        _1832 = _1836;
    }
    int _1838 = _1832;
    float _1840 = _1824 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1842 = !_1820;
    int _1844 = _1842 ? 0 : (-1);
    int _1846 = abs(_1838);
    bool _1848 = !_1806;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = abs(_1844);
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1856 = _1584 + _1854;
    int _1858 = ~_1846;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    int _1864 = ~_1742;
    int _1866 = _1864 + _1850;
    int _1868 = _1866 + 1;
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1840);
    bool _1872 = !_1182;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = _1862 * as_type<int>(_1730);
    int _1878 = _1876 + _1810;
    int _1880 = ~_1852;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    float _1886 = _1708 * (-2.0);
    int _1888 = abs(_1874);
    float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1892 = _1406 + _1890;
    int _1894 = _1884 * as_type<int>(_1738);
    int _1896 = _1894 + _1878;
    float _1898 = fma(_1394, _1886, _1394);
    float _1900 = fma(_1886, _1816, _1816);
    float _1902 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1870);
    int _1904 = _949 * _1868;
    int _1906 = _1904 + _1178;
    float _1908 = _1824 * _1824;
    float _1910 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1900);
    bool _1912 = _1902 >= 0.0;
    float _1914 = fma(_1856, _1856, _1908);
    int _1916 = ~_1888;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    float _1922 = _1762 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1924 = !_1074;
    int _1926 = _1924 ? _1906 : (-1);
    float _1928 = fma(_1892, _1892, _1914);
    float _1930 = fma(_1898, _1596, _1910);
    int _1932 = _1896 * _1920;
    float _1934 = _1788 * (-2.0);
    float _1936 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1938 = !_1326;
    int _1940 = _1938 ? 0 : 1;
    float _1942 = rsqrt(_1928);
    int _1944 = _1926 * _1888;
    int _1946 = _1944 + _1932;
    float _1948 = _1818;
    if (_1912)
    {
        _1694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1950 = _1694;
    float _1952 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1954 = fma(_1390, _1934, _1390);
    float _1956 = fma(_1934, _1814, _1814);
    float _1958 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1962 = as_type<int>(_1950);
    if (_1912)
    {
        float _1964 = _1950 * 5.0;
        _1962 = as_type<int>(_1964);
    }
    int _1966 = _1962;
    float _1968 = float(_1946);
    if (_1912)
    {
        out.m_47.x = 0.0;
    }
    float _1970 = _153 + (-0.5);
    int _1972 = abs(_1940);
    out.m_66.x = _1958;
    out.m_66.y = _1960;
    out.m_66.z = _1936;
    float _1974 = _1824 * _1942;
    float _1976 = _1856 * _1942;
    if (_1912)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6414 = as_type<float>(_1966);
        out.gl_Position.z = _6414;
    }
    out.m_68.x = _1968;
    if (_1912)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1978 = -_1974;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1982 = _1892 * _1942;
    float _1984 = -_1976;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1584);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1990 = _1980 + _1988;
    float _1992 = -_1982;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1998 = _1986 + _1996;
    float _2000 = -_1974;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1824);
    float _2004 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2006 = float(_1972);
    float _2008 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2010 = _1994 + _2008;
    float _2012 = float(_1402);
    float _2014 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2004);
    float _2016 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1956);
    float _2018 = -_1976;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1856);
    float _2022 = _2002 * _2002;
    float _2024 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2014);
    float _2026 = fma(_1954, _1596, _2016);
    float _2028 = _153 + _1264;
    float _2030 = _2006 * _2012;
    float _2032 = fma(_2020, _2020, _2022);
    float _2034 = _2026 * 0.15915493667125701904296875;
    float _2036 = _2028 + (-1.0);
    bool _2038 = _2024 >= 0.0;
    float _2040 = _2030 * (-2.0);
    float _2042 = _1264 + (-0.5);
    float _2044 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2046 = -_1982;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1892);
    float _2050 = fma(_2040, _1818, _1818);
    float _2052 = _1930 * 0.15915493667125701904296875;
    float _2054 = fma(_2044, _2040, _2044);
    float _2056 = fma(_2048, _2048, _2032);
    float _2058 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2050);
    float _2060 = _2052 * 6.283185482025146484375;
    float _2062 = sin(_2060);
    float _2064 = _1994;
    if (_2038)
    {
        _1948 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2066 = _1948;
    float _2068 = fma(_2054, _1596, _2058);
    int _2070 = as_type<int>(_2066);
    if (_2038)
    {
        out.m_47.x = 0.0;
    }
    float _2072 = _333 * _897;
    float _2074 = _2052 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    if (_2038)
    {
        float _2078 = _2066 * 5.0;
        _2070 = as_type<int>(_2078);
    }
    int _2080 = _2070;
    float _2082 = _2068 * 0.15915493667125701904296875;
    if (_2038)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6604 = as_type<float>(_2080);
        out.gl_Position.z = _6604;
    }
    float _2084 = _2034 * 6.283185482025146484375;
    float _2086 = sin(_2084);
    float _2088 = sqrt(_2056);
    float _2090 = _2034 * 6.283185482025146484375;
    float _2092 = cos(_2090);
    if (_2038)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2094 = _2082 * 6.283185482025146484375;
    float _2096 = cos(_2094);
    float _2098 = _1942 * _2088;
    float _2100 = _2072 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2102 = _319 * _899;
    float _2104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _329);
    float _2108 = _2098 * _2100;
    float _2110 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2112 = _2082 * 6.283185482025146484375;
    float _2114 = sin(_2112);
    float _2116 = _2092 * _2076;
    float _2118 = _2104 * _2108;
    float _2120 = _2086 * _2062;
    float _2122 = _2098 * _2110;
    float _2124 = _2092 * _2062;
    float _2126 = _2086 * _2076;
    float _2128 = _2092 * _2096;
    float _2130 = _2076 * _2096;
    float _2132 = _2106 * _2122;
    float _2134 = _2086 * _2096;
    float _2136 = _2128 * _2118;
    float _2138 = _2062 * _2096;
    float _2140 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2142 = _2140 * 0.5;
    float _2144 = fma(_2114, _2116, _2120);
    float _2146 = -_2126;
    float _2148 = fma(_2114, _2124, _2146);
    float _2150 = -_2118;
    float _2152 = _2114 * _2150;
    float _2154 = _2134 * _2118;
    float _2156 = fma(_2144, _2132, _2136);
    float _2158 = -_2124;
    float _2160 = fma(_2114, _2126, _2158);
    float _2162 = fma(_2130, _2132, _2152);
    float _2164 = fma(_2114, _2120, _2116);
    float _2166 = fma(_2148, _2142, _2156);
    float _2168 = fma(_2160, _2132, _2154);
    float _2170 = fma(_2138, _2142, _2162);
    float _2172 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2174 = fma(_2164, _2142, _2168);
    float _2176 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2178 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2172);
    float _2180 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2176);
    float _2182 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2178);
    float _2184 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2180);
    float _2186 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2188 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2190 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2192 = _1406 + _2186;
    float _2194 = _1584 + _2188;
    float _2196 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2190);
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2200 = _2192 + _2198;
    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2204 = _2194 + _2202;
    float _2206 = _2200 * _2200;
    float _2208 = fma(_2204, _2204, _2206);
    float _2210 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2212 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2196);
    float _2214 = sqrt(_2208);
    float _2216 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2210);
    float _2218 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2222 = _1408 + _2220;
    bool _2224 = _2214 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2226 = _2196;
    float _2228 = _2194;
    float _2230 = _2192;
    float _2232 = _2098;
    if (!_2224)
    {
        _2226 = _2194;
    }
    float _2234 = _2226;
    float _2236 = _2234;
    if (!_2224)
    {
        _2228 = _2192;
    }
    float _2238 = _2228;
    float _2240 = _2238;
    if (!_2224)
    {
        _2230 = _2222;
    }
    float _2242 = _2230;
    bool _2244 = !_2224;
    float _2246 = _2242;
    if (!_2244)
    {
        float _2248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2252 = _2214 + _2250;
        float _2254 = rsqrt(_2208);
        float _2256 = _2252 * _2248;
        float _2258 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2260 = _2256 * 0.15915493667125701904296875;
        float _2262 = _2260 * 6.283185482025146484375;
        float _2264 = cos(_2262);
        float _2266 = _2260 * 6.283185482025146484375;
        float _2268 = sin(_2266);
        float _2270 = _2264 + (-1.0);
        float _2272 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = fma(_2268, _2258, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2276 = fma(_2222, _2264, _2272);
        float _2278 = _2254 * _2274;
        float _2280 = fma(_2204, _2278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2282 = fma(_2200, _2278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2246 = _2276;
        _2236 = _2280;
        _2240 = _2282;
    }
    float _2284 = _2246;
    float _2286 = _2236;
    float _2288 = _2240;
    float _2290 = -_1408;
    float _2292 = _2290 + _2284;
    float _2294 = -_1584;
    float _2296 = _2294 + _2286;
    float _2298 = -_1406;
    float _2300 = _2298 + _2288;
    float _2302 = _2212 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2304 = _2292 * _2292;
    float _2306 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2308 = 1.0 / _2302;
    float _2310 = fma(_2296, _2296, _2304);
    float _2312 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2306);
    bool _2314 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2316 = isnan(0.5);
    bool _2318 = _2314 || _2316;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2322 = _2318 || _2320;
    float _2324 = fma(_2300, _2300, _2310);
    float _2326 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2312);
    bool _2328 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2330 = isnan(0.5);
    bool _2332 = _2328 || _2330;
    bool _2334 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2336 = _2332 || _2334;
    float _2338 = sqrt(_2324);
    float _2340 = _2326 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2342 = _2340 + _2302;
    float _2344 = _2342 * _2308;
    float _2346 = _2344 * 0.5;
    bool _2348 = _2338 > 0.0;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2352 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2350);
    float _2354 = 1.0 / _2352;
    float _2356 = _2308;
    float _2358 = _2342;
    float _2360 = _2288;
    float _2362 = _2284;
    if (!_2348)
    {
        _2356 = _2286;
    }
    float _2364 = _2356;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2348)
    {
        _2358 = _2284;
    }
    float _2370 = _2358;
    bool _2372 = !_2348;
    float _2374 = _2370;
    if (!_2372)
    {
        float _2376 = _323 * _323;
        float _2378 = fma(_315, _315, _2376);
        float _2380 = fma(_325, _325, _2378);
        float _2382 = rsqrt(_2324);
        float _2384 = sqrt(_2380);
        float _2386 = _2296 * _2382;
        float _2388 = _2292 * _2382;
        float _2390 = _2300 * _2382;
        bool _2392 = _2384 > 0.0;
        float _2394 = _2384;
        if (!_2392)
        {
            _2366 = _2286;
        }
        float _2396 = _2366;
        _2368 = _2396;
        if (!_2392)
        {
            _2394 = _2284;
        }
        float _2398 = _2394;
        bool _2400 = !_2392;
        _2374 = _2398;
        if (!_2400)
        {
            float _2402 = rsqrt(_2380);
            float _2404 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2406 = _323 * _2402;
            float _2408 = _315 * _2402;
            float _2410 = _2388 * _2406;
            float _2412 = _325 * _2402;
            float _2414 = fma(_2386, _2408, _2410);
            float _2416 = _2404 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2418 = fma(_2390, _2412, _2414);
            float _2420 = _2418 * _2416;
            float _2422 = fma(_315, _2420, _2286);
            float _2424 = fma(_323, _2420, _2284);
            float _2426 = fma(_325, _2420, _2288);
            _2368 = _2422;
            _2374 = _2424;
            _2360 = _2426;
        }
    }
    float _2428 = _2368;
    float _2430 = _2374;
    float _2432 = _2360;
    float _2434 = -_1976;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2428);
    float _2438 = -_1974;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2430);
    float _2442 = -_1982;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2432);
    float _2446 = _2440;
    float _2448 = _2436;
    float _2450 = _2444;
    if (_2336)
    {
        _2362 = 1.0;
    }
    float _2452 = _2362;
    float _2454 = _2452;
    if (!_2322)
    {
        float _2456 = _1990 * _1990;
        float _2458 = 1.0 / _2098;
        float _2460 = -_1408;
        float _2462 = _2460 + _2430;
        float _2464 = -_1584;
        float _2466 = _2464 + _2428;
        float _2468 = fma(_1998, _1998, _2456);
        float _2470 = -_1406;
        float _2472 = _2470 + _2432;
        float _2474 = fma(_2010, _2010, _2468);
        float _2476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2478 = sqrt(_2474);
        float _2480 = _2462 * _2458;
        float _2482 = _2466 * _2458;
        float _2484 = _2472 * _2458;
        bool _2486 = _2478 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2488 = isnan(_2478);
        bool _2490 = _2486 || _2488;
        bool _2492 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2494 = _2490 || _2492;
        float _2496 = precise::min(_2478, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2498 = _2496 * _2476;
        float _2500 = fma(_2482, _2498, _1986);
        float _2502 = fma(_2480, _2498, _1980);
        float _2504 = _325;
        float _2506 = _2478;
        float _2508 = _2500;
        float _2510 = _2502;
        _1590 = _2484;
        _1592 = _2480;
        if (_2494)
        {
            float _2512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2504 = _2512;
        }
        float _2514 = _2504;
        if (_2494)
        {
            float _2516 = precise::max(_2478, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2506 = _2516;
        }
        float _2518 = _2506;
        float _2520 = fma(_2484, _2498, _1994);
        _337 = _2514;
        _2450 = _2520;
        if (_2494)
        {
            float _2522 = _2518 * _2514;
            _2232 = _2522;
        }
        float _2524 = _2232;
        if (_2494)
        {
            float _2526 = fma(_2482, _2524, _1986);
            _2508 = _2526;
        }
        float _2528 = _2508;
        _2448 = _2528;
        if (_2494)
        {
            float _2530 = fma(_2480, _2524, _1980);
            _2510 = _2530;
        }
        float _2532 = _2510;
        _2446 = _2532;
        if (_2494)
        {
            float _2534 = fma(_2484, _2524, _1994);
            _2450 = _2534;
        }
    }
    float _2536 = _337;
    float _2538 = _2446;
    float _2540 = _2448;
    float _2542 = _2450;
    float _2544 = _1590;
    float _2546 = _1592;
    float _2548 = _2546;
    float _2550 = _2536;
    float _2552 = _2544;
    if (_2336)
    {
        _2548 = 1.0;
    }
    float _2554 = _2548;
    float _2556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2558 = _2354 * _2556;
    float _2560 = _2554;
    if (!_2336)
    {
        float _2562 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2564 = _2562 * 0.15915493667125701904296875;
        float _2566 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2568 = _2564 * 6.283185482025146484375;
        float _2570 = cos(_2568);
        float _2572 = _2566 * 0.15915493667125701904296875;
        float _2574 = _2564 * 6.283185482025146484375;
        float _2576 = sin(_2574);
        float _2578 = 1.0 / _2570;
        float _2580 = _2572 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        float _2584 = _2576 * _2578;
        float _2586 = _2572 * 6.283185482025146484375;
        float _2588 = sin(_2586);
        float _2590 = _2582 * _2584;
        float _2592 = 1.0 / _2590;
        float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2596 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2594;
        float _2598 = 1.0 / _2596;
        float _2600 = _2588 * _2592;
        float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2604 = fma(_2558, _2600, _2602);
        float _2606 = _2604 * _2598;
        float _2608 = precise::clamp(_2606, 0.0, 1.0);
        _2550 = _2564;
        _2064 = _2592;
        _2454 = _2608;
    }
    float _2610 = _2550;
    float _2612 = _2064;
    float _2614 = _2454;
    float _2616 = _2612;
    float _2618 = _2610;
    if (!_2336)
    {
        float _2620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2622 = _2620 * 0.15915493667125701904296875;
        float _2624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2626 = _2622 * 6.283185482025146484375;
        float _2628 = cos(_2626);
        float _2630 = _2624 * 0.15915493667125701904296875;
        float _2632 = _2622 * 6.283185482025146484375;
        float _2634 = sin(_2632);
        float _2636 = 1.0 / _2628;
        float _2638 = _2630 * 6.283185482025146484375;
        float _2640 = cos(_2638);
        float _2642 = _2634 * _2636;
        float _2644 = _2630 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = _2640 * _2642;
        float _2650 = 1.0 / _2648;
        float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2654 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2652;
        float _2656 = 1.0 / _2654;
        float _2658 = _2646 * _2650;
        float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2662 = fma(_2558, _2658, _2660);
        float _2664 = _2662 * _2656;
        float _2666 = precise::clamp(_2664, 0.0, 1.0);
        float _2668 = -_2666;
        float _2670 = _2668 + 1.0;
        _2616 = _2648;
        _2618 = _2658;
        _2560 = _2670;
    }
    float _2672 = _2616;
    float _2674 = _2618;
    float _2676 = _2560;
    float _2678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2680 = _2538 + _2678;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2684 = _2540 + _2682;
    float _2686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2688 = _2542 + _2686;
    float _2690 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2692 = _2680 * _2680;
    float _2694 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2696 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2690);
    float _2698 = fma(_2684, _2684, _2692);
    float _2700 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2696);
    float _2702 = fma(_2688, _2688, _2698);
    float _2704 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2706 = rsqrt(_2702);
    float _2708 = sqrt(_2702);
    float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2712 = _2684 * _2710;
    float _2714 = _2688 * _2710;
    float _2716 = _2712 * _2712;
    float _2718 = _2714 * _2714;
    float _2720 = _2716 + _2718;
    float _2722 = sqrt(_2720);
    bool _2724 = _2722 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2728 = _2722 + _2726;
    float _2730 = _2706;
    float _2732 = _2720;
    float _2734 = _2728;
    float _2736 = _2672;
    float _2738 = _2680;
    float _2740 = _2674;
    if (_2724)
    {
        float _2742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2730 = _2742;
    }
    float _2744 = _2730;
    if (_2724)
    {
        float _2746 = rsqrt(_2720);
        _2732 = _2746;
    }
    float _2748 = _2732;
    float _2750 = _2748;
    if (_2724)
    {
        float _2752 = _2728 * _2744;
        _2734 = _2752;
    }
    float _2754 = _2734;
    if (_2724)
    {
        float _2756 = _2754 * 0.15915493667125701904296875;
        _2736 = _2756;
    }
    float _2758 = _2736;
    float _2760 = _2688;
    if (_2724)
    {
        float _2762 = _2758 * 6.283185482025146484375;
        float _2764 = sin(_2762);
        _2760 = _2764;
    }
    float _2766 = _2760;
    float _2768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2770 = precise::max(0.0, _2768);
    float _2772 = _2744;
    float _2774 = _2770;
    if (_2724)
    {
        float _2776 = _2758 * 6.283185482025146484375;
        float _2778 = cos(_2776);
        _2772 = _2778;
    }
    float _2780 = _2772;
    float _2782 = -_2710;
    float _2784 = -_2770;
    float _2786 = fma(_2680, _2782, _2784);
    if (_2724)
    {
        float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2738 = _2788;
    }
    float _2790 = _2738;
    float _2792 = _2790;
    float _2794 = _2766;
    if (_2724)
    {
        float _2796 = fma(_2766, _2790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2792 = _2796;
    }
    float _2798 = _2792;
    float _2800 = _2798;
    if (!_2724)
    {
        _2794 = _2712;
    }
    float _2802 = _2794;
    float _2804 = _2802;
    float _2806 = _2780;
    if (_2724)
    {
        float _2808 = _2780 + (-1.0);
        _2774 = _2808;
    }
    float _2810 = _2774;
    float _2812 = _2810;
    if (_2724)
    {
        float _2814 = _2748 * _2798;
        _2552 = _2814;
    }
    float _2816 = _2552;
    if (!_2724)
    {
        _2800 = _2786;
    }
    float _2818 = _2800;
    float _2820 = _2818;
    if (_2724)
    {
        float _2822 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2740 = _2822;
    }
    float _2824 = _2740;
    if (_2724)
    {
        float _2826 = _2712 * _2816;
        _2804 = _2826;
    }
    float _2828 = _2804;
    if (!_2724)
    {
        _2812 = _2714;
    }
    float _2830 = _2812;
    float _2832 = _2830;
    if (_2724)
    {
        float _2834 = _2714 * _2816;
        _2832 = _2834;
    }
    float _2836 = _2832;
    if (!_2724)
    {
        _2750 = _2716;
    }
    float _2838 = _2750;
    float _2840 = _2838;
    if (_2724)
    {
        float _2842 = fma(_2786, _2780, _2824);
        _2820 = _2842;
    }
    float _2844 = _2820;
    if (_2724)
    {
        float _2846 = _2828 * _2828;
        _2840 = _2846;
    }
    float _2848 = _2840;
    if (!_2724)
    {
        _2806 = _2718;
    }
    float _2850 = _2806;
    float _2852 = _2850;
    if (_2724)
    {
        float _2854 = _2836 * _2836;
        _2852 = _2854;
    }
    float _2856 = _2852;
    float _2858 = fma(_2844, _2844, _2848);
    float _2860 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2862 = _2858 + _2856;
    float _2864 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2860);
    float _2866 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2870 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2868);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = rsqrt(_2862);
    float _2876 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2864);
    float _2878 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2880 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2866);
    float _2882 = -_2872;
    float _2884 = _2882 + 1.0;
    float _2886 = _2876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2888 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2878);
    float _2890 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2880);
    float _2892 = abs(_2884);
    float _2894 = log2(_2892);
    float _2896 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2898 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2888);
    float _2900 = _2890 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2902 = -_2896;
    float _2904 = fma(_2902, _2694, 1.0);
    float _2906 = _2898 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2908 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2910 = _2874 * _2828;
    float _2912 = _2874 * _2844;
    float _2914 = _2874 * _2836;
    float _2916 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2908);
    float _2918 = _2910 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2920 = log2(_2904);
    float _2922 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2916);
    float _2924 = -_2918;
    float _2926 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2924);
    float _2928 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2930 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2922);
    float _2932 = -_2914;
    float _2934 = fma(_2932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2926);
    float _2936 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2938 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2940 = 1.0 / _2930;
    float _2942 = fma(_2934, -0.5, 0.5);
    float _2944 = fma(_2934, 0.5, 0.5);
    float _2946 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2936);
    float _2948 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2938);
    float _2950 = _2912 + 1.0;
    float _2952 = fma(_2944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2954 = _2920 * 0.693147182464599609375;
    float _2956 = exp2(_2928);
    float _2958 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2948);
    float _2960 = fma(_2944, _2952, -0.212114393711090087890625);
    float _2962 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2964 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2958);
    float _2966 = fma(_2944, _2960, 1.570728778839111328125);
    float _2968 = sqrt(_2942);
    float _2970 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2946);
    float _2972 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2970);
    float _2974 = -_2912;
    float _2976 = fma(_2956, _2950, _2974);
    float _2978 = _2972 * _2940;
    float _2980 = _2964 * _2940;
    float _2982 = fma(_2976, 0.5, 0.5);
    float _2984 = fma(_2978, 0.5, 0.5);
    float _2986 = fma(_2980, -0.5, 0.5);
    float _2988 = _2968 * 0.636619746685028076171875;
    float _2990 = -_2966;
    float _2992 = fma(_2988, _2990, 1.0);
    float3 _8030 = float3(_2984, _2986, _2962);
    float _2994 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8030, float3(0.0), isnan(_8030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8030, float3(0.0), isnan(_8030)), level(0.0)).x;
    float3 _8041 = float3(_2984, _2986, _2962);
    float4 _2997 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8041, float3(0.0), isnan(_8041)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8041, float3(0.0), isnan(_8041)), level(0.0)).xyzw;
    float _2999 = _2997.x;
    float _3001 = _2997.y;
    float _3003 = _2997.z;
    float _3005 = _2997.w;
    float2 _8058 = float2(_2992, _2982);
    float3 _3009 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8058, float2(0.0), isnan(_8058)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8058, float2(0.0), isnan(_8058)), level(0.0)).xyz;
    float _3011 = _3009.x;
    float _3013 = _3009.y;
    float _3015 = _3009.z;
    float _3017 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3019 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3021 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3023 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3025 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3017);
    float _3027 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3029 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3031 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3019);
    float _3033 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3021);
    float _3035 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3025);
    float _3037 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3039 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3041 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3043 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3045 = -_2114;
    float _3047 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3023);
    float _3049 = -_2114;
    float _3051 = fma(_3049, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3027);
    float _3053 = exp2(_3037);
    float _3055 = -_2114;
    float _3057 = fma(_3055, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3029);
    float _3059 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3061 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3031);
    float _3063 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3033);
    float _3065 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3039);
    float _3067 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3041);
    float _3069 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3043);
    float _3071 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3059);
    float _3073 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3047);
    float _3075 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3051);
    float _3077 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3079 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3057);
    float _3081 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3069);
    float _3083 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    float _3085 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3067);
    float _3087 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3071);
    float _3089 = _3077 * _3073;
    float _3091 = _3077 * _3075;
    float _3093 = _329 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3095 = _3077 * _3079;
    float _3097 = -_3053;
    float _3099 = _3097 + 1.0;
    float _3101 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3081);
    float _3103 = fma(_3093, _3035, _3089);
    float _3105 = fma(_3093, _3063, _3095);
    float _3107 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3109 = _2930 * 0.5;
    float _3111 = _3101 + _2930;
    float _3113 = _2972 + _2930;
    float _3115 = fma(_3093, _3061, _3091);
    float _3117 = fma(_2964, -0.5, _3109);
    float _3119 = _3111 * 0.5;
    float _3121 = _3113 * 0.5;
    float _3123 = _3083 + _3103;
    float _3125 = _3085 + _3115;
    float _3127 = _3087 + _3105;
    bool _3129 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3131 = isnan(_2708);
    bool _3133 = _3129 || _3131;
    bool _3135 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3137 = _3133 || _3135;
    out.m_70.x = _3121;
    out.m_70.y = _3117;
    out.m_70.z = _3119;
    out.m_70.w = _2930;
    out.m_72.x = _3123;
    out.m_72.y = _3125;
    out.m_72.z = _3127;
    out.gl_Position.x = _2972;
    out.gl_Position.y = _2964;
    out.gl_Position.z = _3101;
    out.gl_Position.w = _2930;
    float _3139 = _3115;
    float _3141 = _3093;
    if (!_3137)
    {
        _3139 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3143 = _3139;
    float _3145 = _3143;
    float _3147 = _3143;
    if (!_3137)
    {
        _3141 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3149 = _3141;
    float _3151 = _3107 * _2994;
    float _3153 = -_3107;
    float _3155 = _3153 + 1.0;
    float _3157 = _3005 * _3151;
    float _3159 = _3015 * _3151;
    float _3161 = _3005 * _3155;
    float _3163 = fma(_3011, _3157, _2999);
    float _3165 = fma(_3013, _3157, _3001);
    float _3167 = fma(_3005, _3159, _3003);
    float _3169 = _2614 * _2676;
    float _3171 = _3003;
    float _3173 = _3005;
    float _3175 = _3001;
    float _3177 = _3169;
    float _3179 = _3149;
    float _3181 = _3149;
    if (!_3137)
    {
        _3171 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3183 = _3171;
    float _3185 = _3183;
    float _3187 = _3183;
    if (!_3137)
    {
        _3173 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3189 = _3173;
    out.m_74.x = _3163;
    out.m_74.y = _3165;
    out.m_74.z = _3167;
    out.m_74.w = _3161;
    float _3191 = _3169 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3193 = _3189;
    float _3195 = _3189;
    if (!_3137)
    {
        _3175 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3197 = _3175;
    float _3199 = _3197;
    float _3201 = _3197;
    if (!_3137)
    {
        _3177 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3203 = _3177;
    bool _3205 = !_3137;
    float _3207 = _3203;
    float _3209 = _3203;
    if (!_3205)
    {
        bool _3211 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3213 = isnan(_2708);
        bool _3215 = _3211 || _3213;
        bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3219 = _3215 || _3217;
        if (!_3219)
        {
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3223 = _2708 + _3221;
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3227 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3225;
            float _3229 = 1.0 / _3227;
            float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3247 = _3223 * _3229;
            float _3249 = precise::clamp(_3247, 0.0, 1.0);
            float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3259 = fma(_3249, _3233, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3261 = fma(_3249, _3253, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3263 = fma(_3249, _3257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3265 = fma(_3249, _3237, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3267 = fma(_3249, _3241, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3269 = fma(_3249, _3245, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3187 = _3263;
            _3201 = _3267;
            _3147 = _3261;
            _3181 = _3265;
            _3195 = _3259;
            _3209 = _3269;
            _3271 = true;
        }
        else
        {
            bool _3273 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3275 = isnan(_2708);
            bool _3277 = _3273 || _3275;
            bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3281 = _3277 || _3279;
            if (!_3281)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3283 = _3145;
            _3147 = _3283;
            if (!_3281)
            {
                _3185 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3285 = _3185;
            _3187 = _3285;
            if (!_3281)
            {
                _3193 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3287 = _3193;
            _3195 = _3287;
            if (!_3281)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3289 = _3179;
            _3181 = _3289;
            if (!_3281)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3291 = _3199;
            _3201 = _3291;
            if (!_3281)
            {
                _3207 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3293 = _3207;
            bool _3295 = !_3281;
            _3209 = _3293;
            if (!_3295)
            {
                bool _3297 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3299 = isnan(_2708);
                bool _3301 = _3297 || _3299;
                bool _3303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3305 = _3301 || _3303;
                if (!_3305)
                {
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3309 = _2708 + _3307;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3311;
                    float _3315 = 1.0 / _3313;
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3333 = _3309 * _3315;
                    float _3335 = precise::clamp(_3333, 0.0, 1.0);
                    float _3337 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3339 = _3337 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3343 = _3341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3345 = fma(_3335, _3319, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3347 = fma(_3335, _3339, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3349 = fma(_3335, _3343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3351 = fma(_3335, _3323, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3353 = fma(_3335, _3327, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3355 = fma(_3335, _3331, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3187 = _3349;
                    _3201 = _3353;
                    _3147 = _3347;
                    _3181 = _3351;
                    _3195 = _3345;
                    _3209 = _3355;
                    _3271 = true;
                }
                else
                {
                    _3187 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3195 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3209 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3271 = false;
    float _3357 = _3187;
    float _3359 = _3201;
    float _3361 = _3147;
    float _3363 = _3181;
    float _3365 = _3195;
    float _3367 = _3209;
    float _3369 = fma(_3125, -0.5, 0.5);
    float _3371 = precise::clamp(_3369, 0.0, 1.0);
    float _3373 = -_3357;
    float _3375 = _3373 + _3359;
    float _3377 = _3191 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3379 = -_3361;
    float _3381 = _3379 + _3363;
    float _3383 = fma(_3371, _3375, _3357);
    out.m_76.x = 0.0;
    float _3385 = -_3365;
    float _3387 = _3385 + _3367;
    float _3389 = fma(_3371, _3381, _3361);
    float _3391 = _3383 * 0.586610972881317138671875;
    out.m_47.x = _3377;
    bool _3393 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3395 = fma(_3371, _3387, _3365);
    float _3397 = fma(_3389, 0.298911988735198974609375, _3391);
    bool _3399 = _2614 > 0.0;
    bool _3401 = isnan(_2614);
    bool _3403 = _3399 || _3401;
    bool _3405 = isnan(0.0);
    bool _3407 = _3403 || _3405;
    float _3409 = fma(_3395, 0.114477999508380889892578125, _3397);
    bool _3411 = _2676 <= 0.0;
    bool _3413 = !_3407;
    bool _3415 = _3411 || _3413;
    float _3417 = -_3409;
    float _3419 = _3389 + _3417;
    float _3421 = -_3409;
    float _3423 = _3383 + _3421;
    float _3425 = -_3409;
    float _3427 = _3395 + _3425;
    float _3429 = fma(_3419, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3431 = fma(_3423, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3433 = fma(_3427, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    bool _3435 = !_3393;
    if (!_3435)
    {
        float _3437 = -_2538;
        float _3439 = _3437 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3441 = -_2540;
        float _3443 = _3441 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3445 = -_2542;
        float _3447 = _3445 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3449 = _3439 * _3439;
        float _3451 = fma(_3443, _3443, _3449);
        float _3453 = fma(_3447, _3447, _3451);
        float _3455 = sqrt(_3453);
        float _3457 = rsqrt(_3453);
        float _3459 = -_3455;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3463 = _3461 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3465 = precise::clamp(_3463, 0.0, 1.0);
        float _3467 = _3443 * _3457;
        float _3469 = _3439 * _3457;
        float _3471 = abs(_3465);
        float _3473 = log2(_3471);
        float _3475 = _3447 * _3457;
        float _3477 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3479 = _3125 * _3469;
        float _3481 = -_3469;
        float _3483 = -_3477;
        float _3485 = fma(_3481, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3483);
        float _3487 = fma(_3123, _3467, _3479);
        float _3489 = -_3475;
        float _3491 = fma(_3489, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3485);
        float _3493 = fma(_3127, _3475, _3487);
        float _3495 = precise::clamp(_3493, 0.0, 1.0);
        float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3499 = _3491 + _3497;
        float _3501 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3503 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3505 = precise::clamp(_3503, 0.0, 1.0);
        float _3507 = exp2(_3501);
        float _3509 = _3507 * _3505;
        float _3511 = _3495 * _3509;
        float _3513 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3515 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3517 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_76.x = _3513;
        out.m_76.y = _3515;
        out.m_76.z = _3517;
    }
    out.m_78.x = _3429;
    out.m_78.y = _3431;
    out.m_78.z = _3433;
    if (!_3415)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3519 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_47.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3519;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3271 = false;
    bool _923 = false;
    bool _731 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3576 = as_type<float>(_113);
        out.gl_Position.z = _3576;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _3645 = as_type<float>(_151);
        out.gl_Position.z = _3645;
    }
    if (_145)
    {
        return out;
    }
    float _153 = in.m_51.x;
    float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_56.x;
    float _163 = in.m_56.y;
    float _165 = in.m_56.z;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _169 = _157 * _155;
    float _171 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _175 = _171 * _167;
    float _177 = floor(_173);
    int _179 = as_type<int>(_159) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_159) & 2;
    bool _185 = _183 != 0;
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].y, _175);
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = _173 * 6.283185482025146484375;
    float _201 = _187 * 6.283185482025146484375;
    float _203 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _209 = _199 * 0.15915493667125701904296875;
    float _211 = _201 * 0.15915493667125701904296875;
    float _213 = floor(_187);
    bool _215 = !_191;
    int _217 = _215 ? 0 : 1;
    float _219 = -_177;
    float _221 = _173 + _219;
    bool _223 = !_185;
    float _225 = _223 ? (-0.5) : 0.5;
    int _227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _229 = _227 != 0;
    int _231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _233 = _231 != 0;
    int _235 = abs(_217);
    float _237 = _209 * 6.283185482025146484375;
    float _239 = cos(_237);
    bool _241 = !_229;
    int _243 = _241 ? 0 : 1;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _247 = abs(_243);
    float _249 = _211 * 6.283185482025146484375;
    float _251 = cos(_249);
    bool _253 = _221 < 0.5;
    float _255 = float(_253);
    float _257 = -_213;
    float _259 = _187 + _257;
    bool _261 = !_233;
    int _263 = _261 ? 0 : 1;
    float _265 = -_221;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = -_255;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = float(_235);
    float _275 = fma(_239, 0.5, 0.5);
    float _277 = float(_247);
    float _279 = -_259;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _283 = _259 < 0.5;
    float _285 = float(_283);
    float _287 = -_275;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _291 = abs(_263);
    float _293 = abs(_267);
    float _295 = _277 * _293;
    float _297 = abs(_281);
    float _299 = _277 * _297;
    float _301 = fma(_251, 0.5, 0.5);
    float _303 = float(_291);
    float _305 = fma(_273, _289, _295);
    float _307 = -_285;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _311 = -_301;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _315 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _317 = abs(_271);
    float _319 = fma(_303, _317, _305);
    float _321 = fma(_273, _313, _299);
    float _323 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _325 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _327 = !_181;
    float _329 = _327 ? (-0.5) : 0.5;
    float _331 = abs(_309);
    float _333 = fma(_303, _331, _321);
    bool _335 = !_245;
    float _337 = _325;
    float _353;
    if (!_335)
    {
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_97);
        float _359 = 1.0 / _357;
        float _361 = _131 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = 1.0 / _371;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _395 = 1.0 / _379;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _363 + _397;
    bool _401 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _403 = 1.0 / _375;
    float _405 = _399 * _385;
    bool _407 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _409 = isnan(_363);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _421 = _363 + _419;
    bool _423 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _425 = isnan(_363);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _383;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _363 + _441;
    float _445 = _443 * _395;
    float _447 = -_417;
    float _449 = _447 + 1.0;
    float _451 = 1.0 / _439;
    float _453 = _367 * _403;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _457 = _363 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _461 = _363 + _459;
    float _463 = 1.0 / _389;
    float _465 = _433 * _449;
    float _467 = _457 * _435;
    float _469 = -_433;
    float _471 = _469 + 1.0;
    bool _473 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _475 = isnan(_363);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _485;
    float _489 = 1.0 / _393;
    bool _491 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _493 = isnan(_363);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = _461 * _451;
    bool _505 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _507 = isnan(_363);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = -_483;
    float _519 = _517 + 1.0;
    float _521 = fma(_487, _405, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _523 = _501 * _471;
    float _525 = -_501;
    float _527 = _525 + 1.0;
    float _529 = _421 * _463;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _533 = _363 + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _535;
    float _539 = _483 * _527;
    float _541 = -_515;
    float _543 = _541 + 1.0;
    float _545 = _515 * _519;
    float _547 = fma(_537, _405, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _549 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _551 = isnan(_363);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _533 * _489;
    bool _563 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _565 = isnan(_363);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    bool _575 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _577 = isnan(_363);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -_559;
    float _589 = _587 + 1.0;
    float _591 = _573 * _543;
    float _593 = -_573;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _601 = _585 * _589;
    float _603 = _559 * _595;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _609;
    float _613 = fma(_599, _453, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _615;
    float _619 = fma(_607, _453, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _621 = fma(_611, _445, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _623 = _521 * _601;
    float _625 = -_585;
    float _627 = _625 + 1.0;
    float _629 = _547 * _601;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = fma(_617, _445, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _641 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[143].x, _623);
    float _643 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[143].y, _629);
    float _645 = fma(_633, _467, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _647 = fma(_613, _603, _641);
    float _649 = fma(_639, _467, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _651 = fma(_619, _603, _643);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _657;
    float _661 = fma(_621, _591, _647);
    float _663 = fma(_635, _591, _651);
    float _665 = fma(_655, _529, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _667 = fma(_659, _529, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _677 = fma(_645, _545, _661);
    float _679 = fma(_649, _545, _663);
    float _681 = fma(_671, _561, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _683 = fma(_675, _561, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _685;
    float _689 = fma(_665, _539, _677);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _691;
    float _695 = fma(_667, _539, _679);
    float _697 = fma(_687, _503, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _699 = fma(_681, _523, _689);
    float _701 = fma(_693, _503, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _703 = fma(_683, _523, _695);
    float _705 = fma(_697, _465, _699);
    float _707 = fma(_701, _465, _703);
    float _709 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[150].x, _705);
    float _711 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[150].y, _707);
    bool _713 = !_401;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _717 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_97);
        float _735 = 1.0 / _733;
        float _737 = _131 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = _739 + _741;
    bool _745 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _747 = isnan(_739);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _759 = _739 + _757;
    bool _761 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _763 = isnan(_739);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _781 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _783 = isnan(_739);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = 1.0 / _779;
    float _795 = -_791;
    float _797 = _795 + 1.0;
    bool _799 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _801 = 1.0 / _775;
    float _803 = _771 * _797;
    float _805 = -_771;
    float _807 = _805 + 1.0;
    float _809 = _759 * _793;
    float _811 = _743 * _801;
    float _813 = -_755;
    float _815 = _813 + 1.0;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _817;
    float _821 = _791 * _815;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _827;
    float _831 = fma(_819, _811, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _833 = fma(_825, _811, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _835 = fma(_829, _811, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _837 = _831 * _803;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _843 = _833 * _803;
    float _845 = _835 * _803;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _855 = fma(_841, _809, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _857 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].x, _843);
    float _859 = fma(_849, _809, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _861 = fma(_853, _809, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _863 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].y, _837);
    float _865 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].z, _845);
    float _867 = fma(_859, _821, _857);
    float _869 = fma(_855, _821, _863);
    float _871 = fma(_861, _821, _865);
    float _873 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].x, _867);
    float _875 = in.m_58.x;
    float _877 = in.m_58.y;
    float _879 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].y, _869);
    float _881 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].z, _871);
    float _883 = _873 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _887 = _879 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _891;
    out.m_60.y = _893;
    out.m_60.z = _895;
    out.m_60.w = _885;
    float _897 = _711 * _877;
    float _899 = _709 * _875;
    bool _901 = !_799;
    float _919;
    float _921;
    if (!_901)
    {
        float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _905 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _907 = float(_97);
        float _909 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _911 = _909 * _903;
        float _913 = floor(_911);
        float _915 = -_913;
        float _917 = _911 + _915;
        _919 = _917;
        _921 = _907;
        _923 = true;
    }
    else
    {
        float _925 = float(_97);
        float _927 = 1.0 / _925;
        float _929 = _131 * _927;
        _919 = _929;
        _921 = _925;
    }
    _923 = false;
    float _931 = _919;
    float _933 = _921;
    float _935 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _937 = int(_935);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _941 = _931 + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _945 = _931 + _943;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _949 = int(_947);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _955;
    float _959 = float(_937);
    float _961 = 1.0 / _933;
    float _963 = float(uint(_949));
    float _965 = 1.0 / _959;
    int _967 = ~_949;
    int _969 = _967 + 1;
    int _971 = ~_949;
    int _973 = _971 + 1;
    int _975 = ~_949;
    int _977 = _975 + 1;
    float _979 = 1.0 / _963;
    float _981 = _965 * _131;
    float _983 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _985 = log2(_983);
    int _987 = as_type<int>(_979) + (-2);
    float _989 = trunc(_981);
    int _991 = int(_989);
    float _993 = _985 * _131;
    float _995 = exp2(_993);
    float _997 = float(uint(_991));
    float _999 = as_type<float>(_987) * _997;
    float _1001 = trunc(_999);
    float _1003 = precise::max(_1001, 0.0);
    uint _1006 = uint(_1003);
    float _1008 = -_995;
    float _1010 = _1008 + 1.0;
    float _1012 = float(_949);
    int _1014 = _969 * int(_1006);
    int _1016 = _1014 + _991;
    float _1018 = float(uint(_1016));
    float _1020 = as_type<float>(_987) * _1018;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1024 = _1022 != 0;
    bool _1026 = !_1024;
    float _1028 = _1026 ? 7.345489978790283203125 : 1.0;
    float _1030 = trunc(_1020);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = _1028 * _153;
    float _1038 = floor(_1036);
    int _1040 = int(_1006) + int(_1034);
    float _1042 = float(_991);
    int _1044 = _973 * _1040;
    int _1046 = _1044 + _991;
    bool _1048 = _1042 >= _1012;
    bool _1050 = isnan(_1042);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(_1012);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -_1038;
    float _1062 = _1036 + _1060;
    bool _1064 = uint(_1046) >= uint(_949);
    float _1066 = trunc(_1058);
    int _1068 = int(_1066);
    bool _1070 = !_1064;
    int _1072 = _1070 ? 0 : (-1);
    bool _1074 = _949 == 0;
    int _1076 = ~_1040;
    int _1078 = _1076 + _1072;
    int _1080 = _1078 + 1;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1092 = _1090 != 0;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1096 = _1094 != 0;
    int _1098 = _949 * _1080;
    int _1100 = _1098 + _991;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1104 = _1102 != 0;
    bool _1106 = !_1084;
    int _1108 = _1106 ? 0 : 1;
    bool _1110 = !_1074;
    int _1112 = _1110 ? _1100 : (-1);
    float _1114 = _1062 * _1012;
    float _1116 = _1012 * _131;
    int _1118 = ~_1068;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = trunc(_1114);
    int _1126 = int(_1124);
    float _1128 = _1116 * _961;
    bool _1130 = !_1088;
    int _1132 = _1130 ? 0 : 1;
    int _1134 = _1112 * _1122;
    int _1136 = _949 + (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1140 = _1138 != 0;
    float _1142 = trunc(_1128);
    int _1144 = int(_1142);
    int _1146 = _1068 * _1136;
    int _1148 = _1146 + _1134;
    int _1150 = abs(_1132);
    bool _1152 = !_1096;
    int _1154 = _1152 ? 0 : 1;
    bool _1156 = !_1092;
    int _1158 = _1156 ? 0 : 1;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1162 = _1160 != 0;
    int _1164 = abs(_1154);
    int _1166 = abs(_1108);
    int _1168 = abs(_1158);
    int _1170 = _1148 * _1150;
    bool _1172 = !_1162;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _1126 * _1164;
    int _1178 = _1176 + _991;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1182 = _1180 != 0;
    int _1184 = _1144 * _1166;
    int _1186 = _1184 + _1170;
    int _1188 = abs(_1174);
    float _1190 = in.m_51.y;
    float _1192 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1194 = _1178 * _1168;
    int _1196 = _1194 + _1186;
    int _1198 = ~_949;
    int _1200 = _1198 + 1;
    float _1202 = -_951;
    float _1204 = fma(_1192, 2.0, _1202);
    int _1206 = _1126 * _1188;
    int _1208 = _1206 + _1196;
    float _1210 = _153 * 2.0;
    float _1212 = -_131;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1204);
    bool _1216 = _153 > 0.5;
    float _1218 = floor(_1210);
    float _1220 = float(uint(_1208));
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1230 = as_type<float>(_987) * _1220;
    float _1232 = 1.0 / _1224;
    float _1234 = in.m_44.x;
    float _1236 = in.m_44.y;
    float _1238 = in.m_44.z;
    float _1240 = _1190 * 2.0;
    float _1242 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1244 = trunc(_1230);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    bool _1250 = _1218 > 0.0;
    float _1252 = fma(_1242, -2.0, _953);
    bool _1254 = _1218 >= 0.0;
    bool _1256 = isnan(_1218);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan(0.0);
    bool _1262 = _1258 || _1260;
    float _1264 = in.m_51.z;
    float _1266 = floor(_1240);
    float _1268 = _941 * _1232;
    int _1270 = ~_949;
    int _1272 = _1270 + 1;
    int _1274 = _1200 * int(_1248);
    int _1276 = _1274 + _1208;
    float _1278 = -_329;
    int _1280 = _1216 ? as_type<int>(_1278) : as_type<int>(_329);
    float _1282 = 1.0 / _1228;
    bool _1284 = _1190 > 0.5;
    float _1286 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1288 = float(uint(_1276));
    float _1290 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1292 = _1262 ? 0 : 1;
    bool _1294 = !_1140;
    float _1296 = _1294 ? _329 : as_type<float>(_1280);
    float _1298 = as_type<float>(_987) * _1288;
    int _1300 = ~_1292;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = -_225;
    int _1308 = _1284 ? as_type<int>(_1306) : as_type<int>(_225);
    float _1310 = trunc(_1298);
    float _1312 = precise::max(_1310, 0.0);
    uint _1314 = uint(_1312);
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1326 = _1324 != 0;
    float _1328 = _1190 + _1264;
    int _1330 = _1304;
    if (!_1250)
    {
        int _1332 = ~_1292;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1340 = _1266 >= 0.0;
    bool _1342 = isnan(_1266);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan(0.0);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1286);
    float _1352 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1290);
    float _1354 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1338);
    int _1356 = _1348 ? 0 : 1;
    float _1358 = _153 + _1190;
    bool _1360 = _1266 > 0.0;
    float _1362 = _1264 * 2.0;
    float _1364 = _1358 + (-1.0);
    float _1366 = _1328 + (-1.0);
    int _1368 = int(_1248) + int(_1314);
    float _1370 = _945 * _1282;
    float _1372 = floor(_1362);
    float _1374 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1352);
    int _1376 = _1272 * _1368;
    int _1378 = _1376 + _1208;
    bool _1380 = !_1104;
    float _1382 = _1380 ? _225 : as_type<float>(_1308);
    int _1384 = ~_1356;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    float _1390 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1392 = uint(_1378) >= uint(_949);
    float _1394 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1396 = _1388;
    if (!_1360)
    {
        int _1398 = ~_1356;
        int _1400 = _1398 + 1;
        _1396 = _1400;
    }
    int _1402 = _1396;
    float _1404 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1350);
    float _1406 = _1374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1408 = _1404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1410 = !_1392;
    int _1412 = _1410 ? 0 : (-1);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1414;
    bool _1418 = _1372 > 0.0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1420;
    bool _1424 = _1372 >= 0.0;
    bool _1426 = isnan(_1372);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(0.0);
    bool _1432 = _1428 || _1430;
    float _1434 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1354);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1440 = _1296 + 0.5;
    int _1442 = ~_1368;
    int _1444 = _1442 + _1412;
    int _1446 = _1444 + 1;
    float _1448 = fma(_1422, _1268, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1450 = fma(_1438, _1370, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1452 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1214);
    bool _1454 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1456 = isnan(_931);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1462 = _1458 || _1460;
    float _1464 = float(_1462);
    float _1466 = fma(_1416, _1268, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1468 = fma(_957, _1268, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1470 = _1432 ? 0 : 1;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1476 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1484 = _1480 || _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1490 = _949 * _1446;
    int _1492 = _1490 + _1208;
    bool _1494 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1496 = isnan(_931);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = -_1464;
    float _1508 = _1506 + 1.0;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1512 = 1.0 + _1510;
    float _1514 = _1484 ? _1010 : 0.0;
    float _1516 = fma(_1474, _1370, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1518 = float(uint(_1178));
    float _1520 = _1504 * _1508;
    float _1522 = -_1504;
    float _1524 = _1522 + 1.0;
    float _1526 = fma(_1488, _1370, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1528 = 1.0 / _1512;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1532 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1534 = isnan(_931);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = as_type<float>(_987) * _1518;
    float _1546 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    bool _1548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1550 = isnan(1.0);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1556 = _1552 || _1554;
    float _1558 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1252);
    float _1560 = trunc(_1544);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1568 = !_1074;
    int _1570 = _1568 ? _1492 : (-1);
    float _1572 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1546);
    float _1574 = _1382 + (-0.5);
    float _1576 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1566);
    int _1578 = _1570 >> 31;
    float _1580 = -_1572;
    float _1582 = _1580 + 1.0;
    float _1584 = _1434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1586 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1576);
    float _1588 = _1542 * _1524;
    float _1590 = _1408;
    float _1592 = _1406;
    if (_1556)
    {
        float _1594 = _1514 * _1528;
        _135 = _1594;
    }
    float _1596 = _135;
    float _1598 = -_1542;
    float _1600 = _1598 + 1.0;
    int _1602 = _1578 & 3;
    float _1604 = _1466 * _1588;
    float _1606 = _1468 * _1588;
    float _1608 = -_1574;
    float _1610 = -_1558;
    float _1612 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1610);
    int _1614 = _1570 + _1602;
    int _1616 = _977 * int(_1564);
    int _1618 = _1616 + _1178;
    float _1620 = _1448 * _1588;
    float _1622 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1604);
    int _1624 = _1614 >> 2;
    float _1626 = _1190 + (-0.5);
    float _1628 = float(uint(_1618));
    float _1630 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1620);
    float _1632 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1606);
    int _1634 = _1624 << 4;
    int _1636 = _1634 + 368;
    float _1638 = fma(_1450, _1520, _1622);
    bool _1640 = !_1322;
    int _1642 = _1640 ? 0 : 1;
    float _1644 = as_type<float>(_987) * _1628;
    uint _1646 = uint(int(uint(_1636) >> uint(2)));
    uint _1648 = uint(int(uint(int(_1646)) >> uint(2)));
    int _1650 = int(_1646) & 3;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[int(_1648)][_1650];
    int _1654 = int(_1646) + 1;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    int _1658 = _1654 & 3;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[int(_1656)][_1658];
    float _1662 = -_1586;
    float _1664 = _1662 + 1.0;
    int _1666 = abs(_1642);
    float _1668 = fma(_1516, _1520, _1630);
    int _1670 = ~_1470;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = -_1664;
    float _1678 = fma(_1296, _1676, _1452);
    float _1680 = float(_1336);
    float _1682 = fma(_1382, _1582, _1612);
    float _1684 = float(_1666);
    float _1686 = trunc(_1644);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = _1674;
    float _1694 = _1626;
    if (!_1418)
    {
        int _1696 = ~_1470;
        int _1698 = _1696 + 1;
        _1692 = _1698;
    }
    int _1700 = _1692;
    float _1702 = fma(_1526, _1520, _1632);
    int _1704 = _1570 & 3;
    bool _1706 = _1704 != 0;
    float _1708 = _1684 * _1680;
    bool _1710 = !_1318;
    int _1712 = _1710 ? 0 : 1;
    out.m_62.x = _1678;
    out.m_62.y = _1682;
    bool _1714 = uint(_1704) > 1u;
    int _1716 = _1570 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = abs(_1712);
    int _1722 = _1636 + 8;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = _1718 ? 0 : 1;
    int _1742 = int(_1564) + int(_1690);
    float _1744 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1668);
    int _1746 = ~_1740;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    float _1752 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1638);
    int _1754 = _1750;
    if (!_1714)
    {
        int _1756 = ~_1740;
        int _1758 = _1756 + 1;
        _1754 = _1758;
    }
    int _1760 = _1754;
    float _1762 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1702);
    bool _1764 = !_1706;
    int _1766 = _1764 ? 0 : 1;
    float _1768 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1770 = abs(_1760);
    float _1772 = float(_1720);
    int _1774 = abs(_1766);
    float _1776 = float(_1700);
    int _1778 = ~_949;
    int _1780 = _1778 + 1;
    int _1782 = ~_1770;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    float _1788 = _1772 * _1776;
    bool _1790 = _1704 != 3;
    int _1792 = _1780 * _1742;
    int _1794 = _1792 + _1178;
    int _1796 = ~_1774;
    int _1798 = _1796 + 1;
    int _1800 = _1798 + 1;
    int _1802 = _1786 * as_type<int>(_1660);
    bool _1804 = uint(_1704) >= 2u;
    bool _1806 = uint(_1794) >= uint(_949);
    int _1808 = _1800 * as_type<int>(_1652);
    int _1810 = _1808 + _1802;
    int _1812 = _1804 ? 0 : 1;
    float _1814 = in.m_64.x;
    float _1816 = in.m_64.y;
    float _1818 = in.m_64.z;
    bool _1820 = _1704 != 3;
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1824 = _1408 + _1822;
    int _1826 = ~_1812;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1830;
    if (_1790)
    {
        int _1834 = ~_1812;
        int _1836 = _1834 + 1;
        _1832 = _1836;
    }
    int _1838 = _1832;
    float _1840 = _1824 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1842 = !_1820;
    int _1844 = _1842 ? 0 : (-1);
    int _1846 = abs(_1838);
    bool _1848 = !_1806;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = abs(_1844);
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1856 = _1584 + _1854;
    int _1858 = ~_1846;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    int _1864 = ~_1742;
    int _1866 = _1864 + _1850;
    int _1868 = _1866 + 1;
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1840);
    bool _1872 = !_1182;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = _1862 * as_type<int>(_1730);
    int _1878 = _1876 + _1810;
    int _1880 = ~_1852;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    float _1886 = _1708 * (-2.0);
    int _1888 = abs(_1874);
    float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1892 = _1406 + _1890;
    int _1894 = _1884 * as_type<int>(_1738);
    int _1896 = _1894 + _1878;
    float _1898 = fma(_1394, _1886, _1394);
    float _1900 = fma(_1886, _1816, _1816);
    float _1902 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1870);
    int _1904 = _949 * _1868;
    int _1906 = _1904 + _1178;
    float _1908 = _1824 * _1824;
    float _1910 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1900);
    bool _1912 = _1902 >= 0.0;
    float _1914 = fma(_1856, _1856, _1908);
    int _1916 = ~_1888;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    float _1922 = _1762 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1924 = !_1074;
    int _1926 = _1924 ? _1906 : (-1);
    float _1928 = fma(_1892, _1892, _1914);
    float _1930 = fma(_1898, _1596, _1910);
    int _1932 = _1896 * _1920;
    float _1934 = _1788 * (-2.0);
    float _1936 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1938 = !_1326;
    int _1940 = _1938 ? 0 : 1;
    float _1942 = rsqrt(_1928);
    int _1944 = _1926 * _1888;
    int _1946 = _1944 + _1932;
    float _1948 = _1818;
    if (_1912)
    {
        _1694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1950 = _1694;
    float _1952 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1954 = fma(_1390, _1934, _1390);
    float _1956 = fma(_1934, _1814, _1814);
    float _1958 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1962 = as_type<int>(_1950);
    if (_1912)
    {
        float _1964 = _1950 * 5.0;
        _1962 = as_type<int>(_1964);
    }
    int _1966 = _1962;
    float _1968 = float(_1946);
    if (_1912)
    {
        out.m_47.x = 0.0;
    }
    float _1970 = _153 + (-0.5);
    int _1972 = abs(_1940);
    out.m_66.x = _1958;
    out.m_66.y = _1960;
    out.m_66.z = _1936;
    float _1974 = _1824 * _1942;
    float _1976 = _1856 * _1942;
    if (_1912)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6414 = as_type<float>(_1966);
        out.gl_Position.z = _6414;
    }
    out.m_68.x = _1968;
    if (_1912)
    {
        return out;
    }
    float _1978 = -_1974;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1982 = _1892 * _1942;
    float _1984 = -_1976;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1584);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1990 = _1980 + _1988;
    float _1992 = -_1982;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1998 = _1986 + _1996;
    float _2000 = -_1974;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1824);
    float _2004 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2006 = float(_1972);
    float _2008 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2010 = _1994 + _2008;
    float _2012 = float(_1402);
    float _2014 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2004);
    float _2016 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1956);
    float _2018 = -_1976;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1856);
    float _2022 = _2002 * _2002;
    float _2024 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2014);
    float _2026 = fma(_1954, _1596, _2016);
    float _2028 = _153 + _1264;
    float _2030 = _2006 * _2012;
    float _2032 = fma(_2020, _2020, _2022);
    float _2034 = _2026 * 0.15915493667125701904296875;
    float _2036 = _2028 + (-1.0);
    bool _2038 = _2024 >= 0.0;
    float _2040 = _2030 * (-2.0);
    float _2042 = _1264 + (-0.5);
    float _2044 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2046 = -_1982;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1892);
    float _2050 = fma(_2040, _1818, _1818);
    float _2052 = _1930 * 0.15915493667125701904296875;
    float _2054 = fma(_2044, _2040, _2044);
    float _2056 = fma(_2048, _2048, _2032);
    float _2058 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2050);
    float _2060 = _2052 * 6.283185482025146484375;
    float _2062 = sin(_2060);
    float _2064 = _1994;
    if (_2038)
    {
        _1948 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2066 = _1948;
    float _2068 = fma(_2054, _1596, _2058);
    int _2070 = as_type<int>(_2066);
    if (_2038)
    {
        out.m_47.x = 0.0;
    }
    float _2072 = _333 * _897;
    float _2074 = _2052 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    if (_2038)
    {
        float _2078 = _2066 * 5.0;
        _2070 = as_type<int>(_2078);
    }
    int _2080 = _2070;
    float _2082 = _2068 * 0.15915493667125701904296875;
    if (_2038)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6604 = as_type<float>(_2080);
        out.gl_Position.z = _6604;
    }
    float _2084 = _2034 * 6.283185482025146484375;
    float _2086 = sin(_2084);
    float _2088 = sqrt(_2056);
    float _2090 = _2034 * 6.283185482025146484375;
    float _2092 = cos(_2090);
    if (_2038)
    {
        return out;
    }
    float _2094 = _2082 * 6.283185482025146484375;
    float _2096 = cos(_2094);
    float _2098 = _1942 * _2088;
    float _2100 = _2072 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2102 = _319 * _899;
    float _2104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _329);
    float _2108 = _2098 * _2100;
    float _2110 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2112 = _2082 * 6.283185482025146484375;
    float _2114 = sin(_2112);
    float _2116 = _2092 * _2076;
    float _2118 = _2104 * _2108;
    float _2120 = _2086 * _2062;
    float _2122 = _2098 * _2110;
    float _2124 = _2092 * _2062;
    float _2126 = _2086 * _2076;
    float _2128 = _2092 * _2096;
    float _2130 = _2076 * _2096;
    float _2132 = _2106 * _2122;
    float _2134 = _2086 * _2096;
    float _2136 = _2128 * _2118;
    float _2138 = _2062 * _2096;
    float _2140 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2142 = _2140 * 0.5;
    float _2144 = fma(_2114, _2116, _2120);
    float _2146 = -_2126;
    float _2148 = fma(_2114, _2124, _2146);
    float _2150 = -_2118;
    float _2152 = _2114 * _2150;
    float _2154 = _2134 * _2118;
    float _2156 = fma(_2144, _2132, _2136);
    float _2158 = -_2124;
    float _2160 = fma(_2114, _2126, _2158);
    float _2162 = fma(_2130, _2132, _2152);
    float _2164 = fma(_2114, _2120, _2116);
    float _2166 = fma(_2148, _2142, _2156);
    float _2168 = fma(_2160, _2132, _2154);
    float _2170 = fma(_2138, _2142, _2162);
    float _2172 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2174 = fma(_2164, _2142, _2168);
    float _2176 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2178 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2172);
    float _2180 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2176);
    float _2182 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2178);
    float _2184 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2180);
    float _2186 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2188 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2190 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2192 = _1406 + _2186;
    float _2194 = _1584 + _2188;
    float _2196 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2190);
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2200 = _2192 + _2198;
    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2204 = _2194 + _2202;
    float _2206 = _2200 * _2200;
    float _2208 = fma(_2204, _2204, _2206);
    float _2210 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2212 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2196);
    float _2214 = sqrt(_2208);
    float _2216 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2210);
    float _2218 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2222 = _1408 + _2220;
    bool _2224 = _2214 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2226 = _2196;
    float _2228 = _2194;
    float _2230 = _2192;
    float _2232 = _2098;
    if (!_2224)
    {
        _2226 = _2194;
    }
    float _2234 = _2226;
    float _2236 = _2234;
    if (!_2224)
    {
        _2228 = _2192;
    }
    float _2238 = _2228;
    float _2240 = _2238;
    if (!_2224)
    {
        _2230 = _2222;
    }
    float _2242 = _2230;
    bool _2244 = !_2224;
    float _2246 = _2242;
    if (!_2244)
    {
        float _2248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2252 = _2214 + _2250;
        float _2254 = rsqrt(_2208);
        float _2256 = _2252 * _2248;
        float _2258 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2260 = _2256 * 0.15915493667125701904296875;
        float _2262 = _2260 * 6.283185482025146484375;
        float _2264 = cos(_2262);
        float _2266 = _2260 * 6.283185482025146484375;
        float _2268 = sin(_2266);
        float _2270 = _2264 + (-1.0);
        float _2272 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = fma(_2268, _2258, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2276 = fma(_2222, _2264, _2272);
        float _2278 = _2254 * _2274;
        float _2280 = fma(_2204, _2278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2282 = fma(_2200, _2278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2246 = _2276;
        _2236 = _2280;
        _2240 = _2282;
    }
    float _2284 = _2246;
    float _2286 = _2236;
    float _2288 = _2240;
    float _2290 = -_1408;
    float _2292 = _2290 + _2284;
    float _2294 = -_1584;
    float _2296 = _2294 + _2286;
    float _2298 = -_1406;
    float _2300 = _2298 + _2288;
    float _2302 = _2212 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2304 = _2292 * _2292;
    float _2306 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2308 = 1.0 / _2302;
    float _2310 = fma(_2296, _2296, _2304);
    float _2312 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2306);
    bool _2314 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2316 = isnan(0.5);
    bool _2318 = _2314 || _2316;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2322 = _2318 || _2320;
    float _2324 = fma(_2300, _2300, _2310);
    float _2326 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2312);
    bool _2328 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2330 = isnan(0.5);
    bool _2332 = _2328 || _2330;
    bool _2334 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2336 = _2332 || _2334;
    float _2338 = sqrt(_2324);
    float _2340 = _2326 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2342 = _2340 + _2302;
    float _2344 = _2342 * _2308;
    float _2346 = _2344 * 0.5;
    bool _2348 = _2338 > 0.0;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2352 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2350);
    float _2354 = 1.0 / _2352;
    float _2356 = _2308;
    float _2358 = _2342;
    float _2360 = _2288;
    float _2362 = _2284;
    if (!_2348)
    {
        _2356 = _2286;
    }
    float _2364 = _2356;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2348)
    {
        _2358 = _2284;
    }
    float _2370 = _2358;
    bool _2372 = !_2348;
    float _2374 = _2370;
    if (!_2372)
    {
        float _2376 = _323 * _323;
        float _2378 = fma(_315, _315, _2376);
        float _2380 = fma(_325, _325, _2378);
        float _2382 = rsqrt(_2324);
        float _2384 = sqrt(_2380);
        float _2386 = _2296 * _2382;
        float _2388 = _2292 * _2382;
        float _2390 = _2300 * _2382;
        bool _2392 = _2384 > 0.0;
        float _2394 = _2384;
        if (!_2392)
        {
            _2366 = _2286;
        }
        float _2396 = _2366;
        _2368 = _2396;
        if (!_2392)
        {
            _2394 = _2284;
        }
        float _2398 = _2394;
        bool _2400 = !_2392;
        _2374 = _2398;
        if (!_2400)
        {
            float _2402 = rsqrt(_2380);
            float _2404 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2406 = _323 * _2402;
            float _2408 = _315 * _2402;
            float _2410 = _2388 * _2406;
            float _2412 = _325 * _2402;
            float _2414 = fma(_2386, _2408, _2410);
            float _2416 = _2404 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2418 = fma(_2390, _2412, _2414);
            float _2420 = _2418 * _2416;
            float _2422 = fma(_315, _2420, _2286);
            float _2424 = fma(_323, _2420, _2284);
            float _2426 = fma(_325, _2420, _2288);
            _2368 = _2422;
            _2374 = _2424;
            _2360 = _2426;
        }
    }
    float _2428 = _2368;
    float _2430 = _2374;
    float _2432 = _2360;
    float _2434 = -_1976;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2428);
    float _2438 = -_1974;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2430);
    float _2442 = -_1982;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2432);
    float _2446 = _2440;
    float _2448 = _2436;
    float _2450 = _2444;
    if (_2336)
    {
        _2362 = 1.0;
    }
    float _2452 = _2362;
    float _2454 = _2452;
    if (!_2322)
    {
        float _2456 = _1990 * _1990;
        float _2458 = 1.0 / _2098;
        float _2460 = -_1408;
        float _2462 = _2460 + _2430;
        float _2464 = -_1584;
        float _2466 = _2464 + _2428;
        float _2468 = fma(_1998, _1998, _2456);
        float _2470 = -_1406;
        float _2472 = _2470 + _2432;
        float _2474 = fma(_2010, _2010, _2468);
        float _2476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2478 = sqrt(_2474);
        float _2480 = _2462 * _2458;
        float _2482 = _2466 * _2458;
        float _2484 = _2472 * _2458;
        bool _2486 = _2478 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2488 = isnan(_2478);
        bool _2490 = _2486 || _2488;
        bool _2492 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2494 = _2490 || _2492;
        float _2496 = precise::min(_2478, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2498 = _2496 * _2476;
        float _2500 = fma(_2482, _2498, _1986);
        float _2502 = fma(_2480, _2498, _1980);
        float _2504 = _325;
        float _2506 = _2478;
        float _2508 = _2500;
        float _2510 = _2502;
        _1590 = _2484;
        _1592 = _2480;
        if (_2494)
        {
            float _2512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2504 = _2512;
        }
        float _2514 = _2504;
        if (_2494)
        {
            float _2516 = precise::max(_2478, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2506 = _2516;
        }
        float _2518 = _2506;
        float _2520 = fma(_2484, _2498, _1994);
        _337 = _2514;
        _2450 = _2520;
        if (_2494)
        {
            float _2522 = _2518 * _2514;
            _2232 = _2522;
        }
        float _2524 = _2232;
        if (_2494)
        {
            float _2526 = fma(_2482, _2524, _1986);
            _2508 = _2526;
        }
        float _2528 = _2508;
        _2448 = _2528;
        if (_2494)
        {
            float _2530 = fma(_2480, _2524, _1980);
            _2510 = _2530;
        }
        float _2532 = _2510;
        _2446 = _2532;
        if (_2494)
        {
            float _2534 = fma(_2484, _2524, _1994);
            _2450 = _2534;
        }
    }
    float _2536 = _337;
    float _2538 = _2446;
    float _2540 = _2448;
    float _2542 = _2450;
    float _2544 = _1590;
    float _2546 = _1592;
    float _2548 = _2546;
    float _2550 = _2536;
    float _2552 = _2544;
    if (_2336)
    {
        _2548 = 1.0;
    }
    float _2554 = _2548;
    float _2556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2558 = _2354 * _2556;
    float _2560 = _2554;
    if (!_2336)
    {
        float _2562 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2564 = _2562 * 0.15915493667125701904296875;
        float _2566 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2568 = _2564 * 6.283185482025146484375;
        float _2570 = cos(_2568);
        float _2572 = _2566 * 0.15915493667125701904296875;
        float _2574 = _2564 * 6.283185482025146484375;
        float _2576 = sin(_2574);
        float _2578 = 1.0 / _2570;
        float _2580 = _2572 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        float _2584 = _2576 * _2578;
        float _2586 = _2572 * 6.283185482025146484375;
        float _2588 = sin(_2586);
        float _2590 = _2582 * _2584;
        float _2592 = 1.0 / _2590;
        float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2596 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2594;
        float _2598 = 1.0 / _2596;
        float _2600 = _2588 * _2592;
        float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2604 = fma(_2558, _2600, _2602);
        float _2606 = _2604 * _2598;
        float _2608 = precise::clamp(_2606, 0.0, 1.0);
        _2550 = _2564;
        _2064 = _2592;
        _2454 = _2608;
    }
    float _2610 = _2550;
    float _2612 = _2064;
    float _2614 = _2454;
    float _2616 = _2612;
    float _2618 = _2610;
    if (!_2336)
    {
        float _2620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2622 = _2620 * 0.15915493667125701904296875;
        float _2624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2626 = _2622 * 6.283185482025146484375;
        float _2628 = cos(_2626);
        float _2630 = _2624 * 0.15915493667125701904296875;
        float _2632 = _2622 * 6.283185482025146484375;
        float _2634 = sin(_2632);
        float _2636 = 1.0 / _2628;
        float _2638 = _2630 * 6.283185482025146484375;
        float _2640 = cos(_2638);
        float _2642 = _2634 * _2636;
        float _2644 = _2630 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = _2640 * _2642;
        float _2650 = 1.0 / _2648;
        float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2654 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2652;
        float _2656 = 1.0 / _2654;
        float _2658 = _2646 * _2650;
        float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2662 = fma(_2558, _2658, _2660);
        float _2664 = _2662 * _2656;
        float _2666 = precise::clamp(_2664, 0.0, 1.0);
        float _2668 = -_2666;
        float _2670 = _2668 + 1.0;
        _2616 = _2648;
        _2618 = _2658;
        _2560 = _2670;
    }
    float _2672 = _2616;
    float _2674 = _2618;
    float _2676 = _2560;
    float _2678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2680 = _2538 + _2678;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2684 = _2540 + _2682;
    float _2686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2688 = _2542 + _2686;
    float _2690 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2692 = _2680 * _2680;
    float _2694 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2696 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2690);
    float _2698 = fma(_2684, _2684, _2692);
    float _2700 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2696);
    float _2702 = fma(_2688, _2688, _2698);
    float _2704 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2706 = rsqrt(_2702);
    float _2708 = sqrt(_2702);
    float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2712 = _2684 * _2710;
    float _2714 = _2688 * _2710;
    float _2716 = _2712 * _2712;
    float _2718 = _2714 * _2714;
    float _2720 = _2716 + _2718;
    float _2722 = sqrt(_2720);
    bool _2724 = _2722 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2728 = _2722 + _2726;
    float _2730 = _2706;
    float _2732 = _2720;
    float _2734 = _2728;
    float _2736 = _2672;
    float _2738 = _2680;
    float _2740 = _2674;
    if (_2724)
    {
        float _2742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2730 = _2742;
    }
    float _2744 = _2730;
    if (_2724)
    {
        float _2746 = rsqrt(_2720);
        _2732 = _2746;
    }
    float _2748 = _2732;
    float _2750 = _2748;
    if (_2724)
    {
        float _2752 = _2728 * _2744;
        _2734 = _2752;
    }
    float _2754 = _2734;
    if (_2724)
    {
        float _2756 = _2754 * 0.15915493667125701904296875;
        _2736 = _2756;
    }
    float _2758 = _2736;
    float _2760 = _2688;
    if (_2724)
    {
        float _2762 = _2758 * 6.283185482025146484375;
        float _2764 = sin(_2762);
        _2760 = _2764;
    }
    float _2766 = _2760;
    float _2768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2770 = precise::max(0.0, _2768);
    float _2772 = _2744;
    float _2774 = _2770;
    if (_2724)
    {
        float _2776 = _2758 * 6.283185482025146484375;
        float _2778 = cos(_2776);
        _2772 = _2778;
    }
    float _2780 = _2772;
    float _2782 = -_2710;
    float _2784 = -_2770;
    float _2786 = fma(_2680, _2782, _2784);
    if (_2724)
    {
        float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2738 = _2788;
    }
    float _2790 = _2738;
    float _2792 = _2790;
    float _2794 = _2766;
    if (_2724)
    {
        float _2796 = fma(_2766, _2790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2792 = _2796;
    }
    float _2798 = _2792;
    float _2800 = _2798;
    if (!_2724)
    {
        _2794 = _2712;
    }
    float _2802 = _2794;
    float _2804 = _2802;
    float _2806 = _2780;
    if (_2724)
    {
        float _2808 = _2780 + (-1.0);
        _2774 = _2808;
    }
    float _2810 = _2774;
    float _2812 = _2810;
    if (_2724)
    {
        float _2814 = _2748 * _2798;
        _2552 = _2814;
    }
    float _2816 = _2552;
    if (!_2724)
    {
        _2800 = _2786;
    }
    float _2818 = _2800;
    float _2820 = _2818;
    if (_2724)
    {
        float _2822 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2740 = _2822;
    }
    float _2824 = _2740;
    if (_2724)
    {
        float _2826 = _2712 * _2816;
        _2804 = _2826;
    }
    float _2828 = _2804;
    if (!_2724)
    {
        _2812 = _2714;
    }
    float _2830 = _2812;
    float _2832 = _2830;
    if (_2724)
    {
        float _2834 = _2714 * _2816;
        _2832 = _2834;
    }
    float _2836 = _2832;
    if (!_2724)
    {
        _2750 = _2716;
    }
    float _2838 = _2750;
    float _2840 = _2838;
    if (_2724)
    {
        float _2842 = fma(_2786, _2780, _2824);
        _2820 = _2842;
    }
    float _2844 = _2820;
    if (_2724)
    {
        float _2846 = _2828 * _2828;
        _2840 = _2846;
    }
    float _2848 = _2840;
    if (!_2724)
    {
        _2806 = _2718;
    }
    float _2850 = _2806;
    float _2852 = _2850;
    if (_2724)
    {
        float _2854 = _2836 * _2836;
        _2852 = _2854;
    }
    float _2856 = _2852;
    float _2858 = fma(_2844, _2844, _2848);
    float _2860 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2862 = _2858 + _2856;
    float _2864 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2860);
    float _2866 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2870 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2868);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = rsqrt(_2862);
    float _2876 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2864);
    float _2878 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2880 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2866);
    float _2882 = -_2872;
    float _2884 = _2882 + 1.0;
    float _2886 = _2876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2888 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2878);
    float _2890 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2880);
    float _2892 = abs(_2884);
    float _2894 = log2(_2892);
    float _2896 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2898 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2888);
    float _2900 = _2890 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2902 = -_2896;
    float _2904 = fma(_2902, _2694, 1.0);
    float _2906 = _2898 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2908 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2910 = _2874 * _2828;
    float _2912 = _2874 * _2844;
    float _2914 = _2874 * _2836;
    float _2916 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2908);
    float _2918 = _2910 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2920 = log2(_2904);
    float _2922 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2916);
    float _2924 = -_2918;
    float _2926 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2924);
    float _2928 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2930 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2922);
    float _2932 = -_2914;
    float _2934 = fma(_2932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2926);
    float _2936 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2938 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2940 = 1.0 / _2930;
    float _2942 = fma(_2934, -0.5, 0.5);
    float _2944 = fma(_2934, 0.5, 0.5);
    float _2946 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2936);
    float _2948 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2938);
    float _2950 = _2912 + 1.0;
    float _2952 = fma(_2944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2954 = _2920 * 0.693147182464599609375;
    float _2956 = exp2(_2928);
    float _2958 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2948);
    float _2960 = fma(_2944, _2952, -0.212114393711090087890625);
    float _2962 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2964 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2958);
    float _2966 = fma(_2944, _2960, 1.570728778839111328125);
    float _2968 = sqrt(_2942);
    float _2970 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2946);
    float _2972 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2970);
    float _2974 = -_2912;
    float _2976 = fma(_2956, _2950, _2974);
    float _2978 = _2972 * _2940;
    float _2980 = _2964 * _2940;
    float _2982 = fma(_2976, 0.5, 0.5);
    float _2984 = fma(_2978, 0.5, 0.5);
    float _2986 = fma(_2980, -0.5, 0.5);
    float _2988 = _2968 * 0.636619746685028076171875;
    float _2990 = -_2966;
    float _2992 = fma(_2988, _2990, 1.0);
    float3 _8030 = float3(_2984, _2986, _2962);
    float _2994 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8030, float3(0.0), isnan(_8030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8030, float3(0.0), isnan(_8030)), level(0.0)).x;
    float3 _8041 = float3(_2984, _2986, _2962);
    float4 _2997 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8041, float3(0.0), isnan(_8041)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8041, float3(0.0), isnan(_8041)), level(0.0)).xyzw;
    float _2999 = _2997.x;
    float _3001 = _2997.y;
    float _3003 = _2997.z;
    float _3005 = _2997.w;
    float2 _8058 = float2(_2992, _2982);
    float3 _3009 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8058, float2(0.0), isnan(_8058)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8058, float2(0.0), isnan(_8058)), level(0.0)).xyz;
    float _3011 = _3009.x;
    float _3013 = _3009.y;
    float _3015 = _3009.z;
    float _3017 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3019 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3021 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3023 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3025 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3017);
    float _3027 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3029 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3031 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3019);
    float _3033 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3021);
    float _3035 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3025);
    float _3037 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3039 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3041 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3043 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3045 = -_2114;
    float _3047 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3023);
    float _3049 = -_2114;
    float _3051 = fma(_3049, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3027);
    float _3053 = exp2(_3037);
    float _3055 = -_2114;
    float _3057 = fma(_3055, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3029);
    float _3059 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3061 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3031);
    float _3063 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3033);
    float _3065 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3039);
    float _3067 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3041);
    float _3069 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3043);
    float _3071 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3059);
    float _3073 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3047);
    float _3075 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3051);
    float _3077 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3079 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3057);
    float _3081 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3069);
    float _3083 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    float _3085 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3067);
    float _3087 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3071);
    float _3089 = _3077 * _3073;
    float _3091 = _3077 * _3075;
    float _3093 = _329 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3095 = _3077 * _3079;
    float _3097 = -_3053;
    float _3099 = _3097 + 1.0;
    float _3101 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3081);
    float _3103 = fma(_3093, _3035, _3089);
    float _3105 = fma(_3093, _3063, _3095);
    float _3107 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3109 = _2930 * 0.5;
    float _3111 = _3101 + _2930;
    float _3113 = _2972 + _2930;
    float _3115 = fma(_3093, _3061, _3091);
    float _3117 = fma(_2964, -0.5, _3109);
    float _3119 = _3111 * 0.5;
    float _3121 = _3113 * 0.5;
    float _3123 = _3083 + _3103;
    float _3125 = _3085 + _3115;
    float _3127 = _3087 + _3105;
    bool _3129 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3131 = isnan(_2708);
    bool _3133 = _3129 || _3131;
    bool _3135 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3137 = _3133 || _3135;
    out.m_70.x = _3121;
    out.m_70.y = _3117;
    out.m_70.z = _3119;
    out.m_70.w = _2930;
    out.m_72.x = _3123;
    out.m_72.y = _3125;
    out.m_72.z = _3127;
    out.gl_Position.x = _2972;
    out.gl_Position.y = _2964;
    out.gl_Position.z = _3101;
    out.gl_Position.w = _2930;
    float _3139 = _3115;
    float _3141 = _3093;
    if (!_3137)
    {
        _3139 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3143 = _3139;
    float _3145 = _3143;
    float _3147 = _3143;
    if (!_3137)
    {
        _3141 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3149 = _3141;
    float _3151 = _3107 * _2994;
    float _3153 = -_3107;
    float _3155 = _3153 + 1.0;
    float _3157 = _3005 * _3151;
    float _3159 = _3015 * _3151;
    float _3161 = _3005 * _3155;
    float _3163 = fma(_3011, _3157, _2999);
    float _3165 = fma(_3013, _3157, _3001);
    float _3167 = fma(_3005, _3159, _3003);
    float _3169 = _2614 * _2676;
    float _3171 = _3003;
    float _3173 = _3005;
    float _3175 = _3001;
    float _3177 = _3169;
    float _3179 = _3149;
    float _3181 = _3149;
    if (!_3137)
    {
        _3171 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3183 = _3171;
    float _3185 = _3183;
    float _3187 = _3183;
    if (!_3137)
    {
        _3173 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3189 = _3173;
    out.m_74.x = _3163;
    out.m_74.y = _3165;
    out.m_74.z = _3167;
    out.m_74.w = _3161;
    float _3191 = _3169 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3193 = _3189;
    float _3195 = _3189;
    if (!_3137)
    {
        _3175 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3197 = _3175;
    float _3199 = _3197;
    float _3201 = _3197;
    if (!_3137)
    {
        _3177 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3203 = _3177;
    bool _3205 = !_3137;
    float _3207 = _3203;
    float _3209 = _3203;
    if (!_3205)
    {
        bool _3211 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3213 = isnan(_2708);
        bool _3215 = _3211 || _3213;
        bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3219 = _3215 || _3217;
        if (!_3219)
        {
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3223 = _2708 + _3221;
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3227 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3225;
            float _3229 = 1.0 / _3227;
            float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3247 = _3223 * _3229;
            float _3249 = precise::clamp(_3247, 0.0, 1.0);
            float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3259 = fma(_3249, _3233, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3261 = fma(_3249, _3253, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3263 = fma(_3249, _3257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3265 = fma(_3249, _3237, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3267 = fma(_3249, _3241, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3269 = fma(_3249, _3245, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3187 = _3263;
            _3201 = _3267;
            _3147 = _3261;
            _3181 = _3265;
            _3195 = _3259;
            _3209 = _3269;
            _3271 = true;
        }
        else
        {
            bool _3273 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3275 = isnan(_2708);
            bool _3277 = _3273 || _3275;
            bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3281 = _3277 || _3279;
            if (!_3281)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3283 = _3145;
            _3147 = _3283;
            if (!_3281)
            {
                _3185 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3285 = _3185;
            _3187 = _3285;
            if (!_3281)
            {
                _3193 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3287 = _3193;
            _3195 = _3287;
            if (!_3281)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3289 = _3179;
            _3181 = _3289;
            if (!_3281)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3291 = _3199;
            _3201 = _3291;
            if (!_3281)
            {
                _3207 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3293 = _3207;
            bool _3295 = !_3281;
            _3209 = _3293;
            if (!_3295)
            {
                bool _3297 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3299 = isnan(_2708);
                bool _3301 = _3297 || _3299;
                bool _3303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3305 = _3301 || _3303;
                if (!_3305)
                {
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3309 = _2708 + _3307;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3311;
                    float _3315 = 1.0 / _3313;
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3333 = _3309 * _3315;
                    float _3335 = precise::clamp(_3333, 0.0, 1.0);
                    float _3337 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3339 = _3337 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3343 = _3341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3345 = fma(_3335, _3319, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3347 = fma(_3335, _3339, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3349 = fma(_3335, _3343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3351 = fma(_3335, _3323, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3353 = fma(_3335, _3327, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3355 = fma(_3335, _3331, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3187 = _3349;
                    _3201 = _3353;
                    _3147 = _3347;
                    _3181 = _3351;
                    _3195 = _3345;
                    _3209 = _3355;
                    _3271 = true;
                }
                else
                {
                    _3187 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3195 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3209 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3271 = false;
    float _3357 = _3187;
    float _3359 = _3201;
    float _3361 = _3147;
    float _3363 = _3181;
    float _3365 = _3195;
    float _3367 = _3209;
    float _3369 = fma(_3125, -0.5, 0.5);
    float _3371 = precise::clamp(_3369, 0.0, 1.0);
    float _3373 = -_3357;
    float _3375 = _3373 + _3359;
    float _3377 = _3191 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3379 = -_3361;
    float _3381 = _3379 + _3363;
    float _3383 = fma(_3371, _3375, _3357);
    out.m_76.x = 0.0;
    float _3385 = -_3365;
    float _3387 = _3385 + _3367;
    float _3389 = fma(_3371, _3381, _3361);
    float _3391 = _3383 * 0.586610972881317138671875;
    out.m_47.x = _3377;
    bool _3393 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3395 = fma(_3371, _3387, _3365);
    float _3397 = fma(_3389, 0.298911988735198974609375, _3391);
    bool _3399 = _2614 > 0.0;
    bool _3401 = isnan(_2614);
    bool _3403 = _3399 || _3401;
    bool _3405 = isnan(0.0);
    bool _3407 = _3403 || _3405;
    float _3409 = fma(_3395, 0.114477999508380889892578125, _3397);
    bool _3411 = _2676 <= 0.0;
    bool _3413 = !_3407;
    bool _3415 = _3411 || _3413;
    float _3417 = -_3409;
    float _3419 = _3389 + _3417;
    float _3421 = -_3409;
    float _3423 = _3383 + _3421;
    float _3425 = -_3409;
    float _3427 = _3395 + _3425;
    float _3429 = fma(_3419, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3431 = fma(_3423, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3433 = fma(_3427, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    bool _3435 = !_3393;
    if (!_3435)
    {
        float _3437 = -_2538;
        float _3439 = _3437 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3441 = -_2540;
        float _3443 = _3441 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3445 = -_2542;
        float _3447 = _3445 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3449 = _3439 * _3439;
        float _3451 = fma(_3443, _3443, _3449);
        float _3453 = fma(_3447, _3447, _3451);
        float _3455 = sqrt(_3453);
        float _3457 = rsqrt(_3453);
        float _3459 = -_3455;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3463 = _3461 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3465 = precise::clamp(_3463, 0.0, 1.0);
        float _3467 = _3443 * _3457;
        float _3469 = _3439 * _3457;
        float _3471 = abs(_3465);
        float _3473 = log2(_3471);
        float _3475 = _3447 * _3457;
        float _3477 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3479 = _3125 * _3469;
        float _3481 = -_3469;
        float _3483 = -_3477;
        float _3485 = fma(_3481, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3483);
        float _3487 = fma(_3123, _3467, _3479);
        float _3489 = -_3475;
        float _3491 = fma(_3489, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3485);
        float _3493 = fma(_3127, _3475, _3487);
        float _3495 = precise::clamp(_3493, 0.0, 1.0);
        float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3499 = _3491 + _3497;
        float _3501 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3503 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3505 = precise::clamp(_3503, 0.0, 1.0);
        float _3507 = exp2(_3501);
        float _3509 = _3507 * _3505;
        float _3511 = _3495 * _3509;
        float _3513 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3515 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3517 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_76.x = _3513;
        out.m_76.y = _3515;
        out.m_76.z = _3517;
    }
    out.m_78.x = _3429;
    out.m_78.y = _3431;
    out.m_78.z = _3433;
    if (!_3415)
    {
        return out;
    }
    float _3519 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_47.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3519;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3271 = false;
    bool _923 = false;
    bool _731 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _3576 = as_type<float>(_113);
        out.gl_Position.z = _3576;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _3645 = as_type<float>(_151);
        out.gl_Position.z = _3645;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_51.x;
    float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_56.x;
    float _163 = in.m_56.y;
    float _165 = in.m_56.z;
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _169 = _157 * _155;
    float _171 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _175 = _171 * _167;
    float _177 = floor(_173);
    int _179 = as_type<int>(_159) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_159) & 2;
    bool _185 = _183 != 0;
    float _187 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].y, _175);
    int _189 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _191 = _189 != 0;
    float _193 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = _173 * 6.283185482025146484375;
    float _201 = _187 * 6.283185482025146484375;
    float _203 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _209 = _199 * 0.15915493667125701904296875;
    float _211 = _201 * 0.15915493667125701904296875;
    float _213 = floor(_187);
    bool _215 = !_191;
    int _217 = _215 ? 0 : 1;
    float _219 = -_177;
    float _221 = _173 + _219;
    bool _223 = !_185;
    float _225 = _223 ? (-0.5) : 0.5;
    int _227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _229 = _227 != 0;
    int _231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _233 = _231 != 0;
    int _235 = abs(_217);
    float _237 = _209 * 6.283185482025146484375;
    float _239 = cos(_237);
    bool _241 = !_229;
    int _243 = _241 ? 0 : 1;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _247 = abs(_243);
    float _249 = _211 * 6.283185482025146484375;
    float _251 = cos(_249);
    bool _253 = _221 < 0.5;
    float _255 = float(_253);
    float _257 = -_213;
    float _259 = _187 + _257;
    bool _261 = !_233;
    int _263 = _261 ? 0 : 1;
    float _265 = -_221;
    float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _269 = -_255;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = float(_235);
    float _275 = fma(_239, 0.5, 0.5);
    float _277 = float(_247);
    float _279 = -_259;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _283 = _259 < 0.5;
    float _285 = float(_283);
    float _287 = -_275;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _291 = abs(_263);
    float _293 = abs(_267);
    float _295 = _277 * _293;
    float _297 = abs(_281);
    float _299 = _277 * _297;
    float _301 = fma(_251, 0.5, 0.5);
    float _303 = float(_291);
    float _305 = fma(_273, _289, _295);
    float _307 = -_285;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _311 = -_301;
    float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _315 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _317 = abs(_271);
    float _319 = fma(_303, _317, _305);
    float _321 = fma(_273, _313, _299);
    float _323 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _325 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _327 = !_181;
    float _329 = _327 ? (-0.5) : 0.5;
    float _331 = abs(_309);
    float _333 = fma(_303, _331, _321);
    bool _335 = !_245;
    float _337 = _325;
    float _353;
    if (!_335)
    {
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_97);
        float _359 = 1.0 / _357;
        float _361 = _131 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = 1.0 / _371;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _395 = 1.0 / _379;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _363 + _397;
    bool _401 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _403 = 1.0 / _375;
    float _405 = _399 * _385;
    bool _407 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _409 = isnan(_363);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _421 = _363 + _419;
    bool _423 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _425 = isnan(_363);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = 1.0 / _383;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _363 + _441;
    float _445 = _443 * _395;
    float _447 = -_417;
    float _449 = _447 + 1.0;
    float _451 = 1.0 / _439;
    float _453 = _367 * _403;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _457 = _363 + _455;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _461 = _363 + _459;
    float _463 = 1.0 / _389;
    float _465 = _433 * _449;
    float _467 = _457 * _435;
    float _469 = -_433;
    float _471 = _469 + 1.0;
    bool _473 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _475 = isnan(_363);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _485;
    float _489 = 1.0 / _393;
    bool _491 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _493 = isnan(_363);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = _461 * _451;
    bool _505 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _507 = isnan(_363);
    bool _509 = _505 || _507;
    bool _511 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _513 = _509 || _511;
    float _515 = float(_513);
    float _517 = -_483;
    float _519 = _517 + 1.0;
    float _521 = fma(_487, _405, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _523 = _501 * _471;
    float _525 = -_501;
    float _527 = _525 + 1.0;
    float _529 = _421 * _463;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _533 = _363 + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _535;
    float _539 = _483 * _527;
    float _541 = -_515;
    float _543 = _541 + 1.0;
    float _545 = _515 * _519;
    float _547 = fma(_537, _405, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _549 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _551 = isnan(_363);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = _533 * _489;
    bool _563 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _565 = isnan(_363);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    bool _575 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _577 = isnan(_363);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -_559;
    float _589 = _587 + 1.0;
    float _591 = _573 * _543;
    float _593 = -_573;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _601 = _585 * _589;
    float _603 = _559 * _595;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _609;
    float _613 = fma(_599, _453, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _615;
    float _619 = fma(_607, _453, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _621 = fma(_611, _445, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _623 = _521 * _601;
    float _625 = -_585;
    float _627 = _625 + 1.0;
    float _629 = _547 * _601;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = fma(_617, _445, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _641 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[143].x, _623);
    float _643 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[143].y, _629);
    float _645 = fma(_633, _467, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _647 = fma(_613, _603, _641);
    float _649 = fma(_639, _467, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _651 = fma(_619, _603, _643);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _657;
    float _661 = fma(_621, _591, _647);
    float _663 = fma(_635, _591, _651);
    float _665 = fma(_655, _529, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _667 = fma(_659, _529, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _675 = _673 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _677 = fma(_645, _545, _661);
    float _679 = fma(_649, _545, _663);
    float _681 = fma(_671, _561, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _683 = fma(_675, _561, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _685;
    float _689 = fma(_665, _539, _677);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _691;
    float _695 = fma(_667, _539, _679);
    float _697 = fma(_687, _503, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _699 = fma(_681, _523, _689);
    float _701 = fma(_693, _503, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _703 = fma(_683, _523, _695);
    float _705 = fma(_697, _465, _699);
    float _707 = fma(_701, _465, _703);
    float _709 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[150].x, _705);
    float _711 = fma(_417, (*spvDescriptorSet0.vp_c9)._m0[150].y, _707);
    bool _713 = !_401;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _717 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_97);
        float _735 = 1.0 / _733;
        float _737 = _131 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = _739 + _741;
    bool _745 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _747 = isnan(_739);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _759 = _739 + _757;
    bool _761 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _763 = isnan(_739);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _773;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _781 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _783 = isnan(_739);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _789 = _785 || _787;
    float _791 = float(_789);
    float _793 = 1.0 / _779;
    float _795 = -_791;
    float _797 = _795 + 1.0;
    bool _799 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _801 = 1.0 / _775;
    float _803 = _771 * _797;
    float _805 = -_771;
    float _807 = _805 + 1.0;
    float _809 = _759 * _793;
    float _811 = _743 * _801;
    float _813 = -_755;
    float _815 = _813 + 1.0;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _817;
    float _821 = _791 * _815;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _827;
    float _831 = fma(_819, _811, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _833 = fma(_825, _811, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _835 = fma(_829, _811, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _837 = _831 * _803;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _843 = _833 * _803;
    float _845 = _835 * _803;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _855 = fma(_841, _809, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _857 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].x, _843);
    float _859 = fma(_849, _809, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _861 = fma(_853, _809, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _863 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].y, _837);
    float _865 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].z, _845);
    float _867 = fma(_859, _821, _857);
    float _869 = fma(_855, _821, _863);
    float _871 = fma(_861, _821, _865);
    float _873 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].x, _867);
    float _875 = in.m_58.x;
    float _877 = in.m_58.y;
    float _879 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].y, _869);
    float _881 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].z, _871);
    float _883 = _873 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _887 = _879 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _889 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _891;
    out.m_60.y = _893;
    out.m_60.z = _895;
    out.m_60.w = _885;
    float _897 = _711 * _877;
    float _899 = _709 * _875;
    bool _901 = !_799;
    float _919;
    float _921;
    if (!_901)
    {
        float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _905 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _907 = float(_97);
        float _909 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _911 = _909 * _903;
        float _913 = floor(_911);
        float _915 = -_913;
        float _917 = _911 + _915;
        _919 = _917;
        _921 = _907;
        _923 = true;
    }
    else
    {
        float _925 = float(_97);
        float _927 = 1.0 / _925;
        float _929 = _131 * _927;
        _919 = _929;
        _921 = _925;
    }
    _923 = false;
    float _931 = _919;
    float _933 = _921;
    float _935 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _937 = int(_935);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _941 = _931 + _939;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _945 = _931 + _943;
    float _947 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _949 = int(_947);
    float _951 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _957 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _955;
    float _959 = float(_937);
    float _961 = 1.0 / _933;
    float _963 = float(uint(_949));
    float _965 = 1.0 / _959;
    int _967 = ~_949;
    int _969 = _967 + 1;
    int _971 = ~_949;
    int _973 = _971 + 1;
    int _975 = ~_949;
    int _977 = _975 + 1;
    float _979 = 1.0 / _963;
    float _981 = _965 * _131;
    float _983 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _985 = log2(_983);
    int _987 = as_type<int>(_979) + (-2);
    float _989 = trunc(_981);
    int _991 = int(_989);
    float _993 = _985 * _131;
    float _995 = exp2(_993);
    float _997 = float(uint(_991));
    float _999 = as_type<float>(_987) * _997;
    float _1001 = trunc(_999);
    float _1003 = precise::max(_1001, 0.0);
    uint _1006 = uint(_1003);
    float _1008 = -_995;
    float _1010 = _1008 + 1.0;
    float _1012 = float(_949);
    int _1014 = _969 * int(_1006);
    int _1016 = _1014 + _991;
    float _1018 = float(uint(_1016));
    float _1020 = as_type<float>(_987) * _1018;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1024 = _1022 != 0;
    bool _1026 = !_1024;
    float _1028 = _1026 ? 7.345489978790283203125 : 1.0;
    float _1030 = trunc(_1020);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = _1028 * _153;
    float _1038 = floor(_1036);
    int _1040 = int(_1006) + int(_1034);
    float _1042 = float(_991);
    int _1044 = _973 * _1040;
    int _1046 = _1044 + _991;
    bool _1048 = _1042 >= _1012;
    bool _1050 = isnan(_1042);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(_1012);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -_1038;
    float _1062 = _1036 + _1060;
    bool _1064 = uint(_1046) >= uint(_949);
    float _1066 = trunc(_1058);
    int _1068 = int(_1066);
    bool _1070 = !_1064;
    int _1072 = _1070 ? 0 : (-1);
    bool _1074 = _949 == 0;
    int _1076 = ~_1040;
    int _1078 = _1076 + _1072;
    int _1080 = _1078 + 1;
    int _1082 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1084 = _1082 != 0;
    int _1086 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1088 = _1086 != 0;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1092 = _1090 != 0;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1096 = _1094 != 0;
    int _1098 = _949 * _1080;
    int _1100 = _1098 + _991;
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1104 = _1102 != 0;
    bool _1106 = !_1084;
    int _1108 = _1106 ? 0 : 1;
    bool _1110 = !_1074;
    int _1112 = _1110 ? _1100 : (-1);
    float _1114 = _1062 * _1012;
    float _1116 = _1012 * _131;
    int _1118 = ~_1068;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    float _1124 = trunc(_1114);
    int _1126 = int(_1124);
    float _1128 = _1116 * _961;
    bool _1130 = !_1088;
    int _1132 = _1130 ? 0 : 1;
    int _1134 = _1112 * _1122;
    int _1136 = _949 + (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1140 = _1138 != 0;
    float _1142 = trunc(_1128);
    int _1144 = int(_1142);
    int _1146 = _1068 * _1136;
    int _1148 = _1146 + _1134;
    int _1150 = abs(_1132);
    bool _1152 = !_1096;
    int _1154 = _1152 ? 0 : 1;
    bool _1156 = !_1092;
    int _1158 = _1156 ? 0 : 1;
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1162 = _1160 != 0;
    int _1164 = abs(_1154);
    int _1166 = abs(_1108);
    int _1168 = abs(_1158);
    int _1170 = _1148 * _1150;
    bool _1172 = !_1162;
    int _1174 = _1172 ? 0 : 1;
    int _1176 = _1126 * _1164;
    int _1178 = _1176 + _991;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1182 = _1180 != 0;
    int _1184 = _1144 * _1166;
    int _1186 = _1184 + _1170;
    int _1188 = abs(_1174);
    float _1190 = in.m_51.y;
    float _1192 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1194 = _1178 * _1168;
    int _1196 = _1194 + _1186;
    int _1198 = ~_949;
    int _1200 = _1198 + 1;
    float _1202 = -_951;
    float _1204 = fma(_1192, 2.0, _1202);
    int _1206 = _1126 * _1188;
    int _1208 = _1206 + _1196;
    float _1210 = _153 * 2.0;
    float _1212 = -_131;
    float _1214 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1204);
    bool _1216 = _153 > 0.5;
    float _1218 = floor(_1210);
    float _1220 = float(uint(_1208));
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1228 = _1226 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1230 = as_type<float>(_987) * _1220;
    float _1232 = 1.0 / _1224;
    float _1234 = in.m_44.x;
    float _1236 = in.m_44.y;
    float _1238 = in.m_44.z;
    float _1240 = _1190 * 2.0;
    float _1242 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1244 = trunc(_1230);
    float _1246 = precise::max(_1244, 0.0);
    uint _1248 = uint(_1246);
    bool _1250 = _1218 > 0.0;
    float _1252 = fma(_1242, -2.0, _953);
    bool _1254 = _1218 >= 0.0;
    bool _1256 = isnan(_1218);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan(0.0);
    bool _1262 = _1258 || _1260;
    float _1264 = in.m_51.z;
    float _1266 = floor(_1240);
    float _1268 = _941 * _1232;
    int _1270 = ~_949;
    int _1272 = _1270 + 1;
    int _1274 = _1200 * int(_1248);
    int _1276 = _1274 + _1208;
    float _1278 = -_329;
    int _1280 = _1216 ? as_type<int>(_1278) : as_type<int>(_329);
    float _1282 = 1.0 / _1228;
    bool _1284 = _1190 > 0.5;
    float _1286 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1288 = float(uint(_1276));
    float _1290 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1292 = _1262 ? 0 : 1;
    bool _1294 = !_1140;
    float _1296 = _1294 ? _329 : as_type<float>(_1280);
    float _1298 = as_type<float>(_987) * _1288;
    int _1300 = ~_1292;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = -_225;
    int _1308 = _1284 ? as_type<int>(_1306) : as_type<int>(_225);
    float _1310 = trunc(_1298);
    float _1312 = precise::max(_1310, 0.0);
    uint _1314 = uint(_1312);
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1322 = _1320 != 0;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1326 = _1324 != 0;
    float _1328 = _1190 + _1264;
    int _1330 = _1304;
    if (!_1250)
    {
        int _1332 = ~_1292;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = _1236 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1340 = _1266 >= 0.0;
    bool _1342 = isnan(_1266);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan(0.0);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1286);
    float _1352 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1290);
    float _1354 = fma(_1234, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1338);
    int _1356 = _1348 ? 0 : 1;
    float _1358 = _153 + _1190;
    bool _1360 = _1266 > 0.0;
    float _1362 = _1264 * 2.0;
    float _1364 = _1358 + (-1.0);
    float _1366 = _1328 + (-1.0);
    int _1368 = int(_1248) + int(_1314);
    float _1370 = _945 * _1282;
    float _1372 = floor(_1362);
    float _1374 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1352);
    int _1376 = _1272 * _1368;
    int _1378 = _1376 + _1208;
    bool _1380 = !_1104;
    float _1382 = _1380 ? _225 : as_type<float>(_1308);
    int _1384 = ~_1356;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    float _1390 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1392 = uint(_1378) >= uint(_949);
    float _1394 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1396 = _1388;
    if (!_1360)
    {
        int _1398 = ~_1356;
        int _1400 = _1398 + 1;
        _1396 = _1400;
    }
    int _1402 = _1396;
    float _1404 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1350);
    float _1406 = _1374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1408 = _1404 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1410 = !_1392;
    int _1412 = _1410 ? 0 : (-1);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1416 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1414;
    bool _1418 = _1372 > 0.0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1420;
    bool _1424 = _1372 >= 0.0;
    bool _1426 = isnan(_1372);
    bool _1428 = _1424 || _1426;
    bool _1430 = isnan(0.0);
    bool _1432 = _1428 || _1430;
    float _1434 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1354);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1440 = _1296 + 0.5;
    int _1442 = ~_1368;
    int _1444 = _1442 + _1412;
    int _1446 = _1444 + 1;
    float _1448 = fma(_1422, _1268, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1450 = fma(_1438, _1370, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1452 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1214);
    bool _1454 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1456 = isnan(_931);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1462 = _1458 || _1460;
    float _1464 = float(_1462);
    float _1466 = fma(_1416, _1268, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1468 = fma(_957, _1268, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1470 = _1432 ? 0 : 1;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1476 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1478 = isnan(0.0);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1484 = _1480 || _1482;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1488 = _1486 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1490 = _949 * _1446;
    int _1492 = _1490 + _1208;
    bool _1494 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1496 = isnan(_931);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = -_1464;
    float _1508 = _1506 + 1.0;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1512 = 1.0 + _1510;
    float _1514 = _1484 ? _1010 : 0.0;
    float _1516 = fma(_1474, _1370, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1518 = float(uint(_1178));
    float _1520 = _1504 * _1508;
    float _1522 = -_1504;
    float _1524 = _1522 + 1.0;
    float _1526 = fma(_1488, _1370, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1528 = 1.0 / _1512;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1532 = _931 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1534 = isnan(_931);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = as_type<float>(_987) * _1518;
    float _1546 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    bool _1548 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1550 = isnan(1.0);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1556 = _1552 || _1554;
    float _1558 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1252);
    float _1560 = trunc(_1544);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1568 = !_1074;
    int _1570 = _1568 ? _1492 : (-1);
    float _1572 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1546);
    float _1574 = _1382 + (-0.5);
    float _1576 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1566);
    int _1578 = _1570 >> 31;
    float _1580 = -_1572;
    float _1582 = _1580 + 1.0;
    float _1584 = _1434 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1586 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1576);
    float _1588 = _1542 * _1524;
    float _1590 = _1408;
    float _1592 = _1406;
    if (_1556)
    {
        float _1594 = _1514 * _1528;
        _135 = _1594;
    }
    float _1596 = _135;
    float _1598 = -_1542;
    float _1600 = _1598 + 1.0;
    int _1602 = _1578 & 3;
    float _1604 = _1466 * _1588;
    float _1606 = _1468 * _1588;
    float _1608 = -_1574;
    float _1610 = -_1558;
    float _1612 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1610);
    int _1614 = _1570 + _1602;
    int _1616 = _977 * int(_1564);
    int _1618 = _1616 + _1178;
    float _1620 = _1448 * _1588;
    float _1622 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1604);
    int _1624 = _1614 >> 2;
    float _1626 = _1190 + (-0.5);
    float _1628 = float(uint(_1618));
    float _1630 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1620);
    float _1632 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1606);
    int _1634 = _1624 << 4;
    int _1636 = _1634 + 368;
    float _1638 = fma(_1450, _1520, _1622);
    bool _1640 = !_1322;
    int _1642 = _1640 ? 0 : 1;
    float _1644 = as_type<float>(_987) * _1628;
    uint _1646 = uint(int(uint(_1636) >> uint(2)));
    uint _1648 = uint(int(uint(int(_1646)) >> uint(2)));
    int _1650 = int(_1646) & 3;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[int(_1648)][_1650];
    int _1654 = int(_1646) + 1;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    int _1658 = _1654 & 3;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[int(_1656)][_1658];
    float _1662 = -_1586;
    float _1664 = _1662 + 1.0;
    int _1666 = abs(_1642);
    float _1668 = fma(_1516, _1520, _1630);
    int _1670 = ~_1470;
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = -_1664;
    float _1678 = fma(_1296, _1676, _1452);
    float _1680 = float(_1336);
    float _1682 = fma(_1382, _1582, _1612);
    float _1684 = float(_1666);
    float _1686 = trunc(_1644);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = _1674;
    float _1694 = _1626;
    if (!_1418)
    {
        int _1696 = ~_1470;
        int _1698 = _1696 + 1;
        _1692 = _1698;
    }
    int _1700 = _1692;
    float _1702 = fma(_1526, _1520, _1632);
    int _1704 = _1570 & 3;
    bool _1706 = _1704 != 0;
    float _1708 = _1684 * _1680;
    bool _1710 = !_1318;
    int _1712 = _1710 ? 0 : 1;
    out.m_62.x = _1678;
    out.m_62.y = _1682;
    bool _1714 = uint(_1704) > 1u;
    int _1716 = _1570 & 3;
    bool _1718 = _1716 != 0;
    int _1720 = abs(_1712);
    int _1722 = _1636 + 8;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    uint _1726 = uint(int(uint(int(_1724)) >> uint(2)));
    int _1728 = int(_1724) & 3;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[int(_1726)][_1728];
    int _1732 = int(_1724) + 1;
    uint _1734 = uint(int(uint(_1732) >> uint(2)));
    int _1736 = _1732 & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = _1718 ? 0 : 1;
    int _1742 = int(_1564) + int(_1690);
    float _1744 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1668);
    int _1746 = ~_1740;
    int _1748 = _1746 + 1;
    int _1750 = _1748 + 1;
    float _1752 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1638);
    int _1754 = _1750;
    if (!_1714)
    {
        int _1756 = ~_1740;
        int _1758 = _1756 + 1;
        _1754 = _1758;
    }
    int _1760 = _1754;
    float _1762 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1702);
    bool _1764 = !_1706;
    int _1766 = _1764 ? 0 : 1;
    float _1768 = _1744 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1770 = abs(_1760);
    float _1772 = float(_1720);
    int _1774 = abs(_1766);
    float _1776 = float(_1700);
    int _1778 = ~_949;
    int _1780 = _1778 + 1;
    int _1782 = ~_1770;
    int _1784 = _1782 + 1;
    int _1786 = _1784 + 1;
    float _1788 = _1772 * _1776;
    bool _1790 = _1704 != 3;
    int _1792 = _1780 * _1742;
    int _1794 = _1792 + _1178;
    int _1796 = ~_1774;
    int _1798 = _1796 + 1;
    int _1800 = _1798 + 1;
    int _1802 = _1786 * as_type<int>(_1660);
    bool _1804 = uint(_1704) >= 2u;
    bool _1806 = uint(_1794) >= uint(_949);
    int _1808 = _1800 * as_type<int>(_1652);
    int _1810 = _1808 + _1802;
    int _1812 = _1804 ? 0 : 1;
    float _1814 = in.m_64.x;
    float _1816 = in.m_64.y;
    float _1818 = in.m_64.z;
    bool _1820 = _1704 != 3;
    float _1822 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1824 = _1408 + _1822;
    int _1826 = ~_1812;
    int _1828 = _1826 + 1;
    int _1830 = _1828 + 1;
    int _1832 = _1830;
    if (_1790)
    {
        int _1834 = ~_1812;
        int _1836 = _1834 + 1;
        _1832 = _1836;
    }
    int _1838 = _1832;
    float _1840 = _1824 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1842 = !_1820;
    int _1844 = _1842 ? 0 : (-1);
    int _1846 = abs(_1838);
    bool _1848 = !_1806;
    int _1850 = _1848 ? 0 : (-1);
    int _1852 = abs(_1844);
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1856 = _1584 + _1854;
    int _1858 = ~_1846;
    int _1860 = _1858 + 1;
    int _1862 = _1860 + 1;
    int _1864 = ~_1742;
    int _1866 = _1864 + _1850;
    int _1868 = _1866 + 1;
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1840);
    bool _1872 = !_1182;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = _1862 * as_type<int>(_1730);
    int _1878 = _1876 + _1810;
    int _1880 = ~_1852;
    int _1882 = _1880 + 1;
    int _1884 = _1882 + 1;
    float _1886 = _1708 * (-2.0);
    int _1888 = abs(_1874);
    float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1892 = _1406 + _1890;
    int _1894 = _1884 * as_type<int>(_1738);
    int _1896 = _1894 + _1878;
    float _1898 = fma(_1394, _1886, _1394);
    float _1900 = fma(_1886, _1816, _1816);
    float _1902 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1870);
    int _1904 = _949 * _1868;
    int _1906 = _1904 + _1178;
    float _1908 = _1824 * _1824;
    float _1910 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1900);
    bool _1912 = _1902 >= 0.0;
    float _1914 = fma(_1856, _1856, _1908);
    int _1916 = ~_1888;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    float _1922 = _1762 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1924 = !_1074;
    int _1926 = _1924 ? _1906 : (-1);
    float _1928 = fma(_1892, _1892, _1914);
    float _1930 = fma(_1898, _1596, _1910);
    int _1932 = _1896 * _1920;
    float _1934 = _1788 * (-2.0);
    float _1936 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1938 = !_1326;
    int _1940 = _1938 ? 0 : 1;
    float _1942 = rsqrt(_1928);
    int _1944 = _1926 * _1888;
    int _1946 = _1944 + _1932;
    float _1948 = _1818;
    if (_1912)
    {
        _1694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1950 = _1694;
    float _1952 = _1752 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1954 = fma(_1390, _1934, _1390);
    float _1956 = fma(_1934, _1814, _1814);
    float _1958 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1960 = _1952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1962 = as_type<int>(_1950);
    if (_1912)
    {
        float _1964 = _1950 * 5.0;
        _1962 = as_type<int>(_1964);
    }
    int _1966 = _1962;
    float _1968 = float(_1946);
    if (_1912)
    {
        out.m_47.x = 0.0;
    }
    float _1970 = _153 + (-0.5);
    int _1972 = abs(_1940);
    out.m_66.x = _1958;
    out.m_66.y = _1960;
    out.m_66.z = _1936;
    float _1974 = _1824 * _1942;
    float _1976 = _1856 * _1942;
    if (_1912)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6414 = as_type<float>(_1966);
        out.gl_Position.z = _6414;
    }
    out.m_68.x = _1968;
    if (_1912)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1978 = -_1974;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1982 = _1892 * _1942;
    float _1984 = -_1976;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1584);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1990 = _1980 + _1988;
    float _1992 = -_1982;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1406);
    float _1996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1998 = _1986 + _1996;
    float _2000 = -_1974;
    float _2002 = fma(_2000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1824);
    float _2004 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2006 = float(_1972);
    float _2008 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2010 = _1994 + _2008;
    float _2012 = float(_1402);
    float _2014 = fma(_1998, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2004);
    float _2016 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1956);
    float _2018 = -_1976;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1856);
    float _2022 = _2002 * _2002;
    float _2024 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2014);
    float _2026 = fma(_1954, _1596, _2016);
    float _2028 = _153 + _1264;
    float _2030 = _2006 * _2012;
    float _2032 = fma(_2020, _2020, _2022);
    float _2034 = _2026 * 0.15915493667125701904296875;
    float _2036 = _2028 + (-1.0);
    bool _2038 = _2024 >= 0.0;
    float _2040 = _2030 * (-2.0);
    float _2042 = _1264 + (-0.5);
    float _2044 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2046 = -_1982;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1892);
    float _2050 = fma(_2040, _1818, _1818);
    float _2052 = _1930 * 0.15915493667125701904296875;
    float _2054 = fma(_2044, _2040, _2044);
    float _2056 = fma(_2048, _2048, _2032);
    float _2058 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2050);
    float _2060 = _2052 * 6.283185482025146484375;
    float _2062 = sin(_2060);
    float _2064 = _1994;
    if (_2038)
    {
        _1948 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2066 = _1948;
    float _2068 = fma(_2054, _1596, _2058);
    int _2070 = as_type<int>(_2066);
    if (_2038)
    {
        out.m_47.x = 0.0;
    }
    float _2072 = _333 * _897;
    float _2074 = _2052 * 6.283185482025146484375;
    float _2076 = cos(_2074);
    if (_2038)
    {
        float _2078 = _2066 * 5.0;
        _2070 = as_type<int>(_2078);
    }
    int _2080 = _2070;
    float _2082 = _2068 * 0.15915493667125701904296875;
    if (_2038)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6604 = as_type<float>(_2080);
        out.gl_Position.z = _6604;
    }
    float _2084 = _2034 * 6.283185482025146484375;
    float _2086 = sin(_2084);
    float _2088 = sqrt(_2056);
    float _2090 = _2034 * 6.283185482025146484375;
    float _2092 = cos(_2090);
    if (_2038)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2094 = _2082 * 6.283185482025146484375;
    float _2096 = cos(_2094);
    float _2098 = _1942 * _2088;
    float _2100 = _2072 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2102 = _319 * _899;
    float _2104 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _329);
    float _2108 = _2098 * _2100;
    float _2110 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2112 = _2082 * 6.283185482025146484375;
    float _2114 = sin(_2112);
    float _2116 = _2092 * _2076;
    float _2118 = _2104 * _2108;
    float _2120 = _2086 * _2062;
    float _2122 = _2098 * _2110;
    float _2124 = _2092 * _2062;
    float _2126 = _2086 * _2076;
    float _2128 = _2092 * _2096;
    float _2130 = _2076 * _2096;
    float _2132 = _2106 * _2122;
    float _2134 = _2086 * _2096;
    float _2136 = _2128 * _2118;
    float _2138 = _2062 * _2096;
    float _2140 = _2098 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2142 = _2140 * 0.5;
    float _2144 = fma(_2114, _2116, _2120);
    float _2146 = -_2126;
    float _2148 = fma(_2114, _2124, _2146);
    float _2150 = -_2118;
    float _2152 = _2114 * _2150;
    float _2154 = _2134 * _2118;
    float _2156 = fma(_2144, _2132, _2136);
    float _2158 = -_2124;
    float _2160 = fma(_2114, _2126, _2158);
    float _2162 = fma(_2130, _2132, _2152);
    float _2164 = fma(_2114, _2120, _2116);
    float _2166 = fma(_2148, _2142, _2156);
    float _2168 = fma(_2160, _2132, _2154);
    float _2170 = fma(_2138, _2142, _2162);
    float _2172 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2174 = fma(_2164, _2142, _2168);
    float _2176 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2178 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2172);
    float _2180 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2176);
    float _2182 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2178);
    float _2184 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2180);
    float _2186 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2188 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2190 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2192 = _1406 + _2186;
    float _2194 = _1584 + _2188;
    float _2196 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2190);
    float _2198 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2200 = _2192 + _2198;
    float _2202 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2204 = _2194 + _2202;
    float _2206 = _2200 * _2200;
    float _2208 = fma(_2204, _2204, _2206);
    float _2210 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2212 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2196);
    float _2214 = sqrt(_2208);
    float _2216 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2210);
    float _2218 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2216);
    float _2220 = _2218 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2222 = _1408 + _2220;
    bool _2224 = _2214 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2226 = _2196;
    float _2228 = _2194;
    float _2230 = _2192;
    float _2232 = _2098;
    if (!_2224)
    {
        _2226 = _2194;
    }
    float _2234 = _2226;
    float _2236 = _2234;
    if (!_2224)
    {
        _2228 = _2192;
    }
    float _2238 = _2228;
    float _2240 = _2238;
    if (!_2224)
    {
        _2230 = _2222;
    }
    float _2242 = _2230;
    bool _2244 = !_2224;
    float _2246 = _2242;
    if (!_2244)
    {
        float _2248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2250 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2252 = _2214 + _2250;
        float _2254 = rsqrt(_2208);
        float _2256 = _2252 * _2248;
        float _2258 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2260 = _2256 * 0.15915493667125701904296875;
        float _2262 = _2260 * 6.283185482025146484375;
        float _2264 = cos(_2262);
        float _2266 = _2260 * 6.283185482025146484375;
        float _2268 = sin(_2266);
        float _2270 = _2264 + (-1.0);
        float _2272 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = fma(_2268, _2258, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2276 = fma(_2222, _2264, _2272);
        float _2278 = _2254 * _2274;
        float _2280 = fma(_2204, _2278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2282 = fma(_2200, _2278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2246 = _2276;
        _2236 = _2280;
        _2240 = _2282;
    }
    float _2284 = _2246;
    float _2286 = _2236;
    float _2288 = _2240;
    float _2290 = -_1408;
    float _2292 = _2290 + _2284;
    float _2294 = -_1584;
    float _2296 = _2294 + _2286;
    float _2298 = -_1406;
    float _2300 = _2298 + _2288;
    float _2302 = _2212 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2304 = _2292 * _2292;
    float _2306 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2308 = 1.0 / _2302;
    float _2310 = fma(_2296, _2296, _2304);
    float _2312 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2306);
    bool _2314 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2316 = isnan(0.5);
    bool _2318 = _2314 || _2316;
    bool _2320 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2322 = _2318 || _2320;
    float _2324 = fma(_2300, _2300, _2310);
    float _2326 = fma(_1994, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2312);
    bool _2328 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2330 = isnan(0.5);
    bool _2332 = _2328 || _2330;
    bool _2334 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2336 = _2332 || _2334;
    float _2338 = sqrt(_2324);
    float _2340 = _2326 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2342 = _2340 + _2302;
    float _2344 = _2342 * _2308;
    float _2346 = _2344 * 0.5;
    bool _2348 = _2338 > 0.0;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2352 = fma(_2346, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2350);
    float _2354 = 1.0 / _2352;
    float _2356 = _2308;
    float _2358 = _2342;
    float _2360 = _2288;
    float _2362 = _2284;
    if (!_2348)
    {
        _2356 = _2286;
    }
    float _2364 = _2356;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2348)
    {
        _2358 = _2284;
    }
    float _2370 = _2358;
    bool _2372 = !_2348;
    float _2374 = _2370;
    if (!_2372)
    {
        float _2376 = _323 * _323;
        float _2378 = fma(_315, _315, _2376);
        float _2380 = fma(_325, _325, _2378);
        float _2382 = rsqrt(_2324);
        float _2384 = sqrt(_2380);
        float _2386 = _2296 * _2382;
        float _2388 = _2292 * _2382;
        float _2390 = _2300 * _2382;
        bool _2392 = _2384 > 0.0;
        float _2394 = _2384;
        if (!_2392)
        {
            _2366 = _2286;
        }
        float _2396 = _2366;
        _2368 = _2396;
        if (!_2392)
        {
            _2394 = _2284;
        }
        float _2398 = _2394;
        bool _2400 = !_2392;
        _2374 = _2398;
        if (!_2400)
        {
            float _2402 = rsqrt(_2380);
            float _2404 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2406 = _323 * _2402;
            float _2408 = _315 * _2402;
            float _2410 = _2388 * _2406;
            float _2412 = _325 * _2402;
            float _2414 = fma(_2386, _2408, _2410);
            float _2416 = _2404 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2418 = fma(_2390, _2412, _2414);
            float _2420 = _2418 * _2416;
            float _2422 = fma(_315, _2420, _2286);
            float _2424 = fma(_323, _2420, _2284);
            float _2426 = fma(_325, _2420, _2288);
            _2368 = _2422;
            _2374 = _2424;
            _2360 = _2426;
        }
    }
    float _2428 = _2368;
    float _2430 = _2374;
    float _2432 = _2360;
    float _2434 = -_1976;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2428);
    float _2438 = -_1974;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2430);
    float _2442 = -_1982;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2432);
    float _2446 = _2440;
    float _2448 = _2436;
    float _2450 = _2444;
    if (_2336)
    {
        _2362 = 1.0;
    }
    float _2452 = _2362;
    float _2454 = _2452;
    if (!_2322)
    {
        float _2456 = _1990 * _1990;
        float _2458 = 1.0 / _2098;
        float _2460 = -_1408;
        float _2462 = _2460 + _2430;
        float _2464 = -_1584;
        float _2466 = _2464 + _2428;
        float _2468 = fma(_1998, _1998, _2456);
        float _2470 = -_1406;
        float _2472 = _2470 + _2432;
        float _2474 = fma(_2010, _2010, _2468);
        float _2476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2478 = sqrt(_2474);
        float _2480 = _2462 * _2458;
        float _2482 = _2466 * _2458;
        float _2484 = _2472 * _2458;
        bool _2486 = _2478 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2488 = isnan(_2478);
        bool _2490 = _2486 || _2488;
        bool _2492 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2494 = _2490 || _2492;
        float _2496 = precise::min(_2478, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2498 = _2496 * _2476;
        float _2500 = fma(_2482, _2498, _1986);
        float _2502 = fma(_2480, _2498, _1980);
        float _2504 = _325;
        float _2506 = _2478;
        float _2508 = _2500;
        float _2510 = _2502;
        _1590 = _2484;
        _1592 = _2480;
        if (_2494)
        {
            float _2512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2504 = _2512;
        }
        float _2514 = _2504;
        if (_2494)
        {
            float _2516 = precise::max(_2478, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2506 = _2516;
        }
        float _2518 = _2506;
        float _2520 = fma(_2484, _2498, _1994);
        _337 = _2514;
        _2450 = _2520;
        if (_2494)
        {
            float _2522 = _2518 * _2514;
            _2232 = _2522;
        }
        float _2524 = _2232;
        if (_2494)
        {
            float _2526 = fma(_2482, _2524, _1986);
            _2508 = _2526;
        }
        float _2528 = _2508;
        _2448 = _2528;
        if (_2494)
        {
            float _2530 = fma(_2480, _2524, _1980);
            _2510 = _2530;
        }
        float _2532 = _2510;
        _2446 = _2532;
        if (_2494)
        {
            float _2534 = fma(_2484, _2524, _1994);
            _2450 = _2534;
        }
    }
    float _2536 = _337;
    float _2538 = _2446;
    float _2540 = _2448;
    float _2542 = _2450;
    float _2544 = _1590;
    float _2546 = _1592;
    float _2548 = _2546;
    float _2550 = _2536;
    float _2552 = _2544;
    if (_2336)
    {
        _2548 = 1.0;
    }
    float _2554 = _2548;
    float _2556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2558 = _2354 * _2556;
    float _2560 = _2554;
    if (!_2336)
    {
        float _2562 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2564 = _2562 * 0.15915493667125701904296875;
        float _2566 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2568 = _2564 * 6.283185482025146484375;
        float _2570 = cos(_2568);
        float _2572 = _2566 * 0.15915493667125701904296875;
        float _2574 = _2564 * 6.283185482025146484375;
        float _2576 = sin(_2574);
        float _2578 = 1.0 / _2570;
        float _2580 = _2572 * 6.283185482025146484375;
        float _2582 = cos(_2580);
        float _2584 = _2576 * _2578;
        float _2586 = _2572 * 6.283185482025146484375;
        float _2588 = sin(_2586);
        float _2590 = _2582 * _2584;
        float _2592 = 1.0 / _2590;
        float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2596 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2594;
        float _2598 = 1.0 / _2596;
        float _2600 = _2588 * _2592;
        float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2604 = fma(_2558, _2600, _2602);
        float _2606 = _2604 * _2598;
        float _2608 = precise::clamp(_2606, 0.0, 1.0);
        _2550 = _2564;
        _2064 = _2592;
        _2454 = _2608;
    }
    float _2610 = _2550;
    float _2612 = _2064;
    float _2614 = _2454;
    float _2616 = _2612;
    float _2618 = _2610;
    if (!_2336)
    {
        float _2620 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2622 = _2620 * 0.15915493667125701904296875;
        float _2624 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2626 = _2622 * 6.283185482025146484375;
        float _2628 = cos(_2626);
        float _2630 = _2624 * 0.15915493667125701904296875;
        float _2632 = _2622 * 6.283185482025146484375;
        float _2634 = sin(_2632);
        float _2636 = 1.0 / _2628;
        float _2638 = _2630 * 6.283185482025146484375;
        float _2640 = cos(_2638);
        float _2642 = _2634 * _2636;
        float _2644 = _2630 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = _2640 * _2642;
        float _2650 = 1.0 / _2648;
        float _2652 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2654 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2652;
        float _2656 = 1.0 / _2654;
        float _2658 = _2646 * _2650;
        float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2662 = fma(_2558, _2658, _2660);
        float _2664 = _2662 * _2656;
        float _2666 = precise::clamp(_2664, 0.0, 1.0);
        float _2668 = -_2666;
        float _2670 = _2668 + 1.0;
        _2616 = _2648;
        _2618 = _2658;
        _2560 = _2670;
    }
    float _2672 = _2616;
    float _2674 = _2618;
    float _2676 = _2560;
    float _2678 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2680 = _2538 + _2678;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2684 = _2540 + _2682;
    float _2686 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2688 = _2542 + _2686;
    float _2690 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2692 = _2680 * _2680;
    float _2694 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2696 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2690);
    float _2698 = fma(_2684, _2684, _2692);
    float _2700 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2696);
    float _2702 = fma(_2688, _2688, _2698);
    float _2704 = _2700 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2706 = rsqrt(_2702);
    float _2708 = sqrt(_2702);
    float _2710 = _2706 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2712 = _2684 * _2710;
    float _2714 = _2688 * _2710;
    float _2716 = _2712 * _2712;
    float _2718 = _2714 * _2714;
    float _2720 = _2716 + _2718;
    float _2722 = sqrt(_2720);
    bool _2724 = _2722 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2728 = _2722 + _2726;
    float _2730 = _2706;
    float _2732 = _2720;
    float _2734 = _2728;
    float _2736 = _2672;
    float _2738 = _2680;
    float _2740 = _2674;
    if (_2724)
    {
        float _2742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2730 = _2742;
    }
    float _2744 = _2730;
    if (_2724)
    {
        float _2746 = rsqrt(_2720);
        _2732 = _2746;
    }
    float _2748 = _2732;
    float _2750 = _2748;
    if (_2724)
    {
        float _2752 = _2728 * _2744;
        _2734 = _2752;
    }
    float _2754 = _2734;
    if (_2724)
    {
        float _2756 = _2754 * 0.15915493667125701904296875;
        _2736 = _2756;
    }
    float _2758 = _2736;
    float _2760 = _2688;
    if (_2724)
    {
        float _2762 = _2758 * 6.283185482025146484375;
        float _2764 = sin(_2762);
        _2760 = _2764;
    }
    float _2766 = _2760;
    float _2768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2770 = precise::max(0.0, _2768);
    float _2772 = _2744;
    float _2774 = _2770;
    if (_2724)
    {
        float _2776 = _2758 * 6.283185482025146484375;
        float _2778 = cos(_2776);
        _2772 = _2778;
    }
    float _2780 = _2772;
    float _2782 = -_2710;
    float _2784 = -_2770;
    float _2786 = fma(_2680, _2782, _2784);
    if (_2724)
    {
        float _2788 = _2786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2738 = _2788;
    }
    float _2790 = _2738;
    float _2792 = _2790;
    float _2794 = _2766;
    if (_2724)
    {
        float _2796 = fma(_2766, _2790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2792 = _2796;
    }
    float _2798 = _2792;
    float _2800 = _2798;
    if (!_2724)
    {
        _2794 = _2712;
    }
    float _2802 = _2794;
    float _2804 = _2802;
    float _2806 = _2780;
    if (_2724)
    {
        float _2808 = _2780 + (-1.0);
        _2774 = _2808;
    }
    float _2810 = _2774;
    float _2812 = _2810;
    if (_2724)
    {
        float _2814 = _2748 * _2798;
        _2552 = _2814;
    }
    float _2816 = _2552;
    if (!_2724)
    {
        _2800 = _2786;
    }
    float _2818 = _2800;
    float _2820 = _2818;
    if (_2724)
    {
        float _2822 = _2810 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2740 = _2822;
    }
    float _2824 = _2740;
    if (_2724)
    {
        float _2826 = _2712 * _2816;
        _2804 = _2826;
    }
    float _2828 = _2804;
    if (!_2724)
    {
        _2812 = _2714;
    }
    float _2830 = _2812;
    float _2832 = _2830;
    if (_2724)
    {
        float _2834 = _2714 * _2816;
        _2832 = _2834;
    }
    float _2836 = _2832;
    if (!_2724)
    {
        _2750 = _2716;
    }
    float _2838 = _2750;
    float _2840 = _2838;
    if (_2724)
    {
        float _2842 = fma(_2786, _2780, _2824);
        _2820 = _2842;
    }
    float _2844 = _2820;
    if (_2724)
    {
        float _2846 = _2828 * _2828;
        _2840 = _2846;
    }
    float _2848 = _2840;
    if (!_2724)
    {
        _2806 = _2718;
    }
    float _2850 = _2806;
    float _2852 = _2850;
    if (_2724)
    {
        float _2854 = _2836 * _2836;
        _2852 = _2854;
    }
    float _2856 = _2852;
    float _2858 = fma(_2844, _2844, _2848);
    float _2860 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2862 = _2858 + _2856;
    float _2864 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2860);
    float _2866 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2868 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2870 = fma(_2708, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2868);
    float _2872 = precise::clamp(_2870, 0.0, 1.0);
    float _2874 = rsqrt(_2862);
    float _2876 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2864);
    float _2878 = _2538 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2880 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2866);
    float _2882 = -_2872;
    float _2884 = _2882 + 1.0;
    float _2886 = _2876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2888 = fma(_2540, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2878);
    float _2890 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2880);
    float _2892 = abs(_2884);
    float _2894 = log2(_2892);
    float _2896 = _2886 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2898 = fma(_2542, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2888);
    float _2900 = _2890 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2902 = -_2896;
    float _2904 = fma(_2902, _2694, 1.0);
    float _2906 = _2898 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2908 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2910 = _2874 * _2828;
    float _2912 = _2874 * _2844;
    float _2914 = _2874 * _2836;
    float _2916 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2908);
    float _2918 = _2910 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2920 = log2(_2904);
    float _2922 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2916);
    float _2924 = -_2918;
    float _2926 = fma(_2912, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2924);
    float _2928 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2930 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2922);
    float _2932 = -_2914;
    float _2934 = fma(_2932, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2926);
    float _2936 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2938 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2940 = 1.0 / _2930;
    float _2942 = fma(_2934, -0.5, 0.5);
    float _2944 = fma(_2934, 0.5, 0.5);
    float _2946 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2936);
    float _2948 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2938);
    float _2950 = _2912 + 1.0;
    float _2952 = fma(_2944, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2954 = _2920 * 0.693147182464599609375;
    float _2956 = exp2(_2928);
    float _2958 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2948);
    float _2960 = fma(_2944, _2952, -0.212114393711090087890625);
    float _2962 = _2954 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2964 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2958);
    float _2966 = fma(_2944, _2960, 1.570728778839111328125);
    float _2968 = sqrt(_2942);
    float _2970 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2946);
    float _2972 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2970);
    float _2974 = -_2912;
    float _2976 = fma(_2956, _2950, _2974);
    float _2978 = _2972 * _2940;
    float _2980 = _2964 * _2940;
    float _2982 = fma(_2976, 0.5, 0.5);
    float _2984 = fma(_2978, 0.5, 0.5);
    float _2986 = fma(_2980, -0.5, 0.5);
    float _2988 = _2968 * 0.636619746685028076171875;
    float _2990 = -_2966;
    float _2992 = fma(_2988, _2990, 1.0);
    float3 _8030 = float3(_2984, _2986, _2962);
    float _2994 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8030, float3(0.0), isnan(_8030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8030, float3(0.0), isnan(_8030)), level(0.0)).x;
    float3 _8041 = float3(_2984, _2986, _2962);
    float4 _2997 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8041, float3(0.0), isnan(_8041)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8041, float3(0.0), isnan(_8041)), level(0.0)).xyzw;
    float _2999 = _2997.x;
    float _3001 = _2997.y;
    float _3003 = _2997.z;
    float _3005 = _2997.w;
    float2 _8058 = float2(_2992, _2982);
    float3 _3009 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8058, float2(0.0), isnan(_8058)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8058, float2(0.0), isnan(_8058)), level(0.0)).xyz;
    float _3011 = _3009.x;
    float _3013 = _3009.y;
    float _3015 = _3009.z;
    float _3017 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3019 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3021 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3023 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3025 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3017);
    float _3027 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3029 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3031 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3019);
    float _3033 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3021);
    float _3035 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3025);
    float _3037 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3039 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3041 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3043 = _2900 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3045 = -_2114;
    float _3047 = fma(_3045, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3023);
    float _3049 = -_2114;
    float _3051 = fma(_3049, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3027);
    float _3053 = exp2(_3037);
    float _3055 = -_2114;
    float _3057 = fma(_3055, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3029);
    float _3059 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3061 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3031);
    float _3063 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3033);
    float _3065 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3039);
    float _3067 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3041);
    float _3069 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3043);
    float _3071 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3059);
    float _3073 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3047);
    float _3075 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3051);
    float _3077 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3079 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3057);
    float _3081 = fma(_2886, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3069);
    float _3083 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3065);
    float _3085 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3067);
    float _3087 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3071);
    float _3089 = _3077 * _3073;
    float _3091 = _3077 * _3075;
    float _3093 = _329 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3095 = _3077 * _3079;
    float _3097 = -_3053;
    float _3099 = _3097 + 1.0;
    float _3101 = fma(_2704, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3081);
    float _3103 = fma(_3093, _3035, _3089);
    float _3105 = fma(_3093, _3063, _3095);
    float _3107 = _3099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3109 = _2930 * 0.5;
    float _3111 = _3101 + _2930;
    float _3113 = _2972 + _2930;
    float _3115 = fma(_3093, _3061, _3091);
    float _3117 = fma(_2964, -0.5, _3109);
    float _3119 = _3111 * 0.5;
    float _3121 = _3113 * 0.5;
    float _3123 = _3083 + _3103;
    float _3125 = _3085 + _3115;
    float _3127 = _3087 + _3105;
    bool _3129 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3131 = isnan(_2708);
    bool _3133 = _3129 || _3131;
    bool _3135 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3137 = _3133 || _3135;
    out.m_70.x = _3121;
    out.m_70.y = _3117;
    out.m_70.z = _3119;
    out.m_70.w = _2930;
    out.m_72.x = _3123;
    out.m_72.y = _3125;
    out.m_72.z = _3127;
    out.gl_Position.x = _2972;
    out.gl_Position.y = _2964;
    out.gl_Position.z = _3101;
    out.gl_Position.w = _2930;
    float _3139 = _3115;
    float _3141 = _3093;
    if (!_3137)
    {
        _3139 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3143 = _3139;
    float _3145 = _3143;
    float _3147 = _3143;
    if (!_3137)
    {
        _3141 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3149 = _3141;
    float _3151 = _3107 * _2994;
    float _3153 = -_3107;
    float _3155 = _3153 + 1.0;
    float _3157 = _3005 * _3151;
    float _3159 = _3015 * _3151;
    float _3161 = _3005 * _3155;
    float _3163 = fma(_3011, _3157, _2999);
    float _3165 = fma(_3013, _3157, _3001);
    float _3167 = fma(_3005, _3159, _3003);
    float _3169 = _2614 * _2676;
    float _3171 = _3003;
    float _3173 = _3005;
    float _3175 = _3001;
    float _3177 = _3169;
    float _3179 = _3149;
    float _3181 = _3149;
    if (!_3137)
    {
        _3171 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3183 = _3171;
    float _3185 = _3183;
    float _3187 = _3183;
    if (!_3137)
    {
        _3173 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3189 = _3173;
    out.m_74.x = _3163;
    out.m_74.y = _3165;
    out.m_74.z = _3167;
    out.m_74.w = _3161;
    float _3191 = _3169 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3193 = _3189;
    float _3195 = _3189;
    if (!_3137)
    {
        _3175 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3197 = _3175;
    float _3199 = _3197;
    float _3201 = _3197;
    if (!_3137)
    {
        _3177 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3203 = _3177;
    bool _3205 = !_3137;
    float _3207 = _3203;
    float _3209 = _3203;
    if (!_3205)
    {
        bool _3211 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3213 = isnan(_2708);
        bool _3215 = _3211 || _3213;
        bool _3217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3219 = _3215 || _3217;
        if (!_3219)
        {
            float _3221 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3223 = _2708 + _3221;
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3227 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3225;
            float _3229 = 1.0 / _3227;
            float _3231 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3237 = _3235 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3241 = _3239 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3247 = _3223 * _3229;
            float _3249 = precise::clamp(_3247, 0.0, 1.0);
            float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3257 = _3255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3259 = fma(_3249, _3233, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3261 = fma(_3249, _3253, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3263 = fma(_3249, _3257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3265 = fma(_3249, _3237, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3267 = fma(_3249, _3241, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3269 = fma(_3249, _3245, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3187 = _3263;
            _3201 = _3267;
            _3147 = _3261;
            _3181 = _3265;
            _3195 = _3259;
            _3209 = _3269;
            _3271 = true;
        }
        else
        {
            bool _3273 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3275 = isnan(_2708);
            bool _3277 = _3273 || _3275;
            bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3281 = _3277 || _3279;
            if (!_3281)
            {
                _3145 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3283 = _3145;
            _3147 = _3283;
            if (!_3281)
            {
                _3185 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3285 = _3185;
            _3187 = _3285;
            if (!_3281)
            {
                _3193 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3287 = _3193;
            _3195 = _3287;
            if (!_3281)
            {
                _3179 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3289 = _3179;
            _3181 = _3289;
            if (!_3281)
            {
                _3199 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3291 = _3199;
            _3201 = _3291;
            if (!_3281)
            {
                _3207 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3293 = _3207;
            bool _3295 = !_3281;
            _3209 = _3293;
            if (!_3295)
            {
                bool _3297 = _2708 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3299 = isnan(_2708);
                bool _3301 = _3297 || _3299;
                bool _3303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3305 = _3301 || _3303;
                if (!_3305)
                {
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3309 = _2708 + _3307;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3311;
                    float _3315 = 1.0 / _3313;
                    float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3321 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3329 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3333 = _3309 * _3315;
                    float _3335 = precise::clamp(_3333, 0.0, 1.0);
                    float _3337 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3339 = _3337 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3343 = _3341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3345 = fma(_3335, _3319, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3347 = fma(_3335, _3339, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3349 = fma(_3335, _3343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3351 = fma(_3335, _3323, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3353 = fma(_3335, _3327, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3355 = fma(_3335, _3331, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3187 = _3349;
                    _3201 = _3353;
                    _3147 = _3347;
                    _3181 = _3351;
                    _3195 = _3345;
                    _3209 = _3355;
                    _3271 = true;
                }
                else
                {
                    _3187 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3201 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3147 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3181 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3195 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3209 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3271 = false;
    float _3357 = _3187;
    float _3359 = _3201;
    float _3361 = _3147;
    float _3363 = _3181;
    float _3365 = _3195;
    float _3367 = _3209;
    float _3369 = fma(_3125, -0.5, 0.5);
    float _3371 = precise::clamp(_3369, 0.0, 1.0);
    float _3373 = -_3357;
    float _3375 = _3373 + _3359;
    float _3377 = _3191 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3379 = -_3361;
    float _3381 = _3379 + _3363;
    float _3383 = fma(_3371, _3375, _3357);
    out.m_76.x = 0.0;
    float _3385 = -_3365;
    float _3387 = _3385 + _3367;
    float _3389 = fma(_3371, _3381, _3361);
    float _3391 = _3383 * 0.586610972881317138671875;
    out.m_47.x = _3377;
    bool _3393 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3395 = fma(_3371, _3387, _3365);
    float _3397 = fma(_3389, 0.298911988735198974609375, _3391);
    bool _3399 = _2614 > 0.0;
    bool _3401 = isnan(_2614);
    bool _3403 = _3399 || _3401;
    bool _3405 = isnan(0.0);
    bool _3407 = _3403 || _3405;
    float _3409 = fma(_3395, 0.114477999508380889892578125, _3397);
    bool _3411 = _2676 <= 0.0;
    bool _3413 = !_3407;
    bool _3415 = _3411 || _3413;
    float _3417 = -_3409;
    float _3419 = _3389 + _3417;
    float _3421 = -_3409;
    float _3423 = _3383 + _3421;
    float _3425 = -_3409;
    float _3427 = _3395 + _3425;
    float _3429 = fma(_3419, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3431 = fma(_3423, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    float _3433 = fma(_3427, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3409);
    bool _3435 = !_3393;
    if (!_3435)
    {
        float _3437 = -_2538;
        float _3439 = _3437 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3441 = -_2540;
        float _3443 = _3441 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3445 = -_2542;
        float _3447 = _3445 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3449 = _3439 * _3439;
        float _3451 = fma(_3443, _3443, _3449);
        float _3453 = fma(_3447, _3447, _3451);
        float _3455 = sqrt(_3453);
        float _3457 = rsqrt(_3453);
        float _3459 = -_3455;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3463 = _3461 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3465 = precise::clamp(_3463, 0.0, 1.0);
        float _3467 = _3443 * _3457;
        float _3469 = _3439 * _3457;
        float _3471 = abs(_3465);
        float _3473 = log2(_3471);
        float _3475 = _3447 * _3457;
        float _3477 = _3467 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3479 = _3125 * _3469;
        float _3481 = -_3469;
        float _3483 = -_3477;
        float _3485 = fma(_3481, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3483);
        float _3487 = fma(_3123, _3467, _3479);
        float _3489 = -_3475;
        float _3491 = fma(_3489, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3485);
        float _3493 = fma(_3127, _3475, _3487);
        float _3495 = precise::clamp(_3493, 0.0, 1.0);
        float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3499 = _3491 + _3497;
        float _3501 = _3473 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3503 = _3499 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3505 = precise::clamp(_3503, 0.0, 1.0);
        float _3507 = exp2(_3501);
        float _3509 = _3507 * _3505;
        float _3511 = _3495 * _3509;
        float _3513 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3515 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3517 = _3511 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_76.x = _3513;
        out.m_76.y = _3515;
        out.m_76.z = _3517;
    }
    out.m_78.x = _3429;
    out.m_78.y = _3431;
    out.m_78.z = _3433;
    if (!_3415)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3519 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_47.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3519;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

