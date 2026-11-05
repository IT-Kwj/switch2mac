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
    float4 m_60 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3207 = false;
    bool _2452 = false;
    bool _903 = false;
    bool _711 = false;
    bool _335 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3460 = as_type<float>(_119);
        out.gl_Position.z = _3460;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3530 = as_type<float>(_157);
        out.gl_Position.z = _3530;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = in.m_53.x;
    float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _163 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _169 = _163 * _161;
    float _171 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _175 = _171 * _167;
    float _177 = _173 * 6.283185482025146484375;
    float _179 = floor(_173);
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[20].y, _175);
    int _183 = as_type<int>(_165) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_165) & 2;
    bool _189 = _187 != 0;
    float _191 = _177 * 0.15915493667125701904296875;
    bool _193 = !_189;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = floor(_181);
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _181 * 6.283185482025146484375;
    bool _205 = !_185;
    float _207 = _205 ? (-0.5) : 0.5;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _215 = _213 != 0;
    float _217 = _203 * 0.15915493667125701904296875;
    bool _219 = !_201;
    int _221 = _219 ? 0 : 1;
    float _223 = _191 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = -_179;
    float _229 = _173 + _227;
    bool _231 = !_211;
    int _233 = _231 ? 0 : 1;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _237 = abs(_233);
    float _239 = _217 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = -_197;
    float _245 = _181 + _243;
    bool _247 = _229 < 0.5;
    float _249 = float(_247);
    float _251 = -_229;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _255 = !_215;
    int _257 = _255 ? 0 : 1;
    int _259 = abs(_221);
    float _261 = -_249;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = fma(_225, 0.5, 0.5);
    int _267 = abs(_257);
    float _269 = -_265;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = float(_237);
    float _275 = fma(_241, 0.5, 0.5);
    bool _277 = _245 < 0.5;
    float _279 = float(_277);
    float _281 = -_245;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _285 = float(_259);
    float _287 = abs(_253);
    float _289 = _273 * _287;
    float _291 = float(_267);
    float _293 = -_279;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _297 = -_275;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _301 = abs(_283);
    float _303 = _273 * _301;
    float _305 = fma(_285, _271, _289);
    float _307 = fma(_285, _299, _303);
    float _309 = abs(_263);
    float _311 = fma(_291, _309, _305);
    float _313 = abs(_295);
    float _315 = fma(_291, _313, _307);
    bool _317 = !_235;
    float _333;
    if (!_317)
    {
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _321 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        float _337 = float(_103);
        float _339 = 1.0 / _337;
        float _341 = _137 * _339;
        _333 = _341;
    }
    _335 = false;
    float _343 = _333;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _343 + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _365;
    float _369 = 1.0 / _351;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _375 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _377 = isnan(_343);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = 1.0 / _355;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = _343 + _389;
    bool _393 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _395 = isnan(_343);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _359;
    float _407 = _391 * _369;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = _343 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = _343 + _413;
    bool _417 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _419 = isnan(_343);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = 1.0 / _363;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _431;
    float _435 = _347 * _387;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _439 = _343 + _437;
    bool _441 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _443 = isnan(_343);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _455 = 1.0 / _367;
    float _457 = _411 * _405;
    float _459 = -_427;
    float _461 = _459 + 1.0;
    float _463 = -_451;
    float _465 = _463 + 1.0;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _467;
    float _471 = _451 * _461;
    bool _473 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _475 = isnan(_343);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = 1.0 / _433;
    float _487 = _439 * _429;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _491 = _343 + _489;
    float _493 = fma(_469, _407, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _495 = 1.0 / _373;
    float _497 = _415 * _455;
    bool _499 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _501 = isnan(_343);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = _491 * _485;
    float _513 = _509 * _465;
    float _515 = -_509;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _521 = _343 + _519;
    float _523 = _483 * _517;
    float _525 = -_483;
    float _527 = _525 + 1.0;
    float _529 = _521 * _495;
    bool _531 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _533 = isnan(_343);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _543;
    float _547 = _385 * _527;
    float _549 = -_385;
    float _551 = _549 + 1.0;
    bool _553 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _555 = isnan(_343);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = fma(_545, _407, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _567 = -_541;
    float _569 = _567 + 1.0;
    float _571 = _541 * _551;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _577 = -_563;
    float _579 = _577 + 1.0;
    float _581 = _563 * _569;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _587;
    float _591 = _403 * _579;
    float _593 = -_403;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _597;
    float _601 = fma(_575, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _603 = _493 * _591;
    float _605 = _565 * _591;
    float _607 = fma(_585, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[143].x, _603);
    float _615 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[143].y, _605);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _621 = fma(_589, _457, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _623 = fma(_599, _457, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _625 = fma(_601, _581, _613);
    float _627 = fma(_607, _581, _615);
    float _629 = fma(_611, _487, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _631 = fma(_619, _487, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _637;
    float _641 = fma(_621, _571, _625);
    float _643 = fma(_623, _571, _627);
    float _645 = fma(_635, _497, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _647 = fma(_639, _497, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _657 = fma(_629, _547, _641);
    float _659 = fma(_631, _547, _643);
    float _661 = fma(_651, _529, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _663 = fma(_655, _529, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _669;
    float _673 = fma(_645, _523, _657);
    float _675 = fma(_647, _523, _659);
    float _677 = fma(_667, _511, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _679 = fma(_671, _511, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _681 = fma(_661, _513, _673);
    float _683 = fma(_663, _513, _675);
    float _685 = fma(_677, _471, _681);
    float _687 = fma(_679, _471, _683);
    float _689 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[150].x, _685);
    float _691 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[150].y, _687);
    bool _693 = !_453;
    float _709;
    if (!_693)
    {
        float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _697 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _701 = _699 * _695;
        float _703 = floor(_701);
        float _705 = -_703;
        float _707 = _701 + _705;
        _709 = _707;
        _711 = true;
    }
    else
    {
        float _713 = float(_103);
        float _715 = 1.0 / _713;
        float _717 = _137 * _715;
        _709 = _717;
    }
    _711 = false;
    float _719 = _709;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _723 = _719 + _721;
    bool _725 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _727 = isnan(_719);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _739 = _719 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _749 = 1.0 / _743;
    bool _751 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _753 = 1.0 / _747;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _755;
    float _759 = _723 * _749;
    bool _761 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _763 = isnan(_719);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -_735;
    float _775 = _773 + 1.0;
    bool _777 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _779 = isnan(_719);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = fma(_757, _759, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _791 = _787 * _775;
    float _793 = -_787;
    float _795 = _793 + 1.0;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _801;
    float _805 = _739 * _753;
    float _807 = _771 * _795;
    float _809 = fma(_799, _759, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _811 = fma(_803, _759, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _813 = -_771;
    float _815 = _813 + 1.0;
    float _817 = _789 * _807;
    float _819 = _809 * _807;
    float _821 = _811 * _807;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _835 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[107].x, _819);
    float _837 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[107].y, _817);
    float _839 = fma(_825, _805, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _841 = fma(_829, _805, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _843 = fma(_833, _805, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _845 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[107].z, _821);
    float _847 = fma(_839, _791, _835);
    float _849 = fma(_841, _791, _837);
    float _851 = fma(_843, _791, _845);
    float _853 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[109].x, _847);
    float _855 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[109].y, _849);
    float _857 = in.m_58.x;
    float _859 = in.m_58.y;
    float _861 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[109].z, _851);
    float _863 = _853 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _865 = _855 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _867 = _861 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _871;
    out.m_60.y = _873;
    out.m_60.z = _875;
    out.m_60.w = _869;
    float _877 = _691 * _859;
    float _879 = _689 * _857;
    bool _881 = !_751;
    float _899;
    float _901;
    if (!_881)
    {
        float _883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _885 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _887 = float(_103);
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[11].z, _137);
        float _891 = _889 * _883;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _887;
        _901 = _897;
        _903 = true;
    }
    else
    {
        float _905 = float(_103);
        float _907 = 1.0 / _905;
        float _909 = _137 * _907;
        _899 = _905;
        _901 = _909;
    }
    _903 = false;
    float _911 = _899;
    float _913 = _901;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _917 = int(_915);
    float _919 = in.m_46.x;
    float _921 = in.m_46.y;
    float _923 = in.m_46.z;
    float _925 = in.m_62.x;
    float _927 = in.m_62.y;
    float _929 = in.m_62.z;
    float _931 = in.m_62.w;
    float _933 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _935 = int(_933);
    float _937 = float(_917);
    float _939 = 1.0 / _911;
    float _941 = float(uint(_935));
    float _943 = 1.0 / _937;
    int _945 = ~_935;
    int _947 = _945 + 1;
    float _949 = _921 * _927;
    float _951 = 1.0 / _941;
    float _953 = fma(_919, _925, _949);
    float _955 = fma(_923, _929, _953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _959 = _913 + _957;
    float _961 = _943 * _137;
    float _963 = _955 + _931;
    float _965 = trunc(_961);
    int _967 = int(_965);
    int _969 = as_type<int>(_951) + (-2);
    float _971 = float(uint(_967));
    float _973 = as_type<float>(_969) * _971;
    float _975 = trunc(_973);
    float _977 = precise::max(_975, 0.0);
    uint _980 = uint(_977);
    float _982 = float(_967);
    int _984 = _947 * int(_980);
    int _986 = _984 + _967;
    float _988 = float(uint(_986));
    float _990 = as_type<float>(_969) * _988;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _994 = _992 != 0;
    bool _996 = !_994;
    float _998 = _996 ? 7.345489978790283203125 : 1.0;
    float _1000 = trunc(_990);
    float _1002 = precise::max(_1000, 0.0);
    uint _1004 = uint(_1002);
    float _1006 = _998 * _159;
    float _1008 = floor(_1006);
    int _1010 = int(_980) + int(_1004);
    float _1012 = float(_935);
    int _1014 = _947 * _1010;
    int _1016 = _1014 + _967;
    bool _1018 = _982 >= _1012;
    bool _1020 = isnan(_982);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(_1012);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_1008;
    float _1032 = _1006 + _1030;
    int _1034 = _935 + (-1);
    bool _1036 = uint(_1016) >= uint(_935);
    float _1038 = trunc(_1028);
    int _1040 = int(_1038);
    float _1042 = _1032 * _1012;
    bool _1044 = !_1036;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = _935 == 0;
    int _1050 = ~_1010;
    int _1052 = _1050 + _1046;
    int _1054 = _1052 + 1;
    float _1056 = trunc(_1042);
    int _1058 = int(_1056);
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1070 = _1068 != 0;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1074 = _1072 != 0;
    int _1076 = _935 * _1054;
    int _1078 = _1076 + _967;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1082 = _1080 != 0;
    bool _1084 = !_1074;
    int _1086 = _1084 ? 0 : 1;
    int _1088 = ~_1040;
    int _1090 = _1088 + 1;
    int _1092 = _1090 + 1;
    bool _1094 = !_1048;
    int _1096 = _1094 ? _1078 : (-1);
    float _1098 = _1012 * _137;
    int _1100 = abs(_1086);
    bool _1102 = !_1066;
    int _1104 = _1102 ? 0 : 1;
    int _1106 = _1096 * _1092;
    float _1108 = _1098 * _939;
    int _1110 = _1058 * _1100;
    int _1112 = _1110 + _967;
    int _1114 = abs(_1104);
    int _1116 = _1040 * _1034;
    int _1118 = _1116 + _1106;
    float _1120 = trunc(_1108);
    int _1122 = int(_1120);
    float _1124 = in.m_64.x;
    float _1126 = in.m_64.y;
    float _1128 = in.m_64.z;
    float _1130 = in.m_64.w;
    bool _1132 = !_1062;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = _1118 * _1114;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1140 = _1138 != 0;
    float _1142 = in.m_66.x;
    float _1144 = in.m_66.y;
    float _1146 = in.m_66.z;
    float _1148 = in.m_66.w;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    float _1158 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1160 = log2(_1158);
    int _1162 = abs(_1134);
    bool _1164 = !_1070;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = in.m_53.y;
    bool _1170 = !_1082;
    int _1172 = _1170 ? 0 : 1;
    int _1174 = abs(_1166);
    int _1176 = _1122 * _1162;
    int _1178 = _1176 + _1136;
    int _1180 = abs(_1172);
    int _1182 = ~_935;
    int _1184 = _1182 + 1;
    int _1186 = _1112 * _1174;
    int _1188 = _1186 + _1178;
    bool _1190 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1192 = isnan(1.0);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1198 = _1194 || _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1202 = 1.0 + _1200;
    bool _1204 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1206 = isnan(0.0);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1212 = _1208 || _1210;
    float _1214 = _921 * _1126;
    int _1216 = _1058 * _1180;
    int _1218 = _1216 + _1188;
    float _1220 = _1160 * _137;
    float _1222 = _921 * _1144;
    float _1224 = fma(_919, _1124, _1214);
    float _1226 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1228 = _159 * 2.0;
    float _1230 = fma(_919, _1142, _1222);
    float _1232 = float(uint(_1218));
    float _1234 = exp2(_1220);
    float _1236 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1238 = as_type<float>(_969) * _1232;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1240;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1246 = _159 > 0.5;
    float _1248 = floor(_1228);
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1252 = -_1244;
    float _1254 = fma(_1226, 2.0, _1252);
    float _1256 = float(uint(_1112));
    float _1258 = fma(_1236, -2.0, _1250);
    float _1260 = trunc(_1238);
    float _1262 = precise::max(_1260, 0.0);
    uint _1264 = uint(_1262);
    float _1266 = -_1234;
    float _1268 = _1266 + 1.0;
    float _1270 = -_207;
    int _1272 = _1246 ? as_type<int>(_1270) : as_type<int>(_207);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1276 = _1168 > 0.5;
    float _1278 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1258);
    float _1280 = _1212 ? _1268 : 0.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1286 = 1.0 / _1202;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1290 = -_195;
    int _1292 = _1276 ? as_type<int>(_1290) : as_type<int>(_195);
    float _1294 = as_type<float>(_969) * _1256;
    bool _1296 = _1248 > 0.0;
    float _1298 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1288);
    bool _1300 = _1248 >= 0.0;
    bool _1302 = isnan(_1248);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1274);
    int _1312 = _1184 * int(_1264);
    int _1314 = _1312 + _1218;
    float _1316 = in.m_53.z;
    float _1318 = 1.0 / _1284;
    float _1320 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1310);
    float _1322 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1298);
    float _1324 = float(uint(_1314));
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1328 = _913 + _1326;
    bool _1330 = !_1152;
    float _1332 = _1330 ? _207 : as_type<float>(_1272);
    float _1334 = -_1322;
    float _1336 = _1334 + 1.0;
    float _1338 = as_type<float>(_969) * _1324;
    bool _1340 = !_1156;
    float _1342 = _1340 ? _195 : as_type<float>(_1292);
    float _1344 = _1168 * 2.0;
    float _1346 = -_137;
    float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1254);
    float _1350 = trunc(_1338);
    float _1352 = precise::max(_1350, 0.0);
    uint _1354 = uint(_1352);
    float _1356 = _963;
    if (_1198)
    {
        float _1358 = _1280 * _1286;
        _139 = _1358;
    }
    float _1360 = _139;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1372 = _1370 != 0;
    float _1374 = fma(_923, _1128, _1224);
    float _1376 = _1328 * _1318;
    float _1378 = _1374 + _1130;
    float _1380 = 1.0 / _1242;
    float _1382 = fma(_923, _1146, _1230);
    int _1384 = ~_935;
    int _1386 = _1384 + 1;
    float _1388 = _1316 * 2.0;
    int _1390 = _1308 ? 0 : 1;
    float _1392 = _1168 + _1316;
    float _1394 = _1382 + _1148;
    float _1396 = _1342 + (-0.5);
    float _1398 = floor(_1344);
    int _1400 = int(_1264) + int(_1354);
    float _1402 = _159 + _1168;
    int _1404 = ~_1390;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = _1168 + (-0.5);
    int _1412 = _1408;
    float _1414 = _1394;
    if (!_1296)
    {
        int _1416 = ~_1390;
        int _1418 = _1416 + 1;
        _1412 = _1418;
    }
    int _1420 = _1412;
    float _1422 = floor(_1388);
    int _1424 = _1386 * _1400;
    int _1426 = _1424 + _1218;
    float _1428 = _1402 + (-1.0);
    float _1430 = _959 * _1380;
    float _1432 = _1392 + (-1.0);
    bool _1434 = uint(_1426) >= uint(_935);
    float _1436 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1438 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1440 = !_1434;
    int _1442 = _1440 ? 0 : (-1);
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1444;
    bool _1448 = _1398 >= 0.0;
    bool _1450 = isnan(_1398);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1458;
    int _1462 = _1456 ? 0 : 1;
    float _1464 = fma(_1460, _1430, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1466 = _1422 >= 0.0;
    bool _1468 = isnan(_1422);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1476;
    bool _1480 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1482 = isnan(_913);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1488 = _1484 || _1486;
    float _1490 = float(_1488);
    int _1492 = _1474 ? 0 : 1;
    bool _1494 = _1422 > 0.0;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1502 = _1500 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1504 = _1398 > 0.0;
    float _1506 = fma(_1478, _1430, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1508 = fma(_1446, _1430, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1510 = fma(_1502, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1512 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1514 = isnan(_913);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -_1490;
    float _1526 = _1524 + 1.0;
    int _1528 = ~_1400;
    int _1530 = _1528 + _1442;
    int _1532 = _1530 + 1;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1538 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1540 = isnan(_913);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1522 * _1526;
    float _1552 = -_1522;
    float _1554 = _1552 + 1.0;
    int _1556 = _935 * _1532;
    int _1558 = _1556 + _1218;
    float _1560 = -_1396;
    float _1562 = -_1278;
    float _1564 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1562);
    float _1566 = _1332 + 0.5;
    float _1568 = _1548 * _1554;
    float _1570 = -_1548;
    float _1572 = _1570 + 1.0;
    bool _1574 = !_1048;
    int _1576 = _1574 ? _1558 : (-1);
    float _1578 = fma(_1498, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1580 = _1464 * _1568;
    float _1582 = _1506 * _1568;
    float _1584 = trunc(_1294);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    float _1590 = _1508 * _1568;
    int _1592 = _1576 >> 31;
    float _1594 = fma(_1536, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1596 = ~_935;
    int _1598 = _1596 + 1;
    float _1600 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1580);
    int _1602 = _1592 & 3;
    float _1604 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1348);
    float _1606 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1582);
    float _1608 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1590);
    int _1610 = _1576 + _1602;
    bool _1612 = !_1368;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1594, _1550, _1608);
    int _1618 = _1610 >> 2;
    int _1620 = _1598 * int(_1588);
    int _1622 = _1620 + _1112;
    int _1624 = abs(_1614);
    int _1626 = _1618 << 4;
    int _1628 = _1626 + 368;
    float _1630 = float(uint(_1622));
    float _1632 = fma(_1578, _1550, _1600);
    float _1634 = -_1320;
    float _1636 = _1634 + 1.0;
    int _1638 = ~_1462;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    uint _1644 = uint(int(uint(_1628) >> uint(2)));
    uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
    int _1648 = int(_1644) & 3;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[int(_1646)][_1648];
    int _1652 = int(_1644) + 1;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    int _1656 = _1652 & 3;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[int(_1654)][_1656];
    float _1660 = as_type<float>(_969) * _1630;
    int _1662 = _1642;
    if (!_1504)
    {
        int _1664 = ~_1462;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    float _1670 = fma(_1342, _1336, _1564);
    float _1672 = -_1636;
    float _1674 = fma(_1332, _1672, _1604);
    int _1676 = _1576 & 3;
    bool _1678 = _1676 != 0;
    float _1680 = fma(_1510, _1550, _1606);
    float _1682 = trunc(_1660);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = _1628 + 8;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    int _1706 = ~_1492;
    int _1708 = _1706 + 1;
    int _1710 = _1708 + 1;
    out.m_68.x = _1674;
    out.m_68.y = _1670;
    int _1712 = _1710;
    if (!_1494)
    {
        int _1714 = ~_1492;
        int _1716 = _1714 + 1;
        _1712 = _1716;
    }
    int _1718 = _1712;
    float _1720 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1680);
    float _1722 = float(_1420);
    bool _1724 = uint(_1676) > 1u;
    float _1726 = float(_1624);
    bool _1728 = !_1364;
    int _1730 = _1728 ? 0 : 1;
    int _1732 = _1576 & 3;
    bool _1734 = _1732 != 0;
    float _1736 = _1726 * _1722;
    int _1738 = abs(_1730);
    int _1740 = ~_935;
    int _1742 = _1740 + 1;
    float _1744 = _1736 * (-2.0);
    int _1746 = _1734 ? 0 : 1;
    int _1748 = int(_1588) + int(_1686);
    float _1750 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1616);
    int _1752 = ~_1746;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    int _1758 = _1756;
    if (!_1724)
    {
        int _1760 = ~_1746;
        int _1762 = _1760 + 1;
        _1758 = _1762;
    }
    int _1764 = _1758;
    float _1766 = float(_1738);
    float _1768 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1632);
    int _1770 = _1742 * _1748;
    int _1772 = _1770 + _1112;
    bool _1774 = !_1678;
    int _1776 = _1774 ? 0 : 1;
    int _1778 = abs(_1764);
    bool _1780 = _1676 != 3;
    int _1782 = abs(_1776);
    float _1784 = float(_1718);
    bool _1786 = uint(_1676) >= 2u;
    float _1788 = _1766 * _1784;
    bool _1790 = uint(_1772) >= uint(_935);
    int _1792 = ~_1778;
    int _1794 = _1792 + 1;
    int _1796 = _1794 + 1;
    int _1798 = _1786 ? 0 : 1;
    bool _1800 = !_1790;
    int _1802 = _1800 ? 0 : (-1);
    int _1804 = _1796 * as_type<int>(_1658);
    int _1806 = ~_1782;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    bool _1812 = _1676 != 3;
    int _1814 = ~_1798;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = in.m_70.x;
    float _1822 = in.m_70.y;
    float _1824 = in.m_70.z;
    int _1826 = _1818;
    float _1828 = _1768;
    if (_1780)
    {
        int _1830 = ~_1798;
        int _1832 = _1830 + 1;
        _1826 = _1832;
    }
    int _1834 = _1826;
    int _1836 = ~_1748;
    int _1838 = _1836 + _1802;
    int _1840 = _1838 + 1;
    int _1842 = _1810 * as_type<int>(_1650);
    int _1844 = _1842 + _1804;
    bool _1846 = !_1812;
    int _1848 = _1846 ? 0 : (-1);
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1852 = _1378 + _1850;
    int _1854 = abs(_1834);
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1858 = _1394 + _1856;
    int _1860 = abs(_1848);
    float _1862 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1866 = _963 + _1864;
    bool _1868 = !_1140;
    int _1870 = _1868 ? 0 : 1;
    int _1872 = _935 * _1840;
    int _1874 = _1872 + _1112;
    int _1876 = ~_1854;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1862);
    int _1884 = abs(_1870);
    float _1886 = _1788 * (-2.0);
    int _1888 = ~_1860;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = _1880 * as_type<int>(_1696);
    int _1896 = _1894 + _1844;
    float _1898 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1882);
    int _1900 = _1892 * as_type<int>(_1704);
    int _1902 = _1900 + _1896;
    float _1904 = fma(_1438, _1744, _1438);
    float _1906 = _1852 * _1852;
    int _1908 = ~_1884;
    int _1910 = _1908 + 1;
    int _1912 = _1910 + 1;
    float _1914 = fma(_1744, _1822, _1822);
    bool _1916 = _1898 >= 0.0;
    float _1918 = fma(_1866, _1866, _1906);
    float _1920 = fma(_1436, _1886, _1436);
    int _1922 = _1902 * _1912;
    bool _1924 = !_1048;
    int _1926 = _1924 ? _1874 : (-1);
    float _1928 = fma(_1858, _1858, _1918);
    float _1930 = fma(_1886, _1820, _1820);
    float _1932 = _1750 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1934 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1914);
    int _1936 = _1926 * _1884;
    int _1938 = _1936 + _1922;
    float _1940 = _1768 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1942 = rsqrt(_1928);
    float _1944 = _1720 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1946 = _1824;
    if (_1916)
    {
        _1828 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1948 = _1828;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1956 = as_type<int>(_1948);
    if (_1916)
    {
        float _1958 = _1948 * 5.0;
        _1956 = as_type<int>(_1958);
    }
    int _1960 = _1956;
    float _1962 = float(_1938);
    if (_1916)
    {
        out.m_49.x = 0.0;
    }
    bool _1964 = !_1372;
    int _1966 = _1964 ? 0 : 1;
    float _1968 = fma(_1904, _1360, _1934);
    float _1970 = _159 + (-0.5);
    out.m_72.x = _1950;
    out.m_72.y = _1954;
    out.m_72.z = _1952;
    int _1972 = abs(_1966);
    float _1974 = _1852 * _1942;
    if (_1916)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6253 = as_type<float>(_1960);
        out.gl_Position.z = _6253;
    }
    float _1976 = _1866 * _1942;
    out.m_74.x = _1962;
    if (_1916)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1978 = -_1974;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1378);
    float _1982 = _1858 * _1942;
    float _1984 = -_1976;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1990 = _1980 + _1988;
    float _1992 = float(_1972);
    float _1994 = -_1982;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2000 = _1986 + _1998;
    float _2002 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2004 = float(_1668);
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2008 = _1996 + _2006;
    float _2010 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1930);
    float _2012 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2002);
    float _2014 = _159 + _1316;
    float _2016 = _1992 * _2004;
    float _2018 = -_1974;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _2022 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2012);
    float _2024 = fma(_1920, _1360, _2010);
    float _2026 = _2014 + (-1.0);
    float _2028 = _2016 * (-2.0);
    bool _2030 = _2022 >= 0.0;
    float _2032 = -_1976;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1866);
    float _2036 = _2020 * _2020;
    float _2038 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2040 = fma(_2028, _1824, _1824);
    float _2042 = _1316 + (-0.5);
    float _2044 = fma(_2034, _2034, _2036);
    float _2046 = -_1982;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1858);
    float _2050 = fma(_2038, _2028, _2038);
    float _2052 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2040);
    float _2054 = _2024 * 0.15915493667125701904296875;
    float _2056 = fma(_2048, _2048, _2044);
    float _2058 = _1982;
    float _2060 = _2008;
    float _2062 = _1980;
    if (_2030)
    {
        _1946 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2064 = _1946;
    float _2066 = fma(_2050, _1360, _2052);
    float _2068 = _2054 * 6.283185482025146484375;
    float _2070 = sin(_2068);
    float _2072 = _1968 * 0.15915493667125701904296875;
    int _2074 = as_type<int>(_2064);
    if (_2030)
    {
        out.m_49.x = 0.0;
    }
    if (_2030)
    {
        float _2076 = _2064 * 5.0;
        _2074 = as_type<int>(_2076);
    }
    int _2078 = _2074;
    float _2080 = _315 * _877;
    float _2082 = sqrt(_2056);
    if (_2030)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6444 = as_type<float>(_2078);
        out.gl_Position.z = _6444;
    }
    float _2084 = _2054 * 6.283185482025146484375;
    float _2086 = cos(_2084);
    float _2088 = _2072 * 6.283185482025146484375;
    float _2090 = sin(_2088);
    float _2092 = _2072 * 6.283185482025146484375;
    float _2094 = cos(_2092);
    float _2096 = _2066 * 0.15915493667125701904296875;
    if (_2030)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2098 = _2096 * 6.283185482025146484375;
    float _2100 = cos(_2098);
    float _2102 = _1942 * _2082;
    float _2104 = _2080 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2106 = _311 * _879;
    float _2108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2110 = _2086 * _2094;
    float _2112 = _2102 * _2104;
    float _2114 = _2106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2116 = _2096 * 6.283185482025146484375;
    float _2118 = sin(_2116);
    float _2120 = _2086 * _2090;
    float _2122 = _2108 * _2112;
    float _2124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2126 = _2102 * _2114;
    float _2128 = _2070 * _2090;
    float _2130 = _2070 * _2094;
    float _2132 = _2086 * _2100;
    float _2134 = _2124 * _2126;
    float _2136 = _2094 * _2100;
    float _2138 = _2070 * _2100;
    float _2140 = _2132 * _2122;
    float _2142 = _2090 * _2100;
    float _2144 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2146 = _2144 * 0.5;
    float _2148 = fma(_2118, _2110, _2128);
    float _2150 = -_2122;
    float _2152 = _2118 * _2150;
    float _2154 = -_2130;
    float _2156 = fma(_2118, _2120, _2154);
    float _2158 = -_2120;
    float _2160 = fma(_2118, _2130, _2158);
    float _2162 = fma(_2148, _2134, _2140);
    float _2164 = fma(_2136, _2134, _2152);
    float _2166 = _2138 * _2122;
    float _2168 = fma(_2118, _2128, _2110);
    float _2170 = fma(_2156, _2146, _2162);
    float _2172 = fma(_2142, _2146, _2164);
    float _2174 = fma(_2160, _2134, _2166);
    float _2176 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2178 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2180 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2182 = fma(_2168, _2146, _2174);
    float _2184 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2178);
    float _2188 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2180);
    float _2190 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2192 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2176);
    float _2194 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2186);
    float _2196 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2188);
    float _2198 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    float _2200 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2190);
    float _2202 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2204 = _2196 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2206 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2208 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2210 = _963 + _2202;
    float _2212 = _1394 + _2204;
    float _2214 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2216 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2220 = _2210 + _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2224 = _2212 + _2222;
    float _2226 = -_2118;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2206);
    float _2230 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2232 = _2220 * _2220;
    float _2234 = _2224 * _2224;
    float _2236 = -_2118;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2208);
    float _2240 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2242 = -_2118;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2214);
    float _2246 = _2232 + _2234;
    float _2248 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2192);
    float _2250 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2198);
    float _2252 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2254 = sqrt(_2246);
    float _2256 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2258 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2260 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2262 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2200);
    float _2264 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2252);
    float _2266 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2256);
    float _2268 = _1378 + _2260;
    float _2270 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2258);
    bool _2272 = _2254 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2274 = _2240;
    float _2276 = _2260;
    float _2278 = _2142;
    float _2280 = _2200;
    float _2282 = _2232;
    float _2284 = _2250;
    if (!_2272)
    {
        _2274 = _2234;
    }
    float _2286 = _2274;
    float _2288 = _2286;
    if (!_2272)
    {
        _2276 = _2210;
    }
    float _2290 = _2276;
    float _2292 = _2290;
    if (!_2272)
    {
        _2278 = _2212;
    }
    float _2294 = _2278;
    float _2296 = _2294;
    if (!_2272)
    {
        _2280 = _2268;
    }
    float _2298 = _2280;
    bool _2300 = !_2272;
    float _2302 = _2298;
    if (!_2300)
    {
        float _2304 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2308 = _2254 + _2306;
        float _2310 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2312 = rsqrt(_2246);
        float _2314 = _2308 * _2304;
        float _2316 = _2314 * 0.15915493667125701904296875;
        float _2318 = _2316 * 6.283185482025146484375;
        float _2320 = sin(_2318);
        float _2322 = _2316 * 6.283185482025146484375;
        float _2324 = cos(_2322);
        float _2326 = fma(_2320, _2310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2328 = _2312 * _2326;
        float _2330 = _2324 + (-1.0);
        float _2332 = fma(_2220, _2328, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2334 = fma(_2224, _2328, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2336 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2340 = _2332 + _2338;
        float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2344 = _2334 + _2342;
        float _2346 = fma(_2268, _2324, _2336);
        float _2348 = _2340 * _2340;
        float _2350 = _2344 * _2344;
        _2302 = _2346;
        _2282 = _2348;
        _2288 = _2350;
        _2296 = _2334;
        _2292 = _2332;
    }
    float _2352 = _2302;
    float _2354 = _2282;
    float _2356 = _2288;
    float _2358 = _2296;
    float _2360 = _2292;
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2364 = _2352 + _2362;
    float _2366 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2368 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2238);
    float _2370 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2372 = fma(_2364, _2364, _2354);
    float _2374 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2244);
    float _2376 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2264);
    float _2378 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2266);
    float _2380 = _2372 + _2356;
    float _2382 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    float _2384 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2386 = _2370 * _2366;
    float _2388 = _2370 * _2368;
    float _2390 = _2370 * _2374;
    float _2392 = sqrt(_2380);
    float _2394 = fma(_2384, _2248, _2386);
    float _2396 = fma(_2384, _2250, _2388);
    float _2398 = fma(_2384, _2262, _2390);
    float _2400 = _2376 + _2394;
    float _2402 = _2378 + _2396;
    float _2404 = _2382 + _2398;
    out.m_76.x = _2400;
    out.m_76.y = _2402;
    out.m_76.z = _2404;
    bool _2406 = _2392 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2408 = isnan(_2392);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2414 = _2410 || _2412;
    float _2416 = _2360;
    if (!_2414)
    {
        _2284 = 1.0;
    }
    float _2418 = _2284;
    bool _2420 = !_2414;
    float _2422 = _2418;
    if (!_2420)
    {
        bool _2424 = _2392 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2426 = isnan(_2392);
        bool _2428 = _2424 || _2426;
        bool _2430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2432 = _2428 || _2430;
        if (!_2432)
        {
            float _2434 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2436 = _2392 + _2434;
            float _2438 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2440 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2438;
            float _2442 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2444 = _2442 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2446 = 1.0 / _2440;
            float _2448 = _2436 * _2446;
            float _2450 = fma(_2448, _2444, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2422 = _2450;
            _2452 = true;
        }
        else
        {
            bool _2454 = _2392 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2456 = isnan(_2392);
            bool _2458 = _2454 || _2456;
            bool _2460 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2462 = _2458 || _2460;
            if (!_2462)
            {
                float _2464 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2466 = _2392 + _2464;
                float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2470 = _2468 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2472 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2474 = _2472 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2476 = 1.0 / _2470;
                float _2478 = _2466 * _2476;
                float _2480 = fma(_2478, _2474, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2422 = _2480;
                _2452 = true;
            }
            else
            {
                _2422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2452 = false;
    float _2482 = _2422;
    float _2484 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2488 = _2358 + _2486;
    float _2490 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2484);
    float _2492 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2494 = fma(_2488, _2482, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2496 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2490);
    bool _2498 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan(0.5);
    bool _2506 = _2502 || _2504;
    bool _2508 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan(0.5);
    bool _2516 = _2512 || _2514;
    float _2518 = _2496 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2520 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2492);
    float _2522 = 1.0 / _2518;
    float _2524 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2520);
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2528 = _2526 + _2518;
    float _2530 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2532 = _2352 + _2530;
    float _2534 = fma(_2532, _2482, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2536 = _2528 * _2522;
    float _2538 = _2536 * 0.5;
    float _2540 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2542 = _2360 + _2540;
    float _2544 = -_1974;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2534);
    float _2548 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2516)
    {
        _2416 = 1.0;
    }
    float _2550 = _2416;
    float _2552 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2554 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2552);
    float _2556 = fma(_2542, _2482, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2558 = -_1982;
    float _2560 = fma(_2558, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2494);
    float _2562 = _2560;
    float _2564 = _2550;
    if (_2506)
    {
        _2058 = _2546;
    }
    float _2566 = _2058;
    float _2568 = -_1976;
    float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2556);
    float _2572 = 1.0 / _2554;
    float _2574 = _2566;
    float _2576 = _2570;
    if (!_2506)
    {
        float _2578 = _1990 * _1990;
        float _2580 = 1.0 / _2102;
        float _2582 = -_1378;
        float _2584 = _2582 + _2534;
        float _2586 = -_1394;
        float _2588 = _2586 + _2494;
        float _2590 = fma(_2000, _2000, _2578);
        float _2592 = fma(_2008, _2008, _2590);
        float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2596 = sqrt(_2592);
        float _2598 = precise::min(_2596, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2600 = _2598 * _2594;
        float _2602 = -_963;
        float _2604 = _2602 + _2556;
        float _2606 = _2600 * _2580;
        float _2608 = fma(_2604, _2606, _1986);
        float _2610 = fma(_2584, _2606, _1980);
        float _2612 = fma(_2588, _2606, _1996);
        _2574 = _2610;
        _2576 = _2608;
        _2562 = _2612;
        _2060 = _2596;
    }
    float _2614 = _2574;
    float _2616 = _2576;
    float _2618 = _2562;
    float _2620 = _2060;
    float _2622 = _2620;
    if (_2516)
    {
        _1414 = 1.0;
    }
    float _2624 = _1414;
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2628 = _2572 * _2626;
    float _2630 = _2624;
    if (!_2516)
    {
        float _2632 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2634 = _2632 * 0.15915493667125701904296875;
        float _2636 = _2634 * 6.283185482025146484375;
        float _2638 = cos(_2636);
        float _2640 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2642 = _2640 * 0.15915493667125701904296875;
        float _2644 = _2634 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = 1.0 / _2638;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2646 * _2648;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = _2652 * _2654;
        float _2662 = 1.0 / _2660;
        float _2664 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2666 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2664;
        float _2668 = 1.0 / _2666;
        float _2670 = _2658 * _2662;
        float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2674 = fma(_2628, _2670, _2672);
        float _2676 = _2674 * _2668;
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        _2062 = _2642;
        _2622 = _2634;
        _2564 = _2678;
    }
    float _2680 = _2062;
    float _2682 = _2622;
    float _2684 = _2564;
    float _2686 = _2680;
    float _2688 = _2682;
    if (!_2516)
    {
        float _2690 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2692 = _2690 * 0.15915493667125701904296875;
        float _2694 = _2692 * 6.283185482025146484375;
        float _2696 = cos(_2694);
        float _2698 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2700 = _2698 * 0.15915493667125701904296875;
        float _2702 = _2692 * 6.283185482025146484375;
        float _2704 = sin(_2702);
        float _2706 = 1.0 / _2696;
        float _2708 = _2700 * 6.283185482025146484375;
        float _2710 = cos(_2708);
        float _2712 = _2704 * _2706;
        float _2714 = _2700 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        float _2718 = _2710 * _2712;
        float _2720 = 1.0 / _2718;
        float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2724 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2722;
        float _2726 = 1.0 / _2724;
        float _2728 = _2716 * _2720;
        float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2732 = fma(_2628, _2728, _2730);
        float _2734 = _2732 * _2726;
        float _2736 = precise::clamp(_2734, 0.0, 1.0);
        float _2738 = -_2736;
        float _2740 = _2738 + 1.0;
        _2686 = _2706;
        _2630 = _2740;
    }
    float _2742 = _2686;
    float _2744 = _2630;
    float _2746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2748 = _2614 + _2746;
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2752 = _2616 + _2750;
    float _2754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2756 = _2618 + _2754;
    float _2758 = _2748 * _2748;
    float _2760 = fma(_2752, _2752, _2758);
    float _2762 = fma(_2756, _2756, _2760);
    float _2764 = rsqrt(_2762);
    float _2766 = sqrt(_2762);
    float _2768 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2770 = _2752 * _2768;
    float _2772 = _2756 * _2768;
    float _2774 = _2770 * _2770;
    float _2776 = _2772 * _2772;
    float _2778 = _2774 + _2776;
    float _2780 = sqrt(_2778);
    bool _2782 = _2780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2786 = _2780 + _2784;
    float _2788 = _2742;
    float _2790 = _2786;
    float _2792 = _2748;
    float _2794 = _2770;
    if (_2782)
    {
        float _2796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2788 = _2796;
    }
    float _2798 = _2788;
    if (_2782)
    {
        float _2800 = rsqrt(_2778);
        _2688 = _2800;
    }
    float _2802 = _2688;
    float _2804 = _2802;
    if (_2782)
    {
        float _2806 = _2786 * _2798;
        _2790 = _2806;
    }
    float _2808 = _2790;
    if (_2782)
    {
        float _2810 = _2808 * 0.15915493667125701904296875;
        _1356 = _2810;
    }
    float _2812 = _1356;
    float _2814 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2816 = _2756;
    if (_2782)
    {
        float _2818 = _2812 * 6.283185482025146484375;
        float _2820 = sin(_2818);
        _2816 = _2820;
    }
    float _2822 = _2816;
    float _2824 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2826 = precise::max(0.0, _2824);
    float _2828 = _2798;
    float _2830 = _2826;
    if (_2782)
    {
        float _2832 = _2812 * 6.283185482025146484375;
        float _2834 = cos(_2832);
        _2828 = _2834;
    }
    float _2836 = _2828;
    float _2838 = -_2768;
    float _2840 = -_2826;
    float _2842 = fma(_2748, _2838, _2840);
    if (_2782)
    {
        float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2792 = _2844;
    }
    float _2846 = _2792;
    float _2848 = _2846;
    float _2850 = _2822;
    if (_2782)
    {
        float _2852 = fma(_2822, _2846, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2848 = _2852;
    }
    float _2854 = _2848;
    float _2856 = _2854;
    if (!_2782)
    {
        _2850 = _2774;
    }
    float _2858 = _2850;
    float _2860 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2862 = _2858;
    float _2864 = _2836;
    if (_2782)
    {
        float _2866 = _2836 + (-1.0);
        _2830 = _2866;
    }
    float _2868 = _2830;
    float _2870 = _2868;
    if (_2782)
    {
        float _2872 = _2802 * _2854;
        _2548 = _2872;
    }
    float _2874 = _2548;
    if (!_2782)
    {
        _2856 = _2842;
    }
    float _2876 = _2856;
    float _2878 = _2876;
    if (_2782)
    {
        float _2880 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2804 = _2880;
    }
    float _2882 = _2804;
    if (_2782)
    {
        float _2884 = _2770 * _2874;
        _2794 = _2884;
    }
    float _2886 = _2794;
    if (!_2782)
    {
        _2870 = _2772;
    }
    float _2888 = _2870;
    float _2890 = _2888;
    if (_2782)
    {
        float _2892 = _2772 * _2874;
        _2890 = _2892;
    }
    float _2894 = _2890;
    if (_2782)
    {
        float _2896 = fma(_2842, _2836, _2882);
        _2878 = _2896;
    }
    float _2898 = _2878;
    if (_2782)
    {
        float _2900 = _2886 * _2886;
        _2862 = _2900;
    }
    float _2902 = _2862;
    if (!_2782)
    {
        _2864 = _2776;
    }
    float _2904 = _2864;
    float _2906 = _2904;
    if (_2782)
    {
        float _2908 = _2894 * _2894;
        _2906 = _2908;
    }
    float _2910 = _2906;
    float _2912 = fma(_2898, _2898, _2902);
    float _2914 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2916 = _2912 + _2910;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2920 = fma(_2766, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2918);
    float _2922 = precise::clamp(_2920, 0.0, 1.0);
    float _2924 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2914);
    float _2926 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2928 = rsqrt(_2916);
    float _2930 = -_2922;
    float _2932 = _2930 + 1.0;
    float _2934 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2924);
    float _2936 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2938 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2926);
    float _2940 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2942 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2936);
    float _2944 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2938);
    float _2946 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2860);
    float _2948 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2950 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2942);
    float _2952 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2954 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2946);
    float _2956 = abs(_2932);
    float _2958 = log2(_2956);
    float _2960 = -_2948;
    float _2962 = fma(_2960, _2814, 1.0);
    float _2964 = _2950 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2966 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2968 = _2954 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = _2928 * _2886;
    float _2972 = _2928 * _2894;
    float _2974 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2966);
    float _2976 = _2928 * _2898;
    float _2978 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2980 = log2(_2962);
    float _2982 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2974);
    float _2984 = -_2978;
    float _2986 = fma(_2976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2984);
    float _2988 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2982);
    float _2990 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2992 = -_2972;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2986);
    float _2996 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2998 = 1.0 / _2988;
    float _3000 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3002 = fma(_2994, -0.5, 0.5);
    float _3004 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2996);
    float _3006 = fma(_2994, 0.5, 0.5);
    float _3008 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3000);
    float _3010 = _2976 + 1.0;
    float _3012 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3004);
    float _3014 = exp2(_2990);
    float _3016 = fma(_3006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3018 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3008);
    float _3020 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3012);
    float _3022 = _2980 * 0.693147182464599609375;
    float _3024 = fma(_3006, _3016, -0.212114393711090087890625);
    float _3026 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3018);
    float _3028 = sqrt(_3002);
    float _3030 = _3020 * _2998;
    float _3032 = fma(_3006, _3024, 1.570728778839111328125);
    float _3034 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3036 = fma(_3030, 0.5, 0.5);
    float _3038 = -_2976;
    float _3040 = fma(_3014, _3010, _3038);
    float _3042 = _3026 * _2998;
    float _3044 = fma(_3040, 0.5, 0.5);
    float _3046 = fma(_3042, -0.5, 0.5);
    float _3048 = _3028 * 0.636619746685028076171875;
    float3 _8022 = float3(_3036, _3046, _3034);
    float _3050 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8022, float3(0.0), isnan(_8022)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8022, float3(0.0), isnan(_8022)), level(0.0)).x;
    float _3052 = -_3032;
    float _3054 = fma(_3048, _3052, 1.0);
    float3 _8038 = float3(_3036, _3046, _3034);
    float4 _3057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8038, float3(0.0), isnan(_8038)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8038, float3(0.0), isnan(_8038)), level(0.0)).xyzw;
    float _3059 = _3057.x;
    float _3061 = _3057.y;
    float _3063 = _3057.z;
    float _3065 = _3057.w;
    float2 _8055 = float2(_3054, _3044);
    float3 _3069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8055, float2(0.0), isnan(_8055)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8055, float2(0.0), isnan(_8055)), level(0.0)).xyz;
    float _3071 = _3069.x;
    float _3073 = _3069.y;
    float _3075 = _3069.z;
    float _3077 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3079 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3081 = _3020 + _2988;
    float _3083 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3079);
    float _3085 = exp2(_3077);
    float _3087 = _2988 * 0.5;
    float _3089 = _3081 * 0.5;
    float _3091 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3083);
    bool _3093 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3095 = isnan(_2766);
    bool _3097 = _3093 || _3095;
    bool _3099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3101 = _3097 || _3099;
    float _3103 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3091);
    float _3105 = fma(_3026, -0.5, _3087);
    float _3107 = _3103 + _2988;
    out.gl_Position.x = _3020;
    out.gl_Position.y = _3026;
    out.gl_Position.z = _3103;
    out.gl_Position.w = _2988;
    float _3109 = _3107 * 0.5;
    float _3111 = -_3085;
    float _3113 = _3111 + 1.0;
    float _3115 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _3089;
    out.m_78.y = _3105;
    out.m_78.z = _3109;
    out.m_78.w = _2988;
    float _3117 = -_3115;
    float _3119 = _3117 + 1.0;
    float _3121 = _2684 * _2744;
    float _3123 = _3103;
    float _3125 = _3026;
    float _3127 = _3121;
    if (!_3101)
    {
        _3123 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3129 = _3123;
    float _3131 = _3129;
    float _3133 = _3129;
    if (!_3101)
    {
        _3125 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3135 = _3125;
    float _3137 = _3115 * _3050;
    float _3139 = _3065 * _3137;
    float _3141 = _3075 * _3137;
    float _3143 = fma(_3071, _3139, _3059);
    float _3145 = fma(_3073, _3139, _3061);
    float _3147 = _3065 * _3119;
    float _3149 = fma(_3065, _3141, _3063);
    float _3151 = _3121 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3153 = _3135;
    float _3155 = _3135;
    if (!_3101)
    {
        _3127 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3157 = _3127;
    out.m_80.x = _3143;
    out.m_80.y = _3145;
    out.m_80.z = _3149;
    out.m_80.w = _3147;
    bool _3159 = !_3101;
    float _3161 = _3157;
    float _3163 = _3157;
    if (!_3159)
    {
        bool _3165 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3167 = isnan(_2766);
        bool _3169 = _3165 || _3167;
        bool _3171 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3173 = _3169 || _3171;
        if (!_3173)
        {
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3177 = _2766 + _3175;
            float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3181 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3179;
            float _3183 = 1.0 / _3181;
            float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3193 = _3177 * _3183;
            float _3195 = precise::clamp(_3193, 0.0, 1.0);
            float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3199 = _3197 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3201 = fma(_3195, _3191, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3203 = fma(_3195, _3199, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3205 = fma(_3195, _3187, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3155 = _3205;
            _3133 = _3203;
            _3163 = _3201;
            _3207 = true;
        }
        else
        {
            bool _3209 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3211 = isnan(_2766);
            bool _3213 = _3209 || _3211;
            bool _3215 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3217 = _3213 || _3215;
            if (!_3217)
            {
                _3131 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3219 = _3131;
            _3133 = _3219;
            if (!_3217)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3221 = _3153;
            _3155 = _3221;
            if (!_3217)
            {
                _3161 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3223 = _3161;
            bool _3225 = !_3217;
            _3163 = _3223;
            if (!_3225)
            {
                bool _3227 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3229 = isnan(_2766);
                bool _3231 = _3227 || _3229;
                bool _3233 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3235 = _3231 || _3233;
                if (!_3235)
                {
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3239 = _2766 + _3237;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3243 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3241;
                    float _3245 = 1.0 / _3243;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3255 = _3239 * _3245;
                    float _3257 = precise::clamp(_3255, 0.0, 1.0);
                    float _3259 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3263 = fma(_3257, _3253, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3265 = fma(_3257, _3261, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3267 = fma(_3257, _3249, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3155 = _3267;
                    _3133 = _3265;
                    _3163 = _3263;
                    _3207 = true;
                }
                else
                {
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3133 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3163 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3207 = false;
    float _3269 = _3155;
    float _3271 = _3133;
    float _3273 = _3163;
    float _3275 = _3151 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_82.x = 0.0;
    float _3277 = _3269 * 0.586610972881317138671875;
    bool _3279 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _3275;
    float _3281 = fma(_3271, 0.298911988735198974609375, _3277);
    bool _3283 = _2684 > 0.0;
    bool _3285 = isnan(_2684);
    bool _3287 = _3283 || _3285;
    bool _3289 = isnan(0.0);
    bool _3291 = _3287 || _3289;
    float _3293 = fma(_3273, 0.114477999508380889892578125, _3281);
    bool _3295 = _2744 <= 0.0;
    bool _3297 = !_3291;
    bool _3299 = _3295 || _3297;
    float _3301 = -_3293;
    float _3303 = _3301 + _3271;
    float _3305 = -_3293;
    float _3307 = _3305 + _3269;
    float _3309 = -_3293;
    float _3311 = _3309 + _3273;
    float _3313 = fma(_3303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3315 = fma(_3307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3317 = fma(_3311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    bool _3319 = !_3279;
    if (!_3319)
    {
        float _3321 = -_2614;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3325 = -_2616;
        float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3329 = -_2618;
        float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3333 = _3323 * _3323;
        float _3335 = fma(_3327, _3327, _3333);
        float _3337 = fma(_3331, _3331, _3335);
        float _3339 = sqrt(_3337);
        float _3341 = rsqrt(_3337);
        float _3343 = -_3339;
        float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        float _3351 = _3327 * _3341;
        float _3353 = _3323 * _3341;
        float _3355 = abs(_3349);
        float _3357 = log2(_3355);
        float _3359 = _3331 * _3341;
        float _3361 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3363 = _2402 * _3353;
        float _3365 = -_3353;
        float _3367 = -_3361;
        float _3369 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3367);
        float _3371 = fma(_2400, _3351, _3363);
        float _3373 = -_3359;
        float _3375 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3369);
        float _3377 = fma(_2404, _3359, _3371);
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3383 = _3375 + _3381;
        float _3385 = _3357 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3389 = precise::clamp(_3387, 0.0, 1.0);
        float _3391 = exp2(_3385);
        float _3393 = _3391 * _3389;
        float _3395 = _3379 * _3393;
        float _3397 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3399 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3401 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3397;
        out.m_82.y = _3399;
        out.m_82.z = _3401;
    }
    out.m_84.x = _3313;
    out.m_84.y = _3315;
    out.m_84.z = _3317;
    if (!_3299)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3403 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3403;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3207 = false;
    bool _2452 = false;
    bool _903 = false;
    bool _711 = false;
    bool _335 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3460 = as_type<float>(_119);
        out.gl_Position.z = _3460;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3530 = as_type<float>(_157);
        out.gl_Position.z = _3530;
    }
    if (_149)
    {
        return out;
    }
    float _159 = in.m_53.x;
    float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _163 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _169 = _163 * _161;
    float _171 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _175 = _171 * _167;
    float _177 = _173 * 6.283185482025146484375;
    float _179 = floor(_173);
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[20].y, _175);
    int _183 = as_type<int>(_165) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_165) & 2;
    bool _189 = _187 != 0;
    float _191 = _177 * 0.15915493667125701904296875;
    bool _193 = !_189;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = floor(_181);
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _181 * 6.283185482025146484375;
    bool _205 = !_185;
    float _207 = _205 ? (-0.5) : 0.5;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _215 = _213 != 0;
    float _217 = _203 * 0.15915493667125701904296875;
    bool _219 = !_201;
    int _221 = _219 ? 0 : 1;
    float _223 = _191 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = -_179;
    float _229 = _173 + _227;
    bool _231 = !_211;
    int _233 = _231 ? 0 : 1;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _237 = abs(_233);
    float _239 = _217 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = -_197;
    float _245 = _181 + _243;
    bool _247 = _229 < 0.5;
    float _249 = float(_247);
    float _251 = -_229;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _255 = !_215;
    int _257 = _255 ? 0 : 1;
    int _259 = abs(_221);
    float _261 = -_249;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = fma(_225, 0.5, 0.5);
    int _267 = abs(_257);
    float _269 = -_265;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = float(_237);
    float _275 = fma(_241, 0.5, 0.5);
    bool _277 = _245 < 0.5;
    float _279 = float(_277);
    float _281 = -_245;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _285 = float(_259);
    float _287 = abs(_253);
    float _289 = _273 * _287;
    float _291 = float(_267);
    float _293 = -_279;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _297 = -_275;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _301 = abs(_283);
    float _303 = _273 * _301;
    float _305 = fma(_285, _271, _289);
    float _307 = fma(_285, _299, _303);
    float _309 = abs(_263);
    float _311 = fma(_291, _309, _305);
    float _313 = abs(_295);
    float _315 = fma(_291, _313, _307);
    bool _317 = !_235;
    float _333;
    if (!_317)
    {
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _321 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        float _337 = float(_103);
        float _339 = 1.0 / _337;
        float _341 = _137 * _339;
        _333 = _341;
    }
    _335 = false;
    float _343 = _333;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _343 + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _365;
    float _369 = 1.0 / _351;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _375 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _377 = isnan(_343);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = 1.0 / _355;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = _343 + _389;
    bool _393 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _395 = isnan(_343);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _359;
    float _407 = _391 * _369;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = _343 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = _343 + _413;
    bool _417 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _419 = isnan(_343);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = 1.0 / _363;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _431;
    float _435 = _347 * _387;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _439 = _343 + _437;
    bool _441 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _443 = isnan(_343);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _455 = 1.0 / _367;
    float _457 = _411 * _405;
    float _459 = -_427;
    float _461 = _459 + 1.0;
    float _463 = -_451;
    float _465 = _463 + 1.0;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _467;
    float _471 = _451 * _461;
    bool _473 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _475 = isnan(_343);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = 1.0 / _433;
    float _487 = _439 * _429;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _491 = _343 + _489;
    float _493 = fma(_469, _407, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _495 = 1.0 / _373;
    float _497 = _415 * _455;
    bool _499 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _501 = isnan(_343);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = _491 * _485;
    float _513 = _509 * _465;
    float _515 = -_509;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _521 = _343 + _519;
    float _523 = _483 * _517;
    float _525 = -_483;
    float _527 = _525 + 1.0;
    float _529 = _521 * _495;
    bool _531 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _533 = isnan(_343);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _543;
    float _547 = _385 * _527;
    float _549 = -_385;
    float _551 = _549 + 1.0;
    bool _553 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _555 = isnan(_343);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = fma(_545, _407, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _567 = -_541;
    float _569 = _567 + 1.0;
    float _571 = _541 * _551;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _577 = -_563;
    float _579 = _577 + 1.0;
    float _581 = _563 * _569;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _587;
    float _591 = _403 * _579;
    float _593 = -_403;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _597;
    float _601 = fma(_575, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _603 = _493 * _591;
    float _605 = _565 * _591;
    float _607 = fma(_585, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[143].x, _603);
    float _615 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[143].y, _605);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _621 = fma(_589, _457, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _623 = fma(_599, _457, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _625 = fma(_601, _581, _613);
    float _627 = fma(_607, _581, _615);
    float _629 = fma(_611, _487, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _631 = fma(_619, _487, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _637;
    float _641 = fma(_621, _571, _625);
    float _643 = fma(_623, _571, _627);
    float _645 = fma(_635, _497, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _647 = fma(_639, _497, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _657 = fma(_629, _547, _641);
    float _659 = fma(_631, _547, _643);
    float _661 = fma(_651, _529, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _663 = fma(_655, _529, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _669;
    float _673 = fma(_645, _523, _657);
    float _675 = fma(_647, _523, _659);
    float _677 = fma(_667, _511, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _679 = fma(_671, _511, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _681 = fma(_661, _513, _673);
    float _683 = fma(_663, _513, _675);
    float _685 = fma(_677, _471, _681);
    float _687 = fma(_679, _471, _683);
    float _689 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[150].x, _685);
    float _691 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[150].y, _687);
    bool _693 = !_453;
    float _709;
    if (!_693)
    {
        float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _697 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _701 = _699 * _695;
        float _703 = floor(_701);
        float _705 = -_703;
        float _707 = _701 + _705;
        _709 = _707;
        _711 = true;
    }
    else
    {
        float _713 = float(_103);
        float _715 = 1.0 / _713;
        float _717 = _137 * _715;
        _709 = _717;
    }
    _711 = false;
    float _719 = _709;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _723 = _719 + _721;
    bool _725 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _727 = isnan(_719);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _739 = _719 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _749 = 1.0 / _743;
    bool _751 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _753 = 1.0 / _747;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _755;
    float _759 = _723 * _749;
    bool _761 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _763 = isnan(_719);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -_735;
    float _775 = _773 + 1.0;
    bool _777 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _779 = isnan(_719);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = fma(_757, _759, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _791 = _787 * _775;
    float _793 = -_787;
    float _795 = _793 + 1.0;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _801;
    float _805 = _739 * _753;
    float _807 = _771 * _795;
    float _809 = fma(_799, _759, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _811 = fma(_803, _759, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _813 = -_771;
    float _815 = _813 + 1.0;
    float _817 = _789 * _807;
    float _819 = _809 * _807;
    float _821 = _811 * _807;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _835 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[107].x, _819);
    float _837 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[107].y, _817);
    float _839 = fma(_825, _805, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _841 = fma(_829, _805, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _843 = fma(_833, _805, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _845 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[107].z, _821);
    float _847 = fma(_839, _791, _835);
    float _849 = fma(_841, _791, _837);
    float _851 = fma(_843, _791, _845);
    float _853 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[109].x, _847);
    float _855 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[109].y, _849);
    float _857 = in.m_58.x;
    float _859 = in.m_58.y;
    float _861 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[109].z, _851);
    float _863 = _853 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _865 = _855 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _867 = _861 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _871;
    out.m_60.y = _873;
    out.m_60.z = _875;
    out.m_60.w = _869;
    float _877 = _691 * _859;
    float _879 = _689 * _857;
    bool _881 = !_751;
    float _899;
    float _901;
    if (!_881)
    {
        float _883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _885 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _887 = float(_103);
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[11].z, _137);
        float _891 = _889 * _883;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _887;
        _901 = _897;
        _903 = true;
    }
    else
    {
        float _905 = float(_103);
        float _907 = 1.0 / _905;
        float _909 = _137 * _907;
        _899 = _905;
        _901 = _909;
    }
    _903 = false;
    float _911 = _899;
    float _913 = _901;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _917 = int(_915);
    float _919 = in.m_46.x;
    float _921 = in.m_46.y;
    float _923 = in.m_46.z;
    float _925 = in.m_62.x;
    float _927 = in.m_62.y;
    float _929 = in.m_62.z;
    float _931 = in.m_62.w;
    float _933 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _935 = int(_933);
    float _937 = float(_917);
    float _939 = 1.0 / _911;
    float _941 = float(uint(_935));
    float _943 = 1.0 / _937;
    int _945 = ~_935;
    int _947 = _945 + 1;
    float _949 = _921 * _927;
    float _951 = 1.0 / _941;
    float _953 = fma(_919, _925, _949);
    float _955 = fma(_923, _929, _953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _959 = _913 + _957;
    float _961 = _943 * _137;
    float _963 = _955 + _931;
    float _965 = trunc(_961);
    int _967 = int(_965);
    int _969 = as_type<int>(_951) + (-2);
    float _971 = float(uint(_967));
    float _973 = as_type<float>(_969) * _971;
    float _975 = trunc(_973);
    float _977 = precise::max(_975, 0.0);
    uint _980 = uint(_977);
    float _982 = float(_967);
    int _984 = _947 * int(_980);
    int _986 = _984 + _967;
    float _988 = float(uint(_986));
    float _990 = as_type<float>(_969) * _988;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _994 = _992 != 0;
    bool _996 = !_994;
    float _998 = _996 ? 7.345489978790283203125 : 1.0;
    float _1000 = trunc(_990);
    float _1002 = precise::max(_1000, 0.0);
    uint _1004 = uint(_1002);
    float _1006 = _998 * _159;
    float _1008 = floor(_1006);
    int _1010 = int(_980) + int(_1004);
    float _1012 = float(_935);
    int _1014 = _947 * _1010;
    int _1016 = _1014 + _967;
    bool _1018 = _982 >= _1012;
    bool _1020 = isnan(_982);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(_1012);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_1008;
    float _1032 = _1006 + _1030;
    int _1034 = _935 + (-1);
    bool _1036 = uint(_1016) >= uint(_935);
    float _1038 = trunc(_1028);
    int _1040 = int(_1038);
    float _1042 = _1032 * _1012;
    bool _1044 = !_1036;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = _935 == 0;
    int _1050 = ~_1010;
    int _1052 = _1050 + _1046;
    int _1054 = _1052 + 1;
    float _1056 = trunc(_1042);
    int _1058 = int(_1056);
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1070 = _1068 != 0;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1074 = _1072 != 0;
    int _1076 = _935 * _1054;
    int _1078 = _1076 + _967;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1082 = _1080 != 0;
    bool _1084 = !_1074;
    int _1086 = _1084 ? 0 : 1;
    int _1088 = ~_1040;
    int _1090 = _1088 + 1;
    int _1092 = _1090 + 1;
    bool _1094 = !_1048;
    int _1096 = _1094 ? _1078 : (-1);
    float _1098 = _1012 * _137;
    int _1100 = abs(_1086);
    bool _1102 = !_1066;
    int _1104 = _1102 ? 0 : 1;
    int _1106 = _1096 * _1092;
    float _1108 = _1098 * _939;
    int _1110 = _1058 * _1100;
    int _1112 = _1110 + _967;
    int _1114 = abs(_1104);
    int _1116 = _1040 * _1034;
    int _1118 = _1116 + _1106;
    float _1120 = trunc(_1108);
    int _1122 = int(_1120);
    float _1124 = in.m_64.x;
    float _1126 = in.m_64.y;
    float _1128 = in.m_64.z;
    float _1130 = in.m_64.w;
    bool _1132 = !_1062;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = _1118 * _1114;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1140 = _1138 != 0;
    float _1142 = in.m_66.x;
    float _1144 = in.m_66.y;
    float _1146 = in.m_66.z;
    float _1148 = in.m_66.w;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    float _1158 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1160 = log2(_1158);
    int _1162 = abs(_1134);
    bool _1164 = !_1070;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = in.m_53.y;
    bool _1170 = !_1082;
    int _1172 = _1170 ? 0 : 1;
    int _1174 = abs(_1166);
    int _1176 = _1122 * _1162;
    int _1178 = _1176 + _1136;
    int _1180 = abs(_1172);
    int _1182 = ~_935;
    int _1184 = _1182 + 1;
    int _1186 = _1112 * _1174;
    int _1188 = _1186 + _1178;
    bool _1190 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1192 = isnan(1.0);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1198 = _1194 || _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1202 = 1.0 + _1200;
    bool _1204 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1206 = isnan(0.0);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1212 = _1208 || _1210;
    float _1214 = _921 * _1126;
    int _1216 = _1058 * _1180;
    int _1218 = _1216 + _1188;
    float _1220 = _1160 * _137;
    float _1222 = _921 * _1144;
    float _1224 = fma(_919, _1124, _1214);
    float _1226 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1228 = _159 * 2.0;
    float _1230 = fma(_919, _1142, _1222);
    float _1232 = float(uint(_1218));
    float _1234 = exp2(_1220);
    float _1236 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1238 = as_type<float>(_969) * _1232;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1240;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1246 = _159 > 0.5;
    float _1248 = floor(_1228);
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1252 = -_1244;
    float _1254 = fma(_1226, 2.0, _1252);
    float _1256 = float(uint(_1112));
    float _1258 = fma(_1236, -2.0, _1250);
    float _1260 = trunc(_1238);
    float _1262 = precise::max(_1260, 0.0);
    uint _1264 = uint(_1262);
    float _1266 = -_1234;
    float _1268 = _1266 + 1.0;
    float _1270 = -_207;
    int _1272 = _1246 ? as_type<int>(_1270) : as_type<int>(_207);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1276 = _1168 > 0.5;
    float _1278 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1258);
    float _1280 = _1212 ? _1268 : 0.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1286 = 1.0 / _1202;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1290 = -_195;
    int _1292 = _1276 ? as_type<int>(_1290) : as_type<int>(_195);
    float _1294 = as_type<float>(_969) * _1256;
    bool _1296 = _1248 > 0.0;
    float _1298 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1288);
    bool _1300 = _1248 >= 0.0;
    bool _1302 = isnan(_1248);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1274);
    int _1312 = _1184 * int(_1264);
    int _1314 = _1312 + _1218;
    float _1316 = in.m_53.z;
    float _1318 = 1.0 / _1284;
    float _1320 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1310);
    float _1322 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1298);
    float _1324 = float(uint(_1314));
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1328 = _913 + _1326;
    bool _1330 = !_1152;
    float _1332 = _1330 ? _207 : as_type<float>(_1272);
    float _1334 = -_1322;
    float _1336 = _1334 + 1.0;
    float _1338 = as_type<float>(_969) * _1324;
    bool _1340 = !_1156;
    float _1342 = _1340 ? _195 : as_type<float>(_1292);
    float _1344 = _1168 * 2.0;
    float _1346 = -_137;
    float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1254);
    float _1350 = trunc(_1338);
    float _1352 = precise::max(_1350, 0.0);
    uint _1354 = uint(_1352);
    float _1356 = _963;
    if (_1198)
    {
        float _1358 = _1280 * _1286;
        _139 = _1358;
    }
    float _1360 = _139;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1372 = _1370 != 0;
    float _1374 = fma(_923, _1128, _1224);
    float _1376 = _1328 * _1318;
    float _1378 = _1374 + _1130;
    float _1380 = 1.0 / _1242;
    float _1382 = fma(_923, _1146, _1230);
    int _1384 = ~_935;
    int _1386 = _1384 + 1;
    float _1388 = _1316 * 2.0;
    int _1390 = _1308 ? 0 : 1;
    float _1392 = _1168 + _1316;
    float _1394 = _1382 + _1148;
    float _1396 = _1342 + (-0.5);
    float _1398 = floor(_1344);
    int _1400 = int(_1264) + int(_1354);
    float _1402 = _159 + _1168;
    int _1404 = ~_1390;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = _1168 + (-0.5);
    int _1412 = _1408;
    float _1414 = _1394;
    if (!_1296)
    {
        int _1416 = ~_1390;
        int _1418 = _1416 + 1;
        _1412 = _1418;
    }
    int _1420 = _1412;
    float _1422 = floor(_1388);
    int _1424 = _1386 * _1400;
    int _1426 = _1424 + _1218;
    float _1428 = _1402 + (-1.0);
    float _1430 = _959 * _1380;
    float _1432 = _1392 + (-1.0);
    bool _1434 = uint(_1426) >= uint(_935);
    float _1436 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1438 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1440 = !_1434;
    int _1442 = _1440 ? 0 : (-1);
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1444;
    bool _1448 = _1398 >= 0.0;
    bool _1450 = isnan(_1398);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1458;
    int _1462 = _1456 ? 0 : 1;
    float _1464 = fma(_1460, _1430, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1466 = _1422 >= 0.0;
    bool _1468 = isnan(_1422);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1476;
    bool _1480 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1482 = isnan(_913);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1488 = _1484 || _1486;
    float _1490 = float(_1488);
    int _1492 = _1474 ? 0 : 1;
    bool _1494 = _1422 > 0.0;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1502 = _1500 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1504 = _1398 > 0.0;
    float _1506 = fma(_1478, _1430, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1508 = fma(_1446, _1430, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1510 = fma(_1502, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1512 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1514 = isnan(_913);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -_1490;
    float _1526 = _1524 + 1.0;
    int _1528 = ~_1400;
    int _1530 = _1528 + _1442;
    int _1532 = _1530 + 1;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1538 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1540 = isnan(_913);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1522 * _1526;
    float _1552 = -_1522;
    float _1554 = _1552 + 1.0;
    int _1556 = _935 * _1532;
    int _1558 = _1556 + _1218;
    float _1560 = -_1396;
    float _1562 = -_1278;
    float _1564 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1562);
    float _1566 = _1332 + 0.5;
    float _1568 = _1548 * _1554;
    float _1570 = -_1548;
    float _1572 = _1570 + 1.0;
    bool _1574 = !_1048;
    int _1576 = _1574 ? _1558 : (-1);
    float _1578 = fma(_1498, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1580 = _1464 * _1568;
    float _1582 = _1506 * _1568;
    float _1584 = trunc(_1294);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    float _1590 = _1508 * _1568;
    int _1592 = _1576 >> 31;
    float _1594 = fma(_1536, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1596 = ~_935;
    int _1598 = _1596 + 1;
    float _1600 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1580);
    int _1602 = _1592 & 3;
    float _1604 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1348);
    float _1606 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1582);
    float _1608 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1590);
    int _1610 = _1576 + _1602;
    bool _1612 = !_1368;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1594, _1550, _1608);
    int _1618 = _1610 >> 2;
    int _1620 = _1598 * int(_1588);
    int _1622 = _1620 + _1112;
    int _1624 = abs(_1614);
    int _1626 = _1618 << 4;
    int _1628 = _1626 + 368;
    float _1630 = float(uint(_1622));
    float _1632 = fma(_1578, _1550, _1600);
    float _1634 = -_1320;
    float _1636 = _1634 + 1.0;
    int _1638 = ~_1462;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    uint _1644 = uint(int(uint(_1628) >> uint(2)));
    uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
    int _1648 = int(_1644) & 3;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[int(_1646)][_1648];
    int _1652 = int(_1644) + 1;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    int _1656 = _1652 & 3;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[int(_1654)][_1656];
    float _1660 = as_type<float>(_969) * _1630;
    int _1662 = _1642;
    if (!_1504)
    {
        int _1664 = ~_1462;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    float _1670 = fma(_1342, _1336, _1564);
    float _1672 = -_1636;
    float _1674 = fma(_1332, _1672, _1604);
    int _1676 = _1576 & 3;
    bool _1678 = _1676 != 0;
    float _1680 = fma(_1510, _1550, _1606);
    float _1682 = trunc(_1660);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = _1628 + 8;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    int _1706 = ~_1492;
    int _1708 = _1706 + 1;
    int _1710 = _1708 + 1;
    out.m_68.x = _1674;
    out.m_68.y = _1670;
    int _1712 = _1710;
    if (!_1494)
    {
        int _1714 = ~_1492;
        int _1716 = _1714 + 1;
        _1712 = _1716;
    }
    int _1718 = _1712;
    float _1720 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1680);
    float _1722 = float(_1420);
    bool _1724 = uint(_1676) > 1u;
    float _1726 = float(_1624);
    bool _1728 = !_1364;
    int _1730 = _1728 ? 0 : 1;
    int _1732 = _1576 & 3;
    bool _1734 = _1732 != 0;
    float _1736 = _1726 * _1722;
    int _1738 = abs(_1730);
    int _1740 = ~_935;
    int _1742 = _1740 + 1;
    float _1744 = _1736 * (-2.0);
    int _1746 = _1734 ? 0 : 1;
    int _1748 = int(_1588) + int(_1686);
    float _1750 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1616);
    int _1752 = ~_1746;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    int _1758 = _1756;
    if (!_1724)
    {
        int _1760 = ~_1746;
        int _1762 = _1760 + 1;
        _1758 = _1762;
    }
    int _1764 = _1758;
    float _1766 = float(_1738);
    float _1768 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1632);
    int _1770 = _1742 * _1748;
    int _1772 = _1770 + _1112;
    bool _1774 = !_1678;
    int _1776 = _1774 ? 0 : 1;
    int _1778 = abs(_1764);
    bool _1780 = _1676 != 3;
    int _1782 = abs(_1776);
    float _1784 = float(_1718);
    bool _1786 = uint(_1676) >= 2u;
    float _1788 = _1766 * _1784;
    bool _1790 = uint(_1772) >= uint(_935);
    int _1792 = ~_1778;
    int _1794 = _1792 + 1;
    int _1796 = _1794 + 1;
    int _1798 = _1786 ? 0 : 1;
    bool _1800 = !_1790;
    int _1802 = _1800 ? 0 : (-1);
    int _1804 = _1796 * as_type<int>(_1658);
    int _1806 = ~_1782;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    bool _1812 = _1676 != 3;
    int _1814 = ~_1798;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = in.m_70.x;
    float _1822 = in.m_70.y;
    float _1824 = in.m_70.z;
    int _1826 = _1818;
    float _1828 = _1768;
    if (_1780)
    {
        int _1830 = ~_1798;
        int _1832 = _1830 + 1;
        _1826 = _1832;
    }
    int _1834 = _1826;
    int _1836 = ~_1748;
    int _1838 = _1836 + _1802;
    int _1840 = _1838 + 1;
    int _1842 = _1810 * as_type<int>(_1650);
    int _1844 = _1842 + _1804;
    bool _1846 = !_1812;
    int _1848 = _1846 ? 0 : (-1);
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1852 = _1378 + _1850;
    int _1854 = abs(_1834);
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1858 = _1394 + _1856;
    int _1860 = abs(_1848);
    float _1862 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1866 = _963 + _1864;
    bool _1868 = !_1140;
    int _1870 = _1868 ? 0 : 1;
    int _1872 = _935 * _1840;
    int _1874 = _1872 + _1112;
    int _1876 = ~_1854;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1862);
    int _1884 = abs(_1870);
    float _1886 = _1788 * (-2.0);
    int _1888 = ~_1860;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = _1880 * as_type<int>(_1696);
    int _1896 = _1894 + _1844;
    float _1898 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1882);
    int _1900 = _1892 * as_type<int>(_1704);
    int _1902 = _1900 + _1896;
    float _1904 = fma(_1438, _1744, _1438);
    float _1906 = _1852 * _1852;
    int _1908 = ~_1884;
    int _1910 = _1908 + 1;
    int _1912 = _1910 + 1;
    float _1914 = fma(_1744, _1822, _1822);
    bool _1916 = _1898 >= 0.0;
    float _1918 = fma(_1866, _1866, _1906);
    float _1920 = fma(_1436, _1886, _1436);
    int _1922 = _1902 * _1912;
    bool _1924 = !_1048;
    int _1926 = _1924 ? _1874 : (-1);
    float _1928 = fma(_1858, _1858, _1918);
    float _1930 = fma(_1886, _1820, _1820);
    float _1932 = _1750 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1934 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1914);
    int _1936 = _1926 * _1884;
    int _1938 = _1936 + _1922;
    float _1940 = _1768 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1942 = rsqrt(_1928);
    float _1944 = _1720 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1946 = _1824;
    if (_1916)
    {
        _1828 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1948 = _1828;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1956 = as_type<int>(_1948);
    if (_1916)
    {
        float _1958 = _1948 * 5.0;
        _1956 = as_type<int>(_1958);
    }
    int _1960 = _1956;
    float _1962 = float(_1938);
    if (_1916)
    {
        out.m_49.x = 0.0;
    }
    bool _1964 = !_1372;
    int _1966 = _1964 ? 0 : 1;
    float _1968 = fma(_1904, _1360, _1934);
    float _1970 = _159 + (-0.5);
    out.m_72.x = _1950;
    out.m_72.y = _1954;
    out.m_72.z = _1952;
    int _1972 = abs(_1966);
    float _1974 = _1852 * _1942;
    if (_1916)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6253 = as_type<float>(_1960);
        out.gl_Position.z = _6253;
    }
    float _1976 = _1866 * _1942;
    out.m_74.x = _1962;
    if (_1916)
    {
        return out;
    }
    float _1978 = -_1974;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1378);
    float _1982 = _1858 * _1942;
    float _1984 = -_1976;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1990 = _1980 + _1988;
    float _1992 = float(_1972);
    float _1994 = -_1982;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2000 = _1986 + _1998;
    float _2002 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2004 = float(_1668);
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2008 = _1996 + _2006;
    float _2010 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1930);
    float _2012 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2002);
    float _2014 = _159 + _1316;
    float _2016 = _1992 * _2004;
    float _2018 = -_1974;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _2022 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2012);
    float _2024 = fma(_1920, _1360, _2010);
    float _2026 = _2014 + (-1.0);
    float _2028 = _2016 * (-2.0);
    bool _2030 = _2022 >= 0.0;
    float _2032 = -_1976;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1866);
    float _2036 = _2020 * _2020;
    float _2038 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2040 = fma(_2028, _1824, _1824);
    float _2042 = _1316 + (-0.5);
    float _2044 = fma(_2034, _2034, _2036);
    float _2046 = -_1982;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1858);
    float _2050 = fma(_2038, _2028, _2038);
    float _2052 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2040);
    float _2054 = _2024 * 0.15915493667125701904296875;
    float _2056 = fma(_2048, _2048, _2044);
    float _2058 = _1982;
    float _2060 = _2008;
    float _2062 = _1980;
    if (_2030)
    {
        _1946 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2064 = _1946;
    float _2066 = fma(_2050, _1360, _2052);
    float _2068 = _2054 * 6.283185482025146484375;
    float _2070 = sin(_2068);
    float _2072 = _1968 * 0.15915493667125701904296875;
    int _2074 = as_type<int>(_2064);
    if (_2030)
    {
        out.m_49.x = 0.0;
    }
    if (_2030)
    {
        float _2076 = _2064 * 5.0;
        _2074 = as_type<int>(_2076);
    }
    int _2078 = _2074;
    float _2080 = _315 * _877;
    float _2082 = sqrt(_2056);
    if (_2030)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6444 = as_type<float>(_2078);
        out.gl_Position.z = _6444;
    }
    float _2084 = _2054 * 6.283185482025146484375;
    float _2086 = cos(_2084);
    float _2088 = _2072 * 6.283185482025146484375;
    float _2090 = sin(_2088);
    float _2092 = _2072 * 6.283185482025146484375;
    float _2094 = cos(_2092);
    float _2096 = _2066 * 0.15915493667125701904296875;
    if (_2030)
    {
        return out;
    }
    float _2098 = _2096 * 6.283185482025146484375;
    float _2100 = cos(_2098);
    float _2102 = _1942 * _2082;
    float _2104 = _2080 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2106 = _311 * _879;
    float _2108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2110 = _2086 * _2094;
    float _2112 = _2102 * _2104;
    float _2114 = _2106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2116 = _2096 * 6.283185482025146484375;
    float _2118 = sin(_2116);
    float _2120 = _2086 * _2090;
    float _2122 = _2108 * _2112;
    float _2124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2126 = _2102 * _2114;
    float _2128 = _2070 * _2090;
    float _2130 = _2070 * _2094;
    float _2132 = _2086 * _2100;
    float _2134 = _2124 * _2126;
    float _2136 = _2094 * _2100;
    float _2138 = _2070 * _2100;
    float _2140 = _2132 * _2122;
    float _2142 = _2090 * _2100;
    float _2144 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2146 = _2144 * 0.5;
    float _2148 = fma(_2118, _2110, _2128);
    float _2150 = -_2122;
    float _2152 = _2118 * _2150;
    float _2154 = -_2130;
    float _2156 = fma(_2118, _2120, _2154);
    float _2158 = -_2120;
    float _2160 = fma(_2118, _2130, _2158);
    float _2162 = fma(_2148, _2134, _2140);
    float _2164 = fma(_2136, _2134, _2152);
    float _2166 = _2138 * _2122;
    float _2168 = fma(_2118, _2128, _2110);
    float _2170 = fma(_2156, _2146, _2162);
    float _2172 = fma(_2142, _2146, _2164);
    float _2174 = fma(_2160, _2134, _2166);
    float _2176 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2178 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2180 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2182 = fma(_2168, _2146, _2174);
    float _2184 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2178);
    float _2188 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2180);
    float _2190 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2192 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2176);
    float _2194 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2186);
    float _2196 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2188);
    float _2198 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    float _2200 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2190);
    float _2202 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2204 = _2196 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2206 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2208 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2210 = _963 + _2202;
    float _2212 = _1394 + _2204;
    float _2214 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2216 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2220 = _2210 + _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2224 = _2212 + _2222;
    float _2226 = -_2118;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2206);
    float _2230 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2232 = _2220 * _2220;
    float _2234 = _2224 * _2224;
    float _2236 = -_2118;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2208);
    float _2240 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2242 = -_2118;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2214);
    float _2246 = _2232 + _2234;
    float _2248 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2192);
    float _2250 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2198);
    float _2252 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2254 = sqrt(_2246);
    float _2256 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2258 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2260 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2262 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2200);
    float _2264 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2252);
    float _2266 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2256);
    float _2268 = _1378 + _2260;
    float _2270 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2258);
    bool _2272 = _2254 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2274 = _2240;
    float _2276 = _2260;
    float _2278 = _2142;
    float _2280 = _2200;
    float _2282 = _2232;
    float _2284 = _2250;
    if (!_2272)
    {
        _2274 = _2234;
    }
    float _2286 = _2274;
    float _2288 = _2286;
    if (!_2272)
    {
        _2276 = _2210;
    }
    float _2290 = _2276;
    float _2292 = _2290;
    if (!_2272)
    {
        _2278 = _2212;
    }
    float _2294 = _2278;
    float _2296 = _2294;
    if (!_2272)
    {
        _2280 = _2268;
    }
    float _2298 = _2280;
    bool _2300 = !_2272;
    float _2302 = _2298;
    if (!_2300)
    {
        float _2304 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2308 = _2254 + _2306;
        float _2310 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2312 = rsqrt(_2246);
        float _2314 = _2308 * _2304;
        float _2316 = _2314 * 0.15915493667125701904296875;
        float _2318 = _2316 * 6.283185482025146484375;
        float _2320 = sin(_2318);
        float _2322 = _2316 * 6.283185482025146484375;
        float _2324 = cos(_2322);
        float _2326 = fma(_2320, _2310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2328 = _2312 * _2326;
        float _2330 = _2324 + (-1.0);
        float _2332 = fma(_2220, _2328, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2334 = fma(_2224, _2328, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2336 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2340 = _2332 + _2338;
        float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2344 = _2334 + _2342;
        float _2346 = fma(_2268, _2324, _2336);
        float _2348 = _2340 * _2340;
        float _2350 = _2344 * _2344;
        _2302 = _2346;
        _2282 = _2348;
        _2288 = _2350;
        _2296 = _2334;
        _2292 = _2332;
    }
    float _2352 = _2302;
    float _2354 = _2282;
    float _2356 = _2288;
    float _2358 = _2296;
    float _2360 = _2292;
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2364 = _2352 + _2362;
    float _2366 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2368 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2238);
    float _2370 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2372 = fma(_2364, _2364, _2354);
    float _2374 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2244);
    float _2376 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2264);
    float _2378 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2266);
    float _2380 = _2372 + _2356;
    float _2382 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    float _2384 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2386 = _2370 * _2366;
    float _2388 = _2370 * _2368;
    float _2390 = _2370 * _2374;
    float _2392 = sqrt(_2380);
    float _2394 = fma(_2384, _2248, _2386);
    float _2396 = fma(_2384, _2250, _2388);
    float _2398 = fma(_2384, _2262, _2390);
    float _2400 = _2376 + _2394;
    float _2402 = _2378 + _2396;
    float _2404 = _2382 + _2398;
    out.m_76.x = _2400;
    out.m_76.y = _2402;
    out.m_76.z = _2404;
    bool _2406 = _2392 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2408 = isnan(_2392);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2414 = _2410 || _2412;
    float _2416 = _2360;
    if (!_2414)
    {
        _2284 = 1.0;
    }
    float _2418 = _2284;
    bool _2420 = !_2414;
    float _2422 = _2418;
    if (!_2420)
    {
        bool _2424 = _2392 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2426 = isnan(_2392);
        bool _2428 = _2424 || _2426;
        bool _2430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2432 = _2428 || _2430;
        if (!_2432)
        {
            float _2434 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2436 = _2392 + _2434;
            float _2438 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2440 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2438;
            float _2442 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2444 = _2442 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2446 = 1.0 / _2440;
            float _2448 = _2436 * _2446;
            float _2450 = fma(_2448, _2444, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2422 = _2450;
            _2452 = true;
        }
        else
        {
            bool _2454 = _2392 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2456 = isnan(_2392);
            bool _2458 = _2454 || _2456;
            bool _2460 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2462 = _2458 || _2460;
            if (!_2462)
            {
                float _2464 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2466 = _2392 + _2464;
                float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2470 = _2468 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2472 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2474 = _2472 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2476 = 1.0 / _2470;
                float _2478 = _2466 * _2476;
                float _2480 = fma(_2478, _2474, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2422 = _2480;
                _2452 = true;
            }
            else
            {
                _2422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2452 = false;
    float _2482 = _2422;
    float _2484 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2488 = _2358 + _2486;
    float _2490 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2484);
    float _2492 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2494 = fma(_2488, _2482, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2496 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2490);
    bool _2498 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan(0.5);
    bool _2506 = _2502 || _2504;
    bool _2508 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan(0.5);
    bool _2516 = _2512 || _2514;
    float _2518 = _2496 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2520 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2492);
    float _2522 = 1.0 / _2518;
    float _2524 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2520);
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2528 = _2526 + _2518;
    float _2530 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2532 = _2352 + _2530;
    float _2534 = fma(_2532, _2482, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2536 = _2528 * _2522;
    float _2538 = _2536 * 0.5;
    float _2540 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2542 = _2360 + _2540;
    float _2544 = -_1974;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2534);
    float _2548 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2516)
    {
        _2416 = 1.0;
    }
    float _2550 = _2416;
    float _2552 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2554 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2552);
    float _2556 = fma(_2542, _2482, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2558 = -_1982;
    float _2560 = fma(_2558, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2494);
    float _2562 = _2560;
    float _2564 = _2550;
    if (_2506)
    {
        _2058 = _2546;
    }
    float _2566 = _2058;
    float _2568 = -_1976;
    float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2556);
    float _2572 = 1.0 / _2554;
    float _2574 = _2566;
    float _2576 = _2570;
    if (!_2506)
    {
        float _2578 = _1990 * _1990;
        float _2580 = 1.0 / _2102;
        float _2582 = -_1378;
        float _2584 = _2582 + _2534;
        float _2586 = -_1394;
        float _2588 = _2586 + _2494;
        float _2590 = fma(_2000, _2000, _2578);
        float _2592 = fma(_2008, _2008, _2590);
        float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2596 = sqrt(_2592);
        float _2598 = precise::min(_2596, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2600 = _2598 * _2594;
        float _2602 = -_963;
        float _2604 = _2602 + _2556;
        float _2606 = _2600 * _2580;
        float _2608 = fma(_2604, _2606, _1986);
        float _2610 = fma(_2584, _2606, _1980);
        float _2612 = fma(_2588, _2606, _1996);
        _2574 = _2610;
        _2576 = _2608;
        _2562 = _2612;
        _2060 = _2596;
    }
    float _2614 = _2574;
    float _2616 = _2576;
    float _2618 = _2562;
    float _2620 = _2060;
    float _2622 = _2620;
    if (_2516)
    {
        _1414 = 1.0;
    }
    float _2624 = _1414;
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2628 = _2572 * _2626;
    float _2630 = _2624;
    if (!_2516)
    {
        float _2632 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2634 = _2632 * 0.15915493667125701904296875;
        float _2636 = _2634 * 6.283185482025146484375;
        float _2638 = cos(_2636);
        float _2640 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2642 = _2640 * 0.15915493667125701904296875;
        float _2644 = _2634 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = 1.0 / _2638;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2646 * _2648;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = _2652 * _2654;
        float _2662 = 1.0 / _2660;
        float _2664 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2666 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2664;
        float _2668 = 1.0 / _2666;
        float _2670 = _2658 * _2662;
        float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2674 = fma(_2628, _2670, _2672);
        float _2676 = _2674 * _2668;
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        _2062 = _2642;
        _2622 = _2634;
        _2564 = _2678;
    }
    float _2680 = _2062;
    float _2682 = _2622;
    float _2684 = _2564;
    float _2686 = _2680;
    float _2688 = _2682;
    if (!_2516)
    {
        float _2690 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2692 = _2690 * 0.15915493667125701904296875;
        float _2694 = _2692 * 6.283185482025146484375;
        float _2696 = cos(_2694);
        float _2698 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2700 = _2698 * 0.15915493667125701904296875;
        float _2702 = _2692 * 6.283185482025146484375;
        float _2704 = sin(_2702);
        float _2706 = 1.0 / _2696;
        float _2708 = _2700 * 6.283185482025146484375;
        float _2710 = cos(_2708);
        float _2712 = _2704 * _2706;
        float _2714 = _2700 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        float _2718 = _2710 * _2712;
        float _2720 = 1.0 / _2718;
        float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2724 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2722;
        float _2726 = 1.0 / _2724;
        float _2728 = _2716 * _2720;
        float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2732 = fma(_2628, _2728, _2730);
        float _2734 = _2732 * _2726;
        float _2736 = precise::clamp(_2734, 0.0, 1.0);
        float _2738 = -_2736;
        float _2740 = _2738 + 1.0;
        _2686 = _2706;
        _2630 = _2740;
    }
    float _2742 = _2686;
    float _2744 = _2630;
    float _2746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2748 = _2614 + _2746;
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2752 = _2616 + _2750;
    float _2754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2756 = _2618 + _2754;
    float _2758 = _2748 * _2748;
    float _2760 = fma(_2752, _2752, _2758);
    float _2762 = fma(_2756, _2756, _2760);
    float _2764 = rsqrt(_2762);
    float _2766 = sqrt(_2762);
    float _2768 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2770 = _2752 * _2768;
    float _2772 = _2756 * _2768;
    float _2774 = _2770 * _2770;
    float _2776 = _2772 * _2772;
    float _2778 = _2774 + _2776;
    float _2780 = sqrt(_2778);
    bool _2782 = _2780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2786 = _2780 + _2784;
    float _2788 = _2742;
    float _2790 = _2786;
    float _2792 = _2748;
    float _2794 = _2770;
    if (_2782)
    {
        float _2796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2788 = _2796;
    }
    float _2798 = _2788;
    if (_2782)
    {
        float _2800 = rsqrt(_2778);
        _2688 = _2800;
    }
    float _2802 = _2688;
    float _2804 = _2802;
    if (_2782)
    {
        float _2806 = _2786 * _2798;
        _2790 = _2806;
    }
    float _2808 = _2790;
    if (_2782)
    {
        float _2810 = _2808 * 0.15915493667125701904296875;
        _1356 = _2810;
    }
    float _2812 = _1356;
    float _2814 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2816 = _2756;
    if (_2782)
    {
        float _2818 = _2812 * 6.283185482025146484375;
        float _2820 = sin(_2818);
        _2816 = _2820;
    }
    float _2822 = _2816;
    float _2824 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2826 = precise::max(0.0, _2824);
    float _2828 = _2798;
    float _2830 = _2826;
    if (_2782)
    {
        float _2832 = _2812 * 6.283185482025146484375;
        float _2834 = cos(_2832);
        _2828 = _2834;
    }
    float _2836 = _2828;
    float _2838 = -_2768;
    float _2840 = -_2826;
    float _2842 = fma(_2748, _2838, _2840);
    if (_2782)
    {
        float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2792 = _2844;
    }
    float _2846 = _2792;
    float _2848 = _2846;
    float _2850 = _2822;
    if (_2782)
    {
        float _2852 = fma(_2822, _2846, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2848 = _2852;
    }
    float _2854 = _2848;
    float _2856 = _2854;
    if (!_2782)
    {
        _2850 = _2774;
    }
    float _2858 = _2850;
    float _2860 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2862 = _2858;
    float _2864 = _2836;
    if (_2782)
    {
        float _2866 = _2836 + (-1.0);
        _2830 = _2866;
    }
    float _2868 = _2830;
    float _2870 = _2868;
    if (_2782)
    {
        float _2872 = _2802 * _2854;
        _2548 = _2872;
    }
    float _2874 = _2548;
    if (!_2782)
    {
        _2856 = _2842;
    }
    float _2876 = _2856;
    float _2878 = _2876;
    if (_2782)
    {
        float _2880 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2804 = _2880;
    }
    float _2882 = _2804;
    if (_2782)
    {
        float _2884 = _2770 * _2874;
        _2794 = _2884;
    }
    float _2886 = _2794;
    if (!_2782)
    {
        _2870 = _2772;
    }
    float _2888 = _2870;
    float _2890 = _2888;
    if (_2782)
    {
        float _2892 = _2772 * _2874;
        _2890 = _2892;
    }
    float _2894 = _2890;
    if (_2782)
    {
        float _2896 = fma(_2842, _2836, _2882);
        _2878 = _2896;
    }
    float _2898 = _2878;
    if (_2782)
    {
        float _2900 = _2886 * _2886;
        _2862 = _2900;
    }
    float _2902 = _2862;
    if (!_2782)
    {
        _2864 = _2776;
    }
    float _2904 = _2864;
    float _2906 = _2904;
    if (_2782)
    {
        float _2908 = _2894 * _2894;
        _2906 = _2908;
    }
    float _2910 = _2906;
    float _2912 = fma(_2898, _2898, _2902);
    float _2914 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2916 = _2912 + _2910;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2920 = fma(_2766, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2918);
    float _2922 = precise::clamp(_2920, 0.0, 1.0);
    float _2924 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2914);
    float _2926 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2928 = rsqrt(_2916);
    float _2930 = -_2922;
    float _2932 = _2930 + 1.0;
    float _2934 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2924);
    float _2936 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2938 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2926);
    float _2940 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2942 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2936);
    float _2944 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2938);
    float _2946 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2860);
    float _2948 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2950 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2942);
    float _2952 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2954 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2946);
    float _2956 = abs(_2932);
    float _2958 = log2(_2956);
    float _2960 = -_2948;
    float _2962 = fma(_2960, _2814, 1.0);
    float _2964 = _2950 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2966 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2968 = _2954 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = _2928 * _2886;
    float _2972 = _2928 * _2894;
    float _2974 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2966);
    float _2976 = _2928 * _2898;
    float _2978 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2980 = log2(_2962);
    float _2982 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2974);
    float _2984 = -_2978;
    float _2986 = fma(_2976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2984);
    float _2988 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2982);
    float _2990 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2992 = -_2972;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2986);
    float _2996 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2998 = 1.0 / _2988;
    float _3000 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3002 = fma(_2994, -0.5, 0.5);
    float _3004 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2996);
    float _3006 = fma(_2994, 0.5, 0.5);
    float _3008 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3000);
    float _3010 = _2976 + 1.0;
    float _3012 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3004);
    float _3014 = exp2(_2990);
    float _3016 = fma(_3006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3018 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3008);
    float _3020 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3012);
    float _3022 = _2980 * 0.693147182464599609375;
    float _3024 = fma(_3006, _3016, -0.212114393711090087890625);
    float _3026 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3018);
    float _3028 = sqrt(_3002);
    float _3030 = _3020 * _2998;
    float _3032 = fma(_3006, _3024, 1.570728778839111328125);
    float _3034 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3036 = fma(_3030, 0.5, 0.5);
    float _3038 = -_2976;
    float _3040 = fma(_3014, _3010, _3038);
    float _3042 = _3026 * _2998;
    float _3044 = fma(_3040, 0.5, 0.5);
    float _3046 = fma(_3042, -0.5, 0.5);
    float _3048 = _3028 * 0.636619746685028076171875;
    float3 _8022 = float3(_3036, _3046, _3034);
    float _3050 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8022, float3(0.0), isnan(_8022)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8022, float3(0.0), isnan(_8022)), level(0.0)).x;
    float _3052 = -_3032;
    float _3054 = fma(_3048, _3052, 1.0);
    float3 _8038 = float3(_3036, _3046, _3034);
    float4 _3057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8038, float3(0.0), isnan(_8038)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8038, float3(0.0), isnan(_8038)), level(0.0)).xyzw;
    float _3059 = _3057.x;
    float _3061 = _3057.y;
    float _3063 = _3057.z;
    float _3065 = _3057.w;
    float2 _8055 = float2(_3054, _3044);
    float3 _3069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8055, float2(0.0), isnan(_8055)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8055, float2(0.0), isnan(_8055)), level(0.0)).xyz;
    float _3071 = _3069.x;
    float _3073 = _3069.y;
    float _3075 = _3069.z;
    float _3077 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3079 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3081 = _3020 + _2988;
    float _3083 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3079);
    float _3085 = exp2(_3077);
    float _3087 = _2988 * 0.5;
    float _3089 = _3081 * 0.5;
    float _3091 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3083);
    bool _3093 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3095 = isnan(_2766);
    bool _3097 = _3093 || _3095;
    bool _3099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3101 = _3097 || _3099;
    float _3103 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3091);
    float _3105 = fma(_3026, -0.5, _3087);
    float _3107 = _3103 + _2988;
    out.gl_Position.x = _3020;
    out.gl_Position.y = _3026;
    out.gl_Position.z = _3103;
    out.gl_Position.w = _2988;
    float _3109 = _3107 * 0.5;
    float _3111 = -_3085;
    float _3113 = _3111 + 1.0;
    float _3115 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _3089;
    out.m_78.y = _3105;
    out.m_78.z = _3109;
    out.m_78.w = _2988;
    float _3117 = -_3115;
    float _3119 = _3117 + 1.0;
    float _3121 = _2684 * _2744;
    float _3123 = _3103;
    float _3125 = _3026;
    float _3127 = _3121;
    if (!_3101)
    {
        _3123 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3129 = _3123;
    float _3131 = _3129;
    float _3133 = _3129;
    if (!_3101)
    {
        _3125 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3135 = _3125;
    float _3137 = _3115 * _3050;
    float _3139 = _3065 * _3137;
    float _3141 = _3075 * _3137;
    float _3143 = fma(_3071, _3139, _3059);
    float _3145 = fma(_3073, _3139, _3061);
    float _3147 = _3065 * _3119;
    float _3149 = fma(_3065, _3141, _3063);
    float _3151 = _3121 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3153 = _3135;
    float _3155 = _3135;
    if (!_3101)
    {
        _3127 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3157 = _3127;
    out.m_80.x = _3143;
    out.m_80.y = _3145;
    out.m_80.z = _3149;
    out.m_80.w = _3147;
    bool _3159 = !_3101;
    float _3161 = _3157;
    float _3163 = _3157;
    if (!_3159)
    {
        bool _3165 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3167 = isnan(_2766);
        bool _3169 = _3165 || _3167;
        bool _3171 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3173 = _3169 || _3171;
        if (!_3173)
        {
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3177 = _2766 + _3175;
            float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3181 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3179;
            float _3183 = 1.0 / _3181;
            float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3193 = _3177 * _3183;
            float _3195 = precise::clamp(_3193, 0.0, 1.0);
            float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3199 = _3197 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3201 = fma(_3195, _3191, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3203 = fma(_3195, _3199, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3205 = fma(_3195, _3187, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3155 = _3205;
            _3133 = _3203;
            _3163 = _3201;
            _3207 = true;
        }
        else
        {
            bool _3209 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3211 = isnan(_2766);
            bool _3213 = _3209 || _3211;
            bool _3215 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3217 = _3213 || _3215;
            if (!_3217)
            {
                _3131 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3219 = _3131;
            _3133 = _3219;
            if (!_3217)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3221 = _3153;
            _3155 = _3221;
            if (!_3217)
            {
                _3161 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3223 = _3161;
            bool _3225 = !_3217;
            _3163 = _3223;
            if (!_3225)
            {
                bool _3227 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3229 = isnan(_2766);
                bool _3231 = _3227 || _3229;
                bool _3233 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3235 = _3231 || _3233;
                if (!_3235)
                {
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3239 = _2766 + _3237;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3243 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3241;
                    float _3245 = 1.0 / _3243;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3255 = _3239 * _3245;
                    float _3257 = precise::clamp(_3255, 0.0, 1.0);
                    float _3259 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3263 = fma(_3257, _3253, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3265 = fma(_3257, _3261, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3267 = fma(_3257, _3249, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3155 = _3267;
                    _3133 = _3265;
                    _3163 = _3263;
                    _3207 = true;
                }
                else
                {
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3133 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3163 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3207 = false;
    float _3269 = _3155;
    float _3271 = _3133;
    float _3273 = _3163;
    float _3275 = _3151 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_82.x = 0.0;
    float _3277 = _3269 * 0.586610972881317138671875;
    bool _3279 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _3275;
    float _3281 = fma(_3271, 0.298911988735198974609375, _3277);
    bool _3283 = _2684 > 0.0;
    bool _3285 = isnan(_2684);
    bool _3287 = _3283 || _3285;
    bool _3289 = isnan(0.0);
    bool _3291 = _3287 || _3289;
    float _3293 = fma(_3273, 0.114477999508380889892578125, _3281);
    bool _3295 = _2744 <= 0.0;
    bool _3297 = !_3291;
    bool _3299 = _3295 || _3297;
    float _3301 = -_3293;
    float _3303 = _3301 + _3271;
    float _3305 = -_3293;
    float _3307 = _3305 + _3269;
    float _3309 = -_3293;
    float _3311 = _3309 + _3273;
    float _3313 = fma(_3303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3315 = fma(_3307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3317 = fma(_3311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    bool _3319 = !_3279;
    if (!_3319)
    {
        float _3321 = -_2614;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3325 = -_2616;
        float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3329 = -_2618;
        float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3333 = _3323 * _3323;
        float _3335 = fma(_3327, _3327, _3333);
        float _3337 = fma(_3331, _3331, _3335);
        float _3339 = sqrt(_3337);
        float _3341 = rsqrt(_3337);
        float _3343 = -_3339;
        float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        float _3351 = _3327 * _3341;
        float _3353 = _3323 * _3341;
        float _3355 = abs(_3349);
        float _3357 = log2(_3355);
        float _3359 = _3331 * _3341;
        float _3361 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3363 = _2402 * _3353;
        float _3365 = -_3353;
        float _3367 = -_3361;
        float _3369 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3367);
        float _3371 = fma(_2400, _3351, _3363);
        float _3373 = -_3359;
        float _3375 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3369);
        float _3377 = fma(_2404, _3359, _3371);
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3383 = _3375 + _3381;
        float _3385 = _3357 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3389 = precise::clamp(_3387, 0.0, 1.0);
        float _3391 = exp2(_3385);
        float _3393 = _3391 * _3389;
        float _3395 = _3379 * _3393;
        float _3397 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3399 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3401 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3397;
        out.m_82.y = _3399;
        out.m_82.z = _3401;
    }
    out.m_84.x = _3313;
    out.m_84.y = _3315;
    out.m_84.z = _3317;
    if (!_3299)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3403 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3403;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3207 = false;
    bool _2452 = false;
    bool _903 = false;
    bool _711 = false;
    bool _335 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3460 = as_type<float>(_119);
        out.gl_Position.z = _3460;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = _137;
    if (_133)
    {
        float _141 = float(_103);
        _113 = _141;
    }
    float _143 = _113;
    bool _145 = _137 >= _143;
    bool _147 = !_133;
    bool _149 = _145 || _147;
    float _151 = _143;
    if (_149)
    {
        _151 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _151;
    if (_149)
    {
        out.m_49.x = 0.0;
    }
    if (_149)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3530 = as_type<float>(_157);
        out.gl_Position.z = _3530;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = in.m_53.x;
    float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _163 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _169 = _163 * _161;
    float _171 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[20].x, _169);
    float _175 = _171 * _167;
    float _177 = _173 * 6.283185482025146484375;
    float _179 = floor(_173);
    float _181 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[20].y, _175);
    int _183 = as_type<int>(_165) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_165) & 2;
    bool _189 = _187 != 0;
    float _191 = _177 * 0.15915493667125701904296875;
    bool _193 = !_189;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = floor(_181);
    int _199 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _201 = _199 != 0;
    float _203 = _181 * 6.283185482025146484375;
    bool _205 = !_185;
    float _207 = _205 ? (-0.5) : 0.5;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _215 = _213 != 0;
    float _217 = _203 * 0.15915493667125701904296875;
    bool _219 = !_201;
    int _221 = _219 ? 0 : 1;
    float _223 = _191 * 6.283185482025146484375;
    float _225 = cos(_223);
    float _227 = -_179;
    float _229 = _173 + _227;
    bool _231 = !_211;
    int _233 = _231 ? 0 : 1;
    bool _235 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _237 = abs(_233);
    float _239 = _217 * 6.283185482025146484375;
    float _241 = cos(_239);
    float _243 = -_197;
    float _245 = _181 + _243;
    bool _247 = _229 < 0.5;
    float _249 = float(_247);
    float _251 = -_229;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _255 = !_215;
    int _257 = _255 ? 0 : 1;
    int _259 = abs(_221);
    float _261 = -_249;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = fma(_225, 0.5, 0.5);
    int _267 = abs(_257);
    float _269 = -_265;
    float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _273 = float(_237);
    float _275 = fma(_241, 0.5, 0.5);
    bool _277 = _245 < 0.5;
    float _279 = float(_277);
    float _281 = -_245;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _285 = float(_259);
    float _287 = abs(_253);
    float _289 = _273 * _287;
    float _291 = float(_267);
    float _293 = -_279;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _297 = -_275;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _301 = abs(_283);
    float _303 = _273 * _301;
    float _305 = fma(_285, _271, _289);
    float _307 = fma(_285, _299, _303);
    float _309 = abs(_263);
    float _311 = fma(_291, _309, _305);
    float _313 = abs(_295);
    float _315 = fma(_291, _313, _307);
    bool _317 = !_235;
    float _333;
    if (!_317)
    {
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _321 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        float _337 = float(_103);
        float _339 = 1.0 / _337;
        float _341 = _137 * _339;
        _333 = _341;
    }
    _335 = false;
    float _343 = _333;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _343 + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _365;
    float _369 = 1.0 / _351;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _375 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _377 = isnan(_343);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    float _387 = 1.0 / _355;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = _343 + _389;
    bool _393 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _395 = isnan(_343);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = 1.0 / _359;
    float _407 = _391 * _369;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = _343 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = _343 + _413;
    bool _417 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _419 = isnan(_343);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = 1.0 / _363;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _431;
    float _435 = _347 * _387;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _439 = _343 + _437;
    bool _441 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _443 = isnan(_343);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _455 = 1.0 / _367;
    float _457 = _411 * _405;
    float _459 = -_427;
    float _461 = _459 + 1.0;
    float _463 = -_451;
    float _465 = _463 + 1.0;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _467;
    float _471 = _451 * _461;
    bool _473 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _475 = isnan(_343);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = 1.0 / _433;
    float _487 = _439 * _429;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _491 = _343 + _489;
    float _493 = fma(_469, _407, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _495 = 1.0 / _373;
    float _497 = _415 * _455;
    bool _499 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _501 = isnan(_343);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = _491 * _485;
    float _513 = _509 * _465;
    float _515 = -_509;
    float _517 = _515 + 1.0;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _521 = _343 + _519;
    float _523 = _483 * _517;
    float _525 = -_483;
    float _527 = _525 + 1.0;
    float _529 = _521 * _495;
    bool _531 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _533 = isnan(_343);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _543;
    float _547 = _385 * _527;
    float _549 = -_385;
    float _551 = _549 + 1.0;
    bool _553 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _555 = isnan(_343);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = fma(_545, _407, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _567 = -_541;
    float _569 = _567 + 1.0;
    float _571 = _541 * _551;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _577 = -_563;
    float _579 = _577 + 1.0;
    float _581 = _563 * _569;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _587;
    float _591 = _403 * _579;
    float _593 = -_403;
    float _595 = _593 + 1.0;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _597;
    float _601 = fma(_575, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _603 = _493 * _591;
    float _605 = _565 * _591;
    float _607 = fma(_585, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _613 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[143].x, _603);
    float _615 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[143].y, _605);
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _621 = fma(_589, _457, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _623 = fma(_599, _457, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _625 = fma(_601, _581, _613);
    float _627 = fma(_607, _581, _615);
    float _629 = fma(_611, _487, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _631 = fma(_619, _487, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _633;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _637;
    float _641 = fma(_621, _571, _625);
    float _643 = fma(_623, _571, _627);
    float _645 = fma(_635, _497, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _647 = fma(_639, _497, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _655 = _653 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _657 = fma(_629, _547, _641);
    float _659 = fma(_631, _547, _643);
    float _661 = fma(_651, _529, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _663 = fma(_655, _529, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _669;
    float _673 = fma(_645, _523, _657);
    float _675 = fma(_647, _523, _659);
    float _677 = fma(_667, _511, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _679 = fma(_671, _511, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _681 = fma(_661, _513, _673);
    float _683 = fma(_663, _513, _675);
    float _685 = fma(_677, _471, _681);
    float _687 = fma(_679, _471, _683);
    float _689 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[150].x, _685);
    float _691 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[150].y, _687);
    bool _693 = !_453;
    float _709;
    if (!_693)
    {
        float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _697 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[11].x, _137);
        float _701 = _699 * _695;
        float _703 = floor(_701);
        float _705 = -_703;
        float _707 = _701 + _705;
        _709 = _707;
        _711 = true;
    }
    else
    {
        float _713 = float(_103);
        float _715 = 1.0 / _713;
        float _717 = _137 * _715;
        _709 = _717;
    }
    _711 = false;
    float _719 = _709;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _723 = _719 + _721;
    bool _725 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _727 = isnan(_719);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _739 = _719 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _741;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _749 = 1.0 / _743;
    bool _751 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _753 = 1.0 / _747;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _755;
    float _759 = _723 * _749;
    bool _761 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _763 = isnan(_719);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = -_735;
    float _775 = _773 + 1.0;
    bool _777 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _779 = isnan(_719);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = fma(_757, _759, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _791 = _787 * _775;
    float _793 = -_787;
    float _795 = _793 + 1.0;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _801;
    float _805 = _739 * _753;
    float _807 = _771 * _795;
    float _809 = fma(_799, _759, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _811 = fma(_803, _759, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _813 = -_771;
    float _815 = _813 + 1.0;
    float _817 = _789 * _807;
    float _819 = _809 * _807;
    float _821 = _811 * _807;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _829 = _827 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _833 = _831 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _835 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[107].x, _819);
    float _837 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[107].y, _817);
    float _839 = fma(_825, _805, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _841 = fma(_829, _805, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _843 = fma(_833, _805, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _845 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[107].z, _821);
    float _847 = fma(_839, _791, _835);
    float _849 = fma(_841, _791, _837);
    float _851 = fma(_843, _791, _845);
    float _853 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[109].x, _847);
    float _855 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[109].y, _849);
    float _857 = in.m_58.x;
    float _859 = in.m_58.y;
    float _861 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[109].z, _851);
    float _863 = _853 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _865 = _855 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _867 = _861 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _871 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _873 = _865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _875 = _867 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _871;
    out.m_60.y = _873;
    out.m_60.z = _875;
    out.m_60.w = _869;
    float _877 = _691 * _859;
    float _879 = _689 * _857;
    bool _881 = !_751;
    float _899;
    float _901;
    if (!_881)
    {
        float _883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _885 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _887 = float(_103);
        float _889 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[11].z, _137);
        float _891 = _889 * _883;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _887;
        _901 = _897;
        _903 = true;
    }
    else
    {
        float _905 = float(_103);
        float _907 = 1.0 / _905;
        float _909 = _137 * _907;
        _899 = _905;
        _901 = _909;
    }
    _903 = false;
    float _911 = _899;
    float _913 = _901;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _917 = int(_915);
    float _919 = in.m_46.x;
    float _921 = in.m_46.y;
    float _923 = in.m_46.z;
    float _925 = in.m_62.x;
    float _927 = in.m_62.y;
    float _929 = in.m_62.z;
    float _931 = in.m_62.w;
    float _933 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _935 = int(_933);
    float _937 = float(_917);
    float _939 = 1.0 / _911;
    float _941 = float(uint(_935));
    float _943 = 1.0 / _937;
    int _945 = ~_935;
    int _947 = _945 + 1;
    float _949 = _921 * _927;
    float _951 = 1.0 / _941;
    float _953 = fma(_919, _925, _949);
    float _955 = fma(_923, _929, _953);
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _959 = _913 + _957;
    float _961 = _943 * _137;
    float _963 = _955 + _931;
    float _965 = trunc(_961);
    int _967 = int(_965);
    int _969 = as_type<int>(_951) + (-2);
    float _971 = float(uint(_967));
    float _973 = as_type<float>(_969) * _971;
    float _975 = trunc(_973);
    float _977 = precise::max(_975, 0.0);
    uint _980 = uint(_977);
    float _982 = float(_967);
    int _984 = _947 * int(_980);
    int _986 = _984 + _967;
    float _988 = float(uint(_986));
    float _990 = as_type<float>(_969) * _988;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _994 = _992 != 0;
    bool _996 = !_994;
    float _998 = _996 ? 7.345489978790283203125 : 1.0;
    float _1000 = trunc(_990);
    float _1002 = precise::max(_1000, 0.0);
    uint _1004 = uint(_1002);
    float _1006 = _998 * _159;
    float _1008 = floor(_1006);
    int _1010 = int(_980) + int(_1004);
    float _1012 = float(_935);
    int _1014 = _947 * _1010;
    int _1016 = _1014 + _967;
    bool _1018 = _982 >= _1012;
    bool _1020 = isnan(_982);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(_1012);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_1008;
    float _1032 = _1006 + _1030;
    int _1034 = _935 + (-1);
    bool _1036 = uint(_1016) >= uint(_935);
    float _1038 = trunc(_1028);
    int _1040 = int(_1038);
    float _1042 = _1032 * _1012;
    bool _1044 = !_1036;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = _935 == 0;
    int _1050 = ~_1010;
    int _1052 = _1050 + _1046;
    int _1054 = _1052 + 1;
    float _1056 = trunc(_1042);
    int _1058 = int(_1056);
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1066 = _1064 != 0;
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1070 = _1068 != 0;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1074 = _1072 != 0;
    int _1076 = _935 * _1054;
    int _1078 = _1076 + _967;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1082 = _1080 != 0;
    bool _1084 = !_1074;
    int _1086 = _1084 ? 0 : 1;
    int _1088 = ~_1040;
    int _1090 = _1088 + 1;
    int _1092 = _1090 + 1;
    bool _1094 = !_1048;
    int _1096 = _1094 ? _1078 : (-1);
    float _1098 = _1012 * _137;
    int _1100 = abs(_1086);
    bool _1102 = !_1066;
    int _1104 = _1102 ? 0 : 1;
    int _1106 = _1096 * _1092;
    float _1108 = _1098 * _939;
    int _1110 = _1058 * _1100;
    int _1112 = _1110 + _967;
    int _1114 = abs(_1104);
    int _1116 = _1040 * _1034;
    int _1118 = _1116 + _1106;
    float _1120 = trunc(_1108);
    int _1122 = int(_1120);
    float _1124 = in.m_64.x;
    float _1126 = in.m_64.y;
    float _1128 = in.m_64.z;
    float _1130 = in.m_64.w;
    bool _1132 = !_1062;
    int _1134 = _1132 ? 0 : 1;
    int _1136 = _1118 * _1114;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1140 = _1138 != 0;
    float _1142 = in.m_66.x;
    float _1144 = in.m_66.y;
    float _1146 = in.m_66.z;
    float _1148 = in.m_66.w;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1156 = _1154 != 0;
    float _1158 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1160 = log2(_1158);
    int _1162 = abs(_1134);
    bool _1164 = !_1070;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = in.m_53.y;
    bool _1170 = !_1082;
    int _1172 = _1170 ? 0 : 1;
    int _1174 = abs(_1166);
    int _1176 = _1122 * _1162;
    int _1178 = _1176 + _1136;
    int _1180 = abs(_1172);
    int _1182 = ~_935;
    int _1184 = _1182 + 1;
    int _1186 = _1112 * _1174;
    int _1188 = _1186 + _1178;
    bool _1190 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1192 = isnan(1.0);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1198 = _1194 || _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1202 = 1.0 + _1200;
    bool _1204 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1206 = isnan(0.0);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1212 = _1208 || _1210;
    float _1214 = _921 * _1126;
    int _1216 = _1058 * _1180;
    int _1218 = _1216 + _1188;
    float _1220 = _1160 * _137;
    float _1222 = _921 * _1144;
    float _1224 = fma(_919, _1124, _1214);
    float _1226 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1228 = _159 * 2.0;
    float _1230 = fma(_919, _1142, _1222);
    float _1232 = float(uint(_1218));
    float _1234 = exp2(_1220);
    float _1236 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1238 = as_type<float>(_969) * _1232;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1240;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1246 = _159 > 0.5;
    float _1248 = floor(_1228);
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1252 = -_1244;
    float _1254 = fma(_1226, 2.0, _1252);
    float _1256 = float(uint(_1112));
    float _1258 = fma(_1236, -2.0, _1250);
    float _1260 = trunc(_1238);
    float _1262 = precise::max(_1260, 0.0);
    uint _1264 = uint(_1262);
    float _1266 = -_1234;
    float _1268 = _1266 + 1.0;
    float _1270 = -_207;
    int _1272 = _1246 ? as_type<int>(_1270) : as_type<int>(_207);
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1276 = _1168 > 0.5;
    float _1278 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1258);
    float _1280 = _1212 ? _1268 : 0.0;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1284 = _1282 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1286 = 1.0 / _1202;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1290 = -_195;
    int _1292 = _1276 ? as_type<int>(_1290) : as_type<int>(_195);
    float _1294 = as_type<float>(_969) * _1256;
    bool _1296 = _1248 > 0.0;
    float _1298 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1288);
    bool _1300 = _1248 >= 0.0;
    bool _1302 = isnan(_1248);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan(0.0);
    bool _1308 = _1304 || _1306;
    float _1310 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1274);
    int _1312 = _1184 * int(_1264);
    int _1314 = _1312 + _1218;
    float _1316 = in.m_53.z;
    float _1318 = 1.0 / _1284;
    float _1320 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1310);
    float _1322 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1298);
    float _1324 = float(uint(_1314));
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1328 = _913 + _1326;
    bool _1330 = !_1152;
    float _1332 = _1330 ? _207 : as_type<float>(_1272);
    float _1334 = -_1322;
    float _1336 = _1334 + 1.0;
    float _1338 = as_type<float>(_969) * _1324;
    bool _1340 = !_1156;
    float _1342 = _1340 ? _195 : as_type<float>(_1292);
    float _1344 = _1168 * 2.0;
    float _1346 = -_137;
    float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1254);
    float _1350 = trunc(_1338);
    float _1352 = precise::max(_1350, 0.0);
    uint _1354 = uint(_1352);
    float _1356 = _963;
    if (_1198)
    {
        float _1358 = _1280 * _1286;
        _139 = _1358;
    }
    float _1360 = _139;
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1372 = _1370 != 0;
    float _1374 = fma(_923, _1128, _1224);
    float _1376 = _1328 * _1318;
    float _1378 = _1374 + _1130;
    float _1380 = 1.0 / _1242;
    float _1382 = fma(_923, _1146, _1230);
    int _1384 = ~_935;
    int _1386 = _1384 + 1;
    float _1388 = _1316 * 2.0;
    int _1390 = _1308 ? 0 : 1;
    float _1392 = _1168 + _1316;
    float _1394 = _1382 + _1148;
    float _1396 = _1342 + (-0.5);
    float _1398 = floor(_1344);
    int _1400 = int(_1264) + int(_1354);
    float _1402 = _159 + _1168;
    int _1404 = ~_1390;
    int _1406 = _1404 + 1;
    int _1408 = _1406 + 1;
    float _1410 = _1168 + (-0.5);
    int _1412 = _1408;
    float _1414 = _1394;
    if (!_1296)
    {
        int _1416 = ~_1390;
        int _1418 = _1416 + 1;
        _1412 = _1418;
    }
    int _1420 = _1412;
    float _1422 = floor(_1388);
    int _1424 = _1386 * _1400;
    int _1426 = _1424 + _1218;
    float _1428 = _1402 + (-1.0);
    float _1430 = _959 * _1380;
    float _1432 = _1392 + (-1.0);
    bool _1434 = uint(_1426) >= uint(_935);
    float _1436 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1438 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1440 = !_1434;
    int _1442 = _1440 ? 0 : (-1);
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1444;
    bool _1448 = _1398 >= 0.0;
    bool _1450 = isnan(_1398);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan(0.0);
    bool _1456 = _1452 || _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1458;
    int _1462 = _1456 ? 0 : 1;
    float _1464 = fma(_1460, _1430, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1466 = _1422 >= 0.0;
    bool _1468 = isnan(_1422);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1478 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1476;
    bool _1480 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1482 = isnan(_913);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1488 = _1484 || _1486;
    float _1490 = float(_1488);
    int _1492 = _1474 ? 0 : 1;
    bool _1494 = _1422 > 0.0;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1498 = _1496 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1502 = _1500 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    bool _1504 = _1398 > 0.0;
    float _1506 = fma(_1478, _1430, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1508 = fma(_1446, _1430, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1510 = fma(_1502, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1512 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1514 = isnan(_913);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -_1490;
    float _1526 = _1524 + 1.0;
    int _1528 = ~_1400;
    int _1530 = _1528 + _1442;
    int _1532 = _1530 + 1;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1538 = _913 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1540 = isnan(_913);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = _1522 * _1526;
    float _1552 = -_1522;
    float _1554 = _1552 + 1.0;
    int _1556 = _935 * _1532;
    int _1558 = _1556 + _1218;
    float _1560 = -_1396;
    float _1562 = -_1278;
    float _1564 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1562);
    float _1566 = _1332 + 0.5;
    float _1568 = _1548 * _1554;
    float _1570 = -_1548;
    float _1572 = _1570 + 1.0;
    bool _1574 = !_1048;
    int _1576 = _1574 ? _1558 : (-1);
    float _1578 = fma(_1498, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1580 = _1464 * _1568;
    float _1582 = _1506 * _1568;
    float _1584 = trunc(_1294);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    float _1590 = _1508 * _1568;
    int _1592 = _1576 >> 31;
    float _1594 = fma(_1536, _1376, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1596 = ~_935;
    int _1598 = _1596 + 1;
    float _1600 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1580);
    int _1602 = _1592 & 3;
    float _1604 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1348);
    float _1606 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1582);
    float _1608 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1590);
    int _1610 = _1576 + _1602;
    bool _1612 = !_1368;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1594, _1550, _1608);
    int _1618 = _1610 >> 2;
    int _1620 = _1598 * int(_1588);
    int _1622 = _1620 + _1112;
    int _1624 = abs(_1614);
    int _1626 = _1618 << 4;
    int _1628 = _1626 + 368;
    float _1630 = float(uint(_1622));
    float _1632 = fma(_1578, _1550, _1600);
    float _1634 = -_1320;
    float _1636 = _1634 + 1.0;
    int _1638 = ~_1462;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    uint _1644 = uint(int(uint(_1628) >> uint(2)));
    uint _1646 = uint(int(uint(int(_1644)) >> uint(2)));
    int _1648 = int(_1644) & 3;
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[int(_1646)][_1648];
    int _1652 = int(_1644) + 1;
    uint _1654 = uint(int(uint(_1652) >> uint(2)));
    int _1656 = _1652 & 3;
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[int(_1654)][_1656];
    float _1660 = as_type<float>(_969) * _1630;
    int _1662 = _1642;
    if (!_1504)
    {
        int _1664 = ~_1462;
        int _1666 = _1664 + 1;
        _1662 = _1666;
    }
    int _1668 = _1662;
    float _1670 = fma(_1342, _1336, _1564);
    float _1672 = -_1636;
    float _1674 = fma(_1332, _1672, _1604);
    int _1676 = _1576 & 3;
    bool _1678 = _1676 != 0;
    float _1680 = fma(_1510, _1550, _1606);
    float _1682 = trunc(_1660);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = _1628 + 8;
    uint _1690 = uint(int(uint(_1688) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    int _1706 = ~_1492;
    int _1708 = _1706 + 1;
    int _1710 = _1708 + 1;
    out.m_68.x = _1674;
    out.m_68.y = _1670;
    int _1712 = _1710;
    if (!_1494)
    {
        int _1714 = ~_1492;
        int _1716 = _1714 + 1;
        _1712 = _1716;
    }
    int _1718 = _1712;
    float _1720 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1680);
    float _1722 = float(_1420);
    bool _1724 = uint(_1676) > 1u;
    float _1726 = float(_1624);
    bool _1728 = !_1364;
    int _1730 = _1728 ? 0 : 1;
    int _1732 = _1576 & 3;
    bool _1734 = _1732 != 0;
    float _1736 = _1726 * _1722;
    int _1738 = abs(_1730);
    int _1740 = ~_935;
    int _1742 = _1740 + 1;
    float _1744 = _1736 * (-2.0);
    int _1746 = _1734 ? 0 : 1;
    int _1748 = int(_1588) + int(_1686);
    float _1750 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1616);
    int _1752 = ~_1746;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    int _1758 = _1756;
    if (!_1724)
    {
        int _1760 = ~_1746;
        int _1762 = _1760 + 1;
        _1758 = _1762;
    }
    int _1764 = _1758;
    float _1766 = float(_1738);
    float _1768 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1632);
    int _1770 = _1742 * _1748;
    int _1772 = _1770 + _1112;
    bool _1774 = !_1678;
    int _1776 = _1774 ? 0 : 1;
    int _1778 = abs(_1764);
    bool _1780 = _1676 != 3;
    int _1782 = abs(_1776);
    float _1784 = float(_1718);
    bool _1786 = uint(_1676) >= 2u;
    float _1788 = _1766 * _1784;
    bool _1790 = uint(_1772) >= uint(_935);
    int _1792 = ~_1778;
    int _1794 = _1792 + 1;
    int _1796 = _1794 + 1;
    int _1798 = _1786 ? 0 : 1;
    bool _1800 = !_1790;
    int _1802 = _1800 ? 0 : (-1);
    int _1804 = _1796 * as_type<int>(_1658);
    int _1806 = ~_1782;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    bool _1812 = _1676 != 3;
    int _1814 = ~_1798;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = in.m_70.x;
    float _1822 = in.m_70.y;
    float _1824 = in.m_70.z;
    int _1826 = _1818;
    float _1828 = _1768;
    if (_1780)
    {
        int _1830 = ~_1798;
        int _1832 = _1830 + 1;
        _1826 = _1832;
    }
    int _1834 = _1826;
    int _1836 = ~_1748;
    int _1838 = _1836 + _1802;
    int _1840 = _1838 + 1;
    int _1842 = _1810 * as_type<int>(_1650);
    int _1844 = _1842 + _1804;
    bool _1846 = !_1812;
    int _1848 = _1846 ? 0 : (-1);
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1852 = _1378 + _1850;
    int _1854 = abs(_1834);
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1858 = _1394 + _1856;
    int _1860 = abs(_1848);
    float _1862 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1866 = _963 + _1864;
    bool _1868 = !_1140;
    int _1870 = _1868 ? 0 : 1;
    int _1872 = _935 * _1840;
    int _1874 = _1872 + _1112;
    int _1876 = ~_1854;
    int _1878 = _1876 + 1;
    int _1880 = _1878 + 1;
    float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1862);
    int _1884 = abs(_1870);
    float _1886 = _1788 * (-2.0);
    int _1888 = ~_1860;
    int _1890 = _1888 + 1;
    int _1892 = _1890 + 1;
    int _1894 = _1880 * as_type<int>(_1696);
    int _1896 = _1894 + _1844;
    float _1898 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1882);
    int _1900 = _1892 * as_type<int>(_1704);
    int _1902 = _1900 + _1896;
    float _1904 = fma(_1438, _1744, _1438);
    float _1906 = _1852 * _1852;
    int _1908 = ~_1884;
    int _1910 = _1908 + 1;
    int _1912 = _1910 + 1;
    float _1914 = fma(_1744, _1822, _1822);
    bool _1916 = _1898 >= 0.0;
    float _1918 = fma(_1866, _1866, _1906);
    float _1920 = fma(_1436, _1886, _1436);
    int _1922 = _1902 * _1912;
    bool _1924 = !_1048;
    int _1926 = _1924 ? _1874 : (-1);
    float _1928 = fma(_1858, _1858, _1918);
    float _1930 = fma(_1886, _1820, _1820);
    float _1932 = _1750 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1934 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1914);
    int _1936 = _1926 * _1884;
    int _1938 = _1936 + _1922;
    float _1940 = _1768 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1942 = rsqrt(_1928);
    float _1944 = _1720 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1946 = _1824;
    if (_1916)
    {
        _1828 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1948 = _1828;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1956 = as_type<int>(_1948);
    if (_1916)
    {
        float _1958 = _1948 * 5.0;
        _1956 = as_type<int>(_1958);
    }
    int _1960 = _1956;
    float _1962 = float(_1938);
    if (_1916)
    {
        out.m_49.x = 0.0;
    }
    bool _1964 = !_1372;
    int _1966 = _1964 ? 0 : 1;
    float _1968 = fma(_1904, _1360, _1934);
    float _1970 = _159 + (-0.5);
    out.m_72.x = _1950;
    out.m_72.y = _1954;
    out.m_72.z = _1952;
    int _1972 = abs(_1966);
    float _1974 = _1852 * _1942;
    if (_1916)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6253 = as_type<float>(_1960);
        out.gl_Position.z = _6253;
    }
    float _1976 = _1866 * _1942;
    out.m_74.x = _1962;
    if (_1916)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1978 = -_1974;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1378);
    float _1982 = _1858 * _1942;
    float _1984 = -_1976;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1990 = _1980 + _1988;
    float _1992 = float(_1972);
    float _1994 = -_1982;
    float _1996 = fma(_1994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2000 = _1986 + _1998;
    float _2002 = _1990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2004 = float(_1668);
    float _2006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2008 = _1996 + _2006;
    float _2010 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1930);
    float _2012 = fma(_2000, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2002);
    float _2014 = _159 + _1316;
    float _2016 = _1992 * _2004;
    float _2018 = -_1974;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1852);
    float _2022 = fma(_2008, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2012);
    float _2024 = fma(_1920, _1360, _2010);
    float _2026 = _2014 + (-1.0);
    float _2028 = _2016 * (-2.0);
    bool _2030 = _2022 >= 0.0;
    float _2032 = -_1976;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1866);
    float _2036 = _2020 * _2020;
    float _2038 = fma(_2026, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2040 = fma(_2028, _1824, _1824);
    float _2042 = _1316 + (-0.5);
    float _2044 = fma(_2034, _2034, _2036);
    float _2046 = -_1982;
    float _2048 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1858);
    float _2050 = fma(_2038, _2028, _2038);
    float _2052 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2040);
    float _2054 = _2024 * 0.15915493667125701904296875;
    float _2056 = fma(_2048, _2048, _2044);
    float _2058 = _1982;
    float _2060 = _2008;
    float _2062 = _1980;
    if (_2030)
    {
        _1946 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2064 = _1946;
    float _2066 = fma(_2050, _1360, _2052);
    float _2068 = _2054 * 6.283185482025146484375;
    float _2070 = sin(_2068);
    float _2072 = _1968 * 0.15915493667125701904296875;
    int _2074 = as_type<int>(_2064);
    if (_2030)
    {
        out.m_49.x = 0.0;
    }
    if (_2030)
    {
        float _2076 = _2064 * 5.0;
        _2074 = as_type<int>(_2076);
    }
    int _2078 = _2074;
    float _2080 = _315 * _877;
    float _2082 = sqrt(_2056);
    if (_2030)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6444 = as_type<float>(_2078);
        out.gl_Position.z = _6444;
    }
    float _2084 = _2054 * 6.283185482025146484375;
    float _2086 = cos(_2084);
    float _2088 = _2072 * 6.283185482025146484375;
    float _2090 = sin(_2088);
    float _2092 = _2072 * 6.283185482025146484375;
    float _2094 = cos(_2092);
    float _2096 = _2066 * 0.15915493667125701904296875;
    if (_2030)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2098 = _2096 * 6.283185482025146484375;
    float _2100 = cos(_2098);
    float _2102 = _1942 * _2082;
    float _2104 = _2080 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2106 = _311 * _879;
    float _2108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _2110 = _2086 * _2094;
    float _2112 = _2102 * _2104;
    float _2114 = _2106 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2116 = _2096 * 6.283185482025146484375;
    float _2118 = sin(_2116);
    float _2120 = _2086 * _2090;
    float _2122 = _2108 * _2112;
    float _2124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2126 = _2102 * _2114;
    float _2128 = _2070 * _2090;
    float _2130 = _2070 * _2094;
    float _2132 = _2086 * _2100;
    float _2134 = _2124 * _2126;
    float _2136 = _2094 * _2100;
    float _2138 = _2070 * _2100;
    float _2140 = _2132 * _2122;
    float _2142 = _2090 * _2100;
    float _2144 = _2102 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2146 = _2144 * 0.5;
    float _2148 = fma(_2118, _2110, _2128);
    float _2150 = -_2122;
    float _2152 = _2118 * _2150;
    float _2154 = -_2130;
    float _2156 = fma(_2118, _2120, _2154);
    float _2158 = -_2120;
    float _2160 = fma(_2118, _2130, _2158);
    float _2162 = fma(_2148, _2134, _2140);
    float _2164 = fma(_2136, _2134, _2152);
    float _2166 = _2138 * _2122;
    float _2168 = fma(_2118, _2128, _2110);
    float _2170 = fma(_2156, _2146, _2162);
    float _2172 = fma(_2142, _2146, _2164);
    float _2174 = fma(_2160, _2134, _2166);
    float _2176 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2178 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2180 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2182 = fma(_2168, _2146, _2174);
    float _2184 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2178);
    float _2188 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2180);
    float _2190 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2192 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2176);
    float _2194 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2186);
    float _2196 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2188);
    float _2198 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2184);
    float _2200 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2190);
    float _2202 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2204 = _2196 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2206 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2208 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2210 = _963 + _2202;
    float _2212 = _1394 + _2204;
    float _2214 = _2132 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2216 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2220 = _2210 + _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2224 = _2212 + _2222;
    float _2226 = -_2118;
    float _2228 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2206);
    float _2230 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2216);
    float _2232 = _2220 * _2220;
    float _2234 = _2224 * _2224;
    float _2236 = -_2118;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2208);
    float _2240 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2242 = -_2118;
    float _2244 = fma(_2242, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2214);
    float _2246 = _2232 + _2234;
    float _2248 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2192);
    float _2250 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2198);
    float _2252 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2254 = sqrt(_2246);
    float _2256 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2258 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2260 = _2240 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2262 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2200);
    float _2264 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2252);
    float _2266 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2256);
    float _2268 = _1378 + _2260;
    float _2270 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2258);
    bool _2272 = _2254 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2274 = _2240;
    float _2276 = _2260;
    float _2278 = _2142;
    float _2280 = _2200;
    float _2282 = _2232;
    float _2284 = _2250;
    if (!_2272)
    {
        _2274 = _2234;
    }
    float _2286 = _2274;
    float _2288 = _2286;
    if (!_2272)
    {
        _2276 = _2210;
    }
    float _2290 = _2276;
    float _2292 = _2290;
    if (!_2272)
    {
        _2278 = _2212;
    }
    float _2294 = _2278;
    float _2296 = _2294;
    if (!_2272)
    {
        _2280 = _2268;
    }
    float _2298 = _2280;
    bool _2300 = !_2272;
    float _2302 = _2298;
    if (!_2300)
    {
        float _2304 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2308 = _2254 + _2306;
        float _2310 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2312 = rsqrt(_2246);
        float _2314 = _2308 * _2304;
        float _2316 = _2314 * 0.15915493667125701904296875;
        float _2318 = _2316 * 6.283185482025146484375;
        float _2320 = sin(_2318);
        float _2322 = _2316 * 6.283185482025146484375;
        float _2324 = cos(_2322);
        float _2326 = fma(_2320, _2310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2328 = _2312 * _2326;
        float _2330 = _2324 + (-1.0);
        float _2332 = fma(_2220, _2328, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2334 = fma(_2224, _2328, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2336 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2340 = _2332 + _2338;
        float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2344 = _2334 + _2342;
        float _2346 = fma(_2268, _2324, _2336);
        float _2348 = _2340 * _2340;
        float _2350 = _2344 * _2344;
        _2302 = _2346;
        _2282 = _2348;
        _2288 = _2350;
        _2296 = _2334;
        _2292 = _2332;
    }
    float _2352 = _2302;
    float _2354 = _2282;
    float _2356 = _2288;
    float _2358 = _2296;
    float _2360 = _2292;
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2364 = _2352 + _2362;
    float _2366 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2368 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2238);
    float _2370 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2372 = fma(_2364, _2364, _2354);
    float _2374 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2244);
    float _2376 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2264);
    float _2378 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2266);
    float _2380 = _2372 + _2356;
    float _2382 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    float _2384 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2386 = _2370 * _2366;
    float _2388 = _2370 * _2368;
    float _2390 = _2370 * _2374;
    float _2392 = sqrt(_2380);
    float _2394 = fma(_2384, _2248, _2386);
    float _2396 = fma(_2384, _2250, _2388);
    float _2398 = fma(_2384, _2262, _2390);
    float _2400 = _2376 + _2394;
    float _2402 = _2378 + _2396;
    float _2404 = _2382 + _2398;
    out.m_76.x = _2400;
    out.m_76.y = _2402;
    out.m_76.z = _2404;
    bool _2406 = _2392 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2408 = isnan(_2392);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2414 = _2410 || _2412;
    float _2416 = _2360;
    if (!_2414)
    {
        _2284 = 1.0;
    }
    float _2418 = _2284;
    bool _2420 = !_2414;
    float _2422 = _2418;
    if (!_2420)
    {
        bool _2424 = _2392 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2426 = isnan(_2392);
        bool _2428 = _2424 || _2426;
        bool _2430 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2432 = _2428 || _2430;
        if (!_2432)
        {
            float _2434 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2436 = _2392 + _2434;
            float _2438 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2440 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2438;
            float _2442 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2444 = _2442 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2446 = 1.0 / _2440;
            float _2448 = _2436 * _2446;
            float _2450 = fma(_2448, _2444, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2422 = _2450;
            _2452 = true;
        }
        else
        {
            bool _2454 = _2392 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2456 = isnan(_2392);
            bool _2458 = _2454 || _2456;
            bool _2460 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2462 = _2458 || _2460;
            if (!_2462)
            {
                float _2464 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2466 = _2392 + _2464;
                float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2470 = _2468 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2472 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2474 = _2472 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2476 = 1.0 / _2470;
                float _2478 = _2466 * _2476;
                float _2480 = fma(_2478, _2474, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2422 = _2480;
                _2452 = true;
            }
            else
            {
                _2422 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2452 = false;
    float _2482 = _2422;
    float _2484 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2486 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2488 = _2358 + _2486;
    float _2490 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2484);
    float _2492 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2494 = fma(_2488, _2482, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2496 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2490);
    bool _2498 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan(0.5);
    bool _2506 = _2502 || _2504;
    bool _2508 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2512 = _2508 || _2510;
    bool _2514 = isnan(0.5);
    bool _2516 = _2512 || _2514;
    float _2518 = _2496 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2520 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2492);
    float _2522 = 1.0 / _2518;
    float _2524 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2520);
    float _2526 = _2524 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2528 = _2526 + _2518;
    float _2530 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2532 = _2352 + _2530;
    float _2534 = fma(_2532, _2482, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2536 = _2528 * _2522;
    float _2538 = _2536 * 0.5;
    float _2540 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2542 = _2360 + _2540;
    float _2544 = -_1974;
    float _2546 = fma(_2544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2534);
    float _2548 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_2516)
    {
        _2416 = 1.0;
    }
    float _2550 = _2416;
    float _2552 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2554 = fma(_2538, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2552);
    float _2556 = fma(_2542, _2482, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2558 = -_1982;
    float _2560 = fma(_2558, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2494);
    float _2562 = _2560;
    float _2564 = _2550;
    if (_2506)
    {
        _2058 = _2546;
    }
    float _2566 = _2058;
    float _2568 = -_1976;
    float _2570 = fma(_2568, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2556);
    float _2572 = 1.0 / _2554;
    float _2574 = _2566;
    float _2576 = _2570;
    if (!_2506)
    {
        float _2578 = _1990 * _1990;
        float _2580 = 1.0 / _2102;
        float _2582 = -_1378;
        float _2584 = _2582 + _2534;
        float _2586 = -_1394;
        float _2588 = _2586 + _2494;
        float _2590 = fma(_2000, _2000, _2578);
        float _2592 = fma(_2008, _2008, _2590);
        float _2594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2596 = sqrt(_2592);
        float _2598 = precise::min(_2596, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2600 = _2598 * _2594;
        float _2602 = -_963;
        float _2604 = _2602 + _2556;
        float _2606 = _2600 * _2580;
        float _2608 = fma(_2604, _2606, _1986);
        float _2610 = fma(_2584, _2606, _1980);
        float _2612 = fma(_2588, _2606, _1996);
        _2574 = _2610;
        _2576 = _2608;
        _2562 = _2612;
        _2060 = _2596;
    }
    float _2614 = _2574;
    float _2616 = _2576;
    float _2618 = _2562;
    float _2620 = _2060;
    float _2622 = _2620;
    if (_2516)
    {
        _1414 = 1.0;
    }
    float _2624 = _1414;
    float _2626 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2628 = _2572 * _2626;
    float _2630 = _2624;
    if (!_2516)
    {
        float _2632 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2634 = _2632 * 0.15915493667125701904296875;
        float _2636 = _2634 * 6.283185482025146484375;
        float _2638 = cos(_2636);
        float _2640 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2642 = _2640 * 0.15915493667125701904296875;
        float _2644 = _2634 * 6.283185482025146484375;
        float _2646 = sin(_2644);
        float _2648 = 1.0 / _2638;
        float _2650 = _2642 * 6.283185482025146484375;
        float _2652 = cos(_2650);
        float _2654 = _2646 * _2648;
        float _2656 = _2642 * 6.283185482025146484375;
        float _2658 = sin(_2656);
        float _2660 = _2652 * _2654;
        float _2662 = 1.0 / _2660;
        float _2664 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2666 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2664;
        float _2668 = 1.0 / _2666;
        float _2670 = _2658 * _2662;
        float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2674 = fma(_2628, _2670, _2672);
        float _2676 = _2674 * _2668;
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        _2062 = _2642;
        _2622 = _2634;
        _2564 = _2678;
    }
    float _2680 = _2062;
    float _2682 = _2622;
    float _2684 = _2564;
    float _2686 = _2680;
    float _2688 = _2682;
    if (!_2516)
    {
        float _2690 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2692 = _2690 * 0.15915493667125701904296875;
        float _2694 = _2692 * 6.283185482025146484375;
        float _2696 = cos(_2694);
        float _2698 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2700 = _2698 * 0.15915493667125701904296875;
        float _2702 = _2692 * 6.283185482025146484375;
        float _2704 = sin(_2702);
        float _2706 = 1.0 / _2696;
        float _2708 = _2700 * 6.283185482025146484375;
        float _2710 = cos(_2708);
        float _2712 = _2704 * _2706;
        float _2714 = _2700 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        float _2718 = _2710 * _2712;
        float _2720 = 1.0 / _2718;
        float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2724 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2722;
        float _2726 = 1.0 / _2724;
        float _2728 = _2716 * _2720;
        float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2732 = fma(_2628, _2728, _2730);
        float _2734 = _2732 * _2726;
        float _2736 = precise::clamp(_2734, 0.0, 1.0);
        float _2738 = -_2736;
        float _2740 = _2738 + 1.0;
        _2686 = _2706;
        _2630 = _2740;
    }
    float _2742 = _2686;
    float _2744 = _2630;
    float _2746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2748 = _2614 + _2746;
    float _2750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2752 = _2616 + _2750;
    float _2754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2756 = _2618 + _2754;
    float _2758 = _2748 * _2748;
    float _2760 = fma(_2752, _2752, _2758);
    float _2762 = fma(_2756, _2756, _2760);
    float _2764 = rsqrt(_2762);
    float _2766 = sqrt(_2762);
    float _2768 = _2764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2770 = _2752 * _2768;
    float _2772 = _2756 * _2768;
    float _2774 = _2770 * _2770;
    float _2776 = _2772 * _2772;
    float _2778 = _2774 + _2776;
    float _2780 = sqrt(_2778);
    bool _2782 = _2780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2786 = _2780 + _2784;
    float _2788 = _2742;
    float _2790 = _2786;
    float _2792 = _2748;
    float _2794 = _2770;
    if (_2782)
    {
        float _2796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2788 = _2796;
    }
    float _2798 = _2788;
    if (_2782)
    {
        float _2800 = rsqrt(_2778);
        _2688 = _2800;
    }
    float _2802 = _2688;
    float _2804 = _2802;
    if (_2782)
    {
        float _2806 = _2786 * _2798;
        _2790 = _2806;
    }
    float _2808 = _2790;
    if (_2782)
    {
        float _2810 = _2808 * 0.15915493667125701904296875;
        _1356 = _2810;
    }
    float _2812 = _1356;
    float _2814 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2816 = _2756;
    if (_2782)
    {
        float _2818 = _2812 * 6.283185482025146484375;
        float _2820 = sin(_2818);
        _2816 = _2820;
    }
    float _2822 = _2816;
    float _2824 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2826 = precise::max(0.0, _2824);
    float _2828 = _2798;
    float _2830 = _2826;
    if (_2782)
    {
        float _2832 = _2812 * 6.283185482025146484375;
        float _2834 = cos(_2832);
        _2828 = _2834;
    }
    float _2836 = _2828;
    float _2838 = -_2768;
    float _2840 = -_2826;
    float _2842 = fma(_2748, _2838, _2840);
    if (_2782)
    {
        float _2844 = _2842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2792 = _2844;
    }
    float _2846 = _2792;
    float _2848 = _2846;
    float _2850 = _2822;
    if (_2782)
    {
        float _2852 = fma(_2822, _2846, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2848 = _2852;
    }
    float _2854 = _2848;
    float _2856 = _2854;
    if (!_2782)
    {
        _2850 = _2774;
    }
    float _2858 = _2850;
    float _2860 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2862 = _2858;
    float _2864 = _2836;
    if (_2782)
    {
        float _2866 = _2836 + (-1.0);
        _2830 = _2866;
    }
    float _2868 = _2830;
    float _2870 = _2868;
    if (_2782)
    {
        float _2872 = _2802 * _2854;
        _2548 = _2872;
    }
    float _2874 = _2548;
    if (!_2782)
    {
        _2856 = _2842;
    }
    float _2876 = _2856;
    float _2878 = _2876;
    if (_2782)
    {
        float _2880 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2804 = _2880;
    }
    float _2882 = _2804;
    if (_2782)
    {
        float _2884 = _2770 * _2874;
        _2794 = _2884;
    }
    float _2886 = _2794;
    if (!_2782)
    {
        _2870 = _2772;
    }
    float _2888 = _2870;
    float _2890 = _2888;
    if (_2782)
    {
        float _2892 = _2772 * _2874;
        _2890 = _2892;
    }
    float _2894 = _2890;
    if (_2782)
    {
        float _2896 = fma(_2842, _2836, _2882);
        _2878 = _2896;
    }
    float _2898 = _2878;
    if (_2782)
    {
        float _2900 = _2886 * _2886;
        _2862 = _2900;
    }
    float _2902 = _2862;
    if (!_2782)
    {
        _2864 = _2776;
    }
    float _2904 = _2864;
    float _2906 = _2904;
    if (_2782)
    {
        float _2908 = _2894 * _2894;
        _2906 = _2908;
    }
    float _2910 = _2906;
    float _2912 = fma(_2898, _2898, _2902);
    float _2914 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2916 = _2912 + _2910;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2920 = fma(_2766, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2918);
    float _2922 = precise::clamp(_2920, 0.0, 1.0);
    float _2924 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2914);
    float _2926 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2928 = rsqrt(_2916);
    float _2930 = -_2922;
    float _2932 = _2930 + 1.0;
    float _2934 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2924);
    float _2936 = _2614 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2938 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2926);
    float _2940 = _2934 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2942 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2936);
    float _2944 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2938);
    float _2946 = fma(_2616, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2860);
    float _2948 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2950 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2942);
    float _2952 = _2944 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2954 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2946);
    float _2956 = abs(_2932);
    float _2958 = log2(_2956);
    float _2960 = -_2948;
    float _2962 = fma(_2960, _2814, 1.0);
    float _2964 = _2950 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2966 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2968 = _2954 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2970 = _2928 * _2886;
    float _2972 = _2928 * _2894;
    float _2974 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2966);
    float _2976 = _2928 * _2898;
    float _2978 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2980 = log2(_2962);
    float _2982 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2974);
    float _2984 = -_2978;
    float _2986 = fma(_2976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2984);
    float _2988 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2982);
    float _2990 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2992 = -_2972;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2986);
    float _2996 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2998 = 1.0 / _2988;
    float _3000 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3002 = fma(_2994, -0.5, 0.5);
    float _3004 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2996);
    float _3006 = fma(_2994, 0.5, 0.5);
    float _3008 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3000);
    float _3010 = _2976 + 1.0;
    float _3012 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3004);
    float _3014 = exp2(_2990);
    float _3016 = fma(_3006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3018 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3008);
    float _3020 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3012);
    float _3022 = _2980 * 0.693147182464599609375;
    float _3024 = fma(_3006, _3016, -0.212114393711090087890625);
    float _3026 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3018);
    float _3028 = sqrt(_3002);
    float _3030 = _3020 * _2998;
    float _3032 = fma(_3006, _3024, 1.570728778839111328125);
    float _3034 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3036 = fma(_3030, 0.5, 0.5);
    float _3038 = -_2976;
    float _3040 = fma(_3014, _3010, _3038);
    float _3042 = _3026 * _2998;
    float _3044 = fma(_3040, 0.5, 0.5);
    float _3046 = fma(_3042, -0.5, 0.5);
    float _3048 = _3028 * 0.636619746685028076171875;
    float3 _8022 = float3(_3036, _3046, _3034);
    float _3050 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8022, float3(0.0), isnan(_8022)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8022, float3(0.0), isnan(_8022)), level(0.0)).x;
    float _3052 = -_3032;
    float _3054 = fma(_3048, _3052, 1.0);
    float3 _8038 = float3(_3036, _3046, _3034);
    float4 _3057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8038, float3(0.0), isnan(_8038)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8038, float3(0.0), isnan(_8038)), level(0.0)).xyzw;
    float _3059 = _3057.x;
    float _3061 = _3057.y;
    float _3063 = _3057.z;
    float _3065 = _3057.w;
    float2 _8055 = float2(_3054, _3044);
    float3 _3069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8055, float2(0.0), isnan(_8055)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8055, float2(0.0), isnan(_8055)), level(0.0)).xyz;
    float _3071 = _3069.x;
    float _3073 = _3069.y;
    float _3075 = _3069.z;
    float _3077 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3079 = _2952 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3081 = _3020 + _2988;
    float _3083 = fma(_2964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3079);
    float _3085 = exp2(_3077);
    float _3087 = _2988 * 0.5;
    float _3089 = _3081 * 0.5;
    float _3091 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3083);
    bool _3093 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3095 = isnan(_2766);
    bool _3097 = _3093 || _3095;
    bool _3099 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3101 = _3097 || _3099;
    float _3103 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3091);
    float _3105 = fma(_3026, -0.5, _3087);
    float _3107 = _3103 + _2988;
    out.gl_Position.x = _3020;
    out.gl_Position.y = _3026;
    out.gl_Position.z = _3103;
    out.gl_Position.w = _2988;
    float _3109 = _3107 * 0.5;
    float _3111 = -_3085;
    float _3113 = _3111 + 1.0;
    float _3115 = _3113 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.x = _3089;
    out.m_78.y = _3105;
    out.m_78.z = _3109;
    out.m_78.w = _2988;
    float _3117 = -_3115;
    float _3119 = _3117 + 1.0;
    float _3121 = _2684 * _2744;
    float _3123 = _3103;
    float _3125 = _3026;
    float _3127 = _3121;
    if (!_3101)
    {
        _3123 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3129 = _3123;
    float _3131 = _3129;
    float _3133 = _3129;
    if (!_3101)
    {
        _3125 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3135 = _3125;
    float _3137 = _3115 * _3050;
    float _3139 = _3065 * _3137;
    float _3141 = _3075 * _3137;
    float _3143 = fma(_3071, _3139, _3059);
    float _3145 = fma(_3073, _3139, _3061);
    float _3147 = _3065 * _3119;
    float _3149 = fma(_3065, _3141, _3063);
    float _3151 = _3121 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3153 = _3135;
    float _3155 = _3135;
    if (!_3101)
    {
        _3127 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3157 = _3127;
    out.m_80.x = _3143;
    out.m_80.y = _3145;
    out.m_80.z = _3149;
    out.m_80.w = _3147;
    bool _3159 = !_3101;
    float _3161 = _3157;
    float _3163 = _3157;
    if (!_3159)
    {
        bool _3165 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3167 = isnan(_2766);
        bool _3169 = _3165 || _3167;
        bool _3171 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3173 = _3169 || _3171;
        if (!_3173)
        {
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3177 = _2766 + _3175;
            float _3179 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3181 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3179;
            float _3183 = 1.0 / _3181;
            float _3185 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3187 = _3185 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3189 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3191 = _3189 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3193 = _3177 * _3183;
            float _3195 = precise::clamp(_3193, 0.0, 1.0);
            float _3197 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3199 = _3197 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3201 = fma(_3195, _3191, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3203 = fma(_3195, _3199, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3205 = fma(_3195, _3187, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3155 = _3205;
            _3133 = _3203;
            _3163 = _3201;
            _3207 = true;
        }
        else
        {
            bool _3209 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3211 = isnan(_2766);
            bool _3213 = _3209 || _3211;
            bool _3215 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3217 = _3213 || _3215;
            if (!_3217)
            {
                _3131 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3219 = _3131;
            _3133 = _3219;
            if (!_3217)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3221 = _3153;
            _3155 = _3221;
            if (!_3217)
            {
                _3161 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3223 = _3161;
            bool _3225 = !_3217;
            _3163 = _3223;
            if (!_3225)
            {
                bool _3227 = _2766 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3229 = isnan(_2766);
                bool _3231 = _3227 || _3229;
                bool _3233 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3235 = _3231 || _3233;
                if (!_3235)
                {
                    float _3237 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3239 = _2766 + _3237;
                    float _3241 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3243 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3241;
                    float _3245 = 1.0 / _3243;
                    float _3247 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3249 = _3247 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3251 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3253 = _3251 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3255 = _3239 * _3245;
                    float _3257 = precise::clamp(_3255, 0.0, 1.0);
                    float _3259 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3261 = _3259 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3263 = fma(_3257, _3253, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3265 = fma(_3257, _3261, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3267 = fma(_3257, _3249, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3155 = _3267;
                    _3133 = _3265;
                    _3163 = _3263;
                    _3207 = true;
                }
                else
                {
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3133 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3163 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3207 = false;
    float _3269 = _3155;
    float _3271 = _3133;
    float _3273 = _3163;
    float _3275 = _3151 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_82.x = 0.0;
    float _3277 = _3269 * 0.586610972881317138671875;
    bool _3279 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _3275;
    float _3281 = fma(_3271, 0.298911988735198974609375, _3277);
    bool _3283 = _2684 > 0.0;
    bool _3285 = isnan(_2684);
    bool _3287 = _3283 || _3285;
    bool _3289 = isnan(0.0);
    bool _3291 = _3287 || _3289;
    float _3293 = fma(_3273, 0.114477999508380889892578125, _3281);
    bool _3295 = _2744 <= 0.0;
    bool _3297 = !_3291;
    bool _3299 = _3295 || _3297;
    float _3301 = -_3293;
    float _3303 = _3301 + _3271;
    float _3305 = -_3293;
    float _3307 = _3305 + _3269;
    float _3309 = -_3293;
    float _3311 = _3309 + _3273;
    float _3313 = fma(_3303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3315 = fma(_3307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3317 = fma(_3311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    bool _3319 = !_3279;
    if (!_3319)
    {
        float _3321 = -_2614;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3325 = -_2616;
        float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3329 = -_2618;
        float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3333 = _3323 * _3323;
        float _3335 = fma(_3327, _3327, _3333);
        float _3337 = fma(_3331, _3331, _3335);
        float _3339 = sqrt(_3337);
        float _3341 = rsqrt(_3337);
        float _3343 = -_3339;
        float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        float _3351 = _3327 * _3341;
        float _3353 = _3323 * _3341;
        float _3355 = abs(_3349);
        float _3357 = log2(_3355);
        float _3359 = _3331 * _3341;
        float _3361 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3363 = _2402 * _3353;
        float _3365 = -_3353;
        float _3367 = -_3361;
        float _3369 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3367);
        float _3371 = fma(_2400, _3351, _3363);
        float _3373 = -_3359;
        float _3375 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3369);
        float _3377 = fma(_2404, _3359, _3371);
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3383 = _3375 + _3381;
        float _3385 = _3357 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3389 = precise::clamp(_3387, 0.0, 1.0);
        float _3391 = exp2(_3385);
        float _3393 = _3391 * _3389;
        float _3395 = _3379 * _3393;
        float _3397 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3399 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3401 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3397;
        out.m_82.y = _3399;
        out.m_82.z = _3401;
    }
    out.m_84.x = _3313;
    out.m_84.y = _3315;
    out.m_84.z = _3317;
    if (!_3299)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3403 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3403;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

