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
    float4 m_64 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_76 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
    float4 m_72 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1345 = false;
    bool _347 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1959 = as_type<float>(_111);
        out.gl_Position.z = _1959;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_47.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2028 = as_type<float>(_149);
        out.gl_Position.z = _2028;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_151) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_151) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _187 = !_179;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_183;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = _155 * _161;
    float _197 = _155 * _167;
    float _199 = fma(_153, _159, _195);
    float _201 = _155 * _173;
    float _203 = fma(_153, _165, _197);
    float _205 = fma(_157, _163, _199);
    float _207 = fma(_153, _171, _201);
    float _209 = fma(_157, _169, _203);
    float _211 = fma(_157, _175, _207);
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_95);
        float _237 = 1.0 / _235;
        float _239 = _129 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _245 = _241 + _243;
    bool _247 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _249 = isnan(_241);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _259;
    bool _263 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _265 = isnan(_241);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_257;
    float _277 = _275 + 1.0;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _279;
    float _283 = 1.0 / _261;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = _273 * _277;
    float _289 = -_273;
    float _291 = _289 + 1.0;
    float _293 = _245 * _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _295;
    float _299 = fma(_281, _293, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _301;
    float _305 = fma(_297, _293, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _307 = fma(_303, _293, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _309 = _299 * _287;
    float _311 = _307 * _287;
    float _313 = _305 * _287;
    float _315 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[107].x, _309);
    float _317 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[107].y, _311);
    float _319 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[107].z, _313);
    float _321 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[108].x, _315);
    float _323 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[108].y, _317);
    float _325 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[108].z, _319);
    bool _327 = !_285;
    float _345;
    if (!_327)
    {
        float _329 = in.m_62.x;
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _333 = _329 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_95);
        float _351 = 1.0 / _349;
        float _353 = _129 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = in.m_62.x;
    float _359 = in.m_62.y;
    float _361 = in.m_62.z;
    float _363 = in.m_62.w;
    float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _367 = in.m_44.x;
    float _369 = in.m_44.y;
    float _371 = in.m_44.z;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _375 = _373 != 0;
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _379 = _377 != 0;
    int _381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _383 = _381 != 0;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _387 = _385 != 0;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _395 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _397 = _363 > 0.5;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _401 = _357 > 0.5;
    float _403 = _161 * _369;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _407 = _405 != 0;
    float _409 = _167 * _369;
    float _411 = -_189;
    int _413 = _401 ? as_type<int>(_411) : as_type<int>(_189);
    float _415 = _173 * _369;
    float _417 = -_193;
    int _419 = _397 ? as_type<int>(_417) : as_type<int>(_193);
    float _421 = fma(_165, _367, _409);
    bool _423 = !_375;
    float _425 = _423 ? _189 : as_type<float>(_413);
    float _427 = fma(_171, _367, _415);
    float _429 = fma(_159, _367, _403);
    bool _431 = _359 > 0.5;
    float _433 = _361 * 2.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _439 = -_193;
    int _441 = _431 ? as_type<int>(_439) : as_type<int>(_193);
    float _443 = _357 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _455 = _453 != 0;
    float _457 = 1.0 / _437;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _461 = _359 + _361;
    float _463 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _467 = fma(_163, _371, _429);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    float _473 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = -_391;
    float _479 = fma(_443, 2.0, _477);
    float _481 = _357 * 2.0;
    float _483 = floor(_433);
    float _485 = fma(_169, _371, _421);
    float _487 = _461 + (-1.0);
    float _489 = fma(_463, -2.0, _393);
    float _491 = _471 * _457;
    float _493 = fma(_175, _371, _427);
    float _495 = _359 + _357;
    float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_64.x = _475;
    out.m_64.y = _473;
    out.m_64.z = _395;
    bool _499 = !_379;
    float _501 = _499 ? _193 : as_type<float>(_441);
    float _503 = _495 + (-1.0);
    bool _505 = _361 > 0.5;
    float _507 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _509 = _485 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _511 = floor(_481);
    float _513 = -_189;
    int _515 = _505 ? as_type<int>(_513) : as_type<int>(_189);
    float _517 = _467 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _521 = _483 > 0.0;
    float _523 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _525 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _527 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _529 = !_383;
    float _531 = _529 ? _189 : as_type<float>(_515);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _535 = _355 + _533;
    float _537 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _539 = _503;
    float _541 = _473;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_407)
    {
        _539 = _361;
    }
    float _545 = _539;
    float _547 = _545;
    if (_407)
    {
        _547 = _359;
    }
    float _549 = _547;
    float _551 = fma(_491, _535, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _553 = _483 >= 0.0;
    bool _555 = isnan(_483);
    bool _557 = _553 || _555;
    bool _559 = isnan(0.0);
    bool _561 = _557 || _559;
    float _563 = _497 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _565 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _567 = isnan(_355);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[83].w, _519);
    if (!_407)
    {
        _541 = _359;
    }
    float _579 = _541;
    float _581 = -_129;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[76].x, _479);
    float _585 = _579;
    if (!_407)
    {
        _543 = _361;
    }
    float _587 = _543;
    float _589 = _501 + (-0.5);
    bool _591 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _593 = isnan(_355);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = _425 + 0.5;
    float _605 = _587;
    if (_407)
    {
        _585 = _357;
    }
    float _607 = _585;
    float _609 = _527 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_407)
    {
        _605 = _359;
    }
    float _611 = _605;
    float _613 = fma(_563, _603, _583);
    int _615 = _561 ? 0 : 1;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _619 = _511 > 0.0;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _623 = _511 >= 0.0;
    bool _625 = isnan(_511);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = -_575;
    float _635 = _633 + 1.0;
    float _637 = -_609;
    float _639 = -_507;
    float _641 = fma(_637, _589, _639);
    float _643 = _611 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _645 = _601 * _635;
    float _647 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[83].z, _399);
    float _649 = _607 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _653 = _531 + 0.5;
    bool _655 = !_387;
    float _657 = _655 ? _193 : as_type<float>(_419);
    float _659 = -_617;
    float _661 = fma(_649, 2.0, _659);
    float _663 = _365 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _665 = _551 * _645;
    float _667 = -_601;
    float _669 = _667 + 1.0;
    float _671 = -_129;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[81].x, _661);
    float _675 = fma(_643, -2.0, _651);
    float _677 = _621 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _679 = fma(_663, _653, _673);
    float _681 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _675);
    float _683 = _657 + (-0.5);
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[115].x, _665);
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _689 = _509 + _687;
    float _691 = -_677;
    float _693 = -_681;
    float _695 = fma(_691, _683, _693);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _701 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[116].x, _685);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _705 = _517 + _703;
    float _707 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _697);
    float _709 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _699);
    float _711 = _689 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _713 = ~_615;
    int _715 = _713 + 1;
    int _717 = _715 + 1;
    float _719 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _707);
    float _721 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _709);
    float _723 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _577);
    int _725 = _717;
    if (!_521)
    {
        int _727 = ~_615;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = -_721;
    float _739 = _737 + 1.0;
    float _741 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _647);
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _745 = _525 + _743;
    float _747 = -_735;
    float _749 = fma(_425, _747, _613);
    float _751 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[28].x, _711);
    float _753 = fma(_501, _739, _641);
    float _755 = -_741;
    float _757 = _755 + 1.0;
    float _759 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _761 = log2(_759);
    float _763 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[28].z, _751);
    float _765 = _689 * _689;
    float _767 = -_757;
    float _769 = fma(_531, _767, _679);
    float _771 = _321 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _773 = _359 * 2.0;
    bool _775 = _763 >= 0.0;
    float _777 = fma(_705, _705, _765);
    float _779 = _325 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _781 = -_723;
    float _783 = _781 + 1.0;
    float _785 = _323 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _787 = fma(_745, _745, _777);
    float _789 = floor(_773);
    float _791 = fma(_657, _783, _695);
    float _793 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _761 * _129;
    float _797 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = _757;
    if (_775)
    {
        _801 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _803 = _801;
    float _805 = rsqrt(_787);
    float _807 = _701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _749;
    out.m_66.y = _753;
    out.m_66.z = _769;
    out.m_66.w = _791;
    bool _809 = !_447;
    int _811 = _809 ? 0 : 1;
    int _813 = as_type<int>(_803);
    if (_775)
    {
        float _815 = _803 * 5.0;
        _813 = as_type<int>(_815);
    }
    int _817 = _813;
    bool _819 = !_455;
    int _821 = _819 ? 0 : 1;
    out.m_68.x = _793;
    out.m_68.y = _797;
    out.m_68.z = _799;
    out.m_68.w = _807;
    float _823 = exp2(_795);
    bool _825 = _789 > 0.0;
    if (_775)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3151 = as_type<float>(_817);
        out.gl_Position.z = _3151;
    }
    bool _827 = _789 >= 0.0;
    bool _829 = isnan(_789);
    bool _831 = _827 || _829;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    bool _837 = !_451;
    int _839 = _837 ? 0 : 1;
    if (_775)
    {
        out.m_47.x = 0.0;
    }
    float _841 = _689 * _805;
    float _843 = _705 * _805;
    if (_775)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _845 = -_841;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _849 = -_843;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    int _853 = _631 ? 0 : 1;
    float _855 = -_823;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _861 = _847 + _859;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _865 = _851 + _863;
    int _867 = ~_853;
    int _869 = _867 + 1;
    int _871 = _869 + 1;
    float _873 = _359 + (-0.5);
    float _875 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _877 = _871;
    if (!_619)
    {
        int _879 = ~_853;
        int _881 = _879 + 1;
        _877 = _881;
    }
    int _883 = _877;
    float _885 = -_841;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[18].w, _689);
    int _889 = _835 ? 0 : 1;
    float _891 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[28].x, _875);
    float _893 = in.m_70.x;
    float _895 = in.m_70.y;
    float _897 = in.m_70.z;
    int _899 = ~_889;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = -_843;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    int _909 = _903;
    if (!_825)
    {
        int _911 = ~_889;
        int _913 = _911 + 1;
        _909 = _913;
    }
    int _915 = _909;
    float _917 = _745 * _805;
    bool _919 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _921 = isnan(1.0);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _927 = _923 || _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _931 = 1.0 + _929;
    int _933 = abs(_811);
    float _935 = -_917;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    int _939 = abs(_839);
    float _941 = 1.0 / _931;
    float _943 = float(_933);
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _947 = _937 + _945;
    float _949 = float(_731);
    float _951 = _887 * _887;
    int _953 = abs(_821);
    float _955 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[28].z, _891);
    float _957 = float(_883);
    float _959 = _943 * _949;
    float _961 = float(_939);
    float _963 = fma(_907, _907, _951);
    float _965 = float(_953);
    float _967 = _959 * (-2.0);
    float _969 = float(_915);
    float _971 = _961 * _957;
    bool _973 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _981 = _977 || _979;
    float _983 = fma(_967, _893, _893);
    float _985 = fma(_537, _967, _537);
    float _987 = _965 * _969;
    float _989 = _981 ? _857 : 0.0;
    float _991 = _971 * (-2.0);
    float _993 = _357 + (-0.5);
    bool _995 = _955 >= 0.0;
    float _997 = _361 + _357;
    float _999 = _991;
    if (_927)
    {
        float _1001 = _989 * _941;
        _133 = _1001;
    }
    float _1003 = _133;
    float _1005 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].x, _983);
    float _1007 = fma(_991, _895, _895);
    float _1009 = fma(_523, _991, _523);
    float _1011 = fma(_985, _1003, _1005);
    float _1013 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1007);
    float _1015 = _997 + (-1.0);
    float _1017 = _1011 * 0.15915493667125701904296875;
    float _1019 = fma(_1009, _1003, _1013);
    if (_995)
    {
        _999 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1021 = _999;
    int _1023 = as_type<int>(_1021);
    if (_995)
    {
        out.m_47.x = 0.0;
    }
    float _1025 = _1017 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = _1019 * 0.15915493667125701904296875;
    if (_995)
    {
        float _1031 = _1021 * 5.0;
        _1023 = as_type<int>(_1031);
    }
    int _1033 = _1023;
    float _1035 = _1017 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    if (_995)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3469 = as_type<float>(_1033);
        out.gl_Position.z = _3469;
    }
    if (_995)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1039 = in.m_72.x;
    float _1041 = in.m_72.y;
    float _1043 = -_917;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _745);
    float _1047 = _987 * (-2.0);
    float _1049 = _361 + (-0.5);
    float _1051 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1053 = fma(_1045, _1045, _963);
    float _1055 = fma(_1047, _897, _897);
    float _1057 = _1029 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = fma(_1051, _1047, _1051);
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1055);
    float _1067 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1069 = fma(_1061, _1003, _1065);
    float _1071 = sqrt(_1053);
    float _1073 = _1069 * 0.15915493667125701904296875;
    float _1075 = _1029 * 6.283185482025146484375;
    float _1077 = cos(_1075);
    float _1079 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1081 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1083 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1085 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1087 = _1073 * 6.283185482025146484375;
    float _1089 = cos(_1087);
    float _1091 = _805 * _1071;
    float _1093 = _1083 * _1091;
    float _1095 = _1085 * _1091;
    float _1097 = _1037 * _1059;
    float _1099 = _1073 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = _1063 * _1093;
    float _1105 = _1027 * _1059;
    float _1107 = _1037 * _1077;
    float _1109 = _1067 * _1095;
    float _1111 = _1089 * _1103;
    float _1113 = _1059 * _1089;
    float _1115 = _1077 * _1089;
    float _1117 = _1027 * _1077;
    float _1119 = _1037 * _1111;
    float _1121 = fma(_1101, _1107, _1105);
    float _1123 = -_1103;
    float _1125 = _1101 * _1123;
    float _1127 = fma(_1101, _1105, _1107);
    float _1129 = fma(_1121, _1109, _1119);
    float _1131 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1133 = _1131 * 0.5;
    float _1135 = -_1117;
    float _1137 = fma(_1101, _1097, _1135);
    float _1139 = -_1097;
    float _1141 = fma(_1101, _1117, _1139);
    float _1143 = _1027 * _1111;
    float _1145 = fma(_1115, _1109, _1125);
    float _1147 = fma(_1137, _1133, _1129);
    float _1149 = fma(_1141, _1109, _1143);
    float _1151 = fma(_1113, _1133, _1145);
    float _1153 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1157 = fma(_1127, _1133, _1149);
    float _1159 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1153);
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1155);
    float _1163 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1159);
    float _1165 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1161);
    float _1167 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1169 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1171 = _517 + _1167;
    float _1173 = _525 + _1169;
    float _1175 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1179 = _1171 + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1173 + _1181;
    float _1185 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1175);
    float _1187 = _1179 * _1179;
    float _1189 = _1183 * _1183;
    float _1191 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1185);
    float _1193 = _1187 + _1189;
    float _1195 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1197 = sqrt(_1193);
    float _1199 = _509 + _1195;
    bool _1201 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = _1175;
    float _1205 = _1157;
    float _1207 = _1173;
    float _1209 = _1187;
    float _1211 = _1171;
    float _1213 = _1193;
    if (!_1201)
    {
        _1203 = _1173;
    }
    float _1215 = _1203;
    float _1217 = _1215;
    if (!_1201)
    {
        _1205 = _1189;
    }
    float _1219 = _1205;
    float _1221 = _1219;
    if (!_1201)
    {
        _1207 = _1199;
    }
    float _1223 = _1207;
    bool _1225 = !_1201;
    float _1227 = _1223;
    if (!_1225)
    {
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1233 = _1197 + _1231;
        float _1235 = _1199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = rsqrt(_1193);
        float _1239 = _1233 * _1229;
        float _1241 = _1239 * 0.15915493667125701904296875;
        float _1243 = _1241 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1241 * 6.283185482025146484375;
        float _1249 = cos(_1247);
        float _1251 = fma(_1245, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1253 = _1237 * _1251;
        float _1255 = _1249 + (-1.0);
        float _1257 = fma(_1179, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1259 = fma(_1183, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1261 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1265 = _1257 + _1263;
        float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1269 = _1259 + _1267;
        float _1271 = fma(_1199, _1249, _1261);
        float _1273 = _1265 * _1265;
        float _1275 = _1269 * _1269;
        _1227 = _1271;
        _1209 = _1273;
        _1221 = _1275;
        _1211 = _1257;
        _1217 = _1259;
    }
    float _1277 = _1227;
    float _1279 = _1209;
    float _1281 = _1221;
    float _1283 = _1211;
    float _1285 = _1217;
    float _1287 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1289 = _1277 + _1287;
    float _1291 = fma(_1289, _1289, _1279);
    float _1293 = _1291 + _1281;
    float _1295 = sqrt(_1293);
    bool _1297 = _1295 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1299 = isnan(_1295);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1305 = _1301 || _1303;
    float _1307 = _1291;
    float _1309 = _1277;
    if (!_1305)
    {
        _1307 = 1.0;
    }
    float _1311 = _1307;
    bool _1313 = !_1305;
    float _1315 = _1311;
    if (!_1313)
    {
        bool _1317 = _1295 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1319 = isnan(_1295);
        bool _1321 = _1317 || _1319;
        bool _1323 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1325 = _1321 || _1323;
        if (!_1325)
        {
            float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1329 = _1295 + _1327;
            float _1331 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1333 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1331;
            float _1335 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1337 = _1335 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1339 = 1.0 / _1333;
            float _1341 = _1329 * _1339;
            float _1343 = fma(_1341, _1337, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1315 = _1343;
            _1345 = true;
        }
        else
        {
            bool _1347 = _1295 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1349 = isnan(_1295);
            bool _1351 = _1347 || _1349;
            bool _1353 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1355 = _1351 || _1353;
            if (!_1355)
            {
                float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1359 = _1295 + _1357;
                float _1361 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1363 = _1361 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1365 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1367 = _1365 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1369 = 1.0 / _1363;
                float _1371 = _1359 * _1369;
                float _1373 = fma(_1371, _1367, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1315 = _1373;
                _1345 = true;
            }
            else
            {
                _1315 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1345 = false;
    float _1375 = _1315;
    float _1377 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1379 = _1277 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1383 = _1283 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1387 = _1285 + _1385;
    float _1389 = fma(_1379, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1391 = fma(_1383, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1393 = fma(_1387, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1395 = -_509;
    float _1397 = _1395 + _1389;
    float _1399 = -_517;
    float _1401 = _1399 + _1391;
    float _1403 = -_525;
    float _1405 = _1403 + _1393;
    float _1407 = _1397 * _1397;
    float _1409 = fma(_1401, _1401, _1407);
    float _1411 = fma(_1405, _1405, _1409);
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > 0.0;
    float _1417 = _1387;
    float _1419 = _1413;
    float _1421 = _1401;
    float _1423 = _1411;
    float _1425 = _1391;
    if (!_1415)
    {
        _1417 = _1391;
    }
    float _1427 = _1417;
    float _1429 = _1427;
    if (!_1415)
    {
        _1309 = _1389;
    }
    float _1431 = _1309;
    float _1433 = _1431;
    float _1435 = _1431;
    if (!_1415)
    {
        _1419 = _1393;
    }
    float _1437 = _1419;
    bool _1439 = !_1415;
    float _1441 = _1437;
    if (!_1439)
    {
        float _1443 = _209 * _209;
        float _1445 = fma(_205, _205, _1443);
        float _1447 = fma(_211, _211, _1445);
        float _1449 = rsqrt(_1411);
        float _1451 = sqrt(_1447);
        float _1453 = _1401 * _1449;
        float _1455 = _1397 * _1449;
        float _1457 = _1405 * _1449;
        bool _1459 = _1451 > 0.0;
        float _1461 = _1451;
        float _1463 = _1449;
        _1421 = _1453;
        if (!_1459)
        {
            _1461 = _1391;
        }
        float _1465 = _1461;
        _1429 = _1465;
        if (!_1459)
        {
            _1433 = _1389;
        }
        float _1467 = _1433;
        _1435 = _1467;
        if (!_1459)
        {
            _1463 = _1393;
        }
        float _1469 = _1463;
        bool _1471 = !_1459;
        _1441 = _1469;
        if (!_1471)
        {
            float _1473 = rsqrt(_1447);
            float _1475 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1477 = _209 * _1473;
            float _1479 = _205 * _1473;
            float _1481 = _211 * _1473;
            float _1483 = _1455 * _1477;
            float _1485 = fma(_1453, _1479, _1483);
            float _1487 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1489 = fma(_1457, _1481, _1485);
            float _1491 = _1489 * _1487;
            float _1493 = fma(_205, _1491, _1391);
            float _1495 = fma(_209, _1491, _1389);
            float _1497 = fma(_211, _1491, _1393);
            _1435 = _1495;
            _1429 = _1493;
            _1441 = _1497;
            _1421 = _1487;
            _1423 = _1475;
        }
    }
    float _1499 = _1435;
    float _1501 = _1429;
    float _1503 = _1441;
    float _1505 = _1421;
    float _1507 = _1423;
    float _1509 = -_841;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1499);
    float _1513 = -_843;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1501);
    float _1517 = -_917;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1503);
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1523 = _1511 + _1521;
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1527 = _1515 + _1525;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1531 = _1519 + _1529;
    float _1533 = _1523 * _1523;
    float _1535 = fma(_1527, _1527, _1533);
    float _1537 = fma(_1531, _1531, _1535);
    float _1539 = rsqrt(_1537);
    float _1541 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1543 = _1527 * _1541;
    float _1545 = _1531 * _1541;
    float _1547 = _1543 * _1543;
    float _1549 = _1545 * _1545;
    float _1551 = _1547 + _1549;
    float _1553 = sqrt(_1551);
    bool _1555 = _1553 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1559 = _1553 + _1557;
    float _1561 = _1505;
    float _1563 = _1559;
    float _1565 = _1523;
    float _1567 = _1543;
    if (_1555)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1561 = _1569;
    }
    float _1571 = _1561;
    float _1573 = _1571;
    if (_1555)
    {
        float _1575 = _1559 * _1571;
        _1563 = _1575;
    }
    float _1577 = _1563;
    if (_1555)
    {
        float _1579 = rsqrt(_1551);
        _1573 = _1579;
    }
    float _1581 = _1573;
    float _1583 = _1581;
    if (_1555)
    {
        float _1585 = _1577 * 0.15915493667125701904296875;
        _1425 = _1585;
    }
    float _1587 = _1425;
    float _1589 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1591 = _1531;
    if (_1555)
    {
        float _1593 = _1587 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        _1591 = _1595;
    }
    float _1597 = _1591;
    float _1599 = precise::max(0.0, _1589);
    float _1601 = _1507;
    float _1603 = _1599;
    if (_1555)
    {
        float _1605 = _1587 * 6.283185482025146484375;
        float _1607 = cos(_1605);
        _1601 = _1607;
    }
    float _1609 = _1601;
    float _1611 = -_1541;
    float _1613 = -_1599;
    float _1615 = fma(_1523, _1611, _1613);
    if (_1555)
    {
        float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1565 = _1617;
    }
    float _1619 = _1565;
    float _1621 = sqrt(_1537);
    float _1623 = _1597;
    float _1625 = _1619;
    if (_1555)
    {
        float _1627 = fma(_1597, _1619, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = _1629;
    if (!_1555)
    {
        _1625 = _1615;
    }
    float _1633 = _1625;
    float _1635 = _1633;
    if (_1555)
    {
        float _1637 = _1581 * _1629;
        _1213 = _1637;
    }
    float _1639 = _1213;
    if (!_1555)
    {
        _1631 = _1547;
    }
    float _1641 = _1631;
    float _1643 = _1641;
    float _1645 = _1609;
    if (_1555)
    {
        float _1647 = _1609 + (-1.0);
        _1603 = _1647;
    }
    float _1649 = _1603;
    float _1651 = _1649;
    if (_1555)
    {
        float _1653 = _1543 * _1639;
        _1567 = _1653;
    }
    float _1655 = _1567;
    if (_1555)
    {
        float _1657 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1583 = _1657;
    }
    float _1659 = _1583;
    if (!_1555)
    {
        _1651 = _1545;
    }
    float _1661 = _1651;
    float _1663 = _1661;
    if (_1555)
    {
        float _1665 = _1545 * _1639;
        _1663 = _1665;
    }
    float _1667 = _1663;
    if (_1555)
    {
        float _1669 = _1655 * _1655;
        _1643 = _1669;
    }
    float _1671 = _1643;
    if (_1555)
    {
        float _1673 = fma(_1615, _1609, _1659);
        _1635 = _1673;
    }
    float _1675 = _1635;
    if (!_1555)
    {
        _1645 = _1549;
    }
    float _1677 = _1645;
    float _1679 = _1677;
    if (_1555)
    {
        float _1681 = _1667 * _1667;
        _1679 = _1681;
    }
    float _1683 = _1679;
    float _1685 = fma(_1675, _1675, _1671);
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1689 = _1685 + _1683;
    float _1691 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1695 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1693);
    float _1697 = precise::clamp(_1695, 0.0, 1.0);
    float _1699 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1701 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1691);
    float _1703 = rsqrt(_1689);
    float _1705 = -_1697;
    float _1707 = _1705 + 1.0;
    float _1709 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1711 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1701);
    float _1713 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1699);
    float _1715 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1717 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1709);
    float _1719 = _1711 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1721 = abs(_1707);
    float _1723 = log2(_1721);
    float _1725 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1713);
    float _1727 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1715);
    float _1729 = _1719 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1731 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1717);
    float _1733 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1735 = -_1729;
    float _1737 = fma(_1735, _1687, 1.0);
    float _1739 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1727);
    float _1741 = _1703 * _1655;
    float _1743 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1745 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1747 = _1703 * _1675;
    float _1749 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1751 = _1703 * _1667;
    float _1753 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1745);
    float _1755 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1757 = -_1749;
    float _1759 = fma(_1747, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1757);
    float _1761 = _1739 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1763 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1753);
    float _1765 = log2(_1737);
    float _1767 = -_1751;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1759);
    float _1771 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1773 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1763);
    float _1775 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1777 = fma(_1769, -0.5, 0.5);
    float _1779 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1771);
    float _1781 = fma(_1769, 0.5, 0.5);
    float _1783 = exp2(_1755);
    float _1785 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1775);
    float _1787 = _1747 + 1.0;
    float _1789 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1779);
    float _1791 = fma(_1781, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1793 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1785);
    float _1795 = 1.0 / _1773;
    float _1797 = fma(_1781, _1791, -0.212114393711090087890625);
    float _1799 = _1765 * 0.693147182464599609375;
    float _1801 = fma(_1781, _1797, 1.570728778839111328125);
    float _1803 = sqrt(_1777);
    float _1805 = -_1747;
    float _1807 = fma(_1783, _1787, _1805);
    float _1809 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1789);
    float _1811 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1793);
    float _1813 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1815 = _1809 * _1795;
    float _1817 = _1811 * _1795;
    float _1819 = fma(_1815, 0.5, 0.5);
    float _1821 = fma(_1817, -0.5, 0.5);
    float _1823 = fma(_1807, 0.5, 0.5);
    float _1825 = _1803 * 0.636619746685028076171875;
    float3 _4758 = float3(_1819, _1821, _1813);
    float _1827 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4758, float3(0.0), isnan(_4758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4758, float3(0.0), isnan(_4758)), level(0.0)).x;
    float3 _4769 = float3(_1819, _1821, _1813);
    float4 _1830 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4769, float3(0.0), isnan(_4769)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4769, float3(0.0), isnan(_4769)), level(0.0)).xyzw;
    float _1832 = _1830.x;
    float _1834 = _1830.y;
    float _1836 = _1830.z;
    float _1838 = _1830.w;
    float _1840 = -_1801;
    float _1842 = fma(_1825, _1840, 1.0);
    float2 _4791 = float2(_1842, _1823);
    float3 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4791, float2(0.0), isnan(_4791)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4791, float2(0.0), isnan(_4791)), level(0.0)).xyz;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1856 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1858 = _1809 + _1773;
    float _1860 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1854);
    float _1862 = _1858 * 0.5;
    float _1864 = exp2(_1856);
    float _1866 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1860);
    float _1868 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1866);
    float _1870 = _1773 * 0.5;
    float _1872 = _1868 + _1773;
    float _1874 = -_1864;
    float _1876 = _1874 + 1.0;
    float _1878 = fma(_1811, -0.5, _1870);
    float _1880 = _1872 * 0.5;
    float _1882 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1809;
    out.gl_Position.y = _1811;
    out.gl_Position.z = _1868;
    out.gl_Position.w = _1773;
    float _1884 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_74.x = _1862;
    out.m_74.y = _1878;
    out.m_74.z = _1880;
    out.m_74.w = _1773;
    out.m_47.x = _1884;
    float _1886 = _1882 * _1827;
    float _1888 = -_1882;
    float _1890 = _1888 + 1.0;
    float _1892 = _1838 * _1886;
    float _1894 = _1852 * _1886;
    float _1896 = fma(_1848, _1892, _1832);
    float _1898 = fma(_1850, _1892, _1834);
    float _1900 = _1838 * _1890;
    float _1902 = fma(_1838, _1894, _1836);
    out.m_76.x = _1896;
    out.m_76.y = _1898;
    out.m_76.z = _1902;
    out.m_76.w = _1900;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1345 = false;
    bool _347 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1959 = as_type<float>(_111);
        out.gl_Position.z = _1959;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_47.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2028 = as_type<float>(_149);
        out.gl_Position.z = _2028;
    }
    if (_143)
    {
        return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_151) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_151) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _187 = !_179;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_183;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = _155 * _161;
    float _197 = _155 * _167;
    float _199 = fma(_153, _159, _195);
    float _201 = _155 * _173;
    float _203 = fma(_153, _165, _197);
    float _205 = fma(_157, _163, _199);
    float _207 = fma(_153, _171, _201);
    float _209 = fma(_157, _169, _203);
    float _211 = fma(_157, _175, _207);
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_95);
        float _237 = 1.0 / _235;
        float _239 = _129 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _245 = _241 + _243;
    bool _247 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _249 = isnan(_241);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _259;
    bool _263 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _265 = isnan(_241);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_257;
    float _277 = _275 + 1.0;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _279;
    float _283 = 1.0 / _261;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = _273 * _277;
    float _289 = -_273;
    float _291 = _289 + 1.0;
    float _293 = _245 * _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _295;
    float _299 = fma(_281, _293, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _301;
    float _305 = fma(_297, _293, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _307 = fma(_303, _293, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _309 = _299 * _287;
    float _311 = _307 * _287;
    float _313 = _305 * _287;
    float _315 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[107].x, _309);
    float _317 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[107].y, _311);
    float _319 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[107].z, _313);
    float _321 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[108].x, _315);
    float _323 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[108].y, _317);
    float _325 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[108].z, _319);
    bool _327 = !_285;
    float _345;
    if (!_327)
    {
        float _329 = in.m_62.x;
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _333 = _329 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_95);
        float _351 = 1.0 / _349;
        float _353 = _129 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = in.m_62.x;
    float _359 = in.m_62.y;
    float _361 = in.m_62.z;
    float _363 = in.m_62.w;
    float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _367 = in.m_44.x;
    float _369 = in.m_44.y;
    float _371 = in.m_44.z;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _375 = _373 != 0;
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _379 = _377 != 0;
    int _381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _383 = _381 != 0;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _387 = _385 != 0;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _395 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _397 = _363 > 0.5;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _401 = _357 > 0.5;
    float _403 = _161 * _369;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _407 = _405 != 0;
    float _409 = _167 * _369;
    float _411 = -_189;
    int _413 = _401 ? as_type<int>(_411) : as_type<int>(_189);
    float _415 = _173 * _369;
    float _417 = -_193;
    int _419 = _397 ? as_type<int>(_417) : as_type<int>(_193);
    float _421 = fma(_165, _367, _409);
    bool _423 = !_375;
    float _425 = _423 ? _189 : as_type<float>(_413);
    float _427 = fma(_171, _367, _415);
    float _429 = fma(_159, _367, _403);
    bool _431 = _359 > 0.5;
    float _433 = _361 * 2.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _439 = -_193;
    int _441 = _431 ? as_type<int>(_439) : as_type<int>(_193);
    float _443 = _357 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _455 = _453 != 0;
    float _457 = 1.0 / _437;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _461 = _359 + _361;
    float _463 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _467 = fma(_163, _371, _429);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    float _473 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = -_391;
    float _479 = fma(_443, 2.0, _477);
    float _481 = _357 * 2.0;
    float _483 = floor(_433);
    float _485 = fma(_169, _371, _421);
    float _487 = _461 + (-1.0);
    float _489 = fma(_463, -2.0, _393);
    float _491 = _471 * _457;
    float _493 = fma(_175, _371, _427);
    float _495 = _359 + _357;
    float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_64.x = _475;
    out.m_64.y = _473;
    out.m_64.z = _395;
    bool _499 = !_379;
    float _501 = _499 ? _193 : as_type<float>(_441);
    float _503 = _495 + (-1.0);
    bool _505 = _361 > 0.5;
    float _507 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _509 = _485 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _511 = floor(_481);
    float _513 = -_189;
    int _515 = _505 ? as_type<int>(_513) : as_type<int>(_189);
    float _517 = _467 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _521 = _483 > 0.0;
    float _523 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _525 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _527 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _529 = !_383;
    float _531 = _529 ? _189 : as_type<float>(_515);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _535 = _355 + _533;
    float _537 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _539 = _503;
    float _541 = _473;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_407)
    {
        _539 = _361;
    }
    float _545 = _539;
    float _547 = _545;
    if (_407)
    {
        _547 = _359;
    }
    float _549 = _547;
    float _551 = fma(_491, _535, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _553 = _483 >= 0.0;
    bool _555 = isnan(_483);
    bool _557 = _553 || _555;
    bool _559 = isnan(0.0);
    bool _561 = _557 || _559;
    float _563 = _497 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _565 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _567 = isnan(_355);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[83].w, _519);
    if (!_407)
    {
        _541 = _359;
    }
    float _579 = _541;
    float _581 = -_129;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[76].x, _479);
    float _585 = _579;
    if (!_407)
    {
        _543 = _361;
    }
    float _587 = _543;
    float _589 = _501 + (-0.5);
    bool _591 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _593 = isnan(_355);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = _425 + 0.5;
    float _605 = _587;
    if (_407)
    {
        _585 = _357;
    }
    float _607 = _585;
    float _609 = _527 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_407)
    {
        _605 = _359;
    }
    float _611 = _605;
    float _613 = fma(_563, _603, _583);
    int _615 = _561 ? 0 : 1;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _619 = _511 > 0.0;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _623 = _511 >= 0.0;
    bool _625 = isnan(_511);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = -_575;
    float _635 = _633 + 1.0;
    float _637 = -_609;
    float _639 = -_507;
    float _641 = fma(_637, _589, _639);
    float _643 = _611 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _645 = _601 * _635;
    float _647 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[83].z, _399);
    float _649 = _607 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _653 = _531 + 0.5;
    bool _655 = !_387;
    float _657 = _655 ? _193 : as_type<float>(_419);
    float _659 = -_617;
    float _661 = fma(_649, 2.0, _659);
    float _663 = _365 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _665 = _551 * _645;
    float _667 = -_601;
    float _669 = _667 + 1.0;
    float _671 = -_129;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[81].x, _661);
    float _675 = fma(_643, -2.0, _651);
    float _677 = _621 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _679 = fma(_663, _653, _673);
    float _681 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _675);
    float _683 = _657 + (-0.5);
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[115].x, _665);
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _689 = _509 + _687;
    float _691 = -_677;
    float _693 = -_681;
    float _695 = fma(_691, _683, _693);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _701 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[116].x, _685);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _705 = _517 + _703;
    float _707 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _697);
    float _709 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _699);
    float _711 = _689 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _713 = ~_615;
    int _715 = _713 + 1;
    int _717 = _715 + 1;
    float _719 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _707);
    float _721 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _709);
    float _723 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _577);
    int _725 = _717;
    if (!_521)
    {
        int _727 = ~_615;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = -_721;
    float _739 = _737 + 1.0;
    float _741 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _647);
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _745 = _525 + _743;
    float _747 = -_735;
    float _749 = fma(_425, _747, _613);
    float _751 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[28].x, _711);
    float _753 = fma(_501, _739, _641);
    float _755 = -_741;
    float _757 = _755 + 1.0;
    float _759 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _761 = log2(_759);
    float _763 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[28].z, _751);
    float _765 = _689 * _689;
    float _767 = -_757;
    float _769 = fma(_531, _767, _679);
    float _771 = _321 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _773 = _359 * 2.0;
    bool _775 = _763 >= 0.0;
    float _777 = fma(_705, _705, _765);
    float _779 = _325 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _781 = -_723;
    float _783 = _781 + 1.0;
    float _785 = _323 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _787 = fma(_745, _745, _777);
    float _789 = floor(_773);
    float _791 = fma(_657, _783, _695);
    float _793 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _761 * _129;
    float _797 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = _757;
    if (_775)
    {
        _801 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _803 = _801;
    float _805 = rsqrt(_787);
    float _807 = _701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _749;
    out.m_66.y = _753;
    out.m_66.z = _769;
    out.m_66.w = _791;
    bool _809 = !_447;
    int _811 = _809 ? 0 : 1;
    int _813 = as_type<int>(_803);
    if (_775)
    {
        float _815 = _803 * 5.0;
        _813 = as_type<int>(_815);
    }
    int _817 = _813;
    bool _819 = !_455;
    int _821 = _819 ? 0 : 1;
    out.m_68.x = _793;
    out.m_68.y = _797;
    out.m_68.z = _799;
    out.m_68.w = _807;
    float _823 = exp2(_795);
    bool _825 = _789 > 0.0;
    if (_775)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3151 = as_type<float>(_817);
        out.gl_Position.z = _3151;
    }
    bool _827 = _789 >= 0.0;
    bool _829 = isnan(_789);
    bool _831 = _827 || _829;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    bool _837 = !_451;
    int _839 = _837 ? 0 : 1;
    if (_775)
    {
        out.m_47.x = 0.0;
    }
    float _841 = _689 * _805;
    float _843 = _705 * _805;
    if (_775)
    {
        return out;
    }
    float _845 = -_841;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _849 = -_843;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    int _853 = _631 ? 0 : 1;
    float _855 = -_823;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _861 = _847 + _859;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _865 = _851 + _863;
    int _867 = ~_853;
    int _869 = _867 + 1;
    int _871 = _869 + 1;
    float _873 = _359 + (-0.5);
    float _875 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _877 = _871;
    if (!_619)
    {
        int _879 = ~_853;
        int _881 = _879 + 1;
        _877 = _881;
    }
    int _883 = _877;
    float _885 = -_841;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[18].w, _689);
    int _889 = _835 ? 0 : 1;
    float _891 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[28].x, _875);
    float _893 = in.m_70.x;
    float _895 = in.m_70.y;
    float _897 = in.m_70.z;
    int _899 = ~_889;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = -_843;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    int _909 = _903;
    if (!_825)
    {
        int _911 = ~_889;
        int _913 = _911 + 1;
        _909 = _913;
    }
    int _915 = _909;
    float _917 = _745 * _805;
    bool _919 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _921 = isnan(1.0);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _927 = _923 || _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _931 = 1.0 + _929;
    int _933 = abs(_811);
    float _935 = -_917;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    int _939 = abs(_839);
    float _941 = 1.0 / _931;
    float _943 = float(_933);
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _947 = _937 + _945;
    float _949 = float(_731);
    float _951 = _887 * _887;
    int _953 = abs(_821);
    float _955 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[28].z, _891);
    float _957 = float(_883);
    float _959 = _943 * _949;
    float _961 = float(_939);
    float _963 = fma(_907, _907, _951);
    float _965 = float(_953);
    float _967 = _959 * (-2.0);
    float _969 = float(_915);
    float _971 = _961 * _957;
    bool _973 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _981 = _977 || _979;
    float _983 = fma(_967, _893, _893);
    float _985 = fma(_537, _967, _537);
    float _987 = _965 * _969;
    float _989 = _981 ? _857 : 0.0;
    float _991 = _971 * (-2.0);
    float _993 = _357 + (-0.5);
    bool _995 = _955 >= 0.0;
    float _997 = _361 + _357;
    float _999 = _991;
    if (_927)
    {
        float _1001 = _989 * _941;
        _133 = _1001;
    }
    float _1003 = _133;
    float _1005 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].x, _983);
    float _1007 = fma(_991, _895, _895);
    float _1009 = fma(_523, _991, _523);
    float _1011 = fma(_985, _1003, _1005);
    float _1013 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1007);
    float _1015 = _997 + (-1.0);
    float _1017 = _1011 * 0.15915493667125701904296875;
    float _1019 = fma(_1009, _1003, _1013);
    if (_995)
    {
        _999 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1021 = _999;
    int _1023 = as_type<int>(_1021);
    if (_995)
    {
        out.m_47.x = 0.0;
    }
    float _1025 = _1017 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = _1019 * 0.15915493667125701904296875;
    if (_995)
    {
        float _1031 = _1021 * 5.0;
        _1023 = as_type<int>(_1031);
    }
    int _1033 = _1023;
    float _1035 = _1017 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    if (_995)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3469 = as_type<float>(_1033);
        out.gl_Position.z = _3469;
    }
    if (_995)
    {
        return out;
    }
    float _1039 = in.m_72.x;
    float _1041 = in.m_72.y;
    float _1043 = -_917;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _745);
    float _1047 = _987 * (-2.0);
    float _1049 = _361 + (-0.5);
    float _1051 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1053 = fma(_1045, _1045, _963);
    float _1055 = fma(_1047, _897, _897);
    float _1057 = _1029 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = fma(_1051, _1047, _1051);
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1055);
    float _1067 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1069 = fma(_1061, _1003, _1065);
    float _1071 = sqrt(_1053);
    float _1073 = _1069 * 0.15915493667125701904296875;
    float _1075 = _1029 * 6.283185482025146484375;
    float _1077 = cos(_1075);
    float _1079 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1081 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1083 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1085 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1087 = _1073 * 6.283185482025146484375;
    float _1089 = cos(_1087);
    float _1091 = _805 * _1071;
    float _1093 = _1083 * _1091;
    float _1095 = _1085 * _1091;
    float _1097 = _1037 * _1059;
    float _1099 = _1073 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = _1063 * _1093;
    float _1105 = _1027 * _1059;
    float _1107 = _1037 * _1077;
    float _1109 = _1067 * _1095;
    float _1111 = _1089 * _1103;
    float _1113 = _1059 * _1089;
    float _1115 = _1077 * _1089;
    float _1117 = _1027 * _1077;
    float _1119 = _1037 * _1111;
    float _1121 = fma(_1101, _1107, _1105);
    float _1123 = -_1103;
    float _1125 = _1101 * _1123;
    float _1127 = fma(_1101, _1105, _1107);
    float _1129 = fma(_1121, _1109, _1119);
    float _1131 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1133 = _1131 * 0.5;
    float _1135 = -_1117;
    float _1137 = fma(_1101, _1097, _1135);
    float _1139 = -_1097;
    float _1141 = fma(_1101, _1117, _1139);
    float _1143 = _1027 * _1111;
    float _1145 = fma(_1115, _1109, _1125);
    float _1147 = fma(_1137, _1133, _1129);
    float _1149 = fma(_1141, _1109, _1143);
    float _1151 = fma(_1113, _1133, _1145);
    float _1153 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1157 = fma(_1127, _1133, _1149);
    float _1159 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1153);
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1155);
    float _1163 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1159);
    float _1165 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1161);
    float _1167 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1169 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1171 = _517 + _1167;
    float _1173 = _525 + _1169;
    float _1175 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1179 = _1171 + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1173 + _1181;
    float _1185 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1175);
    float _1187 = _1179 * _1179;
    float _1189 = _1183 * _1183;
    float _1191 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1185);
    float _1193 = _1187 + _1189;
    float _1195 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1197 = sqrt(_1193);
    float _1199 = _509 + _1195;
    bool _1201 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = _1175;
    float _1205 = _1157;
    float _1207 = _1173;
    float _1209 = _1187;
    float _1211 = _1171;
    float _1213 = _1193;
    if (!_1201)
    {
        _1203 = _1173;
    }
    float _1215 = _1203;
    float _1217 = _1215;
    if (!_1201)
    {
        _1205 = _1189;
    }
    float _1219 = _1205;
    float _1221 = _1219;
    if (!_1201)
    {
        _1207 = _1199;
    }
    float _1223 = _1207;
    bool _1225 = !_1201;
    float _1227 = _1223;
    if (!_1225)
    {
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1233 = _1197 + _1231;
        float _1235 = _1199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = rsqrt(_1193);
        float _1239 = _1233 * _1229;
        float _1241 = _1239 * 0.15915493667125701904296875;
        float _1243 = _1241 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1241 * 6.283185482025146484375;
        float _1249 = cos(_1247);
        float _1251 = fma(_1245, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1253 = _1237 * _1251;
        float _1255 = _1249 + (-1.0);
        float _1257 = fma(_1179, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1259 = fma(_1183, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1261 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1265 = _1257 + _1263;
        float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1269 = _1259 + _1267;
        float _1271 = fma(_1199, _1249, _1261);
        float _1273 = _1265 * _1265;
        float _1275 = _1269 * _1269;
        _1227 = _1271;
        _1209 = _1273;
        _1221 = _1275;
        _1211 = _1257;
        _1217 = _1259;
    }
    float _1277 = _1227;
    float _1279 = _1209;
    float _1281 = _1221;
    float _1283 = _1211;
    float _1285 = _1217;
    float _1287 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1289 = _1277 + _1287;
    float _1291 = fma(_1289, _1289, _1279);
    float _1293 = _1291 + _1281;
    float _1295 = sqrt(_1293);
    bool _1297 = _1295 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1299 = isnan(_1295);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1305 = _1301 || _1303;
    float _1307 = _1291;
    float _1309 = _1277;
    if (!_1305)
    {
        _1307 = 1.0;
    }
    float _1311 = _1307;
    bool _1313 = !_1305;
    float _1315 = _1311;
    if (!_1313)
    {
        bool _1317 = _1295 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1319 = isnan(_1295);
        bool _1321 = _1317 || _1319;
        bool _1323 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1325 = _1321 || _1323;
        if (!_1325)
        {
            float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1329 = _1295 + _1327;
            float _1331 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1333 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1331;
            float _1335 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1337 = _1335 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1339 = 1.0 / _1333;
            float _1341 = _1329 * _1339;
            float _1343 = fma(_1341, _1337, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1315 = _1343;
            _1345 = true;
        }
        else
        {
            bool _1347 = _1295 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1349 = isnan(_1295);
            bool _1351 = _1347 || _1349;
            bool _1353 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1355 = _1351 || _1353;
            if (!_1355)
            {
                float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1359 = _1295 + _1357;
                float _1361 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1363 = _1361 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1365 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1367 = _1365 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1369 = 1.0 / _1363;
                float _1371 = _1359 * _1369;
                float _1373 = fma(_1371, _1367, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1315 = _1373;
                _1345 = true;
            }
            else
            {
                _1315 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1345 = false;
    float _1375 = _1315;
    float _1377 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1379 = _1277 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1383 = _1283 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1387 = _1285 + _1385;
    float _1389 = fma(_1379, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1391 = fma(_1383, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1393 = fma(_1387, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1395 = -_509;
    float _1397 = _1395 + _1389;
    float _1399 = -_517;
    float _1401 = _1399 + _1391;
    float _1403 = -_525;
    float _1405 = _1403 + _1393;
    float _1407 = _1397 * _1397;
    float _1409 = fma(_1401, _1401, _1407);
    float _1411 = fma(_1405, _1405, _1409);
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > 0.0;
    float _1417 = _1387;
    float _1419 = _1413;
    float _1421 = _1401;
    float _1423 = _1411;
    float _1425 = _1391;
    if (!_1415)
    {
        _1417 = _1391;
    }
    float _1427 = _1417;
    float _1429 = _1427;
    if (!_1415)
    {
        _1309 = _1389;
    }
    float _1431 = _1309;
    float _1433 = _1431;
    float _1435 = _1431;
    if (!_1415)
    {
        _1419 = _1393;
    }
    float _1437 = _1419;
    bool _1439 = !_1415;
    float _1441 = _1437;
    if (!_1439)
    {
        float _1443 = _209 * _209;
        float _1445 = fma(_205, _205, _1443);
        float _1447 = fma(_211, _211, _1445);
        float _1449 = rsqrt(_1411);
        float _1451 = sqrt(_1447);
        float _1453 = _1401 * _1449;
        float _1455 = _1397 * _1449;
        float _1457 = _1405 * _1449;
        bool _1459 = _1451 > 0.0;
        float _1461 = _1451;
        float _1463 = _1449;
        _1421 = _1453;
        if (!_1459)
        {
            _1461 = _1391;
        }
        float _1465 = _1461;
        _1429 = _1465;
        if (!_1459)
        {
            _1433 = _1389;
        }
        float _1467 = _1433;
        _1435 = _1467;
        if (!_1459)
        {
            _1463 = _1393;
        }
        float _1469 = _1463;
        bool _1471 = !_1459;
        _1441 = _1469;
        if (!_1471)
        {
            float _1473 = rsqrt(_1447);
            float _1475 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1477 = _209 * _1473;
            float _1479 = _205 * _1473;
            float _1481 = _211 * _1473;
            float _1483 = _1455 * _1477;
            float _1485 = fma(_1453, _1479, _1483);
            float _1487 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1489 = fma(_1457, _1481, _1485);
            float _1491 = _1489 * _1487;
            float _1493 = fma(_205, _1491, _1391);
            float _1495 = fma(_209, _1491, _1389);
            float _1497 = fma(_211, _1491, _1393);
            _1435 = _1495;
            _1429 = _1493;
            _1441 = _1497;
            _1421 = _1487;
            _1423 = _1475;
        }
    }
    float _1499 = _1435;
    float _1501 = _1429;
    float _1503 = _1441;
    float _1505 = _1421;
    float _1507 = _1423;
    float _1509 = -_841;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1499);
    float _1513 = -_843;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1501);
    float _1517 = -_917;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1503);
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1523 = _1511 + _1521;
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1527 = _1515 + _1525;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1531 = _1519 + _1529;
    float _1533 = _1523 * _1523;
    float _1535 = fma(_1527, _1527, _1533);
    float _1537 = fma(_1531, _1531, _1535);
    float _1539 = rsqrt(_1537);
    float _1541 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1543 = _1527 * _1541;
    float _1545 = _1531 * _1541;
    float _1547 = _1543 * _1543;
    float _1549 = _1545 * _1545;
    float _1551 = _1547 + _1549;
    float _1553 = sqrt(_1551);
    bool _1555 = _1553 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1559 = _1553 + _1557;
    float _1561 = _1505;
    float _1563 = _1559;
    float _1565 = _1523;
    float _1567 = _1543;
    if (_1555)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1561 = _1569;
    }
    float _1571 = _1561;
    float _1573 = _1571;
    if (_1555)
    {
        float _1575 = _1559 * _1571;
        _1563 = _1575;
    }
    float _1577 = _1563;
    if (_1555)
    {
        float _1579 = rsqrt(_1551);
        _1573 = _1579;
    }
    float _1581 = _1573;
    float _1583 = _1581;
    if (_1555)
    {
        float _1585 = _1577 * 0.15915493667125701904296875;
        _1425 = _1585;
    }
    float _1587 = _1425;
    float _1589 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1591 = _1531;
    if (_1555)
    {
        float _1593 = _1587 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        _1591 = _1595;
    }
    float _1597 = _1591;
    float _1599 = precise::max(0.0, _1589);
    float _1601 = _1507;
    float _1603 = _1599;
    if (_1555)
    {
        float _1605 = _1587 * 6.283185482025146484375;
        float _1607 = cos(_1605);
        _1601 = _1607;
    }
    float _1609 = _1601;
    float _1611 = -_1541;
    float _1613 = -_1599;
    float _1615 = fma(_1523, _1611, _1613);
    if (_1555)
    {
        float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1565 = _1617;
    }
    float _1619 = _1565;
    float _1621 = sqrt(_1537);
    float _1623 = _1597;
    float _1625 = _1619;
    if (_1555)
    {
        float _1627 = fma(_1597, _1619, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = _1629;
    if (!_1555)
    {
        _1625 = _1615;
    }
    float _1633 = _1625;
    float _1635 = _1633;
    if (_1555)
    {
        float _1637 = _1581 * _1629;
        _1213 = _1637;
    }
    float _1639 = _1213;
    if (!_1555)
    {
        _1631 = _1547;
    }
    float _1641 = _1631;
    float _1643 = _1641;
    float _1645 = _1609;
    if (_1555)
    {
        float _1647 = _1609 + (-1.0);
        _1603 = _1647;
    }
    float _1649 = _1603;
    float _1651 = _1649;
    if (_1555)
    {
        float _1653 = _1543 * _1639;
        _1567 = _1653;
    }
    float _1655 = _1567;
    if (_1555)
    {
        float _1657 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1583 = _1657;
    }
    float _1659 = _1583;
    if (!_1555)
    {
        _1651 = _1545;
    }
    float _1661 = _1651;
    float _1663 = _1661;
    if (_1555)
    {
        float _1665 = _1545 * _1639;
        _1663 = _1665;
    }
    float _1667 = _1663;
    if (_1555)
    {
        float _1669 = _1655 * _1655;
        _1643 = _1669;
    }
    float _1671 = _1643;
    if (_1555)
    {
        float _1673 = fma(_1615, _1609, _1659);
        _1635 = _1673;
    }
    float _1675 = _1635;
    if (!_1555)
    {
        _1645 = _1549;
    }
    float _1677 = _1645;
    float _1679 = _1677;
    if (_1555)
    {
        float _1681 = _1667 * _1667;
        _1679 = _1681;
    }
    float _1683 = _1679;
    float _1685 = fma(_1675, _1675, _1671);
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1689 = _1685 + _1683;
    float _1691 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1695 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1693);
    float _1697 = precise::clamp(_1695, 0.0, 1.0);
    float _1699 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1701 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1691);
    float _1703 = rsqrt(_1689);
    float _1705 = -_1697;
    float _1707 = _1705 + 1.0;
    float _1709 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1711 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1701);
    float _1713 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1699);
    float _1715 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1717 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1709);
    float _1719 = _1711 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1721 = abs(_1707);
    float _1723 = log2(_1721);
    float _1725 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1713);
    float _1727 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1715);
    float _1729 = _1719 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1731 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1717);
    float _1733 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1735 = -_1729;
    float _1737 = fma(_1735, _1687, 1.0);
    float _1739 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1727);
    float _1741 = _1703 * _1655;
    float _1743 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1745 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1747 = _1703 * _1675;
    float _1749 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1751 = _1703 * _1667;
    float _1753 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1745);
    float _1755 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1757 = -_1749;
    float _1759 = fma(_1747, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1757);
    float _1761 = _1739 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1763 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1753);
    float _1765 = log2(_1737);
    float _1767 = -_1751;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1759);
    float _1771 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1773 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1763);
    float _1775 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1777 = fma(_1769, -0.5, 0.5);
    float _1779 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1771);
    float _1781 = fma(_1769, 0.5, 0.5);
    float _1783 = exp2(_1755);
    float _1785 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1775);
    float _1787 = _1747 + 1.0;
    float _1789 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1779);
    float _1791 = fma(_1781, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1793 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1785);
    float _1795 = 1.0 / _1773;
    float _1797 = fma(_1781, _1791, -0.212114393711090087890625);
    float _1799 = _1765 * 0.693147182464599609375;
    float _1801 = fma(_1781, _1797, 1.570728778839111328125);
    float _1803 = sqrt(_1777);
    float _1805 = -_1747;
    float _1807 = fma(_1783, _1787, _1805);
    float _1809 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1789);
    float _1811 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1793);
    float _1813 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1815 = _1809 * _1795;
    float _1817 = _1811 * _1795;
    float _1819 = fma(_1815, 0.5, 0.5);
    float _1821 = fma(_1817, -0.5, 0.5);
    float _1823 = fma(_1807, 0.5, 0.5);
    float _1825 = _1803 * 0.636619746685028076171875;
    float3 _4758 = float3(_1819, _1821, _1813);
    float _1827 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4758, float3(0.0), isnan(_4758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4758, float3(0.0), isnan(_4758)), level(0.0)).x;
    float3 _4769 = float3(_1819, _1821, _1813);
    float4 _1830 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4769, float3(0.0), isnan(_4769)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4769, float3(0.0), isnan(_4769)), level(0.0)).xyzw;
    float _1832 = _1830.x;
    float _1834 = _1830.y;
    float _1836 = _1830.z;
    float _1838 = _1830.w;
    float _1840 = -_1801;
    float _1842 = fma(_1825, _1840, 1.0);
    float2 _4791 = float2(_1842, _1823);
    float3 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4791, float2(0.0), isnan(_4791)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4791, float2(0.0), isnan(_4791)), level(0.0)).xyz;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1856 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1858 = _1809 + _1773;
    float _1860 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1854);
    float _1862 = _1858 * 0.5;
    float _1864 = exp2(_1856);
    float _1866 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1860);
    float _1868 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1866);
    float _1870 = _1773 * 0.5;
    float _1872 = _1868 + _1773;
    float _1874 = -_1864;
    float _1876 = _1874 + 1.0;
    float _1878 = fma(_1811, -0.5, _1870);
    float _1880 = _1872 * 0.5;
    float _1882 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1809;
    out.gl_Position.y = _1811;
    out.gl_Position.z = _1868;
    out.gl_Position.w = _1773;
    float _1884 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_74.x = _1862;
    out.m_74.y = _1878;
    out.m_74.z = _1880;
    out.m_74.w = _1773;
    out.m_47.x = _1884;
    float _1886 = _1882 * _1827;
    float _1888 = -_1882;
    float _1890 = _1888 + 1.0;
    float _1892 = _1838 * _1886;
    float _1894 = _1852 * _1886;
    float _1896 = fma(_1848, _1892, _1832);
    float _1898 = fma(_1850, _1892, _1834);
    float _1900 = _1838 * _1890;
    float _1902 = fma(_1838, _1894, _1836);
    out.m_76.x = _1896;
    out.m_76.y = _1898;
    out.m_76.z = _1902;
    out.m_76.w = _1900;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1345 = false;
    bool _347 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1959 = as_type<float>(_111);
        out.gl_Position.z = _1959;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_47.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2028 = as_type<float>(_149);
        out.gl_Position.z = _2028;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_151) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_151) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _187 = !_179;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_183;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = _155 * _161;
    float _197 = _155 * _167;
    float _199 = fma(_153, _159, _195);
    float _201 = _155 * _173;
    float _203 = fma(_153, _165, _197);
    float _205 = fma(_157, _163, _199);
    float _207 = fma(_153, _171, _201);
    float _209 = fma(_157, _169, _203);
    float _211 = fma(_157, _175, _207);
    bool _213 = !_185;
    float _231;
    if (!_213)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_95);
        float _237 = 1.0 / _235;
        float _239 = _129 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _245 = _241 + _243;
    bool _247 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _249 = isnan(_241);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _259;
    bool _263 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _265 = isnan(_241);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_257;
    float _277 = _275 + 1.0;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _279;
    float _283 = 1.0 / _261;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _287 = _273 * _277;
    float _289 = -_273;
    float _291 = _289 + 1.0;
    float _293 = _245 * _283;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _295;
    float _299 = fma(_281, _293, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _301;
    float _305 = fma(_297, _293, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _307 = fma(_303, _293, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _309 = _299 * _287;
    float _311 = _307 * _287;
    float _313 = _305 * _287;
    float _315 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[107].x, _309);
    float _317 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[107].y, _311);
    float _319 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[107].z, _313);
    float _321 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[108].x, _315);
    float _323 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[108].y, _317);
    float _325 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[108].z, _319);
    bool _327 = !_285;
    float _345;
    if (!_327)
    {
        float _329 = in.m_62.x;
        float _331 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _333 = _329 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _337 = _335 * _331;
        float _339 = floor(_337);
        float _341 = -_339;
        float _343 = _337 + _341;
        _345 = _343;
        _347 = true;
    }
    else
    {
        float _349 = float(_95);
        float _351 = 1.0 / _349;
        float _353 = _129 * _351;
        _345 = _353;
    }
    _347 = false;
    float _355 = _345;
    float _357 = in.m_62.x;
    float _359 = in.m_62.y;
    float _361 = in.m_62.z;
    float _363 = in.m_62.w;
    float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _367 = in.m_44.x;
    float _369 = in.m_44.y;
    float _371 = in.m_44.z;
    int _373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _375 = _373 != 0;
    int _377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _379 = _377 != 0;
    int _381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _383 = _381 != 0;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _387 = _385 != 0;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _395 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _397 = _363 > 0.5;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _401 = _357 > 0.5;
    float _403 = _161 * _369;
    int _405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _407 = _405 != 0;
    float _409 = _167 * _369;
    float _411 = -_189;
    int _413 = _401 ? as_type<int>(_411) : as_type<int>(_189);
    float _415 = _173 * _369;
    float _417 = -_193;
    int _419 = _397 ? as_type<int>(_417) : as_type<int>(_193);
    float _421 = fma(_165, _367, _409);
    bool _423 = !_375;
    float _425 = _423 ? _189 : as_type<float>(_413);
    float _427 = fma(_171, _367, _415);
    float _429 = fma(_159, _367, _403);
    bool _431 = _359 > 0.5;
    float _433 = _361 * 2.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _439 = -_193;
    int _441 = _431 ? as_type<int>(_439) : as_type<int>(_193);
    float _443 = _357 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _455 = _453 != 0;
    float _457 = 1.0 / _437;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _461 = _359 + _361;
    float _463 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _467 = fma(_163, _371, _429);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _469;
    float _473 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = _465 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _477 = -_391;
    float _479 = fma(_443, 2.0, _477);
    float _481 = _357 * 2.0;
    float _483 = floor(_433);
    float _485 = fma(_169, _371, _421);
    float _487 = _461 + (-1.0);
    float _489 = fma(_463, -2.0, _393);
    float _491 = _471 * _457;
    float _493 = fma(_175, _371, _427);
    float _495 = _359 + _357;
    float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_64.x = _475;
    out.m_64.y = _473;
    out.m_64.z = _395;
    bool _499 = !_379;
    float _501 = _499 ? _193 : as_type<float>(_441);
    float _503 = _495 + (-1.0);
    bool _505 = _361 > 0.5;
    float _507 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _489);
    float _509 = _485 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _511 = floor(_481);
    float _513 = -_189;
    int _515 = _505 ? as_type<int>(_513) : as_type<int>(_189);
    float _517 = _467 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _521 = _483 > 0.0;
    float _523 = fma(_487, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _525 = _493 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _527 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _529 = !_383;
    float _531 = _529 ? _189 : as_type<float>(_515);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _535 = _355 + _533;
    float _537 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _539 = _503;
    float _541 = _473;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_407)
    {
        _539 = _361;
    }
    float _545 = _539;
    float _547 = _545;
    if (_407)
    {
        _547 = _359;
    }
    float _549 = _547;
    float _551 = fma(_491, _535, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _553 = _483 >= 0.0;
    bool _555 = isnan(_483);
    bool _557 = _553 || _555;
    bool _559 = isnan(0.0);
    bool _561 = _557 || _559;
    float _563 = _497 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _565 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _567 = isnan(_355);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[83].w, _519);
    if (!_407)
    {
        _541 = _359;
    }
    float _579 = _541;
    float _581 = -_129;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[76].x, _479);
    float _585 = _579;
    if (!_407)
    {
        _543 = _361;
    }
    float _587 = _543;
    float _589 = _501 + (-0.5);
    bool _591 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _593 = isnan(_355);
    bool _595 = _591 || _593;
    bool _597 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _599 = _595 || _597;
    float _601 = float(_599);
    float _603 = _425 + 0.5;
    float _605 = _587;
    if (_407)
    {
        _585 = _357;
    }
    float _607 = _585;
    float _609 = _527 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_407)
    {
        _605 = _359;
    }
    float _611 = _605;
    float _613 = fma(_563, _603, _583);
    int _615 = _561 ? 0 : 1;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _619 = _511 > 0.0;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _623 = _511 >= 0.0;
    bool _625 = isnan(_511);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = -_575;
    float _635 = _633 + 1.0;
    float _637 = -_609;
    float _639 = -_507;
    float _641 = fma(_637, _589, _639);
    float _643 = _611 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _645 = _601 * _635;
    float _647 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[83].z, _399);
    float _649 = _607 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _651 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _653 = _531 + 0.5;
    bool _655 = !_387;
    float _657 = _655 ? _193 : as_type<float>(_419);
    float _659 = -_617;
    float _661 = fma(_649, 2.0, _659);
    float _663 = _365 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _665 = _551 * _645;
    float _667 = -_601;
    float _669 = _667 + 1.0;
    float _671 = -_129;
    float _673 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[81].x, _661);
    float _675 = fma(_643, -2.0, _651);
    float _677 = _621 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _679 = fma(_663, _653, _673);
    float _681 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _675);
    float _683 = _657 + (-0.5);
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[115].x, _665);
    float _687 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _689 = _509 + _687;
    float _691 = -_677;
    float _693 = -_681;
    float _695 = fma(_691, _683, _693);
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _701 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[116].x, _685);
    float _703 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _705 = _517 + _703;
    float _707 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _697);
    float _709 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _699);
    float _711 = _689 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _713 = ~_615;
    int _715 = _713 + 1;
    int _717 = _715 + 1;
    float _719 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _707);
    float _721 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _709);
    float _723 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _577);
    int _725 = _717;
    if (!_521)
    {
        int _727 = ~_615;
        int _729 = _727 + 1;
        _725 = _729;
    }
    int _731 = _725;
    float _733 = -_719;
    float _735 = _733 + 1.0;
    float _737 = -_721;
    float _739 = _737 + 1.0;
    float _741 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _647);
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _745 = _525 + _743;
    float _747 = -_735;
    float _749 = fma(_425, _747, _613);
    float _751 = fma(_705, (*spvDescriptorSet0.vp_c8)._m0[28].x, _711);
    float _753 = fma(_501, _739, _641);
    float _755 = -_741;
    float _757 = _755 + 1.0;
    float _759 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _761 = log2(_759);
    float _763 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[28].z, _751);
    float _765 = _689 * _689;
    float _767 = -_757;
    float _769 = fma(_531, _767, _679);
    float _771 = _321 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _773 = _359 * 2.0;
    bool _775 = _763 >= 0.0;
    float _777 = fma(_705, _705, _765);
    float _779 = _325 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _781 = -_723;
    float _783 = _781 + 1.0;
    float _785 = _323 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _787 = fma(_745, _745, _777);
    float _789 = floor(_773);
    float _791 = fma(_657, _783, _695);
    float _793 = _771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _795 = _761 * _129;
    float _797 = _785 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _799 = _779 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _801 = _757;
    if (_775)
    {
        _801 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _803 = _801;
    float _805 = rsqrt(_787);
    float _807 = _701 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _749;
    out.m_66.y = _753;
    out.m_66.z = _769;
    out.m_66.w = _791;
    bool _809 = !_447;
    int _811 = _809 ? 0 : 1;
    int _813 = as_type<int>(_803);
    if (_775)
    {
        float _815 = _803 * 5.0;
        _813 = as_type<int>(_815);
    }
    int _817 = _813;
    bool _819 = !_455;
    int _821 = _819 ? 0 : 1;
    out.m_68.x = _793;
    out.m_68.y = _797;
    out.m_68.z = _799;
    out.m_68.w = _807;
    float _823 = exp2(_795);
    bool _825 = _789 > 0.0;
    if (_775)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3151 = as_type<float>(_817);
        out.gl_Position.z = _3151;
    }
    bool _827 = _789 >= 0.0;
    bool _829 = isnan(_789);
    bool _831 = _827 || _829;
    bool _833 = isnan(0.0);
    bool _835 = _831 || _833;
    bool _837 = !_451;
    int _839 = _837 ? 0 : 1;
    if (_775)
    {
        out.m_47.x = 0.0;
    }
    float _841 = _689 * _805;
    float _843 = _705 * _805;
    if (_775)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _845 = -_841;
    float _847 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _849 = -_843;
    float _851 = fma(_849, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    int _853 = _631 ? 0 : 1;
    float _855 = -_823;
    float _857 = _855 + 1.0;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _861 = _847 + _859;
    float _863 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _865 = _851 + _863;
    int _867 = ~_853;
    int _869 = _867 + 1;
    int _871 = _869 + 1;
    float _873 = _359 + (-0.5);
    float _875 = _861 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _877 = _871;
    if (!_619)
    {
        int _879 = ~_853;
        int _881 = _879 + 1;
        _877 = _881;
    }
    int _883 = _877;
    float _885 = -_841;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[18].w, _689);
    int _889 = _835 ? 0 : 1;
    float _891 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[28].x, _875);
    float _893 = in.m_70.x;
    float _895 = in.m_70.y;
    float _897 = in.m_70.z;
    int _899 = ~_889;
    int _901 = _899 + 1;
    int _903 = _901 + 1;
    float _905 = -_843;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _705);
    int _909 = _903;
    if (!_825)
    {
        int _911 = ~_889;
        int _913 = _911 + 1;
        _909 = _913;
    }
    int _915 = _909;
    float _917 = _745 * _805;
    bool _919 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _921 = isnan(1.0);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _927 = _923 || _925;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _931 = 1.0 + _929;
    int _933 = abs(_811);
    float _935 = -_917;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[18].w, _525);
    int _939 = abs(_839);
    float _941 = 1.0 / _931;
    float _943 = float(_933);
    float _945 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _947 = _937 + _945;
    float _949 = float(_731);
    float _951 = _887 * _887;
    int _953 = abs(_821);
    float _955 = fma(_947, (*spvDescriptorSet0.vp_c8)._m0[28].z, _891);
    float _957 = float(_883);
    float _959 = _943 * _949;
    float _961 = float(_939);
    float _963 = fma(_907, _907, _951);
    float _965 = float(_953);
    float _967 = _959 * (-2.0);
    float _969 = float(_915);
    float _971 = _961 * _957;
    bool _973 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _975 = isnan(0.0);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _981 = _977 || _979;
    float _983 = fma(_967, _893, _893);
    float _985 = fma(_537, _967, _537);
    float _987 = _965 * _969;
    float _989 = _981 ? _857 : 0.0;
    float _991 = _971 * (-2.0);
    float _993 = _357 + (-0.5);
    bool _995 = _955 >= 0.0;
    float _997 = _361 + _357;
    float _999 = _991;
    if (_927)
    {
        float _1001 = _989 * _941;
        _133 = _1001;
    }
    float _1003 = _133;
    float _1005 = fma(_993, (*spvDescriptorSet0.vp_c9)._m0[196].x, _983);
    float _1007 = fma(_991, _895, _895);
    float _1009 = fma(_523, _991, _523);
    float _1011 = fma(_985, _1003, _1005);
    float _1013 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1007);
    float _1015 = _997 + (-1.0);
    float _1017 = _1011 * 0.15915493667125701904296875;
    float _1019 = fma(_1009, _1003, _1013);
    if (_995)
    {
        _999 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1021 = _999;
    int _1023 = as_type<int>(_1021);
    if (_995)
    {
        out.m_47.x = 0.0;
    }
    float _1025 = _1017 * 6.283185482025146484375;
    float _1027 = sin(_1025);
    float _1029 = _1019 * 0.15915493667125701904296875;
    if (_995)
    {
        float _1031 = _1021 * 5.0;
        _1023 = as_type<int>(_1031);
    }
    int _1033 = _1023;
    float _1035 = _1017 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    if (_995)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3469 = as_type<float>(_1033);
        out.gl_Position.z = _3469;
    }
    if (_995)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1039 = in.m_72.x;
    float _1041 = in.m_72.y;
    float _1043 = -_917;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _745);
    float _1047 = _987 * (-2.0);
    float _1049 = _361 + (-0.5);
    float _1051 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1053 = fma(_1045, _1045, _963);
    float _1055 = fma(_1047, _897, _897);
    float _1057 = _1029 * 6.283185482025146484375;
    float _1059 = sin(_1057);
    float _1061 = fma(_1051, _1047, _1051);
    float _1063 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1055);
    float _1067 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1069 = fma(_1061, _1003, _1065);
    float _1071 = sqrt(_1053);
    float _1073 = _1069 * 0.15915493667125701904296875;
    float _1075 = _1029 * 6.283185482025146484375;
    float _1077 = cos(_1075);
    float _1079 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1081 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1083 = _1079 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1085 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1087 = _1073 * 6.283185482025146484375;
    float _1089 = cos(_1087);
    float _1091 = _805 * _1071;
    float _1093 = _1083 * _1091;
    float _1095 = _1085 * _1091;
    float _1097 = _1037 * _1059;
    float _1099 = _1073 * 6.283185482025146484375;
    float _1101 = sin(_1099);
    float _1103 = _1063 * _1093;
    float _1105 = _1027 * _1059;
    float _1107 = _1037 * _1077;
    float _1109 = _1067 * _1095;
    float _1111 = _1089 * _1103;
    float _1113 = _1059 * _1089;
    float _1115 = _1077 * _1089;
    float _1117 = _1027 * _1077;
    float _1119 = _1037 * _1111;
    float _1121 = fma(_1101, _1107, _1105);
    float _1123 = -_1103;
    float _1125 = _1101 * _1123;
    float _1127 = fma(_1101, _1105, _1107);
    float _1129 = fma(_1121, _1109, _1119);
    float _1131 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1133 = _1131 * 0.5;
    float _1135 = -_1117;
    float _1137 = fma(_1101, _1097, _1135);
    float _1139 = -_1097;
    float _1141 = fma(_1101, _1117, _1139);
    float _1143 = _1027 * _1111;
    float _1145 = fma(_1115, _1109, _1125);
    float _1147 = fma(_1137, _1133, _1129);
    float _1149 = fma(_1141, _1109, _1143);
    float _1151 = fma(_1113, _1133, _1145);
    float _1153 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1157 = fma(_1127, _1133, _1149);
    float _1159 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1153);
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1155);
    float _1163 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1159);
    float _1165 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1161);
    float _1167 = _1163 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1169 = _1165 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1171 = _517 + _1167;
    float _1173 = _525 + _1169;
    float _1175 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1179 = _1171 + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1183 = _1173 + _1181;
    float _1185 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1175);
    float _1187 = _1179 * _1179;
    float _1189 = _1183 * _1183;
    float _1191 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1185);
    float _1193 = _1187 + _1189;
    float _1195 = _1191 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1197 = sqrt(_1193);
    float _1199 = _509 + _1195;
    bool _1201 = _1197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1203 = _1175;
    float _1205 = _1157;
    float _1207 = _1173;
    float _1209 = _1187;
    float _1211 = _1171;
    float _1213 = _1193;
    if (!_1201)
    {
        _1203 = _1173;
    }
    float _1215 = _1203;
    float _1217 = _1215;
    if (!_1201)
    {
        _1205 = _1189;
    }
    float _1219 = _1205;
    float _1221 = _1219;
    if (!_1201)
    {
        _1207 = _1199;
    }
    float _1223 = _1207;
    bool _1225 = !_1201;
    float _1227 = _1223;
    if (!_1225)
    {
        float _1229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1231 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1233 = _1197 + _1231;
        float _1235 = _1199 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1237 = rsqrt(_1193);
        float _1239 = _1233 * _1229;
        float _1241 = _1239 * 0.15915493667125701904296875;
        float _1243 = _1241 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        float _1247 = _1241 * 6.283185482025146484375;
        float _1249 = cos(_1247);
        float _1251 = fma(_1245, _1235, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1253 = _1237 * _1251;
        float _1255 = _1249 + (-1.0);
        float _1257 = fma(_1179, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1259 = fma(_1183, _1253, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1261 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1265 = _1257 + _1263;
        float _1267 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1269 = _1259 + _1267;
        float _1271 = fma(_1199, _1249, _1261);
        float _1273 = _1265 * _1265;
        float _1275 = _1269 * _1269;
        _1227 = _1271;
        _1209 = _1273;
        _1221 = _1275;
        _1211 = _1257;
        _1217 = _1259;
    }
    float _1277 = _1227;
    float _1279 = _1209;
    float _1281 = _1221;
    float _1283 = _1211;
    float _1285 = _1217;
    float _1287 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1289 = _1277 + _1287;
    float _1291 = fma(_1289, _1289, _1279);
    float _1293 = _1291 + _1281;
    float _1295 = sqrt(_1293);
    bool _1297 = _1295 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1299 = isnan(_1295);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1305 = _1301 || _1303;
    float _1307 = _1291;
    float _1309 = _1277;
    if (!_1305)
    {
        _1307 = 1.0;
    }
    float _1311 = _1307;
    bool _1313 = !_1305;
    float _1315 = _1311;
    if (!_1313)
    {
        bool _1317 = _1295 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1319 = isnan(_1295);
        bool _1321 = _1317 || _1319;
        bool _1323 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1325 = _1321 || _1323;
        if (!_1325)
        {
            float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1329 = _1295 + _1327;
            float _1331 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1333 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1331;
            float _1335 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1337 = _1335 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1339 = 1.0 / _1333;
            float _1341 = _1329 * _1339;
            float _1343 = fma(_1341, _1337, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1315 = _1343;
            _1345 = true;
        }
        else
        {
            bool _1347 = _1295 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1349 = isnan(_1295);
            bool _1351 = _1347 || _1349;
            bool _1353 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1355 = _1351 || _1353;
            if (!_1355)
            {
                float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1359 = _1295 + _1357;
                float _1361 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1363 = _1361 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1365 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1367 = _1365 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1369 = 1.0 / _1363;
                float _1371 = _1359 * _1369;
                float _1373 = fma(_1371, _1367, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1315 = _1373;
                _1345 = true;
            }
            else
            {
                _1315 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1345 = false;
    float _1375 = _1315;
    float _1377 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1379 = _1277 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1383 = _1283 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1387 = _1285 + _1385;
    float _1389 = fma(_1379, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1391 = fma(_1383, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1393 = fma(_1387, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1395 = -_509;
    float _1397 = _1395 + _1389;
    float _1399 = -_517;
    float _1401 = _1399 + _1391;
    float _1403 = -_525;
    float _1405 = _1403 + _1393;
    float _1407 = _1397 * _1397;
    float _1409 = fma(_1401, _1401, _1407);
    float _1411 = fma(_1405, _1405, _1409);
    float _1413 = sqrt(_1411);
    bool _1415 = _1413 > 0.0;
    float _1417 = _1387;
    float _1419 = _1413;
    float _1421 = _1401;
    float _1423 = _1411;
    float _1425 = _1391;
    if (!_1415)
    {
        _1417 = _1391;
    }
    float _1427 = _1417;
    float _1429 = _1427;
    if (!_1415)
    {
        _1309 = _1389;
    }
    float _1431 = _1309;
    float _1433 = _1431;
    float _1435 = _1431;
    if (!_1415)
    {
        _1419 = _1393;
    }
    float _1437 = _1419;
    bool _1439 = !_1415;
    float _1441 = _1437;
    if (!_1439)
    {
        float _1443 = _209 * _209;
        float _1445 = fma(_205, _205, _1443);
        float _1447 = fma(_211, _211, _1445);
        float _1449 = rsqrt(_1411);
        float _1451 = sqrt(_1447);
        float _1453 = _1401 * _1449;
        float _1455 = _1397 * _1449;
        float _1457 = _1405 * _1449;
        bool _1459 = _1451 > 0.0;
        float _1461 = _1451;
        float _1463 = _1449;
        _1421 = _1453;
        if (!_1459)
        {
            _1461 = _1391;
        }
        float _1465 = _1461;
        _1429 = _1465;
        if (!_1459)
        {
            _1433 = _1389;
        }
        float _1467 = _1433;
        _1435 = _1467;
        if (!_1459)
        {
            _1463 = _1393;
        }
        float _1469 = _1463;
        bool _1471 = !_1459;
        _1441 = _1469;
        if (!_1471)
        {
            float _1473 = rsqrt(_1447);
            float _1475 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1477 = _209 * _1473;
            float _1479 = _205 * _1473;
            float _1481 = _211 * _1473;
            float _1483 = _1455 * _1477;
            float _1485 = fma(_1453, _1479, _1483);
            float _1487 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1489 = fma(_1457, _1481, _1485);
            float _1491 = _1489 * _1487;
            float _1493 = fma(_205, _1491, _1391);
            float _1495 = fma(_209, _1491, _1389);
            float _1497 = fma(_211, _1491, _1393);
            _1435 = _1495;
            _1429 = _1493;
            _1441 = _1497;
            _1421 = _1487;
            _1423 = _1475;
        }
    }
    float _1499 = _1435;
    float _1501 = _1429;
    float _1503 = _1441;
    float _1505 = _1421;
    float _1507 = _1423;
    float _1509 = -_841;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1499);
    float _1513 = -_843;
    float _1515 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1501);
    float _1517 = -_917;
    float _1519 = fma(_1517, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1503);
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1523 = _1511 + _1521;
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1527 = _1515 + _1525;
    float _1529 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1531 = _1519 + _1529;
    float _1533 = _1523 * _1523;
    float _1535 = fma(_1527, _1527, _1533);
    float _1537 = fma(_1531, _1531, _1535);
    float _1539 = rsqrt(_1537);
    float _1541 = _1539 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1543 = _1527 * _1541;
    float _1545 = _1531 * _1541;
    float _1547 = _1543 * _1543;
    float _1549 = _1545 * _1545;
    float _1551 = _1547 + _1549;
    float _1553 = sqrt(_1551);
    bool _1555 = _1553 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1557 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1559 = _1553 + _1557;
    float _1561 = _1505;
    float _1563 = _1559;
    float _1565 = _1523;
    float _1567 = _1543;
    if (_1555)
    {
        float _1569 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1561 = _1569;
    }
    float _1571 = _1561;
    float _1573 = _1571;
    if (_1555)
    {
        float _1575 = _1559 * _1571;
        _1563 = _1575;
    }
    float _1577 = _1563;
    if (_1555)
    {
        float _1579 = rsqrt(_1551);
        _1573 = _1579;
    }
    float _1581 = _1573;
    float _1583 = _1581;
    if (_1555)
    {
        float _1585 = _1577 * 0.15915493667125701904296875;
        _1425 = _1585;
    }
    float _1587 = _1425;
    float _1589 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1591 = _1531;
    if (_1555)
    {
        float _1593 = _1587 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        _1591 = _1595;
    }
    float _1597 = _1591;
    float _1599 = precise::max(0.0, _1589);
    float _1601 = _1507;
    float _1603 = _1599;
    if (_1555)
    {
        float _1605 = _1587 * 6.283185482025146484375;
        float _1607 = cos(_1605);
        _1601 = _1607;
    }
    float _1609 = _1601;
    float _1611 = -_1541;
    float _1613 = -_1599;
    float _1615 = fma(_1523, _1611, _1613);
    if (_1555)
    {
        float _1617 = _1615 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1565 = _1617;
    }
    float _1619 = _1565;
    float _1621 = sqrt(_1537);
    float _1623 = _1597;
    float _1625 = _1619;
    if (_1555)
    {
        float _1627 = fma(_1597, _1619, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1623 = _1627;
    }
    float _1629 = _1623;
    float _1631 = _1629;
    if (!_1555)
    {
        _1625 = _1615;
    }
    float _1633 = _1625;
    float _1635 = _1633;
    if (_1555)
    {
        float _1637 = _1581 * _1629;
        _1213 = _1637;
    }
    float _1639 = _1213;
    if (!_1555)
    {
        _1631 = _1547;
    }
    float _1641 = _1631;
    float _1643 = _1641;
    float _1645 = _1609;
    if (_1555)
    {
        float _1647 = _1609 + (-1.0);
        _1603 = _1647;
    }
    float _1649 = _1603;
    float _1651 = _1649;
    if (_1555)
    {
        float _1653 = _1543 * _1639;
        _1567 = _1653;
    }
    float _1655 = _1567;
    if (_1555)
    {
        float _1657 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1583 = _1657;
    }
    float _1659 = _1583;
    if (!_1555)
    {
        _1651 = _1545;
    }
    float _1661 = _1651;
    float _1663 = _1661;
    if (_1555)
    {
        float _1665 = _1545 * _1639;
        _1663 = _1665;
    }
    float _1667 = _1663;
    if (_1555)
    {
        float _1669 = _1655 * _1655;
        _1643 = _1669;
    }
    float _1671 = _1643;
    if (_1555)
    {
        float _1673 = fma(_1615, _1609, _1659);
        _1635 = _1673;
    }
    float _1675 = _1635;
    if (!_1555)
    {
        _1645 = _1549;
    }
    float _1677 = _1645;
    float _1679 = _1677;
    if (_1555)
    {
        float _1681 = _1667 * _1667;
        _1679 = _1681;
    }
    float _1683 = _1679;
    float _1685 = fma(_1675, _1675, _1671);
    float _1687 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1689 = _1685 + _1683;
    float _1691 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1693 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1695 = fma(_1621, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1693);
    float _1697 = precise::clamp(_1695, 0.0, 1.0);
    float _1699 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1701 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1691);
    float _1703 = rsqrt(_1689);
    float _1705 = -_1697;
    float _1707 = _1705 + 1.0;
    float _1709 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1711 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1701);
    float _1713 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1699);
    float _1715 = _1511 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1717 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1709);
    float _1719 = _1711 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1721 = abs(_1707);
    float _1723 = log2(_1721);
    float _1725 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1713);
    float _1727 = fma(_1515, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1715);
    float _1729 = _1719 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1731 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1717);
    float _1733 = _1725 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1735 = -_1729;
    float _1737 = fma(_1735, _1687, 1.0);
    float _1739 = fma(_1519, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1727);
    float _1741 = _1703 * _1655;
    float _1743 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1745 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1747 = _1703 * _1675;
    float _1749 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1751 = _1703 * _1667;
    float _1753 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1745);
    float _1755 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1757 = -_1749;
    float _1759 = fma(_1747, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1757);
    float _1761 = _1739 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1763 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1753);
    float _1765 = log2(_1737);
    float _1767 = -_1751;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1759);
    float _1771 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1773 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1763);
    float _1775 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1777 = fma(_1769, -0.5, 0.5);
    float _1779 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1771);
    float _1781 = fma(_1769, 0.5, 0.5);
    float _1783 = exp2(_1755);
    float _1785 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1775);
    float _1787 = _1747 + 1.0;
    float _1789 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1779);
    float _1791 = fma(_1781, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1793 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1785);
    float _1795 = 1.0 / _1773;
    float _1797 = fma(_1781, _1791, -0.212114393711090087890625);
    float _1799 = _1765 * 0.693147182464599609375;
    float _1801 = fma(_1781, _1797, 1.570728778839111328125);
    float _1803 = sqrt(_1777);
    float _1805 = -_1747;
    float _1807 = fma(_1783, _1787, _1805);
    float _1809 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1789);
    float _1811 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1793);
    float _1813 = _1799 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1815 = _1809 * _1795;
    float _1817 = _1811 * _1795;
    float _1819 = fma(_1815, 0.5, 0.5);
    float _1821 = fma(_1817, -0.5, 0.5);
    float _1823 = fma(_1807, 0.5, 0.5);
    float _1825 = _1803 * 0.636619746685028076171875;
    float3 _4758 = float3(_1819, _1821, _1813);
    float _1827 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4758, float3(0.0), isnan(_4758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4758, float3(0.0), isnan(_4758)), level(0.0)).x;
    float3 _4769 = float3(_1819, _1821, _1813);
    float4 _1830 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4769, float3(0.0), isnan(_4769)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4769, float3(0.0), isnan(_4769)), level(0.0)).xyzw;
    float _1832 = _1830.x;
    float _1834 = _1830.y;
    float _1836 = _1830.z;
    float _1838 = _1830.w;
    float _1840 = -_1801;
    float _1842 = fma(_1825, _1840, 1.0);
    float2 _4791 = float2(_1842, _1823);
    float3 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4791, float2(0.0), isnan(_4791)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4791, float2(0.0), isnan(_4791)), level(0.0)).xyz;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = _1733 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1856 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1858 = _1809 + _1773;
    float _1860 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1854);
    float _1862 = _1858 * 0.5;
    float _1864 = exp2(_1856);
    float _1866 = fma(_1719, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1860);
    float _1868 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1866);
    float _1870 = _1773 * 0.5;
    float _1872 = _1868 + _1773;
    float _1874 = -_1864;
    float _1876 = _1874 + 1.0;
    float _1878 = fma(_1811, -0.5, _1870);
    float _1880 = _1872 * 0.5;
    float _1882 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1809;
    out.gl_Position.y = _1811;
    out.gl_Position.z = _1868;
    out.gl_Position.w = _1773;
    float _1884 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_74.x = _1862;
    out.m_74.y = _1878;
    out.m_74.z = _1880;
    out.m_74.w = _1773;
    out.m_47.x = _1884;
    float _1886 = _1882 * _1827;
    float _1888 = -_1882;
    float _1890 = _1888 + 1.0;
    float _1892 = _1838 * _1886;
    float _1894 = _1852 * _1886;
    float _1896 = fma(_1848, _1892, _1832);
    float _1898 = fma(_1850, _1892, _1834);
    float _1900 = _1838 * _1890;
    float _1902 = fma(_1838, _1894, _1836);
    out.m_76.x = _1896;
    out.m_76.y = _1898;
    out.m_76.z = _1902;
    out.m_76.w = _1900;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

