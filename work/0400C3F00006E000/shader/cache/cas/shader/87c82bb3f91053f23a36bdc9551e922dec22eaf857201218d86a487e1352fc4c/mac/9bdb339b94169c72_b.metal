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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(0)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1488 = false;
    bool _347 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1772 = as_type<float>(_115);
        out.gl_Position.z = _1772;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    if (_127)
    {
        float _135 = float(_99);
        _133 = _135;
    }
    float _137 = _133;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    if (_143)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _109;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    int _147 = 0;
    if (_143)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_151);
        out.gl_Position.z = _1840;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_53.x;
    float _155 = in.m_53.y;
    float _157 = in.m_53.z;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _163 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _165 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _167 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    float _173 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _167);
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _169);
    float _177 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _171);
    bool _179 = !_159;
    float _197;
    if (!_179)
    {
        float _181 = in.m_55.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_99);
        float _203 = 1.0 / _201;
        float _205 = _131 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = -_223;
    float _235 = _233 + 1.0;
    float _237 = 1.0 / _227;
    bool _239 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_207);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _231;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = _211 * _237;
    bool _261 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _263 = isnan(_207);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _207 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = fma(_257, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _283 = _271 * _235;
    float _285 = -_271;
    float _287 = _285 + 1.0;
    float _289 = fma(_279, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = _275 * _253;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = _249 * _287;
    float _299 = -_249;
    float _301 = _299 + 1.0;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _307 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = _289 * _297;
    float _311 = _281 * _297;
    float _313 = fma(_305, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _315 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _317 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _319 = fma(_307, _283, _315);
    float _321 = fma(_313, _283, _317);
    float _323 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[145].x, _319);
    float _325 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[145].y, _321);
    bool _327 = !_251;
    float _345;
    if (!_327)
    {
        float _329 = in.m_55.x;
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _333 = _329 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_99);
        float _351 = 1.0 / _349;
        float _353 = _131 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = as_type<float>(int(gl_VertexIndex));
    float _359 = in.m_60.x;
    float _361 = in.m_60.y;
    float _363 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _365 = in.m_46.x;
    float _367 = in.m_46.y;
    float _369 = in.m_46.z;
    int _371 = as_type<int>(_357) & 1;
    bool _373 = _371 != 0;
    int _375 = as_type<int>(_357) & 2;
    bool _377 = _375 != 0;
    float _379 = _325 * _361;
    bool _381 = !_377;
    float _383 = _381 ? (-0.5) : 0.5;
    float _385 = _323 * _359;
    bool _387 = !_373;
    float _389 = _387 ? (-0.5) : 0.5;
    float _391 = _379 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _383);
    float _395 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _389);
    float _399 = _391 * _393;
    float _401 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _403 = _395 * _397;
    float _405 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _407 = _399 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _409 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _401);
    float _411 = _399 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _413 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _405);
    float _415 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[26].x, _407);
    float _417 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _409);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[24].x, _411);
    float _421 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _413);
    float _423 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[26].z, _415);
    float _425 = _417 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _427 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[24].z, _419);
    float _429 = _421 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _431 = _423 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _433 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _435 = _427 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _437 = _399 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _439 = _425 + _431;
    float _441 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _433);
    float _443 = _429 + _435;
    float _445 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[25].x, _437);
    float _447 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _449 = _439 + _447;
    float _451 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _441);
    float _453 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _455 = _443 + _453;
    float _457 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[25].z, _445);
    float _459 = _449 * _449;
    float _461 = _451 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _463 = _457 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _465 = fma(_455, _455, _459);
    float _467 = _461 + _463;
    float _469 = sqrt(_465);
    bool _471 = _469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _473 = 0.0;
    float _475 = _443;
    float _477 = _439;
    if (!_471)
    {
        _473 = _467;
    }
    float _479 = _473;
    bool _481 = !_471;
    float _483 = _479;
    if (!_481)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _489 = _469 + _487;
        float _491 = rsqrt(_465);
        float _493 = _489 * _485;
        float _495 = _467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _497 = _493 * 0.15915493667125701904296875;
        float _499 = _497 * 6.283185482025146484375;
        float _501 = cos(_499);
        float _503 = _497 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _501 + (-1.0);
        float _509 = fma(_505, _495, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _511 = _507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _513 = _491 * _509;
        float _515 = fma(_467, _501, _511);
        float _517 = fma(_455, _513, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _519 = fma(_449, _513, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _483 = _515;
        _475 = _517;
        _477 = _519;
    }
    float _521 = _483;
    float _523 = _475;
    float _525 = _477;
    float _527 = -_461;
    float _529 = _527 + _521;
    float _531 = -_429;
    float _533 = _531 + _523;
    float _535 = -_425;
    float _537 = _535 + _525;
    float _539 = _529 * _529;
    bool _541 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _543 = isnan(0.5);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _549 = _545 || _547;
    float _551 = fma(_533, _533, _539);
    float _553 = fma(_537, _537, _551);
    float _555 = sqrt(_553);
    bool _557 = _555 > 0.0;
    bool _559 = !_557;
    float _561 = _523;
    float _563 = _521;
    float _565 = _525;
    float _567 = _533;
    float _569 = _553;
    if (!_559)
    {
        float _571 = _175 * _175;
        float _573 = fma(_173, _173, _571);
        float _575 = fma(_177, _177, _573);
        float _577 = rsqrt(_553);
        float _579 = sqrt(_575);
        float _581 = _533 * _577;
        float _583 = _529 * _577;
        float _585 = _537 * _577;
        bool _587 = _579 > 0.0;
        bool _589 = !_587;
        if (!_589)
        {
            float _591 = rsqrt(_575);
            float _593 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _595 = _175 * _591;
            float _597 = _173 * _591;
            float _599 = _177 * _591;
            float _601 = _583 * _595;
            float _603 = fma(_581, _597, _601);
            float _605 = _593 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _607 = fma(_585, _599, _603);
            float _609 = _607 * _605;
            float _611 = fma(_173, _609, _523);
            float _613 = fma(_175, _609, _521);
            float _615 = fma(_177, _609, _525);
            _561 = _611;
            _563 = _613;
            _565 = _615;
            _567 = _603;
            _569 = _597;
        }
    }
    float _617 = _561;
    float _619 = _563;
    float _621 = _565;
    float _623 = _567;
    float _625 = _569;
    float _627 = _619;
    float _629 = _617;
    float _631 = _621;
    float _633 = _625;
    float _635 = _623;
    if (!_549)
    {
        float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _639 = _461 + _637;
        float _641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _643 = _429 + _641;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _647 = -_429;
        float _649 = _647 + _617;
        float _651 = _639 * _639;
        float _653 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _655 = _425 + _653;
        float _657 = fma(_643, _643, _651);
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _661 = fma(_655, _655, _657);
        float _663 = sqrt(_661);
        float _665 = _645 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _667 = precise::min(_663, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _669 = _667 * _659;
        float _671 = _665 * _669;
        float _673 = -_461;
        float _675 = _673 + _619;
        float _677 = -_425;
        float _679 = _677 + _621;
        float _681 = fma(_649, _671, _429);
        float _683 = fma(_675, _671, _461);
        float _685 = fma(_679, _671, _425);
        _627 = _683;
        _629 = _681;
        _631 = _685;
    }
    float _687 = _627;
    float _689 = _629;
    float _691 = _631;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _695 = _687 + _693;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _699 = _689 + _697;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _691 + _701;
    float _705 = _695 * _695;
    float _707 = fma(_699, _699, _705);
    float _709 = fma(_703, _703, _707);
    float _711 = rsqrt(_709);
    float _713 = sqrt(_709);
    float _715 = _711 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _717 = _699 * _715;
    float _719 = _703 * _715;
    float _721 = _717 * _717;
    float _723 = _719 * _719;
    float _725 = _721 + _723;
    float _727 = sqrt(_725);
    bool _729 = _727 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _733 = _727 + _731;
    float _735 = _711;
    float _737 = _733;
    float _739 = _695;
    float _741 = _715;
    float _743 = _721;
    if (_729)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _735 = _745;
    }
    float _747 = _735;
    if (_729)
    {
        float _749 = rsqrt(_725);
        _633 = _749;
    }
    float _751 = _633;
    float _753 = _751;
    if (_729)
    {
        float _755 = _733 * _747;
        _737 = _755;
    }
    float _757 = _737;
    if (_729)
    {
        float _759 = _757 * 0.15915493667125701904296875;
        _635 = _759;
    }
    float _761 = _635;
    float _763 = _747;
    if (_729)
    {
        float _765 = _761 * 6.283185482025146484375;
        float _767 = sin(_765);
        _763 = _767;
    }
    float _769 = _763;
    float _771 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _773 = precise::max(0.0, _771);
    float _775 = _703;
    float _777 = _773;
    if (_729)
    {
        float _779 = _761 * 6.283185482025146484375;
        float _781 = cos(_779);
        _775 = _781;
    }
    float _783 = _775;
    float _785 = -_715;
    float _787 = -_773;
    float _789 = fma(_695, _785, _787);
    float _791 = _789;
    if (_729)
    {
        float _793 = _789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _777 = _793;
    }
    float _795 = _777;
    float _797 = _795;
    float _799 = _769;
    if (_729)
    {
        float _801 = fma(_769, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _797 = _801;
    }
    float _803 = _797;
    if (!_729)
    {
        _799 = _719;
    }
    float _805 = _799;
    float _807 = _805;
    if (_729)
    {
        float _809 = _783 + (-1.0);
        _739 = _809;
    }
    float _811 = _739;
    float _813 = _811;
    if (_729)
    {
        float _815 = _751 * _803;
        _741 = _815;
    }
    float _817 = _741;
    if (!_729)
    {
        _753 = _717;
    }
    float _819 = _753;
    float _821 = _819;
    if (_729)
    {
        float _823 = _811 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _813 = _823;
    }
    float _825 = _813;
    if (_729)
    {
        float _827 = _717 * _817;
        _821 = _827;
    }
    float _829 = _821;
    float _831 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_729)
    {
        float _833 = _719 * _817;
        _807 = _833;
    }
    float _835 = _807;
    if (_729)
    {
        float _837 = fma(_789, _783, _825);
        _791 = _837;
    }
    float _839 = _791;
    if (_729)
    {
        float _841 = _829 * _829;
        _743 = _841;
    }
    float _843 = _743;
    float _845 = fma(_429, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_729)
    {
        _831 = _723;
    }
    float _847 = _831;
    float _849 = fma(_839, _839, _843);
    float _851 = _687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _853 = _847;
    if (_729)
    {
        float _855 = _835 * _835;
        _853 = _855;
    }
    float _857 = _853;
    float _859 = floor(_845);
    float _861 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[2].x, _851);
    float _863 = _849 + _857;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _867 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _865);
    float _869 = precise::clamp(_867, 0.0, 1.0);
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _873 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[2].z, _861);
    float _875 = -_869;
    float _877 = _875 + 1.0;
    float _879 = rsqrt(_863);
    float _881 = _873 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _883 = fma(_425, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _885 = _687 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _887 = _881 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _889 = abs(_877);
    float _891 = log2(_889);
    float _893 = _687 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _895 = -_887;
    float _897 = fma(_895, _871, 1.0);
    float _899 = _687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _901 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[3].x, _885);
    float _903 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[1].x, _893);
    float _905 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[0].x, _899);
    float _907 = _879 * _829;
    float _909 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[1].z, _903);
    float _911 = _879 * _839;
    float _913 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[0].z, _905);
    float _915 = _879 * _835;
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _919 = _907 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _921 = _913 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _923 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[3].z, _901);
    float _925 = _917 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _927 = -_919;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _927);
    float _931 = floor(_883);
    float _933 = _923 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _935 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[7].x, _925);
    float _937 = -_915;
    float _939 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[21].z, _929);
    float _941 = _891 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _943 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[7].z, _935);
    float _945 = fma(_939, -0.5, 0.5);
    float _947 = log2(_897);
    float _949 = fma(_939, 0.5, 0.5);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].w, _943);
    float _953 = _917 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _955 = 1.0 / _951;
    float _957 = -_859;
    float _959 = _845 + _957;
    float _961 = _917 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _963 = fma(_949, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _965 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[5].x, _953);
    float _967 = -_931;
    float _969 = _883 + _967;
    float _971 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[4].x, _961);
    float _973 = fma(_949, _963, -0.212114393711090087890625);
    float _975 = exp2(_941);
    float _977 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[5].z, _965);
    float _979 = _911 + 1.0;
    float _981 = fma(_949, _973, 1.570728778839111328125);
    float _983 = _947 * 0.693147182464599609375;
    float _985 = sqrt(_945);
    float2 _3200 = float2(_959, _969);
    float _987 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3200, float2(0.0), isnan(_3200)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3200, float2(0.0), isnan(_3200)), level(0.0)).x;
    float _989 = _983 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _991 = -_911;
    float _993 = fma(_975, _979, _991);
    float _995 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[4].z, _971);
    float _997 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].w, _977);
    float _999 = fma(_993, 0.5, 0.5);
    float _1001 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].w, _995);
    float _1003 = _997 * _955;
    float _1005 = _985 * 0.636619746685028076171875;
    float _1007 = _1001 * _955;
    float _1009 = fma(_1003, -0.5, 0.5);
    float _1011 = -_981;
    float _1013 = fma(_1005, _1011, 1.0);
    float _1015 = fma(_1007, 0.5, 0.5);
    float3 _3256 = float3(_1015, _1009, _989);
    float _1017 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3256, float3(0.0), isnan(_3256)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3256, float3(0.0), isnan(_3256)), level(0.0)).x;
    float3 _3267 = float3(_1015, _1009, _989);
    float4 _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3267, float3(0.0), isnan(_3267)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3267, float3(0.0), isnan(_3267)), level(0.0)).xyzw;
    float _1022 = _1020.x;
    float _1024 = _1020.y;
    float _1026 = _1020.z;
    float _1028 = _1020.w;
    float2 _3283 = float2(_1013, _999);
    float3 _1032 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3283, float2(0.0), isnan(_3283)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3283, float2(0.0), isnan(_3283)), level(0.0)).xyz;
    float _1034 = _1032.x;
    float _1036 = _1032.y;
    float _1038 = _1032.z;
    float _1040 = _461 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1042 = _917 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1044 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1040);
    float _1046 = _461 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1048 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1042);
    float _1050 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1044);
    float _1052 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1046);
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1056 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1062 = 1.0 / _1054;
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1066 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1048);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1072 = _1064 + _1054;
    float _1074 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1066);
    float _1076 = in.m_55.x;
    float _1078 = in.m_55.y;
    float _1080 = 1.0 / _1070;
    float _1082 = _1074 + _951;
    float _1084 = _1072 * _1062;
    float _1086 = _1084 * 0.5;
    float _1088 = 1.0 / _1060;
    bool _1090 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1092 = isnan(_355);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1102);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1114 = -_1100;
    float _1116 = _1114 + 1.0;
    float _1118 = 1.0 / _1104;
    float _1120 = _1108 * _1080;
    bool _1122 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1124 = isnan(_355);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    bool _1134 = _1076 > 0.5;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1138 = _355 + _1136;
    float _1140 = _1112 * _1088;
    bool _1142 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1144 = isnan(_355);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = -_1132;
    float _1156 = _1154 + 1.0;
    float _1158 = fma(_1120, _1138, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1160 = _1132 * _1116;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1164 = _355 + _1162;
    float _1166 = _1152 * _1156;
    float _1168 = -_1152;
    float _1170 = _1168 + 1.0;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1174 = _1118 * _1172;
    float _1176 = fma(_1140, _1164, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1178 = _1158 * _1166;
    float _1180 = abs(_1174);
    float _1182 = log2(_1180);
    float _1184 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1178);
    bool _1186 = _1078 > 0.5;
    float _1188 = fma(_1176, _1160, _1184);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1194 = _1192 != 0;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1198 = -_389;
    int _1200 = _1134 ? as_type<int>(_1198) : as_type<int>(_389);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1204 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1208 = _1206 != 0;
    float _1210 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1212 = !_1194;
    float _1214 = _1212 ? _389 : as_type<float>(_1200);
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1218 = -_383;
    int _1220 = _1186 ? as_type<int>(_1218) : as_type<int>(_383);
    float _1222 = exp2(_1204);
    float _1224 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1228 = !_1208;
    float _1230 = _1228 ? _383 : as_type<float>(_1220);
    float _1232 = _1214 + 0.5;
    float _1234 = _383 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_62.x = _1210;
    out.m_62.y = _1224;
    out.m_62.z = _1226;
    out.m_62.w = _1216;
    float _1236 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1238 = _389 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1242 = -_1230;
    float _1244 = _1242 + 0.5;
    bool _1246 = _1174 <= 8000.0;
    bool _1248 = isnan(_1174);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(8000.0);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1082 * 0.5;
    float _1260 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1240);
    float _1262 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1264 = precise::clamp(_1262, 0.0, 1.0);
    bool _1266 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1268 = isnan(_713);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1274 = _1270 || _1272;
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_64.z = _1258;
    out.m_64.w = _951;
    float _1278 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1280 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1282 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1278);
    float _1284 = fma(_1264, -2.0, 3.0);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1288 = _1264 * _1264;
    float _1290 = in.m_66.x;
    float _1292 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1280);
    float _1294 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1188);
    float _1296 = _1288 * _1284;
    float _1298 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1300 = _1236 * _1276;
    float _1302 = _891 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1304 = -_1296;
    float _1306 = _1304 + 1.0;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1310 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1312 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1296);
    float _1314 = exp2(_1302);
    float _1316 = _1298 * _1286;
    float _1318 = _1256 * _1312;
    out.gl_Position.x = _1001;
    out.gl_Position.y = _997;
    out.gl_Position.z = _1074;
    out.gl_Position.w = _951;
    float _1320 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_68.x = _1300;
    out.m_68.y = _1316;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1328 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1330 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1334 = -_1314;
    float _1336 = _1334 + 1.0;
    float _1338 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _1328;
    out.m_70.y = _1330;
    out.m_70.z = _1332;
    out.m_70.w = _1308;
    float _1340 = _1260 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1342 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_72.x = _1340;
    out.m_72.y = _1342;
    out.m_72.z = _1310;
    float _1344 = _1308;
    float _1346 = _1332;
    float _1348 = _1330;
    if (!_1274)
    {
        _1344 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1350 = _1344;
    float _1352 = _1350;
    float _1354 = _1350;
    if (!_1274)
    {
        _1346 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1356 = _1346;
    float _1358 = _1356;
    float _1360 = _1356;
    if (!_1274)
    {
        _1348 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1362 = _1348;
    float _1364 = -_987;
    float _1366 = _1364 + 1.0;
    float _1368 = _1366 * _1320;
    float _1370 = precise::clamp(_1368, 0.0, 1.0);
    float _1372 = -_1370;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1376 = _1374 * _1290;
    float _1378 = _1376 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_74.x = _1378;
    float _1380 = _1338 * _1017;
    float _1382 = -_1338;
    float _1384 = _1382 + 1.0;
    float _1386 = _1028 * _1380;
    float _1388 = _1038 * _1380;
    float _1390 = _1028 * _1384;
    float _1392 = fma(_1034, _1386, _1022);
    float _1394 = fma(_1036, _1386, _1024);
    float _1396 = fma(_1028, _1388, _1026);
    float _1398 = _1024;
    float _1400 = _1022;
    float _1402 = _1386;
    float _1404 = _1362;
    float _1406 = _1362;
    if (!_1274)
    {
        _1398 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1408 = _1398;
    float _1410 = _1408;
    float _1412 = _1408;
    if (!_1274)
    {
        _1400 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1414 = _1400;
    out.m_76.x = _1392;
    out.m_76.y = _1394;
    out.m_76.z = _1396;
    out.m_76.w = _1390;
    float _1416 = _1414;
    float _1418 = _1414;
    if (!_1274)
    {
        _1402 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1420 = _1402;
    bool _1422 = !_1274;
    float _1424 = _1420;
    float _1426 = _1420;
    if (!_1422)
    {
        bool _1428 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1430 = isnan(_713);
        bool _1432 = _1428 || _1430;
        bool _1434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1436 = _1432 || _1434;
        if (!_1436)
        {
            float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1440 = _713 + _1438;
            float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1442;
            float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1448 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1452 = _1450 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1454 = 1.0 / _1444;
            float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1458 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1466 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1468 = _1440 * _1454;
            float _1470 = precise::clamp(_1468, 0.0, 1.0);
            float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1474 = _1472 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1476 = fma(_1470, _1448, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1478 = fma(_1470, _1452, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1480 = fma(_1470, _1458, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1482 = fma(_1470, _1474, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1484 = fma(_1470, _1462, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1486 = fma(_1470, _1466, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1418 = _1480;
            _1406 = _1476;
            _1412 = _1478;
            _1360 = _1484;
            _1354 = _1482;
            _1426 = _1486;
            _1488 = true;
        }
        else
        {
            bool _1490 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1492 = isnan(_713);
            bool _1494 = _1490 || _1492;
            bool _1496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1498 = _1494 || _1496;
            if (!_1498)
            {
                _1410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1500 = _1410;
            _1412 = _1500;
            if (!_1498)
            {
                _1416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1502 = _1416;
            _1418 = _1502;
            if (!_1498)
            {
                _1352 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1504 = _1352;
            _1354 = _1504;
            if (!_1498)
            {
                _1358 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1506 = _1358;
            _1360 = _1506;
            if (!_1498)
            {
                _1404 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1508 = _1404;
            _1406 = _1508;
            if (!_1498)
            {
                _1424 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1510 = _1424;
            bool _1512 = !_1498;
            _1426 = _1510;
            if (!_1512)
            {
                bool _1514 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1516 = isnan(_713);
                bool _1518 = _1514 || _1516;
                bool _1520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1522 = _1518 || _1520;
                if (!_1522)
                {
                    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1526 = _713 + _1524;
                    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1528;
                    float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1534 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1538 = _1536 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1540 = 1.0 / _1530;
                    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1544 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1554 = _1526 * _1540;
                    float _1556 = precise::clamp(_1554, 0.0, 1.0);
                    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1560 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1562 = fma(_1556, _1534, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1564 = fma(_1556, _1538, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1566 = fma(_1556, _1544, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1568 = fma(_1556, _1560, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1570 = fma(_1556, _1548, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1572 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1418 = _1566;
                    _1406 = _1562;
                    _1412 = _1564;
                    _1360 = _1570;
                    _1354 = _1568;
                    _1426 = _1572;
                    _1488 = true;
                }
                else
                {
                    _1418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1406 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1360 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1354 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1426 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1488 = false;
    float _1574 = _1418;
    float _1576 = _1406;
    float _1578 = _1412;
    float _1580 = _1360;
    float _1582 = _1354;
    float _1584 = _1426;
    float _1586 = fma(_1342, -0.5, 0.5);
    float _1588 = precise::clamp(_1586, 0.0, 1.0);
    float _1590 = -_1574;
    float _1592 = _1590 + _1576;
    float _1594 = -_1578;
    float _1596 = _1594 + _1580;
    float _1598 = -_1582;
    float _1600 = _1598 + _1584;
    bool _1602 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1604 = fma(_1588, _1592, _1574);
    float _1606 = fma(_1588, _1596, _1578);
    float _1608 = fma(_1588, _1600, _1582);
    float _1610 = _1604 * 0.586610972881317138671875;
    out.m_78.x = 0.0;
    float _1612 = fma(_1606, 0.298911988735198974609375, _1610);
    float _1614 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = 1.0;
    float _1616 = fma(_1608, 0.114477999508380889892578125, _1612);
    float _1618 = -_1616;
    float _1620 = _1606 + _1618;
    float _1622 = -_1616;
    float _1624 = _1604 + _1622;
    float _1626 = -_1616;
    float _1628 = _1608 + _1626;
    out.m_74.w = _1614;
    float _1630 = fma(_1620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1616);
    float _1632 = fma(_1624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1616);
    float _1634 = fma(_1628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1616);
    out.m_80.x = _1630;
    out.m_80.y = _1632;
    out.m_80.z = _1634;
    if (!_1602)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1636 = -_687;
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1640 = -_689;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1644 = -_691;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1648 = _1638 * _1638;
    float _1650 = fma(_1642, _1642, _1648);
    float _1652 = fma(_1646, _1646, _1650);
    float _1654 = sqrt(_1652);
    float _1656 = rsqrt(_1652);
    float _1658 = -_1654;
    float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1662 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1664 = precise::clamp(_1662, 0.0, 1.0);
    float _1666 = _1642 * _1656;
    float _1668 = _1638 * _1656;
    float _1670 = abs(_1664);
    float _1672 = log2(_1670);
    float _1674 = _1646 * _1656;
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1678 = _1342 * _1668;
    float _1680 = -_1668;
    float _1682 = -_1676;
    float _1684 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1682);
    float _1686 = fma(_1340, _1666, _1678);
    float _1688 = -_1674;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1684);
    float _1692 = fma(_1310, _1674, _1686);
    float _1694 = precise::clamp(_1692, 0.0, 1.0);
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1698 = _1690 + _1696;
    float _1700 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1702 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = exp2(_1700);
    float _1708 = _1706 * _1704;
    float _1710 = _1694 * _1708;
    float _1712 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1714 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1716 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_78.x = _1712;
    out.m_78.y = _1714;
    out.m_78.z = _1716;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1488 = false;
    bool _347 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1772 = as_type<float>(_115);
        out.gl_Position.z = _1772;
    }
    if (!_103)
    {
        return out;
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    if (_127)
    {
        float _135 = float(_99);
        _133 = _135;
    }
    float _137 = _133;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    if (_143)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _109;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    int _147 = 0;
    if (_143)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_151);
        out.gl_Position.z = _1840;
    }
    if (_143)
    {
        return out;
    }
    float _153 = in.m_53.x;
    float _155 = in.m_53.y;
    float _157 = in.m_53.z;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _163 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _165 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _167 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    float _173 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _167);
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _169);
    float _177 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _171);
    bool _179 = !_159;
    float _197;
    if (!_179)
    {
        float _181 = in.m_55.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_99);
        float _203 = 1.0 / _201;
        float _205 = _131 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = -_223;
    float _235 = _233 + 1.0;
    float _237 = 1.0 / _227;
    bool _239 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_207);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _231;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = _211 * _237;
    bool _261 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _263 = isnan(_207);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _207 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = fma(_257, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _283 = _271 * _235;
    float _285 = -_271;
    float _287 = _285 + 1.0;
    float _289 = fma(_279, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = _275 * _253;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = _249 * _287;
    float _299 = -_249;
    float _301 = _299 + 1.0;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _307 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = _289 * _297;
    float _311 = _281 * _297;
    float _313 = fma(_305, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _315 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _317 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _319 = fma(_307, _283, _315);
    float _321 = fma(_313, _283, _317);
    float _323 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[145].x, _319);
    float _325 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[145].y, _321);
    bool _327 = !_251;
    float _345;
    if (!_327)
    {
        float _329 = in.m_55.x;
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _333 = _329 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_99);
        float _351 = 1.0 / _349;
        float _353 = _131 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = as_type<float>(int(gl_VertexIndex));
    float _359 = in.m_60.x;
    float _361 = in.m_60.y;
    float _363 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _365 = in.m_46.x;
    float _367 = in.m_46.y;
    float _369 = in.m_46.z;
    int _371 = as_type<int>(_357) & 1;
    bool _373 = _371 != 0;
    int _375 = as_type<int>(_357) & 2;
    bool _377 = _375 != 0;
    float _379 = _325 * _361;
    bool _381 = !_377;
    float _383 = _381 ? (-0.5) : 0.5;
    float _385 = _323 * _359;
    bool _387 = !_373;
    float _389 = _387 ? (-0.5) : 0.5;
    float _391 = _379 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _383);
    float _395 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _389);
    float _399 = _391 * _393;
    float _401 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _403 = _395 * _397;
    float _405 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _407 = _399 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _409 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _401);
    float _411 = _399 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _413 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _405);
    float _415 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[26].x, _407);
    float _417 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _409);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[24].x, _411);
    float _421 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _413);
    float _423 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[26].z, _415);
    float _425 = _417 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _427 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[24].z, _419);
    float _429 = _421 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _431 = _423 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _433 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _435 = _427 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _437 = _399 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _439 = _425 + _431;
    float _441 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _433);
    float _443 = _429 + _435;
    float _445 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[25].x, _437);
    float _447 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _449 = _439 + _447;
    float _451 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _441);
    float _453 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _455 = _443 + _453;
    float _457 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[25].z, _445);
    float _459 = _449 * _449;
    float _461 = _451 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _463 = _457 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _465 = fma(_455, _455, _459);
    float _467 = _461 + _463;
    float _469 = sqrt(_465);
    bool _471 = _469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _473 = 0.0;
    float _475 = _443;
    float _477 = _439;
    if (!_471)
    {
        _473 = _467;
    }
    float _479 = _473;
    bool _481 = !_471;
    float _483 = _479;
    if (!_481)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _489 = _469 + _487;
        float _491 = rsqrt(_465);
        float _493 = _489 * _485;
        float _495 = _467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _497 = _493 * 0.15915493667125701904296875;
        float _499 = _497 * 6.283185482025146484375;
        float _501 = cos(_499);
        float _503 = _497 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _501 + (-1.0);
        float _509 = fma(_505, _495, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _511 = _507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _513 = _491 * _509;
        float _515 = fma(_467, _501, _511);
        float _517 = fma(_455, _513, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _519 = fma(_449, _513, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _483 = _515;
        _475 = _517;
        _477 = _519;
    }
    float _521 = _483;
    float _523 = _475;
    float _525 = _477;
    float _527 = -_461;
    float _529 = _527 + _521;
    float _531 = -_429;
    float _533 = _531 + _523;
    float _535 = -_425;
    float _537 = _535 + _525;
    float _539 = _529 * _529;
    bool _541 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _543 = isnan(0.5);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _549 = _545 || _547;
    float _551 = fma(_533, _533, _539);
    float _553 = fma(_537, _537, _551);
    float _555 = sqrt(_553);
    bool _557 = _555 > 0.0;
    bool _559 = !_557;
    float _561 = _523;
    float _563 = _521;
    float _565 = _525;
    float _567 = _533;
    float _569 = _553;
    if (!_559)
    {
        float _571 = _175 * _175;
        float _573 = fma(_173, _173, _571);
        float _575 = fma(_177, _177, _573);
        float _577 = rsqrt(_553);
        float _579 = sqrt(_575);
        float _581 = _533 * _577;
        float _583 = _529 * _577;
        float _585 = _537 * _577;
        bool _587 = _579 > 0.0;
        bool _589 = !_587;
        if (!_589)
        {
            float _591 = rsqrt(_575);
            float _593 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _595 = _175 * _591;
            float _597 = _173 * _591;
            float _599 = _177 * _591;
            float _601 = _583 * _595;
            float _603 = fma(_581, _597, _601);
            float _605 = _593 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _607 = fma(_585, _599, _603);
            float _609 = _607 * _605;
            float _611 = fma(_173, _609, _523);
            float _613 = fma(_175, _609, _521);
            float _615 = fma(_177, _609, _525);
            _561 = _611;
            _563 = _613;
            _565 = _615;
            _567 = _603;
            _569 = _597;
        }
    }
    float _617 = _561;
    float _619 = _563;
    float _621 = _565;
    float _623 = _567;
    float _625 = _569;
    float _627 = _619;
    float _629 = _617;
    float _631 = _621;
    float _633 = _625;
    float _635 = _623;
    if (!_549)
    {
        float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _639 = _461 + _637;
        float _641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _643 = _429 + _641;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _647 = -_429;
        float _649 = _647 + _617;
        float _651 = _639 * _639;
        float _653 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _655 = _425 + _653;
        float _657 = fma(_643, _643, _651);
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _661 = fma(_655, _655, _657);
        float _663 = sqrt(_661);
        float _665 = _645 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _667 = precise::min(_663, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _669 = _667 * _659;
        float _671 = _665 * _669;
        float _673 = -_461;
        float _675 = _673 + _619;
        float _677 = -_425;
        float _679 = _677 + _621;
        float _681 = fma(_649, _671, _429);
        float _683 = fma(_675, _671, _461);
        float _685 = fma(_679, _671, _425);
        _627 = _683;
        _629 = _681;
        _631 = _685;
    }
    float _687 = _627;
    float _689 = _629;
    float _691 = _631;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _695 = _687 + _693;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _699 = _689 + _697;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _691 + _701;
    float _705 = _695 * _695;
    float _707 = fma(_699, _699, _705);
    float _709 = fma(_703, _703, _707);
    float _711 = rsqrt(_709);
    float _713 = sqrt(_709);
    float _715 = _711 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _717 = _699 * _715;
    float _719 = _703 * _715;
    float _721 = _717 * _717;
    float _723 = _719 * _719;
    float _725 = _721 + _723;
    float _727 = sqrt(_725);
    bool _729 = _727 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _733 = _727 + _731;
    float _735 = _711;
    float _737 = _733;
    float _739 = _695;
    float _741 = _715;
    float _743 = _721;
    if (_729)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _735 = _745;
    }
    float _747 = _735;
    if (_729)
    {
        float _749 = rsqrt(_725);
        _633 = _749;
    }
    float _751 = _633;
    float _753 = _751;
    if (_729)
    {
        float _755 = _733 * _747;
        _737 = _755;
    }
    float _757 = _737;
    if (_729)
    {
        float _759 = _757 * 0.15915493667125701904296875;
        _635 = _759;
    }
    float _761 = _635;
    float _763 = _747;
    if (_729)
    {
        float _765 = _761 * 6.283185482025146484375;
        float _767 = sin(_765);
        _763 = _767;
    }
    float _769 = _763;
    float _771 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _773 = precise::max(0.0, _771);
    float _775 = _703;
    float _777 = _773;
    if (_729)
    {
        float _779 = _761 * 6.283185482025146484375;
        float _781 = cos(_779);
        _775 = _781;
    }
    float _783 = _775;
    float _785 = -_715;
    float _787 = -_773;
    float _789 = fma(_695, _785, _787);
    float _791 = _789;
    if (_729)
    {
        float _793 = _789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _777 = _793;
    }
    float _795 = _777;
    float _797 = _795;
    float _799 = _769;
    if (_729)
    {
        float _801 = fma(_769, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _797 = _801;
    }
    float _803 = _797;
    if (!_729)
    {
        _799 = _719;
    }
    float _805 = _799;
    float _807 = _805;
    if (_729)
    {
        float _809 = _783 + (-1.0);
        _739 = _809;
    }
    float _811 = _739;
    float _813 = _811;
    if (_729)
    {
        float _815 = _751 * _803;
        _741 = _815;
    }
    float _817 = _741;
    if (!_729)
    {
        _753 = _717;
    }
    float _819 = _753;
    float _821 = _819;
    if (_729)
    {
        float _823 = _811 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _813 = _823;
    }
    float _825 = _813;
    if (_729)
    {
        float _827 = _717 * _817;
        _821 = _827;
    }
    float _829 = _821;
    float _831 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_729)
    {
        float _833 = _719 * _817;
        _807 = _833;
    }
    float _835 = _807;
    if (_729)
    {
        float _837 = fma(_789, _783, _825);
        _791 = _837;
    }
    float _839 = _791;
    if (_729)
    {
        float _841 = _829 * _829;
        _743 = _841;
    }
    float _843 = _743;
    float _845 = fma(_429, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_729)
    {
        _831 = _723;
    }
    float _847 = _831;
    float _849 = fma(_839, _839, _843);
    float _851 = _687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _853 = _847;
    if (_729)
    {
        float _855 = _835 * _835;
        _853 = _855;
    }
    float _857 = _853;
    float _859 = floor(_845);
    float _861 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[2].x, _851);
    float _863 = _849 + _857;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _867 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _865);
    float _869 = precise::clamp(_867, 0.0, 1.0);
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _873 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[2].z, _861);
    float _875 = -_869;
    float _877 = _875 + 1.0;
    float _879 = rsqrt(_863);
    float _881 = _873 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _883 = fma(_425, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _885 = _687 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _887 = _881 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _889 = abs(_877);
    float _891 = log2(_889);
    float _893 = _687 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _895 = -_887;
    float _897 = fma(_895, _871, 1.0);
    float _899 = _687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _901 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[3].x, _885);
    float _903 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[1].x, _893);
    float _905 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[0].x, _899);
    float _907 = _879 * _829;
    float _909 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[1].z, _903);
    float _911 = _879 * _839;
    float _913 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[0].z, _905);
    float _915 = _879 * _835;
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _919 = _907 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _921 = _913 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _923 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[3].z, _901);
    float _925 = _917 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _927 = -_919;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _927);
    float _931 = floor(_883);
    float _933 = _923 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _935 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[7].x, _925);
    float _937 = -_915;
    float _939 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[21].z, _929);
    float _941 = _891 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _943 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[7].z, _935);
    float _945 = fma(_939, -0.5, 0.5);
    float _947 = log2(_897);
    float _949 = fma(_939, 0.5, 0.5);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].w, _943);
    float _953 = _917 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _955 = 1.0 / _951;
    float _957 = -_859;
    float _959 = _845 + _957;
    float _961 = _917 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _963 = fma(_949, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _965 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[5].x, _953);
    float _967 = -_931;
    float _969 = _883 + _967;
    float _971 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[4].x, _961);
    float _973 = fma(_949, _963, -0.212114393711090087890625);
    float _975 = exp2(_941);
    float _977 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[5].z, _965);
    float _979 = _911 + 1.0;
    float _981 = fma(_949, _973, 1.570728778839111328125);
    float _983 = _947 * 0.693147182464599609375;
    float _985 = sqrt(_945);
    float2 _3200 = float2(_959, _969);
    float _987 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3200, float2(0.0), isnan(_3200)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3200, float2(0.0), isnan(_3200)), level(0.0)).x;
    float _989 = _983 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _991 = -_911;
    float _993 = fma(_975, _979, _991);
    float _995 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[4].z, _971);
    float _997 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].w, _977);
    float _999 = fma(_993, 0.5, 0.5);
    float _1001 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].w, _995);
    float _1003 = _997 * _955;
    float _1005 = _985 * 0.636619746685028076171875;
    float _1007 = _1001 * _955;
    float _1009 = fma(_1003, -0.5, 0.5);
    float _1011 = -_981;
    float _1013 = fma(_1005, _1011, 1.0);
    float _1015 = fma(_1007, 0.5, 0.5);
    float3 _3256 = float3(_1015, _1009, _989);
    float _1017 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3256, float3(0.0), isnan(_3256)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3256, float3(0.0), isnan(_3256)), level(0.0)).x;
    float3 _3267 = float3(_1015, _1009, _989);
    float4 _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3267, float3(0.0), isnan(_3267)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3267, float3(0.0), isnan(_3267)), level(0.0)).xyzw;
    float _1022 = _1020.x;
    float _1024 = _1020.y;
    float _1026 = _1020.z;
    float _1028 = _1020.w;
    float2 _3283 = float2(_1013, _999);
    float3 _1032 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3283, float2(0.0), isnan(_3283)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3283, float2(0.0), isnan(_3283)), level(0.0)).xyz;
    float _1034 = _1032.x;
    float _1036 = _1032.y;
    float _1038 = _1032.z;
    float _1040 = _461 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1042 = _917 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1044 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1040);
    float _1046 = _461 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1048 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1042);
    float _1050 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1044);
    float _1052 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1046);
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1056 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1062 = 1.0 / _1054;
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1066 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1048);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1072 = _1064 + _1054;
    float _1074 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1066);
    float _1076 = in.m_55.x;
    float _1078 = in.m_55.y;
    float _1080 = 1.0 / _1070;
    float _1082 = _1074 + _951;
    float _1084 = _1072 * _1062;
    float _1086 = _1084 * 0.5;
    float _1088 = 1.0 / _1060;
    bool _1090 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1092 = isnan(_355);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1102);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1114 = -_1100;
    float _1116 = _1114 + 1.0;
    float _1118 = 1.0 / _1104;
    float _1120 = _1108 * _1080;
    bool _1122 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1124 = isnan(_355);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    bool _1134 = _1076 > 0.5;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1138 = _355 + _1136;
    float _1140 = _1112 * _1088;
    bool _1142 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1144 = isnan(_355);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = -_1132;
    float _1156 = _1154 + 1.0;
    float _1158 = fma(_1120, _1138, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1160 = _1132 * _1116;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1164 = _355 + _1162;
    float _1166 = _1152 * _1156;
    float _1168 = -_1152;
    float _1170 = _1168 + 1.0;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1174 = _1118 * _1172;
    float _1176 = fma(_1140, _1164, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1178 = _1158 * _1166;
    float _1180 = abs(_1174);
    float _1182 = log2(_1180);
    float _1184 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1178);
    bool _1186 = _1078 > 0.5;
    float _1188 = fma(_1176, _1160, _1184);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1194 = _1192 != 0;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1198 = -_389;
    int _1200 = _1134 ? as_type<int>(_1198) : as_type<int>(_389);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1204 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1208 = _1206 != 0;
    float _1210 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1212 = !_1194;
    float _1214 = _1212 ? _389 : as_type<float>(_1200);
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1218 = -_383;
    int _1220 = _1186 ? as_type<int>(_1218) : as_type<int>(_383);
    float _1222 = exp2(_1204);
    float _1224 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1228 = !_1208;
    float _1230 = _1228 ? _383 : as_type<float>(_1220);
    float _1232 = _1214 + 0.5;
    float _1234 = _383 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_62.x = _1210;
    out.m_62.y = _1224;
    out.m_62.z = _1226;
    out.m_62.w = _1216;
    float _1236 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1238 = _389 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1242 = -_1230;
    float _1244 = _1242 + 0.5;
    bool _1246 = _1174 <= 8000.0;
    bool _1248 = isnan(_1174);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(8000.0);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1082 * 0.5;
    float _1260 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1240);
    float _1262 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1264 = precise::clamp(_1262, 0.0, 1.0);
    bool _1266 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1268 = isnan(_713);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1274 = _1270 || _1272;
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_64.z = _1258;
    out.m_64.w = _951;
    float _1278 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1280 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1282 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1278);
    float _1284 = fma(_1264, -2.0, 3.0);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1288 = _1264 * _1264;
    float _1290 = in.m_66.x;
    float _1292 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1280);
    float _1294 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1188);
    float _1296 = _1288 * _1284;
    float _1298 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1300 = _1236 * _1276;
    float _1302 = _891 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1304 = -_1296;
    float _1306 = _1304 + 1.0;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1310 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1312 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1296);
    float _1314 = exp2(_1302);
    float _1316 = _1298 * _1286;
    float _1318 = _1256 * _1312;
    out.gl_Position.x = _1001;
    out.gl_Position.y = _997;
    out.gl_Position.z = _1074;
    out.gl_Position.w = _951;
    float _1320 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_68.x = _1300;
    out.m_68.y = _1316;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1328 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1330 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1334 = -_1314;
    float _1336 = _1334 + 1.0;
    float _1338 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _1328;
    out.m_70.y = _1330;
    out.m_70.z = _1332;
    out.m_70.w = _1308;
    float _1340 = _1260 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1342 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_72.x = _1340;
    out.m_72.y = _1342;
    out.m_72.z = _1310;
    float _1344 = _1308;
    float _1346 = _1332;
    float _1348 = _1330;
    if (!_1274)
    {
        _1344 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1350 = _1344;
    float _1352 = _1350;
    float _1354 = _1350;
    if (!_1274)
    {
        _1346 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1356 = _1346;
    float _1358 = _1356;
    float _1360 = _1356;
    if (!_1274)
    {
        _1348 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1362 = _1348;
    float _1364 = -_987;
    float _1366 = _1364 + 1.0;
    float _1368 = _1366 * _1320;
    float _1370 = precise::clamp(_1368, 0.0, 1.0);
    float _1372 = -_1370;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1376 = _1374 * _1290;
    float _1378 = _1376 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_74.x = _1378;
    float _1380 = _1338 * _1017;
    float _1382 = -_1338;
    float _1384 = _1382 + 1.0;
    float _1386 = _1028 * _1380;
    float _1388 = _1038 * _1380;
    float _1390 = _1028 * _1384;
    float _1392 = fma(_1034, _1386, _1022);
    float _1394 = fma(_1036, _1386, _1024);
    float _1396 = fma(_1028, _1388, _1026);
    float _1398 = _1024;
    float _1400 = _1022;
    float _1402 = _1386;
    float _1404 = _1362;
    float _1406 = _1362;
    if (!_1274)
    {
        _1398 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1408 = _1398;
    float _1410 = _1408;
    float _1412 = _1408;
    if (!_1274)
    {
        _1400 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1414 = _1400;
    out.m_76.x = _1392;
    out.m_76.y = _1394;
    out.m_76.z = _1396;
    out.m_76.w = _1390;
    float _1416 = _1414;
    float _1418 = _1414;
    if (!_1274)
    {
        _1402 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1420 = _1402;
    bool _1422 = !_1274;
    float _1424 = _1420;
    float _1426 = _1420;
    if (!_1422)
    {
        bool _1428 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1430 = isnan(_713);
        bool _1432 = _1428 || _1430;
        bool _1434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1436 = _1432 || _1434;
        if (!_1436)
        {
            float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1440 = _713 + _1438;
            float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1442;
            float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1448 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1452 = _1450 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1454 = 1.0 / _1444;
            float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1458 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1466 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1468 = _1440 * _1454;
            float _1470 = precise::clamp(_1468, 0.0, 1.0);
            float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1474 = _1472 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1476 = fma(_1470, _1448, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1478 = fma(_1470, _1452, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1480 = fma(_1470, _1458, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1482 = fma(_1470, _1474, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1484 = fma(_1470, _1462, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1486 = fma(_1470, _1466, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1418 = _1480;
            _1406 = _1476;
            _1412 = _1478;
            _1360 = _1484;
            _1354 = _1482;
            _1426 = _1486;
            _1488 = true;
        }
        else
        {
            bool _1490 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1492 = isnan(_713);
            bool _1494 = _1490 || _1492;
            bool _1496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1498 = _1494 || _1496;
            if (!_1498)
            {
                _1410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1500 = _1410;
            _1412 = _1500;
            if (!_1498)
            {
                _1416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1502 = _1416;
            _1418 = _1502;
            if (!_1498)
            {
                _1352 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1504 = _1352;
            _1354 = _1504;
            if (!_1498)
            {
                _1358 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1506 = _1358;
            _1360 = _1506;
            if (!_1498)
            {
                _1404 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1508 = _1404;
            _1406 = _1508;
            if (!_1498)
            {
                _1424 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1510 = _1424;
            bool _1512 = !_1498;
            _1426 = _1510;
            if (!_1512)
            {
                bool _1514 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1516 = isnan(_713);
                bool _1518 = _1514 || _1516;
                bool _1520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1522 = _1518 || _1520;
                if (!_1522)
                {
                    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1526 = _713 + _1524;
                    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1528;
                    float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1534 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1538 = _1536 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1540 = 1.0 / _1530;
                    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1544 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1554 = _1526 * _1540;
                    float _1556 = precise::clamp(_1554, 0.0, 1.0);
                    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1560 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1562 = fma(_1556, _1534, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1564 = fma(_1556, _1538, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1566 = fma(_1556, _1544, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1568 = fma(_1556, _1560, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1570 = fma(_1556, _1548, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1572 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1418 = _1566;
                    _1406 = _1562;
                    _1412 = _1564;
                    _1360 = _1570;
                    _1354 = _1568;
                    _1426 = _1572;
                    _1488 = true;
                }
                else
                {
                    _1418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1406 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1360 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1354 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1426 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1488 = false;
    float _1574 = _1418;
    float _1576 = _1406;
    float _1578 = _1412;
    float _1580 = _1360;
    float _1582 = _1354;
    float _1584 = _1426;
    float _1586 = fma(_1342, -0.5, 0.5);
    float _1588 = precise::clamp(_1586, 0.0, 1.0);
    float _1590 = -_1574;
    float _1592 = _1590 + _1576;
    float _1594 = -_1578;
    float _1596 = _1594 + _1580;
    float _1598 = -_1582;
    float _1600 = _1598 + _1584;
    bool _1602 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1604 = fma(_1588, _1592, _1574);
    float _1606 = fma(_1588, _1596, _1578);
    float _1608 = fma(_1588, _1600, _1582);
    float _1610 = _1604 * 0.586610972881317138671875;
    out.m_78.x = 0.0;
    float _1612 = fma(_1606, 0.298911988735198974609375, _1610);
    float _1614 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = 1.0;
    float _1616 = fma(_1608, 0.114477999508380889892578125, _1612);
    float _1618 = -_1616;
    float _1620 = _1606 + _1618;
    float _1622 = -_1616;
    float _1624 = _1604 + _1622;
    float _1626 = -_1616;
    float _1628 = _1608 + _1626;
    out.m_74.w = _1614;
    float _1630 = fma(_1620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1616);
    float _1632 = fma(_1624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1616);
    float _1634 = fma(_1628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1616);
    out.m_80.x = _1630;
    out.m_80.y = _1632;
    out.m_80.z = _1634;
    if (!_1602)
    {
        return out;
    }
    float _1636 = -_687;
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1640 = -_689;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1644 = -_691;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1648 = _1638 * _1638;
    float _1650 = fma(_1642, _1642, _1648);
    float _1652 = fma(_1646, _1646, _1650);
    float _1654 = sqrt(_1652);
    float _1656 = rsqrt(_1652);
    float _1658 = -_1654;
    float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1662 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1664 = precise::clamp(_1662, 0.0, 1.0);
    float _1666 = _1642 * _1656;
    float _1668 = _1638 * _1656;
    float _1670 = abs(_1664);
    float _1672 = log2(_1670);
    float _1674 = _1646 * _1656;
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1678 = _1342 * _1668;
    float _1680 = -_1668;
    float _1682 = -_1676;
    float _1684 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1682);
    float _1686 = fma(_1340, _1666, _1678);
    float _1688 = -_1674;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1684);
    float _1692 = fma(_1310, _1674, _1686);
    float _1694 = precise::clamp(_1692, 0.0, 1.0);
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1698 = _1690 + _1696;
    float _1700 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1702 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = exp2(_1700);
    float _1708 = _1706 * _1704;
    float _1710 = _1694 * _1708;
    float _1712 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1714 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1716 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_78.x = _1712;
    out.m_78.y = _1714;
    out.m_78.z = _1716;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1488 = false;
    bool _347 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1772 = as_type<float>(_115);
        out.gl_Position.z = _1772;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    if (_127)
    {
        float _135 = float(_99);
        _133 = _135;
    }
    float _137 = _133;
    bool _139 = _131 >= _137;
    bool _141 = !_127;
    bool _143 = _139 || _141;
    if (_143)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _109;
    if (_143)
    {
        out.m_49.x = 0.0;
    }
    int _147 = 0;
    if (_143)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_151);
        out.gl_Position.z = _1840;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_53.x;
    float _155 = in.m_53.y;
    float _157 = in.m_53.z;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _161 = _155 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _163 = _155 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _165 = _155 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _167 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[4].x, _161);
    float _169 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[5].x, _163);
    float _171 = fma(_153, (*spvDescriptorSet0.vp_c10)._m0[6].x, _165);
    float _173 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].z, _167);
    float _175 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].z, _169);
    float _177 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].z, _171);
    bool _179 = !_159;
    float _197;
    if (!_179)
    {
        float _181 = in.m_55.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_99);
        float _203 = 1.0 / _201;
        float _205 = _131 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _211 = _207 + _209;
    bool _213 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _215 = isnan(_207);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _229 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = -_223;
    float _235 = _233 + 1.0;
    float _237 = 1.0 / _227;
    bool _239 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _241 = isnan(_207);
    bool _243 = _239 || _241;
    bool _245 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _247 = _243 || _245;
    float _249 = float(_247);
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _253 = 1.0 / _231;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = _211 * _237;
    bool _261 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _263 = isnan(_207);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _207 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = fma(_257, _259, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _283 = _271 * _235;
    float _285 = -_271;
    float _287 = _285 + 1.0;
    float _289 = fma(_279, _259, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _291 = _275 * _253;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = _249 * _287;
    float _299 = -_249;
    float _301 = _299 + 1.0;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _307 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _309 = _289 * _297;
    float _311 = _281 * _297;
    float _313 = fma(_305, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _315 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _317 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _319 = fma(_307, _283, _315);
    float _321 = fma(_313, _283, _317);
    float _323 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[145].x, _319);
    float _325 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[145].y, _321);
    bool _327 = !_251;
    float _345;
    if (!_327)
    {
        float _329 = in.m_55.x;
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _333 = _329 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_99);
        float _351 = 1.0 / _349;
        float _353 = _131 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = as_type<float>(int(gl_VertexIndex));
    float _359 = in.m_60.x;
    float _361 = in.m_60.y;
    float _363 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _365 = in.m_46.x;
    float _367 = in.m_46.y;
    float _369 = in.m_46.z;
    int _371 = as_type<int>(_357) & 1;
    bool _373 = _371 != 0;
    int _375 = as_type<int>(_357) & 2;
    bool _377 = _375 != 0;
    float _379 = _325 * _361;
    bool _381 = !_377;
    float _383 = _381 ? (-0.5) : 0.5;
    float _385 = _323 * _359;
    bool _387 = !_373;
    float _389 = _387 ? (-0.5) : 0.5;
    float _391 = _379 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _383);
    float _395 = _385 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _389);
    float _399 = _391 * _393;
    float _401 = _367 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _403 = _395 * _397;
    float _405 = _367 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _407 = _399 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _409 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].x, _401);
    float _411 = _399 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _413 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].x, _405);
    float _415 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[26].x, _407);
    float _417 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[6].z, _409);
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[24].x, _411);
    float _421 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[4].z, _413);
    float _423 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[26].z, _415);
    float _425 = _417 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _427 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[24].z, _419);
    float _429 = _421 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _431 = _423 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _433 = _367 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _435 = _427 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _437 = _399 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _439 = _425 + _431;
    float _441 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].x, _433);
    float _443 = _429 + _435;
    float _445 = fma(_403, (*spvDescriptorSet0.vp_c8)._m0[25].x, _437);
    float _447 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _449 = _439 + _447;
    float _451 = fma(_369, (*spvDescriptorSet0.vp_c10)._m0[5].z, _441);
    float _453 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _455 = _443 + _453;
    float _457 = fma(_363, (*spvDescriptorSet0.vp_c8)._m0[25].z, _445);
    float _459 = _449 * _449;
    float _461 = _451 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _463 = _457 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _465 = fma(_455, _455, _459);
    float _467 = _461 + _463;
    float _469 = sqrt(_465);
    bool _471 = _469 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _473 = 0.0;
    float _475 = _443;
    float _477 = _439;
    if (!_471)
    {
        _473 = _467;
    }
    float _479 = _473;
    bool _481 = !_471;
    float _483 = _479;
    if (!_481)
    {
        float _485 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _487 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _489 = _469 + _487;
        float _491 = rsqrt(_465);
        float _493 = _489 * _485;
        float _495 = _467 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _497 = _493 * 0.15915493667125701904296875;
        float _499 = _497 * 6.283185482025146484375;
        float _501 = cos(_499);
        float _503 = _497 * 6.283185482025146484375;
        float _505 = sin(_503);
        float _507 = _501 + (-1.0);
        float _509 = fma(_505, _495, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _511 = _507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _513 = _491 * _509;
        float _515 = fma(_467, _501, _511);
        float _517 = fma(_455, _513, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _519 = fma(_449, _513, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _483 = _515;
        _475 = _517;
        _477 = _519;
    }
    float _521 = _483;
    float _523 = _475;
    float _525 = _477;
    float _527 = -_461;
    float _529 = _527 + _521;
    float _531 = -_429;
    float _533 = _531 + _523;
    float _535 = -_425;
    float _537 = _535 + _525;
    float _539 = _529 * _529;
    bool _541 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _543 = isnan(0.5);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _549 = _545 || _547;
    float _551 = fma(_533, _533, _539);
    float _553 = fma(_537, _537, _551);
    float _555 = sqrt(_553);
    bool _557 = _555 > 0.0;
    bool _559 = !_557;
    float _561 = _523;
    float _563 = _521;
    float _565 = _525;
    float _567 = _533;
    float _569 = _553;
    if (!_559)
    {
        float _571 = _175 * _175;
        float _573 = fma(_173, _173, _571);
        float _575 = fma(_177, _177, _573);
        float _577 = rsqrt(_553);
        float _579 = sqrt(_575);
        float _581 = _533 * _577;
        float _583 = _529 * _577;
        float _585 = _537 * _577;
        bool _587 = _579 > 0.0;
        bool _589 = !_587;
        if (!_589)
        {
            float _591 = rsqrt(_575);
            float _593 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _595 = _175 * _591;
            float _597 = _173 * _591;
            float _599 = _177 * _591;
            float _601 = _583 * _595;
            float _603 = fma(_581, _597, _601);
            float _605 = _593 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _607 = fma(_585, _599, _603);
            float _609 = _607 * _605;
            float _611 = fma(_173, _609, _523);
            float _613 = fma(_175, _609, _521);
            float _615 = fma(_177, _609, _525);
            _561 = _611;
            _563 = _613;
            _565 = _615;
            _567 = _603;
            _569 = _597;
        }
    }
    float _617 = _561;
    float _619 = _563;
    float _621 = _565;
    float _623 = _567;
    float _625 = _569;
    float _627 = _619;
    float _629 = _617;
    float _631 = _621;
    float _633 = _625;
    float _635 = _623;
    if (!_549)
    {
        float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _639 = _461 + _637;
        float _641 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _643 = _429 + _641;
        float _645 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _647 = -_429;
        float _649 = _647 + _617;
        float _651 = _639 * _639;
        float _653 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _655 = _425 + _653;
        float _657 = fma(_643, _643, _651);
        float _659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _661 = fma(_655, _655, _657);
        float _663 = sqrt(_661);
        float _665 = _645 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _667 = precise::min(_663, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _669 = _667 * _659;
        float _671 = _665 * _669;
        float _673 = -_461;
        float _675 = _673 + _619;
        float _677 = -_425;
        float _679 = _677 + _621;
        float _681 = fma(_649, _671, _429);
        float _683 = fma(_675, _671, _461);
        float _685 = fma(_679, _671, _425);
        _627 = _683;
        _629 = _681;
        _631 = _685;
    }
    float _687 = _627;
    float _689 = _629;
    float _691 = _631;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _695 = _687 + _693;
    float _697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _699 = _689 + _697;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _703 = _691 + _701;
    float _705 = _695 * _695;
    float _707 = fma(_699, _699, _705);
    float _709 = fma(_703, _703, _707);
    float _711 = rsqrt(_709);
    float _713 = sqrt(_709);
    float _715 = _711 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _717 = _699 * _715;
    float _719 = _703 * _715;
    float _721 = _717 * _717;
    float _723 = _719 * _719;
    float _725 = _721 + _723;
    float _727 = sqrt(_725);
    bool _729 = _727 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _731 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _733 = _727 + _731;
    float _735 = _711;
    float _737 = _733;
    float _739 = _695;
    float _741 = _715;
    float _743 = _721;
    if (_729)
    {
        float _745 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _735 = _745;
    }
    float _747 = _735;
    if (_729)
    {
        float _749 = rsqrt(_725);
        _633 = _749;
    }
    float _751 = _633;
    float _753 = _751;
    if (_729)
    {
        float _755 = _733 * _747;
        _737 = _755;
    }
    float _757 = _737;
    if (_729)
    {
        float _759 = _757 * 0.15915493667125701904296875;
        _635 = _759;
    }
    float _761 = _635;
    float _763 = _747;
    if (_729)
    {
        float _765 = _761 * 6.283185482025146484375;
        float _767 = sin(_765);
        _763 = _767;
    }
    float _769 = _763;
    float _771 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _773 = precise::max(0.0, _771);
    float _775 = _703;
    float _777 = _773;
    if (_729)
    {
        float _779 = _761 * 6.283185482025146484375;
        float _781 = cos(_779);
        _775 = _781;
    }
    float _783 = _775;
    float _785 = -_715;
    float _787 = -_773;
    float _789 = fma(_695, _785, _787);
    float _791 = _789;
    if (_729)
    {
        float _793 = _789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _777 = _793;
    }
    float _795 = _777;
    float _797 = _795;
    float _799 = _769;
    if (_729)
    {
        float _801 = fma(_769, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _797 = _801;
    }
    float _803 = _797;
    if (!_729)
    {
        _799 = _719;
    }
    float _805 = _799;
    float _807 = _805;
    if (_729)
    {
        float _809 = _783 + (-1.0);
        _739 = _809;
    }
    float _811 = _739;
    float _813 = _811;
    if (_729)
    {
        float _815 = _751 * _803;
        _741 = _815;
    }
    float _817 = _741;
    if (!_729)
    {
        _753 = _717;
    }
    float _819 = _753;
    float _821 = _819;
    if (_729)
    {
        float _823 = _811 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _813 = _823;
    }
    float _825 = _813;
    if (_729)
    {
        float _827 = _717 * _817;
        _821 = _827;
    }
    float _829 = _821;
    float _831 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_729)
    {
        float _833 = _719 * _817;
        _807 = _833;
    }
    float _835 = _807;
    if (_729)
    {
        float _837 = fma(_789, _783, _825);
        _791 = _837;
    }
    float _839 = _791;
    if (_729)
    {
        float _841 = _829 * _829;
        _743 = _841;
    }
    float _843 = _743;
    float _845 = fma(_429, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_729)
    {
        _831 = _723;
    }
    float _847 = _831;
    float _849 = fma(_839, _839, _843);
    float _851 = _687 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _853 = _847;
    if (_729)
    {
        float _855 = _835 * _835;
        _853 = _855;
    }
    float _857 = _853;
    float _859 = floor(_845);
    float _861 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[2].x, _851);
    float _863 = _849 + _857;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _867 = fma(_713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _865);
    float _869 = precise::clamp(_867, 0.0, 1.0);
    float _871 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _873 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[2].z, _861);
    float _875 = -_869;
    float _877 = _875 + 1.0;
    float _879 = rsqrt(_863);
    float _881 = _873 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _883 = fma(_425, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _885 = _687 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _887 = _881 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _889 = abs(_877);
    float _891 = log2(_889);
    float _893 = _687 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _895 = -_887;
    float _897 = fma(_895, _871, 1.0);
    float _899 = _687 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _901 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[3].x, _885);
    float _903 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[1].x, _893);
    float _905 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[0].x, _899);
    float _907 = _879 * _829;
    float _909 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[1].z, _903);
    float _911 = _879 * _839;
    float _913 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[0].z, _905);
    float _915 = _879 * _835;
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _919 = _907 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _921 = _913 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _923 = fma(_691, (*spvDescriptorSet0.vp_c8)._m0[3].z, _901);
    float _925 = _917 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _927 = -_919;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _927);
    float _931 = floor(_883);
    float _933 = _923 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _935 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[7].x, _925);
    float _937 = -_915;
    float _939 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[21].z, _929);
    float _941 = _891 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _943 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[7].z, _935);
    float _945 = fma(_939, -0.5, 0.5);
    float _947 = log2(_897);
    float _949 = fma(_939, 0.5, 0.5);
    float _951 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[7].w, _943);
    float _953 = _917 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _955 = 1.0 / _951;
    float _957 = -_859;
    float _959 = _845 + _957;
    float _961 = _917 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _963 = fma(_949, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _965 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[5].x, _953);
    float _967 = -_931;
    float _969 = _883 + _967;
    float _971 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[4].x, _961);
    float _973 = fma(_949, _963, -0.212114393711090087890625);
    float _975 = exp2(_941);
    float _977 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[5].z, _965);
    float _979 = _911 + 1.0;
    float _981 = fma(_949, _973, 1.570728778839111328125);
    float _983 = _947 * 0.693147182464599609375;
    float _985 = sqrt(_945);
    float2 _3200 = float2(_959, _969);
    float _987 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3200, float2(0.0), isnan(_3200)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3200, float2(0.0), isnan(_3200)), level(0.0)).x;
    float _989 = _983 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _991 = -_911;
    float _993 = fma(_975, _979, _991);
    float _995 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[4].z, _971);
    float _997 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[5].w, _977);
    float _999 = fma(_993, 0.5, 0.5);
    float _1001 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[4].w, _995);
    float _1003 = _997 * _955;
    float _1005 = _985 * 0.636619746685028076171875;
    float _1007 = _1001 * _955;
    float _1009 = fma(_1003, -0.5, 0.5);
    float _1011 = -_981;
    float _1013 = fma(_1005, _1011, 1.0);
    float _1015 = fma(_1007, 0.5, 0.5);
    float3 _3256 = float3(_1015, _1009, _989);
    float _1017 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3256, float3(0.0), isnan(_3256)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3256, float3(0.0), isnan(_3256)), level(0.0)).x;
    float3 _3267 = float3(_1015, _1009, _989);
    float4 _1020 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3267, float3(0.0), isnan(_3267)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3267, float3(0.0), isnan(_3267)), level(0.0)).xyzw;
    float _1022 = _1020.x;
    float _1024 = _1020.y;
    float _1026 = _1020.z;
    float _1028 = _1020.w;
    float2 _3283 = float2(_1013, _999);
    float3 _1032 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3283, float2(0.0), isnan(_3283)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3283, float2(0.0), isnan(_3283)), level(0.0)).xyz;
    float _1034 = _1032.x;
    float _1036 = _1032.y;
    float _1038 = _1032.z;
    float _1040 = _461 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1042 = _917 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1044 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1040);
    float _1046 = _461 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1048 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1042);
    float _1050 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1044);
    float _1052 = fma(_429, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1046);
    float _1054 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1056 = fma(_425, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1052);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1062 = 1.0 / _1054;
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1066 = fma(_881, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1048);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1072 = _1064 + _1054;
    float _1074 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1066);
    float _1076 = in.m_55.x;
    float _1078 = in.m_55.y;
    float _1080 = 1.0 / _1070;
    float _1082 = _1074 + _951;
    float _1084 = _1072 * _1062;
    float _1086 = _1084 * 0.5;
    float _1088 = 1.0 / _1060;
    bool _1090 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1092 = isnan(_355);
    bool _1094 = _1090 || _1092;
    bool _1096 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1098 = _1094 || _1096;
    float _1100 = float(_1098);
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1104 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1102);
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1114 = -_1100;
    float _1116 = _1114 + 1.0;
    float _1118 = 1.0 / _1104;
    float _1120 = _1108 * _1080;
    bool _1122 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1124 = isnan(_355);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    bool _1134 = _1076 > 0.5;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1138 = _355 + _1136;
    float _1140 = _1112 * _1088;
    bool _1142 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1144 = isnan(_355);
    bool _1146 = _1142 || _1144;
    bool _1148 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1150 = _1146 || _1148;
    float _1152 = float(_1150);
    float _1154 = -_1132;
    float _1156 = _1154 + 1.0;
    float _1158 = fma(_1120, _1138, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1160 = _1132 * _1116;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1164 = _355 + _1162;
    float _1166 = _1152 * _1156;
    float _1168 = -_1152;
    float _1170 = _1168 + 1.0;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1174 = _1118 * _1172;
    float _1176 = fma(_1140, _1164, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1178 = _1158 * _1166;
    float _1180 = abs(_1174);
    float _1182 = log2(_1180);
    float _1184 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1178);
    bool _1186 = _1078 > 0.5;
    float _1188 = fma(_1176, _1160, _1184);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1192 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1194 = _1192 != 0;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1198 = -_389;
    int _1200 = _1134 ? as_type<int>(_1198) : as_type<int>(_389);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1204 = _1182 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1208 = _1206 != 0;
    float _1210 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1212 = !_1194;
    float _1214 = _1212 ? _389 : as_type<float>(_1200);
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1218 = -_383;
    int _1220 = _1186 ? as_type<int>(_1218) : as_type<int>(_383);
    float _1222 = exp2(_1204);
    float _1224 = _1196 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1228 = !_1208;
    float _1230 = _1228 ? _383 : as_type<float>(_1220);
    float _1232 = _1214 + 0.5;
    float _1234 = _383 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_62.x = _1210;
    out.m_62.y = _1224;
    out.m_62.z = _1226;
    out.m_62.w = _1216;
    float _1236 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1238 = _389 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1242 = -_1230;
    float _1244 = _1242 + 0.5;
    bool _1246 = _1174 <= 8000.0;
    bool _1248 = isnan(_1174);
    bool _1250 = _1246 || _1248;
    bool _1252 = isnan(8000.0);
    bool _1254 = _1250 || _1252;
    float _1256 = float(_1254);
    float _1258 = _1082 * 0.5;
    float _1260 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1240);
    float _1262 = fma(_1222, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1264 = precise::clamp(_1262, 0.0, 1.0);
    bool _1266 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1268 = isnan(_713);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1274 = _1270 || _1272;
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_64.z = _1258;
    out.m_64.w = _951;
    float _1278 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1280 = _1234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1282 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1278);
    float _1284 = fma(_1264, -2.0, 3.0);
    float _1286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1288 = _1264 * _1264;
    float _1290 = in.m_66.x;
    float _1292 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1280);
    float _1294 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1188);
    float _1296 = _1288 * _1284;
    float _1298 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1300 = _1236 * _1276;
    float _1302 = _891 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1304 = -_1296;
    float _1306 = _1304 + 1.0;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1310 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1312 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1296);
    float _1314 = exp2(_1302);
    float _1316 = _1298 * _1286;
    float _1318 = _1256 * _1312;
    out.gl_Position.x = _1001;
    out.gl_Position.y = _997;
    out.gl_Position.z = _1074;
    out.gl_Position.w = _951;
    float _1320 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_68.x = _1300;
    out.m_68.y = _1316;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1328 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1330 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1332 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1334 = -_1314;
    float _1336 = _1334 + 1.0;
    float _1338 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _1328;
    out.m_70.y = _1330;
    out.m_70.z = _1332;
    out.m_70.w = _1308;
    float _1340 = _1260 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1342 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    out.m_72.x = _1340;
    out.m_72.y = _1342;
    out.m_72.z = _1310;
    float _1344 = _1308;
    float _1346 = _1332;
    float _1348 = _1330;
    if (!_1274)
    {
        _1344 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1350 = _1344;
    float _1352 = _1350;
    float _1354 = _1350;
    if (!_1274)
    {
        _1346 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1356 = _1346;
    float _1358 = _1356;
    float _1360 = _1356;
    if (!_1274)
    {
        _1348 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1362 = _1348;
    float _1364 = -_987;
    float _1366 = _1364 + 1.0;
    float _1368 = _1366 * _1320;
    float _1370 = precise::clamp(_1368, 0.0, 1.0);
    float _1372 = -_1370;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1376 = _1374 * _1290;
    float _1378 = _1376 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_74.x = _1378;
    float _1380 = _1338 * _1017;
    float _1382 = -_1338;
    float _1384 = _1382 + 1.0;
    float _1386 = _1028 * _1380;
    float _1388 = _1038 * _1380;
    float _1390 = _1028 * _1384;
    float _1392 = fma(_1034, _1386, _1022);
    float _1394 = fma(_1036, _1386, _1024);
    float _1396 = fma(_1028, _1388, _1026);
    float _1398 = _1024;
    float _1400 = _1022;
    float _1402 = _1386;
    float _1404 = _1362;
    float _1406 = _1362;
    if (!_1274)
    {
        _1398 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1408 = _1398;
    float _1410 = _1408;
    float _1412 = _1408;
    if (!_1274)
    {
        _1400 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1414 = _1400;
    out.m_76.x = _1392;
    out.m_76.y = _1394;
    out.m_76.z = _1396;
    out.m_76.w = _1390;
    float _1416 = _1414;
    float _1418 = _1414;
    if (!_1274)
    {
        _1402 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1420 = _1402;
    bool _1422 = !_1274;
    float _1424 = _1420;
    float _1426 = _1420;
    if (!_1422)
    {
        bool _1428 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1430 = isnan(_713);
        bool _1432 = _1428 || _1430;
        bool _1434 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1436 = _1432 || _1434;
        if (!_1436)
        {
            float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1440 = _713 + _1438;
            float _1442 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1444 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1442;
            float _1446 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1448 = _1446 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1450 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1452 = _1450 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1454 = 1.0 / _1444;
            float _1456 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1458 = _1456 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1460 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1462 = _1460 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1466 = _1464 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1468 = _1440 * _1454;
            float _1470 = precise::clamp(_1468, 0.0, 1.0);
            float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1474 = _1472 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1476 = fma(_1470, _1448, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1478 = fma(_1470, _1452, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1480 = fma(_1470, _1458, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1482 = fma(_1470, _1474, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1484 = fma(_1470, _1462, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1486 = fma(_1470, _1466, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1418 = _1480;
            _1406 = _1476;
            _1412 = _1478;
            _1360 = _1484;
            _1354 = _1482;
            _1426 = _1486;
            _1488 = true;
        }
        else
        {
            bool _1490 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1492 = isnan(_713);
            bool _1494 = _1490 || _1492;
            bool _1496 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1498 = _1494 || _1496;
            if (!_1498)
            {
                _1410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1500 = _1410;
            _1412 = _1500;
            if (!_1498)
            {
                _1416 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1502 = _1416;
            _1418 = _1502;
            if (!_1498)
            {
                _1352 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1504 = _1352;
            _1354 = _1504;
            if (!_1498)
            {
                _1358 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1506 = _1358;
            _1360 = _1506;
            if (!_1498)
            {
                _1404 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1508 = _1404;
            _1406 = _1508;
            if (!_1498)
            {
                _1424 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1510 = _1424;
            bool _1512 = !_1498;
            _1426 = _1510;
            if (!_1512)
            {
                bool _1514 = _713 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1516 = isnan(_713);
                bool _1518 = _1514 || _1516;
                bool _1520 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1522 = _1518 || _1520;
                if (!_1522)
                {
                    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1526 = _713 + _1524;
                    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1530 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1528;
                    float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1534 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1536 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1538 = _1536 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1540 = 1.0 / _1530;
                    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1544 = _1542 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1548 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1550 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1552 = _1550 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1554 = _1526 * _1540;
                    float _1556 = precise::clamp(_1554, 0.0, 1.0);
                    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1560 = _1558 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1562 = fma(_1556, _1534, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1564 = fma(_1556, _1538, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1566 = fma(_1556, _1544, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1568 = fma(_1556, _1560, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1570 = fma(_1556, _1548, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1572 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1418 = _1566;
                    _1406 = _1562;
                    _1412 = _1564;
                    _1360 = _1570;
                    _1354 = _1568;
                    _1426 = _1572;
                    _1488 = true;
                }
                else
                {
                    _1418 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1406 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1360 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1354 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1426 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1488 = false;
    float _1574 = _1418;
    float _1576 = _1406;
    float _1578 = _1412;
    float _1580 = _1360;
    float _1582 = _1354;
    float _1584 = _1426;
    float _1586 = fma(_1342, -0.5, 0.5);
    float _1588 = precise::clamp(_1586, 0.0, 1.0);
    float _1590 = -_1574;
    float _1592 = _1590 + _1576;
    float _1594 = -_1578;
    float _1596 = _1594 + _1580;
    float _1598 = -_1582;
    float _1600 = _1598 + _1584;
    bool _1602 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1604 = fma(_1588, _1592, _1574);
    float _1606 = fma(_1588, _1596, _1578);
    float _1608 = fma(_1588, _1600, _1582);
    float _1610 = _1604 * 0.586610972881317138671875;
    out.m_78.x = 0.0;
    float _1612 = fma(_1606, 0.298911988735198974609375, _1610);
    float _1614 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = 1.0;
    float _1616 = fma(_1608, 0.114477999508380889892578125, _1612);
    float _1618 = -_1616;
    float _1620 = _1606 + _1618;
    float _1622 = -_1616;
    float _1624 = _1604 + _1622;
    float _1626 = -_1616;
    float _1628 = _1608 + _1626;
    out.m_74.w = _1614;
    float _1630 = fma(_1620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1616);
    float _1632 = fma(_1624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1616);
    float _1634 = fma(_1628, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1616);
    out.m_80.x = _1630;
    out.m_80.y = _1632;
    out.m_80.z = _1634;
    if (!_1602)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1636 = -_687;
    float _1638 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1640 = -_689;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1644 = -_691;
    float _1646 = _1644 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1648 = _1638 * _1638;
    float _1650 = fma(_1642, _1642, _1648);
    float _1652 = fma(_1646, _1646, _1650);
    float _1654 = sqrt(_1652);
    float _1656 = rsqrt(_1652);
    float _1658 = -_1654;
    float _1660 = _1658 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1662 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1664 = precise::clamp(_1662, 0.0, 1.0);
    float _1666 = _1642 * _1656;
    float _1668 = _1638 * _1656;
    float _1670 = abs(_1664);
    float _1672 = log2(_1670);
    float _1674 = _1646 * _1656;
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1678 = _1342 * _1668;
    float _1680 = -_1668;
    float _1682 = -_1676;
    float _1684 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1682);
    float _1686 = fma(_1340, _1666, _1678);
    float _1688 = -_1674;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1684);
    float _1692 = fma(_1310, _1674, _1686);
    float _1694 = precise::clamp(_1692, 0.0, 1.0);
    float _1696 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1698 = _1690 + _1696;
    float _1700 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1702 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = exp2(_1700);
    float _1708 = _1706 * _1704;
    float _1710 = _1694 * _1708;
    float _1712 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1714 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1716 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_78.x = _1712;
    out.m_78.y = _1714;
    out.m_78.z = _1716;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

