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
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    float _93 = as_type<float>(_85);
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _91;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _95 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1697 = as_type<float>(_101);
        out.gl_Position.z = _1697;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    float _107 = float(_85);
    float _109 = -_105;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_105);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    bool _123 = _111 >= _107;
    bool _125 = !_121;
    bool _127 = _123 || _125;
    if (_127)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _93;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _131 = _129 * 5.0;
        _103 = as_type<int>(_131);
    }
    int _133 = _103;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1760 = as_type<float>(_133);
        out.gl_Position.z = _1760;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_49.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = in.m_51.x;
    float _143 = in.m_51.y;
    float _145 = in.m_51.z;
    float _147 = _139 * _137;
    float _149 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = _149 * 6.283185482025146484375;
    float _153 = floor(_149);
    int _155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _157 = _155 != 0;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _161 = _159 != 0;
    float _163 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _151 * 0.15915493667125701904296875;
    float _167 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _169 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _171 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    float _177 = _165 * 6.283185482025146484375;
    float _179 = cos(_177);
    bool _181 = !_157;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _187 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _169);
    bool _189 = !_175;
    int _191 = _189 ? 0 : 1;
    float _193 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _171);
    int _195 = abs(_183);
    float _197 = -_153;
    float _199 = _149 + _197;
    bool _201 = !_161;
    int _203 = _201 ? 0 : 1;
    float _205 = 1.0 / _107;
    float _207 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    int _209 = abs(_203);
    float _211 = -_199;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _187);
    float _219 = fma(_179, 0.5, 0.5);
    bool _221 = _199 < 0.5;
    float _223 = float(_221);
    int _225 = abs(_191);
    float _227 = -_219;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_195);
    float _233 = abs(_213);
    float _235 = _231 * _233;
    float _237 = float(_225);
    float _239 = -_223;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_209);
    float _245 = fma(_237, _229, _235);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    float _251 = _111 * _205;
    bool _253 = !_215;
    float _255 = _207;
    float _257 = _217;
    float _259 = _193;
    float _275;
    if (!_253)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        _275 = _251;
    }
    _277 = false;
    float _279 = _275;
    float _281 = as_type<float>(int(gl_VertexIndex));
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _279 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _303 = 1.0 / _289;
    float _305 = in.m_49.z;
    bool _307 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_279);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _251 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _321 = in.m_49.w;
    float _323 = 1.0 / _293;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _279 + _325;
    float _329 = 1.0 / _301;
    float _331 = _285 * _303;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _279 + _333;
    int _337 = as_type<int>(_281) & 1;
    bool _339 = _337 != 0;
    int _341 = as_type<int>(_281) & 2;
    bool _343 = _341 != 0;
    float _345 = 1.0 / _297;
    float _347 = _327 * _323;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    bool _353 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _355 = isnan(_279);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = fma(_321, 6.283185482025146484375, _111);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _279 + _367;
    float _371 = _365 * 1.57079637050628662109375;
    float _373 = _369 * _329;
    float _375 = fma(_351, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _377 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _379 = isnan(_279);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _335 * _345;
    float _391 = -_363;
    float _393 = _391 + 1.0;
    bool _395 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _397 = isnan(_279);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -_387;
    float _413 = _411 + 1.0;
    float _415 = _387 * _393;
    float _417 = _371 * 0.15915493667125701904296875;
    float _419 = in.m_49.y;
    float _421 = -_405;
    float _423 = _421 + 1.0;
    float _425 = _405 * _413;
    float _427 = fma(_409, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _433 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _435 = isnan(_279);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _317 * _423;
    float _447 = -_317;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = fma(_431, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -_443;
    float _459 = _457 + 1.0;
    float _461 = _443 * _449;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _467;
    float _471 = fma(_453, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _473 = _375 * _461;
    float _475 = _427 * _461;
    float _477 = fma(_465, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_469, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _483 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _485 = fma(_305, 6.283185482025146484375, _111);
    float _487 = fma(_471, _445, _481);
    float _489 = fma(_419, 6.283185482025146484375, _111);
    float _491 = fma(_455, _445, _483);
    float _493 = _485 * 1.57079637050628662109375;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _499 = _489 * 1.57079637050628662109375;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _505 = in.m_56.x;
    float _507 = in.m_56.y;
    float _509 = fma(_479, _425, _491);
    float _511 = _499 * 0.15915493667125701904296875;
    float _513 = _493 * 0.15915493667125701904296875;
    float _515 = fma(_503, _373, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _517 = fma(_477, _425, _487);
    float _519 = -_319;
    float _521 = _519 + 1.0;
    float _523 = precise::clamp(_521, 0.0, 1.0);
    float _525 = fma(_497, _373, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _527 = _513 * 6.283185482025146484375;
    float _529 = sin(_527);
    float _531 = fma(_515, _415, _509);
    float _533 = in.m_42.x;
    float _535 = in.m_42.y;
    float _537 = in.m_42.z;
    float _539 = fma(_523, -2.0, 3.0);
    float _541 = _523 * _523;
    float _543 = fma(_525, _415, _517);
    float _545 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[147].y, _531);
    float _547 = _511 * 6.283185482025146484375;
    float _549 = sin(_547);
    float _551 = _539 * _541;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[147].x, _543);
    bool _557 = !_343;
    float _559 = _557 ? (-0.5) : 0.5;
    float _561 = _553 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _563 = !_339;
    float _565 = _563 ? (-0.5) : 0.5;
    float _567 = _545 * _507;
    float _569 = _417 * 6.283185482025146484375;
    float _571 = sin(_569);
    float _573 = _555 * _505;
    float _575 = fma(_529, _561, _559);
    float _577 = _249 * _567;
    float _579 = _249 * _573;
    float _581 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _575);
    float _583 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _585 = fma(_549, _561, _565);
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _589 = _535 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _591 = _583 * _581;
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _585);
    float _595 = _535 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _597 = fma(_533, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
    float _599 = _591 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _601 = _571 * _561;
    float _603 = _587 * _593;
    float _605 = _591 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = fma(_533, (*spvDescriptorSet0.vp_c10)._m0[4].x, _595);
    float _609 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _601);
    float _611 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[26].x, _599);
    float _613 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[6].z, _597);
    float _615 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _617 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[4].z, _607);
    float _619 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _611);
    float _621 = _613 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _615);
    float _625 = _617 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _627 = _619 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _629 = _535 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _631 = _623 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _633 = _591 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _635 = _621 + _627;
    float _637 = fma(_533, (*spvDescriptorSet0.vp_c10)._m0[5].x, _629);
    float _639 = _625 + _631;
    float _641 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[25].x, _633);
    float _643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _645 = _635 + _643;
    float _647 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _649 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _651 = _639 + _649;
    float _653 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _641);
    float _655 = _645 * _645;
    float _657 = _647 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _659 = _653 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _661 = fma(_651, _651, _655);
    float _663 = _657 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _665 = _657 + _659;
    float _667 = sqrt(_661);
    float _669 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _663);
    float _671 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[11].z, _669);
    bool _673 = _667 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _675 = _609;
    float _677 = _669;
    float _679 = _637;
    float _681 = _417;
    if (!_673)
    {
        _675 = _639;
    }
    float _683 = _675;
    float _685 = _683;
    if (!_673)
    {
        _677 = _635;
    }
    float _687 = _677;
    float _689 = _687;
    if (!_673)
    {
        _679 = _665;
    }
    float _691 = _679;
    bool _693 = !_673;
    float _695 = _691;
    if (!_693)
    {
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _701 = _667 + _699;
        float _703 = _665 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = rsqrt(_661);
        float _707 = _701 * _697;
        float _709 = _707 * 0.15915493667125701904296875;
        float _711 = _709 * 6.283185482025146484375;
        float _713 = cos(_711);
        float _715 = _709 * 6.283185482025146484375;
        float _717 = sin(_715);
        float _719 = _713 + (-1.0);
        float _721 = _719 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _723 = fma(_717, _703, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _725 = fma(_665, _713, _721);
        float _727 = _705 * _723;
        float _729 = fma(_651, _727, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _731 = fma(_645, _727, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _695 = _725;
        _685 = _729;
        _689 = _731;
    }
    float _733 = _695;
    float _735 = _685;
    float _737 = _689;
    float _739 = -_657;
    float _741 = _739 + _733;
    float _743 = -_625;
    float _745 = _743 + _735;
    float _747 = _671 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _749 = _657 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _751 = _741 * _741;
    float _753 = -_621;
    float _755 = _753 + _737;
    float _757 = 1.0 / _747;
    float _759 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _749);
    float _761 = fma(_745, _745, _751);
    float _763 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[10].z, _759);
    float _765 = fma(_755, _755, _761);
    bool _767 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _769 = isnan(0.5);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _775 = _771 || _773;
    float _777 = _763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _779 = sqrt(_765);
    bool _781 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _789 = _785 || _787;
    float _791 = _777 + _747;
    float _793 = _791 * _757;
    float _795 = _793 * 0.5;
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _799 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _797);
    float _801 = 1.0 / _799;
    bool _803 = _779 > 0.0;
    bool _805 = !_803;
    float _807 = _735;
    float _809 = _733;
    float _811 = _737;
    float _813 = _779;
    float _815 = _741;
    float _817 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_805)
    {
        float _819 = _207 * _207;
        float _821 = fma(_193, _193, _819);
        float _823 = fma(_217, _217, _821);
        float _825 = rsqrt(_765);
        float _827 = sqrt(_823);
        float _829 = _745 * _825;
        float _831 = _741 * _825;
        float _833 = _755 * _825;
        bool _835 = _827 > 0.0;
        bool _837 = !_835;
        _813 = _825;
        _817 = _829;
        if (!_837)
        {
            float _839 = rsqrt(_823);
            float _841 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _843 = _207 * _839;
            float _845 = _193 * _839;
            float _847 = _831 * _843;
            float _849 = _217 * _839;
            float _851 = fma(_829, _845, _847);
            float _853 = _841 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _855 = fma(_833, _849, _851);
            float _857 = _855 * _853;
            float _859 = fma(_193, _857, _735);
            float _861 = fma(_207, _857, _733);
            float _863 = fma(_217, _857, _737);
            _807 = _859;
            _809 = _861;
            _811 = _863;
            _813 = _845;
            _815 = _853;
        }
    }
    float _865 = _807;
    float _867 = _809;
    float _869 = _811;
    float _871 = _813;
    float _873 = _815;
    float _875 = _817;
    float _877 = _873;
    float _879 = _871;
    float _881 = _865;
    float _883 = _875;
    if (_789)
    {
        _877 = 1.0;
    }
    float _885 = _877;
    float _887 = _885;
    if (_775)
    {
        _255 = _865;
    }
    float _889 = _255;
    float _891 = _889;
    if (_775)
    {
        _257 = _867;
    }
    float _893 = _257;
    float _895 = _893;
    if (_775)
    {
        _259 = _869;
    }
    float _897 = _259;
    float _899 = _897;
    if (!_775)
    {
        float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _903 = _657 + _901;
        float _905 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _907 = _625 + _905;
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _911 = -_625;
        float _913 = _911 + _865;
        float _915 = _903 * _903;
        float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _919 = _621 + _917;
        float _921 = -_657;
        float _923 = _921 + _867;
        float _925 = -_621;
        float _927 = _925 + _869;
        float _929 = fma(_907, _907, _915);
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _933 = fma(_919, _919, _929);
        float _935 = sqrt(_933);
        float _937 = _909 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _939 = precise::min(_935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _941 = _939 * _931;
        float _943 = _937 * _941;
        float _945 = fma(_913, _943, _625);
        float _947 = fma(_923, _943, _657);
        float _949 = fma(_927, _943, _621);
        _879 = _943;
        _895 = _947;
        _891 = _945;
        _899 = _949;
        _881 = _913;
    }
    float _951 = _879;
    float _953 = _895;
    float _955 = _891;
    float _957 = _899;
    float _959 = _881;
    float _961 = _951;
    float _963 = _959;
    if (_789)
    {
        _883 = 1.0;
    }
    float _965 = _883;
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _969 = _801 * _967;
    float _971 = _965;
    if (!_789)
    {
        float _973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _975 = _973 * 0.15915493667125701904296875;
        float _977 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _979 = _975 * 6.283185482025146484375;
        float _981 = cos(_979);
        float _983 = _977 * 0.15915493667125701904296875;
        float _985 = _975 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = 1.0 / _981;
        float _991 = _983 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = _987 * _989;
        float _997 = _983 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _993 * _995;
        float _1003 = 1.0 / _1001;
        float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1007 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1005;
        float _1009 = 1.0 / _1007;
        float _1011 = _999 * _1003;
        float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1015 = fma(_969, _1011, _1013);
        float _1017 = _1015 * _1009;
        float _1019 = precise::clamp(_1017, 0.0, 1.0);
        _961 = _983;
        _963 = _1015;
        _887 = _1019;
    }
    float _1021 = _961;
    float _1023 = _963;
    float _1025 = _887;
    float _1027 = _1021;
    float _1029 = _1023;
    if (!_789)
    {
        float _1031 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1033 = _1031 * 0.15915493667125701904296875;
        float _1035 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1037 = _1033 * 6.283185482025146484375;
        float _1039 = cos(_1037);
        float _1041 = _1035 * 0.15915493667125701904296875;
        float _1043 = _1033 * 6.283185482025146484375;
        float _1045 = sin(_1043);
        float _1047 = 1.0 / _1039;
        float _1049 = _1041 * 6.283185482025146484375;
        float _1051 = cos(_1049);
        float _1053 = _1045 * _1047;
        float _1055 = _1041 * 6.283185482025146484375;
        float _1057 = sin(_1055);
        float _1059 = _1051 * _1053;
        float _1061 = 1.0 / _1059;
        float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1065 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1063;
        float _1067 = 1.0 / _1065;
        float _1069 = _1057 * _1061;
        float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1073 = fma(_969, _1069, _1071);
        float _1075 = _1073 * _1067;
        float _1077 = precise::clamp(_1075, 0.0, 1.0);
        float _1079 = -_1077;
        float _1081 = _1079 + 1.0;
        _1027 = _1047;
        _1029 = _1059;
        _971 = _1081;
    }
    float _1083 = _1027;
    float _1085 = _1029;
    float _1087 = _971;
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = _953 + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1095 = _955 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _957 + _1097;
    float _1101 = _1091 * _1091;
    float _1103 = fma(_1095, _1095, _1101);
    float _1105 = fma(_1099, _1099, _1103);
    float _1107 = rsqrt(_1105);
    float _1109 = _1107 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1111 = _1095 * _1109;
    float _1113 = _1099 * _1109;
    float _1115 = _1111 * _1111;
    float _1117 = _1113 * _1113;
    float _1119 = _1115 + _1117;
    float _1121 = sqrt(_1119);
    bool _1123 = _1121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1127 = _1121 + _1125;
    float _1129 = _1099;
    float _1131 = _1085;
    float _1133 = _1127;
    float _1135 = _1083;
    float _1137 = _1091;
    if (_1123)
    {
        float _1139 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1129 = _1139;
    }
    float _1141 = _1129;
    if (_1123)
    {
        float _1143 = rsqrt(_1119);
        _1131 = _1143;
    }
    float _1145 = _1131;
    float _1147 = _1145;
    if (_1123)
    {
        float _1149 = _1127 * _1141;
        _1133 = _1149;
    }
    float _1151 = _1133;
    if (_1123)
    {
        float _1153 = _1151 * 0.15915493667125701904296875;
        _1135 = _1153;
    }
    float _1155 = _1135;
    float _1157 = _1101;
    if (_1123)
    {
        float _1159 = _1155 * 6.283185482025146484375;
        float _1161 = sin(_1159);
        _1157 = _1161;
    }
    float _1163 = _1157;
    float _1165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1167 = precise::max(0.0, _1165);
    float _1169 = _1107;
    float _1171 = _1167;
    float _1173 = _1165;
    if (_1123)
    {
        float _1175 = _1155 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        _1169 = _1177;
    }
    float _1179 = _1169;
    float _1181 = -_1109;
    float _1183 = -_1167;
    float _1185 = fma(_1091, _1181, _1183);
    if (!_1123)
    {
        _1171 = _1111;
    }
    float _1187 = _1171;
    float _1189 = _1187;
    if (_1123)
    {
        float _1191 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1173 = _1191;
    }
    float _1193 = _1173;
    float _1195 = sqrt(_1105);
    float _1197 = _1163;
    float _1199 = _1193;
    if (_1123)
    {
        float _1201 = fma(_1163, _1193, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1137 = _1201;
    }
    float _1203 = _1137;
    float _1205 = _1203;
    if (!_1123)
    {
        _1197 = _1115;
    }
    float _1207 = _1197;
    float _1209 = _1207;
    float _1211 = _1179;
    if (_1123)
    {
        float _1213 = _1179 + (-1.0);
        _1199 = _1213;
    }
    float _1215 = _1199;
    float _1217 = _1215;
    if (_1123)
    {
        float _1219 = _1145 * _1203;
        _681 = _1219;
    }
    float _1221 = _681;
    if (!_1123)
    {
        _1205 = _1185;
    }
    float _1223 = _1205;
    float _1225 = _1223;
    if (_1123)
    {
        float _1227 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1147 = _1227;
    }
    float _1229 = _1147;
    if (_1123)
    {
        float _1231 = _1111 * _1221;
        _1189 = _1231;
    }
    float _1233 = _1189;
    if (!_1123)
    {
        _1217 = _1113;
    }
    float _1235 = _1217;
    float _1237 = _1235;
    if (_1123)
    {
        float _1239 = _1113 * _1221;
        _1237 = _1239;
    }
    float _1241 = _1237;
    if (_1123)
    {
        float _1243 = fma(_1185, _1179, _1229);
        _1225 = _1243;
    }
    float _1245 = _1225;
    if (_1123)
    {
        float _1247 = _1233 * _1233;
        _1209 = _1247;
    }
    float _1249 = _1209;
    if (!_1123)
    {
        _1211 = _1117;
    }
    float _1251 = _1211;
    float _1253 = _1251;
    if (_1123)
    {
        float _1255 = _1241 * _1241;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(_1245, _1245, _1249);
    float _1261 = _1259 + _1257;
    float _1263 = _953 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1267 = fma(_1195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1265);
    float _1269 = precise::clamp(_1267, 0.0, 1.0);
    float _1271 = _953 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1273 = rsqrt(_1261);
    float _1275 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1263);
    float _1277 = -_1269;
    float _1279 = _1277 + 1.0;
    float _1281 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1283 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1285 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1275);
    float _1287 = _953 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1289 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1281);
    float _1291 = abs(_1279);
    float _1293 = log2(_1291);
    float _1295 = _953 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1297 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1287);
    float _1299 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1301 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1303 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1295);
    float _1305 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1297);
    float _1307 = _1273 * _1233;
    float _1309 = _1273 * _1245;
    float _1311 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1315 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1317 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1303);
    float _1319 = _1273 * _1241;
    float _1321 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1313);
    float _1323 = -_1315;
    float _1325 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1323);
    float _1327 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1329 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1331 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1333 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = -_1319;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1325);
    float _1339 = -_1327;
    float _1341 = fma(_1339, _1283, 1.0);
    float _1343 = exp2(_1329);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    float _1347 = fma(_1337, -0.5, 0.5);
    float _1349 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1351 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1353 = fma(_1337, 0.5, 0.5);
    float _1355 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1349);
    float _1357 = log2(_1341);
    float _1359 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1351);
    float _1361 = _1309 + 1.0;
    float _1363 = fma(_1353, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1365 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1355);
    float _1367 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1359);
    float _1369 = 1.0 / _1345;
    float _1371 = -_1309;
    float _1373 = fma(_1343, _1361, _1371);
    float _1375 = fma(_1353, _1363, -0.212114393711090087890625);
    float _1377 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1365);
    float _1379 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1367);
    float _1381 = fma(_1353, _1375, 1.570728778839111328125);
    float _1383 = sqrt(_1347);
    float _1385 = _1357 * 0.693147182464599609375;
    float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1389 = _1377 * _1369;
    float _1391 = _1379 * _1369;
    float _1393 = fma(_1373, 0.5, 0.5);
    float _1395 = fma(_1389, 0.5, 0.5);
    float _1397 = fma(_1391, -0.5, 0.5);
    float _1399 = _1383 * 0.636619746685028076171875;
    float3 _3728 = float3(_1395, _1397, _1387);
    float _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3728, float3(0.0), isnan(_3728)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3728, float3(0.0), isnan(_3728)), level(0.0)).x;
    float _1403 = -_1381;
    float _1405 = fma(_1399, _1403, 1.0);
    float3 _3744 = float3(_1395, _1397, _1387);
    float4 _1408 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3744, float3(0.0), isnan(_3744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3744, float3(0.0), isnan(_3744)), level(0.0)).xyzw;
    float _1410 = _1408.x;
    float _1412 = _1408.y;
    float _1414 = _1408.z;
    float _1416 = _1408.w;
    float2 _3761 = float2(_1405, _1393);
    float3 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3761, float2(0.0), isnan(_3761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3761, float2(0.0), isnan(_3761)), level(0.0)).xyz;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1430 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1432 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1434 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1436 = _1428 * _135;
    bool _1438 = _135 > 0.5;
    float _1440 = _1432 * _135;
    float _1442 = exp2(_1430);
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1446 = _1444 != 0;
    float _1448 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1434);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1452 = _1450 != 0;
    float _1454 = trunc(_1436);
    int _1456 = int(_1454);
    float _1458 = trunc(_1440);
    int _1460 = int(_1458);
    float _1462 = -_1442;
    float _1464 = _1462 + 1.0;
    int _1466 = _1456 << 4;
    int _1468 = _1466 + 1968;
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1473 = uint(int(uint(_1468) >> uint(2)));
    uint _1475 = uint(int(uint(int(_1473)) >> uint(2)));
    int _1477 = int(_1473) & 3;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[int(_1475)][_1477];
    int _1481 = int(_1473) + 1;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    int _1485 = _1481 & 3;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[int(_1483)][_1485];
    int _1489 = _1460 << 4;
    int _1491 = _1489 + 1712;
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1495 = -_565;
    int _1497 = _1438 ? as_type<int>(_1495) : as_type<int>(_565);
    uint _1499 = uint(int(uint(_1491) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[int(_1509)][_1511];
    bool _1515 = _419 > 0.5;
    bool _1517 = !_1446;
    float _1519 = _1517 ? _565 : as_type<float>(_1497);
    bool _1521 = _1025 > 0.0;
    bool _1523 = isnan(_1025);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan(0.0);
    bool _1529 = _1525 || _1527;
    int _1531 = _1491 + 8;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    uint _1535 = uint(int(uint(int(_1533)) >> uint(2)));
    int _1537 = int(_1533) & 3;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[int(_1535)][_1537];
    float _1541 = _1519 + 0.5;
    bool _1543 = _1087 <= 0.0;
    bool _1545 = !_1529;
    bool _1547 = _1543 || _1545;
    float _1549 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1551 = _1468 + 8;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    uint _1555 = uint(int(uint(int(_1553)) >> uint(2)));
    int _1557 = int(_1553) & 3;
    float _1559 = (*spvDescriptorSet0.vp_c9)._m0[int(_1555)][_1557];
    float _1561 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1448);
    float _1563 = _1549 * _1470;
    float _1565 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1561);
    float _1567 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1569 = _1487 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1573 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1025 * _1087;
    float _1579 = _1505 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1581 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1583 = -_559;
    int _1585 = _1515 ? as_type<int>(_1583) : as_type<int>(_559);
    float _1587 = _1577 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1589 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1591 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1593 = !_1452;
    float _1595 = _1593 ? _559 : as_type<float>(_1585);
    float _1597 = _1539 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1599 = -_1595;
    float _1601 = _1599 + 0.5;
    float _1603 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1607 = _1559 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_58.x = _1589;
    out.m_58.y = _1591;
    out.m_58.z = _1603;
    out.m_58.w = _1571;
    float _1609 = _1605 * _1493;
    float _1611 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1563;
    out.m_60.y = _1609;
    out.m_62.x = _1573;
    out.m_62.y = _1575;
    out.m_62.z = _1611;
    float _1613 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1615 = _1565 + _1345;
    float _1617 = -_1613;
    float _1619 = _1617 + 1.0;
    float _1621 = _1615 * 0.5;
    float _1623 = _1587 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _1621;
    out.m_64.w = _1345;
    out.m_45.x = _1623;
    out.gl_Position.x = _1377;
    out.gl_Position.y = _1379;
    out.gl_Position.z = _1565;
    out.gl_Position.w = _1345;
    float _1625 = _1613 * _1401;
    float _1627 = _1416 * _1625;
    float _1629 = _1416 * _1619;
    float _1631 = _1426 * _1625;
    float _1633 = fma(_1422, _1627, _1410);
    float _1635 = fma(_1424, _1627, _1412);
    float _1637 = fma(_1416, _1631, _1414);
    out.m_66.x = _1633;
    out.m_66.y = _1635;
    out.m_66.z = _1637;
    out.m_66.w = _1629;
    if (!_1547)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1639 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1639;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    float _93 = as_type<float>(_85);
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _91;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _95 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1697 = as_type<float>(_101);
        out.gl_Position.z = _1697;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_47.w;
    float _107 = float(_85);
    float _109 = -_105;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_105);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    bool _123 = _111 >= _107;
    bool _125 = !_121;
    bool _127 = _123 || _125;
    if (_127)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _93;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _131 = _129 * 5.0;
        _103 = as_type<int>(_131);
    }
    int _133 = _103;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1760 = as_type<float>(_133);
        out.gl_Position.z = _1760;
    }
    if (_127)
    {
        return out;
    }
    float _135 = in.m_49.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = in.m_51.x;
    float _143 = in.m_51.y;
    float _145 = in.m_51.z;
    float _147 = _139 * _137;
    float _149 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = _149 * 6.283185482025146484375;
    float _153 = floor(_149);
    int _155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _157 = _155 != 0;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _161 = _159 != 0;
    float _163 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _151 * 0.15915493667125701904296875;
    float _167 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _169 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _171 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    float _177 = _165 * 6.283185482025146484375;
    float _179 = cos(_177);
    bool _181 = !_157;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _187 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _169);
    bool _189 = !_175;
    int _191 = _189 ? 0 : 1;
    float _193 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _171);
    int _195 = abs(_183);
    float _197 = -_153;
    float _199 = _149 + _197;
    bool _201 = !_161;
    int _203 = _201 ? 0 : 1;
    float _205 = 1.0 / _107;
    float _207 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    int _209 = abs(_203);
    float _211 = -_199;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _187);
    float _219 = fma(_179, 0.5, 0.5);
    bool _221 = _199 < 0.5;
    float _223 = float(_221);
    int _225 = abs(_191);
    float _227 = -_219;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_195);
    float _233 = abs(_213);
    float _235 = _231 * _233;
    float _237 = float(_225);
    float _239 = -_223;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_209);
    float _245 = fma(_237, _229, _235);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    float _251 = _111 * _205;
    bool _253 = !_215;
    float _255 = _207;
    float _257 = _217;
    float _259 = _193;
    float _275;
    if (!_253)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        _275 = _251;
    }
    _277 = false;
    float _279 = _275;
    float _281 = as_type<float>(int(gl_VertexIndex));
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _279 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _303 = 1.0 / _289;
    float _305 = in.m_49.z;
    bool _307 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_279);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _251 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _321 = in.m_49.w;
    float _323 = 1.0 / _293;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _279 + _325;
    float _329 = 1.0 / _301;
    float _331 = _285 * _303;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _279 + _333;
    int _337 = as_type<int>(_281) & 1;
    bool _339 = _337 != 0;
    int _341 = as_type<int>(_281) & 2;
    bool _343 = _341 != 0;
    float _345 = 1.0 / _297;
    float _347 = _327 * _323;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    bool _353 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _355 = isnan(_279);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = fma(_321, 6.283185482025146484375, _111);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _279 + _367;
    float _371 = _365 * 1.57079637050628662109375;
    float _373 = _369 * _329;
    float _375 = fma(_351, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _377 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _379 = isnan(_279);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _335 * _345;
    float _391 = -_363;
    float _393 = _391 + 1.0;
    bool _395 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _397 = isnan(_279);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -_387;
    float _413 = _411 + 1.0;
    float _415 = _387 * _393;
    float _417 = _371 * 0.15915493667125701904296875;
    float _419 = in.m_49.y;
    float _421 = -_405;
    float _423 = _421 + 1.0;
    float _425 = _405 * _413;
    float _427 = fma(_409, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _433 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _435 = isnan(_279);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _317 * _423;
    float _447 = -_317;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = fma(_431, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -_443;
    float _459 = _457 + 1.0;
    float _461 = _443 * _449;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _467;
    float _471 = fma(_453, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _473 = _375 * _461;
    float _475 = _427 * _461;
    float _477 = fma(_465, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_469, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _483 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _485 = fma(_305, 6.283185482025146484375, _111);
    float _487 = fma(_471, _445, _481);
    float _489 = fma(_419, 6.283185482025146484375, _111);
    float _491 = fma(_455, _445, _483);
    float _493 = _485 * 1.57079637050628662109375;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _499 = _489 * 1.57079637050628662109375;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _505 = in.m_56.x;
    float _507 = in.m_56.y;
    float _509 = fma(_479, _425, _491);
    float _511 = _499 * 0.15915493667125701904296875;
    float _513 = _493 * 0.15915493667125701904296875;
    float _515 = fma(_503, _373, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _517 = fma(_477, _425, _487);
    float _519 = -_319;
    float _521 = _519 + 1.0;
    float _523 = precise::clamp(_521, 0.0, 1.0);
    float _525 = fma(_497, _373, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _527 = _513 * 6.283185482025146484375;
    float _529 = sin(_527);
    float _531 = fma(_515, _415, _509);
    float _533 = in.m_42.x;
    float _535 = in.m_42.y;
    float _537 = in.m_42.z;
    float _539 = fma(_523, -2.0, 3.0);
    float _541 = _523 * _523;
    float _543 = fma(_525, _415, _517);
    float _545 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[147].y, _531);
    float _547 = _511 * 6.283185482025146484375;
    float _549 = sin(_547);
    float _551 = _539 * _541;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[147].x, _543);
    bool _557 = !_343;
    float _559 = _557 ? (-0.5) : 0.5;
    float _561 = _553 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _563 = !_339;
    float _565 = _563 ? (-0.5) : 0.5;
    float _567 = _545 * _507;
    float _569 = _417 * 6.283185482025146484375;
    float _571 = sin(_569);
    float _573 = _555 * _505;
    float _575 = fma(_529, _561, _559);
    float _577 = _249 * _567;
    float _579 = _249 * _573;
    float _581 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _575);
    float _583 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _585 = fma(_549, _561, _565);
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _589 = _535 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _591 = _583 * _581;
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _585);
    float _595 = _535 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _597 = fma(_533, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
    float _599 = _591 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _601 = _571 * _561;
    float _603 = _587 * _593;
    float _605 = _591 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = fma(_533, (*spvDescriptorSet0.vp_c10)._m0[4].x, _595);
    float _609 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _601);
    float _611 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[26].x, _599);
    float _613 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[6].z, _597);
    float _615 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _617 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[4].z, _607);
    float _619 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _611);
    float _621 = _613 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _615);
    float _625 = _617 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _627 = _619 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _629 = _535 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _631 = _623 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _633 = _591 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _635 = _621 + _627;
    float _637 = fma(_533, (*spvDescriptorSet0.vp_c10)._m0[5].x, _629);
    float _639 = _625 + _631;
    float _641 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[25].x, _633);
    float _643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _645 = _635 + _643;
    float _647 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _649 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _651 = _639 + _649;
    float _653 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _641);
    float _655 = _645 * _645;
    float _657 = _647 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _659 = _653 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _661 = fma(_651, _651, _655);
    float _663 = _657 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _665 = _657 + _659;
    float _667 = sqrt(_661);
    float _669 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _663);
    float _671 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[11].z, _669);
    bool _673 = _667 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _675 = _609;
    float _677 = _669;
    float _679 = _637;
    float _681 = _417;
    if (!_673)
    {
        _675 = _639;
    }
    float _683 = _675;
    float _685 = _683;
    if (!_673)
    {
        _677 = _635;
    }
    float _687 = _677;
    float _689 = _687;
    if (!_673)
    {
        _679 = _665;
    }
    float _691 = _679;
    bool _693 = !_673;
    float _695 = _691;
    if (!_693)
    {
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _701 = _667 + _699;
        float _703 = _665 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = rsqrt(_661);
        float _707 = _701 * _697;
        float _709 = _707 * 0.15915493667125701904296875;
        float _711 = _709 * 6.283185482025146484375;
        float _713 = cos(_711);
        float _715 = _709 * 6.283185482025146484375;
        float _717 = sin(_715);
        float _719 = _713 + (-1.0);
        float _721 = _719 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _723 = fma(_717, _703, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _725 = fma(_665, _713, _721);
        float _727 = _705 * _723;
        float _729 = fma(_651, _727, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _731 = fma(_645, _727, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _695 = _725;
        _685 = _729;
        _689 = _731;
    }
    float _733 = _695;
    float _735 = _685;
    float _737 = _689;
    float _739 = -_657;
    float _741 = _739 + _733;
    float _743 = -_625;
    float _745 = _743 + _735;
    float _747 = _671 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _749 = _657 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _751 = _741 * _741;
    float _753 = -_621;
    float _755 = _753 + _737;
    float _757 = 1.0 / _747;
    float _759 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _749);
    float _761 = fma(_745, _745, _751);
    float _763 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[10].z, _759);
    float _765 = fma(_755, _755, _761);
    bool _767 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _769 = isnan(0.5);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _775 = _771 || _773;
    float _777 = _763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _779 = sqrt(_765);
    bool _781 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _789 = _785 || _787;
    float _791 = _777 + _747;
    float _793 = _791 * _757;
    float _795 = _793 * 0.5;
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _799 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _797);
    float _801 = 1.0 / _799;
    bool _803 = _779 > 0.0;
    bool _805 = !_803;
    float _807 = _735;
    float _809 = _733;
    float _811 = _737;
    float _813 = _779;
    float _815 = _741;
    float _817 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_805)
    {
        float _819 = _207 * _207;
        float _821 = fma(_193, _193, _819);
        float _823 = fma(_217, _217, _821);
        float _825 = rsqrt(_765);
        float _827 = sqrt(_823);
        float _829 = _745 * _825;
        float _831 = _741 * _825;
        float _833 = _755 * _825;
        bool _835 = _827 > 0.0;
        bool _837 = !_835;
        _813 = _825;
        _817 = _829;
        if (!_837)
        {
            float _839 = rsqrt(_823);
            float _841 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _843 = _207 * _839;
            float _845 = _193 * _839;
            float _847 = _831 * _843;
            float _849 = _217 * _839;
            float _851 = fma(_829, _845, _847);
            float _853 = _841 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _855 = fma(_833, _849, _851);
            float _857 = _855 * _853;
            float _859 = fma(_193, _857, _735);
            float _861 = fma(_207, _857, _733);
            float _863 = fma(_217, _857, _737);
            _807 = _859;
            _809 = _861;
            _811 = _863;
            _813 = _845;
            _815 = _853;
        }
    }
    float _865 = _807;
    float _867 = _809;
    float _869 = _811;
    float _871 = _813;
    float _873 = _815;
    float _875 = _817;
    float _877 = _873;
    float _879 = _871;
    float _881 = _865;
    float _883 = _875;
    if (_789)
    {
        _877 = 1.0;
    }
    float _885 = _877;
    float _887 = _885;
    if (_775)
    {
        _255 = _865;
    }
    float _889 = _255;
    float _891 = _889;
    if (_775)
    {
        _257 = _867;
    }
    float _893 = _257;
    float _895 = _893;
    if (_775)
    {
        _259 = _869;
    }
    float _897 = _259;
    float _899 = _897;
    if (!_775)
    {
        float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _903 = _657 + _901;
        float _905 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _907 = _625 + _905;
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _911 = -_625;
        float _913 = _911 + _865;
        float _915 = _903 * _903;
        float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _919 = _621 + _917;
        float _921 = -_657;
        float _923 = _921 + _867;
        float _925 = -_621;
        float _927 = _925 + _869;
        float _929 = fma(_907, _907, _915);
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _933 = fma(_919, _919, _929);
        float _935 = sqrt(_933);
        float _937 = _909 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _939 = precise::min(_935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _941 = _939 * _931;
        float _943 = _937 * _941;
        float _945 = fma(_913, _943, _625);
        float _947 = fma(_923, _943, _657);
        float _949 = fma(_927, _943, _621);
        _879 = _943;
        _895 = _947;
        _891 = _945;
        _899 = _949;
        _881 = _913;
    }
    float _951 = _879;
    float _953 = _895;
    float _955 = _891;
    float _957 = _899;
    float _959 = _881;
    float _961 = _951;
    float _963 = _959;
    if (_789)
    {
        _883 = 1.0;
    }
    float _965 = _883;
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _969 = _801 * _967;
    float _971 = _965;
    if (!_789)
    {
        float _973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _975 = _973 * 0.15915493667125701904296875;
        float _977 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _979 = _975 * 6.283185482025146484375;
        float _981 = cos(_979);
        float _983 = _977 * 0.15915493667125701904296875;
        float _985 = _975 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = 1.0 / _981;
        float _991 = _983 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = _987 * _989;
        float _997 = _983 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _993 * _995;
        float _1003 = 1.0 / _1001;
        float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1007 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1005;
        float _1009 = 1.0 / _1007;
        float _1011 = _999 * _1003;
        float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1015 = fma(_969, _1011, _1013);
        float _1017 = _1015 * _1009;
        float _1019 = precise::clamp(_1017, 0.0, 1.0);
        _961 = _983;
        _963 = _1015;
        _887 = _1019;
    }
    float _1021 = _961;
    float _1023 = _963;
    float _1025 = _887;
    float _1027 = _1021;
    float _1029 = _1023;
    if (!_789)
    {
        float _1031 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1033 = _1031 * 0.15915493667125701904296875;
        float _1035 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1037 = _1033 * 6.283185482025146484375;
        float _1039 = cos(_1037);
        float _1041 = _1035 * 0.15915493667125701904296875;
        float _1043 = _1033 * 6.283185482025146484375;
        float _1045 = sin(_1043);
        float _1047 = 1.0 / _1039;
        float _1049 = _1041 * 6.283185482025146484375;
        float _1051 = cos(_1049);
        float _1053 = _1045 * _1047;
        float _1055 = _1041 * 6.283185482025146484375;
        float _1057 = sin(_1055);
        float _1059 = _1051 * _1053;
        float _1061 = 1.0 / _1059;
        float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1065 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1063;
        float _1067 = 1.0 / _1065;
        float _1069 = _1057 * _1061;
        float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1073 = fma(_969, _1069, _1071);
        float _1075 = _1073 * _1067;
        float _1077 = precise::clamp(_1075, 0.0, 1.0);
        float _1079 = -_1077;
        float _1081 = _1079 + 1.0;
        _1027 = _1047;
        _1029 = _1059;
        _971 = _1081;
    }
    float _1083 = _1027;
    float _1085 = _1029;
    float _1087 = _971;
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = _953 + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1095 = _955 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _957 + _1097;
    float _1101 = _1091 * _1091;
    float _1103 = fma(_1095, _1095, _1101);
    float _1105 = fma(_1099, _1099, _1103);
    float _1107 = rsqrt(_1105);
    float _1109 = _1107 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1111 = _1095 * _1109;
    float _1113 = _1099 * _1109;
    float _1115 = _1111 * _1111;
    float _1117 = _1113 * _1113;
    float _1119 = _1115 + _1117;
    float _1121 = sqrt(_1119);
    bool _1123 = _1121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1127 = _1121 + _1125;
    float _1129 = _1099;
    float _1131 = _1085;
    float _1133 = _1127;
    float _1135 = _1083;
    float _1137 = _1091;
    if (_1123)
    {
        float _1139 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1129 = _1139;
    }
    float _1141 = _1129;
    if (_1123)
    {
        float _1143 = rsqrt(_1119);
        _1131 = _1143;
    }
    float _1145 = _1131;
    float _1147 = _1145;
    if (_1123)
    {
        float _1149 = _1127 * _1141;
        _1133 = _1149;
    }
    float _1151 = _1133;
    if (_1123)
    {
        float _1153 = _1151 * 0.15915493667125701904296875;
        _1135 = _1153;
    }
    float _1155 = _1135;
    float _1157 = _1101;
    if (_1123)
    {
        float _1159 = _1155 * 6.283185482025146484375;
        float _1161 = sin(_1159);
        _1157 = _1161;
    }
    float _1163 = _1157;
    float _1165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1167 = precise::max(0.0, _1165);
    float _1169 = _1107;
    float _1171 = _1167;
    float _1173 = _1165;
    if (_1123)
    {
        float _1175 = _1155 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        _1169 = _1177;
    }
    float _1179 = _1169;
    float _1181 = -_1109;
    float _1183 = -_1167;
    float _1185 = fma(_1091, _1181, _1183);
    if (!_1123)
    {
        _1171 = _1111;
    }
    float _1187 = _1171;
    float _1189 = _1187;
    if (_1123)
    {
        float _1191 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1173 = _1191;
    }
    float _1193 = _1173;
    float _1195 = sqrt(_1105);
    float _1197 = _1163;
    float _1199 = _1193;
    if (_1123)
    {
        float _1201 = fma(_1163, _1193, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1137 = _1201;
    }
    float _1203 = _1137;
    float _1205 = _1203;
    if (!_1123)
    {
        _1197 = _1115;
    }
    float _1207 = _1197;
    float _1209 = _1207;
    float _1211 = _1179;
    if (_1123)
    {
        float _1213 = _1179 + (-1.0);
        _1199 = _1213;
    }
    float _1215 = _1199;
    float _1217 = _1215;
    if (_1123)
    {
        float _1219 = _1145 * _1203;
        _681 = _1219;
    }
    float _1221 = _681;
    if (!_1123)
    {
        _1205 = _1185;
    }
    float _1223 = _1205;
    float _1225 = _1223;
    if (_1123)
    {
        float _1227 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1147 = _1227;
    }
    float _1229 = _1147;
    if (_1123)
    {
        float _1231 = _1111 * _1221;
        _1189 = _1231;
    }
    float _1233 = _1189;
    if (!_1123)
    {
        _1217 = _1113;
    }
    float _1235 = _1217;
    float _1237 = _1235;
    if (_1123)
    {
        float _1239 = _1113 * _1221;
        _1237 = _1239;
    }
    float _1241 = _1237;
    if (_1123)
    {
        float _1243 = fma(_1185, _1179, _1229);
        _1225 = _1243;
    }
    float _1245 = _1225;
    if (_1123)
    {
        float _1247 = _1233 * _1233;
        _1209 = _1247;
    }
    float _1249 = _1209;
    if (!_1123)
    {
        _1211 = _1117;
    }
    float _1251 = _1211;
    float _1253 = _1251;
    if (_1123)
    {
        float _1255 = _1241 * _1241;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(_1245, _1245, _1249);
    float _1261 = _1259 + _1257;
    float _1263 = _953 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1267 = fma(_1195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1265);
    float _1269 = precise::clamp(_1267, 0.0, 1.0);
    float _1271 = _953 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1273 = rsqrt(_1261);
    float _1275 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1263);
    float _1277 = -_1269;
    float _1279 = _1277 + 1.0;
    float _1281 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1283 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1285 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1275);
    float _1287 = _953 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1289 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1281);
    float _1291 = abs(_1279);
    float _1293 = log2(_1291);
    float _1295 = _953 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1297 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1287);
    float _1299 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1301 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1303 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1295);
    float _1305 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1297);
    float _1307 = _1273 * _1233;
    float _1309 = _1273 * _1245;
    float _1311 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1315 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1317 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1303);
    float _1319 = _1273 * _1241;
    float _1321 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1313);
    float _1323 = -_1315;
    float _1325 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1323);
    float _1327 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1329 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1331 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1333 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = -_1319;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1325);
    float _1339 = -_1327;
    float _1341 = fma(_1339, _1283, 1.0);
    float _1343 = exp2(_1329);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    float _1347 = fma(_1337, -0.5, 0.5);
    float _1349 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1351 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1353 = fma(_1337, 0.5, 0.5);
    float _1355 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1349);
    float _1357 = log2(_1341);
    float _1359 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1351);
    float _1361 = _1309 + 1.0;
    float _1363 = fma(_1353, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1365 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1355);
    float _1367 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1359);
    float _1369 = 1.0 / _1345;
    float _1371 = -_1309;
    float _1373 = fma(_1343, _1361, _1371);
    float _1375 = fma(_1353, _1363, -0.212114393711090087890625);
    float _1377 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1365);
    float _1379 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1367);
    float _1381 = fma(_1353, _1375, 1.570728778839111328125);
    float _1383 = sqrt(_1347);
    float _1385 = _1357 * 0.693147182464599609375;
    float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1389 = _1377 * _1369;
    float _1391 = _1379 * _1369;
    float _1393 = fma(_1373, 0.5, 0.5);
    float _1395 = fma(_1389, 0.5, 0.5);
    float _1397 = fma(_1391, -0.5, 0.5);
    float _1399 = _1383 * 0.636619746685028076171875;
    float3 _3728 = float3(_1395, _1397, _1387);
    float _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3728, float3(0.0), isnan(_3728)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3728, float3(0.0), isnan(_3728)), level(0.0)).x;
    float _1403 = -_1381;
    float _1405 = fma(_1399, _1403, 1.0);
    float3 _3744 = float3(_1395, _1397, _1387);
    float4 _1408 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3744, float3(0.0), isnan(_3744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3744, float3(0.0), isnan(_3744)), level(0.0)).xyzw;
    float _1410 = _1408.x;
    float _1412 = _1408.y;
    float _1414 = _1408.z;
    float _1416 = _1408.w;
    float2 _3761 = float2(_1405, _1393);
    float3 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3761, float2(0.0), isnan(_3761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3761, float2(0.0), isnan(_3761)), level(0.0)).xyz;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1430 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1432 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1434 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1436 = _1428 * _135;
    bool _1438 = _135 > 0.5;
    float _1440 = _1432 * _135;
    float _1442 = exp2(_1430);
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1446 = _1444 != 0;
    float _1448 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1434);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1452 = _1450 != 0;
    float _1454 = trunc(_1436);
    int _1456 = int(_1454);
    float _1458 = trunc(_1440);
    int _1460 = int(_1458);
    float _1462 = -_1442;
    float _1464 = _1462 + 1.0;
    int _1466 = _1456 << 4;
    int _1468 = _1466 + 1968;
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1473 = uint(int(uint(_1468) >> uint(2)));
    uint _1475 = uint(int(uint(int(_1473)) >> uint(2)));
    int _1477 = int(_1473) & 3;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[int(_1475)][_1477];
    int _1481 = int(_1473) + 1;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    int _1485 = _1481 & 3;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[int(_1483)][_1485];
    int _1489 = _1460 << 4;
    int _1491 = _1489 + 1712;
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1495 = -_565;
    int _1497 = _1438 ? as_type<int>(_1495) : as_type<int>(_565);
    uint _1499 = uint(int(uint(_1491) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[int(_1509)][_1511];
    bool _1515 = _419 > 0.5;
    bool _1517 = !_1446;
    float _1519 = _1517 ? _565 : as_type<float>(_1497);
    bool _1521 = _1025 > 0.0;
    bool _1523 = isnan(_1025);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan(0.0);
    bool _1529 = _1525 || _1527;
    int _1531 = _1491 + 8;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    uint _1535 = uint(int(uint(int(_1533)) >> uint(2)));
    int _1537 = int(_1533) & 3;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[int(_1535)][_1537];
    float _1541 = _1519 + 0.5;
    bool _1543 = _1087 <= 0.0;
    bool _1545 = !_1529;
    bool _1547 = _1543 || _1545;
    float _1549 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1551 = _1468 + 8;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    uint _1555 = uint(int(uint(int(_1553)) >> uint(2)));
    int _1557 = int(_1553) & 3;
    float _1559 = (*spvDescriptorSet0.vp_c9)._m0[int(_1555)][_1557];
    float _1561 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1448);
    float _1563 = _1549 * _1470;
    float _1565 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1561);
    float _1567 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1569 = _1487 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1573 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1025 * _1087;
    float _1579 = _1505 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1581 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1583 = -_559;
    int _1585 = _1515 ? as_type<int>(_1583) : as_type<int>(_559);
    float _1587 = _1577 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1589 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1591 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1593 = !_1452;
    float _1595 = _1593 ? _559 : as_type<float>(_1585);
    float _1597 = _1539 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1599 = -_1595;
    float _1601 = _1599 + 0.5;
    float _1603 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1607 = _1559 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_58.x = _1589;
    out.m_58.y = _1591;
    out.m_58.z = _1603;
    out.m_58.w = _1571;
    float _1609 = _1605 * _1493;
    float _1611 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1563;
    out.m_60.y = _1609;
    out.m_62.x = _1573;
    out.m_62.y = _1575;
    out.m_62.z = _1611;
    float _1613 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1615 = _1565 + _1345;
    float _1617 = -_1613;
    float _1619 = _1617 + 1.0;
    float _1621 = _1615 * 0.5;
    float _1623 = _1587 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _1621;
    out.m_64.w = _1345;
    out.m_45.x = _1623;
    out.gl_Position.x = _1377;
    out.gl_Position.y = _1379;
    out.gl_Position.z = _1565;
    out.gl_Position.w = _1345;
    float _1625 = _1613 * _1401;
    float _1627 = _1416 * _1625;
    float _1629 = _1416 * _1619;
    float _1631 = _1426 * _1625;
    float _1633 = fma(_1422, _1627, _1410);
    float _1635 = fma(_1424, _1627, _1412);
    float _1637 = fma(_1416, _1631, _1414);
    out.m_66.x = _1633;
    out.m_66.y = _1635;
    out.m_66.z = _1637;
    out.m_66.w = _1629;
    if (!_1547)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1639 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1639;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _277 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    float _93 = as_type<float>(_85);
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _91;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _95 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1697 = as_type<float>(_101);
        out.gl_Position.z = _1697;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    float _107 = float(_85);
    float _109 = -_105;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_105);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    bool _123 = _111 >= _107;
    bool _125 = !_121;
    bool _127 = _123 || _125;
    if (_127)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _93;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _131 = _129 * 5.0;
        _103 = as_type<int>(_131);
    }
    int _133 = _103;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1760 = as_type<float>(_133);
        out.gl_Position.z = _1760;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_49.x;
    float _137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _139 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _141 = in.m_51.x;
    float _143 = in.m_51.y;
    float _145 = in.m_51.z;
    float _147 = _139 * _137;
    float _149 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[20].x, _147);
    float _151 = _149 * 6.283185482025146484375;
    float _153 = floor(_149);
    int _155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _157 = _155 != 0;
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _161 = _159 != 0;
    float _163 = _143 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _165 = _151 * 0.15915493667125701904296875;
    float _167 = _143 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _169 = _143 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _171 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[4].x, _163);
    int _173 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _175 = _173 != 0;
    float _177 = _165 * 6.283185482025146484375;
    float _179 = cos(_177);
    bool _181 = !_157;
    int _183 = _181 ? 0 : 1;
    float _185 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[5].x, _167);
    float _187 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[6].x, _169);
    bool _189 = !_175;
    int _191 = _189 ? 0 : 1;
    float _193 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].z, _171);
    int _195 = abs(_183);
    float _197 = -_153;
    float _199 = _149 + _197;
    bool _201 = !_161;
    int _203 = _201 ? 0 : 1;
    float _205 = 1.0 / _107;
    float _207 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    int _209 = abs(_203);
    float _211 = -_199;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _217 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].z, _187);
    float _219 = fma(_179, 0.5, 0.5);
    bool _221 = _199 < 0.5;
    float _223 = float(_221);
    int _225 = abs(_191);
    float _227 = -_219;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_195);
    float _233 = abs(_213);
    float _235 = _231 * _233;
    float _237 = float(_225);
    float _239 = -_223;
    float _241 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _243 = float(_209);
    float _245 = fma(_237, _229, _235);
    float _247 = abs(_241);
    float _249 = fma(_243, _247, _245);
    float _251 = _111 * _205;
    bool _253 = !_215;
    float _255 = _207;
    float _257 = _217;
    float _259 = _193;
    float _275;
    if (!_253)
    {
        float _261 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _263 = _135 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _267 = _265 * _261;
        float _269 = floor(_267);
        float _271 = -_269;
        float _273 = _267 + _271;
        _275 = _273;
        _277 = true;
    }
    else
    {
        _275 = _251;
    }
    _277 = false;
    float _279 = _275;
    float _281 = as_type<float>(int(gl_VertexIndex));
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = _279 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _303 = 1.0 / _289;
    float _305 = in.m_49.z;
    bool _307 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_279);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _251 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _321 = in.m_49.w;
    float _323 = 1.0 / _293;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _327 = _279 + _325;
    float _329 = 1.0 / _301;
    float _331 = _285 * _303;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = _279 + _333;
    int _337 = as_type<int>(_281) & 1;
    bool _339 = _337 != 0;
    int _341 = as_type<int>(_281) & 2;
    bool _343 = _341 != 0;
    float _345 = 1.0 / _297;
    float _347 = _327 * _323;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _349;
    bool _353 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _355 = isnan(_279);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = fma(_321, 6.283185482025146484375, _111);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _369 = _279 + _367;
    float _371 = _365 * 1.57079637050628662109375;
    float _373 = _369 * _329;
    float _375 = fma(_351, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _377 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _379 = isnan(_279);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = _335 * _345;
    float _391 = -_363;
    float _393 = _391 + 1.0;
    bool _395 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _397 = isnan(_279);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _407;
    float _411 = -_387;
    float _413 = _411 + 1.0;
    float _415 = _387 * _393;
    float _417 = _371 * 0.15915493667125701904296875;
    float _419 = in.m_49.y;
    float _421 = -_405;
    float _423 = _421 + 1.0;
    float _425 = _405 * _413;
    float _427 = fma(_409, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _433 = _279 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _435 = isnan(_279);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _317 * _423;
    float _447 = -_317;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = fma(_431, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _457 = -_443;
    float _459 = _457 + 1.0;
    float _461 = _443 * _449;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _467;
    float _471 = fma(_453, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _473 = _375 * _461;
    float _475 = _427 * _461;
    float _477 = fma(_465, _389, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_469, _389, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _481 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].x, _473);
    float _483 = fma(_459, (*spvDescriptorSet0.vp_c9)._m0[143].y, _475);
    float _485 = fma(_305, 6.283185482025146484375, _111);
    float _487 = fma(_471, _445, _481);
    float _489 = fma(_419, 6.283185482025146484375, _111);
    float _491 = fma(_455, _445, _483);
    float _493 = _485 * 1.57079637050628662109375;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _497 = _495 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _499 = _489 * 1.57079637050628662109375;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _505 = in.m_56.x;
    float _507 = in.m_56.y;
    float _509 = fma(_479, _425, _491);
    float _511 = _499 * 0.15915493667125701904296875;
    float _513 = _493 * 0.15915493667125701904296875;
    float _515 = fma(_503, _373, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _517 = fma(_477, _425, _487);
    float _519 = -_319;
    float _521 = _519 + 1.0;
    float _523 = precise::clamp(_521, 0.0, 1.0);
    float _525 = fma(_497, _373, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _527 = _513 * 6.283185482025146484375;
    float _529 = sin(_527);
    float _531 = fma(_515, _415, _509);
    float _533 = in.m_42.x;
    float _535 = in.m_42.y;
    float _537 = in.m_42.z;
    float _539 = fma(_523, -2.0, 3.0);
    float _541 = _523 * _523;
    float _543 = fma(_525, _415, _517);
    float _545 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[147].y, _531);
    float _547 = _511 * 6.283185482025146484375;
    float _549 = sin(_547);
    float _551 = _539 * _541;
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[147].x, _543);
    bool _557 = !_343;
    float _559 = _557 ? (-0.5) : 0.5;
    float _561 = _553 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _563 = !_339;
    float _565 = _563 ? (-0.5) : 0.5;
    float _567 = _545 * _507;
    float _569 = _417 * 6.283185482025146484375;
    float _571 = sin(_569);
    float _573 = _555 * _505;
    float _575 = fma(_529, _561, _559);
    float _577 = _249 * _567;
    float _579 = _249 * _573;
    float _581 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _575);
    float _583 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _585 = fma(_549, _561, _565);
    float _587 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _589 = _535 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _591 = _583 * _581;
    float _593 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _585);
    float _595 = _535 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _597 = fma(_533, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
    float _599 = _591 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _601 = _571 * _561;
    float _603 = _587 * _593;
    float _605 = _591 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = fma(_533, (*spvDescriptorSet0.vp_c10)._m0[4].x, _595);
    float _609 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _601);
    float _611 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[26].x, _599);
    float _613 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[6].z, _597);
    float _615 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _617 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[4].z, _607);
    float _619 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _611);
    float _621 = _613 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _615);
    float _625 = _617 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _627 = _619 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _629 = _535 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _631 = _623 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _633 = _591 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _635 = _621 + _627;
    float _637 = fma(_533, (*spvDescriptorSet0.vp_c10)._m0[5].x, _629);
    float _639 = _625 + _631;
    float _641 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[25].x, _633);
    float _643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _645 = _635 + _643;
    float _647 = fma(_537, (*spvDescriptorSet0.vp_c10)._m0[5].z, _637);
    float _649 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _651 = _639 + _649;
    float _653 = fma(_609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _641);
    float _655 = _645 * _645;
    float _657 = _647 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _659 = _653 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _661 = fma(_651, _651, _655);
    float _663 = _657 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _665 = _657 + _659;
    float _667 = sqrt(_661);
    float _669 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _663);
    float _671 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[11].z, _669);
    bool _673 = _667 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _675 = _609;
    float _677 = _669;
    float _679 = _637;
    float _681 = _417;
    if (!_673)
    {
        _675 = _639;
    }
    float _683 = _675;
    float _685 = _683;
    if (!_673)
    {
        _677 = _635;
    }
    float _687 = _677;
    float _689 = _687;
    if (!_673)
    {
        _679 = _665;
    }
    float _691 = _679;
    bool _693 = !_673;
    float _695 = _691;
    if (!_693)
    {
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _699 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _701 = _667 + _699;
        float _703 = _665 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _705 = rsqrt(_661);
        float _707 = _701 * _697;
        float _709 = _707 * 0.15915493667125701904296875;
        float _711 = _709 * 6.283185482025146484375;
        float _713 = cos(_711);
        float _715 = _709 * 6.283185482025146484375;
        float _717 = sin(_715);
        float _719 = _713 + (-1.0);
        float _721 = _719 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _723 = fma(_717, _703, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _725 = fma(_665, _713, _721);
        float _727 = _705 * _723;
        float _729 = fma(_651, _727, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _731 = fma(_645, _727, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _695 = _725;
        _685 = _729;
        _689 = _731;
    }
    float _733 = _695;
    float _735 = _685;
    float _737 = _689;
    float _739 = -_657;
    float _741 = _739 + _733;
    float _743 = -_625;
    float _745 = _743 + _735;
    float _747 = _671 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _749 = _657 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _751 = _741 * _741;
    float _753 = -_621;
    float _755 = _753 + _737;
    float _757 = 1.0 / _747;
    float _759 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _749);
    float _761 = fma(_745, _745, _751);
    float _763 = fma(_621, (*spvDescriptorSet0.vp_c8)._m0[10].z, _759);
    float _765 = fma(_755, _755, _761);
    bool _767 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _769 = isnan(0.5);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _775 = _771 || _773;
    float _777 = _763 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _779 = sqrt(_765);
    bool _781 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _783 = isnan(0.5);
    bool _785 = _781 || _783;
    bool _787 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _789 = _785 || _787;
    float _791 = _777 + _747;
    float _793 = _791 * _757;
    float _795 = _793 * 0.5;
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _799 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _797);
    float _801 = 1.0 / _799;
    bool _803 = _779 > 0.0;
    bool _805 = !_803;
    float _807 = _735;
    float _809 = _733;
    float _811 = _737;
    float _813 = _779;
    float _815 = _741;
    float _817 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_805)
    {
        float _819 = _207 * _207;
        float _821 = fma(_193, _193, _819);
        float _823 = fma(_217, _217, _821);
        float _825 = rsqrt(_765);
        float _827 = sqrt(_823);
        float _829 = _745 * _825;
        float _831 = _741 * _825;
        float _833 = _755 * _825;
        bool _835 = _827 > 0.0;
        bool _837 = !_835;
        _813 = _825;
        _817 = _829;
        if (!_837)
        {
            float _839 = rsqrt(_823);
            float _841 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _843 = _207 * _839;
            float _845 = _193 * _839;
            float _847 = _831 * _843;
            float _849 = _217 * _839;
            float _851 = fma(_829, _845, _847);
            float _853 = _841 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _855 = fma(_833, _849, _851);
            float _857 = _855 * _853;
            float _859 = fma(_193, _857, _735);
            float _861 = fma(_207, _857, _733);
            float _863 = fma(_217, _857, _737);
            _807 = _859;
            _809 = _861;
            _811 = _863;
            _813 = _845;
            _815 = _853;
        }
    }
    float _865 = _807;
    float _867 = _809;
    float _869 = _811;
    float _871 = _813;
    float _873 = _815;
    float _875 = _817;
    float _877 = _873;
    float _879 = _871;
    float _881 = _865;
    float _883 = _875;
    if (_789)
    {
        _877 = 1.0;
    }
    float _885 = _877;
    float _887 = _885;
    if (_775)
    {
        _255 = _865;
    }
    float _889 = _255;
    float _891 = _889;
    if (_775)
    {
        _257 = _867;
    }
    float _893 = _257;
    float _895 = _893;
    if (_775)
    {
        _259 = _869;
    }
    float _897 = _259;
    float _899 = _897;
    if (!_775)
    {
        float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _903 = _657 + _901;
        float _905 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _907 = _625 + _905;
        float _909 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _911 = -_625;
        float _913 = _911 + _865;
        float _915 = _903 * _903;
        float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _919 = _621 + _917;
        float _921 = -_657;
        float _923 = _921 + _867;
        float _925 = -_621;
        float _927 = _925 + _869;
        float _929 = fma(_907, _907, _915);
        float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _933 = fma(_919, _919, _929);
        float _935 = sqrt(_933);
        float _937 = _909 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _939 = precise::min(_935, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _941 = _939 * _931;
        float _943 = _937 * _941;
        float _945 = fma(_913, _943, _625);
        float _947 = fma(_923, _943, _657);
        float _949 = fma(_927, _943, _621);
        _879 = _943;
        _895 = _947;
        _891 = _945;
        _899 = _949;
        _881 = _913;
    }
    float _951 = _879;
    float _953 = _895;
    float _955 = _891;
    float _957 = _899;
    float _959 = _881;
    float _961 = _951;
    float _963 = _959;
    if (_789)
    {
        _883 = 1.0;
    }
    float _965 = _883;
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _969 = _801 * _967;
    float _971 = _965;
    if (!_789)
    {
        float _973 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _975 = _973 * 0.15915493667125701904296875;
        float _977 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _979 = _975 * 6.283185482025146484375;
        float _981 = cos(_979);
        float _983 = _977 * 0.15915493667125701904296875;
        float _985 = _975 * 6.283185482025146484375;
        float _987 = sin(_985);
        float _989 = 1.0 / _981;
        float _991 = _983 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = _987 * _989;
        float _997 = _983 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _993 * _995;
        float _1003 = 1.0 / _1001;
        float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1007 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1005;
        float _1009 = 1.0 / _1007;
        float _1011 = _999 * _1003;
        float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1015 = fma(_969, _1011, _1013);
        float _1017 = _1015 * _1009;
        float _1019 = precise::clamp(_1017, 0.0, 1.0);
        _961 = _983;
        _963 = _1015;
        _887 = _1019;
    }
    float _1021 = _961;
    float _1023 = _963;
    float _1025 = _887;
    float _1027 = _1021;
    float _1029 = _1023;
    if (!_789)
    {
        float _1031 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1033 = _1031 * 0.15915493667125701904296875;
        float _1035 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1037 = _1033 * 6.283185482025146484375;
        float _1039 = cos(_1037);
        float _1041 = _1035 * 0.15915493667125701904296875;
        float _1043 = _1033 * 6.283185482025146484375;
        float _1045 = sin(_1043);
        float _1047 = 1.0 / _1039;
        float _1049 = _1041 * 6.283185482025146484375;
        float _1051 = cos(_1049);
        float _1053 = _1045 * _1047;
        float _1055 = _1041 * 6.283185482025146484375;
        float _1057 = sin(_1055);
        float _1059 = _1051 * _1053;
        float _1061 = 1.0 / _1059;
        float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1065 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1063;
        float _1067 = 1.0 / _1065;
        float _1069 = _1057 * _1061;
        float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1073 = fma(_969, _1069, _1071);
        float _1075 = _1073 * _1067;
        float _1077 = precise::clamp(_1075, 0.0, 1.0);
        float _1079 = -_1077;
        float _1081 = _1079 + 1.0;
        _1027 = _1047;
        _1029 = _1059;
        _971 = _1081;
    }
    float _1083 = _1027;
    float _1085 = _1029;
    float _1087 = _971;
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = _953 + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1095 = _955 + _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1099 = _957 + _1097;
    float _1101 = _1091 * _1091;
    float _1103 = fma(_1095, _1095, _1101);
    float _1105 = fma(_1099, _1099, _1103);
    float _1107 = rsqrt(_1105);
    float _1109 = _1107 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1111 = _1095 * _1109;
    float _1113 = _1099 * _1109;
    float _1115 = _1111 * _1111;
    float _1117 = _1113 * _1113;
    float _1119 = _1115 + _1117;
    float _1121 = sqrt(_1119);
    bool _1123 = _1121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1127 = _1121 + _1125;
    float _1129 = _1099;
    float _1131 = _1085;
    float _1133 = _1127;
    float _1135 = _1083;
    float _1137 = _1091;
    if (_1123)
    {
        float _1139 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1129 = _1139;
    }
    float _1141 = _1129;
    if (_1123)
    {
        float _1143 = rsqrt(_1119);
        _1131 = _1143;
    }
    float _1145 = _1131;
    float _1147 = _1145;
    if (_1123)
    {
        float _1149 = _1127 * _1141;
        _1133 = _1149;
    }
    float _1151 = _1133;
    if (_1123)
    {
        float _1153 = _1151 * 0.15915493667125701904296875;
        _1135 = _1153;
    }
    float _1155 = _1135;
    float _1157 = _1101;
    if (_1123)
    {
        float _1159 = _1155 * 6.283185482025146484375;
        float _1161 = sin(_1159);
        _1157 = _1161;
    }
    float _1163 = _1157;
    float _1165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1167 = precise::max(0.0, _1165);
    float _1169 = _1107;
    float _1171 = _1167;
    float _1173 = _1165;
    if (_1123)
    {
        float _1175 = _1155 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        _1169 = _1177;
    }
    float _1179 = _1169;
    float _1181 = -_1109;
    float _1183 = -_1167;
    float _1185 = fma(_1091, _1181, _1183);
    if (!_1123)
    {
        _1171 = _1111;
    }
    float _1187 = _1171;
    float _1189 = _1187;
    if (_1123)
    {
        float _1191 = _1185 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1173 = _1191;
    }
    float _1193 = _1173;
    float _1195 = sqrt(_1105);
    float _1197 = _1163;
    float _1199 = _1193;
    if (_1123)
    {
        float _1201 = fma(_1163, _1193, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1137 = _1201;
    }
    float _1203 = _1137;
    float _1205 = _1203;
    if (!_1123)
    {
        _1197 = _1115;
    }
    float _1207 = _1197;
    float _1209 = _1207;
    float _1211 = _1179;
    if (_1123)
    {
        float _1213 = _1179 + (-1.0);
        _1199 = _1213;
    }
    float _1215 = _1199;
    float _1217 = _1215;
    if (_1123)
    {
        float _1219 = _1145 * _1203;
        _681 = _1219;
    }
    float _1221 = _681;
    if (!_1123)
    {
        _1205 = _1185;
    }
    float _1223 = _1205;
    float _1225 = _1223;
    if (_1123)
    {
        float _1227 = _1215 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1147 = _1227;
    }
    float _1229 = _1147;
    if (_1123)
    {
        float _1231 = _1111 * _1221;
        _1189 = _1231;
    }
    float _1233 = _1189;
    if (!_1123)
    {
        _1217 = _1113;
    }
    float _1235 = _1217;
    float _1237 = _1235;
    if (_1123)
    {
        float _1239 = _1113 * _1221;
        _1237 = _1239;
    }
    float _1241 = _1237;
    if (_1123)
    {
        float _1243 = fma(_1185, _1179, _1229);
        _1225 = _1243;
    }
    float _1245 = _1225;
    if (_1123)
    {
        float _1247 = _1233 * _1233;
        _1209 = _1247;
    }
    float _1249 = _1209;
    if (!_1123)
    {
        _1211 = _1117;
    }
    float _1251 = _1211;
    float _1253 = _1251;
    if (_1123)
    {
        float _1255 = _1241 * _1241;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(_1245, _1245, _1249);
    float _1261 = _1259 + _1257;
    float _1263 = _953 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1267 = fma(_1195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1265);
    float _1269 = precise::clamp(_1267, 0.0, 1.0);
    float _1271 = _953 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1273 = rsqrt(_1261);
    float _1275 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1263);
    float _1277 = -_1269;
    float _1279 = _1277 + 1.0;
    float _1281 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1271);
    float _1283 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1285 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1275);
    float _1287 = _953 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1289 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1281);
    float _1291 = abs(_1279);
    float _1293 = log2(_1291);
    float _1295 = _953 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1297 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1287);
    float _1299 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1301 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1303 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1295);
    float _1305 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1297);
    float _1307 = _1273 * _1233;
    float _1309 = _1273 * _1245;
    float _1311 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1313 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1315 = _1307 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1317 = fma(_957, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1303);
    float _1319 = _1273 * _1241;
    float _1321 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1313);
    float _1323 = -_1315;
    float _1325 = fma(_1309, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1323);
    float _1327 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1329 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1331 = _1317 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1333 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1321);
    float _1335 = -_1319;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1325);
    float _1339 = -_1327;
    float _1341 = fma(_1339, _1283, 1.0);
    float _1343 = exp2(_1329);
    float _1345 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1333);
    float _1347 = fma(_1337, -0.5, 0.5);
    float _1349 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1351 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1353 = fma(_1337, 0.5, 0.5);
    float _1355 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1349);
    float _1357 = log2(_1341);
    float _1359 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1351);
    float _1361 = _1309 + 1.0;
    float _1363 = fma(_1353, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1365 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1355);
    float _1367 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1359);
    float _1369 = 1.0 / _1345;
    float _1371 = -_1309;
    float _1373 = fma(_1343, _1361, _1371);
    float _1375 = fma(_1353, _1363, -0.212114393711090087890625);
    float _1377 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1365);
    float _1379 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1367);
    float _1381 = fma(_1353, _1375, 1.570728778839111328125);
    float _1383 = sqrt(_1347);
    float _1385 = _1357 * 0.693147182464599609375;
    float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1389 = _1377 * _1369;
    float _1391 = _1379 * _1369;
    float _1393 = fma(_1373, 0.5, 0.5);
    float _1395 = fma(_1389, 0.5, 0.5);
    float _1397 = fma(_1391, -0.5, 0.5);
    float _1399 = _1383 * 0.636619746685028076171875;
    float3 _3728 = float3(_1395, _1397, _1387);
    float _1401 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3728, float3(0.0), isnan(_3728)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3728, float3(0.0), isnan(_3728)), level(0.0)).x;
    float _1403 = -_1381;
    float _1405 = fma(_1399, _1403, 1.0);
    float3 _3744 = float3(_1395, _1397, _1387);
    float4 _1408 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3744, float3(0.0), isnan(_3744)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3744, float3(0.0), isnan(_3744)), level(0.0)).xyzw;
    float _1410 = _1408.x;
    float _1412 = _1408.y;
    float _1414 = _1408.z;
    float _1416 = _1408.w;
    float2 _3761 = float2(_1405, _1393);
    float3 _1420 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3761, float2(0.0), isnan(_3761)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3761, float2(0.0), isnan(_3761)), level(0.0)).xyz;
    float _1422 = _1420.x;
    float _1424 = _1420.y;
    float _1426 = _1420.z;
    float _1428 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1430 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1432 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1434 = _1299 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1436 = _1428 * _135;
    bool _1438 = _135 > 0.5;
    float _1440 = _1432 * _135;
    float _1442 = exp2(_1430);
    int _1444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1446 = _1444 != 0;
    float _1448 = fma(_1311, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1434);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1452 = _1450 != 0;
    float _1454 = trunc(_1436);
    int _1456 = int(_1454);
    float _1458 = trunc(_1440);
    int _1460 = int(_1458);
    float _1462 = -_1442;
    float _1464 = _1462 + 1.0;
    int _1466 = _1456 << 4;
    int _1468 = _1466 + 1968;
    float _1470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _1473 = uint(int(uint(_1468) >> uint(2)));
    uint _1475 = uint(int(uint(int(_1473)) >> uint(2)));
    int _1477 = int(_1473) & 3;
    float _1479 = (*spvDescriptorSet0.vp_c9)._m0[int(_1475)][_1477];
    int _1481 = int(_1473) + 1;
    uint _1483 = uint(int(uint(_1481) >> uint(2)));
    int _1485 = _1481 & 3;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[int(_1483)][_1485];
    int _1489 = _1460 << 4;
    int _1491 = _1489 + 1712;
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1495 = -_565;
    int _1497 = _1438 ? as_type<int>(_1495) : as_type<int>(_565);
    uint _1499 = uint(int(uint(_1491) >> uint(2)));
    uint _1501 = uint(int(uint(int(_1499)) >> uint(2)));
    int _1503 = int(_1499) & 3;
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[int(_1501)][_1503];
    int _1507 = int(_1499) + 1;
    uint _1509 = uint(int(uint(_1507) >> uint(2)));
    int _1511 = _1507 & 3;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[int(_1509)][_1511];
    bool _1515 = _419 > 0.5;
    bool _1517 = !_1446;
    float _1519 = _1517 ? _565 : as_type<float>(_1497);
    bool _1521 = _1025 > 0.0;
    bool _1523 = isnan(_1025);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan(0.0);
    bool _1529 = _1525 || _1527;
    int _1531 = _1491 + 8;
    uint _1533 = uint(int(uint(_1531) >> uint(2)));
    uint _1535 = uint(int(uint(int(_1533)) >> uint(2)));
    int _1537 = int(_1533) & 3;
    float _1539 = (*spvDescriptorSet0.vp_c9)._m0[int(_1535)][_1537];
    float _1541 = _1519 + 0.5;
    bool _1543 = _1087 <= 0.0;
    bool _1545 = !_1529;
    bool _1547 = _1543 || _1545;
    float _1549 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1551 = _1468 + 8;
    uint _1553 = uint(int(uint(_1551) >> uint(2)));
    uint _1555 = uint(int(uint(int(_1553)) >> uint(2)));
    int _1557 = int(_1553) & 3;
    float _1559 = (*spvDescriptorSet0.vp_c9)._m0[int(_1555)][_1557];
    float _1561 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1448);
    float _1563 = _1549 * _1470;
    float _1565 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1561);
    float _1567 = _1479 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1569 = _1487 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1573 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1577 = _1025 * _1087;
    float _1579 = _1505 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1581 = _1513 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1583 = -_559;
    int _1585 = _1515 ? as_type<int>(_1583) : as_type<int>(_559);
    float _1587 = _1577 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1589 = _1579 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1591 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1593 = !_1452;
    float _1595 = _1593 ? _559 : as_type<float>(_1585);
    float _1597 = _1539 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1599 = -_1595;
    float _1601 = _1599 + 0.5;
    float _1603 = _1597 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1607 = _1559 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_58.x = _1589;
    out.m_58.y = _1591;
    out.m_58.z = _1603;
    out.m_58.w = _1571;
    float _1609 = _1605 * _1493;
    float _1611 = _1607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1563;
    out.m_60.y = _1609;
    out.m_62.x = _1573;
    out.m_62.y = _1575;
    out.m_62.z = _1611;
    float _1613 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1615 = _1565 + _1345;
    float _1617 = -_1613;
    float _1619 = _1617 + 1.0;
    float _1621 = _1615 * 0.5;
    float _1623 = _1587 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.z = _1621;
    out.m_64.w = _1345;
    out.m_45.x = _1623;
    out.gl_Position.x = _1377;
    out.gl_Position.y = _1379;
    out.gl_Position.z = _1565;
    out.gl_Position.w = _1345;
    float _1625 = _1613 * _1401;
    float _1627 = _1416 * _1625;
    float _1629 = _1416 * _1619;
    float _1631 = _1426 * _1625;
    float _1633 = fma(_1422, _1627, _1410);
    float _1635 = fma(_1424, _1627, _1412);
    float _1637 = fma(_1416, _1631, _1414);
    out.m_66.x = _1633;
    out.m_66.y = _1635;
    out.m_66.z = _1637;
    out.m_66.w = _1629;
    if (!_1547)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1639 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1639;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

