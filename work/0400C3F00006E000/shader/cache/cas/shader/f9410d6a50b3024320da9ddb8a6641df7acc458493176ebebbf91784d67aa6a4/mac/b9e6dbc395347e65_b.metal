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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_78 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_90 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_49 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_72 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2755 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = in.m_46.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = _106;
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3071 = as_type<float>(_133);
        out.gl_Position.z = _3071;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3126 = as_type<float>(_159);
        out.gl_Position.z = _3126;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _187 = _167;
    float _205;
    if (!_185)
    {
        float _189 = in.m_56.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _167;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = in.m_58.x;
    float _217 = in.m_58.y;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -_229;
    float _249 = _247 + 1.0;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = 1.0 / _233;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = _245 * _249;
    float _261 = -_245;
    float _263 = _261 + 1.0;
    float _265 = _213 * _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_253, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = fma(_269, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = _271 * _259;
    float _277 = _273 * _259;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    float _287 = _283 * _215;
    float _289 = _285 * _217;
    bool _291 = !_257;
    if (!_291)
    {
        float _293 = in.m_56.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _187 = _307;
    }
    float _309 = _187;
    float _311 = in.m_44.x;
    float _313 = in.m_44.y;
    float _315 = in.m_44.z;
    float _317 = _287 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _319 = in.m_60.x;
    float _321 = in.m_60.y;
    float _323 = in.m_60.z;
    float _325 = in.m_60.w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _329 = in.m_62.x;
    float _331 = in.m_62.y;
    float _333 = in.m_62.z;
    float _335 = in.m_62.w;
    float _337 = _317 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _339 = _289 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _341 = in.m_64.x;
    float _343 = in.m_64.y;
    float _345 = in.m_64.z;
    float _347 = in.m_64.w;
    float _349 = in.m_56.x;
    float _351 = in.m_56.y;
    float _353 = _313 * _321;
    float _355 = _313 * _331;
    float _357 = fma(_311, _319, _353);
    float _359 = _313 * _343;
    float _361 = fma(_311, _329, _355);
    float _363 = fma(_315, _323, _357);
    float _365 = fma(_311, _341, _359);
    float _367 = fma(_315, _333, _361);
    float _369 = _363 + _325;
    float _371 = fma(_315, _345, _365);
    float _373 = _367 + _335;
    float _375 = -_369;
    float _377 = _375 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _379 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _381 = _371 + _347;
    float _383 = -_373;
    float _385 = _383 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _387 = _377 * _377;
    float _389 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _391 = -_381;
    float _393 = _391 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _395 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _397 = fma(_385, _385, _387);
    float _399 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _401 = fma(_393, _393, _397);
    float _403 = fma(_399, -2.0, _327);
    float _405 = -_389;
    float _407 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _405);
    float _409 = -_395;
    float _411 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _409);
    float _413 = rsqrt(_401);
    float _415 = in.m_56.z;
    float _417 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _403);
    float _419 = _411 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _421 = -_419;
    float _423 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[1].x, _421);
    float _425 = -_379;
    float _427 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _425);
    float _429 = _427 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _431 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _433 = _385 * _413;
    float _435 = _393 * _413;
    float _437 = _377 * _413;
    float _439 = -_431;
    float _441 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _439);
    float _443 = _433 * _433;
    float _445 = _351 * 2.0;
    float _447 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[1].w, _423);
    float _449 = fma(_435, _435, _443);
    float _451 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _453 = -_429;
    float _455 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[1].y, _453);
    float _457 = _447 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _459 = rsqrt(_449);
    float _461 = -_451;
    float _463 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _461);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _467 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _469 = _441 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[1].w, _455);
    float _473 = _349 * 2.0;
    float _475 = -_467;
    float _477 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _475);
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = -_457;
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[0].x, _483);
    float _487 = -_465;
    float _489 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[77].x, _487);
    float _491 = _415 * 2.0;
    float _493 = _411 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _495 = -_115;
    float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[76].x, _489);
    float _499 = _435 * _459;
    float _501 = floor(_473);
    float _503 = _433 * _459;
    float _505 = -_493;
    float _507 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[1].x, _505);
    float _509 = -_499;
    float _511 = _435 * _509;
    float _513 = -_499;
    float _515 = _437 * _513;
    float _517 = -_511;
    float _519 = fma(_433, _503, _517);
    float _521 = floor(_491);
    float _523 = _437 * _503;
    float _525 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[1].w, _507);
    float _527 = _519 * _519;
    float _529 = -_469;
    float _531 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _529);
    float _533 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[0].z, _485);
    float _535 = fma(_523, _523, _527);
    float _537 = floor(_445);
    bool _539 = _501 > 0.0;
    float _541 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[1].z, _531);
    bool _543 = _501 >= 0.0;
    bool _545 = isnan(_501);
    bool _547 = _543 || _545;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    float _553 = fma(_515, _515, _535);
    float _555 = _351 + _349;
    float _557 = -_541;
    float _559 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[0].w, _533);
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _571 = _569 != 0;
    float _573 = rsqrt(_553);
    float _575 = _351 + _415;
    float _577 = _481 * _115;
    float _579 = _555 + (-1.0);
    float _581 = _575 + (-1.0);
    bool _583 = !_567;
    int _585 = _583 ? 0 : 1;
    float _587 = _411 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _589 = _521 >= 0.0;
    bool _591 = isnan(_521);
    bool _593 = _589 || _591;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    float _599 = 1.0 / _559;
    float _601 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _603 = _537 > 0.0;
    float _605 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _607 = _597 ? 0 : 1;
    float _609 = -_587;
    float _611 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[0].x, _609);
    bool _613 = _537 >= 0.0;
    bool _615 = isnan(_537);
    bool _617 = _613 || _615;
    bool _619 = isnan(0.0);
    bool _621 = _617 || _619;
    float _623 = _427 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _625 = _521 > 0.0;
    float _627 = exp2(_577);
    float _629 = _411 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _631 = _519 * _573;
    float _633 = precise::clamp(_631, 0.0, 1.0);
    float _635 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[0].w, _611);
    float _637 = -_623;
    float _639 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[0].y, _637);
    float _641 = -_629;
    float _643 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[0].x, _641);
    float _645 = -_633;
    float _647 = _645 + 1.0;
    float _649 = fma(_635, _599, -1.0);
    float _651 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _653 = int(_651);
    float _655 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[0].w, _643);
    float _657 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[0].w, _639);
    float _659 = _647 * _599;
    float _661 = fma(_647, _649, 1.0);
    bool _663 = !_563;
    int _665 = _663 ? 0 : 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _669 = -_627;
    float _671 = _669 + 1.0;
    int _673 = ~_607;
    int _675 = _673 + 1;
    int _677 = _675 + 1;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _681 = _369 + _679;
    bool _683 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _685 = isnan(0.0);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _691 = _687 || _689;
    float _693 = _657 * _659;
    int _695 = _677;
    if (!_625)
    {
        int _697 = ~_607;
        int _699 = _697 + 1;
        _695 = _699;
    }
    int _701 = _695;
    float _703 = _661 * _661;
    bool _705 = !_571;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _667);
    float _711 = float(_653);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _715 = _373 + _713;
    float _717 = _691 ? _671 : 0.0;
    float _719 = _681 * _681;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _731 = _729 != 0;
    float _733 = _655 * _659;
    float _735 = fma(_693, _693, _703);
    float _737 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _739 = int(_737);
    int _741 = _551 ? 0 : 1;
    float _743 = fma(_715, _715, _719);
    bool _745 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(1.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _757 = 1.0 + _755;
    bool _759 = !_723;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_733, _733, _735);
    float _765 = 1.0 / _711;
    int _767 = abs(_761);
    float _769 = in.m_66.x;
    float _771 = in.m_66.y;
    float _773 = in.m_66.z;
    int _775 = _621 ? 0 : 1;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _779 = 1.0 / _757;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _783 = _381 + _781;
    float _785 = float(_739);
    float _787 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _777);
    float _789 = fma(_783, _783, _743);
    int _791 = ~_775;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    float _797 = _785 * _115;
    float _799 = rsqrt(_763);
    float _801 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    float _803 = _765 * _115;
    float _805 = float(_701);
    float _807 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _787);
    float _809 = float(_767);
    float _811 = sqrt(_789);
    int _813 = _795;
    if (_753)
    {
        float _815 = _717 * _779;
        _125 = _815;
    }
    float _817 = _125;
    if (!_603)
    {
        int _819 = ~_775;
        int _821 = _819 + 1;
        _813 = _821;
    }
    int _823 = _813;
    float _825 = _809 * _805;
    int _827 = ~_741;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    int _833 = _831;
    if (!_539)
    {
        int _835 = ~_741;
        int _837 = _835 + 1;
        _833 = _837;
    }
    int _839 = _833;
    float _841 = _825 * (-2.0);
    float _843 = _661 * _799;
    float _845 = _733 * _799;
    float _847 = fma(_841, _769, _769);
    float _849 = _435 * _843;
    bool _851 = !_727;
    int _853 = _851 ? 0 : 1;
    float _855 = _811 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _857 = fma(_605, _841, _605);
    float _859 = precise::min(_337, _855);
    float _861 = _693 * _799;
    float _863 = -_845;
    float _865 = -_849;
    float _867 = fma(_437, _863, _865);
    float _869 = -_845;
    float _871 = _433 * _869;
    float _873 = float(_823);
    float _875 = -_861;
    float _877 = _437 * _875;
    float _879 = rsqrt(_789);
    float _881 = -_861;
    float _883 = -_871;
    float _885 = fma(_435, _881, _883);
    bool _887 = !_731;
    int _889 = _887 ? 0 : 1;
    float _891 = -_877;
    float _893 = fma(_433, _843, _891);
    int _895 = abs(_853);
    float _897 = _885 * _885;
    int _899 = abs(_889);
    float _901 = _349 + (-0.5);
    float _903 = fma(_867, _867, _897);
    float _905 = float(_839);
    float _907 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[196].x, _847);
    float _909 = fma(_893, _893, _903);
    float _911 = float(_895);
    float _913 = fma(_857, _817, _907);
    float _915 = float(_899);
    float _917 = rsqrt(_909);
    float _919 = _879 * _859;
    float _921 = _911 * _905;
    float _923 = _913 * 0.15915493667125701904296875;
    float _925 = _915 * _873;
    float _927 = _681 * _919;
    float _929 = _715 * _919;
    float _931 = _923 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = -_927;
    float _937 = _681 + _935;
    float _939 = _921 * (-2.0);
    float _941 = -_929;
    float _943 = _715 + _941;
    float _945 = _937 * _937;
    float _947 = fma(_601, _939, _601);
    float _949 = fma(_939, _771, _771);
    float _951 = _867 * _917;
    float _953 = _885 * _917;
    float _955 = _893 * _917;
    float _957 = _783 * _919;
    float _959 = _435 * _951;
    float _961 = fma(_943, _943, _945);
    float _963 = _437 * _955;
    float _965 = -_957;
    float _967 = _783 + _965;
    float _969 = -_959;
    float _971 = fma(_433, _955, _969);
    float _973 = _433 * _953;
    float _975 = -_963;
    float _977 = fma(_435, _953, _975);
    float _979 = fma(_967, _967, _961);
    float _981 = _971 * _971;
    float _983 = -_973;
    float _985 = fma(_437, _951, _983);
    float _987 = _351 + (-0.5);
    float _989 = _923 * 6.283185482025146484375;
    float _991 = cos(_989);
    float _993 = fma(_977, _977, _981);
    float _995 = _415 + _349;
    float _997 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].y, _949);
    float _999 = fma(_985, _985, _993);
    float _1001 = _995 + (-1.0);
    float _1003 = _925 * (-2.0);
    float _1005 = fma(_947, _817, _997);
    float _1007 = _415 + (-0.5);
    float _1009 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1011 = rsqrt(_999);
    float _1013 = fma(_1003, _773, _773);
    float _1015 = _1005 * 0.15915493667125701904296875;
    float _1017 = fma(_1009, _1003, _1009);
    float _1019 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1013);
    float _1021 = sqrt(_979);
    float _1023 = fma(_1017, _817, _1019);
    float _1025 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1027 = _1023 * 0.15915493667125701904296875;
    float _1029 = _985 * _1011;
    float _1031 = _971 * _1011;
    float _1033 = _977 * _1011;
    float _1035 = _1015 * 6.283185482025146484375;
    float _1037 = sin(_1035);
    float _1039 = _433 * _1029;
    float _1041 = _435 * _1031;
    float _1043 = _437 * _1033;
    float _1045 = -_1039;
    float _1047 = fma(_435, _1033, _1045);
    float _1049 = -_1041;
    float _1051 = fma(_437, _1029, _1049);
    float _1053 = _879 * _1021;
    float _1055 = _1015 * 6.283185482025146484375;
    float _1057 = cos(_1055);
    float _1059 = _1047 * _1047;
    float _1061 = -_1043;
    float _1063 = fma(_433, _1031, _1061);
    float _1065 = _339 * _1053;
    float _1067 = _317 * _1053;
    float _1069 = fma(_1051, _1051, _1059);
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1073 = _1065 * _1025;
    float _1075 = _1027 * 6.283185482025146484375;
    float _1077 = cos(_1075);
    float _1079 = fma(_1063, _1063, _1069);
    float _1081 = _991 * _1037;
    float _1083 = _933 * _1037;
    float _1085 = _1027 * 6.283185482025146484375;
    float _1087 = sin(_1085);
    float _1089 = _991 * _1057;
    float _1091 = _933 * _1057;
    float _1093 = rsqrt(_1079);
    float _1095 = _991 * _1077;
    float _1097 = _933 * _1077;
    float _1099 = _1057 * _1077;
    float _1101 = _1067 * _1071;
    float _1103 = _1095 * _1073;
    float _1105 = -_929;
    float _1107 = _373 + _1105;
    float _1109 = fma(_1087, _1089, _1083);
    float _1111 = -_1073;
    float _1113 = _1087 * _1111;
    float _1115 = -_1081;
    float _1117 = fma(_1087, _1091, _1115);
    float _1119 = _1097 * _1073;
    float _1121 = fma(_1109, _1101, _1103);
    float _1123 = fma(_1099, _1101, _1113);
    float _1125 = -_957;
    float _1127 = _381 + _1125;
    float _1129 = fma(_1117, _1101, _1119);
    float _1131 = _1121 * _1029;
    float _1133 = _1063 * _1093;
    float _1135 = -_927;
    float _1137 = _369 + _1135;
    float _1139 = _1121 * _1033;
    float _1141 = _1051 * _1093;
    float _1143 = fma(_1123, _1133, _1131);
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1147 = _1047 * _1093;
    float _1149 = fma(_1123, _1141, _1139);
    float _1151 = fma(_1129, _435, _1143);
    float _1153 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1145);
    float _1155 = fma(_1129, _433, _1149);
    float _1157 = _381 + _1151;
    float _1159 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1153);
    float _1161 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1163 = _373 + _1155;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1167 = _1157 + _1165;
    float _1169 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1171 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1161);
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1175 = _1163 + _1173;
    float _1177 = _1167 * _1167;
    float _1179 = 1.0 / _1169;
    float _1181 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1171);
    bool _1183 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan(0.5);
    bool _1191 = _1187 || _1189;
    float _1193 = fma(_1175, _1175, _1177);
    float _1195 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1197 = sqrt(_1193);
    float _1199 = _1195 + _1169;
    float _1201 = _1199 * _1179;
    float _1203 = _1201 * 0.5;
    float _1205 = _1121 * _1031;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1209 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1207);
    float _1211 = fma(_1123, _1147, _1205);
    bool _1213 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = 1.0 / _1209;
    float _1217 = fma(_1129, _437, _1211);
    bool _1219 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan(0.5);
    bool _1227 = _1223 || _1225;
    float _1229 = _369 + _1217;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1233 = _1163;
    float _1235 = _1157;
    float _1237 = _1129;
    float _1239 = _1197;
    float _1241 = _1175;
    float _1243 = _1229;
    float _1245 = _1167;
    float _1247 = _1209;
    if (!_1213)
    {
        _1231 = _1229;
    }
    float _1249 = _1231;
    bool _1251 = !_1213;
    float _1253 = _1249;
    if (!_1251)
    {
        float _1255 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1257 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1259 = _1197 + _1257;
        float _1261 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = rsqrt(_1193);
        float _1265 = _1259 * _1255;
        float _1267 = _1265 * 0.15915493667125701904296875;
        float _1269 = _1267 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = _1267 * 6.283185482025146484375;
        float _1275 = sin(_1273);
        float _1277 = _1271 + (-1.0);
        float _1279 = fma(_1275, _1261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1281 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1283 = _1263 * _1279;
        float _1285 = fma(_1229, _1271, _1281);
        float _1287 = fma(_1175, _1283, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1289 = fma(_1167, _1283, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1233 = _1287;
        _1253 = _1285;
        _1235 = _1289;
        _1237 = _1277;
        _1239 = _1267;
    }
    float _1291 = _1233;
    float _1293 = _1253;
    float _1295 = _1235;
    float _1297 = _1237;
    float _1299 = _1239;
    float _1301 = -_929;
    float _1303 = _1301 + _1291;
    float _1305 = -_927;
    float _1307 = _1305 + _1293;
    float _1309 = -_957;
    float _1311 = _1309 + _1295;
    float _1313 = _1299;
    float _1315 = _1307;
    float _1317 = _1303;
    float _1319 = _1311;
    float _1321 = _1293;
    float _1323 = _1297;
    if (_1227)
    {
        _1313 = 1.0;
    }
    float _1325 = _1313;
    float _1327 = _1325;
    if (!_1191)
    {
        float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1331 = _1137 + _1329;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1335 = _1107 + _1333;
        float _1337 = -_373;
        float _1339 = _1337 + _1291;
        float _1341 = -_369;
        float _1343 = _1341 + _1293;
        float _1345 = _1331 * _1331;
        float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1349 = _1127 + _1347;
        float _1351 = -_381;
        float _1353 = _1351 + _1295;
        float _1355 = fma(_1335, _1335, _1345);
        float _1357 = fma(_1349, _1349, _1355);
        float _1359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1361 = sqrt(_1357);
        float _1363 = precise::min(_1361, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1365 = _1363 * _1359;
        float _1367 = fma(_1339, _1365, _1107);
        float _1369 = fma(_1343, _1365, _1137);
        float _1371 = fma(_1353, _1365, _1127);
        _1241 = _1345;
        _1315 = _1369;
        _1317 = _1367;
        _1319 = _1371;
    }
    float _1373 = _1241;
    float _1375 = _1315;
    float _1377 = _1317;
    float _1379 = _1319;
    float _1381 = _1373;
    if (_1227)
    {
        _1243 = 1.0;
    }
    float _1383 = _1243;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1387 = _1215 * _1385;
    float _1389 = _1383;
    if (!_1227)
    {
        float _1391 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1393 = _1391 * 0.15915493667125701904296875;
        float _1395 = _1393 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        float _1399 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1401 = _1399 * 0.15915493667125701904296875;
        float _1403 = _1393 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = 1.0 / _1397;
        float _1409 = _1401 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1405 * _1407;
        float _1415 = _1401 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1421 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1419;
        float _1423 = _1411 * _1413;
        float _1425 = 1.0 / _1421;
        float _1427 = 1.0 / _1423;
        float _1429 = _1417 * _1427;
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1433 = fma(_1387, _1429, _1431);
        float _1435 = _1433 * _1425;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        _1381 = _1401;
        _1245 = _1413;
        _1321 = _1393;
        _1327 = _1437;
    }
    float _1439 = _1381;
    float _1441 = _1245;
    float _1443 = _1321;
    float _1445 = _1327;
    float _1447 = _1441;
    float _1449 = _1439;
    if (!_1227)
    {
        float _1451 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1453 = _1451 * 0.15915493667125701904296875;
        float _1455 = _1453 * 6.283185482025146484375;
        float _1457 = cos(_1455);
        float _1459 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1461 = _1459 * 0.15915493667125701904296875;
        float _1463 = _1453 * 6.283185482025146484375;
        float _1465 = sin(_1463);
        float _1467 = 1.0 / _1457;
        float _1469 = _1461 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        float _1473 = _1465 * _1467;
        float _1475 = _1461 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        float _1479 = _1471 * _1473;
        float _1481 = 1.0 / _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1485 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1483;
        float _1487 = 1.0 / _1485;
        float _1489 = _1477 * _1481;
        float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1493 = fma(_1387, _1489, _1491);
        float _1495 = _1493 * _1487;
        float _1497 = precise::clamp(_1495, 0.0, 1.0);
        float _1499 = -_1497;
        float _1501 = _1499 + 1.0;
        _1447 = _1489;
        _1449 = _1467;
        _1389 = _1501;
    }
    float _1503 = _1447;
    float _1505 = _1449;
    float _1507 = _1389;
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1511 = _1375 + _1509;
    float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1515 = _1377 + _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1519 = _1379 + _1517;
    float _1521 = _1511 * _1511;
    float _1523 = fma(_1515, _1515, _1521);
    float _1525 = fma(_1519, _1519, _1523);
    float _1527 = rsqrt(_1525);
    float _1529 = sqrt(_1525);
    float _1531 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1533 = _1515 * _1531;
    float _1535 = _1519 * _1531;
    float _1537 = _1533 * _1533;
    float _1539 = _1535 * _1535;
    float _1541 = _1537 + _1539;
    float _1543 = sqrt(_1541);
    bool _1545 = _1543 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1549 = _1543 + _1547;
    float _1551 = _1503;
    float _1553 = _1541;
    float _1555 = _1549;
    float _1557 = _1511;
    float _1559 = _1533;
    float _1561 = _1535;
    float _1563 = _1539;
    if (_1545)
    {
        float _1565 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1565;
    }
    float _1567 = _1551;
    if (_1545)
    {
        float _1569 = rsqrt(_1541);
        _1553 = _1569;
    }
    float _1571 = _1553;
    if (_1545)
    {
        float _1573 = _1549 * _1567;
        _1555 = _1573;
    }
    float _1575 = _1555;
    if (_1545)
    {
        float _1577 = _1575 * 0.15915493667125701904296875;
        _1323 = _1577;
    }
    float _1579 = _1323;
    float _1581 = _1443;
    if (_1545)
    {
        float _1583 = _1579 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        _1581 = _1585;
    }
    float _1587 = _1581;
    float _1589 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1591 = precise::max(0.0, _1589);
    float _1593 = _1505;
    float _1595 = _1591;
    float _1597 = _1589;
    if (_1545)
    {
        float _1599 = _1579 * 6.283185482025146484375;
        float _1601 = cos(_1599);
        _1593 = _1601;
    }
    float _1603 = _1593;
    float _1605 = -_1531;
    float _1607 = -_1591;
    float _1609 = fma(_1511, _1605, _1607);
    if (!_1545)
    {
        _1595 = _1537;
    }
    float _1611 = _1595;
    float _1613 = _1611;
    if (_1545)
    {
        float _1615 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1557 = _1615;
    }
    float _1617 = _1557;
    float _1619 = _1587;
    float _1621 = _1617;
    if (_1545)
    {
        float _1623 = fma(_1587, _1617, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1619 = _1623;
    }
    float _1625 = _1619;
    float _1627 = _1625;
    if (!_1545)
    {
        _1621 = _1609;
    }
    float _1629 = _1621;
    float _1631 = _1629;
    if (_1545)
    {
        float _1633 = _1603 + (-1.0);
        _1597 = _1633;
    }
    float _1635 = _1597;
    if (_1545)
    {
        float _1637 = _1571 * _1625;
        _1247 = _1637;
    }
    float _1639 = _1247;
    float _1641 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1545)
    {
        float _1643 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1627 = _1643;
    }
    float _1645 = _1627;
    if (_1545)
    {
        float _1647 = _1533 * _1639;
        _1559 = _1647;
    }
    float _1649 = _1559;
    if (_1545)
    {
        float _1651 = _1535 * _1639;
        _1561 = _1651;
    }
    float _1653 = _1561;
    float _1655 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1641);
    if (_1545)
    {
        float _1657 = fma(_1609, _1603, _1645);
        _1631 = _1657;
    }
    float _1659 = _1631;
    if (_1545)
    {
        float _1661 = _1649 * _1649;
        _1613 = _1661;
    }
    float _1663 = _1613;
    if (_1545)
    {
        float _1665 = _1653 * _1653;
        _1563 = _1665;
    }
    float _1667 = _1563;
    float _1669 = fma(_1659, _1659, _1663);
    float _1671 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1655);
    float _1673 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1675 = _1669 + _1667;
    float _1677 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1679 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1681 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1685 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1683);
    float _1687 = precise::clamp(_1685, 0.0, 1.0);
    float _1689 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1691 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1679);
    float _1693 = rsqrt(_1675);
    float _1695 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1681);
    float _1697 = -_1687;
    float _1699 = _1697 + 1.0;
    float _1701 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1691);
    float _1703 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1673);
    float _1705 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1695);
    float _1707 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1709 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1711 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1713 = abs(_1699);
    float _1715 = log2(_1713);
    float _1717 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1719 = -_1709;
    float _1721 = fma(_1719, _1677, 1.0);
    float _1723 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1703);
    float _1725 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1717);
    float _1729 = _1693 * _1649;
    float _1731 = _1693 * _1659;
    float _1733 = _1693 * _1653;
    float _1735 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1727);
    float _1737 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1739 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1741 = log2(_1721);
    float _1743 = -_1737;
    float _1745 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1743);
    float _1747 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1735);
    float _1749 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1751 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1725);
    float _1753 = -_1733;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1745);
    float _1757 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1759 = 1.0 / _1747;
    float _1761 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1751);
    float _1763 = fma(_1755, -0.5, 0.5);
    float _1765 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1757);
    float _1767 = fma(_1755, 0.5, 0.5);
    float _1769 = _1731 + 1.0;
    float _1771 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1765);
    float _1773 = exp2(_1749);
    float _1775 = fma(_1767, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1777 = _1741 * 0.693147182464599609375;
    float _1779 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1771);
    float _1781 = fma(_1767, _1775, -0.212114393711090087890625);
    float _1783 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1785 = sqrt(_1763);
    float _1787 = _1779 * _1759;
    float _1789 = fma(_1767, _1781, 1.570728778839111328125);
    float _1791 = fma(_1787, 0.5, 0.5);
    float _1793 = -_1731;
    float _1795 = fma(_1773, _1769, _1793);
    float _1797 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1761);
    float _1799 = fma(_1795, 0.5, 0.5);
    float _1801 = _1797 * _1759;
    float _1803 = _1785 * 0.636619746685028076171875;
    float _1805 = fma(_1801, -0.5, 0.5);
    float _1807 = -_1789;
    float _1809 = fma(_1803, _1807, 1.0);
    float3 _5636 = float3(_1791, _1805, _1783);
    float _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5636, float3(0.0), isnan(_5636)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5636, float3(0.0), isnan(_5636)), level(0.0)).x;
    float3 _5647 = float3(_1791, _1805, _1783);
    float4 _1814 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5647, float3(0.0), isnan(_5647)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5647, float3(0.0), isnan(_5647)), level(0.0)).xyzw;
    float _1816 = _1814.x;
    float _1818 = _1814.y;
    float _1820 = _1814.z;
    float _1822 = _1814.w;
    float2 _5664 = float2(_1809, _1799);
    float3 _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5664, float2(0.0), isnan(_5664)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5664, float2(0.0), isnan(_5664)), level(0.0)).xyz;
    float _1828 = _1826.x;
    float _1830 = _1826.y;
    float _1832 = _1826.z;
    float _1834 = float(uint(_739));
    float _1836 = trunc(_803);
    int _1838 = int(_1836);
    int _1840 = ~_739;
    int _1842 = _1840 + 1;
    out.m_68.x = _1107;
    out.m_68.y = _1137;
    out.m_68.z = _1127;
    bool _1844 = _351 > 0.5;
    float _1846 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1848 = -_1091;
    float _1850 = fma(_1087, _1081, _1848);
    float _1852 = _1037 * _1077;
    out.m_70.w = _859;
    float _1854 = 1.0 / _1834;
    out.m_72.x = _1067;
    out.m_74.x = _1377;
    out.m_74.y = _1375;
    out.m_74.z = _1379;
    float _1856 = float(uint(_1838));
    float _1858 = exp2(_1846);
    int _1860 = as_type<int>(_1854) + (-2);
    float _1862 = as_type<float>(_1860) * _1856;
    float _1864 = -_1858;
    float _1866 = _1864 + 1.0;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1870 = _1868 != 0;
    float _1872 = trunc(_1862);
    float _1874 = precise::max(_1872, 0.0);
    uint _1877 = uint(_1874);
    float _1879 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1881 = !_1870;
    float _1883 = _1881 ? 7.345489978790283203125 : 1.0;
    float _1885 = _1883 * _349;
    float _1887 = floor(_1885);
    int _1889 = _1842 * int(_1877);
    int _1891 = _1889 + _1838;
    float _1893 = float(uint(_1891));
    float _1895 = as_type<float>(_1860) * _1893;
    float _1897 = trunc(_1895);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    int _1903 = int(_1877) + int(_1901);
    float _1905 = float(_1838);
    int _1907 = _1842 * _1903;
    int _1909 = _1907 + _1838;
    bool _1911 = _1905 >= _785;
    bool _1913 = isnan(_1905);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(_785);
    bool _1919 = _1915 || _1917;
    float _1921 = float(_1919);
    float _1923 = -_1887;
    float _1925 = _1885 + _1923;
    float _1927 = _797 * _163;
    int _1929 = _739 + (-1);
    bool _1931 = uint(_1909) >= uint(_739);
    float _1933 = trunc(_1921);
    int _1935 = int(_1933);
    bool _1937 = !_1931;
    int _1939 = _1937 ? 0 : (-1);
    bool _1941 = _739 == 0;
    int _1943 = ~_1903;
    int _1945 = _1943 + _1939;
    int _1947 = _1945 + 1;
    float _1949 = _1925 * _785;
    float _1951 = trunc(_1927);
    int _1953 = int(_1951);
    int _1955 = _739 * _1947;
    int _1957 = _1955 + _1838;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1961 = _1959 != 0;
    int _1963 = ~_1935;
    int _1965 = _1963 + 1;
    int _1967 = _1965 + 1;
    bool _1969 = !_1941;
    int _1971 = _1969 ? _1957 : (-1);
    float _1973 = trunc(_1949);
    int _1975 = int(_1973);
    bool _1977 = !_1961;
    int _1979 = _1977 ? 0 : 1;
    int _1981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1983 = _1981 != 0;
    int _1985 = _1971 * _1967;
    int _1987 = abs(_585);
    int _1989 = abs(_1979);
    int _1991 = _1935 * _1929;
    int _1993 = _1991 + _1985;
    int _1995 = abs(_665);
    bool _1997 = !_1983;
    int _1999 = _1997 ? 0 : 1;
    int _2001 = abs(_707);
    int _2003 = _1993 * _1987;
    int _2005 = _1975 * _1989;
    int _2007 = _2005 + _1838;
    int _2009 = abs(_1999);
    int _2011 = _1953 * _1995;
    int _2013 = _2011 + _2003;
    bool _2015 = _349 > 0.5;
    bool _2017 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2019 = isnan(_309);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    int _2029 = _2007 * _2001;
    int _2031 = _2029 + _2013;
    int _2033 = _1975 * _2009;
    int _2035 = _2033 + _2031;
    int _2037 = ~_739;
    int _2039 = _2037 + 1;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2045 = -_2027;
    float _2047 = _2045 + 1.0;
    bool _2049 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2051 = isnan(_309);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2057 = _2053 || _2055;
    float _2059 = float(_2057);
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2065 = float(uint(_2035));
    float _2067 = 1.0 / _2043;
    float _2069 = as_type<float>(_1860) * _2065;
    int _2071 = ~_739;
    int _2073 = _2071 + 1;
    float _2075 = 1.0 / _2063;
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2081 = trunc(_2069);
    float _2083 = precise::max(_2081, 0.0);
    uint _2085 = uint(_2083);
    float _2087 = 1.0 / _2079;
    int _2089 = _2039 * int(_2085);
    int _2091 = _2089 + _2035;
    float _2093 = float(uint(_2091));
    float _2095 = as_type<float>(_1860) * _2093;
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2103 = _2101 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2105 = trunc(_2095);
    float _2107 = precise::max(_2105, 0.0);
    uint _2109 = uint(_2107);
    float _2111 = _2099 * _2087;
    bool _2113 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2115 = isnan(_309);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2121 = _2117 || _2119;
    float _2123 = float(_2121);
    float _2125 = _2103 * _2067;
    bool _2127 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2129 = isnan(_309);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2135 = _2131 || _2133;
    float _2137 = float(_2135);
    float _2139 = _2123 * _2047;
    float _2141 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2143 = _309 + _2141;
    float _2145 = fma(_2111, _2143, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2149 = _309 + _2147;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2153 = _309 + _2151;
    int _2155 = int(_2085) + int(_2109);
    float _2157 = -_2123;
    float _2159 = _2157 + 1.0;
    float _2161 = fma(_2125, _2149, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2163 = -_183;
    int _2165 = _1844 ? as_type<int>(_2163) : as_type<int>(_183);
    float _2167 = _2059 * _2159;
    float _2169 = -_2059;
    float _2171 = _2169 + 1.0;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2173;
    float _2177 = _2137 * _2171;
    int _2179 = _2073 * _2155;
    int _2181 = _2179 + _2035;
    float _2183 = _2175 * _2075;
    float _2185 = float(uint(_2007));
    float _2187 = _2145 * _2177;
    float _2189 = -_2137;
    float _2191 = _2189 + 1.0;
    bool _2193 = uint(_2181) >= uint(_739);
    float _2195 = fma(_2183, _2153, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2197 = as_type<float>(_1860) * _2185;
    float _2199 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2187);
    bool _2201 = !_2193;
    int _2203 = _2201 ? 0 : (-1);
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2207 = _2205 != 0;
    float _2209 = trunc(_2197);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    int _2215 = ~_2155;
    int _2217 = _2215 + _2203;
    int _2219 = _2217 + 1;
    float _2221 = -_179;
    int _2223 = _2015 ? as_type<int>(_2221) : as_type<int>(_179);
    int _2225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2227 = _2225 != 0;
    int _2229 = _739 * _2219;
    int _2231 = _2229 + _2035;
    float _2233 = fma(_2161, _2167, _2199);
    bool _2235 = !_2207;
    float _2237 = _2235 ? _179 : as_type<float>(_2223);
    float _2239 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2241 = !_2227;
    float _2243 = _2241 ? _183 : as_type<float>(_2165);
    float _2245 = fma(_2195, _2139, _2233);
    bool _2247 = !_1941;
    int _2249 = _2247 ? _2231 : (-1);
    float _2251 = _2237 + 0.5;
    float _2253 = _2243 + (-0.5);
    int _2255 = _2249 >> 31;
    float _2257 = fma(_2027, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2245);
    float _2259 = fma(_2251, (*spvDescriptorSet0.vp_c9)._m0[80].x, _497);
    float _2261 = -_801;
    float _2263 = _2261 + 1.0;
    int _2265 = _2255 & 3;
    float _2267 = -_2253;
    float _2269 = -_417;
    float _2271 = fma(_2267, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2269);
    float _2273 = -_807;
    float _2275 = _2273 + 1.0;
    int _2277 = _2073 * int(_2213);
    int _2279 = _2277 + _2007;
    int _2281 = _2249 + _2265;
    float _2283 = -_2263;
    float _2285 = fma(_2237, _2283, _2259);
    float _2287 = fma(_2243, _2275, _2271);
    float _2289 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2291 = _2281 >> 2;
    float _2293 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_76.x = _2285;
    out.m_76.y = _2287;
    int _2295 = _2291 << 4;
    int _2297 = _2295 + 368;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    uint _2303 = uint(int(uint(_2297) >> uint(2)));
    uint _2305 = uint(int(uint(int(_2303)) >> uint(2)));
    int _2307 = int(_2303) & 3;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[int(_2305)][_2307];
    int _2311 = int(_2303) + 1;
    uint _2313 = uint(int(uint(_2311) >> uint(2)));
    int _2315 = _2311 & 3;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[int(_2313)][_2315];
    float _2319 = float(uint(_2279));
    float _2321 = _2299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2327 = _2325 != 0;
    float _2329 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2331 = as_type<float>(_1860) * _2319;
    int _2333 = _2249 & 3;
    bool _2335 = _2333 != 0;
    int _2337 = _2297 + 8;
    uint _2339 = uint(int(uint(_2337) >> uint(2)));
    uint _2341 = uint(int(uint(int(_2339)) >> uint(2)));
    int _2343 = int(_2339) & 3;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[int(_2341)][_2343];
    int _2347 = int(_2339) + 1;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    int _2351 = _2347 & 3;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[int(_2349)][_2351];
    int _2355 = _2249 & 3;
    bool _2357 = _2355 != 0;
    float _2359 = trunc(_2331);
    float _2361 = precise::max(_2359, 0.0);
    uint _2363 = uint(_2361);
    bool _2365 = uint(_2333) > 1u;
    float _2367 = _2323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2369 = _2333 != 3;
    int _2371 = _2357 ? 0 : 1;
    bool _2373 = uint(_2333) >= 2u;
    out.m_78.x = _2321;
    out.m_78.y = _2329;
    out.m_78.z = _2367;
    out.m_78.w = _2289;
    int _2375 = ~_739;
    int _2377 = _2375 + 1;
    bool _2379 = !_2335;
    int _2381 = _2379 ? 0 : 1;
    float _2383 = _1879 * _1811;
    bool _2385 = _2333 != 3;
    int _2387 = int(_2213) + int(_2363);
    int _2389 = ~_2371;
    int _2391 = _2389 + 1;
    int _2393 = _2391 + 1;
    int _2395 = _2377 * _2387;
    int _2397 = _2395 + _2007;
    int _2399 = _2393;
    float _2401 = _1797;
    float _2403 = _1779;
    if (!_2365)
    {
        int _2405 = ~_2371;
        int _2407 = _2405 + 1;
        _2399 = _2407;
    }
    int _2409 = _2399;
    float _2411 = _1095 * _1031;
    int _2413 = _2373 ? 0 : 1;
    float _2415 = fma(_1087, _1083, _1089);
    int _2417 = abs(_2409);
    float _2419 = -_1087;
    float _2421 = fma(_2419, _1147, _2411);
    int _2423 = ~_2413;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    float _2429 = _1832 * _2383;
    int _2431 = _2427;
    if (_2369)
    {
        int _2433 = ~_2413;
        int _2435 = _2433 + 1;
        _2431 = _2435;
    }
    int _2437 = _2431;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2441 = uint(_2397) >= uint(_739);
    int _2443 = abs(_2381);
    out.m_80.w = _2439;
    bool _2445 = !_2441;
    int _2447 = _2445 ? 0 : (-1);
    int _2449 = abs(_2437);
    int _2451 = ~_2417;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = ~_2387;
    int _2459 = _2457 + _2447;
    int _2461 = _2459 + 1;
    bool _2463 = !_2385;
    int _2465 = _2463 ? 0 : (-1);
    int _2467 = _2455 * as_type<int>(_2317);
    int _2469 = ~_2443;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    int _2475 = _739 * _2461;
    int _2477 = _2475 + _2007;
    float _2479 = _1095 * _1033;
    bool _2481 = !_2327;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _2473 * as_type<int>(_2309);
    int _2487 = _2485 + _2467;
    int _2489 = abs(_2465);
    float _2491 = -_1087;
    float _2493 = fma(_2491, _1141, _2479);
    int _2495 = ~_2449;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    float _2501 = _1095 * _1029;
    int _2503 = abs(_2483);
    float _2505 = fma(_1097, _433, _2493);
    int _2507 = ~_2489;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _2499 * as_type<int>(_2345);
    int _2515 = _2513 + _2487;
    float _2517 = _1109 * _1031;
    float _2519 = _1109 * _1033;
    float _2521 = _1850 * _1031;
    int _2523 = _2511 * as_type<int>(_2353);
    int _2525 = _2523 + _2515;
    int _2527 = ~_2503;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    float _2533 = fma(_1099, _1141, _2519);
    float _2535 = fma(_1099, _1147, _2517);
    float _2537 = fma(_1852, _1147, _2521);
    float _2539 = _1109 * _1029;
    int _2541 = _2525 * _2531;
    bool _2543 = !_1941;
    int _2545 = _2543 ? _2477 : (-1);
    float _2547 = -_1087;
    float _2549 = fma(_2547, _1133, _2501);
    float _2551 = fma(_1117, _433, _2533);
    float _2553 = fma(_1117, _437, _2535);
    float _2555 = _2293 * _2505;
    int _2557 = _2545 * _2503;
    int _2559 = _2557 + _2541;
    float _2561 = fma(_1097, _437, _2421);
    float _2563 = fma(_2415, _437, _2537);
    float _2565 = _1850 * _1033;
    float _2567 = _1850 * _1029;
    float _2569 = _2293 * _2561;
    float _2571 = fma(_1099, _1133, _2539);
    float _2573 = fma(_1097, _435, _2549);
    float _2575 = fma(_2239, _2551, _2555);
    float _2577 = fma(_1852, _1141, _2565);
    float _2579 = fma(_2239, _2553, _2569);
    float _2581 = fma(_1852, _1133, _2567);
    float _2583 = fma(_1117, _435, _2571);
    float _2585 = _2293 * _2573;
    float _2587 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2589 = float(_2559);
    float _2591 = _1747 * 0.5;
    float _2593 = _2563 + _2579;
    float _2595 = fma(_2415, _433, _2577);
    float _2597 = fma(_2415, _435, _2581);
    float _2599 = -_1879;
    float _2601 = _2599 + 1.0;
    float _2603 = fma(_2239, _2583, _2585);
    float _2605 = _1822 * _2383;
    float _2607 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2587);
    float _2609 = fma(_1797, -0.5, _2591);
    float _2611 = _2595 + _2575;
    float _2613 = _1822 * _2601;
    float _2615 = _2597 + _2603;
    float _2617 = fma(_1828, _2605, _1816);
    float _2619 = fma(_1830, _2605, _1818);
    float _2621 = fma(_1822, _2429, _1820);
    float _2623 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2607);
    out.m_82.x = _2611;
    out.m_82.y = _2593;
    out.m_82.z = _2615;
    bool _2625 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2627 = isnan(_1529);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2633 = _2629 || _2631;
    float _2635 = _1779 + _1747;
    float _2637 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2623);
    out.m_84.x = _2617;
    out.m_84.y = _2619;
    out.m_84.z = _2621;
    out.m_84.w = _2613;
    float _2639 = _2635 * 0.5;
    float _2641 = _2637 + _1747;
    out.m_86.x = _2589;
    float _2643 = _2641 * 0.5;
    out.gl_Position.x = _1779;
    out.gl_Position.y = _1797;
    out.gl_Position.z = _2637;
    out.gl_Position.w = _1747;
    float _2645 = _2605;
    float _2647 = _2637;
    float _2649 = _2639;
    if (!_2633)
    {
        _2645 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2651 = _2645;
    float _2653 = _1445 * _1507;
    out.m_88.x = _2639;
    out.m_88.y = _2609;
    out.m_88.z = _2643;
    out.m_88.w = _1747;
    float _2655 = _2653;
    float _2657 = _2651;
    float _2659 = _2651;
    if (!_2633)
    {
        _2401 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2661 = _2401;
    float _2663 = _2661;
    float _2665 = _2661;
    if (!_2633)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2667 = _2647;
    float _2669 = _2667;
    float _2671 = _2667;
    if (!_2633)
    {
        _2403 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2673 = _2403;
    float _2675 = _2653 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2677 = _2673;
    float _2679 = _2673;
    if (!_2633)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2681 = _2649;
    float _2683 = _2681;
    float _2685 = _2681;
    if (!_2633)
    {
        _2655 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2687 = _2655;
    bool _2689 = !_2633;
    float _2691 = _2687;
    float _2693 = _2687;
    if (!_2689)
    {
        bool _2695 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2697 = isnan(_1529);
        bool _2699 = _2695 || _2697;
        bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2703 = _2699 || _2701;
        if (!_2703)
        {
            float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2707 = _1529 + _2705;
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2711 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2709;
            float _2713 = 1.0 / _2711;
            float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2735 = _2707 * _2713;
            float _2737 = precise::clamp(_2735, 0.0, 1.0);
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2743 = fma(_2737, _2717, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2745 = fma(_2737, _2741, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2747 = fma(_2737, _2721, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2749 = fma(_2737, _2725, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2751 = fma(_2737, _2729, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2753 = fma(_2737, _2733, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2685 = _2743;
            _2659 = _2751;
            _2665 = _2745;
            _2679 = _2749;
            _2671 = _2747;
            _2693 = _2753;
            _2755 = true;
        }
        else
        {
            bool _2757 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2759 = isnan(_1529);
            bool _2761 = _2757 || _2759;
            bool _2763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2765 = _2761 || _2763;
            if (!_2765)
            {
                _2663 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2767 = _2663;
            _2665 = _2767;
            if (!_2765)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2769 = _2683;
            _2685 = _2769;
            if (!_2765)
            {
                _2669 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2771 = _2669;
            _2671 = _2771;
            if (!_2765)
            {
                _2677 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2773 = _2677;
            _2679 = _2773;
            if (!_2765)
            {
                _2657 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2775 = _2657;
            _2659 = _2775;
            if (!_2765)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2777 = _2691;
            bool _2779 = !_2765;
            _2693 = _2777;
            if (!_2779)
            {
                bool _2781 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2783 = isnan(_1529);
                bool _2785 = _2781 || _2783;
                bool _2787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2789 = _2785 || _2787;
                if (!_2789)
                {
                    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2793 = _1529 + _2791;
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2797 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2795;
                    float _2799 = 1.0 / _2797;
                    float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2805 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2821 = _2793 * _2799;
                    float _2823 = precise::clamp(_2821, 0.0, 1.0);
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2829 = fma(_2823, _2803, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2831 = fma(_2823, _2827, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2833 = fma(_2823, _2807, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2835 = fma(_2823, _2811, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2837 = fma(_2823, _2815, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2839 = fma(_2823, _2819, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2685 = _2829;
                    _2659 = _2837;
                    _2665 = _2831;
                    _2679 = _2835;
                    _2671 = _2833;
                    _2693 = _2839;
                    _2755 = true;
                }
                else
                {
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2659 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2665 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2679 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2671 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2755 = false;
    float _2841 = _2685;
    float _2843 = _2659;
    float _2845 = _2665;
    float _2847 = _2679;
    float _2849 = _2671;
    float _2851 = _2693;
    float _2853 = fma(_2593, -0.5, 0.5);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = -_2841;
    float _2859 = _2857 + _2843;
    float _2861 = _2675 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2863 = -_2845;
    float _2865 = _2863 + _2847;
    out.m_90.x = 0.0;
    float _2867 = fma(_2855, _2859, _2841);
    float _2869 = fma(_2855, _2865, _2845);
    out.m_51.x = _2861;
    float _2871 = -_2849;
    float _2873 = _2871 + _2851;
    float _2875 = _2867 * 0.586610972881317138671875;
    bool _2877 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2879 = fma(_2855, _2873, _2849);
    float _2881 = fma(_2869, 0.298911988735198974609375, _2875);
    bool _2883 = _1445 > 0.0;
    bool _2885 = isnan(_1445);
    bool _2887 = _2883 || _2885;
    bool _2889 = isnan(0.0);
    bool _2891 = _2887 || _2889;
    float _2893 = fma(_2879, 0.114477999508380889892578125, _2881);
    bool _2895 = _1507 <= 0.0;
    bool _2897 = !_2891;
    bool _2899 = _2895 || _2897;
    float _2901 = -_2893;
    float _2903 = _2869 + _2901;
    float _2905 = -_2893;
    float _2907 = _2867 + _2905;
    float _2909 = -_2893;
    float _2911 = _2879 + _2909;
    float _2913 = fma(_2903, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2893);
    float _2915 = fma(_2907, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2893);
    float _2917 = fma(_2911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2893);
    bool _2919 = !_2877;
    if (!_2919)
    {
        float _2921 = -_1375;
        float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2925 = -_1377;
        float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2929 = -_1379;
        float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2933 = _2923 * _2923;
        float _2935 = fma(_2927, _2927, _2933);
        float _2937 = fma(_2931, _2931, _2935);
        float _2939 = sqrt(_2937);
        float _2941 = rsqrt(_2937);
        float _2943 = -_2939;
        float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2947 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2949 = precise::clamp(_2947, 0.0, 1.0);
        float _2951 = _2927 * _2941;
        float _2953 = _2923 * _2941;
        float _2955 = abs(_2949);
        float _2957 = log2(_2955);
        float _2959 = _2931 * _2941;
        float _2961 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2963 = _2593 * _2953;
        float _2965 = -_2953;
        float _2967 = -_2961;
        float _2969 = fma(_2965, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2967);
        float _2971 = fma(_2611, _2951, _2963);
        float _2973 = -_2959;
        float _2975 = fma(_2973, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2969);
        float _2977 = fma(_2615, _2959, _2971);
        float _2979 = precise::clamp(_2977, 0.0, 1.0);
        float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2983 = _2975 + _2981;
        float _2985 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2987 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2989 = precise::clamp(_2987, 0.0, 1.0);
        float _2991 = exp2(_2985);
        float _2993 = _2991 * _2989;
        float _2995 = _2979 * _2993;
        float _2997 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3001 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2997;
        out.m_90.y = _2999;
        out.m_90.z = _3001;
    }
    out.m_70.x = _2913;
    out.m_70.y = _2915;
    out.m_70.z = _2917;
    if (!_2899)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3003 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3003;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2755 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = in.m_46.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = _106;
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3071 = as_type<float>(_133);
        out.gl_Position.z = _3071;
    }
    if (!_119)
    {
        return out;
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3126 = as_type<float>(_159);
        out.gl_Position.z = _3126;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _187 = _167;
    float _205;
    if (!_185)
    {
        float _189 = in.m_56.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _167;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = in.m_58.x;
    float _217 = in.m_58.y;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -_229;
    float _249 = _247 + 1.0;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = 1.0 / _233;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = _245 * _249;
    float _261 = -_245;
    float _263 = _261 + 1.0;
    float _265 = _213 * _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_253, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = fma(_269, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = _271 * _259;
    float _277 = _273 * _259;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    float _287 = _283 * _215;
    float _289 = _285 * _217;
    bool _291 = !_257;
    if (!_291)
    {
        float _293 = in.m_56.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _187 = _307;
    }
    float _309 = _187;
    float _311 = in.m_44.x;
    float _313 = in.m_44.y;
    float _315 = in.m_44.z;
    float _317 = _287 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _319 = in.m_60.x;
    float _321 = in.m_60.y;
    float _323 = in.m_60.z;
    float _325 = in.m_60.w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _329 = in.m_62.x;
    float _331 = in.m_62.y;
    float _333 = in.m_62.z;
    float _335 = in.m_62.w;
    float _337 = _317 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _339 = _289 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _341 = in.m_64.x;
    float _343 = in.m_64.y;
    float _345 = in.m_64.z;
    float _347 = in.m_64.w;
    float _349 = in.m_56.x;
    float _351 = in.m_56.y;
    float _353 = _313 * _321;
    float _355 = _313 * _331;
    float _357 = fma(_311, _319, _353);
    float _359 = _313 * _343;
    float _361 = fma(_311, _329, _355);
    float _363 = fma(_315, _323, _357);
    float _365 = fma(_311, _341, _359);
    float _367 = fma(_315, _333, _361);
    float _369 = _363 + _325;
    float _371 = fma(_315, _345, _365);
    float _373 = _367 + _335;
    float _375 = -_369;
    float _377 = _375 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _379 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _381 = _371 + _347;
    float _383 = -_373;
    float _385 = _383 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _387 = _377 * _377;
    float _389 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _391 = -_381;
    float _393 = _391 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _395 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _397 = fma(_385, _385, _387);
    float _399 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _401 = fma(_393, _393, _397);
    float _403 = fma(_399, -2.0, _327);
    float _405 = -_389;
    float _407 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _405);
    float _409 = -_395;
    float _411 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _409);
    float _413 = rsqrt(_401);
    float _415 = in.m_56.z;
    float _417 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _403);
    float _419 = _411 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _421 = -_419;
    float _423 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[1].x, _421);
    float _425 = -_379;
    float _427 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _425);
    float _429 = _427 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _431 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _433 = _385 * _413;
    float _435 = _393 * _413;
    float _437 = _377 * _413;
    float _439 = -_431;
    float _441 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _439);
    float _443 = _433 * _433;
    float _445 = _351 * 2.0;
    float _447 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[1].w, _423);
    float _449 = fma(_435, _435, _443);
    float _451 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _453 = -_429;
    float _455 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[1].y, _453);
    float _457 = _447 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _459 = rsqrt(_449);
    float _461 = -_451;
    float _463 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _461);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _467 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _469 = _441 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[1].w, _455);
    float _473 = _349 * 2.0;
    float _475 = -_467;
    float _477 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _475);
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = -_457;
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[0].x, _483);
    float _487 = -_465;
    float _489 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[77].x, _487);
    float _491 = _415 * 2.0;
    float _493 = _411 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _495 = -_115;
    float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[76].x, _489);
    float _499 = _435 * _459;
    float _501 = floor(_473);
    float _503 = _433 * _459;
    float _505 = -_493;
    float _507 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[1].x, _505);
    float _509 = -_499;
    float _511 = _435 * _509;
    float _513 = -_499;
    float _515 = _437 * _513;
    float _517 = -_511;
    float _519 = fma(_433, _503, _517);
    float _521 = floor(_491);
    float _523 = _437 * _503;
    float _525 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[1].w, _507);
    float _527 = _519 * _519;
    float _529 = -_469;
    float _531 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _529);
    float _533 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[0].z, _485);
    float _535 = fma(_523, _523, _527);
    float _537 = floor(_445);
    bool _539 = _501 > 0.0;
    float _541 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[1].z, _531);
    bool _543 = _501 >= 0.0;
    bool _545 = isnan(_501);
    bool _547 = _543 || _545;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    float _553 = fma(_515, _515, _535);
    float _555 = _351 + _349;
    float _557 = -_541;
    float _559 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[0].w, _533);
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _571 = _569 != 0;
    float _573 = rsqrt(_553);
    float _575 = _351 + _415;
    float _577 = _481 * _115;
    float _579 = _555 + (-1.0);
    float _581 = _575 + (-1.0);
    bool _583 = !_567;
    int _585 = _583 ? 0 : 1;
    float _587 = _411 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _589 = _521 >= 0.0;
    bool _591 = isnan(_521);
    bool _593 = _589 || _591;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    float _599 = 1.0 / _559;
    float _601 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _603 = _537 > 0.0;
    float _605 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _607 = _597 ? 0 : 1;
    float _609 = -_587;
    float _611 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[0].x, _609);
    bool _613 = _537 >= 0.0;
    bool _615 = isnan(_537);
    bool _617 = _613 || _615;
    bool _619 = isnan(0.0);
    bool _621 = _617 || _619;
    float _623 = _427 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _625 = _521 > 0.0;
    float _627 = exp2(_577);
    float _629 = _411 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _631 = _519 * _573;
    float _633 = precise::clamp(_631, 0.0, 1.0);
    float _635 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[0].w, _611);
    float _637 = -_623;
    float _639 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[0].y, _637);
    float _641 = -_629;
    float _643 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[0].x, _641);
    float _645 = -_633;
    float _647 = _645 + 1.0;
    float _649 = fma(_635, _599, -1.0);
    float _651 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _653 = int(_651);
    float _655 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[0].w, _643);
    float _657 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[0].w, _639);
    float _659 = _647 * _599;
    float _661 = fma(_647, _649, 1.0);
    bool _663 = !_563;
    int _665 = _663 ? 0 : 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _669 = -_627;
    float _671 = _669 + 1.0;
    int _673 = ~_607;
    int _675 = _673 + 1;
    int _677 = _675 + 1;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _681 = _369 + _679;
    bool _683 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _685 = isnan(0.0);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _691 = _687 || _689;
    float _693 = _657 * _659;
    int _695 = _677;
    if (!_625)
    {
        int _697 = ~_607;
        int _699 = _697 + 1;
        _695 = _699;
    }
    int _701 = _695;
    float _703 = _661 * _661;
    bool _705 = !_571;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _667);
    float _711 = float(_653);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _715 = _373 + _713;
    float _717 = _691 ? _671 : 0.0;
    float _719 = _681 * _681;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _731 = _729 != 0;
    float _733 = _655 * _659;
    float _735 = fma(_693, _693, _703);
    float _737 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _739 = int(_737);
    int _741 = _551 ? 0 : 1;
    float _743 = fma(_715, _715, _719);
    bool _745 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(1.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _757 = 1.0 + _755;
    bool _759 = !_723;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_733, _733, _735);
    float _765 = 1.0 / _711;
    int _767 = abs(_761);
    float _769 = in.m_66.x;
    float _771 = in.m_66.y;
    float _773 = in.m_66.z;
    int _775 = _621 ? 0 : 1;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _779 = 1.0 / _757;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _783 = _381 + _781;
    float _785 = float(_739);
    float _787 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _777);
    float _789 = fma(_783, _783, _743);
    int _791 = ~_775;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    float _797 = _785 * _115;
    float _799 = rsqrt(_763);
    float _801 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    float _803 = _765 * _115;
    float _805 = float(_701);
    float _807 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _787);
    float _809 = float(_767);
    float _811 = sqrt(_789);
    int _813 = _795;
    if (_753)
    {
        float _815 = _717 * _779;
        _125 = _815;
    }
    float _817 = _125;
    if (!_603)
    {
        int _819 = ~_775;
        int _821 = _819 + 1;
        _813 = _821;
    }
    int _823 = _813;
    float _825 = _809 * _805;
    int _827 = ~_741;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    int _833 = _831;
    if (!_539)
    {
        int _835 = ~_741;
        int _837 = _835 + 1;
        _833 = _837;
    }
    int _839 = _833;
    float _841 = _825 * (-2.0);
    float _843 = _661 * _799;
    float _845 = _733 * _799;
    float _847 = fma(_841, _769, _769);
    float _849 = _435 * _843;
    bool _851 = !_727;
    int _853 = _851 ? 0 : 1;
    float _855 = _811 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _857 = fma(_605, _841, _605);
    float _859 = precise::min(_337, _855);
    float _861 = _693 * _799;
    float _863 = -_845;
    float _865 = -_849;
    float _867 = fma(_437, _863, _865);
    float _869 = -_845;
    float _871 = _433 * _869;
    float _873 = float(_823);
    float _875 = -_861;
    float _877 = _437 * _875;
    float _879 = rsqrt(_789);
    float _881 = -_861;
    float _883 = -_871;
    float _885 = fma(_435, _881, _883);
    bool _887 = !_731;
    int _889 = _887 ? 0 : 1;
    float _891 = -_877;
    float _893 = fma(_433, _843, _891);
    int _895 = abs(_853);
    float _897 = _885 * _885;
    int _899 = abs(_889);
    float _901 = _349 + (-0.5);
    float _903 = fma(_867, _867, _897);
    float _905 = float(_839);
    float _907 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[196].x, _847);
    float _909 = fma(_893, _893, _903);
    float _911 = float(_895);
    float _913 = fma(_857, _817, _907);
    float _915 = float(_899);
    float _917 = rsqrt(_909);
    float _919 = _879 * _859;
    float _921 = _911 * _905;
    float _923 = _913 * 0.15915493667125701904296875;
    float _925 = _915 * _873;
    float _927 = _681 * _919;
    float _929 = _715 * _919;
    float _931 = _923 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = -_927;
    float _937 = _681 + _935;
    float _939 = _921 * (-2.0);
    float _941 = -_929;
    float _943 = _715 + _941;
    float _945 = _937 * _937;
    float _947 = fma(_601, _939, _601);
    float _949 = fma(_939, _771, _771);
    float _951 = _867 * _917;
    float _953 = _885 * _917;
    float _955 = _893 * _917;
    float _957 = _783 * _919;
    float _959 = _435 * _951;
    float _961 = fma(_943, _943, _945);
    float _963 = _437 * _955;
    float _965 = -_957;
    float _967 = _783 + _965;
    float _969 = -_959;
    float _971 = fma(_433, _955, _969);
    float _973 = _433 * _953;
    float _975 = -_963;
    float _977 = fma(_435, _953, _975);
    float _979 = fma(_967, _967, _961);
    float _981 = _971 * _971;
    float _983 = -_973;
    float _985 = fma(_437, _951, _983);
    float _987 = _351 + (-0.5);
    float _989 = _923 * 6.283185482025146484375;
    float _991 = cos(_989);
    float _993 = fma(_977, _977, _981);
    float _995 = _415 + _349;
    float _997 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].y, _949);
    float _999 = fma(_985, _985, _993);
    float _1001 = _995 + (-1.0);
    float _1003 = _925 * (-2.0);
    float _1005 = fma(_947, _817, _997);
    float _1007 = _415 + (-0.5);
    float _1009 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1011 = rsqrt(_999);
    float _1013 = fma(_1003, _773, _773);
    float _1015 = _1005 * 0.15915493667125701904296875;
    float _1017 = fma(_1009, _1003, _1009);
    float _1019 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1013);
    float _1021 = sqrt(_979);
    float _1023 = fma(_1017, _817, _1019);
    float _1025 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1027 = _1023 * 0.15915493667125701904296875;
    float _1029 = _985 * _1011;
    float _1031 = _971 * _1011;
    float _1033 = _977 * _1011;
    float _1035 = _1015 * 6.283185482025146484375;
    float _1037 = sin(_1035);
    float _1039 = _433 * _1029;
    float _1041 = _435 * _1031;
    float _1043 = _437 * _1033;
    float _1045 = -_1039;
    float _1047 = fma(_435, _1033, _1045);
    float _1049 = -_1041;
    float _1051 = fma(_437, _1029, _1049);
    float _1053 = _879 * _1021;
    float _1055 = _1015 * 6.283185482025146484375;
    float _1057 = cos(_1055);
    float _1059 = _1047 * _1047;
    float _1061 = -_1043;
    float _1063 = fma(_433, _1031, _1061);
    float _1065 = _339 * _1053;
    float _1067 = _317 * _1053;
    float _1069 = fma(_1051, _1051, _1059);
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1073 = _1065 * _1025;
    float _1075 = _1027 * 6.283185482025146484375;
    float _1077 = cos(_1075);
    float _1079 = fma(_1063, _1063, _1069);
    float _1081 = _991 * _1037;
    float _1083 = _933 * _1037;
    float _1085 = _1027 * 6.283185482025146484375;
    float _1087 = sin(_1085);
    float _1089 = _991 * _1057;
    float _1091 = _933 * _1057;
    float _1093 = rsqrt(_1079);
    float _1095 = _991 * _1077;
    float _1097 = _933 * _1077;
    float _1099 = _1057 * _1077;
    float _1101 = _1067 * _1071;
    float _1103 = _1095 * _1073;
    float _1105 = -_929;
    float _1107 = _373 + _1105;
    float _1109 = fma(_1087, _1089, _1083);
    float _1111 = -_1073;
    float _1113 = _1087 * _1111;
    float _1115 = -_1081;
    float _1117 = fma(_1087, _1091, _1115);
    float _1119 = _1097 * _1073;
    float _1121 = fma(_1109, _1101, _1103);
    float _1123 = fma(_1099, _1101, _1113);
    float _1125 = -_957;
    float _1127 = _381 + _1125;
    float _1129 = fma(_1117, _1101, _1119);
    float _1131 = _1121 * _1029;
    float _1133 = _1063 * _1093;
    float _1135 = -_927;
    float _1137 = _369 + _1135;
    float _1139 = _1121 * _1033;
    float _1141 = _1051 * _1093;
    float _1143 = fma(_1123, _1133, _1131);
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1147 = _1047 * _1093;
    float _1149 = fma(_1123, _1141, _1139);
    float _1151 = fma(_1129, _435, _1143);
    float _1153 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1145);
    float _1155 = fma(_1129, _433, _1149);
    float _1157 = _381 + _1151;
    float _1159 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1153);
    float _1161 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1163 = _373 + _1155;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1167 = _1157 + _1165;
    float _1169 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1171 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1161);
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1175 = _1163 + _1173;
    float _1177 = _1167 * _1167;
    float _1179 = 1.0 / _1169;
    float _1181 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1171);
    bool _1183 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan(0.5);
    bool _1191 = _1187 || _1189;
    float _1193 = fma(_1175, _1175, _1177);
    float _1195 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1197 = sqrt(_1193);
    float _1199 = _1195 + _1169;
    float _1201 = _1199 * _1179;
    float _1203 = _1201 * 0.5;
    float _1205 = _1121 * _1031;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1209 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1207);
    float _1211 = fma(_1123, _1147, _1205);
    bool _1213 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = 1.0 / _1209;
    float _1217 = fma(_1129, _437, _1211);
    bool _1219 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan(0.5);
    bool _1227 = _1223 || _1225;
    float _1229 = _369 + _1217;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1233 = _1163;
    float _1235 = _1157;
    float _1237 = _1129;
    float _1239 = _1197;
    float _1241 = _1175;
    float _1243 = _1229;
    float _1245 = _1167;
    float _1247 = _1209;
    if (!_1213)
    {
        _1231 = _1229;
    }
    float _1249 = _1231;
    bool _1251 = !_1213;
    float _1253 = _1249;
    if (!_1251)
    {
        float _1255 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1257 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1259 = _1197 + _1257;
        float _1261 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = rsqrt(_1193);
        float _1265 = _1259 * _1255;
        float _1267 = _1265 * 0.15915493667125701904296875;
        float _1269 = _1267 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = _1267 * 6.283185482025146484375;
        float _1275 = sin(_1273);
        float _1277 = _1271 + (-1.0);
        float _1279 = fma(_1275, _1261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1281 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1283 = _1263 * _1279;
        float _1285 = fma(_1229, _1271, _1281);
        float _1287 = fma(_1175, _1283, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1289 = fma(_1167, _1283, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1233 = _1287;
        _1253 = _1285;
        _1235 = _1289;
        _1237 = _1277;
        _1239 = _1267;
    }
    float _1291 = _1233;
    float _1293 = _1253;
    float _1295 = _1235;
    float _1297 = _1237;
    float _1299 = _1239;
    float _1301 = -_929;
    float _1303 = _1301 + _1291;
    float _1305 = -_927;
    float _1307 = _1305 + _1293;
    float _1309 = -_957;
    float _1311 = _1309 + _1295;
    float _1313 = _1299;
    float _1315 = _1307;
    float _1317 = _1303;
    float _1319 = _1311;
    float _1321 = _1293;
    float _1323 = _1297;
    if (_1227)
    {
        _1313 = 1.0;
    }
    float _1325 = _1313;
    float _1327 = _1325;
    if (!_1191)
    {
        float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1331 = _1137 + _1329;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1335 = _1107 + _1333;
        float _1337 = -_373;
        float _1339 = _1337 + _1291;
        float _1341 = -_369;
        float _1343 = _1341 + _1293;
        float _1345 = _1331 * _1331;
        float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1349 = _1127 + _1347;
        float _1351 = -_381;
        float _1353 = _1351 + _1295;
        float _1355 = fma(_1335, _1335, _1345);
        float _1357 = fma(_1349, _1349, _1355);
        float _1359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1361 = sqrt(_1357);
        float _1363 = precise::min(_1361, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1365 = _1363 * _1359;
        float _1367 = fma(_1339, _1365, _1107);
        float _1369 = fma(_1343, _1365, _1137);
        float _1371 = fma(_1353, _1365, _1127);
        _1241 = _1345;
        _1315 = _1369;
        _1317 = _1367;
        _1319 = _1371;
    }
    float _1373 = _1241;
    float _1375 = _1315;
    float _1377 = _1317;
    float _1379 = _1319;
    float _1381 = _1373;
    if (_1227)
    {
        _1243 = 1.0;
    }
    float _1383 = _1243;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1387 = _1215 * _1385;
    float _1389 = _1383;
    if (!_1227)
    {
        float _1391 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1393 = _1391 * 0.15915493667125701904296875;
        float _1395 = _1393 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        float _1399 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1401 = _1399 * 0.15915493667125701904296875;
        float _1403 = _1393 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = 1.0 / _1397;
        float _1409 = _1401 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1405 * _1407;
        float _1415 = _1401 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1421 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1419;
        float _1423 = _1411 * _1413;
        float _1425 = 1.0 / _1421;
        float _1427 = 1.0 / _1423;
        float _1429 = _1417 * _1427;
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1433 = fma(_1387, _1429, _1431);
        float _1435 = _1433 * _1425;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        _1381 = _1401;
        _1245 = _1413;
        _1321 = _1393;
        _1327 = _1437;
    }
    float _1439 = _1381;
    float _1441 = _1245;
    float _1443 = _1321;
    float _1445 = _1327;
    float _1447 = _1441;
    float _1449 = _1439;
    if (!_1227)
    {
        float _1451 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1453 = _1451 * 0.15915493667125701904296875;
        float _1455 = _1453 * 6.283185482025146484375;
        float _1457 = cos(_1455);
        float _1459 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1461 = _1459 * 0.15915493667125701904296875;
        float _1463 = _1453 * 6.283185482025146484375;
        float _1465 = sin(_1463);
        float _1467 = 1.0 / _1457;
        float _1469 = _1461 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        float _1473 = _1465 * _1467;
        float _1475 = _1461 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        float _1479 = _1471 * _1473;
        float _1481 = 1.0 / _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1485 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1483;
        float _1487 = 1.0 / _1485;
        float _1489 = _1477 * _1481;
        float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1493 = fma(_1387, _1489, _1491);
        float _1495 = _1493 * _1487;
        float _1497 = precise::clamp(_1495, 0.0, 1.0);
        float _1499 = -_1497;
        float _1501 = _1499 + 1.0;
        _1447 = _1489;
        _1449 = _1467;
        _1389 = _1501;
    }
    float _1503 = _1447;
    float _1505 = _1449;
    float _1507 = _1389;
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1511 = _1375 + _1509;
    float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1515 = _1377 + _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1519 = _1379 + _1517;
    float _1521 = _1511 * _1511;
    float _1523 = fma(_1515, _1515, _1521);
    float _1525 = fma(_1519, _1519, _1523);
    float _1527 = rsqrt(_1525);
    float _1529 = sqrt(_1525);
    float _1531 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1533 = _1515 * _1531;
    float _1535 = _1519 * _1531;
    float _1537 = _1533 * _1533;
    float _1539 = _1535 * _1535;
    float _1541 = _1537 + _1539;
    float _1543 = sqrt(_1541);
    bool _1545 = _1543 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1549 = _1543 + _1547;
    float _1551 = _1503;
    float _1553 = _1541;
    float _1555 = _1549;
    float _1557 = _1511;
    float _1559 = _1533;
    float _1561 = _1535;
    float _1563 = _1539;
    if (_1545)
    {
        float _1565 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1565;
    }
    float _1567 = _1551;
    if (_1545)
    {
        float _1569 = rsqrt(_1541);
        _1553 = _1569;
    }
    float _1571 = _1553;
    if (_1545)
    {
        float _1573 = _1549 * _1567;
        _1555 = _1573;
    }
    float _1575 = _1555;
    if (_1545)
    {
        float _1577 = _1575 * 0.15915493667125701904296875;
        _1323 = _1577;
    }
    float _1579 = _1323;
    float _1581 = _1443;
    if (_1545)
    {
        float _1583 = _1579 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        _1581 = _1585;
    }
    float _1587 = _1581;
    float _1589 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1591 = precise::max(0.0, _1589);
    float _1593 = _1505;
    float _1595 = _1591;
    float _1597 = _1589;
    if (_1545)
    {
        float _1599 = _1579 * 6.283185482025146484375;
        float _1601 = cos(_1599);
        _1593 = _1601;
    }
    float _1603 = _1593;
    float _1605 = -_1531;
    float _1607 = -_1591;
    float _1609 = fma(_1511, _1605, _1607);
    if (!_1545)
    {
        _1595 = _1537;
    }
    float _1611 = _1595;
    float _1613 = _1611;
    if (_1545)
    {
        float _1615 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1557 = _1615;
    }
    float _1617 = _1557;
    float _1619 = _1587;
    float _1621 = _1617;
    if (_1545)
    {
        float _1623 = fma(_1587, _1617, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1619 = _1623;
    }
    float _1625 = _1619;
    float _1627 = _1625;
    if (!_1545)
    {
        _1621 = _1609;
    }
    float _1629 = _1621;
    float _1631 = _1629;
    if (_1545)
    {
        float _1633 = _1603 + (-1.0);
        _1597 = _1633;
    }
    float _1635 = _1597;
    if (_1545)
    {
        float _1637 = _1571 * _1625;
        _1247 = _1637;
    }
    float _1639 = _1247;
    float _1641 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1545)
    {
        float _1643 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1627 = _1643;
    }
    float _1645 = _1627;
    if (_1545)
    {
        float _1647 = _1533 * _1639;
        _1559 = _1647;
    }
    float _1649 = _1559;
    if (_1545)
    {
        float _1651 = _1535 * _1639;
        _1561 = _1651;
    }
    float _1653 = _1561;
    float _1655 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1641);
    if (_1545)
    {
        float _1657 = fma(_1609, _1603, _1645);
        _1631 = _1657;
    }
    float _1659 = _1631;
    if (_1545)
    {
        float _1661 = _1649 * _1649;
        _1613 = _1661;
    }
    float _1663 = _1613;
    if (_1545)
    {
        float _1665 = _1653 * _1653;
        _1563 = _1665;
    }
    float _1667 = _1563;
    float _1669 = fma(_1659, _1659, _1663);
    float _1671 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1655);
    float _1673 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1675 = _1669 + _1667;
    float _1677 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1679 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1681 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1685 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1683);
    float _1687 = precise::clamp(_1685, 0.0, 1.0);
    float _1689 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1691 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1679);
    float _1693 = rsqrt(_1675);
    float _1695 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1681);
    float _1697 = -_1687;
    float _1699 = _1697 + 1.0;
    float _1701 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1691);
    float _1703 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1673);
    float _1705 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1695);
    float _1707 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1709 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1711 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1713 = abs(_1699);
    float _1715 = log2(_1713);
    float _1717 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1719 = -_1709;
    float _1721 = fma(_1719, _1677, 1.0);
    float _1723 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1703);
    float _1725 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1717);
    float _1729 = _1693 * _1649;
    float _1731 = _1693 * _1659;
    float _1733 = _1693 * _1653;
    float _1735 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1727);
    float _1737 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1739 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1741 = log2(_1721);
    float _1743 = -_1737;
    float _1745 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1743);
    float _1747 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1735);
    float _1749 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1751 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1725);
    float _1753 = -_1733;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1745);
    float _1757 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1759 = 1.0 / _1747;
    float _1761 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1751);
    float _1763 = fma(_1755, -0.5, 0.5);
    float _1765 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1757);
    float _1767 = fma(_1755, 0.5, 0.5);
    float _1769 = _1731 + 1.0;
    float _1771 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1765);
    float _1773 = exp2(_1749);
    float _1775 = fma(_1767, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1777 = _1741 * 0.693147182464599609375;
    float _1779 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1771);
    float _1781 = fma(_1767, _1775, -0.212114393711090087890625);
    float _1783 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1785 = sqrt(_1763);
    float _1787 = _1779 * _1759;
    float _1789 = fma(_1767, _1781, 1.570728778839111328125);
    float _1791 = fma(_1787, 0.5, 0.5);
    float _1793 = -_1731;
    float _1795 = fma(_1773, _1769, _1793);
    float _1797 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1761);
    float _1799 = fma(_1795, 0.5, 0.5);
    float _1801 = _1797 * _1759;
    float _1803 = _1785 * 0.636619746685028076171875;
    float _1805 = fma(_1801, -0.5, 0.5);
    float _1807 = -_1789;
    float _1809 = fma(_1803, _1807, 1.0);
    float3 _5636 = float3(_1791, _1805, _1783);
    float _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5636, float3(0.0), isnan(_5636)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5636, float3(0.0), isnan(_5636)), level(0.0)).x;
    float3 _5647 = float3(_1791, _1805, _1783);
    float4 _1814 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5647, float3(0.0), isnan(_5647)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5647, float3(0.0), isnan(_5647)), level(0.0)).xyzw;
    float _1816 = _1814.x;
    float _1818 = _1814.y;
    float _1820 = _1814.z;
    float _1822 = _1814.w;
    float2 _5664 = float2(_1809, _1799);
    float3 _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5664, float2(0.0), isnan(_5664)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5664, float2(0.0), isnan(_5664)), level(0.0)).xyz;
    float _1828 = _1826.x;
    float _1830 = _1826.y;
    float _1832 = _1826.z;
    float _1834 = float(uint(_739));
    float _1836 = trunc(_803);
    int _1838 = int(_1836);
    int _1840 = ~_739;
    int _1842 = _1840 + 1;
    out.m_68.x = _1107;
    out.m_68.y = _1137;
    out.m_68.z = _1127;
    bool _1844 = _351 > 0.5;
    float _1846 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1848 = -_1091;
    float _1850 = fma(_1087, _1081, _1848);
    float _1852 = _1037 * _1077;
    out.m_70.w = _859;
    float _1854 = 1.0 / _1834;
    out.m_72.x = _1067;
    out.m_74.x = _1377;
    out.m_74.y = _1375;
    out.m_74.z = _1379;
    float _1856 = float(uint(_1838));
    float _1858 = exp2(_1846);
    int _1860 = as_type<int>(_1854) + (-2);
    float _1862 = as_type<float>(_1860) * _1856;
    float _1864 = -_1858;
    float _1866 = _1864 + 1.0;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1870 = _1868 != 0;
    float _1872 = trunc(_1862);
    float _1874 = precise::max(_1872, 0.0);
    uint _1877 = uint(_1874);
    float _1879 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1881 = !_1870;
    float _1883 = _1881 ? 7.345489978790283203125 : 1.0;
    float _1885 = _1883 * _349;
    float _1887 = floor(_1885);
    int _1889 = _1842 * int(_1877);
    int _1891 = _1889 + _1838;
    float _1893 = float(uint(_1891));
    float _1895 = as_type<float>(_1860) * _1893;
    float _1897 = trunc(_1895);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    int _1903 = int(_1877) + int(_1901);
    float _1905 = float(_1838);
    int _1907 = _1842 * _1903;
    int _1909 = _1907 + _1838;
    bool _1911 = _1905 >= _785;
    bool _1913 = isnan(_1905);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(_785);
    bool _1919 = _1915 || _1917;
    float _1921 = float(_1919);
    float _1923 = -_1887;
    float _1925 = _1885 + _1923;
    float _1927 = _797 * _163;
    int _1929 = _739 + (-1);
    bool _1931 = uint(_1909) >= uint(_739);
    float _1933 = trunc(_1921);
    int _1935 = int(_1933);
    bool _1937 = !_1931;
    int _1939 = _1937 ? 0 : (-1);
    bool _1941 = _739 == 0;
    int _1943 = ~_1903;
    int _1945 = _1943 + _1939;
    int _1947 = _1945 + 1;
    float _1949 = _1925 * _785;
    float _1951 = trunc(_1927);
    int _1953 = int(_1951);
    int _1955 = _739 * _1947;
    int _1957 = _1955 + _1838;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1961 = _1959 != 0;
    int _1963 = ~_1935;
    int _1965 = _1963 + 1;
    int _1967 = _1965 + 1;
    bool _1969 = !_1941;
    int _1971 = _1969 ? _1957 : (-1);
    float _1973 = trunc(_1949);
    int _1975 = int(_1973);
    bool _1977 = !_1961;
    int _1979 = _1977 ? 0 : 1;
    int _1981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1983 = _1981 != 0;
    int _1985 = _1971 * _1967;
    int _1987 = abs(_585);
    int _1989 = abs(_1979);
    int _1991 = _1935 * _1929;
    int _1993 = _1991 + _1985;
    int _1995 = abs(_665);
    bool _1997 = !_1983;
    int _1999 = _1997 ? 0 : 1;
    int _2001 = abs(_707);
    int _2003 = _1993 * _1987;
    int _2005 = _1975 * _1989;
    int _2007 = _2005 + _1838;
    int _2009 = abs(_1999);
    int _2011 = _1953 * _1995;
    int _2013 = _2011 + _2003;
    bool _2015 = _349 > 0.5;
    bool _2017 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2019 = isnan(_309);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    int _2029 = _2007 * _2001;
    int _2031 = _2029 + _2013;
    int _2033 = _1975 * _2009;
    int _2035 = _2033 + _2031;
    int _2037 = ~_739;
    int _2039 = _2037 + 1;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2045 = -_2027;
    float _2047 = _2045 + 1.0;
    bool _2049 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2051 = isnan(_309);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2057 = _2053 || _2055;
    float _2059 = float(_2057);
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2065 = float(uint(_2035));
    float _2067 = 1.0 / _2043;
    float _2069 = as_type<float>(_1860) * _2065;
    int _2071 = ~_739;
    int _2073 = _2071 + 1;
    float _2075 = 1.0 / _2063;
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2081 = trunc(_2069);
    float _2083 = precise::max(_2081, 0.0);
    uint _2085 = uint(_2083);
    float _2087 = 1.0 / _2079;
    int _2089 = _2039 * int(_2085);
    int _2091 = _2089 + _2035;
    float _2093 = float(uint(_2091));
    float _2095 = as_type<float>(_1860) * _2093;
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2103 = _2101 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2105 = trunc(_2095);
    float _2107 = precise::max(_2105, 0.0);
    uint _2109 = uint(_2107);
    float _2111 = _2099 * _2087;
    bool _2113 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2115 = isnan(_309);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2121 = _2117 || _2119;
    float _2123 = float(_2121);
    float _2125 = _2103 * _2067;
    bool _2127 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2129 = isnan(_309);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2135 = _2131 || _2133;
    float _2137 = float(_2135);
    float _2139 = _2123 * _2047;
    float _2141 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2143 = _309 + _2141;
    float _2145 = fma(_2111, _2143, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2149 = _309 + _2147;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2153 = _309 + _2151;
    int _2155 = int(_2085) + int(_2109);
    float _2157 = -_2123;
    float _2159 = _2157 + 1.0;
    float _2161 = fma(_2125, _2149, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2163 = -_183;
    int _2165 = _1844 ? as_type<int>(_2163) : as_type<int>(_183);
    float _2167 = _2059 * _2159;
    float _2169 = -_2059;
    float _2171 = _2169 + 1.0;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2173;
    float _2177 = _2137 * _2171;
    int _2179 = _2073 * _2155;
    int _2181 = _2179 + _2035;
    float _2183 = _2175 * _2075;
    float _2185 = float(uint(_2007));
    float _2187 = _2145 * _2177;
    float _2189 = -_2137;
    float _2191 = _2189 + 1.0;
    bool _2193 = uint(_2181) >= uint(_739);
    float _2195 = fma(_2183, _2153, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2197 = as_type<float>(_1860) * _2185;
    float _2199 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2187);
    bool _2201 = !_2193;
    int _2203 = _2201 ? 0 : (-1);
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2207 = _2205 != 0;
    float _2209 = trunc(_2197);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    int _2215 = ~_2155;
    int _2217 = _2215 + _2203;
    int _2219 = _2217 + 1;
    float _2221 = -_179;
    int _2223 = _2015 ? as_type<int>(_2221) : as_type<int>(_179);
    int _2225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2227 = _2225 != 0;
    int _2229 = _739 * _2219;
    int _2231 = _2229 + _2035;
    float _2233 = fma(_2161, _2167, _2199);
    bool _2235 = !_2207;
    float _2237 = _2235 ? _179 : as_type<float>(_2223);
    float _2239 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2241 = !_2227;
    float _2243 = _2241 ? _183 : as_type<float>(_2165);
    float _2245 = fma(_2195, _2139, _2233);
    bool _2247 = !_1941;
    int _2249 = _2247 ? _2231 : (-1);
    float _2251 = _2237 + 0.5;
    float _2253 = _2243 + (-0.5);
    int _2255 = _2249 >> 31;
    float _2257 = fma(_2027, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2245);
    float _2259 = fma(_2251, (*spvDescriptorSet0.vp_c9)._m0[80].x, _497);
    float _2261 = -_801;
    float _2263 = _2261 + 1.0;
    int _2265 = _2255 & 3;
    float _2267 = -_2253;
    float _2269 = -_417;
    float _2271 = fma(_2267, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2269);
    float _2273 = -_807;
    float _2275 = _2273 + 1.0;
    int _2277 = _2073 * int(_2213);
    int _2279 = _2277 + _2007;
    int _2281 = _2249 + _2265;
    float _2283 = -_2263;
    float _2285 = fma(_2237, _2283, _2259);
    float _2287 = fma(_2243, _2275, _2271);
    float _2289 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2291 = _2281 >> 2;
    float _2293 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_76.x = _2285;
    out.m_76.y = _2287;
    int _2295 = _2291 << 4;
    int _2297 = _2295 + 368;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    uint _2303 = uint(int(uint(_2297) >> uint(2)));
    uint _2305 = uint(int(uint(int(_2303)) >> uint(2)));
    int _2307 = int(_2303) & 3;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[int(_2305)][_2307];
    int _2311 = int(_2303) + 1;
    uint _2313 = uint(int(uint(_2311) >> uint(2)));
    int _2315 = _2311 & 3;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[int(_2313)][_2315];
    float _2319 = float(uint(_2279));
    float _2321 = _2299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2327 = _2325 != 0;
    float _2329 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2331 = as_type<float>(_1860) * _2319;
    int _2333 = _2249 & 3;
    bool _2335 = _2333 != 0;
    int _2337 = _2297 + 8;
    uint _2339 = uint(int(uint(_2337) >> uint(2)));
    uint _2341 = uint(int(uint(int(_2339)) >> uint(2)));
    int _2343 = int(_2339) & 3;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[int(_2341)][_2343];
    int _2347 = int(_2339) + 1;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    int _2351 = _2347 & 3;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[int(_2349)][_2351];
    int _2355 = _2249 & 3;
    bool _2357 = _2355 != 0;
    float _2359 = trunc(_2331);
    float _2361 = precise::max(_2359, 0.0);
    uint _2363 = uint(_2361);
    bool _2365 = uint(_2333) > 1u;
    float _2367 = _2323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2369 = _2333 != 3;
    int _2371 = _2357 ? 0 : 1;
    bool _2373 = uint(_2333) >= 2u;
    out.m_78.x = _2321;
    out.m_78.y = _2329;
    out.m_78.z = _2367;
    out.m_78.w = _2289;
    int _2375 = ~_739;
    int _2377 = _2375 + 1;
    bool _2379 = !_2335;
    int _2381 = _2379 ? 0 : 1;
    float _2383 = _1879 * _1811;
    bool _2385 = _2333 != 3;
    int _2387 = int(_2213) + int(_2363);
    int _2389 = ~_2371;
    int _2391 = _2389 + 1;
    int _2393 = _2391 + 1;
    int _2395 = _2377 * _2387;
    int _2397 = _2395 + _2007;
    int _2399 = _2393;
    float _2401 = _1797;
    float _2403 = _1779;
    if (!_2365)
    {
        int _2405 = ~_2371;
        int _2407 = _2405 + 1;
        _2399 = _2407;
    }
    int _2409 = _2399;
    float _2411 = _1095 * _1031;
    int _2413 = _2373 ? 0 : 1;
    float _2415 = fma(_1087, _1083, _1089);
    int _2417 = abs(_2409);
    float _2419 = -_1087;
    float _2421 = fma(_2419, _1147, _2411);
    int _2423 = ~_2413;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    float _2429 = _1832 * _2383;
    int _2431 = _2427;
    if (_2369)
    {
        int _2433 = ~_2413;
        int _2435 = _2433 + 1;
        _2431 = _2435;
    }
    int _2437 = _2431;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2441 = uint(_2397) >= uint(_739);
    int _2443 = abs(_2381);
    out.m_80.w = _2439;
    bool _2445 = !_2441;
    int _2447 = _2445 ? 0 : (-1);
    int _2449 = abs(_2437);
    int _2451 = ~_2417;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = ~_2387;
    int _2459 = _2457 + _2447;
    int _2461 = _2459 + 1;
    bool _2463 = !_2385;
    int _2465 = _2463 ? 0 : (-1);
    int _2467 = _2455 * as_type<int>(_2317);
    int _2469 = ~_2443;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    int _2475 = _739 * _2461;
    int _2477 = _2475 + _2007;
    float _2479 = _1095 * _1033;
    bool _2481 = !_2327;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _2473 * as_type<int>(_2309);
    int _2487 = _2485 + _2467;
    int _2489 = abs(_2465);
    float _2491 = -_1087;
    float _2493 = fma(_2491, _1141, _2479);
    int _2495 = ~_2449;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    float _2501 = _1095 * _1029;
    int _2503 = abs(_2483);
    float _2505 = fma(_1097, _433, _2493);
    int _2507 = ~_2489;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _2499 * as_type<int>(_2345);
    int _2515 = _2513 + _2487;
    float _2517 = _1109 * _1031;
    float _2519 = _1109 * _1033;
    float _2521 = _1850 * _1031;
    int _2523 = _2511 * as_type<int>(_2353);
    int _2525 = _2523 + _2515;
    int _2527 = ~_2503;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    float _2533 = fma(_1099, _1141, _2519);
    float _2535 = fma(_1099, _1147, _2517);
    float _2537 = fma(_1852, _1147, _2521);
    float _2539 = _1109 * _1029;
    int _2541 = _2525 * _2531;
    bool _2543 = !_1941;
    int _2545 = _2543 ? _2477 : (-1);
    float _2547 = -_1087;
    float _2549 = fma(_2547, _1133, _2501);
    float _2551 = fma(_1117, _433, _2533);
    float _2553 = fma(_1117, _437, _2535);
    float _2555 = _2293 * _2505;
    int _2557 = _2545 * _2503;
    int _2559 = _2557 + _2541;
    float _2561 = fma(_1097, _437, _2421);
    float _2563 = fma(_2415, _437, _2537);
    float _2565 = _1850 * _1033;
    float _2567 = _1850 * _1029;
    float _2569 = _2293 * _2561;
    float _2571 = fma(_1099, _1133, _2539);
    float _2573 = fma(_1097, _435, _2549);
    float _2575 = fma(_2239, _2551, _2555);
    float _2577 = fma(_1852, _1141, _2565);
    float _2579 = fma(_2239, _2553, _2569);
    float _2581 = fma(_1852, _1133, _2567);
    float _2583 = fma(_1117, _435, _2571);
    float _2585 = _2293 * _2573;
    float _2587 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2589 = float(_2559);
    float _2591 = _1747 * 0.5;
    float _2593 = _2563 + _2579;
    float _2595 = fma(_2415, _433, _2577);
    float _2597 = fma(_2415, _435, _2581);
    float _2599 = -_1879;
    float _2601 = _2599 + 1.0;
    float _2603 = fma(_2239, _2583, _2585);
    float _2605 = _1822 * _2383;
    float _2607 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2587);
    float _2609 = fma(_1797, -0.5, _2591);
    float _2611 = _2595 + _2575;
    float _2613 = _1822 * _2601;
    float _2615 = _2597 + _2603;
    float _2617 = fma(_1828, _2605, _1816);
    float _2619 = fma(_1830, _2605, _1818);
    float _2621 = fma(_1822, _2429, _1820);
    float _2623 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2607);
    out.m_82.x = _2611;
    out.m_82.y = _2593;
    out.m_82.z = _2615;
    bool _2625 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2627 = isnan(_1529);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2633 = _2629 || _2631;
    float _2635 = _1779 + _1747;
    float _2637 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2623);
    out.m_84.x = _2617;
    out.m_84.y = _2619;
    out.m_84.z = _2621;
    out.m_84.w = _2613;
    float _2639 = _2635 * 0.5;
    float _2641 = _2637 + _1747;
    out.m_86.x = _2589;
    float _2643 = _2641 * 0.5;
    out.gl_Position.x = _1779;
    out.gl_Position.y = _1797;
    out.gl_Position.z = _2637;
    out.gl_Position.w = _1747;
    float _2645 = _2605;
    float _2647 = _2637;
    float _2649 = _2639;
    if (!_2633)
    {
        _2645 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2651 = _2645;
    float _2653 = _1445 * _1507;
    out.m_88.x = _2639;
    out.m_88.y = _2609;
    out.m_88.z = _2643;
    out.m_88.w = _1747;
    float _2655 = _2653;
    float _2657 = _2651;
    float _2659 = _2651;
    if (!_2633)
    {
        _2401 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2661 = _2401;
    float _2663 = _2661;
    float _2665 = _2661;
    if (!_2633)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2667 = _2647;
    float _2669 = _2667;
    float _2671 = _2667;
    if (!_2633)
    {
        _2403 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2673 = _2403;
    float _2675 = _2653 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2677 = _2673;
    float _2679 = _2673;
    if (!_2633)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2681 = _2649;
    float _2683 = _2681;
    float _2685 = _2681;
    if (!_2633)
    {
        _2655 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2687 = _2655;
    bool _2689 = !_2633;
    float _2691 = _2687;
    float _2693 = _2687;
    if (!_2689)
    {
        bool _2695 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2697 = isnan(_1529);
        bool _2699 = _2695 || _2697;
        bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2703 = _2699 || _2701;
        if (!_2703)
        {
            float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2707 = _1529 + _2705;
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2711 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2709;
            float _2713 = 1.0 / _2711;
            float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2735 = _2707 * _2713;
            float _2737 = precise::clamp(_2735, 0.0, 1.0);
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2743 = fma(_2737, _2717, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2745 = fma(_2737, _2741, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2747 = fma(_2737, _2721, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2749 = fma(_2737, _2725, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2751 = fma(_2737, _2729, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2753 = fma(_2737, _2733, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2685 = _2743;
            _2659 = _2751;
            _2665 = _2745;
            _2679 = _2749;
            _2671 = _2747;
            _2693 = _2753;
            _2755 = true;
        }
        else
        {
            bool _2757 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2759 = isnan(_1529);
            bool _2761 = _2757 || _2759;
            bool _2763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2765 = _2761 || _2763;
            if (!_2765)
            {
                _2663 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2767 = _2663;
            _2665 = _2767;
            if (!_2765)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2769 = _2683;
            _2685 = _2769;
            if (!_2765)
            {
                _2669 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2771 = _2669;
            _2671 = _2771;
            if (!_2765)
            {
                _2677 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2773 = _2677;
            _2679 = _2773;
            if (!_2765)
            {
                _2657 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2775 = _2657;
            _2659 = _2775;
            if (!_2765)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2777 = _2691;
            bool _2779 = !_2765;
            _2693 = _2777;
            if (!_2779)
            {
                bool _2781 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2783 = isnan(_1529);
                bool _2785 = _2781 || _2783;
                bool _2787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2789 = _2785 || _2787;
                if (!_2789)
                {
                    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2793 = _1529 + _2791;
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2797 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2795;
                    float _2799 = 1.0 / _2797;
                    float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2805 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2821 = _2793 * _2799;
                    float _2823 = precise::clamp(_2821, 0.0, 1.0);
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2829 = fma(_2823, _2803, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2831 = fma(_2823, _2827, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2833 = fma(_2823, _2807, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2835 = fma(_2823, _2811, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2837 = fma(_2823, _2815, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2839 = fma(_2823, _2819, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2685 = _2829;
                    _2659 = _2837;
                    _2665 = _2831;
                    _2679 = _2835;
                    _2671 = _2833;
                    _2693 = _2839;
                    _2755 = true;
                }
                else
                {
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2659 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2665 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2679 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2671 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2755 = false;
    float _2841 = _2685;
    float _2843 = _2659;
    float _2845 = _2665;
    float _2847 = _2679;
    float _2849 = _2671;
    float _2851 = _2693;
    float _2853 = fma(_2593, -0.5, 0.5);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = -_2841;
    float _2859 = _2857 + _2843;
    float _2861 = _2675 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2863 = -_2845;
    float _2865 = _2863 + _2847;
    out.m_90.x = 0.0;
    float _2867 = fma(_2855, _2859, _2841);
    float _2869 = fma(_2855, _2865, _2845);
    out.m_51.x = _2861;
    float _2871 = -_2849;
    float _2873 = _2871 + _2851;
    float _2875 = _2867 * 0.586610972881317138671875;
    bool _2877 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2879 = fma(_2855, _2873, _2849);
    float _2881 = fma(_2869, 0.298911988735198974609375, _2875);
    bool _2883 = _1445 > 0.0;
    bool _2885 = isnan(_1445);
    bool _2887 = _2883 || _2885;
    bool _2889 = isnan(0.0);
    bool _2891 = _2887 || _2889;
    float _2893 = fma(_2879, 0.114477999508380889892578125, _2881);
    bool _2895 = _1507 <= 0.0;
    bool _2897 = !_2891;
    bool _2899 = _2895 || _2897;
    float _2901 = -_2893;
    float _2903 = _2869 + _2901;
    float _2905 = -_2893;
    float _2907 = _2867 + _2905;
    float _2909 = -_2893;
    float _2911 = _2879 + _2909;
    float _2913 = fma(_2903, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2893);
    float _2915 = fma(_2907, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2893);
    float _2917 = fma(_2911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2893);
    bool _2919 = !_2877;
    if (!_2919)
    {
        float _2921 = -_1375;
        float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2925 = -_1377;
        float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2929 = -_1379;
        float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2933 = _2923 * _2923;
        float _2935 = fma(_2927, _2927, _2933);
        float _2937 = fma(_2931, _2931, _2935);
        float _2939 = sqrt(_2937);
        float _2941 = rsqrt(_2937);
        float _2943 = -_2939;
        float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2947 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2949 = precise::clamp(_2947, 0.0, 1.0);
        float _2951 = _2927 * _2941;
        float _2953 = _2923 * _2941;
        float _2955 = abs(_2949);
        float _2957 = log2(_2955);
        float _2959 = _2931 * _2941;
        float _2961 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2963 = _2593 * _2953;
        float _2965 = -_2953;
        float _2967 = -_2961;
        float _2969 = fma(_2965, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2967);
        float _2971 = fma(_2611, _2951, _2963);
        float _2973 = -_2959;
        float _2975 = fma(_2973, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2969);
        float _2977 = fma(_2615, _2959, _2971);
        float _2979 = precise::clamp(_2977, 0.0, 1.0);
        float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2983 = _2975 + _2981;
        float _2985 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2987 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2989 = precise::clamp(_2987, 0.0, 1.0);
        float _2991 = exp2(_2985);
        float _2993 = _2991 * _2989;
        float _2995 = _2979 * _2993;
        float _2997 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3001 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2997;
        out.m_90.y = _2999;
        out.m_90.z = _3001;
    }
    out.m_70.x = _2913;
    out.m_70.y = _2915;
    out.m_70.z = _2917;
    if (!_2899)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3003 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3003;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2755 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = in.m_46.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = _106;
    float _125 = _115;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_119)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3071 = as_type<float>(_133);
        out.gl_Position.z = _3071;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _137 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_106);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = float(_111);
    bool _149 = _115 >= _147;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    if (_153)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _123;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _135 = as_type<int>(_157);
    }
    int _159 = _135;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3126 = as_type<float>(_159);
        out.gl_Position.z = _3126;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = 1.0 / _147;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _115 * _163;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_165;
    float _187 = _167;
    float _205;
    if (!_185)
    {
        float _189 = in.m_56.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        _205 = _167;
    }
    _207 = false;
    float _209 = _205;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = in.m_58.x;
    float _217 = in.m_58.y;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    bool _235 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_209);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = -_229;
    float _249 = _247 + 1.0;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _251;
    float _255 = 1.0 / _233;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = _245 * _249;
    float _261 = -_245;
    float _263 = _261 + 1.0;
    float _265 = _213 * _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _267;
    float _271 = fma(_253, _265, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _273 = fma(_269, _265, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _275 = _271 * _259;
    float _277 = _273 * _259;
    float _279 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].x, _275);
    float _281 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[143].y, _277);
    float _283 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].x, _279);
    float _285 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[144].y, _281);
    float _287 = _283 * _215;
    float _289 = _285 * _217;
    bool _291 = !_257;
    if (!_291)
    {
        float _293 = in.m_56.x;
        float _295 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _297 = _293 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _301 = _299 * _295;
        float _303 = floor(_301);
        float _305 = -_303;
        float _307 = _301 + _305;
        _187 = _307;
    }
    float _309 = _187;
    float _311 = in.m_44.x;
    float _313 = in.m_44.y;
    float _315 = in.m_44.z;
    float _317 = _287 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _319 = in.m_60.x;
    float _321 = in.m_60.y;
    float _323 = in.m_60.z;
    float _325 = in.m_60.w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _329 = in.m_62.x;
    float _331 = in.m_62.y;
    float _333 = in.m_62.z;
    float _335 = in.m_62.w;
    float _337 = _317 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _339 = _289 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _341 = in.m_64.x;
    float _343 = in.m_64.y;
    float _345 = in.m_64.z;
    float _347 = in.m_64.w;
    float _349 = in.m_56.x;
    float _351 = in.m_56.y;
    float _353 = _313 * _321;
    float _355 = _313 * _331;
    float _357 = fma(_311, _319, _353);
    float _359 = _313 * _343;
    float _361 = fma(_311, _329, _355);
    float _363 = fma(_315, _323, _357);
    float _365 = fma(_311, _341, _359);
    float _367 = fma(_315, _333, _361);
    float _369 = _363 + _325;
    float _371 = fma(_315, _345, _365);
    float _373 = _367 + _335;
    float _375 = -_369;
    float _377 = _375 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _379 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _381 = _371 + _347;
    float _383 = -_373;
    float _385 = _383 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _387 = _377 * _377;
    float _389 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _391 = -_381;
    float _393 = _391 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _395 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _397 = fma(_385, _385, _387);
    float _399 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _401 = fma(_393, _393, _397);
    float _403 = fma(_399, -2.0, _327);
    float _405 = -_389;
    float _407 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _405);
    float _409 = -_395;
    float _411 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _409);
    float _413 = rsqrt(_401);
    float _415 = in.m_56.z;
    float _417 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _403);
    float _419 = _411 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _421 = -_419;
    float _423 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[1].x, _421);
    float _425 = -_379;
    float _427 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _425);
    float _429 = _427 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _431 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _433 = _385 * _413;
    float _435 = _393 * _413;
    float _437 = _377 * _413;
    float _439 = -_431;
    float _441 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _439);
    float _443 = _433 * _433;
    float _445 = _351 * 2.0;
    float _447 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[1].w, _423);
    float _449 = fma(_435, _435, _443);
    float _451 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _453 = -_429;
    float _455 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[1].y, _453);
    float _457 = _447 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _459 = rsqrt(_449);
    float _461 = -_451;
    float _463 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _461);
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _467 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _469 = _441 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _471 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[1].w, _455);
    float _473 = _349 * 2.0;
    float _475 = -_467;
    float _477 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _475);
    float _479 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _481 = log2(_479);
    float _483 = -_457;
    float _485 = fma(_471, (*spvDescriptorSet0.vp_c8)._m0[0].x, _483);
    float _487 = -_465;
    float _489 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[77].x, _487);
    float _491 = _415 * 2.0;
    float _493 = _411 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _495 = -_115;
    float _497 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[76].x, _489);
    float _499 = _435 * _459;
    float _501 = floor(_473);
    float _503 = _433 * _459;
    float _505 = -_493;
    float _507 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[1].x, _505);
    float _509 = -_499;
    float _511 = _435 * _509;
    float _513 = -_499;
    float _515 = _437 * _513;
    float _517 = -_511;
    float _519 = fma(_433, _503, _517);
    float _521 = floor(_491);
    float _523 = _437 * _503;
    float _525 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[1].w, _507);
    float _527 = _519 * _519;
    float _529 = -_469;
    float _531 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _529);
    float _533 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[0].z, _485);
    float _535 = fma(_523, _523, _527);
    float _537 = floor(_445);
    bool _539 = _501 > 0.0;
    float _541 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[1].z, _531);
    bool _543 = _501 >= 0.0;
    bool _545 = isnan(_501);
    bool _547 = _543 || _545;
    bool _549 = isnan(0.0);
    bool _551 = _547 || _549;
    float _553 = fma(_515, _515, _535);
    float _555 = _351 + _349;
    float _557 = -_541;
    float _559 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[0].w, _533);
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _571 = _569 != 0;
    float _573 = rsqrt(_553);
    float _575 = _351 + _415;
    float _577 = _481 * _115;
    float _579 = _555 + (-1.0);
    float _581 = _575 + (-1.0);
    bool _583 = !_567;
    int _585 = _583 ? 0 : 1;
    float _587 = _411 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _589 = _521 >= 0.0;
    bool _591 = isnan(_521);
    bool _593 = _589 || _591;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    float _599 = 1.0 / _559;
    float _601 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _603 = _537 > 0.0;
    float _605 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _607 = _597 ? 0 : 1;
    float _609 = -_587;
    float _611 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[0].x, _609);
    bool _613 = _537 >= 0.0;
    bool _615 = isnan(_537);
    bool _617 = _613 || _615;
    bool _619 = isnan(0.0);
    bool _621 = _617 || _619;
    float _623 = _427 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    bool _625 = _521 > 0.0;
    float _627 = exp2(_577);
    float _629 = _411 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _631 = _519 * _573;
    float _633 = precise::clamp(_631, 0.0, 1.0);
    float _635 = fma(_441, (*spvDescriptorSet0.vp_c8)._m0[0].w, _611);
    float _637 = -_623;
    float _639 = fma(_407, (*spvDescriptorSet0.vp_c8)._m0[0].y, _637);
    float _641 = -_629;
    float _643 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[0].x, _641);
    float _645 = -_633;
    float _647 = _645 + 1.0;
    float _649 = fma(_635, _599, -1.0);
    float _651 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _653 = int(_651);
    float _655 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[0].w, _643);
    float _657 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[0].w, _639);
    float _659 = _647 * _599;
    float _661 = fma(_647, _649, 1.0);
    bool _663 = !_563;
    int _665 = _663 ? 0 : 1;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _669 = -_627;
    float _671 = _669 + 1.0;
    int _673 = ~_607;
    int _675 = _673 + 1;
    int _677 = _675 + 1;
    float _679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _681 = _369 + _679;
    bool _683 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _685 = isnan(0.0);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _691 = _687 || _689;
    float _693 = _657 * _659;
    int _695 = _677;
    if (!_625)
    {
        int _697 = ~_607;
        int _699 = _697 + 1;
        _695 = _699;
    }
    int _701 = _695;
    float _703 = _661 * _661;
    bool _705 = !_571;
    int _707 = _705 ? 0 : 1;
    float _709 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[78].z, _667);
    float _711 = float(_653);
    float _713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _715 = _373 + _713;
    float _717 = _691 ? _671 : 0.0;
    float _719 = _681 * _681;
    int _721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _723 = _721 != 0;
    int _725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _727 = _725 != 0;
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _731 = _729 != 0;
    float _733 = _655 * _659;
    float _735 = fma(_693, _693, _703);
    float _737 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _739 = int(_737);
    int _741 = _551 ? 0 : 1;
    float _743 = fma(_715, _715, _719);
    bool _745 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _747 = isnan(1.0);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _753 = _749 || _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _757 = 1.0 + _755;
    bool _759 = !_723;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_733, _733, _735);
    float _765 = 1.0 / _711;
    int _767 = abs(_761);
    float _769 = in.m_66.x;
    float _771 = in.m_66.y;
    float _773 = in.m_66.z;
    int _775 = _621 ? 0 : 1;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _779 = 1.0 / _757;
    float _781 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _783 = _381 + _781;
    float _785 = float(_739);
    float _787 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].w, _777);
    float _789 = fma(_783, _783, _743);
    int _791 = ~_775;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    float _797 = _785 * _115;
    float _799 = rsqrt(_763);
    float _801 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _709);
    float _803 = _765 * _115;
    float _805 = float(_701);
    float _807 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _787);
    float _809 = float(_767);
    float _811 = sqrt(_789);
    int _813 = _795;
    if (_753)
    {
        float _815 = _717 * _779;
        _125 = _815;
    }
    float _817 = _125;
    if (!_603)
    {
        int _819 = ~_775;
        int _821 = _819 + 1;
        _813 = _821;
    }
    int _823 = _813;
    float _825 = _809 * _805;
    int _827 = ~_741;
    int _829 = _827 + 1;
    int _831 = _829 + 1;
    int _833 = _831;
    if (!_539)
    {
        int _835 = ~_741;
        int _837 = _835 + 1;
        _833 = _837;
    }
    int _839 = _833;
    float _841 = _825 * (-2.0);
    float _843 = _661 * _799;
    float _845 = _733 * _799;
    float _847 = fma(_841, _769, _769);
    float _849 = _435 * _843;
    bool _851 = !_727;
    int _853 = _851 ? 0 : 1;
    float _855 = _811 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _857 = fma(_605, _841, _605);
    float _859 = precise::min(_337, _855);
    float _861 = _693 * _799;
    float _863 = -_845;
    float _865 = -_849;
    float _867 = fma(_437, _863, _865);
    float _869 = -_845;
    float _871 = _433 * _869;
    float _873 = float(_823);
    float _875 = -_861;
    float _877 = _437 * _875;
    float _879 = rsqrt(_789);
    float _881 = -_861;
    float _883 = -_871;
    float _885 = fma(_435, _881, _883);
    bool _887 = !_731;
    int _889 = _887 ? 0 : 1;
    float _891 = -_877;
    float _893 = fma(_433, _843, _891);
    int _895 = abs(_853);
    float _897 = _885 * _885;
    int _899 = abs(_889);
    float _901 = _349 + (-0.5);
    float _903 = fma(_867, _867, _897);
    float _905 = float(_839);
    float _907 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[196].x, _847);
    float _909 = fma(_893, _893, _903);
    float _911 = float(_895);
    float _913 = fma(_857, _817, _907);
    float _915 = float(_899);
    float _917 = rsqrt(_909);
    float _919 = _879 * _859;
    float _921 = _911 * _905;
    float _923 = _913 * 0.15915493667125701904296875;
    float _925 = _915 * _873;
    float _927 = _681 * _919;
    float _929 = _715 * _919;
    float _931 = _923 * 6.283185482025146484375;
    float _933 = sin(_931);
    float _935 = -_927;
    float _937 = _681 + _935;
    float _939 = _921 * (-2.0);
    float _941 = -_929;
    float _943 = _715 + _941;
    float _945 = _937 * _937;
    float _947 = fma(_601, _939, _601);
    float _949 = fma(_939, _771, _771);
    float _951 = _867 * _917;
    float _953 = _885 * _917;
    float _955 = _893 * _917;
    float _957 = _783 * _919;
    float _959 = _435 * _951;
    float _961 = fma(_943, _943, _945);
    float _963 = _437 * _955;
    float _965 = -_957;
    float _967 = _783 + _965;
    float _969 = -_959;
    float _971 = fma(_433, _955, _969);
    float _973 = _433 * _953;
    float _975 = -_963;
    float _977 = fma(_435, _953, _975);
    float _979 = fma(_967, _967, _961);
    float _981 = _971 * _971;
    float _983 = -_973;
    float _985 = fma(_437, _951, _983);
    float _987 = _351 + (-0.5);
    float _989 = _923 * 6.283185482025146484375;
    float _991 = cos(_989);
    float _993 = fma(_977, _977, _981);
    float _995 = _415 + _349;
    float _997 = fma(_987, (*spvDescriptorSet0.vp_c9)._m0[196].y, _949);
    float _999 = fma(_985, _985, _993);
    float _1001 = _995 + (-1.0);
    float _1003 = _925 * (-2.0);
    float _1005 = fma(_947, _817, _997);
    float _1007 = _415 + (-0.5);
    float _1009 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1011 = rsqrt(_999);
    float _1013 = fma(_1003, _773, _773);
    float _1015 = _1005 * 0.15915493667125701904296875;
    float _1017 = fma(_1009, _1003, _1009);
    float _1019 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1013);
    float _1021 = sqrt(_979);
    float _1023 = fma(_1017, _817, _1019);
    float _1025 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _183);
    float _1027 = _1023 * 0.15915493667125701904296875;
    float _1029 = _985 * _1011;
    float _1031 = _971 * _1011;
    float _1033 = _977 * _1011;
    float _1035 = _1015 * 6.283185482025146484375;
    float _1037 = sin(_1035);
    float _1039 = _433 * _1029;
    float _1041 = _435 * _1031;
    float _1043 = _437 * _1033;
    float _1045 = -_1039;
    float _1047 = fma(_435, _1033, _1045);
    float _1049 = -_1041;
    float _1051 = fma(_437, _1029, _1049);
    float _1053 = _879 * _1021;
    float _1055 = _1015 * 6.283185482025146484375;
    float _1057 = cos(_1055);
    float _1059 = _1047 * _1047;
    float _1061 = -_1043;
    float _1063 = fma(_433, _1031, _1061);
    float _1065 = _339 * _1053;
    float _1067 = _317 * _1053;
    float _1069 = fma(_1051, _1051, _1059);
    float _1071 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _179);
    float _1073 = _1065 * _1025;
    float _1075 = _1027 * 6.283185482025146484375;
    float _1077 = cos(_1075);
    float _1079 = fma(_1063, _1063, _1069);
    float _1081 = _991 * _1037;
    float _1083 = _933 * _1037;
    float _1085 = _1027 * 6.283185482025146484375;
    float _1087 = sin(_1085);
    float _1089 = _991 * _1057;
    float _1091 = _933 * _1057;
    float _1093 = rsqrt(_1079);
    float _1095 = _991 * _1077;
    float _1097 = _933 * _1077;
    float _1099 = _1057 * _1077;
    float _1101 = _1067 * _1071;
    float _1103 = _1095 * _1073;
    float _1105 = -_929;
    float _1107 = _373 + _1105;
    float _1109 = fma(_1087, _1089, _1083);
    float _1111 = -_1073;
    float _1113 = _1087 * _1111;
    float _1115 = -_1081;
    float _1117 = fma(_1087, _1091, _1115);
    float _1119 = _1097 * _1073;
    float _1121 = fma(_1109, _1101, _1103);
    float _1123 = fma(_1099, _1101, _1113);
    float _1125 = -_957;
    float _1127 = _381 + _1125;
    float _1129 = fma(_1117, _1101, _1119);
    float _1131 = _1121 * _1029;
    float _1133 = _1063 * _1093;
    float _1135 = -_927;
    float _1137 = _369 + _1135;
    float _1139 = _1121 * _1033;
    float _1141 = _1051 * _1093;
    float _1143 = fma(_1123, _1133, _1131);
    float _1145 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1147 = _1047 * _1093;
    float _1149 = fma(_1123, _1141, _1139);
    float _1151 = fma(_1129, _435, _1143);
    float _1153 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1145);
    float _1155 = fma(_1129, _433, _1149);
    float _1157 = _381 + _1151;
    float _1159 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1153);
    float _1161 = _1137 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1163 = _373 + _1155;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1167 = _1157 + _1165;
    float _1169 = _1159 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1171 = fma(_1107, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1161);
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1175 = _1163 + _1173;
    float _1177 = _1167 * _1167;
    float _1179 = 1.0 / _1169;
    float _1181 = fma(_1127, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1171);
    bool _1183 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1185 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan(0.5);
    bool _1191 = _1187 || _1189;
    float _1193 = fma(_1175, _1175, _1177);
    float _1195 = _1181 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1197 = sqrt(_1193);
    float _1199 = _1195 + _1169;
    float _1201 = _1199 * _1179;
    float _1203 = _1201 * 0.5;
    float _1205 = _1121 * _1031;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1209 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1207);
    float _1211 = fma(_1123, _1147, _1205);
    bool _1213 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = 1.0 / _1209;
    float _1217 = fma(_1129, _437, _1211);
    bool _1219 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1221 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1223 = _1219 || _1221;
    bool _1225 = isnan(0.5);
    bool _1227 = _1223 || _1225;
    float _1229 = _369 + _1217;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1233 = _1163;
    float _1235 = _1157;
    float _1237 = _1129;
    float _1239 = _1197;
    float _1241 = _1175;
    float _1243 = _1229;
    float _1245 = _1167;
    float _1247 = _1209;
    if (!_1213)
    {
        _1231 = _1229;
    }
    float _1249 = _1231;
    bool _1251 = !_1213;
    float _1253 = _1249;
    if (!_1251)
    {
        float _1255 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1257 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1259 = _1197 + _1257;
        float _1261 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = rsqrt(_1193);
        float _1265 = _1259 * _1255;
        float _1267 = _1265 * 0.15915493667125701904296875;
        float _1269 = _1267 * 6.283185482025146484375;
        float _1271 = cos(_1269);
        float _1273 = _1267 * 6.283185482025146484375;
        float _1275 = sin(_1273);
        float _1277 = _1271 + (-1.0);
        float _1279 = fma(_1275, _1261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1281 = _1277 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1283 = _1263 * _1279;
        float _1285 = fma(_1229, _1271, _1281);
        float _1287 = fma(_1175, _1283, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1289 = fma(_1167, _1283, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1233 = _1287;
        _1253 = _1285;
        _1235 = _1289;
        _1237 = _1277;
        _1239 = _1267;
    }
    float _1291 = _1233;
    float _1293 = _1253;
    float _1295 = _1235;
    float _1297 = _1237;
    float _1299 = _1239;
    float _1301 = -_929;
    float _1303 = _1301 + _1291;
    float _1305 = -_927;
    float _1307 = _1305 + _1293;
    float _1309 = -_957;
    float _1311 = _1309 + _1295;
    float _1313 = _1299;
    float _1315 = _1307;
    float _1317 = _1303;
    float _1319 = _1311;
    float _1321 = _1293;
    float _1323 = _1297;
    if (_1227)
    {
        _1313 = 1.0;
    }
    float _1325 = _1313;
    float _1327 = _1325;
    if (!_1191)
    {
        float _1329 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1331 = _1137 + _1329;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1335 = _1107 + _1333;
        float _1337 = -_373;
        float _1339 = _1337 + _1291;
        float _1341 = -_369;
        float _1343 = _1341 + _1293;
        float _1345 = _1331 * _1331;
        float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1349 = _1127 + _1347;
        float _1351 = -_381;
        float _1353 = _1351 + _1295;
        float _1355 = fma(_1335, _1335, _1345);
        float _1357 = fma(_1349, _1349, _1355);
        float _1359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1361 = sqrt(_1357);
        float _1363 = precise::min(_1361, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1365 = _1363 * _1359;
        float _1367 = fma(_1339, _1365, _1107);
        float _1369 = fma(_1343, _1365, _1137);
        float _1371 = fma(_1353, _1365, _1127);
        _1241 = _1345;
        _1315 = _1369;
        _1317 = _1367;
        _1319 = _1371;
    }
    float _1373 = _1241;
    float _1375 = _1315;
    float _1377 = _1317;
    float _1379 = _1319;
    float _1381 = _1373;
    if (_1227)
    {
        _1243 = 1.0;
    }
    float _1383 = _1243;
    float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1387 = _1215 * _1385;
    float _1389 = _1383;
    if (!_1227)
    {
        float _1391 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1393 = _1391 * 0.15915493667125701904296875;
        float _1395 = _1393 * 6.283185482025146484375;
        float _1397 = cos(_1395);
        float _1399 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1401 = _1399 * 0.15915493667125701904296875;
        float _1403 = _1393 * 6.283185482025146484375;
        float _1405 = sin(_1403);
        float _1407 = 1.0 / _1397;
        float _1409 = _1401 * 6.283185482025146484375;
        float _1411 = cos(_1409);
        float _1413 = _1405 * _1407;
        float _1415 = _1401 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1421 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1419;
        float _1423 = _1411 * _1413;
        float _1425 = 1.0 / _1421;
        float _1427 = 1.0 / _1423;
        float _1429 = _1417 * _1427;
        float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1433 = fma(_1387, _1429, _1431);
        float _1435 = _1433 * _1425;
        float _1437 = precise::clamp(_1435, 0.0, 1.0);
        _1381 = _1401;
        _1245 = _1413;
        _1321 = _1393;
        _1327 = _1437;
    }
    float _1439 = _1381;
    float _1441 = _1245;
    float _1443 = _1321;
    float _1445 = _1327;
    float _1447 = _1441;
    float _1449 = _1439;
    if (!_1227)
    {
        float _1451 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1453 = _1451 * 0.15915493667125701904296875;
        float _1455 = _1453 * 6.283185482025146484375;
        float _1457 = cos(_1455);
        float _1459 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1461 = _1459 * 0.15915493667125701904296875;
        float _1463 = _1453 * 6.283185482025146484375;
        float _1465 = sin(_1463);
        float _1467 = 1.0 / _1457;
        float _1469 = _1461 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        float _1473 = _1465 * _1467;
        float _1475 = _1461 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        float _1479 = _1471 * _1473;
        float _1481 = 1.0 / _1479;
        float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1485 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1483;
        float _1487 = 1.0 / _1485;
        float _1489 = _1477 * _1481;
        float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1493 = fma(_1387, _1489, _1491);
        float _1495 = _1493 * _1487;
        float _1497 = precise::clamp(_1495, 0.0, 1.0);
        float _1499 = -_1497;
        float _1501 = _1499 + 1.0;
        _1447 = _1489;
        _1449 = _1467;
        _1389 = _1501;
    }
    float _1503 = _1447;
    float _1505 = _1449;
    float _1507 = _1389;
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1511 = _1375 + _1509;
    float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1515 = _1377 + _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1519 = _1379 + _1517;
    float _1521 = _1511 * _1511;
    float _1523 = fma(_1515, _1515, _1521);
    float _1525 = fma(_1519, _1519, _1523);
    float _1527 = rsqrt(_1525);
    float _1529 = sqrt(_1525);
    float _1531 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1533 = _1515 * _1531;
    float _1535 = _1519 * _1531;
    float _1537 = _1533 * _1533;
    float _1539 = _1535 * _1535;
    float _1541 = _1537 + _1539;
    float _1543 = sqrt(_1541);
    bool _1545 = _1543 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1549 = _1543 + _1547;
    float _1551 = _1503;
    float _1553 = _1541;
    float _1555 = _1549;
    float _1557 = _1511;
    float _1559 = _1533;
    float _1561 = _1535;
    float _1563 = _1539;
    if (_1545)
    {
        float _1565 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1565;
    }
    float _1567 = _1551;
    if (_1545)
    {
        float _1569 = rsqrt(_1541);
        _1553 = _1569;
    }
    float _1571 = _1553;
    if (_1545)
    {
        float _1573 = _1549 * _1567;
        _1555 = _1573;
    }
    float _1575 = _1555;
    if (_1545)
    {
        float _1577 = _1575 * 0.15915493667125701904296875;
        _1323 = _1577;
    }
    float _1579 = _1323;
    float _1581 = _1443;
    if (_1545)
    {
        float _1583 = _1579 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        _1581 = _1585;
    }
    float _1587 = _1581;
    float _1589 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1591 = precise::max(0.0, _1589);
    float _1593 = _1505;
    float _1595 = _1591;
    float _1597 = _1589;
    if (_1545)
    {
        float _1599 = _1579 * 6.283185482025146484375;
        float _1601 = cos(_1599);
        _1593 = _1601;
    }
    float _1603 = _1593;
    float _1605 = -_1531;
    float _1607 = -_1591;
    float _1609 = fma(_1511, _1605, _1607);
    if (!_1545)
    {
        _1595 = _1537;
    }
    float _1611 = _1595;
    float _1613 = _1611;
    if (_1545)
    {
        float _1615 = _1609 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1557 = _1615;
    }
    float _1617 = _1557;
    float _1619 = _1587;
    float _1621 = _1617;
    if (_1545)
    {
        float _1623 = fma(_1587, _1617, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1619 = _1623;
    }
    float _1625 = _1619;
    float _1627 = _1625;
    if (!_1545)
    {
        _1621 = _1609;
    }
    float _1629 = _1621;
    float _1631 = _1629;
    if (_1545)
    {
        float _1633 = _1603 + (-1.0);
        _1597 = _1633;
    }
    float _1635 = _1597;
    if (_1545)
    {
        float _1637 = _1571 * _1625;
        _1247 = _1637;
    }
    float _1639 = _1247;
    float _1641 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1545)
    {
        float _1643 = _1635 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1627 = _1643;
    }
    float _1645 = _1627;
    if (_1545)
    {
        float _1647 = _1533 * _1639;
        _1559 = _1647;
    }
    float _1649 = _1559;
    if (_1545)
    {
        float _1651 = _1535 * _1639;
        _1561 = _1651;
    }
    float _1653 = _1561;
    float _1655 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1641);
    if (_1545)
    {
        float _1657 = fma(_1609, _1603, _1645);
        _1631 = _1657;
    }
    float _1659 = _1631;
    if (_1545)
    {
        float _1661 = _1649 * _1649;
        _1613 = _1661;
    }
    float _1663 = _1613;
    if (_1545)
    {
        float _1665 = _1653 * _1653;
        _1563 = _1665;
    }
    float _1667 = _1563;
    float _1669 = fma(_1659, _1659, _1663);
    float _1671 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1655);
    float _1673 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1675 = _1669 + _1667;
    float _1677 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1679 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1681 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1685 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1683);
    float _1687 = precise::clamp(_1685, 0.0, 1.0);
    float _1689 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1691 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1679);
    float _1693 = rsqrt(_1675);
    float _1695 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1681);
    float _1697 = -_1687;
    float _1699 = _1697 + 1.0;
    float _1701 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1691);
    float _1703 = fma(_1377, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1673);
    float _1705 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1695);
    float _1707 = _1701 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1709 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1711 = _1705 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1713 = abs(_1699);
    float _1715 = log2(_1713);
    float _1717 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1719 = -_1709;
    float _1721 = fma(_1719, _1677, 1.0);
    float _1723 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1703);
    float _1725 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1727 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1717);
    float _1729 = _1693 * _1649;
    float _1731 = _1693 * _1659;
    float _1733 = _1693 * _1653;
    float _1735 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1727);
    float _1737 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1739 = _1723 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1741 = log2(_1721);
    float _1743 = -_1737;
    float _1745 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1743);
    float _1747 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1735);
    float _1749 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1751 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1725);
    float _1753 = -_1733;
    float _1755 = fma(_1753, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1745);
    float _1757 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1759 = 1.0 / _1747;
    float _1761 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1751);
    float _1763 = fma(_1755, -0.5, 0.5);
    float _1765 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1757);
    float _1767 = fma(_1755, 0.5, 0.5);
    float _1769 = _1731 + 1.0;
    float _1771 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1765);
    float _1773 = exp2(_1749);
    float _1775 = fma(_1767, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1777 = _1741 * 0.693147182464599609375;
    float _1779 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1771);
    float _1781 = fma(_1767, _1775, -0.212114393711090087890625);
    float _1783 = _1777 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1785 = sqrt(_1763);
    float _1787 = _1779 * _1759;
    float _1789 = fma(_1767, _1781, 1.570728778839111328125);
    float _1791 = fma(_1787, 0.5, 0.5);
    float _1793 = -_1731;
    float _1795 = fma(_1773, _1769, _1793);
    float _1797 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1761);
    float _1799 = fma(_1795, 0.5, 0.5);
    float _1801 = _1797 * _1759;
    float _1803 = _1785 * 0.636619746685028076171875;
    float _1805 = fma(_1801, -0.5, 0.5);
    float _1807 = -_1789;
    float _1809 = fma(_1803, _1807, 1.0);
    float3 _5636 = float3(_1791, _1805, _1783);
    float _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5636, float3(0.0), isnan(_5636)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5636, float3(0.0), isnan(_5636)), level(0.0)).x;
    float3 _5647 = float3(_1791, _1805, _1783);
    float4 _1814 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5647, float3(0.0), isnan(_5647)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5647, float3(0.0), isnan(_5647)), level(0.0)).xyzw;
    float _1816 = _1814.x;
    float _1818 = _1814.y;
    float _1820 = _1814.z;
    float _1822 = _1814.w;
    float2 _5664 = float2(_1809, _1799);
    float3 _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5664, float2(0.0), isnan(_5664)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5664, float2(0.0), isnan(_5664)), level(0.0)).xyz;
    float _1828 = _1826.x;
    float _1830 = _1826.y;
    float _1832 = _1826.z;
    float _1834 = float(uint(_739));
    float _1836 = trunc(_803);
    int _1838 = int(_1836);
    int _1840 = ~_739;
    int _1842 = _1840 + 1;
    out.m_68.x = _1107;
    out.m_68.y = _1137;
    out.m_68.z = _1127;
    bool _1844 = _351 > 0.5;
    float _1846 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1848 = -_1091;
    float _1850 = fma(_1087, _1081, _1848);
    float _1852 = _1037 * _1077;
    out.m_70.w = _859;
    float _1854 = 1.0 / _1834;
    out.m_72.x = _1067;
    out.m_74.x = _1377;
    out.m_74.y = _1375;
    out.m_74.z = _1379;
    float _1856 = float(uint(_1838));
    float _1858 = exp2(_1846);
    int _1860 = as_type<int>(_1854) + (-2);
    float _1862 = as_type<float>(_1860) * _1856;
    float _1864 = -_1858;
    float _1866 = _1864 + 1.0;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1870 = _1868 != 0;
    float _1872 = trunc(_1862);
    float _1874 = precise::max(_1872, 0.0);
    uint _1877 = uint(_1874);
    float _1879 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1881 = !_1870;
    float _1883 = _1881 ? 7.345489978790283203125 : 1.0;
    float _1885 = _1883 * _349;
    float _1887 = floor(_1885);
    int _1889 = _1842 * int(_1877);
    int _1891 = _1889 + _1838;
    float _1893 = float(uint(_1891));
    float _1895 = as_type<float>(_1860) * _1893;
    float _1897 = trunc(_1895);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    int _1903 = int(_1877) + int(_1901);
    float _1905 = float(_1838);
    int _1907 = _1842 * _1903;
    int _1909 = _1907 + _1838;
    bool _1911 = _1905 >= _785;
    bool _1913 = isnan(_1905);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(_785);
    bool _1919 = _1915 || _1917;
    float _1921 = float(_1919);
    float _1923 = -_1887;
    float _1925 = _1885 + _1923;
    float _1927 = _797 * _163;
    int _1929 = _739 + (-1);
    bool _1931 = uint(_1909) >= uint(_739);
    float _1933 = trunc(_1921);
    int _1935 = int(_1933);
    bool _1937 = !_1931;
    int _1939 = _1937 ? 0 : (-1);
    bool _1941 = _739 == 0;
    int _1943 = ~_1903;
    int _1945 = _1943 + _1939;
    int _1947 = _1945 + 1;
    float _1949 = _1925 * _785;
    float _1951 = trunc(_1927);
    int _1953 = int(_1951);
    int _1955 = _739 * _1947;
    int _1957 = _1955 + _1838;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1961 = _1959 != 0;
    int _1963 = ~_1935;
    int _1965 = _1963 + 1;
    int _1967 = _1965 + 1;
    bool _1969 = !_1941;
    int _1971 = _1969 ? _1957 : (-1);
    float _1973 = trunc(_1949);
    int _1975 = int(_1973);
    bool _1977 = !_1961;
    int _1979 = _1977 ? 0 : 1;
    int _1981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1983 = _1981 != 0;
    int _1985 = _1971 * _1967;
    int _1987 = abs(_585);
    int _1989 = abs(_1979);
    int _1991 = _1935 * _1929;
    int _1993 = _1991 + _1985;
    int _1995 = abs(_665);
    bool _1997 = !_1983;
    int _1999 = _1997 ? 0 : 1;
    int _2001 = abs(_707);
    int _2003 = _1993 * _1987;
    int _2005 = _1975 * _1989;
    int _2007 = _2005 + _1838;
    int _2009 = abs(_1999);
    int _2011 = _1953 * _1995;
    int _2013 = _2011 + _2003;
    bool _2015 = _349 > 0.5;
    bool _2017 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2019 = isnan(_309);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    int _2029 = _2007 * _2001;
    int _2031 = _2029 + _2013;
    int _2033 = _1975 * _2009;
    int _2035 = _2033 + _2031;
    int _2037 = ~_739;
    int _2039 = _2037 + 1;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2043 = _2041 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2045 = -_2027;
    float _2047 = _2045 + 1.0;
    bool _2049 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2051 = isnan(_309);
    bool _2053 = _2049 || _2051;
    bool _2055 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2057 = _2053 || _2055;
    float _2059 = float(_2057);
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2065 = float(uint(_2035));
    float _2067 = 1.0 / _2043;
    float _2069 = as_type<float>(_1860) * _2065;
    int _2071 = ~_739;
    int _2073 = _2071 + 1;
    float _2075 = 1.0 / _2063;
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2079 = _2077 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2081 = trunc(_2069);
    float _2083 = precise::max(_2081, 0.0);
    uint _2085 = uint(_2083);
    float _2087 = 1.0 / _2079;
    int _2089 = _2039 * int(_2085);
    int _2091 = _2089 + _2035;
    float _2093 = float(uint(_2091));
    float _2095 = as_type<float>(_1860) * _2093;
    float _2097 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2097;
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2103 = _2101 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2105 = trunc(_2095);
    float _2107 = precise::max(_2105, 0.0);
    uint _2109 = uint(_2107);
    float _2111 = _2099 * _2087;
    bool _2113 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2115 = isnan(_309);
    bool _2117 = _2113 || _2115;
    bool _2119 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2121 = _2117 || _2119;
    float _2123 = float(_2121);
    float _2125 = _2103 * _2067;
    bool _2127 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2129 = isnan(_309);
    bool _2131 = _2127 || _2129;
    bool _2133 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2135 = _2131 || _2133;
    float _2137 = float(_2135);
    float _2139 = _2123 * _2047;
    float _2141 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2143 = _309 + _2141;
    float _2145 = fma(_2111, _2143, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2149 = _309 + _2147;
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2153 = _309 + _2151;
    int _2155 = int(_2085) + int(_2109);
    float _2157 = -_2123;
    float _2159 = _2157 + 1.0;
    float _2161 = fma(_2125, _2149, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2163 = -_183;
    int _2165 = _1844 ? as_type<int>(_2163) : as_type<int>(_183);
    float _2167 = _2059 * _2159;
    float _2169 = -_2059;
    float _2171 = _2169 + 1.0;
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2175 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2173;
    float _2177 = _2137 * _2171;
    int _2179 = _2073 * _2155;
    int _2181 = _2179 + _2035;
    float _2183 = _2175 * _2075;
    float _2185 = float(uint(_2007));
    float _2187 = _2145 * _2177;
    float _2189 = -_2137;
    float _2191 = _2189 + 1.0;
    bool _2193 = uint(_2181) >= uint(_739);
    float _2195 = fma(_2183, _2153, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2197 = as_type<float>(_1860) * _2185;
    float _2199 = fma(_2191, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2187);
    bool _2201 = !_2193;
    int _2203 = _2201 ? 0 : (-1);
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2207 = _2205 != 0;
    float _2209 = trunc(_2197);
    float _2211 = precise::max(_2209, 0.0);
    uint _2213 = uint(_2211);
    int _2215 = ~_2155;
    int _2217 = _2215 + _2203;
    int _2219 = _2217 + 1;
    float _2221 = -_179;
    int _2223 = _2015 ? as_type<int>(_2221) : as_type<int>(_179);
    int _2225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2227 = _2225 != 0;
    int _2229 = _739 * _2219;
    int _2231 = _2229 + _2035;
    float _2233 = fma(_2161, _2167, _2199);
    bool _2235 = !_2207;
    float _2237 = _2235 ? _179 : as_type<float>(_2223);
    float _2239 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2241 = !_2227;
    float _2243 = _2241 ? _183 : as_type<float>(_2165);
    float _2245 = fma(_2195, _2139, _2233);
    bool _2247 = !_1941;
    int _2249 = _2247 ? _2231 : (-1);
    float _2251 = _2237 + 0.5;
    float _2253 = _2243 + (-0.5);
    int _2255 = _2249 >> 31;
    float _2257 = fma(_2027, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2245);
    float _2259 = fma(_2251, (*spvDescriptorSet0.vp_c9)._m0[80].x, _497);
    float _2261 = -_801;
    float _2263 = _2261 + 1.0;
    int _2265 = _2255 & 3;
    float _2267 = -_2253;
    float _2269 = -_417;
    float _2271 = fma(_2267, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2269);
    float _2273 = -_807;
    float _2275 = _2273 + 1.0;
    int _2277 = _2073 * int(_2213);
    int _2279 = _2277 + _2007;
    int _2281 = _2249 + _2265;
    float _2283 = -_2263;
    float _2285 = fma(_2237, _2283, _2259);
    float _2287 = fma(_2243, _2275, _2271);
    float _2289 = _2257 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2291 = _2281 >> 2;
    float _2293 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_76.x = _2285;
    out.m_76.y = _2287;
    int _2295 = _2291 << 4;
    int _2297 = _2295 + 368;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    uint _2303 = uint(int(uint(_2297) >> uint(2)));
    uint _2305 = uint(int(uint(int(_2303)) >> uint(2)));
    int _2307 = int(_2303) & 3;
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[int(_2305)][_2307];
    int _2311 = int(_2303) + 1;
    uint _2313 = uint(int(uint(_2311) >> uint(2)));
    int _2315 = _2311 & 3;
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[int(_2313)][_2315];
    float _2319 = float(uint(_2279));
    float _2321 = _2299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2327 = _2325 != 0;
    float _2329 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2331 = as_type<float>(_1860) * _2319;
    int _2333 = _2249 & 3;
    bool _2335 = _2333 != 0;
    int _2337 = _2297 + 8;
    uint _2339 = uint(int(uint(_2337) >> uint(2)));
    uint _2341 = uint(int(uint(int(_2339)) >> uint(2)));
    int _2343 = int(_2339) & 3;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[int(_2341)][_2343];
    int _2347 = int(_2339) + 1;
    uint _2349 = uint(int(uint(_2347) >> uint(2)));
    int _2351 = _2347 & 3;
    float _2353 = (*spvDescriptorSet0.vp_c9)._m0[int(_2349)][_2351];
    int _2355 = _2249 & 3;
    bool _2357 = _2355 != 0;
    float _2359 = trunc(_2331);
    float _2361 = precise::max(_2359, 0.0);
    uint _2363 = uint(_2361);
    bool _2365 = uint(_2333) > 1u;
    float _2367 = _2323 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2369 = _2333 != 3;
    int _2371 = _2357 ? 0 : 1;
    bool _2373 = uint(_2333) >= 2u;
    out.m_78.x = _2321;
    out.m_78.y = _2329;
    out.m_78.z = _2367;
    out.m_78.w = _2289;
    int _2375 = ~_739;
    int _2377 = _2375 + 1;
    bool _2379 = !_2335;
    int _2381 = _2379 ? 0 : 1;
    float _2383 = _1879 * _1811;
    bool _2385 = _2333 != 3;
    int _2387 = int(_2213) + int(_2363);
    int _2389 = ~_2371;
    int _2391 = _2389 + 1;
    int _2393 = _2391 + 1;
    int _2395 = _2377 * _2387;
    int _2397 = _2395 + _2007;
    int _2399 = _2393;
    float _2401 = _1797;
    float _2403 = _1779;
    if (!_2365)
    {
        int _2405 = ~_2371;
        int _2407 = _2405 + 1;
        _2399 = _2407;
    }
    int _2409 = _2399;
    float _2411 = _1095 * _1031;
    int _2413 = _2373 ? 0 : 1;
    float _2415 = fma(_1087, _1083, _1089);
    int _2417 = abs(_2409);
    float _2419 = -_1087;
    float _2421 = fma(_2419, _1147, _2411);
    int _2423 = ~_2413;
    int _2425 = _2423 + 1;
    int _2427 = _2425 + 1;
    float _2429 = _1832 * _2383;
    int _2431 = _2427;
    if (_2369)
    {
        int _2433 = ~_2413;
        int _2435 = _2433 + 1;
        _2431 = _2435;
    }
    int _2437 = _2431;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2441 = uint(_2397) >= uint(_739);
    int _2443 = abs(_2381);
    out.m_80.w = _2439;
    bool _2445 = !_2441;
    int _2447 = _2445 ? 0 : (-1);
    int _2449 = abs(_2437);
    int _2451 = ~_2417;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = ~_2387;
    int _2459 = _2457 + _2447;
    int _2461 = _2459 + 1;
    bool _2463 = !_2385;
    int _2465 = _2463 ? 0 : (-1);
    int _2467 = _2455 * as_type<int>(_2317);
    int _2469 = ~_2443;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    int _2475 = _739 * _2461;
    int _2477 = _2475 + _2007;
    float _2479 = _1095 * _1033;
    bool _2481 = !_2327;
    int _2483 = _2481 ? 0 : 1;
    int _2485 = _2473 * as_type<int>(_2309);
    int _2487 = _2485 + _2467;
    int _2489 = abs(_2465);
    float _2491 = -_1087;
    float _2493 = fma(_2491, _1141, _2479);
    int _2495 = ~_2449;
    int _2497 = _2495 + 1;
    int _2499 = _2497 + 1;
    float _2501 = _1095 * _1029;
    int _2503 = abs(_2483);
    float _2505 = fma(_1097, _433, _2493);
    int _2507 = ~_2489;
    int _2509 = _2507 + 1;
    int _2511 = _2509 + 1;
    int _2513 = _2499 * as_type<int>(_2345);
    int _2515 = _2513 + _2487;
    float _2517 = _1109 * _1031;
    float _2519 = _1109 * _1033;
    float _2521 = _1850 * _1031;
    int _2523 = _2511 * as_type<int>(_2353);
    int _2525 = _2523 + _2515;
    int _2527 = ~_2503;
    int _2529 = _2527 + 1;
    int _2531 = _2529 + 1;
    float _2533 = fma(_1099, _1141, _2519);
    float _2535 = fma(_1099, _1147, _2517);
    float _2537 = fma(_1852, _1147, _2521);
    float _2539 = _1109 * _1029;
    int _2541 = _2525 * _2531;
    bool _2543 = !_1941;
    int _2545 = _2543 ? _2477 : (-1);
    float _2547 = -_1087;
    float _2549 = fma(_2547, _1133, _2501);
    float _2551 = fma(_1117, _433, _2533);
    float _2553 = fma(_1117, _437, _2535);
    float _2555 = _2293 * _2505;
    int _2557 = _2545 * _2503;
    int _2559 = _2557 + _2541;
    float _2561 = fma(_1097, _437, _2421);
    float _2563 = fma(_2415, _437, _2537);
    float _2565 = _1850 * _1033;
    float _2567 = _1850 * _1029;
    float _2569 = _2293 * _2561;
    float _2571 = fma(_1099, _1133, _2539);
    float _2573 = fma(_1097, _435, _2549);
    float _2575 = fma(_2239, _2551, _2555);
    float _2577 = fma(_1852, _1141, _2565);
    float _2579 = fma(_2239, _2553, _2569);
    float _2581 = fma(_1852, _1133, _2567);
    float _2583 = fma(_1117, _435, _2571);
    float _2585 = _2293 * _2573;
    float _2587 = _1707 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2589 = float(_2559);
    float _2591 = _1747 * 0.5;
    float _2593 = _2563 + _2579;
    float _2595 = fma(_2415, _433, _2577);
    float _2597 = fma(_2415, _435, _2581);
    float _2599 = -_1879;
    float _2601 = _2599 + 1.0;
    float _2603 = fma(_2239, _2583, _2585);
    float _2605 = _1822 * _2383;
    float _2607 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2587);
    float _2609 = fma(_1797, -0.5, _2591);
    float _2611 = _2595 + _2575;
    float _2613 = _1822 * _2601;
    float _2615 = _2597 + _2603;
    float _2617 = fma(_1828, _2605, _1816);
    float _2619 = fma(_1830, _2605, _1818);
    float _2621 = fma(_1822, _2429, _1820);
    float _2623 = fma(_1689, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2607);
    out.m_82.x = _2611;
    out.m_82.y = _2593;
    out.m_82.z = _2615;
    bool _2625 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2627 = isnan(_1529);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2633 = _2629 || _2631;
    float _2635 = _1779 + _1747;
    float _2637 = fma(_1739, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2623);
    out.m_84.x = _2617;
    out.m_84.y = _2619;
    out.m_84.z = _2621;
    out.m_84.w = _2613;
    float _2639 = _2635 * 0.5;
    float _2641 = _2637 + _1747;
    out.m_86.x = _2589;
    float _2643 = _2641 * 0.5;
    out.gl_Position.x = _1779;
    out.gl_Position.y = _1797;
    out.gl_Position.z = _2637;
    out.gl_Position.w = _1747;
    float _2645 = _2605;
    float _2647 = _2637;
    float _2649 = _2639;
    if (!_2633)
    {
        _2645 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2651 = _2645;
    float _2653 = _1445 * _1507;
    out.m_88.x = _2639;
    out.m_88.y = _2609;
    out.m_88.z = _2643;
    out.m_88.w = _1747;
    float _2655 = _2653;
    float _2657 = _2651;
    float _2659 = _2651;
    if (!_2633)
    {
        _2401 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2661 = _2401;
    float _2663 = _2661;
    float _2665 = _2661;
    if (!_2633)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2667 = _2647;
    float _2669 = _2667;
    float _2671 = _2667;
    if (!_2633)
    {
        _2403 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2673 = _2403;
    float _2675 = _2653 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2677 = _2673;
    float _2679 = _2673;
    if (!_2633)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2681 = _2649;
    float _2683 = _2681;
    float _2685 = _2681;
    if (!_2633)
    {
        _2655 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2687 = _2655;
    bool _2689 = !_2633;
    float _2691 = _2687;
    float _2693 = _2687;
    if (!_2689)
    {
        bool _2695 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2697 = isnan(_1529);
        bool _2699 = _2695 || _2697;
        bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2703 = _2699 || _2701;
        if (!_2703)
        {
            float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2707 = _1529 + _2705;
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2711 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2709;
            float _2713 = 1.0 / _2711;
            float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2735 = _2707 * _2713;
            float _2737 = precise::clamp(_2735, 0.0, 1.0);
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2743 = fma(_2737, _2717, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2745 = fma(_2737, _2741, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2747 = fma(_2737, _2721, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2749 = fma(_2737, _2725, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2751 = fma(_2737, _2729, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2753 = fma(_2737, _2733, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2685 = _2743;
            _2659 = _2751;
            _2665 = _2745;
            _2679 = _2749;
            _2671 = _2747;
            _2693 = _2753;
            _2755 = true;
        }
        else
        {
            bool _2757 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2759 = isnan(_1529);
            bool _2761 = _2757 || _2759;
            bool _2763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2765 = _2761 || _2763;
            if (!_2765)
            {
                _2663 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2767 = _2663;
            _2665 = _2767;
            if (!_2765)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2769 = _2683;
            _2685 = _2769;
            if (!_2765)
            {
                _2669 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2771 = _2669;
            _2671 = _2771;
            if (!_2765)
            {
                _2677 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2773 = _2677;
            _2679 = _2773;
            if (!_2765)
            {
                _2657 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2775 = _2657;
            _2659 = _2775;
            if (!_2765)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2777 = _2691;
            bool _2779 = !_2765;
            _2693 = _2777;
            if (!_2779)
            {
                bool _2781 = _1529 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2783 = isnan(_1529);
                bool _2785 = _2781 || _2783;
                bool _2787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2789 = _2785 || _2787;
                if (!_2789)
                {
                    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2793 = _1529 + _2791;
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2797 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2795;
                    float _2799 = 1.0 / _2797;
                    float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2805 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2821 = _2793 * _2799;
                    float _2823 = precise::clamp(_2821, 0.0, 1.0);
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2829 = fma(_2823, _2803, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2831 = fma(_2823, _2827, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2833 = fma(_2823, _2807, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2835 = fma(_2823, _2811, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2837 = fma(_2823, _2815, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2839 = fma(_2823, _2819, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2685 = _2829;
                    _2659 = _2837;
                    _2665 = _2831;
                    _2679 = _2835;
                    _2671 = _2833;
                    _2693 = _2839;
                    _2755 = true;
                }
                else
                {
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2659 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2665 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2679 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2671 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2755 = false;
    float _2841 = _2685;
    float _2843 = _2659;
    float _2845 = _2665;
    float _2847 = _2679;
    float _2849 = _2671;
    float _2851 = _2693;
    float _2853 = fma(_2593, -0.5, 0.5);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = -_2841;
    float _2859 = _2857 + _2843;
    float _2861 = _2675 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2863 = -_2845;
    float _2865 = _2863 + _2847;
    out.m_90.x = 0.0;
    float _2867 = fma(_2855, _2859, _2841);
    float _2869 = fma(_2855, _2865, _2845);
    out.m_51.x = _2861;
    float _2871 = -_2849;
    float _2873 = _2871 + _2851;
    float _2875 = _2867 * 0.586610972881317138671875;
    bool _2877 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2879 = fma(_2855, _2873, _2849);
    float _2881 = fma(_2869, 0.298911988735198974609375, _2875);
    bool _2883 = _1445 > 0.0;
    bool _2885 = isnan(_1445);
    bool _2887 = _2883 || _2885;
    bool _2889 = isnan(0.0);
    bool _2891 = _2887 || _2889;
    float _2893 = fma(_2879, 0.114477999508380889892578125, _2881);
    bool _2895 = _1507 <= 0.0;
    bool _2897 = !_2891;
    bool _2899 = _2895 || _2897;
    float _2901 = -_2893;
    float _2903 = _2869 + _2901;
    float _2905 = -_2893;
    float _2907 = _2867 + _2905;
    float _2909 = -_2893;
    float _2911 = _2879 + _2909;
    float _2913 = fma(_2903, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2893);
    float _2915 = fma(_2907, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2893);
    float _2917 = fma(_2911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2893);
    bool _2919 = !_2877;
    if (!_2919)
    {
        float _2921 = -_1375;
        float _2923 = _2921 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2925 = -_1377;
        float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2929 = -_1379;
        float _2931 = _2929 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2933 = _2923 * _2923;
        float _2935 = fma(_2927, _2927, _2933);
        float _2937 = fma(_2931, _2931, _2935);
        float _2939 = sqrt(_2937);
        float _2941 = rsqrt(_2937);
        float _2943 = -_2939;
        float _2945 = _2943 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2947 = _2945 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2949 = precise::clamp(_2947, 0.0, 1.0);
        float _2951 = _2927 * _2941;
        float _2953 = _2923 * _2941;
        float _2955 = abs(_2949);
        float _2957 = log2(_2955);
        float _2959 = _2931 * _2941;
        float _2961 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2963 = _2593 * _2953;
        float _2965 = -_2953;
        float _2967 = -_2961;
        float _2969 = fma(_2965, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2967);
        float _2971 = fma(_2611, _2951, _2963);
        float _2973 = -_2959;
        float _2975 = fma(_2973, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2969);
        float _2977 = fma(_2615, _2959, _2971);
        float _2979 = precise::clamp(_2977, 0.0, 1.0);
        float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2983 = _2975 + _2981;
        float _2985 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2987 = _2983 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2989 = precise::clamp(_2987, 0.0, 1.0);
        float _2991 = exp2(_2985);
        float _2993 = _2991 * _2989;
        float _2995 = _2979 * _2993;
        float _2997 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2999 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3001 = _2995 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2997;
        out.m_90.y = _2999;
        out.m_90.z = _3001;
    }
    out.m_70.x = _2913;
    out.m_70.y = _2915;
    out.m_70.z = _2917;
    if (!_2899)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3003 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3003;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

