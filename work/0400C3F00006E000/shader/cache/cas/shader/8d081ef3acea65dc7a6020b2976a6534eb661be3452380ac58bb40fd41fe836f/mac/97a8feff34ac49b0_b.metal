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
    float4 m_62 [[user(locn0)]];
    float4 m_66 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_78 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(0)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1556 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _1861 = as_type<float>(_113);
        out.gl_Position.z = _1861;
    }
    if (!_101)
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
    if (_127)
    {
        float _133 = float(_97);
        _107 = _133;
    }
    float _135 = _107;
    bool _137 = _131 >= _135;
    bool _139 = !_127;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _115 = as_type<int>(_147);
    }
    int _149 = _115;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1930 = as_type<float>(_149);
        out.gl_Position.z = _1930;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_53.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = in.m_55.x;
    float _159 = in.m_55.y;
    float _161 = in.m_55.z;
    float _163 = _155 * _153;
    int _165 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _167 = _165 != 0;
    float _169 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _171 = _169 * 6.283185482025146484375;
    float _173 = floor(_169);
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _177 = _175 != 0;
    int _179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _181 = _179 != 0;
    float _183 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _171 * 0.15915493667125701904296875;
    float _187 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    int _193 = _191 ? 0 : 1;
    float _195 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _197 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = _185 * 6.283185482025146484375;
    float _201 = cos(_199);
    int _203 = abs(_193);
    float _205 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _207 = !_167;
    int _209 = _207 ? 0 : 1;
    float _211 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    bool _213 = !_181;
    int _215 = _213 ? 0 : 1;
    float _217 = -_173;
    float _219 = _169 + _217;
    int _221 = abs(_209);
    float _223 = -_219;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_203);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _231 = abs(_215);
    float _233 = fma(_201, 0.5, 0.5);
    float _235 = abs(_225);
    float _237 = _227 * _235;
    bool _239 = _219 < 0.5;
    float _241 = float(_239);
    float _243 = -_233;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_221);
    float _249 = -_241;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _253 = float(_231);
    float _255 = fma(_247, _245, _237);
    float _257 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _259 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    float _261 = abs(_251);
    float _263 = fma(_253, _261, _255);
    bool _265 = !_229;
    float _281;
    if (!_265)
    {
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_97);
        float _287 = 1.0 / _285;
        float _289 = _131 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = as_type<float>(int(gl_VertexIndex));
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = in.m_60.x;
    float _317 = in.m_60.y;
    float _319 = -_307;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    float _325 = _295 * _323;
    bool _327 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_291);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    int _347 = as_type<int>(_309) & 1;
    bool _349 = _347 != 0;
    int _351 = as_type<int>(_309) & 2;
    bool _353 = _351 != 0;
    float _355 = _337 * _321;
    float _357 = fma(_341, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_345, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _361 = !_353;
    float _363 = _361 ? (-0.5) : 0.5;
    float _365 = _357 * _355;
    float _367 = _359 * _355;
    float _369 = -_337;
    float _371 = _369 + 1.0;
    bool _373 = !_349;
    float _375 = _373 ? (-0.5) : 0.5;
    float _377 = in.m_46.x;
    float _379 = in.m_46.y;
    float _381 = in.m_46.z;
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _387 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _363);
    float _389 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].y, _383);
    float _391 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].x, _385);
    float _393 = _389 * _317;
    float _395 = _391 * _315;
    float _397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _375);
    float _399 = _263 * _393;
    float _401 = _263 * _395;
    float _403 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _405 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _407 = _403 * _387;
    float _409 = _405 * _397;
    float _411 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _413 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _415 = _407 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _417 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _419 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _411);
    float _421 = _407 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[26].x, _415);
    float _425 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
    float _427 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    float _429 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[24].x, _421);
    float _431 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[26].z, _423);
    float _433 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
    float _435 = _427 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _437 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[24].z, _429);
    float _439 = _431 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _441 = _433 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _443 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _445 = _437 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _447 = _435 + _439;
    float _449 = _407 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _451 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
    float _453 = _441 + _445;
    float _455 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _457 = _447 + _455;
    float _459 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[25].x, _449);
    float _461 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    float _463 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _465 = _453 + _463;
    float _467 = _457 * _457;
    float _469 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _471 = _461 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _473 = fma(_465, _465, _467);
    float _475 = _469 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _477 = _471 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _479 = sqrt(_473);
    float _481 = _471 + _475;
    float _483 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[11].x, _477);
    float _485 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[11].z, _483);
    bool _487 = _479 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _489 = _467;
    float _491 = _475;
    float _493 = _417;
    if (!_487)
    {
        _489 = _453;
    }
    float _495 = _489;
    float _497 = _495;
    if (!_487)
    {
        _491 = _447;
    }
    float _499 = _491;
    float _501 = _499;
    if (!_487)
    {
        _493 = _481;
    }
    float _503 = _493;
    bool _505 = !_487;
    float _507 = _503;
    if (!_505)
    {
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _511 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _513 = _479 + _511;
        float _515 = rsqrt(_473);
        float _517 = _513 * _509;
        float _519 = _481 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _521 = _517 * 0.15915493667125701904296875;
        float _523 = _521 * 6.283185482025146484375;
        float _525 = cos(_523);
        float _527 = _521 * 6.283185482025146484375;
        float _529 = sin(_527);
        float _531 = _525 + (-1.0);
        float _533 = _531 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _535 = fma(_529, _519, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _537 = fma(_481, _525, _533);
        float _539 = _515 * _535;
        float _541 = fma(_465, _539, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _543 = fma(_457, _539, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _507 = _537;
        _497 = _541;
        _501 = _543;
    }
    float _545 = _507;
    float _547 = _497;
    float _549 = _501;
    float _551 = -_471;
    float _553 = _551 + _545;
    float _555 = _485 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _557 = -_441;
    float _559 = _557 + _547;
    float _561 = _471 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _563 = _553 * _553;
    float _565 = -_435;
    float _567 = _565 + _549;
    float _569 = 1.0 / _555;
    float _571 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[10].x, _561);
    float _573 = fma(_559, _559, _563);
    float _575 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[10].z, _571);
    float _577 = fma(_567, _567, _573);
    bool _579 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _581 = isnan(0.5);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _587 = _583 || _585;
    float _589 = _575 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _591 = sqrt(_577);
    bool _593 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _595 = isnan(0.5);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _601 = _597 || _599;
    float _603 = _589 + _555;
    float _605 = _603 * _569;
    float _607 = _605 * 0.5;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _611 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[30].w, _609);
    float _613 = 1.0 / _611;
    bool _615 = _591 > 0.0;
    bool _617 = !_615;
    float _619 = _591;
    float _621 = _547;
    float _623 = _545;
    float _625 = _549;
    float _627 = _559;
    float _629 = _611;
    if (!_617)
    {
        float _631 = _257 * _257;
        float _633 = rsqrt(_577);
        float _635 = fma(_211, _211, _631);
        float _637 = fma(_259, _259, _635);
        float _639 = sqrt(_637);
        float _641 = _559 * _633;
        float _643 = _553 * _633;
        float _645 = _567 * _633;
        bool _647 = _639 > 0.0;
        bool _649 = !_647;
        _619 = _633;
        _629 = _637;
        if (!_649)
        {
            float _651 = rsqrt(_637);
            float _653 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _655 = _257 * _651;
            float _657 = _211 * _651;
            float _659 = _643 * _655;
            float _661 = _259 * _651;
            float _663 = fma(_641, _657, _659);
            float _665 = _653 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _667 = fma(_645, _661, _663);
            float _669 = _667 * _665;
            float _671 = fma(_211, _669, _547);
            float _673 = fma(_257, _669, _545);
            float _675 = fma(_259, _669, _549);
            _619 = _667;
            _621 = _671;
            _623 = _673;
            _625 = _675;
            _627 = _661;
            _629 = _651;
        }
    }
    float _677 = _619;
    float _679 = _621;
    float _681 = _623;
    float _683 = _625;
    float _685 = _627;
    float _687 = _629;
    float _689 = _685;
    float _691 = _687;
    float _693 = _681;
    float _695 = _679;
    float _697 = _683;
    float _699 = _677;
    if (_601)
    {
        _689 = 1.0;
    }
    float _701 = _689;
    float _703 = _701;
    if (!_587)
    {
        float _705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _707 = _471 + _705;
        float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _711 = _441 + _709;
        float _713 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _715 = -_441;
        float _717 = _715 + _679;
        float _719 = _707 * _707;
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _723 = _435 + _721;
        float _725 = fma(_711, _711, _719);
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _729 = fma(_723, _723, _725);
        float _731 = sqrt(_729);
        float _733 = _713 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _735 = precise::min(_731, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _737 = _735 * _727;
        float _739 = -_471;
        float _741 = _739 + _681;
        float _743 = _733 * _737;
        float _745 = -_435;
        float _747 = _745 + _683;
        float _749 = fma(_741, _743, _471);
        float _751 = fma(_717, _743, _441);
        float _753 = fma(_747, _743, _435);
        _691 = _727;
        _693 = _749;
        _695 = _751;
        _697 = _753;
        _699 = _743;
    }
    float _755 = _691;
    float _757 = _693;
    float _759 = _695;
    float _761 = _697;
    float _763 = _699;
    float _765 = 0.0;
    float _767 = _755;
    float _769 = _763;
    if (_601)
    {
        _765 = 1.0;
    }
    float _771 = _765;
    float _773 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _775 = _613 * _773;
    float _777 = _771;
    if (!_601)
    {
        float _779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _781 = _779 * 0.15915493667125701904296875;
        float _783 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _785 = _781 * 6.283185482025146484375;
        float _787 = cos(_785);
        float _789 = _783 * 0.15915493667125701904296875;
        float _791 = _781 * 6.283185482025146484375;
        float _793 = sin(_791);
        float _795 = 1.0 / _787;
        float _797 = _789 * 6.283185482025146484375;
        float _799 = cos(_797);
        float _801 = _793 * _795;
        float _803 = _789 * 6.283185482025146484375;
        float _805 = sin(_803);
        float _807 = _799 * _801;
        float _809 = 1.0 / _807;
        float _811 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _813 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _811;
        float _815 = 1.0 / _813;
        float _817 = _805 * _809;
        float _819 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _821 = fma(_775, _817, _819);
        float _823 = _821 * _815;
        float _825 = precise::clamp(_823, 0.0, 1.0);
        _767 = _781;
        _769 = _789;
        _703 = _825;
    }
    float _827 = _767;
    float _829 = _769;
    float _831 = _703;
    float _833 = _829;
    float _835 = _827;
    if (!_601)
    {
        float _837 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _839 = _837 * 0.15915493667125701904296875;
        float _841 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _843 = _839 * 6.283185482025146484375;
        float _845 = cos(_843);
        float _847 = _841 * 0.15915493667125701904296875;
        float _849 = _839 * 6.283185482025146484375;
        float _851 = sin(_849);
        float _853 = 1.0 / _845;
        float _855 = _847 * 6.283185482025146484375;
        float _857 = cos(_855);
        float _859 = _851 * _853;
        float _861 = _847 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _857 * _859;
        float _867 = 1.0 / _865;
        float _869 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _871 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _869;
        float _873 = 1.0 / _871;
        float _875 = _863 * _867;
        float _877 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _879 = fma(_775, _875, _877);
        float _881 = _879 * _873;
        float _883 = precise::clamp(_881, 0.0, 1.0);
        float _885 = -_883;
        float _887 = _885 + 1.0;
        _833 = _865;
        _835 = _853;
        _777 = _887;
    }
    float _889 = _833;
    float _891 = _835;
    float _893 = _777;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _897 = _757 + _895;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _901 = _759 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _905 = _761 + _903;
    float _907 = _897 * _897;
    float _909 = fma(_901, _901, _907);
    float _911 = fma(_905, _905, _909);
    float _913 = rsqrt(_911);
    float _915 = sqrt(_911);
    float _917 = _913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _901 * _917;
    float _921 = _905 * _917;
    float _923 = _919 * _919;
    float _925 = _921 * _921;
    float _927 = _923 + _925;
    float _929 = sqrt(_927);
    bool _931 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = _929 + _933;
    float _937 = _913;
    float _939 = _935;
    float _941 = _889;
    float _943 = _897;
    float _945 = _923;
    if (_931)
    {
        float _947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _947;
    }
    float _949 = _937;
    float _951 = _949;
    if (_931)
    {
        float _953 = _935 * _949;
        _939 = _953;
    }
    float _955 = _939;
    if (_931)
    {
        float _957 = rsqrt(_927);
        _951 = _957;
    }
    float _959 = _951;
    float _961 = _959;
    if (_931)
    {
        float _963 = _955 * 0.15915493667125701904296875;
        _941 = _963;
    }
    float _965 = _941;
    float _967 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _969 = _905;
    float _971 = _965;
    if (_931)
    {
        float _973 = _965 * 6.283185482025146484375;
        float _975 = sin(_973);
        _969 = _975;
    }
    float _977 = _969;
    float _979 = precise::max(0.0, _967);
    float _981 = _891;
    if (_931)
    {
        float _983 = _965 * 6.283185482025146484375;
        float _985 = cos(_983);
        _981 = _985;
    }
    float _987 = _981;
    float _989 = -_917;
    float _991 = -_979;
    float _993 = fma(_897, _989, _991);
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_931)
    {
        float _997 = _993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _997;
    }
    float _999 = _943;
    float _1001 = fma(_441, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1003 = _977;
    float _1005 = _999;
    if (_931)
    {
        float _1007 = fma(_977, _999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1003 = _1007;
    }
    float _1009 = _1003;
    float _1011 = _1009;
    if (!_931)
    {
        _971 = _919;
    }
    float _1013 = _971;
    float _1015 = _1013;
    if (!_931)
    {
        _1005 = _925;
    }
    float _1017 = _1005;
    float _1019 = 0.0;
    float _1021 = _1017;
    if (_931)
    {
        float _1023 = _959 * _1009;
        _1019 = _1023;
    }
    float _1025 = _1019;
    if (!_931)
    {
        _961 = _993;
    }
    float _1027 = _961;
    float _1029 = _1027;
    if (_931)
    {
        float _1031 = _987 + (-1.0);
        _995 = _1031;
    }
    float _1033 = _995;
    float _1035 = _1033;
    if (_931)
    {
        float _1037 = _919 * _1025;
        _1015 = _1037;
    }
    float _1039 = _1015;
    if (!_931)
    {
        _1011 = _921;
    }
    float _1041 = _1011;
    float _1043 = _1041;
    if (_931)
    {
        float _1045 = _921 * _1025;
        _1043 = _1045;
    }
    float _1047 = _1043;
    if (_931)
    {
        float _1049 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1035 = _1049;
    }
    float _1051 = _1035;
    if (_931)
    {
        float _1053 = _1039 * _1039;
        _945 = _1053;
    }
    float _1055 = _945;
    if (_931)
    {
        float _1057 = _1047 * _1047;
        _1021 = _1057;
    }
    float _1059 = _1021;
    if (_931)
    {
        float _1061 = fma(_993, _987, _1051);
        _1029 = _1061;
    }
    float _1063 = _1029;
    float _1065 = _757 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1067 = floor(_1001);
    float _1069 = fma(_1063, _1063, _1055);
    float _1071 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1065);
    float _1073 = fma(_435, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1075 = _1069 + _1059;
    float _1077 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1071);
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1081 = fma(_915, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1079);
    float _1083 = precise::clamp(_1081, 0.0, 1.0);
    float _1085 = rsqrt(_1075);
    float _1087 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1089 = -_1083;
    float _1091 = _1089 + 1.0;
    float _1093 = _757 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1095 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1097 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1099 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1093);
    float _1101 = abs(_1091);
    float _1103 = log2(_1101);
    float _1105 = _757 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1107 = -_1097;
    float _1109 = fma(_1107, _1095, 1.0);
    float _1111 = _757 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1113 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1115 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1105);
    float _1117 = -_1067;
    float _1119 = _1001 + _1117;
    float _1121 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1111);
    float _1123 = _1085 * _1039;
    float _1125 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1115);
    float _1127 = _1085 * _1063;
    float _1129 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1121);
    float _1131 = _1085 * _1047;
    float _1133 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1135 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1137 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1139 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1141 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1143 = -_1135;
    float _1145 = fma(_1127, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1143);
    float _1147 = floor(_1073);
    float _1149 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1141);
    float _1153 = -_1131;
    float _1155 = fma(_1153, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1145);
    float _1157 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1159 = _1127 + 1.0;
    float _1161 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1151);
    float _1163 = fma(_1155, -0.5, 0.5);
    float _1165 = log2(_1109);
    float _1167 = fma(_1155, 0.5, 0.5);
    float _1169 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1161);
    float _1171 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1173 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1157);
    float _1175 = fma(_1167, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1177 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1171);
    float _1179 = 1.0 / _1169;
    float _1181 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1173);
    float _1183 = -_1147;
    float _1185 = _1073 + _1183;
    float _1187 = fma(_1167, _1175, -0.212114393711090087890625);
    float _1189 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1181);
    float _1191 = sqrt(_1163);
    float _1193 = _1165 * 0.693147182464599609375;
    float _1195 = exp2(_1149);
    float _1197 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1199 = _1189 * _1179;
    float2 _3566 = float2(_1119, _1185);
    float _1201 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3566, float2(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3566, float2(0.0), isnan(_3566)), level(0.0)).x;
    float _1203 = fma(_1167, _1187, 1.570728778839111328125);
    float _1205 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1197);
    float _1207 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1209 = fma(_1199, 0.5, 0.5);
    float _1211 = _1191 * 0.636619746685028076171875;
    float _1213 = _1205 * _1179;
    float _1215 = -_1203;
    float _1217 = fma(_1211, _1215, 1.0);
    float _1219 = fma(_1213, -0.5, 0.5);
    float _1221 = -_1127;
    float _1223 = fma(_1195, _1159, _1221);
    float3 _3611 = float3(_1209, _1219, _1207);
    float _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3611, float3(0.0), isnan(_3611)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3611, float3(0.0), isnan(_3611)), level(0.0)).x;
    float _1227 = fma(_1223, 0.5, 0.5);
    float3 _3624 = float3(_1209, _1219, _1207);
    float4 _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3624, float3(0.0), isnan(_3624)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3624, float3(0.0), isnan(_3624)), level(0.0)).xyzw;
    float _1232 = _1230.x;
    float _1234 = _1230.y;
    float _1236 = _1230.z;
    float _1238 = _1230.w;
    float2 _3640 = float2(_1217, _1227);
    float3 _1242 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3640, float2(0.0), isnan(_3640)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3640, float2(0.0), isnan(_3640)), level(0.0)).xyz;
    float _1244 = _1242.x;
    float _1246 = _1242.y;
    float _1248 = _1242.z;
    float _1250 = abs(_775);
    float _1252 = log2(_1250);
    float _1254 = in.m_53.y;
    float _1256 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1258 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1256);
    bool _1260 = _151 > 0.5;
    float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1264 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1258);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1268 = _1266 != 0;
    float _1270 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1264);
    float _1272 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1274 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1278 = _1276 != 0;
    float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1282 = _775 <= 8000.0;
    bool _1284 = isnan(_775);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(8000.0);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1296 = _1254 > 0.5;
    float _1298 = exp2(_1274);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1302 = -_363;
    int _1304 = _1296 ? as_type<int>(_1302) : as_type<int>(_363);
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1310 = !_1278;
    float _1312 = _1310 ? _363 : as_type<float>(_1304);
    float _1314 = exp2(_1272);
    float _1316 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1318 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = -_1312;
    float _1322 = _1320 + 0.5;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1328 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1330 = precise::clamp(_1328, 0.0, 1.0);
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1334 = -_375;
    int _1336 = _1260 ? as_type<int>(_1334) : as_type<int>(_375);
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1340 = fma(_1330, -2.0, 3.0);
    float _1342 = _1330 * _1330;
    bool _1344 = !_1268;
    float _1346 = _1344 ? _375 : as_type<float>(_1336);
    float _1348 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = -_1314;
    float _1352 = _1350 + 1.0;
    float _1354 = _1342 * _1340;
    float _1356 = _375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1358 = _1346 + 0.5;
    out.m_62.x = _1348;
    out.m_62.y = _1318;
    out.m_62.z = _1306;
    out.m_62.w = _1300;
    float _1360 = -_1354;
    float _1362 = _1360 + 1.0;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1366 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1324);
    float _1370 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1354);
    float _1372 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1326);
    float _1374 = in.m_64.x;
    float _1376 = _1292 * _1370;
    bool _1378 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1380 = isnan(_915);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1386 = _1382 || _1384;
    float _1388 = _1270 + _1169;
    float _1390 = _1338 * _1262;
    float _1392 = _1366 * _1280;
    float _1394 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1396 = _1388 * 0.5;
    float _1398 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1400 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1394);
    out.m_66.x = _1392;
    out.m_66.y = _1390;
    out.gl_Position.x = _1189;
    out.gl_Position.y = _1205;
    out.gl_Position.z = _1270;
    out.gl_Position.w = _1169;
    out.m_68.z = _1396;
    out.m_68.w = _1169;
    float _1402 = _1390;
    float _1404 = _1400;
    if (!_1386)
    {
        _1402 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1406 = _1402;
    float _1408 = -_1364;
    float _1410 = _1408 + 1.0;
    float _1412 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1414 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1416 = _831 * _893;
    float _1418 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1420 = _1416;
    float _1422 = _1406;
    float _1424 = _1406;
    if (!_1386)
    {
        _1420 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1426 = _1420;
    float _1428 = -_1201;
    float _1430 = _1428 + 1.0;
    float _1432 = _1430 * _1398;
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = -_1434;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1440 = _1438 * _1374;
    float _1442 = _1364 * _1225;
    float _1444 = _1440 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1446 = _1440;
    float _1448 = _1236;
    float _1450 = _1426;
    float _1452 = _1426;
    if (!_1386)
    {
        _1446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1454 = _1446;
    float _1456 = _1238 * _1442;
    out.m_70.x = _1444;
    float _1458 = _1248 * _1442;
    float _1460 = fma(_1246, _1456, _1234);
    float _1462 = fma(_1244, _1456, _1232);
    float _1464 = _1238 * _1410;
    float _1466 = fma(_1238, _1458, _1236);
    float _1468 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1470 = _1456;
    float _1472 = _1454;
    float _1474 = _1454;
    if (!_1386)
    {
        _1448 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1476 = _1448;
    float _1478 = _1476;
    float _1480 = _1476;
    if (!_1386)
    {
        _1404 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1482 = _1404;
    out.m_72.x = _1462;
    out.m_72.y = _1460;
    out.m_72.z = _1466;
    out.m_72.w = _1464;
    float _1484 = _1482;
    float _1486 = _1482;
    if (!_1386)
    {
        _1470 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1488 = _1470;
    out.m_74.x = _1468;
    out.m_74.y = _1412;
    out.m_74.z = _1414;
    bool _1490 = !_1386;
    float _1492 = _1488;
    float _1494 = _1488;
    if (!_1490)
    {
        bool _1496 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1498 = isnan(_915);
        bool _1500 = _1496 || _1498;
        bool _1502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1504 = _1500 || _1502;
        if (!_1504)
        {
            float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1508 = _915 + _1506;
            float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1510;
            float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1516 = _1514 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1518 = 1.0 / _1512;
            float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1522 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1526 = _1524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1530 = _1528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1534 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1536 = _1508 * _1518;
            float _1538 = precise::clamp(_1536, 0.0, 1.0);
            float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1542 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1544 = fma(_1538, _1516, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1546 = fma(_1538, _1542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1548 = fma(_1538, _1522, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1550 = fma(_1538, _1526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1552 = fma(_1538, _1530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1554 = fma(_1538, _1534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1474 = _1548;
            _1494 = _1552;
            _1480 = _1544;
            _1424 = _1550;
            _1486 = _1546;
            _1452 = _1554;
            _1556 = true;
        }
        else
        {
            bool _1558 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1560 = isnan(_915);
            bool _1562 = _1558 || _1560;
            bool _1564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1566 = _1562 || _1564;
            if (!_1566)
            {
                _1478 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1568 = _1478;
            _1480 = _1568;
            if (!_1566)
            {
                _1472 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1570 = _1472;
            _1474 = _1570;
            if (!_1566)
            {
                _1484 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1572 = _1484;
            _1486 = _1572;
            if (!_1566)
            {
                _1422 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1574 = _1422;
            _1424 = _1574;
            if (!_1566)
            {
                _1492 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1576 = _1492;
            _1494 = _1576;
            if (!_1566)
            {
                _1450 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1578 = _1450;
            bool _1580 = !_1566;
            _1452 = _1578;
            if (!_1580)
            {
                bool _1582 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1584 = isnan(_915);
                bool _1586 = _1582 || _1584;
                bool _1588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1590 = _1586 || _1588;
                if (!_1590)
                {
                    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1594 = _915 + _1592;
                    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1596;
                    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1602 = _1600 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1604 = 1.0 / _1598;
                    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1608 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1612 = _1610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1616 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1620 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1622 = _1594 * _1604;
                    float _1624 = precise::clamp(_1622, 0.0, 1.0);
                    float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1628 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1630 = fma(_1624, _1602, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1632 = fma(_1624, _1628, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1634 = fma(_1624, _1608, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1636 = fma(_1624, _1612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1638 = fma(_1624, _1616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1640 = fma(_1624, _1620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1474 = _1634;
                    _1494 = _1638;
                    _1480 = _1630;
                    _1424 = _1636;
                    _1486 = _1632;
                    _1452 = _1640;
                    _1556 = true;
                }
                else
                {
                    _1474 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1494 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1480 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1424 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1486 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1452 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1556 = false;
    float _1642 = _1474;
    float _1644 = _1494;
    float _1646 = _1480;
    float _1648 = _1424;
    float _1650 = _1486;
    float _1652 = _1452;
    float _1654 = fma(_1412, -0.5, 0.5);
    float _1656 = precise::clamp(_1654, 0.0, 1.0);
    float _1658 = -_1642;
    float _1660 = _1658 + _1644;
    float _1662 = _1418 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1664 = -_1646;
    float _1666 = _1664 + _1648;
    float _1668 = fma(_1656, _1660, _1642);
    out.m_76.x = 0.0;
    float _1670 = -_1650;
    float _1672 = _1670 + _1652;
    float _1674 = fma(_1656, _1666, _1646);
    float _1676 = _1668 * 0.586610972881317138671875;
    out.m_49.x = _1662;
    bool _1678 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1680 = fma(_1656, _1672, _1650);
    float _1682 = fma(_1674, 0.298911988735198974609375, _1676);
    bool _1684 = _831 > 0.0;
    bool _1686 = isnan(_831);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan(0.0);
    bool _1692 = _1688 || _1690;
    float _1694 = fma(_1680, 0.114477999508380889892578125, _1682);
    bool _1696 = _893 <= 0.0;
    bool _1698 = !_1692;
    bool _1700 = _1696 || _1698;
    float _1702 = -_1694;
    float _1704 = _1674 + _1702;
    float _1706 = -_1694;
    float _1708 = _1668 + _1706;
    float _1710 = -_1694;
    float _1712 = _1680 + _1710;
    float _1714 = fma(_1704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1694);
    float _1716 = fma(_1708, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1694);
    float _1718 = fma(_1712, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1694);
    bool _1720 = !_1678;
    if (!_1720)
    {
        float _1722 = -_757;
        float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1726 = -_759;
        float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1730 = -_761;
        float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1734 = _1724 * _1724;
        float _1736 = fma(_1728, _1728, _1734);
        float _1738 = fma(_1732, _1732, _1736);
        float _1740 = sqrt(_1738);
        float _1742 = rsqrt(_1738);
        float _1744 = -_1740;
        float _1746 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1748 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1750 = precise::clamp(_1748, 0.0, 1.0);
        float _1752 = _1728 * _1742;
        float _1754 = _1724 * _1742;
        float _1756 = abs(_1750);
        float _1758 = log2(_1756);
        float _1760 = _1732 * _1742;
        float _1762 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1764 = _1412 * _1754;
        float _1766 = -_1754;
        float _1768 = -_1762;
        float _1770 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1768);
        float _1772 = fma(_1468, _1752, _1764);
        float _1774 = -_1760;
        float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1770);
        float _1778 = fma(_1414, _1760, _1772);
        float _1780 = precise::clamp(_1778, 0.0, 1.0);
        float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1784 = _1776 + _1782;
        float _1786 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1788 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1790 = precise::clamp(_1788, 0.0, 1.0);
        float _1792 = exp2(_1786);
        float _1794 = _1792 * _1790;
        float _1796 = _1780 * _1794;
        float _1798 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1800 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1802 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_76.x = _1798;
        out.m_76.y = _1800;
        out.m_76.z = _1802;
    }
    out.m_78.x = _1714;
    out.m_78.y = _1716;
    out.m_78.z = _1718;
    if (!_1700)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _1804 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1804;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1556 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _1861 = as_type<float>(_113);
        out.gl_Position.z = _1861;
    }
    if (!_101)
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
    if (_127)
    {
        float _133 = float(_97);
        _107 = _133;
    }
    float _135 = _107;
    bool _137 = _131 >= _135;
    bool _139 = !_127;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _115 = as_type<int>(_147);
    }
    int _149 = _115;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1930 = as_type<float>(_149);
        out.gl_Position.z = _1930;
    }
    if (_141)
    {
        return out;
    }
    float _151 = in.m_53.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = in.m_55.x;
    float _159 = in.m_55.y;
    float _161 = in.m_55.z;
    float _163 = _155 * _153;
    int _165 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _167 = _165 != 0;
    float _169 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _171 = _169 * 6.283185482025146484375;
    float _173 = floor(_169);
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _177 = _175 != 0;
    int _179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _181 = _179 != 0;
    float _183 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _171 * 0.15915493667125701904296875;
    float _187 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    int _193 = _191 ? 0 : 1;
    float _195 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _197 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = _185 * 6.283185482025146484375;
    float _201 = cos(_199);
    int _203 = abs(_193);
    float _205 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _207 = !_167;
    int _209 = _207 ? 0 : 1;
    float _211 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    bool _213 = !_181;
    int _215 = _213 ? 0 : 1;
    float _217 = -_173;
    float _219 = _169 + _217;
    int _221 = abs(_209);
    float _223 = -_219;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_203);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _231 = abs(_215);
    float _233 = fma(_201, 0.5, 0.5);
    float _235 = abs(_225);
    float _237 = _227 * _235;
    bool _239 = _219 < 0.5;
    float _241 = float(_239);
    float _243 = -_233;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_221);
    float _249 = -_241;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _253 = float(_231);
    float _255 = fma(_247, _245, _237);
    float _257 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _259 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    float _261 = abs(_251);
    float _263 = fma(_253, _261, _255);
    bool _265 = !_229;
    float _281;
    if (!_265)
    {
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_97);
        float _287 = 1.0 / _285;
        float _289 = _131 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = as_type<float>(int(gl_VertexIndex));
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = in.m_60.x;
    float _317 = in.m_60.y;
    float _319 = -_307;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    float _325 = _295 * _323;
    bool _327 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_291);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    int _347 = as_type<int>(_309) & 1;
    bool _349 = _347 != 0;
    int _351 = as_type<int>(_309) & 2;
    bool _353 = _351 != 0;
    float _355 = _337 * _321;
    float _357 = fma(_341, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_345, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _361 = !_353;
    float _363 = _361 ? (-0.5) : 0.5;
    float _365 = _357 * _355;
    float _367 = _359 * _355;
    float _369 = -_337;
    float _371 = _369 + 1.0;
    bool _373 = !_349;
    float _375 = _373 ? (-0.5) : 0.5;
    float _377 = in.m_46.x;
    float _379 = in.m_46.y;
    float _381 = in.m_46.z;
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _387 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _363);
    float _389 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].y, _383);
    float _391 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].x, _385);
    float _393 = _389 * _317;
    float _395 = _391 * _315;
    float _397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _375);
    float _399 = _263 * _393;
    float _401 = _263 * _395;
    float _403 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _405 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _407 = _403 * _387;
    float _409 = _405 * _397;
    float _411 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _413 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _415 = _407 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _417 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _419 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _411);
    float _421 = _407 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[26].x, _415);
    float _425 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
    float _427 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    float _429 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[24].x, _421);
    float _431 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[26].z, _423);
    float _433 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
    float _435 = _427 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _437 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[24].z, _429);
    float _439 = _431 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _441 = _433 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _443 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _445 = _437 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _447 = _435 + _439;
    float _449 = _407 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _451 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
    float _453 = _441 + _445;
    float _455 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _457 = _447 + _455;
    float _459 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[25].x, _449);
    float _461 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    float _463 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _465 = _453 + _463;
    float _467 = _457 * _457;
    float _469 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _471 = _461 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _473 = fma(_465, _465, _467);
    float _475 = _469 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _477 = _471 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _479 = sqrt(_473);
    float _481 = _471 + _475;
    float _483 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[11].x, _477);
    float _485 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[11].z, _483);
    bool _487 = _479 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _489 = _467;
    float _491 = _475;
    float _493 = _417;
    if (!_487)
    {
        _489 = _453;
    }
    float _495 = _489;
    float _497 = _495;
    if (!_487)
    {
        _491 = _447;
    }
    float _499 = _491;
    float _501 = _499;
    if (!_487)
    {
        _493 = _481;
    }
    float _503 = _493;
    bool _505 = !_487;
    float _507 = _503;
    if (!_505)
    {
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _511 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _513 = _479 + _511;
        float _515 = rsqrt(_473);
        float _517 = _513 * _509;
        float _519 = _481 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _521 = _517 * 0.15915493667125701904296875;
        float _523 = _521 * 6.283185482025146484375;
        float _525 = cos(_523);
        float _527 = _521 * 6.283185482025146484375;
        float _529 = sin(_527);
        float _531 = _525 + (-1.0);
        float _533 = _531 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _535 = fma(_529, _519, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _537 = fma(_481, _525, _533);
        float _539 = _515 * _535;
        float _541 = fma(_465, _539, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _543 = fma(_457, _539, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _507 = _537;
        _497 = _541;
        _501 = _543;
    }
    float _545 = _507;
    float _547 = _497;
    float _549 = _501;
    float _551 = -_471;
    float _553 = _551 + _545;
    float _555 = _485 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _557 = -_441;
    float _559 = _557 + _547;
    float _561 = _471 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _563 = _553 * _553;
    float _565 = -_435;
    float _567 = _565 + _549;
    float _569 = 1.0 / _555;
    float _571 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[10].x, _561);
    float _573 = fma(_559, _559, _563);
    float _575 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[10].z, _571);
    float _577 = fma(_567, _567, _573);
    bool _579 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _581 = isnan(0.5);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _587 = _583 || _585;
    float _589 = _575 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _591 = sqrt(_577);
    bool _593 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _595 = isnan(0.5);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _601 = _597 || _599;
    float _603 = _589 + _555;
    float _605 = _603 * _569;
    float _607 = _605 * 0.5;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _611 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[30].w, _609);
    float _613 = 1.0 / _611;
    bool _615 = _591 > 0.0;
    bool _617 = !_615;
    float _619 = _591;
    float _621 = _547;
    float _623 = _545;
    float _625 = _549;
    float _627 = _559;
    float _629 = _611;
    if (!_617)
    {
        float _631 = _257 * _257;
        float _633 = rsqrt(_577);
        float _635 = fma(_211, _211, _631);
        float _637 = fma(_259, _259, _635);
        float _639 = sqrt(_637);
        float _641 = _559 * _633;
        float _643 = _553 * _633;
        float _645 = _567 * _633;
        bool _647 = _639 > 0.0;
        bool _649 = !_647;
        _619 = _633;
        _629 = _637;
        if (!_649)
        {
            float _651 = rsqrt(_637);
            float _653 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _655 = _257 * _651;
            float _657 = _211 * _651;
            float _659 = _643 * _655;
            float _661 = _259 * _651;
            float _663 = fma(_641, _657, _659);
            float _665 = _653 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _667 = fma(_645, _661, _663);
            float _669 = _667 * _665;
            float _671 = fma(_211, _669, _547);
            float _673 = fma(_257, _669, _545);
            float _675 = fma(_259, _669, _549);
            _619 = _667;
            _621 = _671;
            _623 = _673;
            _625 = _675;
            _627 = _661;
            _629 = _651;
        }
    }
    float _677 = _619;
    float _679 = _621;
    float _681 = _623;
    float _683 = _625;
    float _685 = _627;
    float _687 = _629;
    float _689 = _685;
    float _691 = _687;
    float _693 = _681;
    float _695 = _679;
    float _697 = _683;
    float _699 = _677;
    if (_601)
    {
        _689 = 1.0;
    }
    float _701 = _689;
    float _703 = _701;
    if (!_587)
    {
        float _705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _707 = _471 + _705;
        float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _711 = _441 + _709;
        float _713 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _715 = -_441;
        float _717 = _715 + _679;
        float _719 = _707 * _707;
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _723 = _435 + _721;
        float _725 = fma(_711, _711, _719);
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _729 = fma(_723, _723, _725);
        float _731 = sqrt(_729);
        float _733 = _713 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _735 = precise::min(_731, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _737 = _735 * _727;
        float _739 = -_471;
        float _741 = _739 + _681;
        float _743 = _733 * _737;
        float _745 = -_435;
        float _747 = _745 + _683;
        float _749 = fma(_741, _743, _471);
        float _751 = fma(_717, _743, _441);
        float _753 = fma(_747, _743, _435);
        _691 = _727;
        _693 = _749;
        _695 = _751;
        _697 = _753;
        _699 = _743;
    }
    float _755 = _691;
    float _757 = _693;
    float _759 = _695;
    float _761 = _697;
    float _763 = _699;
    float _765 = 0.0;
    float _767 = _755;
    float _769 = _763;
    if (_601)
    {
        _765 = 1.0;
    }
    float _771 = _765;
    float _773 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _775 = _613 * _773;
    float _777 = _771;
    if (!_601)
    {
        float _779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _781 = _779 * 0.15915493667125701904296875;
        float _783 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _785 = _781 * 6.283185482025146484375;
        float _787 = cos(_785);
        float _789 = _783 * 0.15915493667125701904296875;
        float _791 = _781 * 6.283185482025146484375;
        float _793 = sin(_791);
        float _795 = 1.0 / _787;
        float _797 = _789 * 6.283185482025146484375;
        float _799 = cos(_797);
        float _801 = _793 * _795;
        float _803 = _789 * 6.283185482025146484375;
        float _805 = sin(_803);
        float _807 = _799 * _801;
        float _809 = 1.0 / _807;
        float _811 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _813 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _811;
        float _815 = 1.0 / _813;
        float _817 = _805 * _809;
        float _819 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _821 = fma(_775, _817, _819);
        float _823 = _821 * _815;
        float _825 = precise::clamp(_823, 0.0, 1.0);
        _767 = _781;
        _769 = _789;
        _703 = _825;
    }
    float _827 = _767;
    float _829 = _769;
    float _831 = _703;
    float _833 = _829;
    float _835 = _827;
    if (!_601)
    {
        float _837 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _839 = _837 * 0.15915493667125701904296875;
        float _841 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _843 = _839 * 6.283185482025146484375;
        float _845 = cos(_843);
        float _847 = _841 * 0.15915493667125701904296875;
        float _849 = _839 * 6.283185482025146484375;
        float _851 = sin(_849);
        float _853 = 1.0 / _845;
        float _855 = _847 * 6.283185482025146484375;
        float _857 = cos(_855);
        float _859 = _851 * _853;
        float _861 = _847 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _857 * _859;
        float _867 = 1.0 / _865;
        float _869 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _871 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _869;
        float _873 = 1.0 / _871;
        float _875 = _863 * _867;
        float _877 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _879 = fma(_775, _875, _877);
        float _881 = _879 * _873;
        float _883 = precise::clamp(_881, 0.0, 1.0);
        float _885 = -_883;
        float _887 = _885 + 1.0;
        _833 = _865;
        _835 = _853;
        _777 = _887;
    }
    float _889 = _833;
    float _891 = _835;
    float _893 = _777;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _897 = _757 + _895;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _901 = _759 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _905 = _761 + _903;
    float _907 = _897 * _897;
    float _909 = fma(_901, _901, _907);
    float _911 = fma(_905, _905, _909);
    float _913 = rsqrt(_911);
    float _915 = sqrt(_911);
    float _917 = _913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _901 * _917;
    float _921 = _905 * _917;
    float _923 = _919 * _919;
    float _925 = _921 * _921;
    float _927 = _923 + _925;
    float _929 = sqrt(_927);
    bool _931 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = _929 + _933;
    float _937 = _913;
    float _939 = _935;
    float _941 = _889;
    float _943 = _897;
    float _945 = _923;
    if (_931)
    {
        float _947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _947;
    }
    float _949 = _937;
    float _951 = _949;
    if (_931)
    {
        float _953 = _935 * _949;
        _939 = _953;
    }
    float _955 = _939;
    if (_931)
    {
        float _957 = rsqrt(_927);
        _951 = _957;
    }
    float _959 = _951;
    float _961 = _959;
    if (_931)
    {
        float _963 = _955 * 0.15915493667125701904296875;
        _941 = _963;
    }
    float _965 = _941;
    float _967 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _969 = _905;
    float _971 = _965;
    if (_931)
    {
        float _973 = _965 * 6.283185482025146484375;
        float _975 = sin(_973);
        _969 = _975;
    }
    float _977 = _969;
    float _979 = precise::max(0.0, _967);
    float _981 = _891;
    if (_931)
    {
        float _983 = _965 * 6.283185482025146484375;
        float _985 = cos(_983);
        _981 = _985;
    }
    float _987 = _981;
    float _989 = -_917;
    float _991 = -_979;
    float _993 = fma(_897, _989, _991);
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_931)
    {
        float _997 = _993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _997;
    }
    float _999 = _943;
    float _1001 = fma(_441, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1003 = _977;
    float _1005 = _999;
    if (_931)
    {
        float _1007 = fma(_977, _999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1003 = _1007;
    }
    float _1009 = _1003;
    float _1011 = _1009;
    if (!_931)
    {
        _971 = _919;
    }
    float _1013 = _971;
    float _1015 = _1013;
    if (!_931)
    {
        _1005 = _925;
    }
    float _1017 = _1005;
    float _1019 = 0.0;
    float _1021 = _1017;
    if (_931)
    {
        float _1023 = _959 * _1009;
        _1019 = _1023;
    }
    float _1025 = _1019;
    if (!_931)
    {
        _961 = _993;
    }
    float _1027 = _961;
    float _1029 = _1027;
    if (_931)
    {
        float _1031 = _987 + (-1.0);
        _995 = _1031;
    }
    float _1033 = _995;
    float _1035 = _1033;
    if (_931)
    {
        float _1037 = _919 * _1025;
        _1015 = _1037;
    }
    float _1039 = _1015;
    if (!_931)
    {
        _1011 = _921;
    }
    float _1041 = _1011;
    float _1043 = _1041;
    if (_931)
    {
        float _1045 = _921 * _1025;
        _1043 = _1045;
    }
    float _1047 = _1043;
    if (_931)
    {
        float _1049 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1035 = _1049;
    }
    float _1051 = _1035;
    if (_931)
    {
        float _1053 = _1039 * _1039;
        _945 = _1053;
    }
    float _1055 = _945;
    if (_931)
    {
        float _1057 = _1047 * _1047;
        _1021 = _1057;
    }
    float _1059 = _1021;
    if (_931)
    {
        float _1061 = fma(_993, _987, _1051);
        _1029 = _1061;
    }
    float _1063 = _1029;
    float _1065 = _757 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1067 = floor(_1001);
    float _1069 = fma(_1063, _1063, _1055);
    float _1071 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1065);
    float _1073 = fma(_435, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1075 = _1069 + _1059;
    float _1077 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1071);
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1081 = fma(_915, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1079);
    float _1083 = precise::clamp(_1081, 0.0, 1.0);
    float _1085 = rsqrt(_1075);
    float _1087 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1089 = -_1083;
    float _1091 = _1089 + 1.0;
    float _1093 = _757 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1095 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1097 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1099 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1093);
    float _1101 = abs(_1091);
    float _1103 = log2(_1101);
    float _1105 = _757 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1107 = -_1097;
    float _1109 = fma(_1107, _1095, 1.0);
    float _1111 = _757 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1113 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1115 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1105);
    float _1117 = -_1067;
    float _1119 = _1001 + _1117;
    float _1121 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1111);
    float _1123 = _1085 * _1039;
    float _1125 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1115);
    float _1127 = _1085 * _1063;
    float _1129 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1121);
    float _1131 = _1085 * _1047;
    float _1133 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1135 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1137 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1139 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1141 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1143 = -_1135;
    float _1145 = fma(_1127, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1143);
    float _1147 = floor(_1073);
    float _1149 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1141);
    float _1153 = -_1131;
    float _1155 = fma(_1153, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1145);
    float _1157 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1159 = _1127 + 1.0;
    float _1161 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1151);
    float _1163 = fma(_1155, -0.5, 0.5);
    float _1165 = log2(_1109);
    float _1167 = fma(_1155, 0.5, 0.5);
    float _1169 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1161);
    float _1171 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1173 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1157);
    float _1175 = fma(_1167, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1177 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1171);
    float _1179 = 1.0 / _1169;
    float _1181 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1173);
    float _1183 = -_1147;
    float _1185 = _1073 + _1183;
    float _1187 = fma(_1167, _1175, -0.212114393711090087890625);
    float _1189 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1181);
    float _1191 = sqrt(_1163);
    float _1193 = _1165 * 0.693147182464599609375;
    float _1195 = exp2(_1149);
    float _1197 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1199 = _1189 * _1179;
    float2 _3566 = float2(_1119, _1185);
    float _1201 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3566, float2(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3566, float2(0.0), isnan(_3566)), level(0.0)).x;
    float _1203 = fma(_1167, _1187, 1.570728778839111328125);
    float _1205 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1197);
    float _1207 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1209 = fma(_1199, 0.5, 0.5);
    float _1211 = _1191 * 0.636619746685028076171875;
    float _1213 = _1205 * _1179;
    float _1215 = -_1203;
    float _1217 = fma(_1211, _1215, 1.0);
    float _1219 = fma(_1213, -0.5, 0.5);
    float _1221 = -_1127;
    float _1223 = fma(_1195, _1159, _1221);
    float3 _3611 = float3(_1209, _1219, _1207);
    float _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3611, float3(0.0), isnan(_3611)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3611, float3(0.0), isnan(_3611)), level(0.0)).x;
    float _1227 = fma(_1223, 0.5, 0.5);
    float3 _3624 = float3(_1209, _1219, _1207);
    float4 _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3624, float3(0.0), isnan(_3624)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3624, float3(0.0), isnan(_3624)), level(0.0)).xyzw;
    float _1232 = _1230.x;
    float _1234 = _1230.y;
    float _1236 = _1230.z;
    float _1238 = _1230.w;
    float2 _3640 = float2(_1217, _1227);
    float3 _1242 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3640, float2(0.0), isnan(_3640)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3640, float2(0.0), isnan(_3640)), level(0.0)).xyz;
    float _1244 = _1242.x;
    float _1246 = _1242.y;
    float _1248 = _1242.z;
    float _1250 = abs(_775);
    float _1252 = log2(_1250);
    float _1254 = in.m_53.y;
    float _1256 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1258 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1256);
    bool _1260 = _151 > 0.5;
    float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1264 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1258);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1268 = _1266 != 0;
    float _1270 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1264);
    float _1272 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1274 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1278 = _1276 != 0;
    float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1282 = _775 <= 8000.0;
    bool _1284 = isnan(_775);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(8000.0);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1296 = _1254 > 0.5;
    float _1298 = exp2(_1274);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1302 = -_363;
    int _1304 = _1296 ? as_type<int>(_1302) : as_type<int>(_363);
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1310 = !_1278;
    float _1312 = _1310 ? _363 : as_type<float>(_1304);
    float _1314 = exp2(_1272);
    float _1316 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1318 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = -_1312;
    float _1322 = _1320 + 0.5;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1328 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1330 = precise::clamp(_1328, 0.0, 1.0);
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1334 = -_375;
    int _1336 = _1260 ? as_type<int>(_1334) : as_type<int>(_375);
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1340 = fma(_1330, -2.0, 3.0);
    float _1342 = _1330 * _1330;
    bool _1344 = !_1268;
    float _1346 = _1344 ? _375 : as_type<float>(_1336);
    float _1348 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = -_1314;
    float _1352 = _1350 + 1.0;
    float _1354 = _1342 * _1340;
    float _1356 = _375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1358 = _1346 + 0.5;
    out.m_62.x = _1348;
    out.m_62.y = _1318;
    out.m_62.z = _1306;
    out.m_62.w = _1300;
    float _1360 = -_1354;
    float _1362 = _1360 + 1.0;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1366 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1324);
    float _1370 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1354);
    float _1372 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1326);
    float _1374 = in.m_64.x;
    float _1376 = _1292 * _1370;
    bool _1378 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1380 = isnan(_915);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1386 = _1382 || _1384;
    float _1388 = _1270 + _1169;
    float _1390 = _1338 * _1262;
    float _1392 = _1366 * _1280;
    float _1394 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1396 = _1388 * 0.5;
    float _1398 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1400 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1394);
    out.m_66.x = _1392;
    out.m_66.y = _1390;
    out.gl_Position.x = _1189;
    out.gl_Position.y = _1205;
    out.gl_Position.z = _1270;
    out.gl_Position.w = _1169;
    out.m_68.z = _1396;
    out.m_68.w = _1169;
    float _1402 = _1390;
    float _1404 = _1400;
    if (!_1386)
    {
        _1402 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1406 = _1402;
    float _1408 = -_1364;
    float _1410 = _1408 + 1.0;
    float _1412 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1414 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1416 = _831 * _893;
    float _1418 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1420 = _1416;
    float _1422 = _1406;
    float _1424 = _1406;
    if (!_1386)
    {
        _1420 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1426 = _1420;
    float _1428 = -_1201;
    float _1430 = _1428 + 1.0;
    float _1432 = _1430 * _1398;
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = -_1434;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1440 = _1438 * _1374;
    float _1442 = _1364 * _1225;
    float _1444 = _1440 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1446 = _1440;
    float _1448 = _1236;
    float _1450 = _1426;
    float _1452 = _1426;
    if (!_1386)
    {
        _1446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1454 = _1446;
    float _1456 = _1238 * _1442;
    out.m_70.x = _1444;
    float _1458 = _1248 * _1442;
    float _1460 = fma(_1246, _1456, _1234);
    float _1462 = fma(_1244, _1456, _1232);
    float _1464 = _1238 * _1410;
    float _1466 = fma(_1238, _1458, _1236);
    float _1468 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1470 = _1456;
    float _1472 = _1454;
    float _1474 = _1454;
    if (!_1386)
    {
        _1448 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1476 = _1448;
    float _1478 = _1476;
    float _1480 = _1476;
    if (!_1386)
    {
        _1404 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1482 = _1404;
    out.m_72.x = _1462;
    out.m_72.y = _1460;
    out.m_72.z = _1466;
    out.m_72.w = _1464;
    float _1484 = _1482;
    float _1486 = _1482;
    if (!_1386)
    {
        _1470 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1488 = _1470;
    out.m_74.x = _1468;
    out.m_74.y = _1412;
    out.m_74.z = _1414;
    bool _1490 = !_1386;
    float _1492 = _1488;
    float _1494 = _1488;
    if (!_1490)
    {
        bool _1496 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1498 = isnan(_915);
        bool _1500 = _1496 || _1498;
        bool _1502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1504 = _1500 || _1502;
        if (!_1504)
        {
            float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1508 = _915 + _1506;
            float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1510;
            float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1516 = _1514 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1518 = 1.0 / _1512;
            float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1522 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1526 = _1524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1530 = _1528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1534 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1536 = _1508 * _1518;
            float _1538 = precise::clamp(_1536, 0.0, 1.0);
            float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1542 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1544 = fma(_1538, _1516, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1546 = fma(_1538, _1542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1548 = fma(_1538, _1522, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1550 = fma(_1538, _1526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1552 = fma(_1538, _1530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1554 = fma(_1538, _1534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1474 = _1548;
            _1494 = _1552;
            _1480 = _1544;
            _1424 = _1550;
            _1486 = _1546;
            _1452 = _1554;
            _1556 = true;
        }
        else
        {
            bool _1558 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1560 = isnan(_915);
            bool _1562 = _1558 || _1560;
            bool _1564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1566 = _1562 || _1564;
            if (!_1566)
            {
                _1478 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1568 = _1478;
            _1480 = _1568;
            if (!_1566)
            {
                _1472 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1570 = _1472;
            _1474 = _1570;
            if (!_1566)
            {
                _1484 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1572 = _1484;
            _1486 = _1572;
            if (!_1566)
            {
                _1422 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1574 = _1422;
            _1424 = _1574;
            if (!_1566)
            {
                _1492 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1576 = _1492;
            _1494 = _1576;
            if (!_1566)
            {
                _1450 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1578 = _1450;
            bool _1580 = !_1566;
            _1452 = _1578;
            if (!_1580)
            {
                bool _1582 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1584 = isnan(_915);
                bool _1586 = _1582 || _1584;
                bool _1588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1590 = _1586 || _1588;
                if (!_1590)
                {
                    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1594 = _915 + _1592;
                    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1596;
                    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1602 = _1600 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1604 = 1.0 / _1598;
                    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1608 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1612 = _1610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1616 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1620 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1622 = _1594 * _1604;
                    float _1624 = precise::clamp(_1622, 0.0, 1.0);
                    float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1628 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1630 = fma(_1624, _1602, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1632 = fma(_1624, _1628, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1634 = fma(_1624, _1608, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1636 = fma(_1624, _1612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1638 = fma(_1624, _1616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1640 = fma(_1624, _1620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1474 = _1634;
                    _1494 = _1638;
                    _1480 = _1630;
                    _1424 = _1636;
                    _1486 = _1632;
                    _1452 = _1640;
                    _1556 = true;
                }
                else
                {
                    _1474 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1494 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1480 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1424 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1486 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1452 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1556 = false;
    float _1642 = _1474;
    float _1644 = _1494;
    float _1646 = _1480;
    float _1648 = _1424;
    float _1650 = _1486;
    float _1652 = _1452;
    float _1654 = fma(_1412, -0.5, 0.5);
    float _1656 = precise::clamp(_1654, 0.0, 1.0);
    float _1658 = -_1642;
    float _1660 = _1658 + _1644;
    float _1662 = _1418 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1664 = -_1646;
    float _1666 = _1664 + _1648;
    float _1668 = fma(_1656, _1660, _1642);
    out.m_76.x = 0.0;
    float _1670 = -_1650;
    float _1672 = _1670 + _1652;
    float _1674 = fma(_1656, _1666, _1646);
    float _1676 = _1668 * 0.586610972881317138671875;
    out.m_49.x = _1662;
    bool _1678 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1680 = fma(_1656, _1672, _1650);
    float _1682 = fma(_1674, 0.298911988735198974609375, _1676);
    bool _1684 = _831 > 0.0;
    bool _1686 = isnan(_831);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan(0.0);
    bool _1692 = _1688 || _1690;
    float _1694 = fma(_1680, 0.114477999508380889892578125, _1682);
    bool _1696 = _893 <= 0.0;
    bool _1698 = !_1692;
    bool _1700 = _1696 || _1698;
    float _1702 = -_1694;
    float _1704 = _1674 + _1702;
    float _1706 = -_1694;
    float _1708 = _1668 + _1706;
    float _1710 = -_1694;
    float _1712 = _1680 + _1710;
    float _1714 = fma(_1704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1694);
    float _1716 = fma(_1708, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1694);
    float _1718 = fma(_1712, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1694);
    bool _1720 = !_1678;
    if (!_1720)
    {
        float _1722 = -_757;
        float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1726 = -_759;
        float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1730 = -_761;
        float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1734 = _1724 * _1724;
        float _1736 = fma(_1728, _1728, _1734);
        float _1738 = fma(_1732, _1732, _1736);
        float _1740 = sqrt(_1738);
        float _1742 = rsqrt(_1738);
        float _1744 = -_1740;
        float _1746 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1748 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1750 = precise::clamp(_1748, 0.0, 1.0);
        float _1752 = _1728 * _1742;
        float _1754 = _1724 * _1742;
        float _1756 = abs(_1750);
        float _1758 = log2(_1756);
        float _1760 = _1732 * _1742;
        float _1762 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1764 = _1412 * _1754;
        float _1766 = -_1754;
        float _1768 = -_1762;
        float _1770 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1768);
        float _1772 = fma(_1468, _1752, _1764);
        float _1774 = -_1760;
        float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1770);
        float _1778 = fma(_1414, _1760, _1772);
        float _1780 = precise::clamp(_1778, 0.0, 1.0);
        float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1784 = _1776 + _1782;
        float _1786 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1788 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1790 = precise::clamp(_1788, 0.0, 1.0);
        float _1792 = exp2(_1786);
        float _1794 = _1792 * _1790;
        float _1796 = _1780 * _1794;
        float _1798 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1800 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1802 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_76.x = _1798;
        out.m_76.y = _1800;
        out.m_76.z = _1802;
    }
    out.m_78.x = _1714;
    out.m_78.y = _1716;
    out.m_78.z = _1718;
    if (!_1700)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _1804 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1804;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1556 = false;
    bool _283 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _1861 = as_type<float>(_113);
        out.gl_Position.z = _1861;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_127)
    {
        float _133 = float(_97);
        _107 = _133;
    }
    float _135 = _107;
    bool _137 = _131 >= _135;
    bool _139 = !_127;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_49.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _115 = as_type<int>(_147);
    }
    int _149 = _115;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1930 = as_type<float>(_149);
        out.gl_Position.z = _1930;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_53.x;
    float _153 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _155 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _157 = in.m_55.x;
    float _159 = in.m_55.y;
    float _161 = in.m_55.z;
    float _163 = _155 * _153;
    int _165 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _167 = _165 != 0;
    float _169 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _171 = _169 * 6.283185482025146484375;
    float _173 = floor(_169);
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _177 = _175 != 0;
    int _179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _181 = _179 != 0;
    float _183 = _159 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _171 * 0.15915493667125701904296875;
    float _187 = _159 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _159 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    int _193 = _191 ? 0 : 1;
    float _195 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _197 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = _185 * 6.283185482025146484375;
    float _201 = cos(_199);
    int _203 = abs(_193);
    float _205 = fma(_157, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _207 = !_167;
    int _209 = _207 ? 0 : 1;
    float _211 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    bool _213 = !_181;
    int _215 = _213 ? 0 : 1;
    float _217 = -_173;
    float _219 = _169 + _217;
    int _221 = abs(_209);
    float _223 = -_219;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _227 = float(_203);
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _231 = abs(_215);
    float _233 = fma(_201, 0.5, 0.5);
    float _235 = abs(_225);
    float _237 = _227 * _235;
    bool _239 = _219 < 0.5;
    float _241 = float(_239);
    float _243 = -_233;
    float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _247 = float(_221);
    float _249 = -_241;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _253 = float(_231);
    float _255 = fma(_247, _245, _237);
    float _257 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _259 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    float _261 = abs(_251);
    float _263 = fma(_253, _261, _255);
    bool _265 = !_229;
    float _281;
    if (!_265)
    {
        float _267 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _269 = _151 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _271 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _273 = _271 * _267;
        float _275 = floor(_273);
        float _277 = -_275;
        float _279 = _273 + _277;
        _281 = _279;
        _283 = true;
    }
    else
    {
        float _285 = float(_97);
        float _287 = 1.0 / _285;
        float _289 = _131 * _287;
        _281 = _289;
    }
    _283 = false;
    float _291 = _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _291 + _293;
    bool _297 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = as_type<float>(int(gl_VertexIndex));
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _311;
    float _315 = in.m_60.x;
    float _317 = in.m_60.y;
    float _319 = -_307;
    float _321 = _319 + 1.0;
    float _323 = 1.0 / _313;
    float _325 = _295 * _323;
    bool _327 = _291 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _329 = isnan(_291);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _343;
    int _347 = as_type<int>(_309) & 1;
    bool _349 = _347 != 0;
    int _351 = as_type<int>(_309) & 2;
    bool _353 = _351 != 0;
    float _355 = _337 * _321;
    float _357 = fma(_341, _325, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = fma(_345, _325, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _361 = !_353;
    float _363 = _361 ? (-0.5) : 0.5;
    float _365 = _357 * _355;
    float _367 = _359 * _355;
    float _369 = -_337;
    float _371 = _369 + 1.0;
    bool _373 = !_349;
    float _375 = _373 ? (-0.5) : 0.5;
    float _377 = in.m_46.x;
    float _379 = in.m_46.y;
    float _381 = in.m_46.z;
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _367);
    float _385 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _387 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _363);
    float _389 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].y, _383);
    float _391 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[144].x, _385);
    float _393 = _389 * _317;
    float _395 = _391 * _315;
    float _397 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _375);
    float _399 = _263 * _393;
    float _401 = _263 * _395;
    float _403 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _405 = _401 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _407 = _403 * _387;
    float _409 = _405 * _397;
    float _411 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _413 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _415 = _407 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _417 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _419 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].x, _411);
    float _421 = _407 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _423 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[26].x, _415);
    float _425 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].x, _413);
    float _427 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    float _429 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[24].x, _421);
    float _431 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[26].z, _423);
    float _433 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].z, _425);
    float _435 = _427 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _437 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[24].z, _429);
    float _439 = _431 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _441 = _433 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _443 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _445 = _437 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _447 = _435 + _439;
    float _449 = _407 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _451 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].x, _443);
    float _453 = _441 + _445;
    float _455 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _457 = _447 + _455;
    float _459 = fma(_409, (*spvDescriptorSet0.vp_c8)._m0[25].x, _449);
    float _461 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    float _463 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _465 = _453 + _463;
    float _467 = _457 * _457;
    float _469 = fma(_417, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _471 = _461 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _473 = fma(_465, _465, _467);
    float _475 = _469 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _477 = _471 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _479 = sqrt(_473);
    float _481 = _471 + _475;
    float _483 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[11].x, _477);
    float _485 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[11].z, _483);
    bool _487 = _479 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _489 = _467;
    float _491 = _475;
    float _493 = _417;
    if (!_487)
    {
        _489 = _453;
    }
    float _495 = _489;
    float _497 = _495;
    if (!_487)
    {
        _491 = _447;
    }
    float _499 = _491;
    float _501 = _499;
    if (!_487)
    {
        _493 = _481;
    }
    float _503 = _493;
    bool _505 = !_487;
    float _507 = _503;
    if (!_505)
    {
        float _509 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _511 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _513 = _479 + _511;
        float _515 = rsqrt(_473);
        float _517 = _513 * _509;
        float _519 = _481 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _521 = _517 * 0.15915493667125701904296875;
        float _523 = _521 * 6.283185482025146484375;
        float _525 = cos(_523);
        float _527 = _521 * 6.283185482025146484375;
        float _529 = sin(_527);
        float _531 = _525 + (-1.0);
        float _533 = _531 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _535 = fma(_529, _519, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _537 = fma(_481, _525, _533);
        float _539 = _515 * _535;
        float _541 = fma(_465, _539, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _543 = fma(_457, _539, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _507 = _537;
        _497 = _541;
        _501 = _543;
    }
    float _545 = _507;
    float _547 = _497;
    float _549 = _501;
    float _551 = -_471;
    float _553 = _551 + _545;
    float _555 = _485 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _557 = -_441;
    float _559 = _557 + _547;
    float _561 = _471 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _563 = _553 * _553;
    float _565 = -_435;
    float _567 = _565 + _549;
    float _569 = 1.0 / _555;
    float _571 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[10].x, _561);
    float _573 = fma(_559, _559, _563);
    float _575 = fma(_435, (*spvDescriptorSet0.vp_c8)._m0[10].z, _571);
    float _577 = fma(_567, _567, _573);
    bool _579 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _581 = isnan(0.5);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _587 = _583 || _585;
    float _589 = _575 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _591 = sqrt(_577);
    bool _593 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _595 = isnan(0.5);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _601 = _597 || _599;
    float _603 = _589 + _555;
    float _605 = _603 * _569;
    float _607 = _605 * 0.5;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _611 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[30].w, _609);
    float _613 = 1.0 / _611;
    bool _615 = _591 > 0.0;
    bool _617 = !_615;
    float _619 = _591;
    float _621 = _547;
    float _623 = _545;
    float _625 = _549;
    float _627 = _559;
    float _629 = _611;
    if (!_617)
    {
        float _631 = _257 * _257;
        float _633 = rsqrt(_577);
        float _635 = fma(_211, _211, _631);
        float _637 = fma(_259, _259, _635);
        float _639 = sqrt(_637);
        float _641 = _559 * _633;
        float _643 = _553 * _633;
        float _645 = _567 * _633;
        bool _647 = _639 > 0.0;
        bool _649 = !_647;
        _619 = _633;
        _629 = _637;
        if (!_649)
        {
            float _651 = rsqrt(_637);
            float _653 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _655 = _257 * _651;
            float _657 = _211 * _651;
            float _659 = _643 * _655;
            float _661 = _259 * _651;
            float _663 = fma(_641, _657, _659);
            float _665 = _653 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _667 = fma(_645, _661, _663);
            float _669 = _667 * _665;
            float _671 = fma(_211, _669, _547);
            float _673 = fma(_257, _669, _545);
            float _675 = fma(_259, _669, _549);
            _619 = _667;
            _621 = _671;
            _623 = _673;
            _625 = _675;
            _627 = _661;
            _629 = _651;
        }
    }
    float _677 = _619;
    float _679 = _621;
    float _681 = _623;
    float _683 = _625;
    float _685 = _627;
    float _687 = _629;
    float _689 = _685;
    float _691 = _687;
    float _693 = _681;
    float _695 = _679;
    float _697 = _683;
    float _699 = _677;
    if (_601)
    {
        _689 = 1.0;
    }
    float _701 = _689;
    float _703 = _701;
    if (!_587)
    {
        float _705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _707 = _471 + _705;
        float _709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _711 = _441 + _709;
        float _713 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _715 = -_441;
        float _717 = _715 + _679;
        float _719 = _707 * _707;
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _723 = _435 + _721;
        float _725 = fma(_711, _711, _719);
        float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _729 = fma(_723, _723, _725);
        float _731 = sqrt(_729);
        float _733 = _713 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _735 = precise::min(_731, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _737 = _735 * _727;
        float _739 = -_471;
        float _741 = _739 + _681;
        float _743 = _733 * _737;
        float _745 = -_435;
        float _747 = _745 + _683;
        float _749 = fma(_741, _743, _471);
        float _751 = fma(_717, _743, _441);
        float _753 = fma(_747, _743, _435);
        _691 = _727;
        _693 = _749;
        _695 = _751;
        _697 = _753;
        _699 = _743;
    }
    float _755 = _691;
    float _757 = _693;
    float _759 = _695;
    float _761 = _697;
    float _763 = _699;
    float _765 = 0.0;
    float _767 = _755;
    float _769 = _763;
    if (_601)
    {
        _765 = 1.0;
    }
    float _771 = _765;
    float _773 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _775 = _613 * _773;
    float _777 = _771;
    if (!_601)
    {
        float _779 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _781 = _779 * 0.15915493667125701904296875;
        float _783 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _785 = _781 * 6.283185482025146484375;
        float _787 = cos(_785);
        float _789 = _783 * 0.15915493667125701904296875;
        float _791 = _781 * 6.283185482025146484375;
        float _793 = sin(_791);
        float _795 = 1.0 / _787;
        float _797 = _789 * 6.283185482025146484375;
        float _799 = cos(_797);
        float _801 = _793 * _795;
        float _803 = _789 * 6.283185482025146484375;
        float _805 = sin(_803);
        float _807 = _799 * _801;
        float _809 = 1.0 / _807;
        float _811 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _813 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _811;
        float _815 = 1.0 / _813;
        float _817 = _805 * _809;
        float _819 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _821 = fma(_775, _817, _819);
        float _823 = _821 * _815;
        float _825 = precise::clamp(_823, 0.0, 1.0);
        _767 = _781;
        _769 = _789;
        _703 = _825;
    }
    float _827 = _767;
    float _829 = _769;
    float _831 = _703;
    float _833 = _829;
    float _835 = _827;
    if (!_601)
    {
        float _837 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _839 = _837 * 0.15915493667125701904296875;
        float _841 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _843 = _839 * 6.283185482025146484375;
        float _845 = cos(_843);
        float _847 = _841 * 0.15915493667125701904296875;
        float _849 = _839 * 6.283185482025146484375;
        float _851 = sin(_849);
        float _853 = 1.0 / _845;
        float _855 = _847 * 6.283185482025146484375;
        float _857 = cos(_855);
        float _859 = _851 * _853;
        float _861 = _847 * 6.283185482025146484375;
        float _863 = sin(_861);
        float _865 = _857 * _859;
        float _867 = 1.0 / _865;
        float _869 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _871 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _869;
        float _873 = 1.0 / _871;
        float _875 = _863 * _867;
        float _877 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _879 = fma(_775, _875, _877);
        float _881 = _879 * _873;
        float _883 = precise::clamp(_881, 0.0, 1.0);
        float _885 = -_883;
        float _887 = _885 + 1.0;
        _833 = _865;
        _835 = _853;
        _777 = _887;
    }
    float _889 = _833;
    float _891 = _835;
    float _893 = _777;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _897 = _757 + _895;
    float _899 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _901 = _759 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _905 = _761 + _903;
    float _907 = _897 * _897;
    float _909 = fma(_901, _901, _907);
    float _911 = fma(_905, _905, _909);
    float _913 = rsqrt(_911);
    float _915 = sqrt(_911);
    float _917 = _913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _901 * _917;
    float _921 = _905 * _917;
    float _923 = _919 * _919;
    float _925 = _921 * _921;
    float _927 = _923 + _925;
    float _929 = sqrt(_927);
    bool _931 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = _929 + _933;
    float _937 = _913;
    float _939 = _935;
    float _941 = _889;
    float _943 = _897;
    float _945 = _923;
    if (_931)
    {
        float _947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _947;
    }
    float _949 = _937;
    float _951 = _949;
    if (_931)
    {
        float _953 = _935 * _949;
        _939 = _953;
    }
    float _955 = _939;
    if (_931)
    {
        float _957 = rsqrt(_927);
        _951 = _957;
    }
    float _959 = _951;
    float _961 = _959;
    if (_931)
    {
        float _963 = _955 * 0.15915493667125701904296875;
        _941 = _963;
    }
    float _965 = _941;
    float _967 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _969 = _905;
    float _971 = _965;
    if (_931)
    {
        float _973 = _965 * 6.283185482025146484375;
        float _975 = sin(_973);
        _969 = _975;
    }
    float _977 = _969;
    float _979 = precise::max(0.0, _967);
    float _981 = _891;
    if (_931)
    {
        float _983 = _965 * 6.283185482025146484375;
        float _985 = cos(_983);
        _981 = _985;
    }
    float _987 = _981;
    float _989 = -_917;
    float _991 = -_979;
    float _993 = fma(_897, _989, _991);
    float _995 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_931)
    {
        float _997 = _993 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _997;
    }
    float _999 = _943;
    float _1001 = fma(_441, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1003 = _977;
    float _1005 = _999;
    if (_931)
    {
        float _1007 = fma(_977, _999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1003 = _1007;
    }
    float _1009 = _1003;
    float _1011 = _1009;
    if (!_931)
    {
        _971 = _919;
    }
    float _1013 = _971;
    float _1015 = _1013;
    if (!_931)
    {
        _1005 = _925;
    }
    float _1017 = _1005;
    float _1019 = 0.0;
    float _1021 = _1017;
    if (_931)
    {
        float _1023 = _959 * _1009;
        _1019 = _1023;
    }
    float _1025 = _1019;
    if (!_931)
    {
        _961 = _993;
    }
    float _1027 = _961;
    float _1029 = _1027;
    if (_931)
    {
        float _1031 = _987 + (-1.0);
        _995 = _1031;
    }
    float _1033 = _995;
    float _1035 = _1033;
    if (_931)
    {
        float _1037 = _919 * _1025;
        _1015 = _1037;
    }
    float _1039 = _1015;
    if (!_931)
    {
        _1011 = _921;
    }
    float _1041 = _1011;
    float _1043 = _1041;
    if (_931)
    {
        float _1045 = _921 * _1025;
        _1043 = _1045;
    }
    float _1047 = _1043;
    if (_931)
    {
        float _1049 = _1033 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1035 = _1049;
    }
    float _1051 = _1035;
    if (_931)
    {
        float _1053 = _1039 * _1039;
        _945 = _1053;
    }
    float _1055 = _945;
    if (_931)
    {
        float _1057 = _1047 * _1047;
        _1021 = _1057;
    }
    float _1059 = _1021;
    if (_931)
    {
        float _1061 = fma(_993, _987, _1051);
        _1029 = _1061;
    }
    float _1063 = _1029;
    float _1065 = _757 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1067 = floor(_1001);
    float _1069 = fma(_1063, _1063, _1055);
    float _1071 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1065);
    float _1073 = fma(_435, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1075 = _1069 + _1059;
    float _1077 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1071);
    float _1079 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1081 = fma(_915, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1079);
    float _1083 = precise::clamp(_1081, 0.0, 1.0);
    float _1085 = rsqrt(_1075);
    float _1087 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1089 = -_1083;
    float _1091 = _1089 + 1.0;
    float _1093 = _757 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1095 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1097 = _1087 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1099 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1093);
    float _1101 = abs(_1091);
    float _1103 = log2(_1101);
    float _1105 = _757 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1107 = -_1097;
    float _1109 = fma(_1107, _1095, 1.0);
    float _1111 = _757 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1113 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1099);
    float _1115 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1105);
    float _1117 = -_1067;
    float _1119 = _1001 + _1117;
    float _1121 = fma(_759, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1111);
    float _1123 = _1085 * _1039;
    float _1125 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1115);
    float _1127 = _1085 * _1063;
    float _1129 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1121);
    float _1131 = _1085 * _1047;
    float _1133 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1135 = _1123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1137 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1139 = _1113 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1141 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1143 = -_1135;
    float _1145 = fma(_1127, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1143);
    float _1147 = floor(_1073);
    float _1149 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1151 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1141);
    float _1153 = -_1131;
    float _1155 = fma(_1153, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1145);
    float _1157 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1159 = _1127 + 1.0;
    float _1161 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1151);
    float _1163 = fma(_1155, -0.5, 0.5);
    float _1165 = log2(_1109);
    float _1167 = fma(_1155, 0.5, 0.5);
    float _1169 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1161);
    float _1171 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1173 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1157);
    float _1175 = fma(_1167, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1177 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1171);
    float _1179 = 1.0 / _1169;
    float _1181 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1173);
    float _1183 = -_1147;
    float _1185 = _1073 + _1183;
    float _1187 = fma(_1167, _1175, -0.212114393711090087890625);
    float _1189 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1181);
    float _1191 = sqrt(_1163);
    float _1193 = _1165 * 0.693147182464599609375;
    float _1195 = exp2(_1149);
    float _1197 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1199 = _1189 * _1179;
    float2 _3566 = float2(_1119, _1185);
    float _1201 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3566, float2(0.0), isnan(_3566)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3566, float2(0.0), isnan(_3566)), level(0.0)).x;
    float _1203 = fma(_1167, _1187, 1.570728778839111328125);
    float _1205 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1197);
    float _1207 = _1193 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1209 = fma(_1199, 0.5, 0.5);
    float _1211 = _1191 * 0.636619746685028076171875;
    float _1213 = _1205 * _1179;
    float _1215 = -_1203;
    float _1217 = fma(_1211, _1215, 1.0);
    float _1219 = fma(_1213, -0.5, 0.5);
    float _1221 = -_1127;
    float _1223 = fma(_1195, _1159, _1221);
    float3 _3611 = float3(_1209, _1219, _1207);
    float _1225 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3611, float3(0.0), isnan(_3611)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3611, float3(0.0), isnan(_3611)), level(0.0)).x;
    float _1227 = fma(_1223, 0.5, 0.5);
    float3 _3624 = float3(_1209, _1219, _1207);
    float4 _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3624, float3(0.0), isnan(_3624)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3624, float3(0.0), isnan(_3624)), level(0.0)).xyzw;
    float _1232 = _1230.x;
    float _1234 = _1230.y;
    float _1236 = _1230.z;
    float _1238 = _1230.w;
    float2 _3640 = float2(_1217, _1227);
    float3 _1242 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3640, float2(0.0), isnan(_3640)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3640, float2(0.0), isnan(_3640)), level(0.0)).xyz;
    float _1244 = _1242.x;
    float _1246 = _1242.y;
    float _1248 = _1242.z;
    float _1250 = abs(_775);
    float _1252 = log2(_1250);
    float _1254 = in.m_53.y;
    float _1256 = _1133 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1258 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1256);
    bool _1260 = _151 > 0.5;
    float _1262 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1264 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1258);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1268 = _1266 != 0;
    float _1270 = fma(_1139, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1264);
    float _1272 = _1103 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1274 = _1252 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1278 = _1276 != 0;
    float _1280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1282 = _775 <= 8000.0;
    bool _1284 = isnan(_775);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(8000.0);
    bool _1290 = _1286 || _1288;
    float _1292 = float(_1290);
    float _1294 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1296 = _1254 > 0.5;
    float _1298 = exp2(_1274);
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1302 = -_363;
    int _1304 = _1296 ? as_type<int>(_1302) : as_type<int>(_363);
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1310 = !_1278;
    float _1312 = _1310 ? _363 : as_type<float>(_1304);
    float _1314 = exp2(_1272);
    float _1316 = _363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1318 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = -_1312;
    float _1322 = _1320 + 0.5;
    float _1324 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1328 = fma(_1298, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1330 = precise::clamp(_1328, 0.0, 1.0);
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1334 = -_375;
    int _1336 = _1260 ? as_type<int>(_1334) : as_type<int>(_375);
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1340 = fma(_1330, -2.0, 3.0);
    float _1342 = _1330 * _1330;
    bool _1344 = !_1268;
    float _1346 = _1344 ? _375 : as_type<float>(_1336);
    float _1348 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = -_1314;
    float _1352 = _1350 + 1.0;
    float _1354 = _1342 * _1340;
    float _1356 = _375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1358 = _1346 + 0.5;
    out.m_62.x = _1348;
    out.m_62.y = _1318;
    out.m_62.z = _1306;
    out.m_62.w = _1300;
    float _1360 = -_1354;
    float _1362 = _1360 + 1.0;
    float _1364 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1366 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1368 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1324);
    float _1370 = fma(_1362, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1354);
    float _1372 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1326);
    float _1374 = in.m_64.x;
    float _1376 = _1292 * _1370;
    bool _1378 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1380 = isnan(_915);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1386 = _1382 || _1384;
    float _1388 = _1270 + _1169;
    float _1390 = _1338 * _1262;
    float _1392 = _1366 * _1280;
    float _1394 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1396 = _1388 * 0.5;
    float _1398 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1400 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1394);
    out.m_66.x = _1392;
    out.m_66.y = _1390;
    out.gl_Position.x = _1189;
    out.gl_Position.y = _1205;
    out.gl_Position.z = _1270;
    out.gl_Position.w = _1169;
    out.m_68.z = _1396;
    out.m_68.w = _1169;
    float _1402 = _1390;
    float _1404 = _1400;
    if (!_1386)
    {
        _1402 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1406 = _1402;
    float _1408 = -_1364;
    float _1410 = _1408 + 1.0;
    float _1412 = _1368 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1414 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1416 = _831 * _893;
    float _1418 = _1416 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1420 = _1416;
    float _1422 = _1406;
    float _1424 = _1406;
    if (!_1386)
    {
        _1420 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1426 = _1420;
    float _1428 = -_1201;
    float _1430 = _1428 + 1.0;
    float _1432 = _1430 * _1398;
    float _1434 = precise::clamp(_1432, 0.0, 1.0);
    float _1436 = -_1434;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1440 = _1438 * _1374;
    float _1442 = _1364 * _1225;
    float _1444 = _1440 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1446 = _1440;
    float _1448 = _1236;
    float _1450 = _1426;
    float _1452 = _1426;
    if (!_1386)
    {
        _1446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1454 = _1446;
    float _1456 = _1238 * _1442;
    out.m_70.x = _1444;
    float _1458 = _1248 * _1442;
    float _1460 = fma(_1246, _1456, _1234);
    float _1462 = fma(_1244, _1456, _1232);
    float _1464 = _1238 * _1410;
    float _1466 = fma(_1238, _1458, _1236);
    float _1468 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1470 = _1456;
    float _1472 = _1454;
    float _1474 = _1454;
    if (!_1386)
    {
        _1448 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1476 = _1448;
    float _1478 = _1476;
    float _1480 = _1476;
    if (!_1386)
    {
        _1404 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1482 = _1404;
    out.m_72.x = _1462;
    out.m_72.y = _1460;
    out.m_72.z = _1466;
    out.m_72.w = _1464;
    float _1484 = _1482;
    float _1486 = _1482;
    if (!_1386)
    {
        _1470 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1488 = _1470;
    out.m_74.x = _1468;
    out.m_74.y = _1412;
    out.m_74.z = _1414;
    bool _1490 = !_1386;
    float _1492 = _1488;
    float _1494 = _1488;
    if (!_1490)
    {
        bool _1496 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1498 = isnan(_915);
        bool _1500 = _1496 || _1498;
        bool _1502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1504 = _1500 || _1502;
        if (!_1504)
        {
            float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1508 = _915 + _1506;
            float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1510;
            float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1516 = _1514 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1518 = 1.0 / _1512;
            float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1522 = _1520 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1526 = _1524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1530 = _1528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1534 = _1532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1536 = _1508 * _1518;
            float _1538 = precise::clamp(_1536, 0.0, 1.0);
            float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1542 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1544 = fma(_1538, _1516, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1546 = fma(_1538, _1542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1548 = fma(_1538, _1522, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1550 = fma(_1538, _1526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1552 = fma(_1538, _1530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1554 = fma(_1538, _1534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1474 = _1548;
            _1494 = _1552;
            _1480 = _1544;
            _1424 = _1550;
            _1486 = _1546;
            _1452 = _1554;
            _1556 = true;
        }
        else
        {
            bool _1558 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1560 = isnan(_915);
            bool _1562 = _1558 || _1560;
            bool _1564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1566 = _1562 || _1564;
            if (!_1566)
            {
                _1478 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1568 = _1478;
            _1480 = _1568;
            if (!_1566)
            {
                _1472 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1570 = _1472;
            _1474 = _1570;
            if (!_1566)
            {
                _1484 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1572 = _1484;
            _1486 = _1572;
            if (!_1566)
            {
                _1422 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1574 = _1422;
            _1424 = _1574;
            if (!_1566)
            {
                _1492 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1576 = _1492;
            _1494 = _1576;
            if (!_1566)
            {
                _1450 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1578 = _1450;
            bool _1580 = !_1566;
            _1452 = _1578;
            if (!_1580)
            {
                bool _1582 = _915 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1584 = isnan(_915);
                bool _1586 = _1582 || _1584;
                bool _1588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1590 = _1586 || _1588;
                if (!_1590)
                {
                    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1594 = _915 + _1592;
                    float _1596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1596;
                    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1602 = _1600 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1604 = 1.0 / _1598;
                    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1608 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1612 = _1610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1616 = _1614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1620 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1622 = _1594 * _1604;
                    float _1624 = precise::clamp(_1622, 0.0, 1.0);
                    float _1626 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1628 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1630 = fma(_1624, _1602, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1632 = fma(_1624, _1628, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1634 = fma(_1624, _1608, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1636 = fma(_1624, _1612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1638 = fma(_1624, _1616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1640 = fma(_1624, _1620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1474 = _1634;
                    _1494 = _1638;
                    _1480 = _1630;
                    _1424 = _1636;
                    _1486 = _1632;
                    _1452 = _1640;
                    _1556 = true;
                }
                else
                {
                    _1474 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1494 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1480 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1424 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1486 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1452 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1556 = false;
    float _1642 = _1474;
    float _1644 = _1494;
    float _1646 = _1480;
    float _1648 = _1424;
    float _1650 = _1486;
    float _1652 = _1452;
    float _1654 = fma(_1412, -0.5, 0.5);
    float _1656 = precise::clamp(_1654, 0.0, 1.0);
    float _1658 = -_1642;
    float _1660 = _1658 + _1644;
    float _1662 = _1418 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1664 = -_1646;
    float _1666 = _1664 + _1648;
    float _1668 = fma(_1656, _1660, _1642);
    out.m_76.x = 0.0;
    float _1670 = -_1650;
    float _1672 = _1670 + _1652;
    float _1674 = fma(_1656, _1666, _1646);
    float _1676 = _1668 * 0.586610972881317138671875;
    out.m_49.x = _1662;
    bool _1678 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1680 = fma(_1656, _1672, _1650);
    float _1682 = fma(_1674, 0.298911988735198974609375, _1676);
    bool _1684 = _831 > 0.0;
    bool _1686 = isnan(_831);
    bool _1688 = _1684 || _1686;
    bool _1690 = isnan(0.0);
    bool _1692 = _1688 || _1690;
    float _1694 = fma(_1680, 0.114477999508380889892578125, _1682);
    bool _1696 = _893 <= 0.0;
    bool _1698 = !_1692;
    bool _1700 = _1696 || _1698;
    float _1702 = -_1694;
    float _1704 = _1674 + _1702;
    float _1706 = -_1694;
    float _1708 = _1668 + _1706;
    float _1710 = -_1694;
    float _1712 = _1680 + _1710;
    float _1714 = fma(_1704, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1694);
    float _1716 = fma(_1708, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1694);
    float _1718 = fma(_1712, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1694);
    bool _1720 = !_1678;
    if (!_1720)
    {
        float _1722 = -_757;
        float _1724 = _1722 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1726 = -_759;
        float _1728 = _1726 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1730 = -_761;
        float _1732 = _1730 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _1734 = _1724 * _1724;
        float _1736 = fma(_1728, _1728, _1734);
        float _1738 = fma(_1732, _1732, _1736);
        float _1740 = sqrt(_1738);
        float _1742 = rsqrt(_1738);
        float _1744 = -_1740;
        float _1746 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _1748 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _1750 = precise::clamp(_1748, 0.0, 1.0);
        float _1752 = _1728 * _1742;
        float _1754 = _1724 * _1742;
        float _1756 = abs(_1750);
        float _1758 = log2(_1756);
        float _1760 = _1732 * _1742;
        float _1762 = _1752 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _1764 = _1412 * _1754;
        float _1766 = -_1754;
        float _1768 = -_1762;
        float _1770 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1768);
        float _1772 = fma(_1468, _1752, _1764);
        float _1774 = -_1760;
        float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1770);
        float _1778 = fma(_1414, _1760, _1772);
        float _1780 = precise::clamp(_1778, 0.0, 1.0);
        float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _1784 = _1776 + _1782;
        float _1786 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _1788 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _1790 = precise::clamp(_1788, 0.0, 1.0);
        float _1792 = exp2(_1786);
        float _1794 = _1792 * _1790;
        float _1796 = _1780 * _1794;
        float _1798 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _1800 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _1802 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_76.x = _1798;
        out.m_76.y = _1800;
        out.m_76.z = _1802;
    }
    out.m_78.x = _1714;
    out.m_78.y = _1716;
    out.m_78.z = _1718;
    if (!_1700)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _1804 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1804;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

