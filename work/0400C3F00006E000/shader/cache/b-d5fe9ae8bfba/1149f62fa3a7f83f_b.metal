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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_98 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 m_96 [[user(locn14)]];
    float4 m_88 [[user(locn15)]];
    float4 m_100 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_76 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5350 = false;
    bool _783 = false;
    bool _641 = false;
    bool _459 = false;
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_46.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_49.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6154 = as_type<float>(_135);
        out.gl_Position.z = _6154;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = 0.0;
    float _157 = _153;
    if (_149)
    {
        float _159 = float(_119);
        _155 = _159;
    }
    float _161 = _155;
    bool _163 = _153 >= _161;
    bool _165 = !_149;
    bool _167 = _163 || _165;
    if (_167)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _129;
    if (_167)
    {
        out.m_49.x = 0.0;
    }
    if (_167)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6223 = as_type<float>(_173);
        out.gl_Position.z = _6223;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_56.x;
    float _179 = in.m_56.y;
    float _181 = in.m_56.z;
    float _183 = in.m_58.x;
    float _185 = in.m_58.y;
    float _187 = in.m_58.z;
    float _189 = in.m_60.x;
    float _191 = in.m_60.y;
    float _193 = in.m_60.z;
    float _195 = in.m_62.x;
    float _197 = in.m_62.y;
    float _199 = in.m_62.z;
    int _201 = as_type<int>(_175) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_175) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = _179 * _185;
    float _213 = _179 * _191;
    float _215 = fma(_177, _183, _211);
    float _217 = _179 * _197;
    float _219 = fma(_177, _189, _213);
    float _221 = fma(_181, _187, _215);
    bool _223 = !_203;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = fma(_177, _195, _217);
    float _229 = fma(_181, _193, _219);
    bool _231 = !_207;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma(_181, _199, _227);
    bool _237 = !_209;
    float _255;
    if (!_237)
    {
        float _239 = in.m_64.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_119);
        float _261 = 1.0 / _259;
        float _263 = _153 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _265 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _283;
    float _287 = in.m_66.x;
    float _289 = in.m_66.y;
    bool _291 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_265);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _277;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _281;
    float _309 = 1.0 / _285;
    float _311 = _269 * _303;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _265 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    float _321 = fma(_319, _311, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _315 * _307;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    bool _329 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _331 = isnan(_265);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_265);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = fma(_327, _311, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = _273 * _309;
    float _357 = -_301;
    float _359 = _357 + 1.0;
    bool _361 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_265);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _339 * _359;
    float _379 = -_339;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = fma(_375, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = _371 * _381;
    float _391 = -_371;
    float _393 = _391 + 1.0;
    float _395 = fma(_385, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = _351 * _393;
    float _399 = -_351;
    float _401 = _399 + 1.0;
    float _403 = _321 * _397;
    float _405 = _353 * _397;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_387, _389, _415);
    float _425 = fma(_395, _389, _417);
    float _427 = fma(_419, _377, _423);
    float _429 = fma(_421, _377, _425);
    float _431 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    float _435 = _431 * _287;
    float _437 = _433 * _289;
    bool _439 = !_305;
    float _457;
    if (!_439)
    {
        float _441 = in.m_64.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_119);
        float _463 = 1.0 / _461;
        float _465 = _153 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _471 = _467 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _477 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _479 = isnan(_467);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _497 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _499 = isnan(_467);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = 1.0 / _475;
    float _511 = -_487;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _515;
    bool _519 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _521 = isnan(_467);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _507 * _513;
    float _533 = -_507;
    float _535 = _533 + 1.0;
    bool _537 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _539 = 1.0 / _491;
    float _541 = _529 * _535;
    float _543 = -_529;
    float _545 = _543 + 1.0;
    float _547 = 1.0 / _495;
    float _549 = _517 * _509;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _555 = fma(_549, _471, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _557 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = isnan(_467);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _553 * _539;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = _467 + _575;
    float _579 = _555 * _541;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _583 = _467 + _581;
    float _585 = fma(_569, _577, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _587 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[115].x, _579);
    float _589 = _573 * _547;
    float _591 = -_567;
    float _593 = _591 + 1.0;
    float _595 = fma(_585, _531, _587);
    float _597 = fma(_589, _583, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _599 = _487 * _593;
    float _601 = fma(_597, _599, _595);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[118].x, _601);
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _611;
    out.m_68.y = _613;
    out.m_68.z = _615;
    out.m_68.w = _617;
    bool _619 = !_537;
    float _621 = _613;
    float _639;
    if (!_619)
    {
        float _623 = in.m_64.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_119);
        float _645 = 1.0 / _643;
        float _647 = _153 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _653 = _649 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _659 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _661 = isnan(_649);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _675 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _677 = isnan(_649);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _687;
    bool _691 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _693 = isnan(_649);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = 1.0 / _657;
    float _705 = -_669;
    float _707 = _705 + 1.0;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _711 = _685 * _707;
    float _713 = -_685;
    float _715 = _713 + 1.0;
    float _717 = 1.0 / _673;
    float _719 = _689 * _703;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _725 = fma(_719, _653, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _727 = -_701;
    float _729 = _727 + 1.0;
    float _731 = _725 * _711;
    float _733 = _723 * _717;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _737 = _649 + _735;
    float _739 = _669 * _729;
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[131].x, _731);
    float _743 = fma(_733, _737, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _745 = fma(_743, _739, _741);
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _753 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[133].x, _745);
    float _755 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _753 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _755;
    out.m_70.y = _757;
    out.m_70.z = _759;
    out.m_70.w = _761;
    bool _763 = !_709;
    float _781;
    if (!_763)
    {
        float _765 = in.m_64.x;
        float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _769 = _765 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _771 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[14].x, _153);
        float _773 = _771 * _767;
        float _775 = floor(_773);
        float _777 = -_775;
        float _779 = _773 + _777;
        _781 = _779;
        _783 = true;
    }
    else
    {
        float _785 = float(_119);
        float _787 = 1.0 / _785;
        float _789 = _153 * _787;
        _781 = _789;
    }
    _783 = false;
    float _791 = _781;
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _795 = int(_793);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _803 = _801 != 0;
    float _805 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _807 = int(_805);
    float _809 = 0.0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _813 = _799;
    if (_799)
    {
        _809 = 1.0;
    }
    float _815 = _809;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[67].y);
    int _819 = int(_817);
    float _821 = float(_795);
    float _823 = 0.0;
    float _825 = _815;
    if (_799)
    {
        _823 = 1.0;
    }
    float _827 = _823;
    float _829 = 0.0;
    float _831 = _827;
    if (_799)
    {
        _829 = 1.0;
    }
    float _833 = _829;
    int _835 = 0;
    float _837 = _833;
    if (_799)
    {
        _835 = 0;
    }
    int _839 = _835;
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _843 = int(_841);
    float _845 = float(_807);
    int _847 = _839;
    if (_799)
    {
        _811 = 0;
    }
    int _849 = _811;
    float _851 = 1.0 / _821;
    float _853 = float(_819);
    float _855 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].y);
    int _857 = int(_855);
    int _859 = int(_799);
    int _861 = _803 ? 2 : 0;
    int _863 = _859 | _861;
    int _865 = _209 ? 4 : 0;
    int _867 = _863 | _865;
    int _869 = false ? 8 : 0;
    int _871 = _867 | _869;
    int _873 = false ? 16 : 0;
    int _875 = _871 | _873;
    int _877 = false ? 32 : 0;
    int _879 = _875 | _877;
    int _881 = false ? 64 : 0;
    int _883 = _879 | _881;
    int _885 = _883 & 2;
    float _887 = float(uint(_843));
    float _889 = as_type<float>(_885);
    int _891 = _849;
    if (_803)
    {
        float _893 = in.m_64.w;
        _889 = _893;
    }
    float _895 = _889;
    float _897 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _899 = int(_897);
    float _901 = _851 * _153;
    float _903 = 1.0 / _845;
    float _905 = float(_857);
    float _907 = 1.0 / _853;
    float _909 = float(uint(_899));
    float _911 = _895;
    if (_803)
    {
        float _913 = _895 * 3.1415927410125732421875;
        _911 = _913;
    }
    float _915 = _911;
    float _917 = trunc((*spvDescriptorSet0.vp_c9)._m0[67].x);
    int _919 = int(_917);
    float _921 = _903 * _153;
    if (_803)
    {
        float _923 = _915 * 0.15915493667125701904296875;
        _621 = _923;
    }
    float _925 = _621;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].x);
    int _929 = int(_927);
    float _931 = _907 * _153;
    float _933 = 1.0 / _887;
    float _935 = float(uint(_919));
    float _937 = trunc(_901);
    int _939 = int(_937);
    float _941 = float(uint(_929));
    float _943 = 1.0 / _905;
    float _945 = 1.0 / _909;
    float _947 = float(uint(_939));
    float _949 = _915;
    float _951 = _903;
    float _953 = _905;
    if (_799)
    {
        float _955 = in.m_64.x;
        float _957 = in.m_64.y;
        float _959 = in.m_64.z;
        _949 = _955;
        _951 = _957;
        _953 = _959;
    }
    float _961 = _949;
    float _963 = _951;
    float _965 = _953;
    float _967 = trunc(_921);
    int _969 = int(_967);
    float _971 = _943 * _153;
    float _973 = 1.0 / _935;
    float _975 = trunc(_931);
    int _977 = int(_975);
    int _979 = as_type<int>(_945) + (-2);
    int _981 = 0;
    int _983 = as_type<int>(_973);
    float _985 = _961;
    float _987 = _965;
    float _989 = _963;
    if (_799)
    {
        _981 = as_type<int>(_965);
    }
    int _991 = _981;
    float _993 = 1.0 / _941;
    float _995 = trunc(_971);
    int _997 = int(_995);
    int _999 = as_type<int>(_933) + (-2);
    float _1001 = float(uint(_977));
    float _1003 = as_type<float>(_999) * _947;
    float _1005 = float(uint(_969));
    float _1007 = _925;
    float _1009 = _1001;
    int _1011 = _991;
    if (_803)
    {
        float _1013 = _925 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        _1007 = _1015;
    }
    float _1017 = _1007;
    int _1019 = as_type<int>(_993) + (-2);
    float _1021 = as_type<float>(_979) * _1005;
    int _1023 = as_type<int>(_973) + (-2);
    float _1025 = trunc(_1003);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = float(uint(_997));
    float _1034 = as_type<float>(_1023) * _1001;
    float _1036 = _993;
    if (_799)
    {
        _1009 = _961;
    }
    float _1038 = _1009;
    float _1040 = as_type<float>(_1019) * _1032;
    int _1042 = as_type<int>(_1040);
    float _1044 = _1038;
    if (_799)
    {
        _1036 = _1038;
    }
    float _1046 = _1036;
    float _1048 = trunc(_1021);
    float _1050 = precise::max(_1048, 0.0);
    uint _1052 = uint(_1050);
    float _1054 = _1046;
    if (_799)
    {
        _983 = as_type<int>(_1038);
    }
    int _1056 = _983;
    float _1058 = trunc(_1034);
    float _1060 = precise::max(_1058, 0.0);
    uint _1062 = uint(_1060);
    float _1064 = trunc(_1040);
    float _1066 = precise::max(_1064, 0.0);
    uint _1068 = uint(_1066);
    int _1070 = _1056;
    if (_799)
    {
        _1042 = as_type<int>(_963);
    }
    int _1072 = _1042;
    int _1074 = _1072;
    if (!_799)
    {
        float _1076 = in.m_64.x;
        float _1078 = in.m_64.y;
        float _1080 = in.m_64.z;
        float _1082 = _1078 * 3.1415927410125732421875;
        float _1084 = _1080 * 3.1415927410125732421875;
        float _1086 = _1076 * 3.1415927410125732421875;
        float _1088 = _1082 * 0.15915493667125701904296875;
        float _1090 = _1084 * 0.15915493667125701904296875;
        float _1092 = _1086 * 0.15915493667125701904296875;
        float _1094 = _1088 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = _1090 * 6.283185482025146484375;
        float _1100 = sin(_1098);
        float _1102 = _1092 * 6.283185482025146484375;
        float _1104 = sin(_1102);
        _1054 = _1080;
        _837 = 5.839270114898681640625;
        _985 = _1076;
        _831 = 1.2345600128173828125;
        _1044 = _1078;
        _825 = 7.345489978790283203125;
        _891 = 2;
        _987 = _1080;
        _989 = _1078;
        _847 = 1;
        _1074 = as_type<int>(_1096);
        _1070 = as_type<int>(_1104);
        _1011 = as_type<int>(_1100);
    }
    float _1106 = _1054;
    float _1108 = _837;
    float _1110 = _985;
    float _1112 = _831;
    float _1114 = _1044;
    float _1116 = _825;
    int _1118 = _891;
    float _1120 = _987;
    float _1122 = _989;
    int _1124 = _847;
    int _1126 = _1074;
    int _1128 = _1070;
    int _1130 = _1011;
    int _1132 = ~_899;
    int _1134 = _1132 + 1;
    float _1136 = _1106 * _1108;
    int _1138 = ~_919;
    int _1140 = _1138 + 1;
    float _1142 = _1110 * _1108;
    int _1144 = ~_843;
    int _1146 = _1144 + 1;
    int _1148 = _1134 * int(_1052);
    int _1150 = _1148 + _969;
    int _1152 = ~_929;
    int _1154 = _1152 + 1;
    int _1156 = _1140 * int(_1062);
    int _1158 = _1156 + _977;
    float _1160 = float(_119);
    int _1162 = _1146 * int(_1030);
    int _1164 = _1162 + _939;
    float _1166 = float(uint(_1150));
    int _1168 = _1154 * int(_1068);
    int _1170 = _1168 + _997;
    float _1172 = float(uint(_1158));
    float _1174 = _1106 * _1112;
    float _1176 = float(uint(_1164));
    float _1178 = _1114 * _1116;
    float _1180 = float(uint(_1170));
    float _1182 = as_type<float>(_1023) * _1172;
    float _1184 = floor(_1136);
    float _1186 = as_type<float>(_999) * _1176;
    float _1188 = as_type<float>(_979) * _1166;
    float _1190 = as_type<float>(_1019) * _1180;
    if (_803)
    {
        bool _1192 = _1017 > 0.5;
        _813 = _1192;
    }
    bool _1194 = _813;
    float _1196 = in.m_60.w;
    int _1198 = ~_929;
    int _1200 = _1198 + 1;
    bool _1202 = _1118 != 2;
    float _1204 = floor(_1142);
    int _1206 = ~_919;
    int _1208 = _1206 + 1;
    float _1210 = in.m_62.w;
    bool _1212 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1214 = isnan(_791);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1226 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1228 = isnan(_791);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = in.m_58.w;
    float _1240 = 1.0 / _1160;
    float _1242 = -_1184;
    float _1244 = _1136 + _1242;
    float _1246 = -_1222;
    float _1248 = _1246 + 1.0;
    float _1250 = floor(_1174);
    float _1252 = -_1204;
    float _1254 = _1142 + _1252;
    float _1256 = float(_899);
    float _1258 = float(_997);
    float _1260 = floor(_1178);
    float _1262 = _1240 * _153;
    float _1264 = float(_969);
    float _1266 = trunc(_1182);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_1250;
    float _1274 = _1174 + _1272;
    float _1276 = float(_929);
    bool _1278 = _1258 >= _1276;
    bool _1280 = isnan(_1258);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan(_1276);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = trunc(_1186);
    float _1292 = precise::max(_1290, 0.0);
    uint _1294 = uint(_1292);
    float _1296 = -_1260;
    float _1298 = _1178 + _1296;
    float _1300 = float(_843);
    float _1302 = _1300 * _1244;
    float _1304 = trunc(_1188);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    int _1310 = int(_1062) + int(_1270);
    int _1312 = ~_843;
    int _1314 = _1312 + 1;
    float _1316 = trunc(_1190);
    float _1318 = precise::max(_1316, 0.0);
    uint _1320 = uint(_1318);
    int _1322 = int(_1030) + int(_1294);
    float _1324 = float(_939);
    bool _1326 = _1324 >= _1300;
    bool _1328 = isnan(_1324);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(_1300);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1300 * _1262;
    int _1340 = int(_1052) + int(_1308);
    float _1342 = trunc(_1302);
    int _1344 = int(_1342);
    bool _1346 = _1264 >= _1256;
    bool _1348 = isnan(_1264);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(_1256);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = _1256 * _1298;
    float _1360 = _1276 * _1274;
    int _1362 = _1314 * _1322;
    int _1364 = _1362 + _939;
    int _1366 = int(_1194);
    int _1368 = _803 ? 2 : 0;
    int _1370 = _1366 | _1368;
    int _1372 = _209 ? 4 : 0;
    int _1374 = _1370 | _1372;
    int _1376 = false ? 8 : 0;
    int _1378 = _1374 | _1376;
    int _1380 = false ? 16 : 0;
    int _1382 = _1378 | _1380;
    int _1384 = false ? 32 : 0;
    int _1386 = _1382 | _1384;
    int _1388 = false ? 64 : 0;
    int _1390 = _1386 | _1388;
    int _1392 = _1390 & 1;
    float _1394 = _1256 * _1262;
    int _1396 = int(_1068) + int(_1320);
    float _1398 = _1276 * _1262;
    int _1400 = ~_899;
    int _1402 = _1400 + 1;
    float _1404 = trunc(_1360);
    int _1406 = int(_1404);
    bool _1408 = uint(_1364) >= uint(_843);
    int _1410 = _1200 * _1396;
    int _1412 = _1410 + _997;
    float _1414 = float(_919);
    int _1416 = _1402 * _1340;
    int _1418 = _1416 + _969;
    float _1420 = float(_977);
    bool _1422 = uint(_1412) >= uint(_929);
    float _1424 = _1414 * _1262;
    bool _1426 = uint(_1418) >= uint(_899);
    float _1428 = _1414 * _1254;
    bool _1430 = _1420 >= _1414;
    bool _1432 = isnan(_1420);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(_1414);
    bool _1438 = _1434 || _1436;
    float _1440 = float(_1438);
    int _1442 = _1208 * _1310;
    int _1444 = _1442 + _977;
    bool _1446 = !_1408;
    int _1448 = _1446 ? 0 : (-1);
    float _1450 = trunc(_1358);
    int _1452 = int(_1450);
    bool _1454 = !_1426;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1460 = _1458 != 0;
    bool _1462 = !_1422;
    int _1464 = _1462 ? 0 : (-1);
    int _1466 = ~_1322;
    int _1468 = _1466 + _1448;
    int _1470 = _1468 + 1;
    float _1472 = trunc(_1336);
    int _1474 = int(_1472);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1478 = _1476 != 0;
    bool _1480 = !_1460;
    int _1482 = _1480 ? 0 : 1;
    bool _1484 = uint(_1444) >= uint(_919);
    int _1486 = ~_1340;
    int _1488 = _1486 + _1456;
    int _1490 = _1488 + 1;
    float _1492 = trunc(_1288);
    int _1494 = int(_1492);
    int _1496 = ~_1396;
    int _1498 = _1496 + _1464;
    int _1500 = _1498 + 1;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 65536;
    bool _1504 = _1502 != 0;
    int _1506 = _899 * _1490;
    int _1508 = _1506 + _969;
    bool _1510 = !_1478;
    int _1512 = _1510 ? 0 : 1;
    int _1514 = _929 * _1500;
    int _1516 = _1514 + _997;
    int _1518 = abs(_1482);
    float _1520 = trunc(_1338);
    int _1522 = int(_1520);
    bool _1524 = !_1504;
    int _1526 = _1524 ? 0 : 1;
    int _1528 = abs(_1512);
    bool _1530 = !_1484;
    int _1532 = _1530 ? 0 : (-1);
    float _1534 = trunc(_1394);
    int _1536 = int(_1534);
    int _1538 = abs(_1526);
    int _1540 = _1344 * _1518;
    int _1542 = _1540 + _939;
    int _1544 = ~_1310;
    int _1546 = _1544 + _1532;
    int _1548 = _1546 + 1;
    int _1550 = _843 * _1470;
    int _1552 = _1550 + _939;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1556 = _1554 != 0;
    float _1558 = trunc(_1424);
    int _1560 = int(_1558);
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1564 = _1562 != 0;
    int _1566 = _1452 * _1528;
    int _1568 = _1566 + _969;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1576 = _1574 != 0;
    bool _1578 = !_1556;
    int _1580 = _1578 ? 0 : 1;
    int _1582 = _1406 * _1538;
    int _1584 = _1582 + _997;
    bool _1586 = !_1564;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = trunc(_1356);
    int _1592 = int(_1590);
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1596 = _1594 != 0;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1600 = _1598 != 0;
    bool _1602 = !_1576;
    int _1604 = _1602 ? 0 : 1;
    bool _1606 = !_1572;
    int _1608 = _1606 ? 0 : 1;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1616 = _1614 != 0;
    float _1618 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _1620 = int(_1618);
    bool _1622 = !_1600;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = ~_1474;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    int _1632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1048576;
    bool _1634 = _1632 != 0;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2097152;
    bool _1638 = _1636 != 0;
    bool _1640 = _843 == 0;
    bool _1642 = _899 == 0;
    bool _1644 = !_1640;
    int _1646 = _1644 ? _1552 : (-1);
    int _1648 = ~_1592;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    bool _1654 = !_1642;
    int _1656 = _1654 ? _1508 : (-1);
    int _1658 = _1630 * _1646;
    int _1660 = _843 + (-1);
    bool _1662 = !_1638;
    int _1664 = _1662 ? 0 : 1;
    int _1666 = _1652 * _1656;
    bool _1668 = _929 == 0;
    int _1670 = _1474 * _1660;
    int _1672 = _1670 + _1658;
    int _1674 = _899 + (-1);
    int _1676 = _919 * _1548;
    int _1678 = _1676 + _977;
    int _1680 = ~_1494;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    bool _1686 = !_1668;
    int _1688 = _1686 ? _1516 : (-1);
    int _1690 = _1592 * _1674;
    int _1692 = _1690 + _1666;
    int _1694 = abs(_1604);
    int _1696 = abs(_1624);
    int _1698 = _1684 * _1688;
    int _1700 = abs(_1608);
    int _1702 = _1672 * _1694;
    int _1704 = _929 + (-1);
    int _1706 = _1692 * _1696;
    bool _1708 = !_1596;
    int _1710 = _1708 ? 0 : 1;
    int _1712 = _1494 * _1704;
    int _1714 = _1712 + _1698;
    int _1716 = abs(_1580);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1720 = _791 + _1718;
    int _1722 = abs(_1664);
    int _1724 = _1522 * _1700;
    int _1726 = _1724 + _1702;
    int _1728 = abs(_1710);
    float _1730 = trunc(_1398);
    int _1732 = int(_1730);
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4194304;
    bool _1736 = _1734 != 0;
    int _1738 = _1714 * _1722;
    bool _1740 = !_1634;
    int _1742 = _1740 ? 0 : 1;
    int _1744 = _1536 * _1728;
    int _1746 = _1744 + _1706;
    bool _1748 = !_1612;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = _1542 * _1716;
    int _1754 = _1752 + _1726;
    bool _1756 = !_1736;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8388608;
    bool _1762 = _1760 != 0;
    int _1764 = abs(_1742);
    float _1766 = trunc(_1428);
    int _1768 = int(_1766);
    int _1770 = abs(_1750);
    int _1772 = abs(_1588);
    int _1774 = _1732 * _1764;
    int _1776 = _1774 + _1738;
    bool _1778 = !_1762;
    int _1780 = _1778 ? 0 : 1;
    int _1782 = _1568 * _1770;
    int _1784 = _1782 + _1746;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 131072;
    bool _1788 = _1786 != 0;
    int _1790 = _1344 * _1772;
    int _1792 = _1790 + _1754;
    float _1794 = float(uint(_1542));
    float _1796 = trunc(_1440);
    int _1798 = int(_1796);
    bool _1800 = !_1788;
    int _1802 = _1800 ? 0 : 1;
    bool _1804 = !_1616;
    int _1806 = _1804 ? 0 : 1;
    int _1808 = abs(_1802);
    float _1810 = as_type<float>(_999) * _1794;
    float _1812 = float(uint(_1792));
    int _1814 = abs(_1806);
    int _1816 = _1768 * _1808;
    int _1818 = _1816 + _977;
    int _1820 = abs(_1758);
    float _1822 = as_type<float>(_999) * _1812;
    float _1824 = float(uint(_1568));
    int _1826 = _1452 * _1814;
    int _1828 = _1826 + _1784;
    int _1830 = abs(_1780);
    float _1832 = trunc(_1810);
    float _1834 = precise::max(_1832, 0.0);
    uint _1836 = uint(_1834);
    float _1838 = as_type<float>(_979) * _1824;
    float _1840 = float(uint(_1828));
    float _1842 = float(uint(_1584));
    int _1844 = _1584 * _1820;
    int _1846 = _1844 + _1776;
    float _1848 = trunc(_1822);
    float _1850 = precise::max(_1848, 0.0);
    uint _1852 = uint(_1850);
    float _1854 = as_type<float>(_979) * _1840;
    int _1856 = ~_843;
    int _1858 = _1856 + 1;
    float _1860 = as_type<float>(_1019) * _1842;
    int _1862 = ~_843;
    int _1864 = _1862 + 1;
    int _1866 = _1406 * _1830;
    int _1868 = _1866 + _1846;
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16777216;
    bool _1872 = _1870 != 0;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 33554432;
    bool _1876 = _1874 != 0;
    float _1878 = trunc(_1854);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 67108864;
    bool _1886 = _1884 != 0;
    int _1888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 134217728;
    bool _1890 = _1888 != 0;
    int _1892 = ~_899;
    int _1894 = _1892 + 1;
    int _1896 = _1858 * int(_1836);
    int _1898 = _1896 + _1542;
    float _1900 = float(uint(_1868));
    float _1902 = trunc(_1838);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = _1864 * int(_1852);
    int _1910 = _1908 + _1792;
    bool _1912 = !_1886;
    int _1914 = _1912 ? 0 : 1;
    bool _1916 = _1392 != 0;
    float _1918 = float(uint(_1910));
    float _1920 = float(uint(_1898));
    int _1922 = _1894 * int(_1882);
    int _1924 = _1922 + _1828;
    float _1926 = as_type<float>(_1019) * _1900;
    int _1928 = ~_899;
    int _1930 = _1928 + 1;
    float _1932 = as_type<float>(_999) * _1918;
    bool _1934 = !_1872;
    int _1936 = _1934 ? 0 : 1;
    float _1938 = trunc(_1860);
    float _1940 = precise::max(_1938, 0.0);
    uint _1942 = uint(_1940);
    bool _1944 = _919 == 0;
    int _1946 = _1930 * int(_1906);
    int _1948 = _1946 + _1568;
    int _1950 = ~_1798;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = as_type<float>(_999) * _1920;
    int _1958 = _919 + (-1);
    float _1960 = float(uint(_1948));
    float _1962 = trunc(_1926);
    float _1964 = precise::max(_1962, 0.0);
    uint _1966 = uint(_1964);
    float _1968 = float(uint(_1924));
    bool _1970 = !_1944;
    int _1972 = _1970 ? _1678 : (-1);
    float _1974 = as_type<float>(_979) * _1960;
    int _1976 = ~_929;
    int _1978 = _1976 + 1;
    float _1980 = as_type<float>(_979) * _1968;
    bool _1982 = !_1876;
    int _1984 = _1982 ? 0 : 1;
    float _1986 = trunc(_1932);
    float _1988 = precise::max(_1986, 0.0);
    uint _1990 = uint(_1988);
    int _1992 = _1954 * _1972;
    int _1994 = ~_929;
    int _1996 = _1994 + 1;
    bool _1998 = _843 == 0;
    int _2000 = _1798 * _1958;
    int _2002 = _2000 + _1992;
    float _2004 = trunc(_1980);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    int _2010 = abs(_1984);
    int _2012 = _1978 * int(_1942);
    int _2014 = _2012 + _1584;
    int _2016 = abs(_1936);
    int _2018 = _1996 * int(_1966);
    int _2020 = _2018 + _1868;
    int _2022 = int(_1852) + int(_1990);
    float _2024 = trunc(_1956);
    float _2026 = precise::max(_2024, 0.0);
    uint _2028 = uint(_2026);
    int _2030 = ~_843;
    int _2032 = _2030 + 1;
    int _2034 = _2002 * _2010;
    float _2036 = float(uint(_2014));
    float _2038 = float(uint(_2020));
    int _2040 = _2032 * _2022;
    int _2042 = _2040 + _1792;
    float _2044 = trunc(_1974);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = as_type<float>(_1019) * _2036;
    float _2052 = as_type<float>(_1019) * _2038;
    bool _2054 = !_1890;
    int _2056 = _2054 ? 0 : 1;
    int _2058 = _1560 * _2016;
    int _2060 = _2058 + _2034;
    bool _2062 = uint(_2042) >= uint(_843);
    int _2064 = int(_1882) + int(_2008);
    float _2066 = trunc(_2052);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    int _2072 = abs(_1914);
    int _2074 = abs(_2056);
    bool _2076 = !_2062;
    int _2078 = _2076 ? 0 : (-1);
    int _2080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2082 = _2080 != 0;
    int _2084 = ~_2022;
    int _2086 = _2084 + _2078;
    int _2088 = _2086 + 1;
    int _2090 = _1818 * _2072;
    int _2092 = _2090 + _2060;
    int _2094 = int(_1906) + int(_2048);
    int _2096 = ~_899;
    int _2098 = _2096 + 1;
    int _2100 = _843 * _2088;
    int _2102 = _2100 + _1792;
    int _2104 = int(_1836) + int(_2028);
    int _2106 = _1768 * _2074;
    int _2108 = _2106 + _2092;
    int _2110 = ~_843;
    int _2112 = _2110 + 1;
    int _2114 = _2098 * _2064;
    int _2116 = _2114 + _1828;
    bool _2118 = !_1998;
    int _2120 = _2118 ? _2102 : (-1);
    float _2122 = as_type<float>(_2088);
    float _2124 = as_type<float>(_2094);
    bool _2126 = _1944;
    if (!_2082)
    {
        _2122 = _225;
    }
    float _2128 = _2122;
    int _2130 = _2112 * _2104;
    int _2132 = _2130 + _1542;
    float _2134 = _2128;
    if (_2082)
    {
        float _2136 = -_225;
        float _2138 = _1916 ? _2136 : _225;
        _2134 = _2138;
    }
    float _2140 = _2134;
    int _2142 = _2120 & 3;
    bool _2144 = _2142 != 0;
    bool _2146 = uint(_2116) >= uint(_899);
    float _2148 = float(uint(_1818));
    int _2150 = _2144 ? 0 : 1;
    float _2152 = float(uint(_2108));
    float _2154 = as_type<float>(_1023) * _2148;
    bool _2156 = _2142 != 3;
    bool _2158 = uint(_2142) >= 2u;
    float _2160 = as_type<float>(_1023) * _2152;
    bool _2162 = !_2146;
    int _2164 = _2162 ? 0 : (-1);
    float _2166 = trunc(_2154);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    int _2172 = int(_1966) + int(_2070);
    int _2174 = ~_929;
    int _2176 = _2174 + 1;
    int _2178 = _2158 ? 0 : 1;
    int _2180 = ~_2064;
    int _2182 = _2180 + _2164;
    int _2184 = _2182 + 1;
    float _2186 = trunc(_2160);
    float _2188 = precise::max(_2186, 0.0);
    uint _2190 = uint(_2188);
    bool _2192 = uint(_2132) >= uint(_843);
    int _2194 = _2176 * _2172;
    int _2196 = _2194 + _1868;
    bool _2198 = uint(_2142) > 1u;
    int _2200 = _899 * _2184;
    int _2202 = _2200 + _1828;
    int _2204 = ~_2178;
    int _2206 = _2204 + 1;
    int _2208 = _2206 + 1;
    int _2210 = _2208;
    if (_2156)
    {
        int _2212 = ~_2178;
        int _2214 = _2212 + 1;
        _2210 = _2214;
    }
    int _2216 = _2210;
    float _2218 = trunc(_2050);
    float _2220 = precise::max(_2218, 0.0);
    uint _2222 = uint(_2220);
    bool _2224 = uint(_2196) >= uint(_929);
    bool _2226 = !_2192;
    int _2228 = _2226 ? 0 : (-1);
    int _2230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2232 = _2230 != 0;
    bool _2234 = !_1642;
    int _2236 = _2234 ? _2202 : (-1);
    int _2238 = ~_919;
    int _2240 = _2238 + 1;
    bool _2242 = !_2232;
    int _2244 = _2242 ? 0 : 1;
    int _2246 = ~_919;
    int _2248 = _2246 + 1;
    int _2250 = _2240 * int(_2170);
    int _2252 = _2250 + _1818;
    int _2254 = _2236 & 3;
    bool _2256 = _2254 != 0;
    int _2258 = ~_2150;
    int _2260 = _2258 + 1;
    int _2262 = _2260 + 1;
    int _2264 = _2248 * int(_2190);
    int _2266 = _2264 + _2108;
    int _2268 = _2262;
    if (!_2198)
    {
        int _2270 = ~_2150;
        int _2272 = _2270 + 1;
        _2268 = _2272;
    }
    int _2274 = _2268;
    int _2276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2278 = _2276 != 0;
    int _2280 = _2256 ? 0 : 1;
    bool _2282 = uint(_2254) >= 2u;
    float _2284 = float(uint(_2252));
    int _2286 = _2282 ? 0 : 1;
    float _2288 = float(uint(_2266));
    bool _2290 = _2254 != 3;
    float _2292 = as_type<float>(_2150);
    if (_2278)
    {
        float _2294 = in.m_64.x;
        _2292 = _2294;
    }
    float _2296 = _2292;
    bool _2298 = !_2224;
    int _2300 = _2298 ? 0 : (-1);
    int _2302 = ~_899;
    int _2304 = _2302 + 1;
    bool _2306 = uint(_2254) > 1u;
    int _2308 = ~_2172;
    int _2310 = _2308 + _2300;
    int _2312 = _2310 + 1;
    int _2314 = _2304 * _2094;
    int _2316 = _2314 + _1568;
    int _2318 = int(_1942) + int(_2222);
    float _2320 = as_type<float>(_1023) * _2284;
    float _2322 = as_type<float>(_1023) * _2288;
    int _2324 = _929 * _2312;
    int _2326 = _2324 + _1868;
    int _2328 = ~_2286;
    int _2330 = _2328 + 1;
    int _2332 = _2330 + 1;
    float _2334 = trunc(_2320);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = _2332;
    float _2342 = _2322;
    float _2344 = as_type<float>(_2316);
    if (_2290)
    {
        int _2346 = ~_2286;
        int _2348 = _2346 + 1;
        _2340 = _2348;
    }
    int _2350 = _2340;
    bool _2352 = uint(_2316) >= uint(_899);
    bool _2354 = !_1668;
    int _2356 = _2354 ? _2326 : (-1);
    int _2358 = ~_2280;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = trunc(_2322);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    int _2370 = _2362;
    if (!_2306)
    {
        int _2372 = ~_2280;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2380 = _2378 != 0;
    bool _2382 = !_2352;
    int _2384 = _2382 ? 0 : (-1);
    int _2386 = _2356 & 3;
    bool _2388 = _2386 != 0;
    bool _2390 = !_2380;
    int _2392 = _2390 ? 0 : 1;
    if (_2278)
    {
        float _2394 = _2296 * 3.1415927410125732421875;
        _2342 = _2394;
    }
    float _2396 = _2342;
    bool _2398 = uint(_2386) >= 2u;
    int _2400 = ~_919;
    int _2402 = _2400 + 1;
    if (_2278)
    {
        float _2404 = _2396 * 0.15915493667125701904296875;
        _2344 = _2404;
    }
    float _2406 = _2344;
    int _2408 = _2398 ? 0 : 1;
    bool _2410 = uint(_2386) > 1u;
    int _2412 = int(_2190) + int(_2368);
    float _2414 = _2406;
    if (_2278)
    {
        float _2416 = _2406 * 6.283185482025146484375;
        float _2418 = sin(_2416);
        _2414 = _2418;
    }
    float _2420 = _2414;
    int _2422 = _2388 ? 0 : 1;
    bool _2424 = _2386 != 3;
    int _2426 = _2402 * _2412;
    int _2428 = _2426 + _2108;
    int _2430 = ~_2422;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    int _2436 = ~_929;
    int _2438 = _2436 + 1;
    int _2440 = _2434;
    if (!_2410)
    {
        int _2442 = ~_2422;
        int _2444 = _2442 + 1;
        _2440 = _2444;
    }
    int _2446 = _2440;
    bool _2448 = uint(_2428) >= uint(_919);
    int _2450 = _2438 * _2318;
    int _2452 = _2450 + _1584;
    int _2454 = ~_2104;
    int _2456 = _2454 + _2228;
    int _2458 = _2456 + 1;
    bool _2460 = !_2448;
    int _2462 = _2460 ? 0 : (-1);
    int _2464 = ~_2408;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = _843 * _2458;
    int _2472 = _2470 + _1542;
    int _2474 = ~_2412;
    int _2476 = _2474 + _2462;
    int _2478 = _2476 + 1;
    int _2480 = _2468;
    if (_2424)
    {
        int _2482 = ~_2408;
        int _2484 = _2482 + 1;
        _2480 = _2484;
    }
    int _2486 = _2480;
    bool _2488 = uint(_2452) >= uint(_929);
    int _2490 = _919 * _2478;
    int _2492 = _2490 + _2108;
    int _2494 = int(_2170) + int(_2338);
    int _2496 = ~_2094;
    int _2498 = _2496 + _2384;
    int _2500 = _2498 + 1;
    bool _2502 = !_2488;
    int _2504 = _2502 ? 0 : (-1);
    int _2506 = _2402 * _2494;
    int _2508 = _2506 + _1818;
    bool _2510 = _2488;
    if (_2278)
    {
        bool _2512 = _2420 > 0.5;
        _2510 = _2512;
    }
    bool _2514 = _2510;
    int _2516 = _899 * _2500;
    int _2518 = _2516 + _1568;
    bool _2520 = !_1998;
    int _2522 = _2520 ? _2472 : (-1);
    int _2524 = _2120 & 3;
    bool _2526 = _2524 != 0;
    bool _2528 = !_1944;
    int _2530 = _2528 ? _2492 : (-1);
    if (!_2278)
    {
        _2124 = _233;
    }
    float _2532 = _2124;
    float _2534 = _2532;
    if (_2278)
    {
        float _2536 = -_233;
        float _2538 = _2514 ? _2536 : _233;
        _2534 = _2538;
    }
    float _2540 = _2534;
    int _2542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 33554432;
    bool _2544 = _2542 != 0;
    bool _2546 = !_2526;
    int _2548 = _2546 ? 0 : 1;
    int _2550 = _2530 & 3;
    bool _2552 = _2550 != 0;
    bool _2554 = !_1642;
    int _2556 = _2554 ? _2518 : (-1);
    int _2558 = _2236 & 3;
    bool _2560 = _2558 != 0;
    bool _2562 = !_2544;
    int _2564 = _2562 ? 0 : 1;
    bool _2566 = _2550 != 3;
    int _2568 = ~_2318;
    int _2570 = _2568 + _2504;
    int _2572 = _2570 + 1;
    bool _2574 = !_2560;
    int _2576 = _2574 ? 0 : 1;
    bool _2578 = uint(_2550) >= 2u;
    int _2580 = _929 * _2572;
    int _2582 = _2580 + _1584;
    int _2584 = _2578 ? 0 : 1;
    bool _2586 = uint(_2550) > 1u;
    float _2588 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2590 = _2588 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2592 = ~_2584;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = _2596;
    if (_2566)
    {
        int _2600 = ~_2584;
        int _2602 = _2600 + 1;
        _2598 = _2602;
    }
    int _2604 = _2598;
    float _2606 = in.m_46.x;
    float _2608 = in.m_46.y;
    float _2610 = in.m_46.z;
    bool _2612 = !_1668;
    int _2614 = _2612 ? _2582 : (-1);
    float _2616 = 1.0 / _2590;
    int _2618 = _2356 & 3;
    bool _2620 = _2618 != 0;
    int _2622 = _2552 ? 0 : 1;
    bool _2624 = !_2620;
    int _2626 = _2624 ? 0 : 1;
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 67108864;
    bool _2634 = _2632 != 0;
    bool _2636 = _2142 != 3;
    float _2638 = 1.0 / _2630;
    int _2640 = ~_2622;
    int _2642 = _2640 + 1;
    int _2644 = _2642 + 1;
    float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2648 = _2646 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2650 = _2644;
    if (!_2586)
    {
        int _2652 = ~_2622;
        int _2654 = _2652 + 1;
        _2650 = _2654;
    }
    int _2656 = _2650;
    bool _2658 = !_2634;
    int _2660 = _2658 ? 0 : 1;
    float _2662 = _185 * _2608;
    float _2664 = _191 * _2608;
    bool _2666 = !_2636;
    int _2668 = _2666 ? 0 : (-1);
    float _2670 = _197 * _2608;
    bool _2672 = uint(_2508) >= uint(_919);
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2676 = _2674 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2678 = _2254 != 3;
    float _2680 = fma(_195, _2606, _2670);
    bool _2682 = _2386 != 3;
    float _2684 = fma(_183, _2606, _2662);
    bool _2686 = _2550 != 3;
    float _2688 = 1.0 / _2648;
    int _2690 = _2530 & 3;
    bool _2692 = _2690 != 0;
    float _2694 = fma(_189, _2606, _2664);
    float _2696 = fma(_187, _2610, _2684);
    bool _2698 = !_2678;
    int _2700 = _2698 ? 0 : (-1);
    float _2702 = fma(_193, _2610, _2694);
    bool _2704 = !_2682;
    int _2706 = _2704 ? 0 : (-1);
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2712 = !_2686;
    int _2714 = _2712 ? 0 : (-1);
    bool _2716 = !_2692;
    int _2718 = _2716 ? 0 : 1;
    float _2720 = 1.0 / _2710;
    bool _2722 = !_2672;
    int _2724 = _2722 ? 0 : (-1);
    int _2726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2728 = _2726 != 0;
    int _2730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2732 = _2730 != 0;
    int _2734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _2736 = _2734 != 0;
    int _2738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2740 = _2738 != 0;
    int _2742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2744 = _2742 != 0;
    int _2746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2748 = _2746 != 0;
    float _2750 = 1.0 / _2676;
    float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2758 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2756;
    float _2760 = fma(_199, _2610, _2680);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2764 = _2762 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2766 = _2758 * _2638;
    float _2768 = 1.0 / _2754;
    float _2770 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2774;
    float _2778 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2780 = _2778 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2782 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2782;
    float _2786 = _2776 * _2616;
    float _2788 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2790 = _791 + _2788;
    float _2792 = 1.0 / _2764;
    float _2794 = _2780 * _2688;
    float _2796 = _2784 * _2750;
    float _2798 = fma(_2766, _2790, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2802 = _791 + _2800;
    float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2806 = _791 + _2804;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2810 = _791 + _2808;
    float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2814 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2812;
    float _2816 = _2772 * _2768;
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2820 = _2818 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2822 = fma(_2796, _2806, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2824 = _2236 >> 31;
    float _2826 = fma(_2816, _2810, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2828 = _2820 * _2720;
    float _2830 = fma(_2794, _2802, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2832 = _2120 >> 31;
    float _2834 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2836 = _791 + _2834;
    int _2838 = _2356 >> 31;
    float _2840 = _2814 * _2792;
    int _2842 = _2832 & 3;
    float _2844 = fma(_2828, _2836, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2846 = _2824 & 3;
    float _2848 = fma(_2786, _1720, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2850 = _2120 + _2842;
    float _2852 = _2760 + _1210;
    int _2854 = _2838 & 3;
    int _2856 = _2850 >> 2;
    int _2858 = _2530 >> 31;
    int _2860 = _2856 << 4;
    int _2862 = _2860 + 656;
    int _2864 = _2236 + _2846;
    int _2866 = _2858 & 3;
    int _2868 = _2356 + _2854;
    uint _2870 = uint(int(uint(_2862) >> uint(2)));
    uint _2872 = uint(int(uint(int(_2870)) >> uint(2)));
    int _2874 = int(_2870) & 3;
    float _2876 = (*spvDescriptorSet0.vp_c9)._m0[int(_2872)][_2874];
    int _2878 = int(_2870) + 1;
    uint _2880 = uint(int(uint(_2878) >> uint(2)));
    int _2882 = _2878 & 3;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[int(_2880)][_2882];
    bool _2886 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2888 = isnan(_791);
    bool _2890 = _2886 || _2888;
    bool _2892 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2894 = _2890 || _2892;
    float _2896 = float(_2894);
    bool _2898 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2900 = isnan(_791);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2906 = _2902 || _2904;
    float _2908 = float(_2906);
    int _2910 = _2864 >> 2;
    float _2912 = -_2896;
    float _2914 = _2912 + 1.0;
    bool _2916 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2918 = isnan(_791);
    bool _2920 = _2916 || _2918;
    bool _2922 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2924 = _2920 || _2922;
    float _2926 = float(_2924);
    float _2928 = -_2908;
    float _2930 = _2928 + 1.0;
    int _2932 = _2910 << 4;
    int _2934 = _2932 + 800;
    float _2936 = _2908 * _2914;
    int _2938 = _2530 + _2866;
    float _2940 = _2926 * _2930;
    int _2942 = _2868 >> 2;
    float _2944 = -_2926;
    float _2946 = _2944 + 1.0;
    uint _2948 = uint(int(uint(_2934) >> uint(2)));
    uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
    int _2952 = int(_2948) & 3;
    float _2954 = (*spvDescriptorSet0.vp_c9)._m0[int(_2950)][_2952];
    int _2956 = int(_2948) + 1;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    int _2960 = _2956 & 3;
    float _2962 = (*spvDescriptorSet0.vp_c9)._m0[int(_2958)][_2960];
    bool _2964 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2966 = isnan(_791);
    bool _2968 = _2964 || _2966;
    bool _2970 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2972 = _2968 || _2970;
    float _2974 = float(_2972);
    int _2976 = _2938 >> 2;
    float _2978 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2980 = _791 + _2978;
    bool _2982 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2984 = isnan(_791);
    bool _2986 = _2982 || _2984;
    bool _2988 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2990 = _2986 || _2988;
    float _2992 = float(_2990);
    float _2994 = -_2974;
    float _2996 = _2994 + 1.0;
    int _2998 = _2976 << 4;
    int _3000 = _2998 + 1088;
    float _3002 = _2974 * _2946;
    int _3004 = _2942 << 4;
    int _3006 = _3004 + 944;
    float _3008 = _1222 * _2996;
    uint _3010 = uint(int(uint(_3000) >> uint(2)));
    uint _3012 = uint(int(uint(int(_3010)) >> uint(2)));
    int _3014 = int(_3010) & 3;
    float _3016 = (*spvDescriptorSet0.vp_c9)._m0[int(_3012)][_3014];
    int _3018 = int(_3010) + 1;
    uint _3020 = uint(int(uint(_3018) >> uint(2)));
    int _3022 = _3018 & 3;
    float _3024 = (*spvDescriptorSet0.vp_c9)._m0[int(_3020)][_3022];
    float _3026 = _2992 * _1248;
    float _3028 = -_2992;
    float _3030 = _3028 + 1.0;
    float _3032 = fma(_2840, _2980, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3034 = _2702 + _1196;
    bool _3036 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3038 = isnan(_791);
    bool _3040 = _3036 || _3038;
    bool _3042 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3044 = _3040 || _3042;
    float _3046 = float(_3044);
    float _3048 = _1236 * _3030;
    float _3050 = -_1236;
    float _3052 = _3050 + 1.0;
    uint _3054 = uint(int(uint(_3006) >> uint(2)));
    uint _3056 = uint(int(uint(int(_3054)) >> uint(2)));
    int _3058 = int(_3054) & 3;
    float _3060 = (*spvDescriptorSet0.vp_c9)._m0[int(_3056)][_3058];
    int _3062 = int(_3054) + 1;
    uint _3064 = uint(int(uint(_3062) >> uint(2)));
    int _3066 = _3062 & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = abs(_2274);
    float _3072 = _2696 + _1238;
    float _3074 = _3046 * _3052;
    int _3076 = abs(_2376);
    float _3078 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3080 = int(_3078);
    float _3082 = _2798 * _3074;
    int _3084 = _2862 + 8;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    uint _3088 = uint(int(uint(int(_3086)) >> uint(2)));
    int _3090 = int(_3086) & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    int _3094 = int(_3086) + 1;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    int _3098 = _3094 & 3;
    float _3100 = (*spvDescriptorSet0.vp_c9)._m0[int(_3096)][_3098];
    int _3102 = ~_2494;
    int _3104 = _3102 + _2724;
    int _3106 = _3104 + 1;
    float _3108 = -_3046;
    float _3110 = _3108 + 1.0;
    int _3112 = abs(_2446);
    int _3114 = ~_3070;
    int _3116 = _3114 + 1;
    int _3118 = _3116 + 1;
    int _3120 = _919 * _3106;
    int _3122 = _3120 + _1818;
    int _3124 = abs(_2548);
    int _3126 = _3006 + 8;
    uint _3128 = uint(int(uint(_3126) >> uint(2)));
    uint _3130 = uint(int(uint(int(_3128)) >> uint(2)));
    int _3132 = int(_3128) & 3;
    float _3134 = (*spvDescriptorSet0.vp_c9)._m0[int(_3130)][_3132];
    int _3136 = int(_3128) + 1;
    uint _3138 = uint(int(uint(_3136) >> uint(2)));
    int _3140 = _3136 & 3;
    float _3142 = (*spvDescriptorSet0.vp_c9)._m0[int(_3138)][_3140];
    int _3144 = ~_3076;
    int _3146 = _3144 + 1;
    int _3148 = _3146 + 1;
    int _3150 = _3118 * as_type<int>(_2884);
    int _3152 = abs(_2656);
    float _3154 = trunc((*spvDescriptorSet0.vp_c9)._m0[100].z);
    int _3156 = int(_3154);
    int _3158 = abs(_2576);
    float _3160 = fma(_3110, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3082);
    int _3162 = _2934 + 8;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    uint _3166 = uint(int(uint(int(_3164)) >> uint(2)));
    int _3168 = int(_3164) & 3;
    float _3170 = (*spvDescriptorSet0.vp_c9)._m0[int(_3166)][_3168];
    int _3172 = int(_3164) + 1;
    uint _3174 = uint(int(uint(_3172) >> uint(2)));
    int _3176 = _3172 & 3;
    float _3178 = (*spvDescriptorSet0.vp_c9)._m0[int(_3174)][_3176];
    int _3180 = ~_3158;
    int _3182 = _3180 + 1;
    int _3184 = _3182 + 1;
    float _3186 = fma(_2826, _3048, _3160);
    int _3188 = ~_3112;
    int _3190 = _3188 + 1;
    int _3192 = _3190 + 1;
    float _3194 = trunc((*spvDescriptorSet0.vp_c9)._m0[105].z);
    int _3196 = int(_3194);
    int _3198 = _3148 * as_type<int>(_2962);
    int _3200 = ~_3152;
    int _3202 = _3200 + 1;
    int _3204 = _3202 + 1;
    float _3206 = fma(_2848, _3026, _3186);
    int _3208 = _3000 + 8;
    uint _3210 = uint(int(uint(_3208) >> uint(2)));
    uint _3212 = uint(int(uint(int(_3210)) >> uint(2)));
    int _3214 = int(_3210) & 3;
    float _3216 = (*spvDescriptorSet0.vp_c9)._m0[int(_3212)][_3214];
    int _3218 = int(_3210) + 1;
    uint _3220 = uint(int(uint(_3218) >> uint(2)));
    int _3222 = _3218 & 3;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[int(_3220)][_3222];
    int _3226 = _3184 * as_type<int>(_2954);
    int _3228 = _3226 + _3198;
    int _3230 = abs(_2718);
    float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3234 = _3072 + _3232;
    int _3236 = abs(_2486);
    float _3238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3240 = log2(_3238);
    int _3242 = ~_3124;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    float _3248 = as_type<float>(_2486);
    bool _3250 = _2728;
    if (_2736)
    {
        float _3252 = in.m_64.x;
        _3248 = _3252;
    }
    float _3254 = _3248;
    int _3256 = ~_3230;
    int _3258 = _3256 + 1;
    int _3260 = _3258 + 1;
    int _3262 = _3204 * as_type<int>(_3024);
    int _3264 = abs(_2668);
    int _3266 = _3246 * as_type<int>(_2876);
    int _3268 = _3266 + _3150;
    int _3270 = abs(_2626);
    int _3272 = _3260 * as_type<int>(_3016);
    int _3274 = _3272 + _3262;
    float _3276 = float(uint(_3080));
    int _3278 = abs(_2216);
    int _3280 = _3192 * as_type<int>(_3068);
    int _3282 = abs(_2604);
    float _3284 = 1.0 / _3276;
    int _3286 = ~_3270;
    int _3288 = _3286 + 1;
    int _3290 = _3288 + 1;
    float _3292 = as_type<float>(_2604);
    if (_2732)
    {
        float _3294 = in.m_64.w;
        _3292 = _3294;
    }
    float _3296 = _3292;
    int _3298 = ~_3278;
    int _3300 = _3298 + 1;
    int _3302 = _3300 + 1;
    float _3304 = _3240 * _153;
    int _3306 = ~_3236;
    int _3308 = _3306 + 1;
    int _3310 = _3308 + 1;
    int _3312 = _3290 * as_type<int>(_3060);
    int _3314 = _3312 + _3280;
    int _3316 = abs(_2706);
    int _3318 = _3302 * as_type<int>(_3092);
    int _3320 = _3318 + _3268;
    float _3322 = _3276;
    float _3324 = _3142;
    if (_2728)
    {
        float _3326 = in.m_64.z;
        _3322 = _3326;
    }
    float _3328 = _3322;
    int _3330 = abs(_2350);
    float _3332 = exp2(_3304);
    int _3334 = ~_3264;
    int _3336 = _3334 + 1;
    int _3338 = _3336 + 1;
    int _3340 = _3310 * as_type<int>(_3134);
    int _3342 = _3340 + _3314;
    int _3344 = ~_3316;
    int _3346 = _3344 + 1;
    int _3348 = _3346 + 1;
    int _3350 = ~_3330;
    int _3352 = _3350 + 1;
    int _3354 = _3352 + 1;
    int _3356 = _3338 * as_type<int>(_3100);
    int _3358 = _3356 + _3320;
    int _3360 = abs(_2700);
    int _3362 = _3348 * as_type<int>(_3142);
    int _3364 = _3362 + _3342;
    float _3366 = float(uint(_1620));
    float _3368 = as_type<float>(_3348);
    float _3370 = as_type<float>(_3338);
    if (_2736)
    {
        float _3372 = _3254 * 3.1415927410125732421875;
        _3368 = _3372;
    }
    float _3374 = _3368;
    int _3376 = abs(_2244);
    int _3378 = _3354 * as_type<int>(_3170);
    int _3380 = _3378 + _3228;
    int _3382 = ~_3360;
    int _3384 = _3382 + 1;
    int _3386 = _3384 + 1;
    int _3388 = abs(_2392);
    float _3390 = 1.0 / _3366;
    int _3392 = abs(_2564);
    int _3394 = _3386 * as_type<int>(_3178);
    int _3396 = _3394 + _3380;
    int _3398 = abs(_2714);
    float _3400 = _3296;
    float _3402 = as_type<float>(_3380);
    if (_2732)
    {
        float _3404 = _3296 * 3.1415927410125732421875;
        _3400 = _3404;
    }
    float _3406 = _3400;
    float _3408 = _3328;
    if (_2728)
    {
        float _3410 = _3328 * 3.1415927410125732421875;
        _3408 = _3410;
    }
    float _3412 = _3408;
    int _3414 = ~_3282;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    if (_2732)
    {
        float _3420 = _3406 * 0.15915493667125701904296875;
        _3370 = _3420;
    }
    float _3422 = _3370;
    if (_2736)
    {
        float _3424 = _3374 * 0.15915493667125701904296875;
        _3402 = _3424;
    }
    float _3426 = _3402;
    int _3428 = ~_3376;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    int _3434 = _3418 * as_type<int>(_3216);
    int _3436 = _3434 + _3274;
    int _3438 = ~_3398;
    int _3440 = _3438 + 1;
    int _3442 = _3440 + 1;
    if (_2728)
    {
        float _3444 = _3412 * 0.15915493667125701904296875;
        _3324 = _3444;
    }
    float _3446 = _3324;
    float _3448 = float(uint(_3156));
    int _3450 = _3432 * _3358;
    int _3452 = ~_3392;
    int _3454 = _3452 + 1;
    int _3456 = _3454 + 1;
    int _3458 = _3442 * as_type<int>(_3224);
    int _3460 = _3458 + _3436;
    int _3462 = ~_3388;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    int _3468 = _2522 * _3376;
    int _3470 = _3468 + _3450;
    float _3472 = 1.0 / _3448;
    int _3474 = abs(_1620);
    int _3476 = _3456 * _3364;
    float _3478 = float(uint(_3196));
    int _3480 = _3466 * _3396;
    int _3482 = as_type<int>(_3390) + (-2);
    int _3484 = _2614 * _3392;
    int _3486 = _3484 + _3476;
    float _3488 = float(uint(_3470));
    float _3490 = _3446;
    if (_2728)
    {
        float _3492 = _3446 * 6.283185482025146484375;
        float _3494 = sin(_3492);
        _3490 = _3494;
    }
    float _3496 = _3490;
    float _3498 = float(uint(_3474));
    int _3500 = _2556 * _3388;
    int _3502 = _3500 + _3480;
    int _3504 = abs(_2660);
    float _3506 = as_type<float>(_3482) * _3488;
    bool _3508 = !_1944;
    int _3510 = _3508 ? _3122 : (-1);
    float _3512 = _1110 * 2.0;
    int _3514 = ~_3504;
    int _3516 = _3514 + 1;
    int _3518 = _3516 + 1;
    float _3520 = 1.0 / _3478;
    int _3522 = abs(_3080);
    float _3524 = -_3332;
    float _3526 = _3524 + 1.0;
    int _3528 = abs(_3196);
    int _3530 = _3518 * _3460;
    int _3532 = as_type<int>(_3472) + (-2);
    float _3534 = float(uint(_3486));
    float _3536 = 1.0 / _3498;
    float _3538 = float(uint(_3522));
    int _3540 = _3510 * _3504;
    int _3542 = _3540 + _3530;
    int _3544 = abs(_3156);
    float _3546 = as_type<float>(_3532) * _3534;
    int _3548 = ~_1620;
    int _3550 = _3548 + 1;
    float _3552 = trunc(_3506);
    float _3554 = precise::max(_3552, 0.0);
    uint _3556 = uint(_3554);
    float _3558 = as_type<float>(_3530);
    if (_2728)
    {
        bool _3560 = _3496 > 0.5;
        _2126 = _3560;
    }
    bool _3562 = _2126;
    float _3564 = float(uint(_3544));
    int _3566 = as_type<int>(_3520) + (-2);
    float _3568 = float(uint(_3542));
    float _3570 = _3422;
    bool _3572 = _3562;
    if (_2732)
    {
        float _3574 = _3422 * 6.283185482025146484375;
        float _3576 = sin(_3574);
        _3570 = _3576;
    }
    float _3578 = _3570;
    float _3580 = float(uint(_3528));
    int _3582 = abs(_3470);
    int _3584 = as_type<int>(_3284) + (-2);
    float _3586 = 1.0 / _3538;
    float _3588 = float(uint(_3502));
    int _3590 = _3550 * int(_3556);
    int _3592 = _3590 + _3470;
    int _3594 = as_type<int>(_3536) + (-2);
    float _3596 = as_type<float>(_3566) * _3568;
    float _3598 = as_type<float>(_3584) * _3588;
    int _3600 = abs(_3502);
    float _3602 = as_type<float>(_3442);
    if (_2736)
    {
        float _3604 = _3426 * 6.283185482025146484375;
        float _3606 = sin(_3604);
        _3602 = _3606;
    }
    float _3608 = _3602;
    float _3610 = float(uint(_3582));
    if (!_2728)
    {
        _3558 = _225;
    }
    float _3612 = _3558;
    float _3614 = _3612;
    if (_2728)
    {
        float _3616 = -_225;
        float _3618 = _3562 ? _3616 : _225;
        _3614 = _3618;
    }
    float _3620 = _3614;
    if (_2732)
    {
        bool _3622 = _3578 > 0.5;
        _3572 = _3622;
    }
    bool _3624 = _3572;
    float _3626 = 1.0 / _3564;
    float _3628 = float(uint(_3592));
    int _3630 = as_type<int>(_3586) + (-2);
    float _3632 = as_type<float>(_3482) * _3628;
    float _3634 = float(uint(_3600));
    float _3636 = 1.0 / _3580;
    if (_2736)
    {
        bool _3638 = _3608 > 0.5;
        _3250 = _3638;
    }
    bool _3640 = _3250;
    int _3642 = abs(_3542);
    float _3644 = as_type<float>(_3630) * _3634;
    int _3646 = ~_3080;
    int _3648 = _3646 + 1;
    int _3650 = ~_3156;
    int _3652 = _3650 + 1;
    float _3654 = trunc(_3598);
    float _3656 = precise::max(_3654, 0.0);
    uint _3658 = uint(_3656);
    int _3660 = as_type<int>(_3626) + (-2);
    float _3662 = float(uint(_3642));
    int _3664 = ~_3196;
    int _3666 = _3664 + 1;
    int _3668 = ~_3474;
    int _3670 = _3668 + 1;
    float _3672 = trunc(_3546);
    float _3674 = precise::max(_3672, 0.0);
    uint _3676 = uint(_3674);
    int _3678 = as_type<int>(_3636) + (-2);
    int _3680 = ~_3528;
    int _3682 = _3680 + 1;
    float _3684 = as_type<float>(_3678) * _3662;
    float _3686 = floor(_3512);
    float _3688 = as_type<float>(_3594) * _3610;
    int _3690 = abs(_3486);
    int _3692 = _3648 * int(_3658);
    int _3694 = _3692 + _3502;
    float _3696 = trunc(_3596);
    float _3698 = precise::max(_3696, 0.0);
    uint _3700 = uint(_3698);
    int _3702 = _3652 * int(_3676);
    int _3704 = _3702 + _3486;
    float _3706 = float(uint(_3690));
    float _3708 = float(uint(_3694));
    float _3710 = float(uint(_3704));
    float _3712 = as_type<float>(_3660) * _3706;
    float _3714 = _3706;
    float _3716 = _3686;
    if (!_2736)
    {
        _3714 = _225;
    }
    float _3718 = _3714;
    float _3720 = trunc(_3688);
    float _3722 = precise::max(_3720, 0.0);
    uint _3724 = uint(_3722);
    float _3726 = _3718;
    if (_2736)
    {
        float _3728 = -_225;
        float _3730 = _3640 ? _3728 : _225;
        _3726 = _3730;
    }
    float _3732 = _3726;
    float _3734 = as_type<float>(_3584) * _3708;
    bool _3736 = _1120 > 0.5;
    float _3738 = as_type<float>(_3532) * _3710;
    bool _3740 = _1122 > 0.5;
    float _3742 = -_233;
    int _3744 = _3736 ? as_type<int>(_3742) : as_type<int>(_233);
    int _3746 = _3666 * int(_3700);
    int _3748 = _3746 + _3542;
    bool _3750 = _3686 >= 0.0;
    bool _3752 = isnan(_3686);
    bool _3754 = _3750 || _3752;
    bool _3756 = isnan(0.0);
    bool _3758 = _3754 || _3756;
    float _3760 = trunc(_3632);
    float _3762 = precise::max(_3760, 0.0);
    uint _3764 = uint(_3762);
    int _3766 = ~_3522;
    int _3768 = _3766 + 1;
    int _3770 = _3758 ? 0 : 1;
    bool _3772 = _3686 > 0.0;
    float _3774 = float(uint(_3748));
    float _3776 = trunc(_3712);
    float _3778 = precise::max(_3776, 0.0);
    uint _3780 = uint(_3778);
    int _3782 = _3670 * int(_3724);
    int _3784 = _3782 + _3582;
    int _3786 = ~_3770;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    float _3792 = -_225;
    int _3794 = _3740 ? as_type<int>(_3792) : as_type<int>(_225);
    float _3796 = float(uint(_3784));
    float _3798 = trunc(_3644);
    float _3800 = precise::max(_3798, 0.0);
    uint _3802 = uint(_3800);
    bool _3804 = _1124 != 1;
    int _3806 = _3790;
    if (!_3772)
    {
        int _3808 = ~_3770;
        int _3810 = _3808 + 1;
        _3806 = _3810;
    }
    int _3812 = _3806;
    float _3814 = as_type<float>(_3566) * _3774;
    float _3816 = as_type<float>(_3594) * _3796;
    int _3818 = ~_3544;
    int _3820 = _3818 + 1;
    float _3822 = trunc(_3684);
    float _3824 = precise::max(_3822, 0.0);
    uint _3826 = uint(_3824);
    int _3828 = int(_3556) + int(_3764);
    bool _3830 = !_2748;
    float _3832 = _3830 ? _233 : as_type<float>(_3744);
    float _3834 = trunc(_3734);
    float _3836 = precise::max(_3834, 0.0);
    uint _3838 = uint(_3836);
    int _3840 = _3820 * int(_3780);
    int _3842 = _3840 + _3690;
    int _3844 = _3768 * int(_3802);
    int _3846 = _3844 + _3600;
    int _3848 = ~_1620;
    int _3850 = _3848 + 1;
    float _3852 = float(uint(_3842));
    float _3854 = trunc(_3738);
    float _3856 = precise::max(_3854, 0.0);
    uint _3858 = uint(_3856);
    int _3860 = _3682 * int(_3826);
    int _3862 = _3860 + _3642;
    float _3864 = float(uint(_3846));
    float _3866 = as_type<float>(_3660) * _3852;
    int _3868 = ~_3080;
    int _3870 = _3868 + 1;
    float _3872 = float(uint(_3862));
    float _3874 = trunc(_3814);
    float _3876 = precise::max(_3874, 0.0);
    uint _3878 = uint(_3876);
    int _3880 = int(_3658) + int(_3838);
    float _3882 = as_type<float>(_3630) * _3864;
    float _3884 = as_type<float>(_3678) * _3872;
    if (_1202)
    {
        _3716 = _1110;
    }
    float _3886 = _3716;
    int _3888 = _3870 * _3880;
    int _3890 = _3888 + _3502;
    float _3892 = _3886;
    if (!_1202)
    {
        _3892 = _1120;
    }
    float _3894 = _3892;
    float _3896 = trunc(_3816);
    float _3898 = precise::max(_3896, 0.0);
    uint _3900 = uint(_3898);
    int _3902 = int(_3676) + int(_3858);
    int _3904 = _3850 * _3828;
    int _3906 = _3904 + _3470;
    int _3908 = ~_3544;
    int _3910 = _3908 + 1;
    float _3912 = trunc(_3866);
    float _3914 = precise::max(_3912, 0.0);
    uint _3916 = uint(_3914);
    int _3918 = int(_3700) + int(_3878);
    float _3920 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    bool _3922 = !_3804;
    float _3924 = _3922 ? as_type<float>(_1126) : as_type<float>(_1128);
    float _3926 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3928 = !_2744;
    float _3930 = _3928 ? _225 : as_type<float>(_3794);
    int _3932 = ~_3196;
    int _3934 = _3932 + 1;
    float _3936 = trunc(_3882);
    float _3938 = precise::max(_3936, 0.0);
    uint _3940 = uint(_3938);
    int _3942 = int(_3724) + int(_3900);
    bool _3944 = !_3804;
    float _3946 = _3944 ? as_type<float>(_1130) : as_type<float>(_1126);
    bool _3948 = uint(_3890) >= uint(_3080);
    bool _3950 = uint(_3906) >= uint(_1620);
    float _3952 = trunc(_3884);
    float _3954 = precise::max(_3952, 0.0);
    uint _3956 = uint(_3954);
    int _3958 = ~_3156;
    int _3960 = _3958 + 1;
    int _3962 = int(_3780) + int(_3916);
    int _3964 = _3960 * _3902;
    int _3966 = _3964 + _3486;
    int _3968 = ~_3528;
    int _3970 = _3968 + 1;
    int _3972 = _3910 * _3962;
    int _3974 = _3972 + _3690;
    bool _3976 = !_3950;
    int _3978 = _3976 ? 0 : (-1);
    int _3980 = _3934 * _3918;
    int _3982 = _3980 + _3542;
    bool _3984 = uint(_3966) >= uint(_3156);
    int _3986 = ~_3474;
    int _3988 = _3986 + 1;
    int _3990 = int(_3802) + int(_3940);
    float _3992 = _1224 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _3994 = int(_3826) + int(_3956);
    int _3996 = _3988 * _3942;
    int _3998 = _3996 + _3582;
    float _4000 = as_type<float>(_3906);
    if (_1202)
    {
        _4000 = _1122;
    }
    float _4002 = _4000;
    int _4004 = ~_3522;
    int _4006 = _4004 + 1;
    int _4008 = _3970 * _3994;
    int _4010 = _4008 + _3642;
    bool _4012 = uint(_3998) >= uint(_3474);
    bool _4014 = !_1202;
    float _4016 = _4014 ? as_type<float>(_1130) : as_type<float>(_1128);
    float _4018 = as_type<float>(_3474);
    float _4020 = _4002;
    if (_2740)
    {
        float _4022 = in.m_64.y;
        _4018 = _4022;
    }
    float _4024 = _4018;
    bool _4026 = !_1202;
    float _4028 = _4026 ? as_type<float>(_1128) : as_type<float>(_1126);
    int _4030 = _4006 * _3990;
    int _4032 = _4030 + _3600;
    if (!_1202)
    {
        _4020 = _1110;
    }
    float _4034 = _4020;
    bool _4036 = uint(_3982) >= uint(_3196);
    int _4038 = ~_3828;
    int _4040 = _4038 + _3978;
    int _4042 = _4040 + 1;
    float _4044 = _4034 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _4046 = !_3984;
    int _4048 = _4046 ? 0 : (-1);
    bool _4050 = !_4036;
    int _4052 = _4050 ? 0 : (-1);
    float _4054 = fma(_4044, -2.0, _3926);
    bool _4056 = !_3948;
    int _4058 = _4056 ? 0 : (-1);
    bool _4060 = uint(_3974) >= uint(_3544);
    int _4062 = _1620 * _4042;
    int _4064 = _4062 + _3470;
    bool _4066 = uint(_4010) >= uint(_3528);
    float _4068 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4054);
    int _4070 = _3470 ^ _1620;
    float _4072 = _1122 * 2.0;
    bool _4074 = uint(_4032) >= uint(_3522);
    int _4076 = _3502 ^ _3080;
    float _4078 = _4024;
    if (_2740)
    {
        float _4080 = _4024 * 3.1415927410125732421875;
        _4078 = _4080;
    }
    float _4082 = _4078;
    int _4084 = ~_3880;
    int _4086 = _4084 + _4058;
    int _4088 = _4086 + 1;
    float _4090 = floor(_4072);
    bool _4092 = !_4074;
    int _4094 = _4092 ? 0 : (-1);
    float _4096 = _4082;
    if (_2740)
    {
        float _4098 = _4082 * 0.15915493667125701904296875;
        _4096 = _4098;
    }
    float _4100 = _4096;
    uint _4102 = uint(int(uint(_4076) >> uint(31)));
    int _4104 = _3080 * _4088;
    int _4106 = _4104 + _3502;
    bool _4108 = !_4012;
    int _4110 = _4108 ? 0 : (-1);
    int _4112 = ~_3902;
    int _4114 = _4112 + _4048;
    int _4116 = _4114 + 1;
    float _4118 = _4100;
    if (_2740)
    {
        float _4120 = _4100 * 6.283185482025146484375;
        float _4122 = sin(_4120);
        _4118 = _4122;
    }
    float _4124 = _4118;
    bool _4126 = !_4066;
    int _4128 = _4126 ? 0 : (-1);
    bool _4130 = _3080 == 0;
    int _4132 = _3156 * _4116;
    int _4134 = _4132 + _3486;
    int _4136 = ~_3918;
    int _4138 = _4136 + _4052;
    int _4140 = _4138 + 1;
    uint _4142 = uint(int(uint(_4070) >> uint(31)));
    int _4144 = ~_4094;
    int _4146 = _3990 + _4144;
    int _4148 = _4146 + 1;
    int _4150 = _3196 * _4140;
    int _4152 = _4150 + _3542;
    int _4154 = ~int(_4102);
    int _4156 = _4154 + 1;
    float _4158 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4160 = _3034 + _4158;
    int _4162 = ~_4110;
    int _4164 = _3942 + _4162;
    int _4166 = _4164 + 1;
    bool _4168 = !_4130;
    int _4170 = _4168 ? _4106 : (-1);
    int _4172 = ~int(_4142);
    int _4174 = _4172 + 1;
    bool _4176 = _3156 == 0;
    int _4178 = _4148 ^ _4156;
    bool _4180 = _1620 == 0;
    bool _4182 = !_4060;
    int _4184 = _4182 ? 0 : (-1);
    int _4186 = _4166 ^ _4174;
    bool _4188 = _3080 == 0;
    bool _4190 = !_4176;
    int _4192 = _4190 ? _4134 : (-1);
    int _4194 = ~_4156;
    int _4196 = _4194 + _4178;
    int _4198 = _4196 + 1;
    bool _4200 = !_4180;
    int _4202 = _4200 ? _4064 : (-1);
    bool _4204 = _3196 == 0;
    bool _4206 = _3196 == 0;
    int _4208 = _3542 ^ _3196;
    bool _4210 = _1620 == 0;
    float _4212 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4214 = _2852 + _4212;
    int _4216 = ~_4174;
    int _4218 = _4216 + _4186;
    int _4220 = _4218 + 1;
    bool _4222 = !_4188;
    int _4224 = _4222 ? _4198 : (-1);
    bool _4226 = !_4204;
    int _4228 = _4226 ? _4152 : (-1);
    bool _4230 = _4090 > 0.0;
    bool _4232 = _3156 == 0;
    int _4234 = _3486 ^ _3156;
    bool _4236 = !_4210;
    int _4238 = _4236 ? _4220 : (-1);
    float _4240 = _1120 * 2.0;
    bool _4242 = _4090 >= 0.0;
    bool _4244 = isnan(_4090);
    bool _4246 = _4242 || _4244;
    bool _4248 = isnan(0.0);
    bool _4250 = _4246 || _4248;
    int _4252 = ~_4184;
    int _4254 = _3962 + _4252;
    int _4256 = _4254 + 1;
    float _4258 = floor(_4240);
    int _4260 = _4250 ? 0 : 1;
    uint _4262 = uint(int(uint(_4208) >> uint(31)));
    int _4264 = ~_4260;
    int _4266 = _4264 + 1;
    int _4268 = _4266 + 1;
    int _4270 = _4268;
    bool _4272 = _4250;
    if (!_4230)
    {
        int _4274 = ~_4260;
        int _4276 = _4274 + 1;
        _4270 = _4276;
    }
    int _4278 = _4270;
    uint _4280 = uint(int(uint(_4234) >> uint(31)));
    int _4282 = ~_4128;
    int _4284 = _3994 + _4282;
    int _4286 = _4284 + 1;
    float _4288 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _4290 = ~int(_4262);
    int _4292 = _4290 + 1;
    float _4294 = fma(as_type<float>(_1128), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4288);
    int _4296 = ~int(_4280);
    int _4298 = _4296 + 1;
    float _4300 = as_type<float>(_1128) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    if (_2740)
    {
        bool _4302 = _4124 > 0.5;
        _4272 = _4302;
    }
    bool _4304 = _4272;
    float _4306 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _4308 = _4286 ^ _4292;
    float _4310 = _4160 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4312 = _4256 ^ _4298;
    float _4314 = -_4306;
    float _4316 = fma(_4300, 2.0, _4314);
    int _4318 = ~_4292;
    int _4320 = _4318 + _4308;
    int _4322 = _4320 + 1;
    float _4324 = _4160 * _4160;
    float _4326 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4310);
    int _4328 = ~_4298;
    int _4330 = _4328 + _4312;
    int _4332 = _4330 + 1;
    float _4334 = fma(_3234, _3234, _4324);
    bool _4336 = !_4206;
    int _4338 = _4336 ? _4322 : (-1);
    float _4340 = (*spvDescriptorSet0.vp_c9)._m0[103].z + (*spvDescriptorSet0.vp_c9)._m0[103].x;
    bool _4342 = !_4232;
    int _4344 = _4342 ? _4332 : (-1);
    float _4346 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4326);
    int _4348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4350 = _4348 != 0;
    int _4352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4354 = _4352 != 0;
    int _4356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4358 = _4356 != 0;
    float _4360 = fma(as_type<float>(_1128), (*spvDescriptorSet0.vp_c9)._m0[103].z, _4340);
    float _4362 = fma(_4214, _4214, _4334);
    float _4364 = fma(_2830, _3008, _3206);
    float _4366 = _1122 + _1120;
    bool _4368 = !_4354;
    int _4370 = _4368 ? 0 : 1;
    float _4372 = sqrt(_4362);
    bool _4374 = _4346 >= 0.0;
    float _4376 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _4378 = _4366 + (-1.0);
    float _4380 = _1110 + _1122;
    float _4382 = (*spvDescriptorSet0.vp_c9)._m0[103].w + (*spvDescriptorSet0.vp_c9)._m0[103].y;
    float _4384 = fma(as_type<float>(_1126), (*spvDescriptorSet0.vp_c9)._m0[93].w, _4376);
    float _4386 = fma(_4378, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _4388 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4390 = fma(as_type<float>(_1126), (*spvDescriptorSet0.vp_c9)._m0[103].w, _4382);
    float _4392 = as_type<float>(_1126) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4394 = _4380 + (-1.0);
    float _4396 = _4378;
    if (_4374)
    {
        _4396 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4398 = _4396;
    float _4400 = fma(_2822, _3002, _4364);
    float _4402 = fma(_4392, -2.0, _4388);
    float _4404 = fma(_4394, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _4406 = _4372 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _4408 = as_type<int>(_4398);
    if (_4374)
    {
        float _4410 = _4398 * 5.0;
        _4408 = as_type<int>(_4410);
    }
    int _4412 = _4408;
    float _4414 = fma(_2844, _2940, _4400);
    float _4416 = precise::min(_3992, _4406);
    float _4418 = -_153;
    float _4420 = fma(_4418, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4316);
    if (_4374)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12146 = as_type<float>(_4412);
        out.gl_Position.z = _12146;
    }
    float _4422 = fma(_3032, _2936, _4414);
    bool _4424 = !_4350;
    int _4426 = _4424 ? 0 : 1;
    out.m_72.w = _4416;
    bool _4428 = _4258 >= 0.0;
    bool _4430 = isnan(_4258);
    bool _4432 = _4428 || _4430;
    bool _4434 = isnan(0.0);
    bool _4436 = _4432 || _4434;
    float _4438 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4440 = fma(_2896, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4422);
    float _4442 = fma(_3946, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4438);
    int _4444 = _4436 ? 0 : 1;
    float _4446 = rsqrt(_4362);
    float _4448 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4450 = _3946 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    bool _4452 = _4258 > 0.0;
    float _4454 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4456 = (*spvDescriptorSet0.vp_c9)._m0[102].y + (*spvDescriptorSet0.vp_c9)._m0[101].w;
    float _4458 = fma(_4450, -2.0, _4448);
    float _4460 = _4016 * (*spvDescriptorSet0.vp_c9)._m0[102].x;
    float _4462 = _4028 * (*spvDescriptorSet0.vp_c9)._m0[102].y;
    float _4464 = fma(_3924, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4454);
    float _4466 = _3924 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4468 = fma(_4462, -2.0, _4456);
    float _4470 = _3894 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _4472 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4474 = -_3920;
    float _4476 = fma(_4466, 2.0, _4474);
    float _4478 = _4160 * _4446;
    float _4480 = _4214 * _4446;
    float _4482 = -_4472;
    float _4484 = fma(_4470, 2.0, _4482);
    float _4486 = _3234 * _4446;
    float _4488 = -_4478;
    float _4490 = fma(_4488, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4160);
    int _4492 = ~_4444;
    int _4494 = _4492 + 1;
    int _4496 = _4494 + 1;
    float _4498 = _4478 * _4416;
    int _4500 = _4496;
    if (!_4452)
    {
        int _4502 = ~_4444;
        int _4504 = _4502 + 1;
        _4500 = _4504;
    }
    int _4506 = _4500;
    float _4508 = -_4486;
    float _4510 = fma(_4508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3234);
    float _4512 = _4490 * _4490;
    float _4514 = _4480 * _4416;
    float _4516 = _4486 * _4416;
    float _4518 = -_4498;
    float _4520 = _4160 + _4518;
    float _4522 = fma(_4510, _4510, _4512);
    float _4524 = -_4480;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4214);
    float _4528 = -_4514;
    float _4530 = _4214 + _4528;
    float _4532 = -_4516;
    float _4534 = _3234 + _4532;
    float _4536 = _4520 * _4520;
    float _4538 = fma(_4526, _4526, _4522);
    float _4540 = fma(_4534, _4534, _4536);
    float _4542 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4544 = abs(_4426);
    float _4546 = (*spvDescriptorSet0.vp_c9)._m0[102].x + (*spvDescriptorSet0.vp_c9)._m0[101].z;
    float _4548 = fma(_4530, _4530, _4540);
    float _4550 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4542);
    float _4552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _4554 = -_4546;
    float _4556 = fma(_4460, 2.0, _4554);
    float _4558 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4560 = 1.0 + _4558;
    float _4562 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[101].y, _4468);
    bool _4564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4566 = isnan(0.0);
    bool _4568 = _4564 || _4566;
    bool _4570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4572 = _4568 || _4570;
    float _4574 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4550);
    out.m_74.x = _4440;
    float _4576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _4578 = -_153;
    float _4580 = fma(_4578, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4484);
    int _4582 = abs(_4370);
    float _4584 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4294);
    float _4586 = float(_4506);
    float _4588 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4590 = _4572 ? _3526 : 0.0;
    float _4592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4594 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4596 = isnan(1.0);
    bool _4598 = _4594 || _4596;
    bool _4600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4602 = _4598 || _4600;
    float _4604 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4588);
    float _4606 = float(_4544);
    float _4608 = _4552 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4610 = float(_3812);
    float _4612 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4604);
    float _4614 = float(_4582);
    float _4616 = sqrt(_4538);
    float _4618 = _4606 * _4586;
    float _4620 = float(_4202);
    float _4622 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4384);
    float _4624 = float(_4170);
    float _4626 = _4576 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _4628 = _4614 * _4610;
    float _4630 = float(_4228);
    float _4632 = sqrt(_4548);
    float _4634 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[102].z, _4360);
    float _4636 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[102].w, _4390);
    float _4638 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4402);
    float _4640 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4464);
    float _4642 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4442);
    float _4644 = -_153;
    float _4646 = fma(_4644, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4476);
    float _4648 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4458);
    float _4650 = 1.0 / _4560;
    float _4652 = -_153;
    float _4654 = fma(_4652, (*spvDescriptorSet0.vp_c9)._m0[101].x, _4556);
    float _4656 = _4446 * _4616;
    float _4658 = _4592 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _4660 = fma(_4608, _4620, _4580);
    float _4662 = fma(_4626, _4624, _4420);
    float _4664 = _2140 + 0.5;
    float _4666 = fma(_4658, _4630, _4654);
    float _4668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4670 = _4446 * _4632;
    float _4672 = _3930 + 0.5;
    float _4674 = float(_4192);
    float _4676 = _3620 + 0.5;
    float _4678 = float(_4238);
    float _4680 = fma(_4608, _4672, _4660);
    float _4682 = fma(_4626, _4664, _4662);
    float _4684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _4686 = _4676;
    if (_4602)
    {
        float _4688 = _4590 * _4650;
        _157 = _4688;
    }
    float _4690 = _157;
    float _4692 = float(_4224);
    float _4694 = -_4574;
    float _4696 = _4694 + 1.0;
    float _4698 = float(_4344);
    float _4700 = -_4640;
    float _4702 = _4700 + 1.0;
    float _4704 = float(_4338);
    float _4706 = -_4696;
    float _4708 = fma(_3930, _4706, _4680);
    float _4710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4712 = _4668 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    if (_4374)
    {
        out.m_49.x = 0.0;
    }
    bool _4714 = !_4358;
    int _4716 = _4714 ? 0 : 1;
    float _4718 = fma(_4712, _4674, _4646);
    float _4720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4722 = _4684 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4724 = _3732 + 0.5;
    float _4726 = fma(_4712, _4676, _4718);
    float _4728 = _4718;
    if (!_2732)
    {
        _4686 = _233;
    }
    float _4730 = _4686;
    float _4732 = -_4068;
    float _4734 = fma(_4722, _4678, _4732);
    float _4736 = fma(_4658, _4724, _4666);
    float _4738 = _3832 + (-0.5);
    float _4740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _4742 = _4710 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _4744 = _4730;
    if (_2732)
    {
        float _4746 = -_233;
        float _4748 = _3624 ? _4746 : _233;
        _4744 = _4748;
    }
    float _4750 = _4744;
    float _4752 = -_4722;
    float _4754 = fma(_4752, _4738, _4734);
    float _4756 = _2540 + (-0.5);
    float _4758 = -_4638;
    float _4760 = fma(_4742, _4692, _4758);
    if (!_2740)
    {
        _4728 = _233;
    }
    float _4762 = _4728;
    float _4764 = _4720 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4766 = _4762;
    if (_2740)
    {
        float _4768 = -_233;
        float _4770 = _4304 ? _4768 : _233;
        _4766 = _4770;
    }
    float _4772 = _4766;
    float _4774 = -_4648;
    float _4776 = fma(_4764, _4698, _4774);
    float _4778 = -_4742;
    float _4780 = fma(_4778, _4756, _4760);
    float _4782 = -_4584;
    float _4784 = _4782 + 1.0;
    float _4786 = _4772 + (-0.5);
    float _4788 = _4740 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _4790 = _4750 + (-0.5);
    float _4792 = -_4562;
    float _4794 = fma(_4788, _4704, _4792);
    float _4796 = -_4764;
    float _4798 = fma(_4796, _4790, _4776);
    float _4800 = -_4612;
    float _4802 = _4800 + 1.0;
    float _4804 = -_4784;
    float _4806 = fma(_4804, _2140, _4682);
    float _4808 = -_4642;
    float _4810 = _4808 + 1.0;
    float _4812 = -_4788;
    float _4814 = fma(_4812, _4786, _4794);
    float _4816 = fma(_3832, _4802, _4754);
    float _4818 = -_4634;
    float _4820 = _4818 + 1.0;
    float _4822 = in.m_76.x;
    float _4824 = in.m_76.y;
    float _4826 = in.m_76.z;
    float _4828 = fma(_4810, _4750, _4798);
    float _4830 = -_4622;
    float _4832 = _4830 + 1.0;
    float _4834 = -_4636;
    float _4836 = _4834 + 1.0;
    float _4838 = _4670 * _4656;
    float _4840 = -_4702;
    float _4842 = fma(_4840, _3620, _4726);
    float _4844 = -_4820;
    float _4846 = fma(_4844, _3732, _4736);
    float _4848 = fma(_4832, _2540, _4780);
    float _4850 = fma(_4836, _4772, _4814);
    float _4852 = _1224 * _4838;
    out.m_78.x = _4708;
    out.m_78.y = _4816;
    out.m_80.x = _4806;
    out.m_80.y = _4848;
    out.m_82.x = _4842;
    out.m_82.y = _4828;
    out.m_84.x = _4846;
    out.m_84.y = _4850;
    out.m_86.x = _4852;
    float _4854 = _4826;
    if (_4374)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4856 = -_4478;
    float _4858 = fma(_4856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3034);
    float _4860 = _4618 * (-2.0);
    float _4862 = _1110 + (-0.5);
    float _4864 = -_4486;
    float _4866 = fma(_4864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3072);
    float _4868 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4870 = _4858 + _4868;
    float _4872 = fma(_4860, _4822, _4822);
    int _4874 = abs(_4716);
    float _4876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4878 = _4866 + _4876;
    float _4880 = _4870 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _4882 = fma(_4862, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4872);
    float _4884 = -_4480;
    float _4886 = fma(_4884, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2852);
    float _4888 = _4628 * (-2.0);
    float _4890 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4880);
    float _4892 = _1122 + (-0.5);
    float _4894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4896 = _4886 + _4894;
    float _4898 = fma(_4386, _4888, _4386);
    float _4900 = fma(_4888, _4824, _4824);
    float _4902 = fma(_4896, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4890);
    float _4904 = float(_4278);
    float _4906 = _1110 + _1120;
    float _4908 = float(_4874);
    float _4910 = fma(_4892, (*spvDescriptorSet0.vp_c9)._m0[196].y, _4900);
    bool _4912 = _4902 >= 0.0;
    float _4914 = _4906 + (-1.0);
    float _4916 = fma(_4404, _4860, _4404);
    float _4918 = _4908 * _4904;
    float _4920 = fma(_4898, _4690, _4910);
    float _4922 = _1120 + (-0.5);
    float _4924 = _4918 * (-2.0);
    float _4926 = fma(_4916, _4690, _4882);
    float _4928 = fma(_4914, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _4930 = _4920 * 0.15915493667125701904296875;
    float _4932 = fma(_4924, _4826, _4826);
    float _4934 = _4926 * 0.15915493667125701904296875;
    float _4936 = fma(_4928, _4924, _4928);
    int _4938 = as_type<int>(_4922);
    if (_4912)
    {
        _4854 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4940 = _4854;
    float _4942 = fma(_4922, (*spvDescriptorSet0.vp_c9)._m0[196].z, _4932);
    float _4944 = _4934 * 6.283185482025146484375;
    float _4946 = sin(_4944);
    if (_4912)
    {
        out.m_49.x = 0.0;
    }
    float _4948 = fma(_4936, _4690, _4942);
    if (_4912)
    {
        float _4950 = _4940 * 5.0;
        _4938 = as_type<int>(_4950);
    }
    int _4952 = _4938;
    float _4954 = _4948 * 0.15915493667125701904296875;
    float _4956 = _4934 * 6.283185482025146484375;
    float _4958 = cos(_4956);
    if (_4912)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13028 = as_type<float>(_4952);
        out.gl_Position.z = _13028;
    }
    float _4960 = _4930 * 6.283185482025146484375;
    float _4962 = sin(_4960);
    float _4964 = _4930 * 6.283185482025146484375;
    float _4966 = cos(_4964);
    if (_4912)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4968 = _4954 * 6.283185482025146484375;
    float _4970 = cos(_4968);
    float _4972 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _4974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _233);
    float _4976 = _4946 * _4962;
    float _4978 = _4958 * _4966;
    float _4980 = _4972 * _4838;
    float _4982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _4984 = _4958 * _4962;
    float _4986 = _4954 * 6.283185482025146484375;
    float _4988 = sin(_4986);
    float _4990 = _4980 * _4974;
    float _4992 = _4946 * _4966;
    float _4994 = _4852 * _4982;
    float _4996 = _4838 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4998 = _4996 * 0.5;
    float _5000 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5002 = _4958 * _4970;
    float _5004 = _4966 * _4970;
    float _5006 = _4946 * _4970;
    float _5008 = _4962 * _4970;
    float _5010 = _5002 * _4990;
    float _5012 = fma(_4988, _4978, _4976);
    float _5014 = -_4992;
    float _5016 = fma(_4988, _4984, _5014);
    float _5018 = -_4990;
    float _5020 = _4988 * _5018;
    float _5022 = -_4984;
    float _5024 = fma(_4988, _4992, _5022);
    float _5026 = fma(_5012, _4994, _5010);
    float _5028 = _5006 * _4990;
    float _5030 = fma(_5004, _4994, _5020);
    float _5032 = fma(_4988, _4976, _4978);
    float _5034 = fma(_5016, _4998, _5026);
    float _5036 = fma(_5024, _4994, _5028);
    float _5038 = fma(_5008, _4998, _5030);
    float _5040 = _5034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5042 = fma(_5032, _4998, _5036);
    float _5044 = _5034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5046 = _5012 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5048 = fma(_5038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5040);
    float _5050 = fma(_5038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5044);
    float _5052 = fma(_5004, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5046);
    float _5054 = fma(_5042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5048);
    float _5056 = fma(_5042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5050);
    float _5058 = _5054 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _5060 = _5056 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _5062 = _5034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5064 = _2852 + _5058;
    float _5066 = _5012 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5068 = _3072 + _5060;
    float _5070 = fma(_5038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5062);
    float _5072 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5074 = _5064 + _5072;
    float _5076 = fma(_5004, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5066);
    float _5078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5080 = _5068 + _5078;
    float _5082 = fma(_5042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5070);
    float _5084 = _5074 * _5074;
    float _5086 = _5002 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5088 = fma(_5080, _5080, _5084);
    float _5090 = _5012 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5092 = -_4988;
    float _5094 = fma(_5092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5086);
    float _5096 = sqrt(_5088);
    float _5098 = fma(_5004, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5090);
    float _5100 = _5082 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _5102 = _5002 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5104 = _5002 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5106 = _3034 + _5100;
    float _5108 = -_4988;
    float _5110 = fma(_5108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5102);
    float _5112 = -_4988;
    float _5114 = fma(_5112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5104);
    bool _5116 = _5096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5118 = _5100;
    float _5120 = _5086;
    float _5122 = _5102;
    if (!_5116)
    {
        _5118 = _5068;
    }
    float _5124 = _5118;
    float _5126 = _5124;
    if (!_5116)
    {
        _5120 = _5064;
    }
    float _5128 = _5120;
    float _5130 = _5128;
    if (!_5116)
    {
        _5122 = _5106;
    }
    float _5132 = _5122;
    bool _5134 = !_5116;
    float _5136 = _5132;
    if (!_5134)
    {
        float _5138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5142 = _5096 + _5140;
        float _5144 = _5106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5146 = rsqrt(_5088);
        float _5148 = _5142 * _5138;
        float _5150 = _5148 * 0.15915493667125701904296875;
        float _5152 = _5150 * 6.283185482025146484375;
        float _5154 = cos(_5152);
        float _5156 = _5150 * 6.283185482025146484375;
        float _5158 = sin(_5156);
        float _5160 = _5154 + (-1.0);
        float _5162 = _5160 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5164 = fma(_5158, _5144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5166 = fma(_5106, _5154, _5162);
        float _5168 = _5146 * _5164;
        float _5170 = fma(_5080, _5168, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5172 = fma(_5074, _5168, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5136 = _5166;
        _5126 = _5170;
        _5130 = _5172;
    }
    float _5174 = _5136;
    float _5176 = _5126;
    float _5178 = _5130;
    float _5180 = _5016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5182 = _5016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5184 = _5016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5186 = fma(_5000, _5000, 1.0);
    float _5188 = -_4498;
    float _5190 = _5188 + _5174;
    float _5192 = fma(_5008, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5180);
    float _5194 = fma(_5008, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5182);
    float _5196 = fma(_5008, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5184);
    float _5198 = -_4516;
    float _5200 = _5198 + _5176;
    float _5202 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5204 = _5190 + _5202;
    float _5206 = rsqrt(_5186);
    float _5208 = -_4514;
    float _5210 = _5208 + _5178;
    float _5212 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5214 = _5200 + _5212;
    float _5216 = _5204 * _5204;
    float _5218 = fma(_5006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5110);
    float _5220 = fma(_5006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5094);
    float _5222 = fma(_5006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5114);
    float _5224 = fma(_5214, _5214, _5216);
    float _5226 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5228 = _5210 + _5226;
    float _5230 = fma(_5032, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5192);
    float _5232 = fma(_5032, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5194);
    float _5234 = fma(_5032, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5196);
    float _5236 = fma(_5228, _5228, _5224);
    float _5238 = fma(_5024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5098);
    float _5240 = fma(_5024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5076);
    float _5242 = fma(_5024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5052);
    float _5244 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5246 = _5000 * _5206;
    float _5248 = _5000 * _5218;
    float _5250 = _5000 * _5220;
    float _5252 = _5000 * _5222;
    float _5254 = sqrt(_5236);
    float _5256 = -_5230;
    float _5258 = _5246 * _5256;
    float _5260 = -_5232;
    float _5262 = _5246 * _5260;
    float _5264 = -_5234;
    float _5266 = _5246 * _5264;
    float _5268 = fma(_5244, _5238, _5248);
    float _5270 = fma(_5244, _5240, _5250);
    float _5272 = fma(_5244, _5242, _5252);
    float _5274 = fma(_5206, _5218, _5258);
    float _5276 = fma(_5206, _5220, _5262);
    float _5278 = fma(_5206, _5222, _5266);
    float _5280 = _5230 + _5268;
    float _5282 = _5232 + _5270;
    float _5284 = _5234 + _5272;
    out.m_88.x = _5238;
    out.m_88.y = _5240;
    out.m_88.z = _5242;
    float _5286 = -_4516;
    float _5288 = _3072 + _5286;
    bool _5290 = _5254 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5292 = isnan(_5254);
    bool _5294 = _5290 || _5292;
    bool _5296 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5298 = _5294 || _5296;
    out.m_90.x = _5274;
    out.m_90.y = _5276;
    out.m_90.z = _5278;
    float _5300 = -_4498;
    float _5302 = _3034 + _5300;
    float _5304 = -_4514;
    float _5306 = _2852 + _5304;
    out.m_92.x = _5280;
    out.m_92.y = _5282;
    out.m_92.z = _5284;
    float _5308 = _5206;
    float _5310 = _5274;
    float _5312 = _5270;
    float _5314 = _5262;
    if (!_5298)
    {
        _5308 = 1.0;
    }
    float _5316 = _5308;
    bool _5318 = !_5298;
    float _5320 = _5316;
    if (!_5318)
    {
        bool _5322 = _5254 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5324 = isnan(_5254);
        bool _5326 = _5322 || _5324;
        bool _5328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5330 = _5326 || _5328;
        if (!_5330)
        {
            float _5332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5334 = _5254 + _5332;
            float _5336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5336;
            float _5340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5342 = _5340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5344 = 1.0 / _5338;
            float _5346 = _5334 * _5344;
            float _5348 = fma(_5346, _5342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5320 = _5348;
            _5350 = true;
        }
        else
        {
            bool _5352 = _5254 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5354 = isnan(_5254);
            bool _5356 = _5352 || _5354;
            bool _5358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5360 = _5356 || _5358;
            if (!_5360)
            {
                float _5362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5364 = _5254 + _5362;
                float _5366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5368 = _5366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5372 = _5370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5374 = 1.0 / _5368;
                float _5376 = _5364 * _5374;
                float _5378 = fma(_5376, _5372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5320 = _5378;
                _5350 = true;
            }
            else
            {
                _5320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5350 = false;
    float _5380 = _5320;
    float _5382 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5384 = _5190 + _5382;
    float _5386 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5388 = _5200 + _5386;
    float _5390 = -_4486;
    float _5392 = fma(_5390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5288);
    float _5394 = fma(_5384, _5380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5396 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5398 = _5210 + _5396;
    float _5400 = fma(_5388, _5380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5402 = -_5302;
    float _5404 = _5402 + _5394;
    float _5406 = fma(_5398, _5380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5408 = -_5288;
    float _5410 = _5408 + _5400;
    float _5412 = _5404 * _5404;
    float _5414 = -_5306;
    float _5416 = _5414 + _5406;
    float _5418 = fma(_5410, _5410, _5412);
    float _5420 = fma(_5416, _5416, _5418);
    float _5422 = sqrt(_5420);
    bool _5424 = _5422 > 0.0;
    bool _5426 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5428 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5430 = _5426 || _5428;
    bool _5432 = isnan(0.5);
    bool _5434 = _5430 || _5432;
    float _5436 = _5380;
    float _5438 = _5400;
    float _5440 = _5406;
    if (!_5424)
    {
        _5310 = _5394;
    }
    float _5442 = _5310;
    float _5444 = _5442;
    float _5446 = _5442;
    if (!_5424)
    {
        _5436 = _5406;
    }
    float _5448 = _5436;
    bool _5450 = !_5424;
    float _5452 = _5448;
    if (!_5450)
    {
        float _5454 = _229 * _229;
        float _5456 = rsqrt(_5420);
        float _5458 = fma(_221, _221, _5454);
        float _5460 = fma(_235, _235, _5458);
        float _5462 = sqrt(_5460);
        float _5464 = _5410 * _5456;
        float _5466 = _5404 * _5456;
        float _5468 = _5416 * _5456;
        bool _5470 = _5462 > 0.0;
        float _5472 = _5462;
        _5312 = _5464;
        if (!_5470)
        {
            _5444 = _5394;
        }
        float _5474 = _5444;
        _5446 = _5474;
        if (!_5470)
        {
            _5472 = _5406;
        }
        float _5476 = _5472;
        bool _5478 = !_5470;
        _5452 = _5476;
        if (!_5478)
        {
            float _5480 = rsqrt(_5460);
            float _5482 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5484 = _229 * _5480;
            float _5486 = _221 * _5480;
            float _5488 = _5466 * _5484;
            float _5490 = _235 * _5480;
            float _5492 = fma(_5464, _5486, _5488);
            float _5494 = _5482 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5496 = fma(_5468, _5490, _5492);
            float _5498 = _5496 * _5494;
            float _5500 = fma(_221, _5498, _5400);
            float _5502 = fma(_229, _5498, _5394);
            float _5504 = fma(_235, _5498, _5406);
            _5446 = _5502;
            _5452 = _5504;
            _5438 = _5500;
        }
    }
    float _5506 = _5446;
    float _5508 = _5452;
    float _5510 = _5438;
    float _5512 = _5312;
    float _5514 = -_4478;
    float _5516 = fma(_5514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5506);
    float _5518 = -_4480;
    float _5520 = fma(_5518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5508);
    float _5522 = -_4486;
    float _5524 = fma(_5522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5510);
    float _5526 = -_4478;
    float _5528 = fma(_5526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5302);
    float _5530 = -_4480;
    float _5532 = fma(_5530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5306);
    float _5534 = _5516;
    float _5536 = _5524;
    float _5538 = _5520;
    float _5540 = _5512;
    if (!_5434)
    {
        float _5542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _5544 = _5528 + _5542;
        float _5546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _5548 = _5392 + _5546;
        float _5550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5552 = -_5306;
        float _5554 = _5552 + _5508;
        float _5556 = _5544 * _5544;
        float _5558 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _5560 = _5532 + _5558;
        float _5562 = -_5288;
        float _5564 = _5562 + _5510;
        float _5566 = -_5302;
        float _5568 = _5566 + _5506;
        float _5570 = fma(_5548, _5548, _5556);
        float _5572 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5574 = fma(_5560, _5560, _5570);
        float _5576 = sqrt(_5574);
        float _5578 = 1.0 / _4656;
        float _5580 = _5572 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5582 = precise::min(_5576, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5584 = _5582 * _5550;
        float _5586 = _5584 * _5578;
        float _5588 = _5580 * _5586;
        float _5590 = _5554 * _5586;
        float _5592 = fma(_5564, _5588, _5392);
        float _5594 = fma(_5568, _5588, _5528);
        float _5596 = fma(_5580, _5590, _5532);
        _5534 = _5594;
        _5536 = _5592;
        _5538 = _5596;
        _5440 = _5580;
    }
    float _5598 = _5534;
    float _5600 = _5536;
    float _5602 = _5538;
    float _5604 = _5440;
    float _5606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5608 = _5598 + _5606;
    float _5610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5612 = _5600 + _5610;
    float _5614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5616 = _5602 + _5614;
    float _5618 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _5620 = _5608 * _5608;
    float _5622 = fma(_5612, _5612, _5620);
    float _5624 = fma(_5616, _5616, _5622);
    float _5626 = rsqrt(_5624);
    float _5628 = sqrt(_5624);
    float _5630 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5632 = _5612 * _5630;
    float _5634 = _5616 * _5630;
    float _5636 = _5632 * _5632;
    float _5638 = _5634 * _5634;
    float _5640 = _5636 + _5638;
    float _5642 = sqrt(_5640);
    bool _5644 = _5642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5648 = _5642 + _5646;
    float _5650 = _5626;
    float _5652 = _5648;
    float _5654 = _5608;
    float _5656 = _5630;
    if (_5644)
    {
        float _5658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5650 = _5658;
    }
    float _5660 = _5650;
    float _5662 = _5660;
    if (_5644)
    {
        float _5664 = _5648 * _5660;
        _5652 = _5664;
    }
    float _5666 = _5652;
    if (_5644)
    {
        float _5668 = rsqrt(_5640);
        _5662 = _5668;
    }
    float _5670 = _5662;
    float _5672 = _5670;
    if (_5644)
    {
        float _5674 = _5666 * 0.15915493667125701904296875;
        _5540 = _5674;
    }
    float _5676 = _5540;
    float _5678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5680 = _5616;
    float _5682 = _5676;
    if (_5644)
    {
        float _5684 = _5676 * 6.283185482025146484375;
        float _5686 = sin(_5684);
        _5680 = _5686;
    }
    float _5688 = _5680;
    float _5690 = precise::max(0.0, _5678);
    float _5692 = _5604;
    float _5694 = _5690;
    if (_5644)
    {
        float _5696 = _5676 * 6.283185482025146484375;
        float _5698 = cos(_5696);
        _5692 = _5698;
    }
    float _5700 = _5692;
    float _5702 = -_5630;
    float _5704 = -_5690;
    float _5706 = fma(_5608, _5702, _5704);
    if (_5644)
    {
        float _5708 = _5706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5654 = _5708;
    }
    float _5710 = _5654;
    float _5712 = _5688;
    float _5714 = _5710;
    if (_5644)
    {
        float _5716 = fma(_5688, _5710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5712 = _5716;
    }
    float _5718 = _5712;
    float _5720 = _5718;
    if (!_5644)
    {
        _5714 = _5634;
    }
    float _5722 = _5714;
    float _5724 = _5722;
    if (!_5644)
    {
        _5682 = _5636;
    }
    float _5726 = _5682;
    float _5728 = _5726;
    if (_5644)
    {
        float _5730 = _5670 * _5718;
        _5314 = _5730;
    }
    float _5732 = _5314;
    if (!_5644)
    {
        _5672 = _5632;
    }
    float _5734 = _5672;
    float _5736 = _5734;
    if (_5644)
    {
        float _5738 = _5700 + (-1.0);
        _5694 = _5738;
    }
    float _5740 = _5694;
    float _5742 = _5740;
    if (_5644)
    {
        float _5744 = _5632 * _5732;
        _5736 = _5744;
    }
    float _5746 = _5736;
    if (!_5644)
    {
        _5720 = _5706;
    }
    float _5748 = _5720;
    float _5750 = _5748;
    if (_5644)
    {
        float _5752 = _5634 * _5732;
        _5724 = _5752;
    }
    float _5754 = _5724;
    if (_5644)
    {
        float _5756 = _5740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5656 = _5756;
    }
    float _5758 = _5656;
    if (_5644)
    {
        float _5760 = _5746 * _5746;
        _5728 = _5760;
    }
    float _5762 = _5728;
    if (!_5644)
    {
        _5742 = _5638;
    }
    float _5764 = _5742;
    float _5766 = _5764;
    if (_5644)
    {
        float _5768 = _5754 * _5754;
        _5766 = _5768;
    }
    float _5770 = _5766;
    if (_5644)
    {
        float _5772 = fma(_5706, _5700, _5758);
        _5750 = _5772;
    }
    float _5774 = _5750;
    float _5776 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _5778 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5780 = fma(_5774, _5774, _5762);
    float _5782 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[2].x, _5776);
    float _5784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5786 = fma(_5628, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5784);
    float _5788 = precise::clamp(_5786, 0.0, 1.0);
    float _5790 = _5780 + _5770;
    float _5792 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5794 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[2].z, _5782);
    float _5796 = -_5788;
    float _5798 = _5796 + 1.0;
    float _5800 = rsqrt(_5790);
    float _5802 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5804 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5792);
    float _5806 = _5794 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _5808 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5778);
    float _5810 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5802);
    float _5812 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5804);
    float _5814 = _5806 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5816 = abs(_5798);
    float _5818 = log2(_5816);
    float _5820 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5810);
    float _5822 = _5812 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5824 = -_5814;
    float _5826 = fma(_5824, _5618, 1.0);
    float _5828 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5808);
    float _5830 = _5820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5832 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5834 = _5800 * _5746;
    float _5836 = _5800 * _5774;
    float _5838 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5832);
    float _5840 = _5828 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _5842 = _5834 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5844 = _5800 * _5754;
    float _5846 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5838);
    float _5848 = log2(_5826);
    float _5850 = -_5842;
    float _5852 = fma(_5836, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5850);
    float _5854 = _5818 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5856 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5846);
    float _5858 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5860 = -_5844;
    float _5862 = fma(_5860, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5852);
    float _5864 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5866 = exp2(_5854);
    float _5868 = fma(_5862, -0.5, 0.5);
    float _5870 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5864);
    float _5872 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5858);
    float _5874 = fma(_5862, 0.5, 0.5);
    float _5876 = _5836 + 1.0;
    float _5878 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5870);
    float _5880 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5872);
    float _5882 = 1.0 / _5856;
    float _5884 = fma(_5874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5886 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5878);
    float _5888 = _5848 * 0.693147182464599609375;
    float _5890 = fma(_5874, _5884, -0.212114393711090087890625);
    float _5892 = _5888 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5894 = sqrt(_5868);
    float _5896 = -_5836;
    float _5898 = fma(_5866, _5876, _5896);
    float _5900 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5880);
    float _5902 = fma(_5874, _5890, 1.570728778839111328125);
    float _5904 = fma(_5898, 0.5, 0.5);
    float _5906 = _5886 * _5882;
    float _5908 = _5900 * _5882;
    float _5910 = fma(_5906, 0.5, 0.5);
    float _5912 = fma(_5908, -0.5, 0.5);
    float _5914 = _5894 * 0.636619746685028076171875;
    float3 _14626 = float3(_5910, _5912, _5892);
    float _5916 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_14626, float3(0.0), isnan(_14626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_14626, float3(0.0), isnan(_14626)), level(0.0)).x;
    float _5918 = -_5902;
    float _5920 = fma(_5914, _5918, 1.0);
    float3 _14642 = float3(_5910, _5912, _5892);
    float4 _5923 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_14642, float3(0.0), isnan(_14642)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_14642, float3(0.0), isnan(_14642)), level(0.0)).xyzw;
    float _5925 = _5923.x;
    float _5927 = _5923.y;
    float _5929 = _5923.z;
    float _5931 = _5923.w;
    float2 _14659 = float2(_5920, _5904);
    float3 _5935 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_14659, float2(0.0), isnan(_14659)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_14659, float2(0.0), isnan(_14659)), level(0.0)).xyz;
    float _5937 = _5935.x;
    float _5939 = _5935.y;
    float _5941 = _5935.z;
    float _5943 = _5528 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5945 = _5818 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5947 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5949 = fma(_5392, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5943);
    bool _5951 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5953 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5955 = _5951 || _5953;
    bool _5957 = isnan(0.5);
    bool _5959 = _5955 || _5957;
    float _5961 = exp2(_5945);
    float _5963 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5947);
    float _5965 = fma(_5532, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5949);
    float _5967 = _5528 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_94.x = _5392;
    out.m_94.y = _5528;
    out.m_94.z = _5532;
    float _5969 = _5965 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5971 = fma(_5392, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5967);
    out.m_96.x = _5600;
    out.m_96.y = _5598;
    out.m_96.z = _5602;
    float _5973 = 1.0 / _5969;
    float _5975 = fma(_5532, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5971);
    float _5977 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5979 = _5830;
    if (!_5959)
    {
        _5977 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _5981 = _5977;
    float _5983 = _5981;
    if (_5959)
    {
        _5979 = 1.0;
    }
    float _5985 = _5979;
    float _5987 = _5975 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5989 = -_5961;
    float _5991 = _5989 + 1.0;
    float _5993 = _5987 + _5969;
    float _5995 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5963);
    float _5997 = _5991 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5999 = _5886 + _5856;
    float _6001 = _5856 * 0.5;
    float _6003 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5995);
    float _6005 = -_5997;
    float _6007 = _6005 + 1.0;
    float _6009 = _5993 * _5973;
    float _6011 = _6009 * 0.5;
    out.gl_Position.x = _5886;
    out.gl_Position.y = _5900;
    out.gl_Position.z = _6003;
    out.gl_Position.w = _5856;
    float _6013 = _5973;
    float _6015 = _6011;
    float _6017 = _5985;
    if (!_5959)
    {
        float _6019 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _6021 = fma(_6011, _5981, _6019);
        _6013 = _6021;
    }
    float _6023 = _6013;
    if (!_5959)
    {
        _6015 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _6025 = _6015;
    float _6027 = _6025;
    if (!_5959)
    {
        float _6029 = -_6025;
        float _6031 = _6029 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _5983 = _6031;
    }
    float _6033 = _5983;
    float _6035 = _6023;
    if (!_5959)
    {
        float _6037 = 1.0 / _6023;
        _6035 = _6037;
    }
    float _6039 = _6035;
    float _6041 = _6033;
    if (!_5959)
    {
        float _6043 = 1.0 / _6033;
        _6041 = _6043;
    }
    float _6045 = _6041;
    if (!_5959)
    {
        float _6047 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _6049 = -_6025;
        float _6051 = fma(_6039, _6047, _6049);
        _6027 = _6051;
    }
    float _6053 = _6027;
    float _6055 = _5999 * 0.5;
    if (!_5959)
    {
        float _6057 = _6053 * _6045;
        float _6059 = precise::clamp(_6057, 0.0, 1.0);
        _6017 = _6059;
    }
    float _6061 = _6017;
    float _6063 = _6003 + _5856;
    float _6065 = fma(_5900, -0.5, _6001);
    float _6067 = _6061 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _6069 = _6061 > 0.0;
    bool _6071 = isnan(_6061);
    bool _6073 = _6069 || _6071;
    bool _6075 = isnan(0.0);
    bool _6077 = _6073 || _6075;
    float _6079 = _6063 * 0.5;
    float _6081 = _6067 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_98.x = _6055;
    out.m_98.y = _6065;
    out.m_98.z = _6079;
    out.m_98.w = _5856;
    out.m_49.x = _6081;
    float _6083 = _5997 * _5916;
    float _6085 = _5931 * _6083;
    float _6087 = _5931 * _6007;
    float _6089 = _5941 * _6083;
    float _6091 = fma(_5937, _6085, _5925);
    float _6093 = fma(_5939, _6085, _5927);
    float _6095 = fma(_5931, _6089, _5929);
    out.m_100.x = _6091;
    out.m_100.y = _6093;
    out.m_100.z = _6095;
    out.m_100.w = _6087;
    if (_6077)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _6097 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6097;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5350 = false;
    bool _783 = false;
    bool _641 = false;
    bool _459 = false;
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_46.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_49.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6154 = as_type<float>(_135);
        out.gl_Position.z = _6154;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_51.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = 0.0;
    float _157 = _153;
    if (_149)
    {
        float _159 = float(_119);
        _155 = _159;
    }
    float _161 = _155;
    bool _163 = _153 >= _161;
    bool _165 = !_149;
    bool _167 = _163 || _165;
    if (_167)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _129;
    if (_167)
    {
        out.m_49.x = 0.0;
    }
    if (_167)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6223 = as_type<float>(_173);
        out.gl_Position.z = _6223;
    }
    if (_167)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_56.x;
    float _179 = in.m_56.y;
    float _181 = in.m_56.z;
    float _183 = in.m_58.x;
    float _185 = in.m_58.y;
    float _187 = in.m_58.z;
    float _189 = in.m_60.x;
    float _191 = in.m_60.y;
    float _193 = in.m_60.z;
    float _195 = in.m_62.x;
    float _197 = in.m_62.y;
    float _199 = in.m_62.z;
    int _201 = as_type<int>(_175) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_175) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = _179 * _185;
    float _213 = _179 * _191;
    float _215 = fma(_177, _183, _211);
    float _217 = _179 * _197;
    float _219 = fma(_177, _189, _213);
    float _221 = fma(_181, _187, _215);
    bool _223 = !_203;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = fma(_177, _195, _217);
    float _229 = fma(_181, _193, _219);
    bool _231 = !_207;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma(_181, _199, _227);
    bool _237 = !_209;
    float _255;
    if (!_237)
    {
        float _239 = in.m_64.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_119);
        float _261 = 1.0 / _259;
        float _263 = _153 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _265 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _283;
    float _287 = in.m_66.x;
    float _289 = in.m_66.y;
    bool _291 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_265);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _277;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _281;
    float _309 = 1.0 / _285;
    float _311 = _269 * _303;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _265 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    float _321 = fma(_319, _311, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _315 * _307;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    bool _329 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _331 = isnan(_265);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_265);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = fma(_327, _311, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = _273 * _309;
    float _357 = -_301;
    float _359 = _357 + 1.0;
    bool _361 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_265);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _339 * _359;
    float _379 = -_339;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = fma(_375, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = _371 * _381;
    float _391 = -_371;
    float _393 = _391 + 1.0;
    float _395 = fma(_385, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = _351 * _393;
    float _399 = -_351;
    float _401 = _399 + 1.0;
    float _403 = _321 * _397;
    float _405 = _353 * _397;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_387, _389, _415);
    float _425 = fma(_395, _389, _417);
    float _427 = fma(_419, _377, _423);
    float _429 = fma(_421, _377, _425);
    float _431 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    float _435 = _431 * _287;
    float _437 = _433 * _289;
    bool _439 = !_305;
    float _457;
    if (!_439)
    {
        float _441 = in.m_64.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_119);
        float _463 = 1.0 / _461;
        float _465 = _153 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _471 = _467 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _477 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _479 = isnan(_467);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _497 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _499 = isnan(_467);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = 1.0 / _475;
    float _511 = -_487;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _515;
    bool _519 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _521 = isnan(_467);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _507 * _513;
    float _533 = -_507;
    float _535 = _533 + 1.0;
    bool _537 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _539 = 1.0 / _491;
    float _541 = _529 * _535;
    float _543 = -_529;
    float _545 = _543 + 1.0;
    float _547 = 1.0 / _495;
    float _549 = _517 * _509;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _555 = fma(_549, _471, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _557 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = isnan(_467);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _553 * _539;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = _467 + _575;
    float _579 = _555 * _541;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _583 = _467 + _581;
    float _585 = fma(_569, _577, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _587 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[115].x, _579);
    float _589 = _573 * _547;
    float _591 = -_567;
    float _593 = _591 + 1.0;
    float _595 = fma(_585, _531, _587);
    float _597 = fma(_589, _583, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _599 = _487 * _593;
    float _601 = fma(_597, _599, _595);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[118].x, _601);
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _611;
    out.m_68.y = _613;
    out.m_68.z = _615;
    out.m_68.w = _617;
    bool _619 = !_537;
    float _621 = _613;
    float _639;
    if (!_619)
    {
        float _623 = in.m_64.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_119);
        float _645 = 1.0 / _643;
        float _647 = _153 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _653 = _649 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _659 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _661 = isnan(_649);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _675 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _677 = isnan(_649);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _687;
    bool _691 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _693 = isnan(_649);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = 1.0 / _657;
    float _705 = -_669;
    float _707 = _705 + 1.0;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _711 = _685 * _707;
    float _713 = -_685;
    float _715 = _713 + 1.0;
    float _717 = 1.0 / _673;
    float _719 = _689 * _703;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _725 = fma(_719, _653, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _727 = -_701;
    float _729 = _727 + 1.0;
    float _731 = _725 * _711;
    float _733 = _723 * _717;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _737 = _649 + _735;
    float _739 = _669 * _729;
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[131].x, _731);
    float _743 = fma(_733, _737, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _745 = fma(_743, _739, _741);
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _753 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[133].x, _745);
    float _755 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _753 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _755;
    out.m_70.y = _757;
    out.m_70.z = _759;
    out.m_70.w = _761;
    bool _763 = !_709;
    float _781;
    if (!_763)
    {
        float _765 = in.m_64.x;
        float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _769 = _765 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _771 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[14].x, _153);
        float _773 = _771 * _767;
        float _775 = floor(_773);
        float _777 = -_775;
        float _779 = _773 + _777;
        _781 = _779;
        _783 = true;
    }
    else
    {
        float _785 = float(_119);
        float _787 = 1.0 / _785;
        float _789 = _153 * _787;
        _781 = _789;
    }
    _783 = false;
    float _791 = _781;
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _795 = int(_793);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _803 = _801 != 0;
    float _805 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _807 = int(_805);
    float _809 = 0.0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _813 = _799;
    if (_799)
    {
        _809 = 1.0;
    }
    float _815 = _809;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[67].y);
    int _819 = int(_817);
    float _821 = float(_795);
    float _823 = 0.0;
    float _825 = _815;
    if (_799)
    {
        _823 = 1.0;
    }
    float _827 = _823;
    float _829 = 0.0;
    float _831 = _827;
    if (_799)
    {
        _829 = 1.0;
    }
    float _833 = _829;
    int _835 = 0;
    float _837 = _833;
    if (_799)
    {
        _835 = 0;
    }
    int _839 = _835;
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _843 = int(_841);
    float _845 = float(_807);
    int _847 = _839;
    if (_799)
    {
        _811 = 0;
    }
    int _849 = _811;
    float _851 = 1.0 / _821;
    float _853 = float(_819);
    float _855 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].y);
    int _857 = int(_855);
    int _859 = int(_799);
    int _861 = _803 ? 2 : 0;
    int _863 = _859 | _861;
    int _865 = _209 ? 4 : 0;
    int _867 = _863 | _865;
    int _869 = false ? 8 : 0;
    int _871 = _867 | _869;
    int _873 = false ? 16 : 0;
    int _875 = _871 | _873;
    int _877 = false ? 32 : 0;
    int _879 = _875 | _877;
    int _881 = false ? 64 : 0;
    int _883 = _879 | _881;
    int _885 = _883 & 2;
    float _887 = float(uint(_843));
    float _889 = as_type<float>(_885);
    int _891 = _849;
    if (_803)
    {
        float _893 = in.m_64.w;
        _889 = _893;
    }
    float _895 = _889;
    float _897 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _899 = int(_897);
    float _901 = _851 * _153;
    float _903 = 1.0 / _845;
    float _905 = float(_857);
    float _907 = 1.0 / _853;
    float _909 = float(uint(_899));
    float _911 = _895;
    if (_803)
    {
        float _913 = _895 * 3.1415927410125732421875;
        _911 = _913;
    }
    float _915 = _911;
    float _917 = trunc((*spvDescriptorSet0.vp_c9)._m0[67].x);
    int _919 = int(_917);
    float _921 = _903 * _153;
    if (_803)
    {
        float _923 = _915 * 0.15915493667125701904296875;
        _621 = _923;
    }
    float _925 = _621;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].x);
    int _929 = int(_927);
    float _931 = _907 * _153;
    float _933 = 1.0 / _887;
    float _935 = float(uint(_919));
    float _937 = trunc(_901);
    int _939 = int(_937);
    float _941 = float(uint(_929));
    float _943 = 1.0 / _905;
    float _945 = 1.0 / _909;
    float _947 = float(uint(_939));
    float _949 = _915;
    float _951 = _903;
    float _953 = _905;
    if (_799)
    {
        float _955 = in.m_64.x;
        float _957 = in.m_64.y;
        float _959 = in.m_64.z;
        _949 = _955;
        _951 = _957;
        _953 = _959;
    }
    float _961 = _949;
    float _963 = _951;
    float _965 = _953;
    float _967 = trunc(_921);
    int _969 = int(_967);
    float _971 = _943 * _153;
    float _973 = 1.0 / _935;
    float _975 = trunc(_931);
    int _977 = int(_975);
    int _979 = as_type<int>(_945) + (-2);
    int _981 = 0;
    int _983 = as_type<int>(_973);
    float _985 = _961;
    float _987 = _965;
    float _989 = _963;
    if (_799)
    {
        _981 = as_type<int>(_965);
    }
    int _991 = _981;
    float _993 = 1.0 / _941;
    float _995 = trunc(_971);
    int _997 = int(_995);
    int _999 = as_type<int>(_933) + (-2);
    float _1001 = float(uint(_977));
    float _1003 = as_type<float>(_999) * _947;
    float _1005 = float(uint(_969));
    float _1007 = _925;
    float _1009 = _1001;
    int _1011 = _991;
    if (_803)
    {
        float _1013 = _925 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        _1007 = _1015;
    }
    float _1017 = _1007;
    int _1019 = as_type<int>(_993) + (-2);
    float _1021 = as_type<float>(_979) * _1005;
    int _1023 = as_type<int>(_973) + (-2);
    float _1025 = trunc(_1003);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = float(uint(_997));
    float _1034 = as_type<float>(_1023) * _1001;
    float _1036 = _993;
    if (_799)
    {
        _1009 = _961;
    }
    float _1038 = _1009;
    float _1040 = as_type<float>(_1019) * _1032;
    int _1042 = as_type<int>(_1040);
    float _1044 = _1038;
    if (_799)
    {
        _1036 = _1038;
    }
    float _1046 = _1036;
    float _1048 = trunc(_1021);
    float _1050 = precise::max(_1048, 0.0);
    uint _1052 = uint(_1050);
    float _1054 = _1046;
    if (_799)
    {
        _983 = as_type<int>(_1038);
    }
    int _1056 = _983;
    float _1058 = trunc(_1034);
    float _1060 = precise::max(_1058, 0.0);
    uint _1062 = uint(_1060);
    float _1064 = trunc(_1040);
    float _1066 = precise::max(_1064, 0.0);
    uint _1068 = uint(_1066);
    int _1070 = _1056;
    if (_799)
    {
        _1042 = as_type<int>(_963);
    }
    int _1072 = _1042;
    int _1074 = _1072;
    if (!_799)
    {
        float _1076 = in.m_64.x;
        float _1078 = in.m_64.y;
        float _1080 = in.m_64.z;
        float _1082 = _1078 * 3.1415927410125732421875;
        float _1084 = _1080 * 3.1415927410125732421875;
        float _1086 = _1076 * 3.1415927410125732421875;
        float _1088 = _1082 * 0.15915493667125701904296875;
        float _1090 = _1084 * 0.15915493667125701904296875;
        float _1092 = _1086 * 0.15915493667125701904296875;
        float _1094 = _1088 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = _1090 * 6.283185482025146484375;
        float _1100 = sin(_1098);
        float _1102 = _1092 * 6.283185482025146484375;
        float _1104 = sin(_1102);
        _1054 = _1080;
        _837 = 5.839270114898681640625;
        _985 = _1076;
        _831 = 1.2345600128173828125;
        _1044 = _1078;
        _825 = 7.345489978790283203125;
        _891 = 2;
        _987 = _1080;
        _989 = _1078;
        _847 = 1;
        _1074 = as_type<int>(_1096);
        _1070 = as_type<int>(_1104);
        _1011 = as_type<int>(_1100);
    }
    float _1106 = _1054;
    float _1108 = _837;
    float _1110 = _985;
    float _1112 = _831;
    float _1114 = _1044;
    float _1116 = _825;
    int _1118 = _891;
    float _1120 = _987;
    float _1122 = _989;
    int _1124 = _847;
    int _1126 = _1074;
    int _1128 = _1070;
    int _1130 = _1011;
    int _1132 = ~_899;
    int _1134 = _1132 + 1;
    float _1136 = _1106 * _1108;
    int _1138 = ~_919;
    int _1140 = _1138 + 1;
    float _1142 = _1110 * _1108;
    int _1144 = ~_843;
    int _1146 = _1144 + 1;
    int _1148 = _1134 * int(_1052);
    int _1150 = _1148 + _969;
    int _1152 = ~_929;
    int _1154 = _1152 + 1;
    int _1156 = _1140 * int(_1062);
    int _1158 = _1156 + _977;
    float _1160 = float(_119);
    int _1162 = _1146 * int(_1030);
    int _1164 = _1162 + _939;
    float _1166 = float(uint(_1150));
    int _1168 = _1154 * int(_1068);
    int _1170 = _1168 + _997;
    float _1172 = float(uint(_1158));
    float _1174 = _1106 * _1112;
    float _1176 = float(uint(_1164));
    float _1178 = _1114 * _1116;
    float _1180 = float(uint(_1170));
    float _1182 = as_type<float>(_1023) * _1172;
    float _1184 = floor(_1136);
    float _1186 = as_type<float>(_999) * _1176;
    float _1188 = as_type<float>(_979) * _1166;
    float _1190 = as_type<float>(_1019) * _1180;
    if (_803)
    {
        bool _1192 = _1017 > 0.5;
        _813 = _1192;
    }
    bool _1194 = _813;
    float _1196 = in.m_60.w;
    int _1198 = ~_929;
    int _1200 = _1198 + 1;
    bool _1202 = _1118 != 2;
    float _1204 = floor(_1142);
    int _1206 = ~_919;
    int _1208 = _1206 + 1;
    float _1210 = in.m_62.w;
    bool _1212 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1214 = isnan(_791);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1226 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1228 = isnan(_791);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = in.m_58.w;
    float _1240 = 1.0 / _1160;
    float _1242 = -_1184;
    float _1244 = _1136 + _1242;
    float _1246 = -_1222;
    float _1248 = _1246 + 1.0;
    float _1250 = floor(_1174);
    float _1252 = -_1204;
    float _1254 = _1142 + _1252;
    float _1256 = float(_899);
    float _1258 = float(_997);
    float _1260 = floor(_1178);
    float _1262 = _1240 * _153;
    float _1264 = float(_969);
    float _1266 = trunc(_1182);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_1250;
    float _1274 = _1174 + _1272;
    float _1276 = float(_929);
    bool _1278 = _1258 >= _1276;
    bool _1280 = isnan(_1258);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan(_1276);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = trunc(_1186);
    float _1292 = precise::max(_1290, 0.0);
    uint _1294 = uint(_1292);
    float _1296 = -_1260;
    float _1298 = _1178 + _1296;
    float _1300 = float(_843);
    float _1302 = _1300 * _1244;
    float _1304 = trunc(_1188);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    int _1310 = int(_1062) + int(_1270);
    int _1312 = ~_843;
    int _1314 = _1312 + 1;
    float _1316 = trunc(_1190);
    float _1318 = precise::max(_1316, 0.0);
    uint _1320 = uint(_1318);
    int _1322 = int(_1030) + int(_1294);
    float _1324 = float(_939);
    bool _1326 = _1324 >= _1300;
    bool _1328 = isnan(_1324);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(_1300);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1300 * _1262;
    int _1340 = int(_1052) + int(_1308);
    float _1342 = trunc(_1302);
    int _1344 = int(_1342);
    bool _1346 = _1264 >= _1256;
    bool _1348 = isnan(_1264);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(_1256);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = _1256 * _1298;
    float _1360 = _1276 * _1274;
    int _1362 = _1314 * _1322;
    int _1364 = _1362 + _939;
    int _1366 = int(_1194);
    int _1368 = _803 ? 2 : 0;
    int _1370 = _1366 | _1368;
    int _1372 = _209 ? 4 : 0;
    int _1374 = _1370 | _1372;
    int _1376 = false ? 8 : 0;
    int _1378 = _1374 | _1376;
    int _1380 = false ? 16 : 0;
    int _1382 = _1378 | _1380;
    int _1384 = false ? 32 : 0;
    int _1386 = _1382 | _1384;
    int _1388 = false ? 64 : 0;
    int _1390 = _1386 | _1388;
    int _1392 = _1390 & 1;
    float _1394 = _1256 * _1262;
    int _1396 = int(_1068) + int(_1320);
    float _1398 = _1276 * _1262;
    int _1400 = ~_899;
    int _1402 = _1400 + 1;
    float _1404 = trunc(_1360);
    int _1406 = int(_1404);
    bool _1408 = uint(_1364) >= uint(_843);
    int _1410 = _1200 * _1396;
    int _1412 = _1410 + _997;
    float _1414 = float(_919);
    int _1416 = _1402 * _1340;
    int _1418 = _1416 + _969;
    float _1420 = float(_977);
    bool _1422 = uint(_1412) >= uint(_929);
    float _1424 = _1414 * _1262;
    bool _1426 = uint(_1418) >= uint(_899);
    float _1428 = _1414 * _1254;
    bool _1430 = _1420 >= _1414;
    bool _1432 = isnan(_1420);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(_1414);
    bool _1438 = _1434 || _1436;
    float _1440 = float(_1438);
    int _1442 = _1208 * _1310;
    int _1444 = _1442 + _977;
    bool _1446 = !_1408;
    int _1448 = _1446 ? 0 : (-1);
    float _1450 = trunc(_1358);
    int _1452 = int(_1450);
    bool _1454 = !_1426;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1460 = _1458 != 0;
    bool _1462 = !_1422;
    int _1464 = _1462 ? 0 : (-1);
    int _1466 = ~_1322;
    int _1468 = _1466 + _1448;
    int _1470 = _1468 + 1;
    float _1472 = trunc(_1336);
    int _1474 = int(_1472);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1478 = _1476 != 0;
    bool _1480 = !_1460;
    int _1482 = _1480 ? 0 : 1;
    bool _1484 = uint(_1444) >= uint(_919);
    int _1486 = ~_1340;
    int _1488 = _1486 + _1456;
    int _1490 = _1488 + 1;
    float _1492 = trunc(_1288);
    int _1494 = int(_1492);
    int _1496 = ~_1396;
    int _1498 = _1496 + _1464;
    int _1500 = _1498 + 1;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 65536;
    bool _1504 = _1502 != 0;
    int _1506 = _899 * _1490;
    int _1508 = _1506 + _969;
    bool _1510 = !_1478;
    int _1512 = _1510 ? 0 : 1;
    int _1514 = _929 * _1500;
    int _1516 = _1514 + _997;
    int _1518 = abs(_1482);
    float _1520 = trunc(_1338);
    int _1522 = int(_1520);
    bool _1524 = !_1504;
    int _1526 = _1524 ? 0 : 1;
    int _1528 = abs(_1512);
    bool _1530 = !_1484;
    int _1532 = _1530 ? 0 : (-1);
    float _1534 = trunc(_1394);
    int _1536 = int(_1534);
    int _1538 = abs(_1526);
    int _1540 = _1344 * _1518;
    int _1542 = _1540 + _939;
    int _1544 = ~_1310;
    int _1546 = _1544 + _1532;
    int _1548 = _1546 + 1;
    int _1550 = _843 * _1470;
    int _1552 = _1550 + _939;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1556 = _1554 != 0;
    float _1558 = trunc(_1424);
    int _1560 = int(_1558);
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1564 = _1562 != 0;
    int _1566 = _1452 * _1528;
    int _1568 = _1566 + _969;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1576 = _1574 != 0;
    bool _1578 = !_1556;
    int _1580 = _1578 ? 0 : 1;
    int _1582 = _1406 * _1538;
    int _1584 = _1582 + _997;
    bool _1586 = !_1564;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = trunc(_1356);
    int _1592 = int(_1590);
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1596 = _1594 != 0;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1600 = _1598 != 0;
    bool _1602 = !_1576;
    int _1604 = _1602 ? 0 : 1;
    bool _1606 = !_1572;
    int _1608 = _1606 ? 0 : 1;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1616 = _1614 != 0;
    float _1618 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _1620 = int(_1618);
    bool _1622 = !_1600;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = ~_1474;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    int _1632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1048576;
    bool _1634 = _1632 != 0;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2097152;
    bool _1638 = _1636 != 0;
    bool _1640 = _843 == 0;
    bool _1642 = _899 == 0;
    bool _1644 = !_1640;
    int _1646 = _1644 ? _1552 : (-1);
    int _1648 = ~_1592;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    bool _1654 = !_1642;
    int _1656 = _1654 ? _1508 : (-1);
    int _1658 = _1630 * _1646;
    int _1660 = _843 + (-1);
    bool _1662 = !_1638;
    int _1664 = _1662 ? 0 : 1;
    int _1666 = _1652 * _1656;
    bool _1668 = _929 == 0;
    int _1670 = _1474 * _1660;
    int _1672 = _1670 + _1658;
    int _1674 = _899 + (-1);
    int _1676 = _919 * _1548;
    int _1678 = _1676 + _977;
    int _1680 = ~_1494;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    bool _1686 = !_1668;
    int _1688 = _1686 ? _1516 : (-1);
    int _1690 = _1592 * _1674;
    int _1692 = _1690 + _1666;
    int _1694 = abs(_1604);
    int _1696 = abs(_1624);
    int _1698 = _1684 * _1688;
    int _1700 = abs(_1608);
    int _1702 = _1672 * _1694;
    int _1704 = _929 + (-1);
    int _1706 = _1692 * _1696;
    bool _1708 = !_1596;
    int _1710 = _1708 ? 0 : 1;
    int _1712 = _1494 * _1704;
    int _1714 = _1712 + _1698;
    int _1716 = abs(_1580);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1720 = _791 + _1718;
    int _1722 = abs(_1664);
    int _1724 = _1522 * _1700;
    int _1726 = _1724 + _1702;
    int _1728 = abs(_1710);
    float _1730 = trunc(_1398);
    int _1732 = int(_1730);
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4194304;
    bool _1736 = _1734 != 0;
    int _1738 = _1714 * _1722;
    bool _1740 = !_1634;
    int _1742 = _1740 ? 0 : 1;
    int _1744 = _1536 * _1728;
    int _1746 = _1744 + _1706;
    bool _1748 = !_1612;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = _1542 * _1716;
    int _1754 = _1752 + _1726;
    bool _1756 = !_1736;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8388608;
    bool _1762 = _1760 != 0;
    int _1764 = abs(_1742);
    float _1766 = trunc(_1428);
    int _1768 = int(_1766);
    int _1770 = abs(_1750);
    int _1772 = abs(_1588);
    int _1774 = _1732 * _1764;
    int _1776 = _1774 + _1738;
    bool _1778 = !_1762;
    int _1780 = _1778 ? 0 : 1;
    int _1782 = _1568 * _1770;
    int _1784 = _1782 + _1746;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 131072;
    bool _1788 = _1786 != 0;
    int _1790 = _1344 * _1772;
    int _1792 = _1790 + _1754;
    float _1794 = float(uint(_1542));
    float _1796 = trunc(_1440);
    int _1798 = int(_1796);
    bool _1800 = !_1788;
    int _1802 = _1800 ? 0 : 1;
    bool _1804 = !_1616;
    int _1806 = _1804 ? 0 : 1;
    int _1808 = abs(_1802);
    float _1810 = as_type<float>(_999) * _1794;
    float _1812 = float(uint(_1792));
    int _1814 = abs(_1806);
    int _1816 = _1768 * _1808;
    int _1818 = _1816 + _977;
    int _1820 = abs(_1758);
    float _1822 = as_type<float>(_999) * _1812;
    float _1824 = float(uint(_1568));
    int _1826 = _1452 * _1814;
    int _1828 = _1826 + _1784;
    int _1830 = abs(_1780);
    float _1832 = trunc(_1810);
    float _1834 = precise::max(_1832, 0.0);
    uint _1836 = uint(_1834);
    float _1838 = as_type<float>(_979) * _1824;
    float _1840 = float(uint(_1828));
    float _1842 = float(uint(_1584));
    int _1844 = _1584 * _1820;
    int _1846 = _1844 + _1776;
    float _1848 = trunc(_1822);
    float _1850 = precise::max(_1848, 0.0);
    uint _1852 = uint(_1850);
    float _1854 = as_type<float>(_979) * _1840;
    int _1856 = ~_843;
    int _1858 = _1856 + 1;
    float _1860 = as_type<float>(_1019) * _1842;
    int _1862 = ~_843;
    int _1864 = _1862 + 1;
    int _1866 = _1406 * _1830;
    int _1868 = _1866 + _1846;
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16777216;
    bool _1872 = _1870 != 0;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 33554432;
    bool _1876 = _1874 != 0;
    float _1878 = trunc(_1854);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 67108864;
    bool _1886 = _1884 != 0;
    int _1888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 134217728;
    bool _1890 = _1888 != 0;
    int _1892 = ~_899;
    int _1894 = _1892 + 1;
    int _1896 = _1858 * int(_1836);
    int _1898 = _1896 + _1542;
    float _1900 = float(uint(_1868));
    float _1902 = trunc(_1838);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = _1864 * int(_1852);
    int _1910 = _1908 + _1792;
    bool _1912 = !_1886;
    int _1914 = _1912 ? 0 : 1;
    bool _1916 = _1392 != 0;
    float _1918 = float(uint(_1910));
    float _1920 = float(uint(_1898));
    int _1922 = _1894 * int(_1882);
    int _1924 = _1922 + _1828;
    float _1926 = as_type<float>(_1019) * _1900;
    int _1928 = ~_899;
    int _1930 = _1928 + 1;
    float _1932 = as_type<float>(_999) * _1918;
    bool _1934 = !_1872;
    int _1936 = _1934 ? 0 : 1;
    float _1938 = trunc(_1860);
    float _1940 = precise::max(_1938, 0.0);
    uint _1942 = uint(_1940);
    bool _1944 = _919 == 0;
    int _1946 = _1930 * int(_1906);
    int _1948 = _1946 + _1568;
    int _1950 = ~_1798;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = as_type<float>(_999) * _1920;
    int _1958 = _919 + (-1);
    float _1960 = float(uint(_1948));
    float _1962 = trunc(_1926);
    float _1964 = precise::max(_1962, 0.0);
    uint _1966 = uint(_1964);
    float _1968 = float(uint(_1924));
    bool _1970 = !_1944;
    int _1972 = _1970 ? _1678 : (-1);
    float _1974 = as_type<float>(_979) * _1960;
    int _1976 = ~_929;
    int _1978 = _1976 + 1;
    float _1980 = as_type<float>(_979) * _1968;
    bool _1982 = !_1876;
    int _1984 = _1982 ? 0 : 1;
    float _1986 = trunc(_1932);
    float _1988 = precise::max(_1986, 0.0);
    uint _1990 = uint(_1988);
    int _1992 = _1954 * _1972;
    int _1994 = ~_929;
    int _1996 = _1994 + 1;
    bool _1998 = _843 == 0;
    int _2000 = _1798 * _1958;
    int _2002 = _2000 + _1992;
    float _2004 = trunc(_1980);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    int _2010 = abs(_1984);
    int _2012 = _1978 * int(_1942);
    int _2014 = _2012 + _1584;
    int _2016 = abs(_1936);
    int _2018 = _1996 * int(_1966);
    int _2020 = _2018 + _1868;
    int _2022 = int(_1852) + int(_1990);
    float _2024 = trunc(_1956);
    float _2026 = precise::max(_2024, 0.0);
    uint _2028 = uint(_2026);
    int _2030 = ~_843;
    int _2032 = _2030 + 1;
    int _2034 = _2002 * _2010;
    float _2036 = float(uint(_2014));
    float _2038 = float(uint(_2020));
    int _2040 = _2032 * _2022;
    int _2042 = _2040 + _1792;
    float _2044 = trunc(_1974);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = as_type<float>(_1019) * _2036;
    float _2052 = as_type<float>(_1019) * _2038;
    bool _2054 = !_1890;
    int _2056 = _2054 ? 0 : 1;
    int _2058 = _1560 * _2016;
    int _2060 = _2058 + _2034;
    bool _2062 = uint(_2042) >= uint(_843);
    int _2064 = int(_1882) + int(_2008);
    float _2066 = trunc(_2052);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    int _2072 = abs(_1914);
    int _2074 = abs(_2056);
    bool _2076 = !_2062;
    int _2078 = _2076 ? 0 : (-1);
    int _2080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2082 = _2080 != 0;
    int _2084 = ~_2022;
    int _2086 = _2084 + _2078;
    int _2088 = _2086 + 1;
    int _2090 = _1818 * _2072;
    int _2092 = _2090 + _2060;
    int _2094 = int(_1906) + int(_2048);
    int _2096 = ~_899;
    int _2098 = _2096 + 1;
    int _2100 = _843 * _2088;
    int _2102 = _2100 + _1792;
    int _2104 = int(_1836) + int(_2028);
    int _2106 = _1768 * _2074;
    int _2108 = _2106 + _2092;
    int _2110 = ~_843;
    int _2112 = _2110 + 1;
    int _2114 = _2098 * _2064;
    int _2116 = _2114 + _1828;
    bool _2118 = !_1998;
    int _2120 = _2118 ? _2102 : (-1);
    float _2122 = as_type<float>(_2088);
    float _2124 = as_type<float>(_2094);
    bool _2126 = _1944;
    if (!_2082)
    {
        _2122 = _225;
    }
    float _2128 = _2122;
    int _2130 = _2112 * _2104;
    int _2132 = _2130 + _1542;
    float _2134 = _2128;
    if (_2082)
    {
        float _2136 = -_225;
        float _2138 = _1916 ? _2136 : _225;
        _2134 = _2138;
    }
    float _2140 = _2134;
    int _2142 = _2120 & 3;
    bool _2144 = _2142 != 0;
    bool _2146 = uint(_2116) >= uint(_899);
    float _2148 = float(uint(_1818));
    int _2150 = _2144 ? 0 : 1;
    float _2152 = float(uint(_2108));
    float _2154 = as_type<float>(_1023) * _2148;
    bool _2156 = _2142 != 3;
    bool _2158 = uint(_2142) >= 2u;
    float _2160 = as_type<float>(_1023) * _2152;
    bool _2162 = !_2146;
    int _2164 = _2162 ? 0 : (-1);
    float _2166 = trunc(_2154);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    int _2172 = int(_1966) + int(_2070);
    int _2174 = ~_929;
    int _2176 = _2174 + 1;
    int _2178 = _2158 ? 0 : 1;
    int _2180 = ~_2064;
    int _2182 = _2180 + _2164;
    int _2184 = _2182 + 1;
    float _2186 = trunc(_2160);
    float _2188 = precise::max(_2186, 0.0);
    uint _2190 = uint(_2188);
    bool _2192 = uint(_2132) >= uint(_843);
    int _2194 = _2176 * _2172;
    int _2196 = _2194 + _1868;
    bool _2198 = uint(_2142) > 1u;
    int _2200 = _899 * _2184;
    int _2202 = _2200 + _1828;
    int _2204 = ~_2178;
    int _2206 = _2204 + 1;
    int _2208 = _2206 + 1;
    int _2210 = _2208;
    if (_2156)
    {
        int _2212 = ~_2178;
        int _2214 = _2212 + 1;
        _2210 = _2214;
    }
    int _2216 = _2210;
    float _2218 = trunc(_2050);
    float _2220 = precise::max(_2218, 0.0);
    uint _2222 = uint(_2220);
    bool _2224 = uint(_2196) >= uint(_929);
    bool _2226 = !_2192;
    int _2228 = _2226 ? 0 : (-1);
    int _2230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2232 = _2230 != 0;
    bool _2234 = !_1642;
    int _2236 = _2234 ? _2202 : (-1);
    int _2238 = ~_919;
    int _2240 = _2238 + 1;
    bool _2242 = !_2232;
    int _2244 = _2242 ? 0 : 1;
    int _2246 = ~_919;
    int _2248 = _2246 + 1;
    int _2250 = _2240 * int(_2170);
    int _2252 = _2250 + _1818;
    int _2254 = _2236 & 3;
    bool _2256 = _2254 != 0;
    int _2258 = ~_2150;
    int _2260 = _2258 + 1;
    int _2262 = _2260 + 1;
    int _2264 = _2248 * int(_2190);
    int _2266 = _2264 + _2108;
    int _2268 = _2262;
    if (!_2198)
    {
        int _2270 = ~_2150;
        int _2272 = _2270 + 1;
        _2268 = _2272;
    }
    int _2274 = _2268;
    int _2276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2278 = _2276 != 0;
    int _2280 = _2256 ? 0 : 1;
    bool _2282 = uint(_2254) >= 2u;
    float _2284 = float(uint(_2252));
    int _2286 = _2282 ? 0 : 1;
    float _2288 = float(uint(_2266));
    bool _2290 = _2254 != 3;
    float _2292 = as_type<float>(_2150);
    if (_2278)
    {
        float _2294 = in.m_64.x;
        _2292 = _2294;
    }
    float _2296 = _2292;
    bool _2298 = !_2224;
    int _2300 = _2298 ? 0 : (-1);
    int _2302 = ~_899;
    int _2304 = _2302 + 1;
    bool _2306 = uint(_2254) > 1u;
    int _2308 = ~_2172;
    int _2310 = _2308 + _2300;
    int _2312 = _2310 + 1;
    int _2314 = _2304 * _2094;
    int _2316 = _2314 + _1568;
    int _2318 = int(_1942) + int(_2222);
    float _2320 = as_type<float>(_1023) * _2284;
    float _2322 = as_type<float>(_1023) * _2288;
    int _2324 = _929 * _2312;
    int _2326 = _2324 + _1868;
    int _2328 = ~_2286;
    int _2330 = _2328 + 1;
    int _2332 = _2330 + 1;
    float _2334 = trunc(_2320);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = _2332;
    float _2342 = _2322;
    float _2344 = as_type<float>(_2316);
    if (_2290)
    {
        int _2346 = ~_2286;
        int _2348 = _2346 + 1;
        _2340 = _2348;
    }
    int _2350 = _2340;
    bool _2352 = uint(_2316) >= uint(_899);
    bool _2354 = !_1668;
    int _2356 = _2354 ? _2326 : (-1);
    int _2358 = ~_2280;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = trunc(_2322);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    int _2370 = _2362;
    if (!_2306)
    {
        int _2372 = ~_2280;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2380 = _2378 != 0;
    bool _2382 = !_2352;
    int _2384 = _2382 ? 0 : (-1);
    int _2386 = _2356 & 3;
    bool _2388 = _2386 != 0;
    bool _2390 = !_2380;
    int _2392 = _2390 ? 0 : 1;
    if (_2278)
    {
        float _2394 = _2296 * 3.1415927410125732421875;
        _2342 = _2394;
    }
    float _2396 = _2342;
    bool _2398 = uint(_2386) >= 2u;
    int _2400 = ~_919;
    int _2402 = _2400 + 1;
    if (_2278)
    {
        float _2404 = _2396 * 0.15915493667125701904296875;
        _2344 = _2404;
    }
    float _2406 = _2344;
    int _2408 = _2398 ? 0 : 1;
    bool _2410 = uint(_2386) > 1u;
    int _2412 = int(_2190) + int(_2368);
    float _2414 = _2406;
    if (_2278)
    {
        float _2416 = _2406 * 6.283185482025146484375;
        float _2418 = sin(_2416);
        _2414 = _2418;
    }
    float _2420 = _2414;
    int _2422 = _2388 ? 0 : 1;
    bool _2424 = _2386 != 3;
    int _2426 = _2402 * _2412;
    int _2428 = _2426 + _2108;
    int _2430 = ~_2422;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    int _2436 = ~_929;
    int _2438 = _2436 + 1;
    int _2440 = _2434;
    if (!_2410)
    {
        int _2442 = ~_2422;
        int _2444 = _2442 + 1;
        _2440 = _2444;
    }
    int _2446 = _2440;
    bool _2448 = uint(_2428) >= uint(_919);
    int _2450 = _2438 * _2318;
    int _2452 = _2450 + _1584;
    int _2454 = ~_2104;
    int _2456 = _2454 + _2228;
    int _2458 = _2456 + 1;
    bool _2460 = !_2448;
    int _2462 = _2460 ? 0 : (-1);
    int _2464 = ~_2408;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = _843 * _2458;
    int _2472 = _2470 + _1542;
    int _2474 = ~_2412;
    int _2476 = _2474 + _2462;
    int _2478 = _2476 + 1;
    int _2480 = _2468;
    if (_2424)
    {
        int _2482 = ~_2408;
        int _2484 = _2482 + 1;
        _2480 = _2484;
    }
    int _2486 = _2480;
    bool _2488 = uint(_2452) >= uint(_929);
    int _2490 = _919 * _2478;
    int _2492 = _2490 + _2108;
    int _2494 = int(_2170) + int(_2338);
    int _2496 = ~_2094;
    int _2498 = _2496 + _2384;
    int _2500 = _2498 + 1;
    bool _2502 = !_2488;
    int _2504 = _2502 ? 0 : (-1);
    int _2506 = _2402 * _2494;
    int _2508 = _2506 + _1818;
    bool _2510 = _2488;
    if (_2278)
    {
        bool _2512 = _2420 > 0.5;
        _2510 = _2512;
    }
    bool _2514 = _2510;
    int _2516 = _899 * _2500;
    int _2518 = _2516 + _1568;
    bool _2520 = !_1998;
    int _2522 = _2520 ? _2472 : (-1);
    int _2524 = _2120 & 3;
    bool _2526 = _2524 != 0;
    bool _2528 = !_1944;
    int _2530 = _2528 ? _2492 : (-1);
    if (!_2278)
    {
        _2124 = _233;
    }
    float _2532 = _2124;
    float _2534 = _2532;
    if (_2278)
    {
        float _2536 = -_233;
        float _2538 = _2514 ? _2536 : _233;
        _2534 = _2538;
    }
    float _2540 = _2534;
    int _2542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 33554432;
    bool _2544 = _2542 != 0;
    bool _2546 = !_2526;
    int _2548 = _2546 ? 0 : 1;
    int _2550 = _2530 & 3;
    bool _2552 = _2550 != 0;
    bool _2554 = !_1642;
    int _2556 = _2554 ? _2518 : (-1);
    int _2558 = _2236 & 3;
    bool _2560 = _2558 != 0;
    bool _2562 = !_2544;
    int _2564 = _2562 ? 0 : 1;
    bool _2566 = _2550 != 3;
    int _2568 = ~_2318;
    int _2570 = _2568 + _2504;
    int _2572 = _2570 + 1;
    bool _2574 = !_2560;
    int _2576 = _2574 ? 0 : 1;
    bool _2578 = uint(_2550) >= 2u;
    int _2580 = _929 * _2572;
    int _2582 = _2580 + _1584;
    int _2584 = _2578 ? 0 : 1;
    bool _2586 = uint(_2550) > 1u;
    float _2588 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2590 = _2588 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2592 = ~_2584;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = _2596;
    if (_2566)
    {
        int _2600 = ~_2584;
        int _2602 = _2600 + 1;
        _2598 = _2602;
    }
    int _2604 = _2598;
    float _2606 = in.m_46.x;
    float _2608 = in.m_46.y;
    float _2610 = in.m_46.z;
    bool _2612 = !_1668;
    int _2614 = _2612 ? _2582 : (-1);
    float _2616 = 1.0 / _2590;
    int _2618 = _2356 & 3;
    bool _2620 = _2618 != 0;
    int _2622 = _2552 ? 0 : 1;
    bool _2624 = !_2620;
    int _2626 = _2624 ? 0 : 1;
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 67108864;
    bool _2634 = _2632 != 0;
    bool _2636 = _2142 != 3;
    float _2638 = 1.0 / _2630;
    int _2640 = ~_2622;
    int _2642 = _2640 + 1;
    int _2644 = _2642 + 1;
    float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2648 = _2646 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2650 = _2644;
    if (!_2586)
    {
        int _2652 = ~_2622;
        int _2654 = _2652 + 1;
        _2650 = _2654;
    }
    int _2656 = _2650;
    bool _2658 = !_2634;
    int _2660 = _2658 ? 0 : 1;
    float _2662 = _185 * _2608;
    float _2664 = _191 * _2608;
    bool _2666 = !_2636;
    int _2668 = _2666 ? 0 : (-1);
    float _2670 = _197 * _2608;
    bool _2672 = uint(_2508) >= uint(_919);
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2676 = _2674 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2678 = _2254 != 3;
    float _2680 = fma(_195, _2606, _2670);
    bool _2682 = _2386 != 3;
    float _2684 = fma(_183, _2606, _2662);
    bool _2686 = _2550 != 3;
    float _2688 = 1.0 / _2648;
    int _2690 = _2530 & 3;
    bool _2692 = _2690 != 0;
    float _2694 = fma(_189, _2606, _2664);
    float _2696 = fma(_187, _2610, _2684);
    bool _2698 = !_2678;
    int _2700 = _2698 ? 0 : (-1);
    float _2702 = fma(_193, _2610, _2694);
    bool _2704 = !_2682;
    int _2706 = _2704 ? 0 : (-1);
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2712 = !_2686;
    int _2714 = _2712 ? 0 : (-1);
    bool _2716 = !_2692;
    int _2718 = _2716 ? 0 : 1;
    float _2720 = 1.0 / _2710;
    bool _2722 = !_2672;
    int _2724 = _2722 ? 0 : (-1);
    int _2726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2728 = _2726 != 0;
    int _2730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2732 = _2730 != 0;
    int _2734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _2736 = _2734 != 0;
    int _2738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2740 = _2738 != 0;
    int _2742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2744 = _2742 != 0;
    int _2746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2748 = _2746 != 0;
    float _2750 = 1.0 / _2676;
    float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2758 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2756;
    float _2760 = fma(_199, _2610, _2680);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2764 = _2762 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2766 = _2758 * _2638;
    float _2768 = 1.0 / _2754;
    float _2770 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2774;
    float _2778 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2780 = _2778 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2782 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2782;
    float _2786 = _2776 * _2616;
    float _2788 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2790 = _791 + _2788;
    float _2792 = 1.0 / _2764;
    float _2794 = _2780 * _2688;
    float _2796 = _2784 * _2750;
    float _2798 = fma(_2766, _2790, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2802 = _791 + _2800;
    float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2806 = _791 + _2804;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2810 = _791 + _2808;
    float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2814 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2812;
    float _2816 = _2772 * _2768;
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2820 = _2818 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2822 = fma(_2796, _2806, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2824 = _2236 >> 31;
    float _2826 = fma(_2816, _2810, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2828 = _2820 * _2720;
    float _2830 = fma(_2794, _2802, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2832 = _2120 >> 31;
    float _2834 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2836 = _791 + _2834;
    int _2838 = _2356 >> 31;
    float _2840 = _2814 * _2792;
    int _2842 = _2832 & 3;
    float _2844 = fma(_2828, _2836, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2846 = _2824 & 3;
    float _2848 = fma(_2786, _1720, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2850 = _2120 + _2842;
    float _2852 = _2760 + _1210;
    int _2854 = _2838 & 3;
    int _2856 = _2850 >> 2;
    int _2858 = _2530 >> 31;
    int _2860 = _2856 << 4;
    int _2862 = _2860 + 656;
    int _2864 = _2236 + _2846;
    int _2866 = _2858 & 3;
    int _2868 = _2356 + _2854;
    uint _2870 = uint(int(uint(_2862) >> uint(2)));
    uint _2872 = uint(int(uint(int(_2870)) >> uint(2)));
    int _2874 = int(_2870) & 3;
    float _2876 = (*spvDescriptorSet0.vp_c9)._m0[int(_2872)][_2874];
    int _2878 = int(_2870) + 1;
    uint _2880 = uint(int(uint(_2878) >> uint(2)));
    int _2882 = _2878 & 3;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[int(_2880)][_2882];
    bool _2886 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2888 = isnan(_791);
    bool _2890 = _2886 || _2888;
    bool _2892 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2894 = _2890 || _2892;
    float _2896 = float(_2894);
    bool _2898 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2900 = isnan(_791);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2906 = _2902 || _2904;
    float _2908 = float(_2906);
    int _2910 = _2864 >> 2;
    float _2912 = -_2896;
    float _2914 = _2912 + 1.0;
    bool _2916 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2918 = isnan(_791);
    bool _2920 = _2916 || _2918;
    bool _2922 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2924 = _2920 || _2922;
    float _2926 = float(_2924);
    float _2928 = -_2908;
    float _2930 = _2928 + 1.0;
    int _2932 = _2910 << 4;
    int _2934 = _2932 + 800;
    float _2936 = _2908 * _2914;
    int _2938 = _2530 + _2866;
    float _2940 = _2926 * _2930;
    int _2942 = _2868 >> 2;
    float _2944 = -_2926;
    float _2946 = _2944 + 1.0;
    uint _2948 = uint(int(uint(_2934) >> uint(2)));
    uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
    int _2952 = int(_2948) & 3;
    float _2954 = (*spvDescriptorSet0.vp_c9)._m0[int(_2950)][_2952];
    int _2956 = int(_2948) + 1;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    int _2960 = _2956 & 3;
    float _2962 = (*spvDescriptorSet0.vp_c9)._m0[int(_2958)][_2960];
    bool _2964 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2966 = isnan(_791);
    bool _2968 = _2964 || _2966;
    bool _2970 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2972 = _2968 || _2970;
    float _2974 = float(_2972);
    int _2976 = _2938 >> 2;
    float _2978 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2980 = _791 + _2978;
    bool _2982 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2984 = isnan(_791);
    bool _2986 = _2982 || _2984;
    bool _2988 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2990 = _2986 || _2988;
    float _2992 = float(_2990);
    float _2994 = -_2974;
    float _2996 = _2994 + 1.0;
    int _2998 = _2976 << 4;
    int _3000 = _2998 + 1088;
    float _3002 = _2974 * _2946;
    int _3004 = _2942 << 4;
    int _3006 = _3004 + 944;
    float _3008 = _1222 * _2996;
    uint _3010 = uint(int(uint(_3000) >> uint(2)));
    uint _3012 = uint(int(uint(int(_3010)) >> uint(2)));
    int _3014 = int(_3010) & 3;
    float _3016 = (*spvDescriptorSet0.vp_c9)._m0[int(_3012)][_3014];
    int _3018 = int(_3010) + 1;
    uint _3020 = uint(int(uint(_3018) >> uint(2)));
    int _3022 = _3018 & 3;
    float _3024 = (*spvDescriptorSet0.vp_c9)._m0[int(_3020)][_3022];
    float _3026 = _2992 * _1248;
    float _3028 = -_2992;
    float _3030 = _3028 + 1.0;
    float _3032 = fma(_2840, _2980, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3034 = _2702 + _1196;
    bool _3036 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3038 = isnan(_791);
    bool _3040 = _3036 || _3038;
    bool _3042 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3044 = _3040 || _3042;
    float _3046 = float(_3044);
    float _3048 = _1236 * _3030;
    float _3050 = -_1236;
    float _3052 = _3050 + 1.0;
    uint _3054 = uint(int(uint(_3006) >> uint(2)));
    uint _3056 = uint(int(uint(int(_3054)) >> uint(2)));
    int _3058 = int(_3054) & 3;
    float _3060 = (*spvDescriptorSet0.vp_c9)._m0[int(_3056)][_3058];
    int _3062 = int(_3054) + 1;
    uint _3064 = uint(int(uint(_3062) >> uint(2)));
    int _3066 = _3062 & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = abs(_2274);
    float _3072 = _2696 + _1238;
    float _3074 = _3046 * _3052;
    int _3076 = abs(_2376);
    float _3078 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3080 = int(_3078);
    float _3082 = _2798 * _3074;
    int _3084 = _2862 + 8;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    uint _3088 = uint(int(uint(int(_3086)) >> uint(2)));
    int _3090 = int(_3086) & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    int _3094 = int(_3086) + 1;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    int _3098 = _3094 & 3;
    float _3100 = (*spvDescriptorSet0.vp_c9)._m0[int(_3096)][_3098];
    int _3102 = ~_2494;
    int _3104 = _3102 + _2724;
    int _3106 = _3104 + 1;
    float _3108 = -_3046;
    float _3110 = _3108 + 1.0;
    int _3112 = abs(_2446);
    int _3114 = ~_3070;
    int _3116 = _3114 + 1;
    int _3118 = _3116 + 1;
    int _3120 = _919 * _3106;
    int _3122 = _3120 + _1818;
    int _3124 = abs(_2548);
    int _3126 = _3006 + 8;
    uint _3128 = uint(int(uint(_3126) >> uint(2)));
    uint _3130 = uint(int(uint(int(_3128)) >> uint(2)));
    int _3132 = int(_3128) & 3;
    float _3134 = (*spvDescriptorSet0.vp_c9)._m0[int(_3130)][_3132];
    int _3136 = int(_3128) + 1;
    uint _3138 = uint(int(uint(_3136) >> uint(2)));
    int _3140 = _3136 & 3;
    float _3142 = (*spvDescriptorSet0.vp_c9)._m0[int(_3138)][_3140];
    int _3144 = ~_3076;
    int _3146 = _3144 + 1;
    int _3148 = _3146 + 1;
    int _3150 = _3118 * as_type<int>(_2884);
    int _3152 = abs(_2656);
    float _3154 = trunc((*spvDescriptorSet0.vp_c9)._m0[100].z);
    int _3156 = int(_3154);
    int _3158 = abs(_2576);
    float _3160 = fma(_3110, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3082);
    int _3162 = _2934 + 8;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    uint _3166 = uint(int(uint(int(_3164)) >> uint(2)));
    int _3168 = int(_3164) & 3;
    float _3170 = (*spvDescriptorSet0.vp_c9)._m0[int(_3166)][_3168];
    int _3172 = int(_3164) + 1;
    uint _3174 = uint(int(uint(_3172) >> uint(2)));
    int _3176 = _3172 & 3;
    float _3178 = (*spvDescriptorSet0.vp_c9)._m0[int(_3174)][_3176];
    int _3180 = ~_3158;
    int _3182 = _3180 + 1;
    int _3184 = _3182 + 1;
    float _3186 = fma(_2826, _3048, _3160);
    int _3188 = ~_3112;
    int _3190 = _3188 + 1;
    int _3192 = _3190 + 1;
    float _3194 = trunc((*spvDescriptorSet0.vp_c9)._m0[105].z);
    int _3196 = int(_3194);
    int _3198 = _3148 * as_type<int>(_2962);
    int _3200 = ~_3152;
    int _3202 = _3200 + 1;
    int _3204 = _3202 + 1;
    float _3206 = fma(_2848, _3026, _3186);
    int _3208 = _3000 + 8;
    uint _3210 = uint(int(uint(_3208) >> uint(2)));
    uint _3212 = uint(int(uint(int(_3210)) >> uint(2)));
    int _3214 = int(_3210) & 3;
    float _3216 = (*spvDescriptorSet0.vp_c9)._m0[int(_3212)][_3214];
    int _3218 = int(_3210) + 1;
    uint _3220 = uint(int(uint(_3218) >> uint(2)));
    int _3222 = _3218 & 3;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[int(_3220)][_3222];
    int _3226 = _3184 * as_type<int>(_2954);
    int _3228 = _3226 + _3198;
    int _3230 = abs(_2718);
    float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3234 = _3072 + _3232;
    int _3236 = abs(_2486);
    float _3238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3240 = log2(_3238);
    int _3242 = ~_3124;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    float _3248 = as_type<float>(_2486);
    bool _3250 = _2728;
    if (_2736)
    {
        float _3252 = in.m_64.x;
        _3248 = _3252;
    }
    float _3254 = _3248;
    int _3256 = ~_3230;
    int _3258 = _3256 + 1;
    int _3260 = _3258 + 1;
    int _3262 = _3204 * as_type<int>(_3024);
    int _3264 = abs(_2668);
    int _3266 = _3246 * as_type<int>(_2876);
    int _3268 = _3266 + _3150;
    int _3270 = abs(_2626);
    int _3272 = _3260 * as_type<int>(_3016);
    int _3274 = _3272 + _3262;
    float _3276 = float(uint(_3080));
    int _3278 = abs(_2216);
    int _3280 = _3192 * as_type<int>(_3068);
    int _3282 = abs(_2604);
    float _3284 = 1.0 / _3276;
    int _3286 = ~_3270;
    int _3288 = _3286 + 1;
    int _3290 = _3288 + 1;
    float _3292 = as_type<float>(_2604);
    if (_2732)
    {
        float _3294 = in.m_64.w;
        _3292 = _3294;
    }
    float _3296 = _3292;
    int _3298 = ~_3278;
    int _3300 = _3298 + 1;
    int _3302 = _3300 + 1;
    float _3304 = _3240 * _153;
    int _3306 = ~_3236;
    int _3308 = _3306 + 1;
    int _3310 = _3308 + 1;
    int _3312 = _3290 * as_type<int>(_3060);
    int _3314 = _3312 + _3280;
    int _3316 = abs(_2706);
    int _3318 = _3302 * as_type<int>(_3092);
    int _3320 = _3318 + _3268;
    float _3322 = _3276;
    float _3324 = _3142;
    if (_2728)
    {
        float _3326 = in.m_64.z;
        _3322 = _3326;
    }
    float _3328 = _3322;
    int _3330 = abs(_2350);
    float _3332 = exp2(_3304);
    int _3334 = ~_3264;
    int _3336 = _3334 + 1;
    int _3338 = _3336 + 1;
    int _3340 = _3310 * as_type<int>(_3134);
    int _3342 = _3340 + _3314;
    int _3344 = ~_3316;
    int _3346 = _3344 + 1;
    int _3348 = _3346 + 1;
    int _3350 = ~_3330;
    int _3352 = _3350 + 1;
    int _3354 = _3352 + 1;
    int _3356 = _3338 * as_type<int>(_3100);
    int _3358 = _3356 + _3320;
    int _3360 = abs(_2700);
    int _3362 = _3348 * as_type<int>(_3142);
    int _3364 = _3362 + _3342;
    float _3366 = float(uint(_1620));
    float _3368 = as_type<float>(_3348);
    float _3370 = as_type<float>(_3338);
    if (_2736)
    {
        float _3372 = _3254 * 3.1415927410125732421875;
        _3368 = _3372;
    }
    float _3374 = _3368;
    int _3376 = abs(_2244);
    int _3378 = _3354 * as_type<int>(_3170);
    int _3380 = _3378 + _3228;
    int _3382 = ~_3360;
    int _3384 = _3382 + 1;
    int _3386 = _3384 + 1;
    int _3388 = abs(_2392);
    float _3390 = 1.0 / _3366;
    int _3392 = abs(_2564);
    int _3394 = _3386 * as_type<int>(_3178);
    int _3396 = _3394 + _3380;
    int _3398 = abs(_2714);
    float _3400 = _3296;
    float _3402 = as_type<float>(_3380);
    if (_2732)
    {
        float _3404 = _3296 * 3.1415927410125732421875;
        _3400 = _3404;
    }
    float _3406 = _3400;
    float _3408 = _3328;
    if (_2728)
    {
        float _3410 = _3328 * 3.1415927410125732421875;
        _3408 = _3410;
    }
    float _3412 = _3408;
    int _3414 = ~_3282;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    if (_2732)
    {
        float _3420 = _3406 * 0.15915493667125701904296875;
        _3370 = _3420;
    }
    float _3422 = _3370;
    if (_2736)
    {
        float _3424 = _3374 * 0.15915493667125701904296875;
        _3402 = _3424;
    }
    float _3426 = _3402;
    int _3428 = ~_3376;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    int _3434 = _3418 * as_type<int>(_3216);
    int _3436 = _3434 + _3274;
    int _3438 = ~_3398;
    int _3440 = _3438 + 1;
    int _3442 = _3440 + 1;
    if (_2728)
    {
        float _3444 = _3412 * 0.15915493667125701904296875;
        _3324 = _3444;
    }
    float _3446 = _3324;
    float _3448 = float(uint(_3156));
    int _3450 = _3432 * _3358;
    int _3452 = ~_3392;
    int _3454 = _3452 + 1;
    int _3456 = _3454 + 1;
    int _3458 = _3442 * as_type<int>(_3224);
    int _3460 = _3458 + _3436;
    int _3462 = ~_3388;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    int _3468 = _2522 * _3376;
    int _3470 = _3468 + _3450;
    float _3472 = 1.0 / _3448;
    int _3474 = abs(_1620);
    int _3476 = _3456 * _3364;
    float _3478 = float(uint(_3196));
    int _3480 = _3466 * _3396;
    int _3482 = as_type<int>(_3390) + (-2);
    int _3484 = _2614 * _3392;
    int _3486 = _3484 + _3476;
    float _3488 = float(uint(_3470));
    float _3490 = _3446;
    if (_2728)
    {
        float _3492 = _3446 * 6.283185482025146484375;
        float _3494 = sin(_3492);
        _3490 = _3494;
    }
    float _3496 = _3490;
    float _3498 = float(uint(_3474));
    int _3500 = _2556 * _3388;
    int _3502 = _3500 + _3480;
    int _3504 = abs(_2660);
    float _3506 = as_type<float>(_3482) * _3488;
    bool _3508 = !_1944;
    int _3510 = _3508 ? _3122 : (-1);
    float _3512 = _1110 * 2.0;
    int _3514 = ~_3504;
    int _3516 = _3514 + 1;
    int _3518 = _3516 + 1;
    float _3520 = 1.0 / _3478;
    int _3522 = abs(_3080);
    float _3524 = -_3332;
    float _3526 = _3524 + 1.0;
    int _3528 = abs(_3196);
    int _3530 = _3518 * _3460;
    int _3532 = as_type<int>(_3472) + (-2);
    float _3534 = float(uint(_3486));
    float _3536 = 1.0 / _3498;
    float _3538 = float(uint(_3522));
    int _3540 = _3510 * _3504;
    int _3542 = _3540 + _3530;
    int _3544 = abs(_3156);
    float _3546 = as_type<float>(_3532) * _3534;
    int _3548 = ~_1620;
    int _3550 = _3548 + 1;
    float _3552 = trunc(_3506);
    float _3554 = precise::max(_3552, 0.0);
    uint _3556 = uint(_3554);
    float _3558 = as_type<float>(_3530);
    if (_2728)
    {
        bool _3560 = _3496 > 0.5;
        _2126 = _3560;
    }
    bool _3562 = _2126;
    float _3564 = float(uint(_3544));
    int _3566 = as_type<int>(_3520) + (-2);
    float _3568 = float(uint(_3542));
    float _3570 = _3422;
    bool _3572 = _3562;
    if (_2732)
    {
        float _3574 = _3422 * 6.283185482025146484375;
        float _3576 = sin(_3574);
        _3570 = _3576;
    }
    float _3578 = _3570;
    float _3580 = float(uint(_3528));
    int _3582 = abs(_3470);
    int _3584 = as_type<int>(_3284) + (-2);
    float _3586 = 1.0 / _3538;
    float _3588 = float(uint(_3502));
    int _3590 = _3550 * int(_3556);
    int _3592 = _3590 + _3470;
    int _3594 = as_type<int>(_3536) + (-2);
    float _3596 = as_type<float>(_3566) * _3568;
    float _3598 = as_type<float>(_3584) * _3588;
    int _3600 = abs(_3502);
    float _3602 = as_type<float>(_3442);
    if (_2736)
    {
        float _3604 = _3426 * 6.283185482025146484375;
        float _3606 = sin(_3604);
        _3602 = _3606;
    }
    float _3608 = _3602;
    float _3610 = float(uint(_3582));
    if (!_2728)
    {
        _3558 = _225;
    }
    float _3612 = _3558;
    float _3614 = _3612;
    if (_2728)
    {
        float _3616 = -_225;
        float _3618 = _3562 ? _3616 : _225;
        _3614 = _3618;
    }
    float _3620 = _3614;
    if (_2732)
    {
        bool _3622 = _3578 > 0.5;
        _3572 = _3622;
    }
    bool _3624 = _3572;
    float _3626 = 1.0 / _3564;
    float _3628 = float(uint(_3592));
    int _3630 = as_type<int>(_3586) + (-2);
    float _3632 = as_type<float>(_3482) * _3628;
    float _3634 = float(uint(_3600));
    float _3636 = 1.0 / _3580;
    if (_2736)
    {
        bool _3638 = _3608 > 0.5;
        _3250 = _3638;
    }
    bool _3640 = _3250;
    int _3642 = abs(_3542);
    float _3644 = as_type<float>(_3630) * _3634;
    int _3646 = ~_3080;
    int _3648 = _3646 + 1;
    int _3650 = ~_3156;
    int _3652 = _3650 + 1;
    float _3654 = trunc(_3598);
    float _3656 = precise::max(_3654, 0.0);
    uint _3658 = uint(_3656);
    int _3660 = as_type<int>(_3626) + (-2);
    float _3662 = float(uint(_3642));
    int _3664 = ~_3196;
    int _3666 = _3664 + 1;
    int _3668 = ~_3474;
    int _3670 = _3668 + 1;
    float _3672 = trunc(_3546);
    float _3674 = precise::max(_3672, 0.0);
    uint _3676 = uint(_3674);
    int _3678 = as_type<int>(_3636) + (-2);
    int _3680 = ~_3528;
    int _3682 = _3680 + 1;
    float _3684 = as_type<float>(_3678) * _3662;
    float _3686 = floor(_3512);
    float _3688 = as_type<float>(_3594) * _3610;
    int _3690 = abs(_3486);
    int _3692 = _3648 * int(_3658);
    int _3694 = _3692 + _3502;
    float _3696 = trunc(_3596);
    float _3698 = precise::max(_3696, 0.0);
    uint _3700 = uint(_3698);
    int _3702 = _3652 * int(_3676);
    int _3704 = _3702 + _3486;
    float _3706 = float(uint(_3690));
    float _3708 = float(uint(_3694));
    float _3710 = float(uint(_3704));
    float _3712 = as_type<float>(_3660) * _3706;
    float _3714 = _3706;
    float _3716 = _3686;
    if (!_2736)
    {
        _3714 = _225;
    }
    float _3718 = _3714;
    float _3720 = trunc(_3688);
    float _3722 = precise::max(_3720, 0.0);
    uint _3724 = uint(_3722);
    float _3726 = _3718;
    if (_2736)
    {
        float _3728 = -_225;
        float _3730 = _3640 ? _3728 : _225;
        _3726 = _3730;
    }
    float _3732 = _3726;
    float _3734 = as_type<float>(_3584) * _3708;
    bool _3736 = _1120 > 0.5;
    float _3738 = as_type<float>(_3532) * _3710;
    bool _3740 = _1122 > 0.5;
    float _3742 = -_233;
    int _3744 = _3736 ? as_type<int>(_3742) : as_type<int>(_233);
    int _3746 = _3666 * int(_3700);
    int _3748 = _3746 + _3542;
    bool _3750 = _3686 >= 0.0;
    bool _3752 = isnan(_3686);
    bool _3754 = _3750 || _3752;
    bool _3756 = isnan(0.0);
    bool _3758 = _3754 || _3756;
    float _3760 = trunc(_3632);
    float _3762 = precise::max(_3760, 0.0);
    uint _3764 = uint(_3762);
    int _3766 = ~_3522;
    int _3768 = _3766 + 1;
    int _3770 = _3758 ? 0 : 1;
    bool _3772 = _3686 > 0.0;
    float _3774 = float(uint(_3748));
    float _3776 = trunc(_3712);
    float _3778 = precise::max(_3776, 0.0);
    uint _3780 = uint(_3778);
    int _3782 = _3670 * int(_3724);
    int _3784 = _3782 + _3582;
    int _3786 = ~_3770;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    float _3792 = -_225;
    int _3794 = _3740 ? as_type<int>(_3792) : as_type<int>(_225);
    float _3796 = float(uint(_3784));
    float _3798 = trunc(_3644);
    float _3800 = precise::max(_3798, 0.0);
    uint _3802 = uint(_3800);
    bool _3804 = _1124 != 1;
    int _3806 = _3790;
    if (!_3772)
    {
        int _3808 = ~_3770;
        int _3810 = _3808 + 1;
        _3806 = _3810;
    }
    int _3812 = _3806;
    float _3814 = as_type<float>(_3566) * _3774;
    float _3816 = as_type<float>(_3594) * _3796;
    int _3818 = ~_3544;
    int _3820 = _3818 + 1;
    float _3822 = trunc(_3684);
    float _3824 = precise::max(_3822, 0.0);
    uint _3826 = uint(_3824);
    int _3828 = int(_3556) + int(_3764);
    bool _3830 = !_2748;
    float _3832 = _3830 ? _233 : as_type<float>(_3744);
    float _3834 = trunc(_3734);
    float _3836 = precise::max(_3834, 0.0);
    uint _3838 = uint(_3836);
    int _3840 = _3820 * int(_3780);
    int _3842 = _3840 + _3690;
    int _3844 = _3768 * int(_3802);
    int _3846 = _3844 + _3600;
    int _3848 = ~_1620;
    int _3850 = _3848 + 1;
    float _3852 = float(uint(_3842));
    float _3854 = trunc(_3738);
    float _3856 = precise::max(_3854, 0.0);
    uint _3858 = uint(_3856);
    int _3860 = _3682 * int(_3826);
    int _3862 = _3860 + _3642;
    float _3864 = float(uint(_3846));
    float _3866 = as_type<float>(_3660) * _3852;
    int _3868 = ~_3080;
    int _3870 = _3868 + 1;
    float _3872 = float(uint(_3862));
    float _3874 = trunc(_3814);
    float _3876 = precise::max(_3874, 0.0);
    uint _3878 = uint(_3876);
    int _3880 = int(_3658) + int(_3838);
    float _3882 = as_type<float>(_3630) * _3864;
    float _3884 = as_type<float>(_3678) * _3872;
    if (_1202)
    {
        _3716 = _1110;
    }
    float _3886 = _3716;
    int _3888 = _3870 * _3880;
    int _3890 = _3888 + _3502;
    float _3892 = _3886;
    if (!_1202)
    {
        _3892 = _1120;
    }
    float _3894 = _3892;
    float _3896 = trunc(_3816);
    float _3898 = precise::max(_3896, 0.0);
    uint _3900 = uint(_3898);
    int _3902 = int(_3676) + int(_3858);
    int _3904 = _3850 * _3828;
    int _3906 = _3904 + _3470;
    int _3908 = ~_3544;
    int _3910 = _3908 + 1;
    float _3912 = trunc(_3866);
    float _3914 = precise::max(_3912, 0.0);
    uint _3916 = uint(_3914);
    int _3918 = int(_3700) + int(_3878);
    float _3920 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    bool _3922 = !_3804;
    float _3924 = _3922 ? as_type<float>(_1126) : as_type<float>(_1128);
    float _3926 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3928 = !_2744;
    float _3930 = _3928 ? _225 : as_type<float>(_3794);
    int _3932 = ~_3196;
    int _3934 = _3932 + 1;
    float _3936 = trunc(_3882);
    float _3938 = precise::max(_3936, 0.0);
    uint _3940 = uint(_3938);
    int _3942 = int(_3724) + int(_3900);
    bool _3944 = !_3804;
    float _3946 = _3944 ? as_type<float>(_1130) : as_type<float>(_1126);
    bool _3948 = uint(_3890) >= uint(_3080);
    bool _3950 = uint(_3906) >= uint(_1620);
    float _3952 = trunc(_3884);
    float _3954 = precise::max(_3952, 0.0);
    uint _3956 = uint(_3954);
    int _3958 = ~_3156;
    int _3960 = _3958 + 1;
    int _3962 = int(_3780) + int(_3916);
    int _3964 = _3960 * _3902;
    int _3966 = _3964 + _3486;
    int _3968 = ~_3528;
    int _3970 = _3968 + 1;
    int _3972 = _3910 * _3962;
    int _3974 = _3972 + _3690;
    bool _3976 = !_3950;
    int _3978 = _3976 ? 0 : (-1);
    int _3980 = _3934 * _3918;
    int _3982 = _3980 + _3542;
    bool _3984 = uint(_3966) >= uint(_3156);
    int _3986 = ~_3474;
    int _3988 = _3986 + 1;
    int _3990 = int(_3802) + int(_3940);
    float _3992 = _1224 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _3994 = int(_3826) + int(_3956);
    int _3996 = _3988 * _3942;
    int _3998 = _3996 + _3582;
    float _4000 = as_type<float>(_3906);
    if (_1202)
    {
        _4000 = _1122;
    }
    float _4002 = _4000;
    int _4004 = ~_3522;
    int _4006 = _4004 + 1;
    int _4008 = _3970 * _3994;
    int _4010 = _4008 + _3642;
    bool _4012 = uint(_3998) >= uint(_3474);
    bool _4014 = !_1202;
    float _4016 = _4014 ? as_type<float>(_1130) : as_type<float>(_1128);
    float _4018 = as_type<float>(_3474);
    float _4020 = _4002;
    if (_2740)
    {
        float _4022 = in.m_64.y;
        _4018 = _4022;
    }
    float _4024 = _4018;
    bool _4026 = !_1202;
    float _4028 = _4026 ? as_type<float>(_1128) : as_type<float>(_1126);
    int _4030 = _4006 * _3990;
    int _4032 = _4030 + _3600;
    if (!_1202)
    {
        _4020 = _1110;
    }
    float _4034 = _4020;
    bool _4036 = uint(_3982) >= uint(_3196);
    int _4038 = ~_3828;
    int _4040 = _4038 + _3978;
    int _4042 = _4040 + 1;
    float _4044 = _4034 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _4046 = !_3984;
    int _4048 = _4046 ? 0 : (-1);
    bool _4050 = !_4036;
    int _4052 = _4050 ? 0 : (-1);
    float _4054 = fma(_4044, -2.0, _3926);
    bool _4056 = !_3948;
    int _4058 = _4056 ? 0 : (-1);
    bool _4060 = uint(_3974) >= uint(_3544);
    int _4062 = _1620 * _4042;
    int _4064 = _4062 + _3470;
    bool _4066 = uint(_4010) >= uint(_3528);
    float _4068 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4054);
    int _4070 = _3470 ^ _1620;
    float _4072 = _1122 * 2.0;
    bool _4074 = uint(_4032) >= uint(_3522);
    int _4076 = _3502 ^ _3080;
    float _4078 = _4024;
    if (_2740)
    {
        float _4080 = _4024 * 3.1415927410125732421875;
        _4078 = _4080;
    }
    float _4082 = _4078;
    int _4084 = ~_3880;
    int _4086 = _4084 + _4058;
    int _4088 = _4086 + 1;
    float _4090 = floor(_4072);
    bool _4092 = !_4074;
    int _4094 = _4092 ? 0 : (-1);
    float _4096 = _4082;
    if (_2740)
    {
        float _4098 = _4082 * 0.15915493667125701904296875;
        _4096 = _4098;
    }
    float _4100 = _4096;
    uint _4102 = uint(int(uint(_4076) >> uint(31)));
    int _4104 = _3080 * _4088;
    int _4106 = _4104 + _3502;
    bool _4108 = !_4012;
    int _4110 = _4108 ? 0 : (-1);
    int _4112 = ~_3902;
    int _4114 = _4112 + _4048;
    int _4116 = _4114 + 1;
    float _4118 = _4100;
    if (_2740)
    {
        float _4120 = _4100 * 6.283185482025146484375;
        float _4122 = sin(_4120);
        _4118 = _4122;
    }
    float _4124 = _4118;
    bool _4126 = !_4066;
    int _4128 = _4126 ? 0 : (-1);
    bool _4130 = _3080 == 0;
    int _4132 = _3156 * _4116;
    int _4134 = _4132 + _3486;
    int _4136 = ~_3918;
    int _4138 = _4136 + _4052;
    int _4140 = _4138 + 1;
    uint _4142 = uint(int(uint(_4070) >> uint(31)));
    int _4144 = ~_4094;
    int _4146 = _3990 + _4144;
    int _4148 = _4146 + 1;
    int _4150 = _3196 * _4140;
    int _4152 = _4150 + _3542;
    int _4154 = ~int(_4102);
    int _4156 = _4154 + 1;
    float _4158 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4160 = _3034 + _4158;
    int _4162 = ~_4110;
    int _4164 = _3942 + _4162;
    int _4166 = _4164 + 1;
    bool _4168 = !_4130;
    int _4170 = _4168 ? _4106 : (-1);
    int _4172 = ~int(_4142);
    int _4174 = _4172 + 1;
    bool _4176 = _3156 == 0;
    int _4178 = _4148 ^ _4156;
    bool _4180 = _1620 == 0;
    bool _4182 = !_4060;
    int _4184 = _4182 ? 0 : (-1);
    int _4186 = _4166 ^ _4174;
    bool _4188 = _3080 == 0;
    bool _4190 = !_4176;
    int _4192 = _4190 ? _4134 : (-1);
    int _4194 = ~_4156;
    int _4196 = _4194 + _4178;
    int _4198 = _4196 + 1;
    bool _4200 = !_4180;
    int _4202 = _4200 ? _4064 : (-1);
    bool _4204 = _3196 == 0;
    bool _4206 = _3196 == 0;
    int _4208 = _3542 ^ _3196;
    bool _4210 = _1620 == 0;
    float _4212 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4214 = _2852 + _4212;
    int _4216 = ~_4174;
    int _4218 = _4216 + _4186;
    int _4220 = _4218 + 1;
    bool _4222 = !_4188;
    int _4224 = _4222 ? _4198 : (-1);
    bool _4226 = !_4204;
    int _4228 = _4226 ? _4152 : (-1);
    bool _4230 = _4090 > 0.0;
    bool _4232 = _3156 == 0;
    int _4234 = _3486 ^ _3156;
    bool _4236 = !_4210;
    int _4238 = _4236 ? _4220 : (-1);
    float _4240 = _1120 * 2.0;
    bool _4242 = _4090 >= 0.0;
    bool _4244 = isnan(_4090);
    bool _4246 = _4242 || _4244;
    bool _4248 = isnan(0.0);
    bool _4250 = _4246 || _4248;
    int _4252 = ~_4184;
    int _4254 = _3962 + _4252;
    int _4256 = _4254 + 1;
    float _4258 = floor(_4240);
    int _4260 = _4250 ? 0 : 1;
    uint _4262 = uint(int(uint(_4208) >> uint(31)));
    int _4264 = ~_4260;
    int _4266 = _4264 + 1;
    int _4268 = _4266 + 1;
    int _4270 = _4268;
    bool _4272 = _4250;
    if (!_4230)
    {
        int _4274 = ~_4260;
        int _4276 = _4274 + 1;
        _4270 = _4276;
    }
    int _4278 = _4270;
    uint _4280 = uint(int(uint(_4234) >> uint(31)));
    int _4282 = ~_4128;
    int _4284 = _3994 + _4282;
    int _4286 = _4284 + 1;
    float _4288 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _4290 = ~int(_4262);
    int _4292 = _4290 + 1;
    float _4294 = fma(as_type<float>(_1128), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4288);
    int _4296 = ~int(_4280);
    int _4298 = _4296 + 1;
    float _4300 = as_type<float>(_1128) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    if (_2740)
    {
        bool _4302 = _4124 > 0.5;
        _4272 = _4302;
    }
    bool _4304 = _4272;
    float _4306 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _4308 = _4286 ^ _4292;
    float _4310 = _4160 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4312 = _4256 ^ _4298;
    float _4314 = -_4306;
    float _4316 = fma(_4300, 2.0, _4314);
    int _4318 = ~_4292;
    int _4320 = _4318 + _4308;
    int _4322 = _4320 + 1;
    float _4324 = _4160 * _4160;
    float _4326 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4310);
    int _4328 = ~_4298;
    int _4330 = _4328 + _4312;
    int _4332 = _4330 + 1;
    float _4334 = fma(_3234, _3234, _4324);
    bool _4336 = !_4206;
    int _4338 = _4336 ? _4322 : (-1);
    float _4340 = (*spvDescriptorSet0.vp_c9)._m0[103].z + (*spvDescriptorSet0.vp_c9)._m0[103].x;
    bool _4342 = !_4232;
    int _4344 = _4342 ? _4332 : (-1);
    float _4346 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4326);
    int _4348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4350 = _4348 != 0;
    int _4352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4354 = _4352 != 0;
    int _4356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4358 = _4356 != 0;
    float _4360 = fma(as_type<float>(_1128), (*spvDescriptorSet0.vp_c9)._m0[103].z, _4340);
    float _4362 = fma(_4214, _4214, _4334);
    float _4364 = fma(_2830, _3008, _3206);
    float _4366 = _1122 + _1120;
    bool _4368 = !_4354;
    int _4370 = _4368 ? 0 : 1;
    float _4372 = sqrt(_4362);
    bool _4374 = _4346 >= 0.0;
    float _4376 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _4378 = _4366 + (-1.0);
    float _4380 = _1110 + _1122;
    float _4382 = (*spvDescriptorSet0.vp_c9)._m0[103].w + (*spvDescriptorSet0.vp_c9)._m0[103].y;
    float _4384 = fma(as_type<float>(_1126), (*spvDescriptorSet0.vp_c9)._m0[93].w, _4376);
    float _4386 = fma(_4378, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _4388 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4390 = fma(as_type<float>(_1126), (*spvDescriptorSet0.vp_c9)._m0[103].w, _4382);
    float _4392 = as_type<float>(_1126) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4394 = _4380 + (-1.0);
    float _4396 = _4378;
    if (_4374)
    {
        _4396 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4398 = _4396;
    float _4400 = fma(_2822, _3002, _4364);
    float _4402 = fma(_4392, -2.0, _4388);
    float _4404 = fma(_4394, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _4406 = _4372 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _4408 = as_type<int>(_4398);
    if (_4374)
    {
        float _4410 = _4398 * 5.0;
        _4408 = as_type<int>(_4410);
    }
    int _4412 = _4408;
    float _4414 = fma(_2844, _2940, _4400);
    float _4416 = precise::min(_3992, _4406);
    float _4418 = -_153;
    float _4420 = fma(_4418, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4316);
    if (_4374)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12146 = as_type<float>(_4412);
        out.gl_Position.z = _12146;
    }
    float _4422 = fma(_3032, _2936, _4414);
    bool _4424 = !_4350;
    int _4426 = _4424 ? 0 : 1;
    out.m_72.w = _4416;
    bool _4428 = _4258 >= 0.0;
    bool _4430 = isnan(_4258);
    bool _4432 = _4428 || _4430;
    bool _4434 = isnan(0.0);
    bool _4436 = _4432 || _4434;
    float _4438 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4440 = fma(_2896, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4422);
    float _4442 = fma(_3946, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4438);
    int _4444 = _4436 ? 0 : 1;
    float _4446 = rsqrt(_4362);
    float _4448 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4450 = _3946 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    bool _4452 = _4258 > 0.0;
    float _4454 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4456 = (*spvDescriptorSet0.vp_c9)._m0[102].y + (*spvDescriptorSet0.vp_c9)._m0[101].w;
    float _4458 = fma(_4450, -2.0, _4448);
    float _4460 = _4016 * (*spvDescriptorSet0.vp_c9)._m0[102].x;
    float _4462 = _4028 * (*spvDescriptorSet0.vp_c9)._m0[102].y;
    float _4464 = fma(_3924, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4454);
    float _4466 = _3924 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4468 = fma(_4462, -2.0, _4456);
    float _4470 = _3894 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _4472 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4474 = -_3920;
    float _4476 = fma(_4466, 2.0, _4474);
    float _4478 = _4160 * _4446;
    float _4480 = _4214 * _4446;
    float _4482 = -_4472;
    float _4484 = fma(_4470, 2.0, _4482);
    float _4486 = _3234 * _4446;
    float _4488 = -_4478;
    float _4490 = fma(_4488, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4160);
    int _4492 = ~_4444;
    int _4494 = _4492 + 1;
    int _4496 = _4494 + 1;
    float _4498 = _4478 * _4416;
    int _4500 = _4496;
    if (!_4452)
    {
        int _4502 = ~_4444;
        int _4504 = _4502 + 1;
        _4500 = _4504;
    }
    int _4506 = _4500;
    float _4508 = -_4486;
    float _4510 = fma(_4508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3234);
    float _4512 = _4490 * _4490;
    float _4514 = _4480 * _4416;
    float _4516 = _4486 * _4416;
    float _4518 = -_4498;
    float _4520 = _4160 + _4518;
    float _4522 = fma(_4510, _4510, _4512);
    float _4524 = -_4480;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4214);
    float _4528 = -_4514;
    float _4530 = _4214 + _4528;
    float _4532 = -_4516;
    float _4534 = _3234 + _4532;
    float _4536 = _4520 * _4520;
    float _4538 = fma(_4526, _4526, _4522);
    float _4540 = fma(_4534, _4534, _4536);
    float _4542 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4544 = abs(_4426);
    float _4546 = (*spvDescriptorSet0.vp_c9)._m0[102].x + (*spvDescriptorSet0.vp_c9)._m0[101].z;
    float _4548 = fma(_4530, _4530, _4540);
    float _4550 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4542);
    float _4552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _4554 = -_4546;
    float _4556 = fma(_4460, 2.0, _4554);
    float _4558 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4560 = 1.0 + _4558;
    float _4562 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[101].y, _4468);
    bool _4564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4566 = isnan(0.0);
    bool _4568 = _4564 || _4566;
    bool _4570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4572 = _4568 || _4570;
    float _4574 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4550);
    out.m_74.x = _4440;
    float _4576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _4578 = -_153;
    float _4580 = fma(_4578, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4484);
    int _4582 = abs(_4370);
    float _4584 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4294);
    float _4586 = float(_4506);
    float _4588 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4590 = _4572 ? _3526 : 0.0;
    float _4592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4594 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4596 = isnan(1.0);
    bool _4598 = _4594 || _4596;
    bool _4600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4602 = _4598 || _4600;
    float _4604 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4588);
    float _4606 = float(_4544);
    float _4608 = _4552 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4610 = float(_3812);
    float _4612 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4604);
    float _4614 = float(_4582);
    float _4616 = sqrt(_4538);
    float _4618 = _4606 * _4586;
    float _4620 = float(_4202);
    float _4622 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4384);
    float _4624 = float(_4170);
    float _4626 = _4576 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _4628 = _4614 * _4610;
    float _4630 = float(_4228);
    float _4632 = sqrt(_4548);
    float _4634 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[102].z, _4360);
    float _4636 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[102].w, _4390);
    float _4638 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4402);
    float _4640 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4464);
    float _4642 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4442);
    float _4644 = -_153;
    float _4646 = fma(_4644, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4476);
    float _4648 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4458);
    float _4650 = 1.0 / _4560;
    float _4652 = -_153;
    float _4654 = fma(_4652, (*spvDescriptorSet0.vp_c9)._m0[101].x, _4556);
    float _4656 = _4446 * _4616;
    float _4658 = _4592 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _4660 = fma(_4608, _4620, _4580);
    float _4662 = fma(_4626, _4624, _4420);
    float _4664 = _2140 + 0.5;
    float _4666 = fma(_4658, _4630, _4654);
    float _4668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4670 = _4446 * _4632;
    float _4672 = _3930 + 0.5;
    float _4674 = float(_4192);
    float _4676 = _3620 + 0.5;
    float _4678 = float(_4238);
    float _4680 = fma(_4608, _4672, _4660);
    float _4682 = fma(_4626, _4664, _4662);
    float _4684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _4686 = _4676;
    if (_4602)
    {
        float _4688 = _4590 * _4650;
        _157 = _4688;
    }
    float _4690 = _157;
    float _4692 = float(_4224);
    float _4694 = -_4574;
    float _4696 = _4694 + 1.0;
    float _4698 = float(_4344);
    float _4700 = -_4640;
    float _4702 = _4700 + 1.0;
    float _4704 = float(_4338);
    float _4706 = -_4696;
    float _4708 = fma(_3930, _4706, _4680);
    float _4710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4712 = _4668 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    if (_4374)
    {
        out.m_49.x = 0.0;
    }
    bool _4714 = !_4358;
    int _4716 = _4714 ? 0 : 1;
    float _4718 = fma(_4712, _4674, _4646);
    float _4720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4722 = _4684 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4724 = _3732 + 0.5;
    float _4726 = fma(_4712, _4676, _4718);
    float _4728 = _4718;
    if (!_2732)
    {
        _4686 = _233;
    }
    float _4730 = _4686;
    float _4732 = -_4068;
    float _4734 = fma(_4722, _4678, _4732);
    float _4736 = fma(_4658, _4724, _4666);
    float _4738 = _3832 + (-0.5);
    float _4740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _4742 = _4710 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _4744 = _4730;
    if (_2732)
    {
        float _4746 = -_233;
        float _4748 = _3624 ? _4746 : _233;
        _4744 = _4748;
    }
    float _4750 = _4744;
    float _4752 = -_4722;
    float _4754 = fma(_4752, _4738, _4734);
    float _4756 = _2540 + (-0.5);
    float _4758 = -_4638;
    float _4760 = fma(_4742, _4692, _4758);
    if (!_2740)
    {
        _4728 = _233;
    }
    float _4762 = _4728;
    float _4764 = _4720 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4766 = _4762;
    if (_2740)
    {
        float _4768 = -_233;
        float _4770 = _4304 ? _4768 : _233;
        _4766 = _4770;
    }
    float _4772 = _4766;
    float _4774 = -_4648;
    float _4776 = fma(_4764, _4698, _4774);
    float _4778 = -_4742;
    float _4780 = fma(_4778, _4756, _4760);
    float _4782 = -_4584;
    float _4784 = _4782 + 1.0;
    float _4786 = _4772 + (-0.5);
    float _4788 = _4740 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _4790 = _4750 + (-0.5);
    float _4792 = -_4562;
    float _4794 = fma(_4788, _4704, _4792);
    float _4796 = -_4764;
    float _4798 = fma(_4796, _4790, _4776);
    float _4800 = -_4612;
    float _4802 = _4800 + 1.0;
    float _4804 = -_4784;
    float _4806 = fma(_4804, _2140, _4682);
    float _4808 = -_4642;
    float _4810 = _4808 + 1.0;
    float _4812 = -_4788;
    float _4814 = fma(_4812, _4786, _4794);
    float _4816 = fma(_3832, _4802, _4754);
    float _4818 = -_4634;
    float _4820 = _4818 + 1.0;
    float _4822 = in.m_76.x;
    float _4824 = in.m_76.y;
    float _4826 = in.m_76.z;
    float _4828 = fma(_4810, _4750, _4798);
    float _4830 = -_4622;
    float _4832 = _4830 + 1.0;
    float _4834 = -_4636;
    float _4836 = _4834 + 1.0;
    float _4838 = _4670 * _4656;
    float _4840 = -_4702;
    float _4842 = fma(_4840, _3620, _4726);
    float _4844 = -_4820;
    float _4846 = fma(_4844, _3732, _4736);
    float _4848 = fma(_4832, _2540, _4780);
    float _4850 = fma(_4836, _4772, _4814);
    float _4852 = _1224 * _4838;
    out.m_78.x = _4708;
    out.m_78.y = _4816;
    out.m_80.x = _4806;
    out.m_80.y = _4848;
    out.m_82.x = _4842;
    out.m_82.y = _4828;
    out.m_84.x = _4846;
    out.m_84.y = _4850;
    out.m_86.x = _4852;
    float _4854 = _4826;
    if (_4374)
    {
        return out;
    }
    float _4856 = -_4478;
    float _4858 = fma(_4856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3034);
    float _4860 = _4618 * (-2.0);
    float _4862 = _1110 + (-0.5);
    float _4864 = -_4486;
    float _4866 = fma(_4864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3072);
    float _4868 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4870 = _4858 + _4868;
    float _4872 = fma(_4860, _4822, _4822);
    int _4874 = abs(_4716);
    float _4876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4878 = _4866 + _4876;
    float _4880 = _4870 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _4882 = fma(_4862, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4872);
    float _4884 = -_4480;
    float _4886 = fma(_4884, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2852);
    float _4888 = _4628 * (-2.0);
    float _4890 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4880);
    float _4892 = _1122 + (-0.5);
    float _4894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4896 = _4886 + _4894;
    float _4898 = fma(_4386, _4888, _4386);
    float _4900 = fma(_4888, _4824, _4824);
    float _4902 = fma(_4896, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4890);
    float _4904 = float(_4278);
    float _4906 = _1110 + _1120;
    float _4908 = float(_4874);
    float _4910 = fma(_4892, (*spvDescriptorSet0.vp_c9)._m0[196].y, _4900);
    bool _4912 = _4902 >= 0.0;
    float _4914 = _4906 + (-1.0);
    float _4916 = fma(_4404, _4860, _4404);
    float _4918 = _4908 * _4904;
    float _4920 = fma(_4898, _4690, _4910);
    float _4922 = _1120 + (-0.5);
    float _4924 = _4918 * (-2.0);
    float _4926 = fma(_4916, _4690, _4882);
    float _4928 = fma(_4914, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _4930 = _4920 * 0.15915493667125701904296875;
    float _4932 = fma(_4924, _4826, _4826);
    float _4934 = _4926 * 0.15915493667125701904296875;
    float _4936 = fma(_4928, _4924, _4928);
    int _4938 = as_type<int>(_4922);
    if (_4912)
    {
        _4854 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4940 = _4854;
    float _4942 = fma(_4922, (*spvDescriptorSet0.vp_c9)._m0[196].z, _4932);
    float _4944 = _4934 * 6.283185482025146484375;
    float _4946 = sin(_4944);
    if (_4912)
    {
        out.m_49.x = 0.0;
    }
    float _4948 = fma(_4936, _4690, _4942);
    if (_4912)
    {
        float _4950 = _4940 * 5.0;
        _4938 = as_type<int>(_4950);
    }
    int _4952 = _4938;
    float _4954 = _4948 * 0.15915493667125701904296875;
    float _4956 = _4934 * 6.283185482025146484375;
    float _4958 = cos(_4956);
    if (_4912)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13028 = as_type<float>(_4952);
        out.gl_Position.z = _13028;
    }
    float _4960 = _4930 * 6.283185482025146484375;
    float _4962 = sin(_4960);
    float _4964 = _4930 * 6.283185482025146484375;
    float _4966 = cos(_4964);
    if (_4912)
    {
        return out;
    }
    float _4968 = _4954 * 6.283185482025146484375;
    float _4970 = cos(_4968);
    float _4972 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _4974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _233);
    float _4976 = _4946 * _4962;
    float _4978 = _4958 * _4966;
    float _4980 = _4972 * _4838;
    float _4982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _4984 = _4958 * _4962;
    float _4986 = _4954 * 6.283185482025146484375;
    float _4988 = sin(_4986);
    float _4990 = _4980 * _4974;
    float _4992 = _4946 * _4966;
    float _4994 = _4852 * _4982;
    float _4996 = _4838 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4998 = _4996 * 0.5;
    float _5000 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5002 = _4958 * _4970;
    float _5004 = _4966 * _4970;
    float _5006 = _4946 * _4970;
    float _5008 = _4962 * _4970;
    float _5010 = _5002 * _4990;
    float _5012 = fma(_4988, _4978, _4976);
    float _5014 = -_4992;
    float _5016 = fma(_4988, _4984, _5014);
    float _5018 = -_4990;
    float _5020 = _4988 * _5018;
    float _5022 = -_4984;
    float _5024 = fma(_4988, _4992, _5022);
    float _5026 = fma(_5012, _4994, _5010);
    float _5028 = _5006 * _4990;
    float _5030 = fma(_5004, _4994, _5020);
    float _5032 = fma(_4988, _4976, _4978);
    float _5034 = fma(_5016, _4998, _5026);
    float _5036 = fma(_5024, _4994, _5028);
    float _5038 = fma(_5008, _4998, _5030);
    float _5040 = _5034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5042 = fma(_5032, _4998, _5036);
    float _5044 = _5034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5046 = _5012 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5048 = fma(_5038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5040);
    float _5050 = fma(_5038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5044);
    float _5052 = fma(_5004, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5046);
    float _5054 = fma(_5042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5048);
    float _5056 = fma(_5042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5050);
    float _5058 = _5054 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _5060 = _5056 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _5062 = _5034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5064 = _2852 + _5058;
    float _5066 = _5012 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5068 = _3072 + _5060;
    float _5070 = fma(_5038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5062);
    float _5072 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5074 = _5064 + _5072;
    float _5076 = fma(_5004, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5066);
    float _5078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5080 = _5068 + _5078;
    float _5082 = fma(_5042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5070);
    float _5084 = _5074 * _5074;
    float _5086 = _5002 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5088 = fma(_5080, _5080, _5084);
    float _5090 = _5012 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5092 = -_4988;
    float _5094 = fma(_5092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5086);
    float _5096 = sqrt(_5088);
    float _5098 = fma(_5004, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5090);
    float _5100 = _5082 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _5102 = _5002 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5104 = _5002 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5106 = _3034 + _5100;
    float _5108 = -_4988;
    float _5110 = fma(_5108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5102);
    float _5112 = -_4988;
    float _5114 = fma(_5112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5104);
    bool _5116 = _5096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5118 = _5100;
    float _5120 = _5086;
    float _5122 = _5102;
    if (!_5116)
    {
        _5118 = _5068;
    }
    float _5124 = _5118;
    float _5126 = _5124;
    if (!_5116)
    {
        _5120 = _5064;
    }
    float _5128 = _5120;
    float _5130 = _5128;
    if (!_5116)
    {
        _5122 = _5106;
    }
    float _5132 = _5122;
    bool _5134 = !_5116;
    float _5136 = _5132;
    if (!_5134)
    {
        float _5138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5142 = _5096 + _5140;
        float _5144 = _5106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5146 = rsqrt(_5088);
        float _5148 = _5142 * _5138;
        float _5150 = _5148 * 0.15915493667125701904296875;
        float _5152 = _5150 * 6.283185482025146484375;
        float _5154 = cos(_5152);
        float _5156 = _5150 * 6.283185482025146484375;
        float _5158 = sin(_5156);
        float _5160 = _5154 + (-1.0);
        float _5162 = _5160 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5164 = fma(_5158, _5144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5166 = fma(_5106, _5154, _5162);
        float _5168 = _5146 * _5164;
        float _5170 = fma(_5080, _5168, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5172 = fma(_5074, _5168, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5136 = _5166;
        _5126 = _5170;
        _5130 = _5172;
    }
    float _5174 = _5136;
    float _5176 = _5126;
    float _5178 = _5130;
    float _5180 = _5016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5182 = _5016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5184 = _5016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5186 = fma(_5000, _5000, 1.0);
    float _5188 = -_4498;
    float _5190 = _5188 + _5174;
    float _5192 = fma(_5008, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5180);
    float _5194 = fma(_5008, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5182);
    float _5196 = fma(_5008, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5184);
    float _5198 = -_4516;
    float _5200 = _5198 + _5176;
    float _5202 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5204 = _5190 + _5202;
    float _5206 = rsqrt(_5186);
    float _5208 = -_4514;
    float _5210 = _5208 + _5178;
    float _5212 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5214 = _5200 + _5212;
    float _5216 = _5204 * _5204;
    float _5218 = fma(_5006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5110);
    float _5220 = fma(_5006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5094);
    float _5222 = fma(_5006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5114);
    float _5224 = fma(_5214, _5214, _5216);
    float _5226 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5228 = _5210 + _5226;
    float _5230 = fma(_5032, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5192);
    float _5232 = fma(_5032, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5194);
    float _5234 = fma(_5032, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5196);
    float _5236 = fma(_5228, _5228, _5224);
    float _5238 = fma(_5024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5098);
    float _5240 = fma(_5024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5076);
    float _5242 = fma(_5024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5052);
    float _5244 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5246 = _5000 * _5206;
    float _5248 = _5000 * _5218;
    float _5250 = _5000 * _5220;
    float _5252 = _5000 * _5222;
    float _5254 = sqrt(_5236);
    float _5256 = -_5230;
    float _5258 = _5246 * _5256;
    float _5260 = -_5232;
    float _5262 = _5246 * _5260;
    float _5264 = -_5234;
    float _5266 = _5246 * _5264;
    float _5268 = fma(_5244, _5238, _5248);
    float _5270 = fma(_5244, _5240, _5250);
    float _5272 = fma(_5244, _5242, _5252);
    float _5274 = fma(_5206, _5218, _5258);
    float _5276 = fma(_5206, _5220, _5262);
    float _5278 = fma(_5206, _5222, _5266);
    float _5280 = _5230 + _5268;
    float _5282 = _5232 + _5270;
    float _5284 = _5234 + _5272;
    out.m_88.x = _5238;
    out.m_88.y = _5240;
    out.m_88.z = _5242;
    float _5286 = -_4516;
    float _5288 = _3072 + _5286;
    bool _5290 = _5254 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5292 = isnan(_5254);
    bool _5294 = _5290 || _5292;
    bool _5296 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5298 = _5294 || _5296;
    out.m_90.x = _5274;
    out.m_90.y = _5276;
    out.m_90.z = _5278;
    float _5300 = -_4498;
    float _5302 = _3034 + _5300;
    float _5304 = -_4514;
    float _5306 = _2852 + _5304;
    out.m_92.x = _5280;
    out.m_92.y = _5282;
    out.m_92.z = _5284;
    float _5308 = _5206;
    float _5310 = _5274;
    float _5312 = _5270;
    float _5314 = _5262;
    if (!_5298)
    {
        _5308 = 1.0;
    }
    float _5316 = _5308;
    bool _5318 = !_5298;
    float _5320 = _5316;
    if (!_5318)
    {
        bool _5322 = _5254 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5324 = isnan(_5254);
        bool _5326 = _5322 || _5324;
        bool _5328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5330 = _5326 || _5328;
        if (!_5330)
        {
            float _5332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5334 = _5254 + _5332;
            float _5336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5336;
            float _5340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5342 = _5340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5344 = 1.0 / _5338;
            float _5346 = _5334 * _5344;
            float _5348 = fma(_5346, _5342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5320 = _5348;
            _5350 = true;
        }
        else
        {
            bool _5352 = _5254 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5354 = isnan(_5254);
            bool _5356 = _5352 || _5354;
            bool _5358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5360 = _5356 || _5358;
            if (!_5360)
            {
                float _5362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5364 = _5254 + _5362;
                float _5366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5368 = _5366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5372 = _5370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5374 = 1.0 / _5368;
                float _5376 = _5364 * _5374;
                float _5378 = fma(_5376, _5372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5320 = _5378;
                _5350 = true;
            }
            else
            {
                _5320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5350 = false;
    float _5380 = _5320;
    float _5382 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5384 = _5190 + _5382;
    float _5386 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5388 = _5200 + _5386;
    float _5390 = -_4486;
    float _5392 = fma(_5390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5288);
    float _5394 = fma(_5384, _5380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5396 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5398 = _5210 + _5396;
    float _5400 = fma(_5388, _5380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5402 = -_5302;
    float _5404 = _5402 + _5394;
    float _5406 = fma(_5398, _5380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5408 = -_5288;
    float _5410 = _5408 + _5400;
    float _5412 = _5404 * _5404;
    float _5414 = -_5306;
    float _5416 = _5414 + _5406;
    float _5418 = fma(_5410, _5410, _5412);
    float _5420 = fma(_5416, _5416, _5418);
    float _5422 = sqrt(_5420);
    bool _5424 = _5422 > 0.0;
    bool _5426 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5428 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5430 = _5426 || _5428;
    bool _5432 = isnan(0.5);
    bool _5434 = _5430 || _5432;
    float _5436 = _5380;
    float _5438 = _5400;
    float _5440 = _5406;
    if (!_5424)
    {
        _5310 = _5394;
    }
    float _5442 = _5310;
    float _5444 = _5442;
    float _5446 = _5442;
    if (!_5424)
    {
        _5436 = _5406;
    }
    float _5448 = _5436;
    bool _5450 = !_5424;
    float _5452 = _5448;
    if (!_5450)
    {
        float _5454 = _229 * _229;
        float _5456 = rsqrt(_5420);
        float _5458 = fma(_221, _221, _5454);
        float _5460 = fma(_235, _235, _5458);
        float _5462 = sqrt(_5460);
        float _5464 = _5410 * _5456;
        float _5466 = _5404 * _5456;
        float _5468 = _5416 * _5456;
        bool _5470 = _5462 > 0.0;
        float _5472 = _5462;
        _5312 = _5464;
        if (!_5470)
        {
            _5444 = _5394;
        }
        float _5474 = _5444;
        _5446 = _5474;
        if (!_5470)
        {
            _5472 = _5406;
        }
        float _5476 = _5472;
        bool _5478 = !_5470;
        _5452 = _5476;
        if (!_5478)
        {
            float _5480 = rsqrt(_5460);
            float _5482 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5484 = _229 * _5480;
            float _5486 = _221 * _5480;
            float _5488 = _5466 * _5484;
            float _5490 = _235 * _5480;
            float _5492 = fma(_5464, _5486, _5488);
            float _5494 = _5482 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5496 = fma(_5468, _5490, _5492);
            float _5498 = _5496 * _5494;
            float _5500 = fma(_221, _5498, _5400);
            float _5502 = fma(_229, _5498, _5394);
            float _5504 = fma(_235, _5498, _5406);
            _5446 = _5502;
            _5452 = _5504;
            _5438 = _5500;
        }
    }
    float _5506 = _5446;
    float _5508 = _5452;
    float _5510 = _5438;
    float _5512 = _5312;
    float _5514 = -_4478;
    float _5516 = fma(_5514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5506);
    float _5518 = -_4480;
    float _5520 = fma(_5518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5508);
    float _5522 = -_4486;
    float _5524 = fma(_5522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5510);
    float _5526 = -_4478;
    float _5528 = fma(_5526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5302);
    float _5530 = -_4480;
    float _5532 = fma(_5530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5306);
    float _5534 = _5516;
    float _5536 = _5524;
    float _5538 = _5520;
    float _5540 = _5512;
    if (!_5434)
    {
        float _5542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _5544 = _5528 + _5542;
        float _5546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _5548 = _5392 + _5546;
        float _5550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5552 = -_5306;
        float _5554 = _5552 + _5508;
        float _5556 = _5544 * _5544;
        float _5558 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _5560 = _5532 + _5558;
        float _5562 = -_5288;
        float _5564 = _5562 + _5510;
        float _5566 = -_5302;
        float _5568 = _5566 + _5506;
        float _5570 = fma(_5548, _5548, _5556);
        float _5572 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5574 = fma(_5560, _5560, _5570);
        float _5576 = sqrt(_5574);
        float _5578 = 1.0 / _4656;
        float _5580 = _5572 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5582 = precise::min(_5576, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5584 = _5582 * _5550;
        float _5586 = _5584 * _5578;
        float _5588 = _5580 * _5586;
        float _5590 = _5554 * _5586;
        float _5592 = fma(_5564, _5588, _5392);
        float _5594 = fma(_5568, _5588, _5528);
        float _5596 = fma(_5580, _5590, _5532);
        _5534 = _5594;
        _5536 = _5592;
        _5538 = _5596;
        _5440 = _5580;
    }
    float _5598 = _5534;
    float _5600 = _5536;
    float _5602 = _5538;
    float _5604 = _5440;
    float _5606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5608 = _5598 + _5606;
    float _5610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5612 = _5600 + _5610;
    float _5614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5616 = _5602 + _5614;
    float _5618 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _5620 = _5608 * _5608;
    float _5622 = fma(_5612, _5612, _5620);
    float _5624 = fma(_5616, _5616, _5622);
    float _5626 = rsqrt(_5624);
    float _5628 = sqrt(_5624);
    float _5630 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5632 = _5612 * _5630;
    float _5634 = _5616 * _5630;
    float _5636 = _5632 * _5632;
    float _5638 = _5634 * _5634;
    float _5640 = _5636 + _5638;
    float _5642 = sqrt(_5640);
    bool _5644 = _5642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5648 = _5642 + _5646;
    float _5650 = _5626;
    float _5652 = _5648;
    float _5654 = _5608;
    float _5656 = _5630;
    if (_5644)
    {
        float _5658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5650 = _5658;
    }
    float _5660 = _5650;
    float _5662 = _5660;
    if (_5644)
    {
        float _5664 = _5648 * _5660;
        _5652 = _5664;
    }
    float _5666 = _5652;
    if (_5644)
    {
        float _5668 = rsqrt(_5640);
        _5662 = _5668;
    }
    float _5670 = _5662;
    float _5672 = _5670;
    if (_5644)
    {
        float _5674 = _5666 * 0.15915493667125701904296875;
        _5540 = _5674;
    }
    float _5676 = _5540;
    float _5678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5680 = _5616;
    float _5682 = _5676;
    if (_5644)
    {
        float _5684 = _5676 * 6.283185482025146484375;
        float _5686 = sin(_5684);
        _5680 = _5686;
    }
    float _5688 = _5680;
    float _5690 = precise::max(0.0, _5678);
    float _5692 = _5604;
    float _5694 = _5690;
    if (_5644)
    {
        float _5696 = _5676 * 6.283185482025146484375;
        float _5698 = cos(_5696);
        _5692 = _5698;
    }
    float _5700 = _5692;
    float _5702 = -_5630;
    float _5704 = -_5690;
    float _5706 = fma(_5608, _5702, _5704);
    if (_5644)
    {
        float _5708 = _5706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5654 = _5708;
    }
    float _5710 = _5654;
    float _5712 = _5688;
    float _5714 = _5710;
    if (_5644)
    {
        float _5716 = fma(_5688, _5710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5712 = _5716;
    }
    float _5718 = _5712;
    float _5720 = _5718;
    if (!_5644)
    {
        _5714 = _5634;
    }
    float _5722 = _5714;
    float _5724 = _5722;
    if (!_5644)
    {
        _5682 = _5636;
    }
    float _5726 = _5682;
    float _5728 = _5726;
    if (_5644)
    {
        float _5730 = _5670 * _5718;
        _5314 = _5730;
    }
    float _5732 = _5314;
    if (!_5644)
    {
        _5672 = _5632;
    }
    float _5734 = _5672;
    float _5736 = _5734;
    if (_5644)
    {
        float _5738 = _5700 + (-1.0);
        _5694 = _5738;
    }
    float _5740 = _5694;
    float _5742 = _5740;
    if (_5644)
    {
        float _5744 = _5632 * _5732;
        _5736 = _5744;
    }
    float _5746 = _5736;
    if (!_5644)
    {
        _5720 = _5706;
    }
    float _5748 = _5720;
    float _5750 = _5748;
    if (_5644)
    {
        float _5752 = _5634 * _5732;
        _5724 = _5752;
    }
    float _5754 = _5724;
    if (_5644)
    {
        float _5756 = _5740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5656 = _5756;
    }
    float _5758 = _5656;
    if (_5644)
    {
        float _5760 = _5746 * _5746;
        _5728 = _5760;
    }
    float _5762 = _5728;
    if (!_5644)
    {
        _5742 = _5638;
    }
    float _5764 = _5742;
    float _5766 = _5764;
    if (_5644)
    {
        float _5768 = _5754 * _5754;
        _5766 = _5768;
    }
    float _5770 = _5766;
    if (_5644)
    {
        float _5772 = fma(_5706, _5700, _5758);
        _5750 = _5772;
    }
    float _5774 = _5750;
    float _5776 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _5778 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5780 = fma(_5774, _5774, _5762);
    float _5782 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[2].x, _5776);
    float _5784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5786 = fma(_5628, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5784);
    float _5788 = precise::clamp(_5786, 0.0, 1.0);
    float _5790 = _5780 + _5770;
    float _5792 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5794 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[2].z, _5782);
    float _5796 = -_5788;
    float _5798 = _5796 + 1.0;
    float _5800 = rsqrt(_5790);
    float _5802 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5804 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5792);
    float _5806 = _5794 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _5808 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5778);
    float _5810 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5802);
    float _5812 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5804);
    float _5814 = _5806 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5816 = abs(_5798);
    float _5818 = log2(_5816);
    float _5820 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5810);
    float _5822 = _5812 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5824 = -_5814;
    float _5826 = fma(_5824, _5618, 1.0);
    float _5828 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5808);
    float _5830 = _5820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5832 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5834 = _5800 * _5746;
    float _5836 = _5800 * _5774;
    float _5838 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5832);
    float _5840 = _5828 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _5842 = _5834 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5844 = _5800 * _5754;
    float _5846 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5838);
    float _5848 = log2(_5826);
    float _5850 = -_5842;
    float _5852 = fma(_5836, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5850);
    float _5854 = _5818 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5856 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5846);
    float _5858 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5860 = -_5844;
    float _5862 = fma(_5860, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5852);
    float _5864 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5866 = exp2(_5854);
    float _5868 = fma(_5862, -0.5, 0.5);
    float _5870 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5864);
    float _5872 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5858);
    float _5874 = fma(_5862, 0.5, 0.5);
    float _5876 = _5836 + 1.0;
    float _5878 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5870);
    float _5880 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5872);
    float _5882 = 1.0 / _5856;
    float _5884 = fma(_5874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5886 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5878);
    float _5888 = _5848 * 0.693147182464599609375;
    float _5890 = fma(_5874, _5884, -0.212114393711090087890625);
    float _5892 = _5888 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5894 = sqrt(_5868);
    float _5896 = -_5836;
    float _5898 = fma(_5866, _5876, _5896);
    float _5900 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5880);
    float _5902 = fma(_5874, _5890, 1.570728778839111328125);
    float _5904 = fma(_5898, 0.5, 0.5);
    float _5906 = _5886 * _5882;
    float _5908 = _5900 * _5882;
    float _5910 = fma(_5906, 0.5, 0.5);
    float _5912 = fma(_5908, -0.5, 0.5);
    float _5914 = _5894 * 0.636619746685028076171875;
    float3 _14626 = float3(_5910, _5912, _5892);
    float _5916 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_14626, float3(0.0), isnan(_14626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_14626, float3(0.0), isnan(_14626)), level(0.0)).x;
    float _5918 = -_5902;
    float _5920 = fma(_5914, _5918, 1.0);
    float3 _14642 = float3(_5910, _5912, _5892);
    float4 _5923 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_14642, float3(0.0), isnan(_14642)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_14642, float3(0.0), isnan(_14642)), level(0.0)).xyzw;
    float _5925 = _5923.x;
    float _5927 = _5923.y;
    float _5929 = _5923.z;
    float _5931 = _5923.w;
    float2 _14659 = float2(_5920, _5904);
    float3 _5935 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_14659, float2(0.0), isnan(_14659)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_14659, float2(0.0), isnan(_14659)), level(0.0)).xyz;
    float _5937 = _5935.x;
    float _5939 = _5935.y;
    float _5941 = _5935.z;
    float _5943 = _5528 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5945 = _5818 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5947 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5949 = fma(_5392, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5943);
    bool _5951 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5953 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5955 = _5951 || _5953;
    bool _5957 = isnan(0.5);
    bool _5959 = _5955 || _5957;
    float _5961 = exp2(_5945);
    float _5963 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5947);
    float _5965 = fma(_5532, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5949);
    float _5967 = _5528 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_94.x = _5392;
    out.m_94.y = _5528;
    out.m_94.z = _5532;
    float _5969 = _5965 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5971 = fma(_5392, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5967);
    out.m_96.x = _5600;
    out.m_96.y = _5598;
    out.m_96.z = _5602;
    float _5973 = 1.0 / _5969;
    float _5975 = fma(_5532, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5971);
    float _5977 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5979 = _5830;
    if (!_5959)
    {
        _5977 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _5981 = _5977;
    float _5983 = _5981;
    if (_5959)
    {
        _5979 = 1.0;
    }
    float _5985 = _5979;
    float _5987 = _5975 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5989 = -_5961;
    float _5991 = _5989 + 1.0;
    float _5993 = _5987 + _5969;
    float _5995 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5963);
    float _5997 = _5991 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5999 = _5886 + _5856;
    float _6001 = _5856 * 0.5;
    float _6003 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5995);
    float _6005 = -_5997;
    float _6007 = _6005 + 1.0;
    float _6009 = _5993 * _5973;
    float _6011 = _6009 * 0.5;
    out.gl_Position.x = _5886;
    out.gl_Position.y = _5900;
    out.gl_Position.z = _6003;
    out.gl_Position.w = _5856;
    float _6013 = _5973;
    float _6015 = _6011;
    float _6017 = _5985;
    if (!_5959)
    {
        float _6019 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _6021 = fma(_6011, _5981, _6019);
        _6013 = _6021;
    }
    float _6023 = _6013;
    if (!_5959)
    {
        _6015 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _6025 = _6015;
    float _6027 = _6025;
    if (!_5959)
    {
        float _6029 = -_6025;
        float _6031 = _6029 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _5983 = _6031;
    }
    float _6033 = _5983;
    float _6035 = _6023;
    if (!_5959)
    {
        float _6037 = 1.0 / _6023;
        _6035 = _6037;
    }
    float _6039 = _6035;
    float _6041 = _6033;
    if (!_5959)
    {
        float _6043 = 1.0 / _6033;
        _6041 = _6043;
    }
    float _6045 = _6041;
    if (!_5959)
    {
        float _6047 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _6049 = -_6025;
        float _6051 = fma(_6039, _6047, _6049);
        _6027 = _6051;
    }
    float _6053 = _6027;
    float _6055 = _5999 * 0.5;
    if (!_5959)
    {
        float _6057 = _6053 * _6045;
        float _6059 = precise::clamp(_6057, 0.0, 1.0);
        _6017 = _6059;
    }
    float _6061 = _6017;
    float _6063 = _6003 + _5856;
    float _6065 = fma(_5900, -0.5, _6001);
    float _6067 = _6061 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _6069 = _6061 > 0.0;
    bool _6071 = isnan(_6061);
    bool _6073 = _6069 || _6071;
    bool _6075 = isnan(0.0);
    bool _6077 = _6073 || _6075;
    float _6079 = _6063 * 0.5;
    float _6081 = _6067 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_98.x = _6055;
    out.m_98.y = _6065;
    out.m_98.z = _6079;
    out.m_98.w = _5856;
    out.m_49.x = _6081;
    float _6083 = _5997 * _5916;
    float _6085 = _5931 * _6083;
    float _6087 = _5931 * _6007;
    float _6089 = _5941 * _6083;
    float _6091 = fma(_5937, _6085, _5925);
    float _6093 = fma(_5939, _6085, _5927);
    float _6095 = fma(_5931, _6089, _5929);
    out.m_100.x = _6091;
    out.m_100.y = _6093;
    out.m_100.z = _6095;
    out.m_100.w = _6087;
    if (_6077)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _6097 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6097;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5350 = false;
    bool _783 = false;
    bool _641 = false;
    bool _459 = false;
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_46.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_49.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6154 = as_type<float>(_135);
        out.gl_Position.z = _6154;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = 0.0;
    float _157 = _153;
    if (_149)
    {
        float _159 = float(_119);
        _155 = _159;
    }
    float _161 = _155;
    bool _163 = _153 >= _161;
    bool _165 = !_149;
    bool _167 = _163 || _165;
    if (_167)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _129;
    if (_167)
    {
        out.m_49.x = 0.0;
    }
    if (_167)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6223 = as_type<float>(_173);
        out.gl_Position.z = _6223;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_56.x;
    float _179 = in.m_56.y;
    float _181 = in.m_56.z;
    float _183 = in.m_58.x;
    float _185 = in.m_58.y;
    float _187 = in.m_58.z;
    float _189 = in.m_60.x;
    float _191 = in.m_60.y;
    float _193 = in.m_60.z;
    float _195 = in.m_62.x;
    float _197 = in.m_62.y;
    float _199 = in.m_62.z;
    int _201 = as_type<int>(_175) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_175) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = _179 * _185;
    float _213 = _179 * _191;
    float _215 = fma(_177, _183, _211);
    float _217 = _179 * _197;
    float _219 = fma(_177, _189, _213);
    float _221 = fma(_181, _187, _215);
    bool _223 = !_203;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = fma(_177, _195, _217);
    float _229 = fma(_181, _193, _219);
    bool _231 = !_207;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = fma(_181, _199, _227);
    bool _237 = !_209;
    float _255;
    if (!_237)
    {
        float _239 = in.m_64.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_119);
        float _261 = 1.0 / _259;
        float _263 = _153 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _265 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _283;
    float _287 = in.m_66.x;
    float _289 = in.m_66.y;
    bool _291 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_265);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    float _303 = 1.0 / _277;
    bool _305 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _307 = 1.0 / _281;
    float _309 = 1.0 / _285;
    float _311 = _269 * _303;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _265 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    float _321 = fma(_319, _311, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _323 = _315 * _307;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _325;
    bool _329 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _331 = isnan(_265);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    bool _341 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_265);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = fma(_327, _311, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = _273 * _309;
    float _357 = -_301;
    float _359 = _357 + 1.0;
    bool _361 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_265);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = _339 * _359;
    float _379 = -_339;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = fma(_375, _323, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = _371 * _381;
    float _391 = -_371;
    float _393 = _391 + 1.0;
    float _395 = fma(_385, _323, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _397 = _351 * _393;
    float _399 = -_351;
    float _401 = _399 + 1.0;
    float _403 = _321 * _397;
    float _405 = _353 * _397;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _417 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _355, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _355, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_387, _389, _415);
    float _425 = fma(_395, _389, _417);
    float _427 = fma(_419, _377, _423);
    float _429 = fma(_421, _377, _425);
    float _431 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    float _435 = _431 * _287;
    float _437 = _433 * _289;
    bool _439 = !_305;
    float _457;
    if (!_439)
    {
        float _441 = in.m_64.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_119);
        float _463 = 1.0 / _461;
        float _465 = _153 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _471 = _467 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _477 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _479 = isnan(_467);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _497 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _499 = isnan(_467);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = 1.0 / _475;
    float _511 = -_487;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _515;
    bool _519 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _521 = isnan(_467);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = _507 * _513;
    float _533 = -_507;
    float _535 = _533 + 1.0;
    bool _537 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _539 = 1.0 / _491;
    float _541 = _529 * _535;
    float _543 = -_529;
    float _545 = _543 + 1.0;
    float _547 = 1.0 / _495;
    float _549 = _517 * _509;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _555 = fma(_549, _471, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _557 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _559 = isnan(_467);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _553 * _539;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _573 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = _467 + _575;
    float _579 = _555 * _541;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _583 = _467 + _581;
    float _585 = fma(_569, _577, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _587 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[115].x, _579);
    float _589 = _573 * _547;
    float _591 = -_567;
    float _593 = _591 + 1.0;
    float _595 = fma(_585, _531, _587);
    float _597 = fma(_589, _583, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _599 = _487 * _593;
    float _601 = fma(_597, _599, _595);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[118].x, _601);
    float _611 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _615 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _617 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _611;
    out.m_68.y = _613;
    out.m_68.z = _615;
    out.m_68.w = _617;
    bool _619 = !_537;
    float _621 = _613;
    float _639;
    if (!_619)
    {
        float _623 = in.m_64.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_119);
        float _645 = 1.0 / _643;
        float _647 = _153 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _653 = _649 + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _659 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _661 = isnan(_649);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _675 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _677 = isnan(_649);
    bool _679 = _675 || _677;
    bool _681 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _683 = _679 || _681;
    float _685 = float(_683);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _687;
    bool _691 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _693 = isnan(_649);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = 1.0 / _657;
    float _705 = -_669;
    float _707 = _705 + 1.0;
    bool _709 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _711 = _685 * _707;
    float _713 = -_685;
    float _715 = _713 + 1.0;
    float _717 = 1.0 / _673;
    float _719 = _689 * _703;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _725 = fma(_719, _653, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _727 = -_701;
    float _729 = _727 + 1.0;
    float _731 = _725 * _711;
    float _733 = _723 * _717;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _737 = _649 + _735;
    float _739 = _669 * _729;
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[131].x, _731);
    float _743 = fma(_733, _737, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _745 = fma(_743, _739, _741);
    float _747 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _753 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[133].x, _745);
    float _755 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _753 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_70.x = _755;
    out.m_70.y = _757;
    out.m_70.z = _759;
    out.m_70.w = _761;
    bool _763 = !_709;
    float _781;
    if (!_763)
    {
        float _765 = in.m_64.x;
        float _767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _769 = _765 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _771 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[14].x, _153);
        float _773 = _771 * _767;
        float _775 = floor(_773);
        float _777 = -_775;
        float _779 = _773 + _777;
        _781 = _779;
        _783 = true;
    }
    else
    {
        float _785 = float(_119);
        float _787 = 1.0 / _785;
        float _789 = _153 * _787;
        _781 = _789;
    }
    _783 = false;
    float _791 = _781;
    float _793 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _795 = int(_793);
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _803 = _801 != 0;
    float _805 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _807 = int(_805);
    float _809 = 0.0;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _813 = _799;
    if (_799)
    {
        _809 = 1.0;
    }
    float _815 = _809;
    float _817 = trunc((*spvDescriptorSet0.vp_c9)._m0[67].y);
    int _819 = int(_817);
    float _821 = float(_795);
    float _823 = 0.0;
    float _825 = _815;
    if (_799)
    {
        _823 = 1.0;
    }
    float _827 = _823;
    float _829 = 0.0;
    float _831 = _827;
    if (_799)
    {
        _829 = 1.0;
    }
    float _833 = _829;
    int _835 = 0;
    float _837 = _833;
    if (_799)
    {
        _835 = 0;
    }
    int _839 = _835;
    float _841 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _843 = int(_841);
    float _845 = float(_807);
    int _847 = _839;
    if (_799)
    {
        _811 = 0;
    }
    int _849 = _811;
    float _851 = 1.0 / _821;
    float _853 = float(_819);
    float _855 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].y);
    int _857 = int(_855);
    int _859 = int(_799);
    int _861 = _803 ? 2 : 0;
    int _863 = _859 | _861;
    int _865 = _209 ? 4 : 0;
    int _867 = _863 | _865;
    int _869 = false ? 8 : 0;
    int _871 = _867 | _869;
    int _873 = false ? 16 : 0;
    int _875 = _871 | _873;
    int _877 = false ? 32 : 0;
    int _879 = _875 | _877;
    int _881 = false ? 64 : 0;
    int _883 = _879 | _881;
    int _885 = _883 & 2;
    float _887 = float(uint(_843));
    float _889 = as_type<float>(_885);
    int _891 = _849;
    if (_803)
    {
        float _893 = in.m_64.w;
        _889 = _893;
    }
    float _895 = _889;
    float _897 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _899 = int(_897);
    float _901 = _851 * _153;
    float _903 = 1.0 / _845;
    float _905 = float(_857);
    float _907 = 1.0 / _853;
    float _909 = float(uint(_899));
    float _911 = _895;
    if (_803)
    {
        float _913 = _895 * 3.1415927410125732421875;
        _911 = _913;
    }
    float _915 = _911;
    float _917 = trunc((*spvDescriptorSet0.vp_c9)._m0[67].x);
    int _919 = int(_917);
    float _921 = _903 * _153;
    if (_803)
    {
        float _923 = _915 * 0.15915493667125701904296875;
        _621 = _923;
    }
    float _925 = _621;
    float _927 = trunc((*spvDescriptorSet0.vp_c9)._m0[58].x);
    int _929 = int(_927);
    float _931 = _907 * _153;
    float _933 = 1.0 / _887;
    float _935 = float(uint(_919));
    float _937 = trunc(_901);
    int _939 = int(_937);
    float _941 = float(uint(_929));
    float _943 = 1.0 / _905;
    float _945 = 1.0 / _909;
    float _947 = float(uint(_939));
    float _949 = _915;
    float _951 = _903;
    float _953 = _905;
    if (_799)
    {
        float _955 = in.m_64.x;
        float _957 = in.m_64.y;
        float _959 = in.m_64.z;
        _949 = _955;
        _951 = _957;
        _953 = _959;
    }
    float _961 = _949;
    float _963 = _951;
    float _965 = _953;
    float _967 = trunc(_921);
    int _969 = int(_967);
    float _971 = _943 * _153;
    float _973 = 1.0 / _935;
    float _975 = trunc(_931);
    int _977 = int(_975);
    int _979 = as_type<int>(_945) + (-2);
    int _981 = 0;
    int _983 = as_type<int>(_973);
    float _985 = _961;
    float _987 = _965;
    float _989 = _963;
    if (_799)
    {
        _981 = as_type<int>(_965);
    }
    int _991 = _981;
    float _993 = 1.0 / _941;
    float _995 = trunc(_971);
    int _997 = int(_995);
    int _999 = as_type<int>(_933) + (-2);
    float _1001 = float(uint(_977));
    float _1003 = as_type<float>(_999) * _947;
    float _1005 = float(uint(_969));
    float _1007 = _925;
    float _1009 = _1001;
    int _1011 = _991;
    if (_803)
    {
        float _1013 = _925 * 6.283185482025146484375;
        float _1015 = sin(_1013);
        _1007 = _1015;
    }
    float _1017 = _1007;
    int _1019 = as_type<int>(_993) + (-2);
    float _1021 = as_type<float>(_979) * _1005;
    int _1023 = as_type<int>(_973) + (-2);
    float _1025 = trunc(_1003);
    float _1027 = precise::max(_1025, 0.0);
    uint _1030 = uint(_1027);
    float _1032 = float(uint(_997));
    float _1034 = as_type<float>(_1023) * _1001;
    float _1036 = _993;
    if (_799)
    {
        _1009 = _961;
    }
    float _1038 = _1009;
    float _1040 = as_type<float>(_1019) * _1032;
    int _1042 = as_type<int>(_1040);
    float _1044 = _1038;
    if (_799)
    {
        _1036 = _1038;
    }
    float _1046 = _1036;
    float _1048 = trunc(_1021);
    float _1050 = precise::max(_1048, 0.0);
    uint _1052 = uint(_1050);
    float _1054 = _1046;
    if (_799)
    {
        _983 = as_type<int>(_1038);
    }
    int _1056 = _983;
    float _1058 = trunc(_1034);
    float _1060 = precise::max(_1058, 0.0);
    uint _1062 = uint(_1060);
    float _1064 = trunc(_1040);
    float _1066 = precise::max(_1064, 0.0);
    uint _1068 = uint(_1066);
    int _1070 = _1056;
    if (_799)
    {
        _1042 = as_type<int>(_963);
    }
    int _1072 = _1042;
    int _1074 = _1072;
    if (!_799)
    {
        float _1076 = in.m_64.x;
        float _1078 = in.m_64.y;
        float _1080 = in.m_64.z;
        float _1082 = _1078 * 3.1415927410125732421875;
        float _1084 = _1080 * 3.1415927410125732421875;
        float _1086 = _1076 * 3.1415927410125732421875;
        float _1088 = _1082 * 0.15915493667125701904296875;
        float _1090 = _1084 * 0.15915493667125701904296875;
        float _1092 = _1086 * 0.15915493667125701904296875;
        float _1094 = _1088 * 6.283185482025146484375;
        float _1096 = sin(_1094);
        float _1098 = _1090 * 6.283185482025146484375;
        float _1100 = sin(_1098);
        float _1102 = _1092 * 6.283185482025146484375;
        float _1104 = sin(_1102);
        _1054 = _1080;
        _837 = 5.839270114898681640625;
        _985 = _1076;
        _831 = 1.2345600128173828125;
        _1044 = _1078;
        _825 = 7.345489978790283203125;
        _891 = 2;
        _987 = _1080;
        _989 = _1078;
        _847 = 1;
        _1074 = as_type<int>(_1096);
        _1070 = as_type<int>(_1104);
        _1011 = as_type<int>(_1100);
    }
    float _1106 = _1054;
    float _1108 = _837;
    float _1110 = _985;
    float _1112 = _831;
    float _1114 = _1044;
    float _1116 = _825;
    int _1118 = _891;
    float _1120 = _987;
    float _1122 = _989;
    int _1124 = _847;
    int _1126 = _1074;
    int _1128 = _1070;
    int _1130 = _1011;
    int _1132 = ~_899;
    int _1134 = _1132 + 1;
    float _1136 = _1106 * _1108;
    int _1138 = ~_919;
    int _1140 = _1138 + 1;
    float _1142 = _1110 * _1108;
    int _1144 = ~_843;
    int _1146 = _1144 + 1;
    int _1148 = _1134 * int(_1052);
    int _1150 = _1148 + _969;
    int _1152 = ~_929;
    int _1154 = _1152 + 1;
    int _1156 = _1140 * int(_1062);
    int _1158 = _1156 + _977;
    float _1160 = float(_119);
    int _1162 = _1146 * int(_1030);
    int _1164 = _1162 + _939;
    float _1166 = float(uint(_1150));
    int _1168 = _1154 * int(_1068);
    int _1170 = _1168 + _997;
    float _1172 = float(uint(_1158));
    float _1174 = _1106 * _1112;
    float _1176 = float(uint(_1164));
    float _1178 = _1114 * _1116;
    float _1180 = float(uint(_1170));
    float _1182 = as_type<float>(_1023) * _1172;
    float _1184 = floor(_1136);
    float _1186 = as_type<float>(_999) * _1176;
    float _1188 = as_type<float>(_979) * _1166;
    float _1190 = as_type<float>(_1019) * _1180;
    if (_803)
    {
        bool _1192 = _1017 > 0.5;
        _813 = _1192;
    }
    bool _1194 = _813;
    float _1196 = in.m_60.w;
    int _1198 = ~_929;
    int _1200 = _1198 + 1;
    bool _1202 = _1118 != 2;
    float _1204 = floor(_1142);
    int _1206 = ~_919;
    int _1208 = _1206 + 1;
    float _1210 = in.m_62.w;
    bool _1212 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1214 = isnan(_791);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1226 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1228 = isnan(_791);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = in.m_58.w;
    float _1240 = 1.0 / _1160;
    float _1242 = -_1184;
    float _1244 = _1136 + _1242;
    float _1246 = -_1222;
    float _1248 = _1246 + 1.0;
    float _1250 = floor(_1174);
    float _1252 = -_1204;
    float _1254 = _1142 + _1252;
    float _1256 = float(_899);
    float _1258 = float(_997);
    float _1260 = floor(_1178);
    float _1262 = _1240 * _153;
    float _1264 = float(_969);
    float _1266 = trunc(_1182);
    float _1268 = precise::max(_1266, 0.0);
    uint _1270 = uint(_1268);
    float _1272 = -_1250;
    float _1274 = _1174 + _1272;
    float _1276 = float(_929);
    bool _1278 = _1258 >= _1276;
    bool _1280 = isnan(_1258);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan(_1276);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = trunc(_1186);
    float _1292 = precise::max(_1290, 0.0);
    uint _1294 = uint(_1292);
    float _1296 = -_1260;
    float _1298 = _1178 + _1296;
    float _1300 = float(_843);
    float _1302 = _1300 * _1244;
    float _1304 = trunc(_1188);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    int _1310 = int(_1062) + int(_1270);
    int _1312 = ~_843;
    int _1314 = _1312 + 1;
    float _1316 = trunc(_1190);
    float _1318 = precise::max(_1316, 0.0);
    uint _1320 = uint(_1318);
    int _1322 = int(_1030) + int(_1294);
    float _1324 = float(_939);
    bool _1326 = _1324 >= _1300;
    bool _1328 = isnan(_1324);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(_1300);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = _1300 * _1262;
    int _1340 = int(_1052) + int(_1308);
    float _1342 = trunc(_1302);
    int _1344 = int(_1342);
    bool _1346 = _1264 >= _1256;
    bool _1348 = isnan(_1264);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(_1256);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = _1256 * _1298;
    float _1360 = _1276 * _1274;
    int _1362 = _1314 * _1322;
    int _1364 = _1362 + _939;
    int _1366 = int(_1194);
    int _1368 = _803 ? 2 : 0;
    int _1370 = _1366 | _1368;
    int _1372 = _209 ? 4 : 0;
    int _1374 = _1370 | _1372;
    int _1376 = false ? 8 : 0;
    int _1378 = _1374 | _1376;
    int _1380 = false ? 16 : 0;
    int _1382 = _1378 | _1380;
    int _1384 = false ? 32 : 0;
    int _1386 = _1382 | _1384;
    int _1388 = false ? 64 : 0;
    int _1390 = _1386 | _1388;
    int _1392 = _1390 & 1;
    float _1394 = _1256 * _1262;
    int _1396 = int(_1068) + int(_1320);
    float _1398 = _1276 * _1262;
    int _1400 = ~_899;
    int _1402 = _1400 + 1;
    float _1404 = trunc(_1360);
    int _1406 = int(_1404);
    bool _1408 = uint(_1364) >= uint(_843);
    int _1410 = _1200 * _1396;
    int _1412 = _1410 + _997;
    float _1414 = float(_919);
    int _1416 = _1402 * _1340;
    int _1418 = _1416 + _969;
    float _1420 = float(_977);
    bool _1422 = uint(_1412) >= uint(_929);
    float _1424 = _1414 * _1262;
    bool _1426 = uint(_1418) >= uint(_899);
    float _1428 = _1414 * _1254;
    bool _1430 = _1420 >= _1414;
    bool _1432 = isnan(_1420);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(_1414);
    bool _1438 = _1434 || _1436;
    float _1440 = float(_1438);
    int _1442 = _1208 * _1310;
    int _1444 = _1442 + _977;
    bool _1446 = !_1408;
    int _1448 = _1446 ? 0 : (-1);
    float _1450 = trunc(_1358);
    int _1452 = int(_1450);
    bool _1454 = !_1426;
    int _1456 = _1454 ? 0 : (-1);
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1460 = _1458 != 0;
    bool _1462 = !_1422;
    int _1464 = _1462 ? 0 : (-1);
    int _1466 = ~_1322;
    int _1468 = _1466 + _1448;
    int _1470 = _1468 + 1;
    float _1472 = trunc(_1336);
    int _1474 = int(_1472);
    int _1476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1478 = _1476 != 0;
    bool _1480 = !_1460;
    int _1482 = _1480 ? 0 : 1;
    bool _1484 = uint(_1444) >= uint(_919);
    int _1486 = ~_1340;
    int _1488 = _1486 + _1456;
    int _1490 = _1488 + 1;
    float _1492 = trunc(_1288);
    int _1494 = int(_1492);
    int _1496 = ~_1396;
    int _1498 = _1496 + _1464;
    int _1500 = _1498 + 1;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 65536;
    bool _1504 = _1502 != 0;
    int _1506 = _899 * _1490;
    int _1508 = _1506 + _969;
    bool _1510 = !_1478;
    int _1512 = _1510 ? 0 : 1;
    int _1514 = _929 * _1500;
    int _1516 = _1514 + _997;
    int _1518 = abs(_1482);
    float _1520 = trunc(_1338);
    int _1522 = int(_1520);
    bool _1524 = !_1504;
    int _1526 = _1524 ? 0 : 1;
    int _1528 = abs(_1512);
    bool _1530 = !_1484;
    int _1532 = _1530 ? 0 : (-1);
    float _1534 = trunc(_1394);
    int _1536 = int(_1534);
    int _1538 = abs(_1526);
    int _1540 = _1344 * _1518;
    int _1542 = _1540 + _939;
    int _1544 = ~_1310;
    int _1546 = _1544 + _1532;
    int _1548 = _1546 + 1;
    int _1550 = _843 * _1470;
    int _1552 = _1550 + _939;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1556 = _1554 != 0;
    float _1558 = trunc(_1424);
    int _1560 = int(_1558);
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1564 = _1562 != 0;
    int _1566 = _1452 * _1528;
    int _1568 = _1566 + _969;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1576 = _1574 != 0;
    bool _1578 = !_1556;
    int _1580 = _1578 ? 0 : 1;
    int _1582 = _1406 * _1538;
    int _1584 = _1582 + _997;
    bool _1586 = !_1564;
    int _1588 = _1586 ? 0 : 1;
    float _1590 = trunc(_1356);
    int _1592 = int(_1590);
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1596 = _1594 != 0;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1600 = _1598 != 0;
    bool _1602 = !_1576;
    int _1604 = _1602 ? 0 : 1;
    bool _1606 = !_1572;
    int _1608 = _1606 ? 0 : 1;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1616 = _1614 != 0;
    float _1618 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _1620 = int(_1618);
    bool _1622 = !_1600;
    int _1624 = _1622 ? 0 : 1;
    int _1626 = ~_1474;
    int _1628 = _1626 + 1;
    int _1630 = _1628 + 1;
    int _1632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1048576;
    bool _1634 = _1632 != 0;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2097152;
    bool _1638 = _1636 != 0;
    bool _1640 = _843 == 0;
    bool _1642 = _899 == 0;
    bool _1644 = !_1640;
    int _1646 = _1644 ? _1552 : (-1);
    int _1648 = ~_1592;
    int _1650 = _1648 + 1;
    int _1652 = _1650 + 1;
    bool _1654 = !_1642;
    int _1656 = _1654 ? _1508 : (-1);
    int _1658 = _1630 * _1646;
    int _1660 = _843 + (-1);
    bool _1662 = !_1638;
    int _1664 = _1662 ? 0 : 1;
    int _1666 = _1652 * _1656;
    bool _1668 = _929 == 0;
    int _1670 = _1474 * _1660;
    int _1672 = _1670 + _1658;
    int _1674 = _899 + (-1);
    int _1676 = _919 * _1548;
    int _1678 = _1676 + _977;
    int _1680 = ~_1494;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    bool _1686 = !_1668;
    int _1688 = _1686 ? _1516 : (-1);
    int _1690 = _1592 * _1674;
    int _1692 = _1690 + _1666;
    int _1694 = abs(_1604);
    int _1696 = abs(_1624);
    int _1698 = _1684 * _1688;
    int _1700 = abs(_1608);
    int _1702 = _1672 * _1694;
    int _1704 = _929 + (-1);
    int _1706 = _1692 * _1696;
    bool _1708 = !_1596;
    int _1710 = _1708 ? 0 : 1;
    int _1712 = _1494 * _1704;
    int _1714 = _1712 + _1698;
    int _1716 = abs(_1580);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1720 = _791 + _1718;
    int _1722 = abs(_1664);
    int _1724 = _1522 * _1700;
    int _1726 = _1724 + _1702;
    int _1728 = abs(_1710);
    float _1730 = trunc(_1398);
    int _1732 = int(_1730);
    int _1734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4194304;
    bool _1736 = _1734 != 0;
    int _1738 = _1714 * _1722;
    bool _1740 = !_1634;
    int _1742 = _1740 ? 0 : 1;
    int _1744 = _1536 * _1728;
    int _1746 = _1744 + _1706;
    bool _1748 = !_1612;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = _1542 * _1716;
    int _1754 = _1752 + _1726;
    bool _1756 = !_1736;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8388608;
    bool _1762 = _1760 != 0;
    int _1764 = abs(_1742);
    float _1766 = trunc(_1428);
    int _1768 = int(_1766);
    int _1770 = abs(_1750);
    int _1772 = abs(_1588);
    int _1774 = _1732 * _1764;
    int _1776 = _1774 + _1738;
    bool _1778 = !_1762;
    int _1780 = _1778 ? 0 : 1;
    int _1782 = _1568 * _1770;
    int _1784 = _1782 + _1746;
    int _1786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 131072;
    bool _1788 = _1786 != 0;
    int _1790 = _1344 * _1772;
    int _1792 = _1790 + _1754;
    float _1794 = float(uint(_1542));
    float _1796 = trunc(_1440);
    int _1798 = int(_1796);
    bool _1800 = !_1788;
    int _1802 = _1800 ? 0 : 1;
    bool _1804 = !_1616;
    int _1806 = _1804 ? 0 : 1;
    int _1808 = abs(_1802);
    float _1810 = as_type<float>(_999) * _1794;
    float _1812 = float(uint(_1792));
    int _1814 = abs(_1806);
    int _1816 = _1768 * _1808;
    int _1818 = _1816 + _977;
    int _1820 = abs(_1758);
    float _1822 = as_type<float>(_999) * _1812;
    float _1824 = float(uint(_1568));
    int _1826 = _1452 * _1814;
    int _1828 = _1826 + _1784;
    int _1830 = abs(_1780);
    float _1832 = trunc(_1810);
    float _1834 = precise::max(_1832, 0.0);
    uint _1836 = uint(_1834);
    float _1838 = as_type<float>(_979) * _1824;
    float _1840 = float(uint(_1828));
    float _1842 = float(uint(_1584));
    int _1844 = _1584 * _1820;
    int _1846 = _1844 + _1776;
    float _1848 = trunc(_1822);
    float _1850 = precise::max(_1848, 0.0);
    uint _1852 = uint(_1850);
    float _1854 = as_type<float>(_979) * _1840;
    int _1856 = ~_843;
    int _1858 = _1856 + 1;
    float _1860 = as_type<float>(_1019) * _1842;
    int _1862 = ~_843;
    int _1864 = _1862 + 1;
    int _1866 = _1406 * _1830;
    int _1868 = _1866 + _1846;
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16777216;
    bool _1872 = _1870 != 0;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 33554432;
    bool _1876 = _1874 != 0;
    float _1878 = trunc(_1854);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    int _1884 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 67108864;
    bool _1886 = _1884 != 0;
    int _1888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 134217728;
    bool _1890 = _1888 != 0;
    int _1892 = ~_899;
    int _1894 = _1892 + 1;
    int _1896 = _1858 * int(_1836);
    int _1898 = _1896 + _1542;
    float _1900 = float(uint(_1868));
    float _1902 = trunc(_1838);
    float _1904 = precise::max(_1902, 0.0);
    uint _1906 = uint(_1904);
    int _1908 = _1864 * int(_1852);
    int _1910 = _1908 + _1792;
    bool _1912 = !_1886;
    int _1914 = _1912 ? 0 : 1;
    bool _1916 = _1392 != 0;
    float _1918 = float(uint(_1910));
    float _1920 = float(uint(_1898));
    int _1922 = _1894 * int(_1882);
    int _1924 = _1922 + _1828;
    float _1926 = as_type<float>(_1019) * _1900;
    int _1928 = ~_899;
    int _1930 = _1928 + 1;
    float _1932 = as_type<float>(_999) * _1918;
    bool _1934 = !_1872;
    int _1936 = _1934 ? 0 : 1;
    float _1938 = trunc(_1860);
    float _1940 = precise::max(_1938, 0.0);
    uint _1942 = uint(_1940);
    bool _1944 = _919 == 0;
    int _1946 = _1930 * int(_1906);
    int _1948 = _1946 + _1568;
    int _1950 = ~_1798;
    int _1952 = _1950 + 1;
    int _1954 = _1952 + 1;
    float _1956 = as_type<float>(_999) * _1920;
    int _1958 = _919 + (-1);
    float _1960 = float(uint(_1948));
    float _1962 = trunc(_1926);
    float _1964 = precise::max(_1962, 0.0);
    uint _1966 = uint(_1964);
    float _1968 = float(uint(_1924));
    bool _1970 = !_1944;
    int _1972 = _1970 ? _1678 : (-1);
    float _1974 = as_type<float>(_979) * _1960;
    int _1976 = ~_929;
    int _1978 = _1976 + 1;
    float _1980 = as_type<float>(_979) * _1968;
    bool _1982 = !_1876;
    int _1984 = _1982 ? 0 : 1;
    float _1986 = trunc(_1932);
    float _1988 = precise::max(_1986, 0.0);
    uint _1990 = uint(_1988);
    int _1992 = _1954 * _1972;
    int _1994 = ~_929;
    int _1996 = _1994 + 1;
    bool _1998 = _843 == 0;
    int _2000 = _1798 * _1958;
    int _2002 = _2000 + _1992;
    float _2004 = trunc(_1980);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    int _2010 = abs(_1984);
    int _2012 = _1978 * int(_1942);
    int _2014 = _2012 + _1584;
    int _2016 = abs(_1936);
    int _2018 = _1996 * int(_1966);
    int _2020 = _2018 + _1868;
    int _2022 = int(_1852) + int(_1990);
    float _2024 = trunc(_1956);
    float _2026 = precise::max(_2024, 0.0);
    uint _2028 = uint(_2026);
    int _2030 = ~_843;
    int _2032 = _2030 + 1;
    int _2034 = _2002 * _2010;
    float _2036 = float(uint(_2014));
    float _2038 = float(uint(_2020));
    int _2040 = _2032 * _2022;
    int _2042 = _2040 + _1792;
    float _2044 = trunc(_1974);
    float _2046 = precise::max(_2044, 0.0);
    uint _2048 = uint(_2046);
    float _2050 = as_type<float>(_1019) * _2036;
    float _2052 = as_type<float>(_1019) * _2038;
    bool _2054 = !_1890;
    int _2056 = _2054 ? 0 : 1;
    int _2058 = _1560 * _2016;
    int _2060 = _2058 + _2034;
    bool _2062 = uint(_2042) >= uint(_843);
    int _2064 = int(_1882) + int(_2008);
    float _2066 = trunc(_2052);
    float _2068 = precise::max(_2066, 0.0);
    uint _2070 = uint(_2068);
    int _2072 = abs(_1914);
    int _2074 = abs(_2056);
    bool _2076 = !_2062;
    int _2078 = _2076 ? 0 : (-1);
    int _2080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2082 = _2080 != 0;
    int _2084 = ~_2022;
    int _2086 = _2084 + _2078;
    int _2088 = _2086 + 1;
    int _2090 = _1818 * _2072;
    int _2092 = _2090 + _2060;
    int _2094 = int(_1906) + int(_2048);
    int _2096 = ~_899;
    int _2098 = _2096 + 1;
    int _2100 = _843 * _2088;
    int _2102 = _2100 + _1792;
    int _2104 = int(_1836) + int(_2028);
    int _2106 = _1768 * _2074;
    int _2108 = _2106 + _2092;
    int _2110 = ~_843;
    int _2112 = _2110 + 1;
    int _2114 = _2098 * _2064;
    int _2116 = _2114 + _1828;
    bool _2118 = !_1998;
    int _2120 = _2118 ? _2102 : (-1);
    float _2122 = as_type<float>(_2088);
    float _2124 = as_type<float>(_2094);
    bool _2126 = _1944;
    if (!_2082)
    {
        _2122 = _225;
    }
    float _2128 = _2122;
    int _2130 = _2112 * _2104;
    int _2132 = _2130 + _1542;
    float _2134 = _2128;
    if (_2082)
    {
        float _2136 = -_225;
        float _2138 = _1916 ? _2136 : _225;
        _2134 = _2138;
    }
    float _2140 = _2134;
    int _2142 = _2120 & 3;
    bool _2144 = _2142 != 0;
    bool _2146 = uint(_2116) >= uint(_899);
    float _2148 = float(uint(_1818));
    int _2150 = _2144 ? 0 : 1;
    float _2152 = float(uint(_2108));
    float _2154 = as_type<float>(_1023) * _2148;
    bool _2156 = _2142 != 3;
    bool _2158 = uint(_2142) >= 2u;
    float _2160 = as_type<float>(_1023) * _2152;
    bool _2162 = !_2146;
    int _2164 = _2162 ? 0 : (-1);
    float _2166 = trunc(_2154);
    float _2168 = precise::max(_2166, 0.0);
    uint _2170 = uint(_2168);
    int _2172 = int(_1966) + int(_2070);
    int _2174 = ~_929;
    int _2176 = _2174 + 1;
    int _2178 = _2158 ? 0 : 1;
    int _2180 = ~_2064;
    int _2182 = _2180 + _2164;
    int _2184 = _2182 + 1;
    float _2186 = trunc(_2160);
    float _2188 = precise::max(_2186, 0.0);
    uint _2190 = uint(_2188);
    bool _2192 = uint(_2132) >= uint(_843);
    int _2194 = _2176 * _2172;
    int _2196 = _2194 + _1868;
    bool _2198 = uint(_2142) > 1u;
    int _2200 = _899 * _2184;
    int _2202 = _2200 + _1828;
    int _2204 = ~_2178;
    int _2206 = _2204 + 1;
    int _2208 = _2206 + 1;
    int _2210 = _2208;
    if (_2156)
    {
        int _2212 = ~_2178;
        int _2214 = _2212 + 1;
        _2210 = _2214;
    }
    int _2216 = _2210;
    float _2218 = trunc(_2050);
    float _2220 = precise::max(_2218, 0.0);
    uint _2222 = uint(_2220);
    bool _2224 = uint(_2196) >= uint(_929);
    bool _2226 = !_2192;
    int _2228 = _2226 ? 0 : (-1);
    int _2230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2232 = _2230 != 0;
    bool _2234 = !_1642;
    int _2236 = _2234 ? _2202 : (-1);
    int _2238 = ~_919;
    int _2240 = _2238 + 1;
    bool _2242 = !_2232;
    int _2244 = _2242 ? 0 : 1;
    int _2246 = ~_919;
    int _2248 = _2246 + 1;
    int _2250 = _2240 * int(_2170);
    int _2252 = _2250 + _1818;
    int _2254 = _2236 & 3;
    bool _2256 = _2254 != 0;
    int _2258 = ~_2150;
    int _2260 = _2258 + 1;
    int _2262 = _2260 + 1;
    int _2264 = _2248 * int(_2190);
    int _2266 = _2264 + _2108;
    int _2268 = _2262;
    if (!_2198)
    {
        int _2270 = ~_2150;
        int _2272 = _2270 + 1;
        _2268 = _2272;
    }
    int _2274 = _2268;
    int _2276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2278 = _2276 != 0;
    int _2280 = _2256 ? 0 : 1;
    bool _2282 = uint(_2254) >= 2u;
    float _2284 = float(uint(_2252));
    int _2286 = _2282 ? 0 : 1;
    float _2288 = float(uint(_2266));
    bool _2290 = _2254 != 3;
    float _2292 = as_type<float>(_2150);
    if (_2278)
    {
        float _2294 = in.m_64.x;
        _2292 = _2294;
    }
    float _2296 = _2292;
    bool _2298 = !_2224;
    int _2300 = _2298 ? 0 : (-1);
    int _2302 = ~_899;
    int _2304 = _2302 + 1;
    bool _2306 = uint(_2254) > 1u;
    int _2308 = ~_2172;
    int _2310 = _2308 + _2300;
    int _2312 = _2310 + 1;
    int _2314 = _2304 * _2094;
    int _2316 = _2314 + _1568;
    int _2318 = int(_1942) + int(_2222);
    float _2320 = as_type<float>(_1023) * _2284;
    float _2322 = as_type<float>(_1023) * _2288;
    int _2324 = _929 * _2312;
    int _2326 = _2324 + _1868;
    int _2328 = ~_2286;
    int _2330 = _2328 + 1;
    int _2332 = _2330 + 1;
    float _2334 = trunc(_2320);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = _2332;
    float _2342 = _2322;
    float _2344 = as_type<float>(_2316);
    if (_2290)
    {
        int _2346 = ~_2286;
        int _2348 = _2346 + 1;
        _2340 = _2348;
    }
    int _2350 = _2340;
    bool _2352 = uint(_2316) >= uint(_899);
    bool _2354 = !_1668;
    int _2356 = _2354 ? _2326 : (-1);
    int _2358 = ~_2280;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    float _2364 = trunc(_2322);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    int _2370 = _2362;
    if (!_2306)
    {
        int _2372 = ~_2280;
        int _2374 = _2372 + 1;
        _2370 = _2374;
    }
    int _2376 = _2370;
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2380 = _2378 != 0;
    bool _2382 = !_2352;
    int _2384 = _2382 ? 0 : (-1);
    int _2386 = _2356 & 3;
    bool _2388 = _2386 != 0;
    bool _2390 = !_2380;
    int _2392 = _2390 ? 0 : 1;
    if (_2278)
    {
        float _2394 = _2296 * 3.1415927410125732421875;
        _2342 = _2394;
    }
    float _2396 = _2342;
    bool _2398 = uint(_2386) >= 2u;
    int _2400 = ~_919;
    int _2402 = _2400 + 1;
    if (_2278)
    {
        float _2404 = _2396 * 0.15915493667125701904296875;
        _2344 = _2404;
    }
    float _2406 = _2344;
    int _2408 = _2398 ? 0 : 1;
    bool _2410 = uint(_2386) > 1u;
    int _2412 = int(_2190) + int(_2368);
    float _2414 = _2406;
    if (_2278)
    {
        float _2416 = _2406 * 6.283185482025146484375;
        float _2418 = sin(_2416);
        _2414 = _2418;
    }
    float _2420 = _2414;
    int _2422 = _2388 ? 0 : 1;
    bool _2424 = _2386 != 3;
    int _2426 = _2402 * _2412;
    int _2428 = _2426 + _2108;
    int _2430 = ~_2422;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    int _2436 = ~_929;
    int _2438 = _2436 + 1;
    int _2440 = _2434;
    if (!_2410)
    {
        int _2442 = ~_2422;
        int _2444 = _2442 + 1;
        _2440 = _2444;
    }
    int _2446 = _2440;
    bool _2448 = uint(_2428) >= uint(_919);
    int _2450 = _2438 * _2318;
    int _2452 = _2450 + _1584;
    int _2454 = ~_2104;
    int _2456 = _2454 + _2228;
    int _2458 = _2456 + 1;
    bool _2460 = !_2448;
    int _2462 = _2460 ? 0 : (-1);
    int _2464 = ~_2408;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    int _2470 = _843 * _2458;
    int _2472 = _2470 + _1542;
    int _2474 = ~_2412;
    int _2476 = _2474 + _2462;
    int _2478 = _2476 + 1;
    int _2480 = _2468;
    if (_2424)
    {
        int _2482 = ~_2408;
        int _2484 = _2482 + 1;
        _2480 = _2484;
    }
    int _2486 = _2480;
    bool _2488 = uint(_2452) >= uint(_929);
    int _2490 = _919 * _2478;
    int _2492 = _2490 + _2108;
    int _2494 = int(_2170) + int(_2338);
    int _2496 = ~_2094;
    int _2498 = _2496 + _2384;
    int _2500 = _2498 + 1;
    bool _2502 = !_2488;
    int _2504 = _2502 ? 0 : (-1);
    int _2506 = _2402 * _2494;
    int _2508 = _2506 + _1818;
    bool _2510 = _2488;
    if (_2278)
    {
        bool _2512 = _2420 > 0.5;
        _2510 = _2512;
    }
    bool _2514 = _2510;
    int _2516 = _899 * _2500;
    int _2518 = _2516 + _1568;
    bool _2520 = !_1998;
    int _2522 = _2520 ? _2472 : (-1);
    int _2524 = _2120 & 3;
    bool _2526 = _2524 != 0;
    bool _2528 = !_1944;
    int _2530 = _2528 ? _2492 : (-1);
    if (!_2278)
    {
        _2124 = _233;
    }
    float _2532 = _2124;
    float _2534 = _2532;
    if (_2278)
    {
        float _2536 = -_233;
        float _2538 = _2514 ? _2536 : _233;
        _2534 = _2538;
    }
    float _2540 = _2534;
    int _2542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 33554432;
    bool _2544 = _2542 != 0;
    bool _2546 = !_2526;
    int _2548 = _2546 ? 0 : 1;
    int _2550 = _2530 & 3;
    bool _2552 = _2550 != 0;
    bool _2554 = !_1642;
    int _2556 = _2554 ? _2518 : (-1);
    int _2558 = _2236 & 3;
    bool _2560 = _2558 != 0;
    bool _2562 = !_2544;
    int _2564 = _2562 ? 0 : 1;
    bool _2566 = _2550 != 3;
    int _2568 = ~_2318;
    int _2570 = _2568 + _2504;
    int _2572 = _2570 + 1;
    bool _2574 = !_2560;
    int _2576 = _2574 ? 0 : 1;
    bool _2578 = uint(_2550) >= 2u;
    int _2580 = _929 * _2572;
    int _2582 = _2580 + _1584;
    int _2584 = _2578 ? 0 : 1;
    bool _2586 = uint(_2550) > 1u;
    float _2588 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2590 = _2588 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _2592 = ~_2584;
    int _2594 = _2592 + 1;
    int _2596 = _2594 + 1;
    int _2598 = _2596;
    if (_2566)
    {
        int _2600 = ~_2584;
        int _2602 = _2600 + 1;
        _2598 = _2602;
    }
    int _2604 = _2598;
    float _2606 = in.m_46.x;
    float _2608 = in.m_46.y;
    float _2610 = in.m_46.z;
    bool _2612 = !_1668;
    int _2614 = _2612 ? _2582 : (-1);
    float _2616 = 1.0 / _2590;
    int _2618 = _2356 & 3;
    bool _2620 = _2618 != 0;
    int _2622 = _2552 ? 0 : 1;
    bool _2624 = !_2620;
    int _2626 = _2624 ? 0 : 1;
    float _2628 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2630 = _2628 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 67108864;
    bool _2634 = _2632 != 0;
    bool _2636 = _2142 != 3;
    float _2638 = 1.0 / _2630;
    int _2640 = ~_2622;
    int _2642 = _2640 + 1;
    int _2644 = _2642 + 1;
    float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2648 = _2646 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2650 = _2644;
    if (!_2586)
    {
        int _2652 = ~_2622;
        int _2654 = _2652 + 1;
        _2650 = _2654;
    }
    int _2656 = _2650;
    bool _2658 = !_2634;
    int _2660 = _2658 ? 0 : 1;
    float _2662 = _185 * _2608;
    float _2664 = _191 * _2608;
    bool _2666 = !_2636;
    int _2668 = _2666 ? 0 : (-1);
    float _2670 = _197 * _2608;
    bool _2672 = uint(_2508) >= uint(_919);
    float _2674 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2676 = _2674 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2678 = _2254 != 3;
    float _2680 = fma(_195, _2606, _2670);
    bool _2682 = _2386 != 3;
    float _2684 = fma(_183, _2606, _2662);
    bool _2686 = _2550 != 3;
    float _2688 = 1.0 / _2648;
    int _2690 = _2530 & 3;
    bool _2692 = _2690 != 0;
    float _2694 = fma(_189, _2606, _2664);
    float _2696 = fma(_187, _2610, _2684);
    bool _2698 = !_2678;
    int _2700 = _2698 ? 0 : (-1);
    float _2702 = fma(_193, _2610, _2694);
    bool _2704 = !_2682;
    int _2706 = _2704 ? 0 : (-1);
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2712 = !_2686;
    int _2714 = _2712 ? 0 : (-1);
    bool _2716 = !_2692;
    int _2718 = _2716 ? 0 : 1;
    float _2720 = 1.0 / _2710;
    bool _2722 = !_2672;
    int _2724 = _2722 ? 0 : (-1);
    int _2726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2728 = _2726 != 0;
    int _2730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2732 = _2730 != 0;
    int _2734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _2736 = _2734 != 0;
    int _2738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2740 = _2738 != 0;
    int _2742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2744 = _2742 != 0;
    int _2746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2748 = _2746 != 0;
    float _2750 = 1.0 / _2676;
    float _2752 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2754 = _2752 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2756 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2758 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2756;
    float _2760 = fma(_199, _2610, _2680);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2764 = _2762 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2766 = _2758 * _2638;
    float _2768 = 1.0 / _2754;
    float _2770 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2774;
    float _2778 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2780 = _2778 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2782 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2782;
    float _2786 = _2776 * _2616;
    float _2788 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2790 = _791 + _2788;
    float _2792 = 1.0 / _2764;
    float _2794 = _2780 * _2688;
    float _2796 = _2784 * _2750;
    float _2798 = fma(_2766, _2790, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2802 = _791 + _2800;
    float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2806 = _791 + _2804;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2810 = _791 + _2808;
    float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2814 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2812;
    float _2816 = _2772 * _2768;
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2820 = _2818 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2822 = fma(_2796, _2806, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    int _2824 = _2236 >> 31;
    float _2826 = fma(_2816, _2810, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2828 = _2820 * _2720;
    float _2830 = fma(_2794, _2802, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    int _2832 = _2120 >> 31;
    float _2834 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2836 = _791 + _2834;
    int _2838 = _2356 >> 31;
    float _2840 = _2814 * _2792;
    int _2842 = _2832 & 3;
    float _2844 = fma(_2828, _2836, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2846 = _2824 & 3;
    float _2848 = fma(_2786, _1720, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    int _2850 = _2120 + _2842;
    float _2852 = _2760 + _1210;
    int _2854 = _2838 & 3;
    int _2856 = _2850 >> 2;
    int _2858 = _2530 >> 31;
    int _2860 = _2856 << 4;
    int _2862 = _2860 + 656;
    int _2864 = _2236 + _2846;
    int _2866 = _2858 & 3;
    int _2868 = _2356 + _2854;
    uint _2870 = uint(int(uint(_2862) >> uint(2)));
    uint _2872 = uint(int(uint(int(_2870)) >> uint(2)));
    int _2874 = int(_2870) & 3;
    float _2876 = (*spvDescriptorSet0.vp_c9)._m0[int(_2872)][_2874];
    int _2878 = int(_2870) + 1;
    uint _2880 = uint(int(uint(_2878) >> uint(2)));
    int _2882 = _2878 & 3;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[int(_2880)][_2882];
    bool _2886 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2888 = isnan(_791);
    bool _2890 = _2886 || _2888;
    bool _2892 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2894 = _2890 || _2892;
    float _2896 = float(_2894);
    bool _2898 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2900 = isnan(_791);
    bool _2902 = _2898 || _2900;
    bool _2904 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2906 = _2902 || _2904;
    float _2908 = float(_2906);
    int _2910 = _2864 >> 2;
    float _2912 = -_2896;
    float _2914 = _2912 + 1.0;
    bool _2916 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2918 = isnan(_791);
    bool _2920 = _2916 || _2918;
    bool _2922 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2924 = _2920 || _2922;
    float _2926 = float(_2924);
    float _2928 = -_2908;
    float _2930 = _2928 + 1.0;
    int _2932 = _2910 << 4;
    int _2934 = _2932 + 800;
    float _2936 = _2908 * _2914;
    int _2938 = _2530 + _2866;
    float _2940 = _2926 * _2930;
    int _2942 = _2868 >> 2;
    float _2944 = -_2926;
    float _2946 = _2944 + 1.0;
    uint _2948 = uint(int(uint(_2934) >> uint(2)));
    uint _2950 = uint(int(uint(int(_2948)) >> uint(2)));
    int _2952 = int(_2948) & 3;
    float _2954 = (*spvDescriptorSet0.vp_c9)._m0[int(_2950)][_2952];
    int _2956 = int(_2948) + 1;
    uint _2958 = uint(int(uint(_2956) >> uint(2)));
    int _2960 = _2956 & 3;
    float _2962 = (*spvDescriptorSet0.vp_c9)._m0[int(_2958)][_2960];
    bool _2964 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2966 = isnan(_791);
    bool _2968 = _2964 || _2966;
    bool _2970 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2972 = _2968 || _2970;
    float _2974 = float(_2972);
    int _2976 = _2938 >> 2;
    float _2978 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2980 = _791 + _2978;
    bool _2982 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2984 = isnan(_791);
    bool _2986 = _2982 || _2984;
    bool _2988 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2990 = _2986 || _2988;
    float _2992 = float(_2990);
    float _2994 = -_2974;
    float _2996 = _2994 + 1.0;
    int _2998 = _2976 << 4;
    int _3000 = _2998 + 1088;
    float _3002 = _2974 * _2946;
    int _3004 = _2942 << 4;
    int _3006 = _3004 + 944;
    float _3008 = _1222 * _2996;
    uint _3010 = uint(int(uint(_3000) >> uint(2)));
    uint _3012 = uint(int(uint(int(_3010)) >> uint(2)));
    int _3014 = int(_3010) & 3;
    float _3016 = (*spvDescriptorSet0.vp_c9)._m0[int(_3012)][_3014];
    int _3018 = int(_3010) + 1;
    uint _3020 = uint(int(uint(_3018) >> uint(2)));
    int _3022 = _3018 & 3;
    float _3024 = (*spvDescriptorSet0.vp_c9)._m0[int(_3020)][_3022];
    float _3026 = _2992 * _1248;
    float _3028 = -_2992;
    float _3030 = _3028 + 1.0;
    float _3032 = fma(_2840, _2980, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3034 = _2702 + _1196;
    bool _3036 = _791 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3038 = isnan(_791);
    bool _3040 = _3036 || _3038;
    bool _3042 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3044 = _3040 || _3042;
    float _3046 = float(_3044);
    float _3048 = _1236 * _3030;
    float _3050 = -_1236;
    float _3052 = _3050 + 1.0;
    uint _3054 = uint(int(uint(_3006) >> uint(2)));
    uint _3056 = uint(int(uint(int(_3054)) >> uint(2)));
    int _3058 = int(_3054) & 3;
    float _3060 = (*spvDescriptorSet0.vp_c9)._m0[int(_3056)][_3058];
    int _3062 = int(_3054) + 1;
    uint _3064 = uint(int(uint(_3062) >> uint(2)));
    int _3066 = _3062 & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = abs(_2274);
    float _3072 = _2696 + _1238;
    float _3074 = _3046 * _3052;
    int _3076 = abs(_2376);
    float _3078 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3080 = int(_3078);
    float _3082 = _2798 * _3074;
    int _3084 = _2862 + 8;
    uint _3086 = uint(int(uint(_3084) >> uint(2)));
    uint _3088 = uint(int(uint(int(_3086)) >> uint(2)));
    int _3090 = int(_3086) & 3;
    float _3092 = (*spvDescriptorSet0.vp_c9)._m0[int(_3088)][_3090];
    int _3094 = int(_3086) + 1;
    uint _3096 = uint(int(uint(_3094) >> uint(2)));
    int _3098 = _3094 & 3;
    float _3100 = (*spvDescriptorSet0.vp_c9)._m0[int(_3096)][_3098];
    int _3102 = ~_2494;
    int _3104 = _3102 + _2724;
    int _3106 = _3104 + 1;
    float _3108 = -_3046;
    float _3110 = _3108 + 1.0;
    int _3112 = abs(_2446);
    int _3114 = ~_3070;
    int _3116 = _3114 + 1;
    int _3118 = _3116 + 1;
    int _3120 = _919 * _3106;
    int _3122 = _3120 + _1818;
    int _3124 = abs(_2548);
    int _3126 = _3006 + 8;
    uint _3128 = uint(int(uint(_3126) >> uint(2)));
    uint _3130 = uint(int(uint(int(_3128)) >> uint(2)));
    int _3132 = int(_3128) & 3;
    float _3134 = (*spvDescriptorSet0.vp_c9)._m0[int(_3130)][_3132];
    int _3136 = int(_3128) + 1;
    uint _3138 = uint(int(uint(_3136) >> uint(2)));
    int _3140 = _3136 & 3;
    float _3142 = (*spvDescriptorSet0.vp_c9)._m0[int(_3138)][_3140];
    int _3144 = ~_3076;
    int _3146 = _3144 + 1;
    int _3148 = _3146 + 1;
    int _3150 = _3118 * as_type<int>(_2884);
    int _3152 = abs(_2656);
    float _3154 = trunc((*spvDescriptorSet0.vp_c9)._m0[100].z);
    int _3156 = int(_3154);
    int _3158 = abs(_2576);
    float _3160 = fma(_3110, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3082);
    int _3162 = _2934 + 8;
    uint _3164 = uint(int(uint(_3162) >> uint(2)));
    uint _3166 = uint(int(uint(int(_3164)) >> uint(2)));
    int _3168 = int(_3164) & 3;
    float _3170 = (*spvDescriptorSet0.vp_c9)._m0[int(_3166)][_3168];
    int _3172 = int(_3164) + 1;
    uint _3174 = uint(int(uint(_3172) >> uint(2)));
    int _3176 = _3172 & 3;
    float _3178 = (*spvDescriptorSet0.vp_c9)._m0[int(_3174)][_3176];
    int _3180 = ~_3158;
    int _3182 = _3180 + 1;
    int _3184 = _3182 + 1;
    float _3186 = fma(_2826, _3048, _3160);
    int _3188 = ~_3112;
    int _3190 = _3188 + 1;
    int _3192 = _3190 + 1;
    float _3194 = trunc((*spvDescriptorSet0.vp_c9)._m0[105].z);
    int _3196 = int(_3194);
    int _3198 = _3148 * as_type<int>(_2962);
    int _3200 = ~_3152;
    int _3202 = _3200 + 1;
    int _3204 = _3202 + 1;
    float _3206 = fma(_2848, _3026, _3186);
    int _3208 = _3000 + 8;
    uint _3210 = uint(int(uint(_3208) >> uint(2)));
    uint _3212 = uint(int(uint(int(_3210)) >> uint(2)));
    int _3214 = int(_3210) & 3;
    float _3216 = (*spvDescriptorSet0.vp_c9)._m0[int(_3212)][_3214];
    int _3218 = int(_3210) + 1;
    uint _3220 = uint(int(uint(_3218) >> uint(2)));
    int _3222 = _3218 & 3;
    float _3224 = (*spvDescriptorSet0.vp_c9)._m0[int(_3220)][_3222];
    int _3226 = _3184 * as_type<int>(_2954);
    int _3228 = _3226 + _3198;
    int _3230 = abs(_2718);
    float _3232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3234 = _3072 + _3232;
    int _3236 = abs(_2486);
    float _3238 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3240 = log2(_3238);
    int _3242 = ~_3124;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    float _3248 = as_type<float>(_2486);
    bool _3250 = _2728;
    if (_2736)
    {
        float _3252 = in.m_64.x;
        _3248 = _3252;
    }
    float _3254 = _3248;
    int _3256 = ~_3230;
    int _3258 = _3256 + 1;
    int _3260 = _3258 + 1;
    int _3262 = _3204 * as_type<int>(_3024);
    int _3264 = abs(_2668);
    int _3266 = _3246 * as_type<int>(_2876);
    int _3268 = _3266 + _3150;
    int _3270 = abs(_2626);
    int _3272 = _3260 * as_type<int>(_3016);
    int _3274 = _3272 + _3262;
    float _3276 = float(uint(_3080));
    int _3278 = abs(_2216);
    int _3280 = _3192 * as_type<int>(_3068);
    int _3282 = abs(_2604);
    float _3284 = 1.0 / _3276;
    int _3286 = ~_3270;
    int _3288 = _3286 + 1;
    int _3290 = _3288 + 1;
    float _3292 = as_type<float>(_2604);
    if (_2732)
    {
        float _3294 = in.m_64.w;
        _3292 = _3294;
    }
    float _3296 = _3292;
    int _3298 = ~_3278;
    int _3300 = _3298 + 1;
    int _3302 = _3300 + 1;
    float _3304 = _3240 * _153;
    int _3306 = ~_3236;
    int _3308 = _3306 + 1;
    int _3310 = _3308 + 1;
    int _3312 = _3290 * as_type<int>(_3060);
    int _3314 = _3312 + _3280;
    int _3316 = abs(_2706);
    int _3318 = _3302 * as_type<int>(_3092);
    int _3320 = _3318 + _3268;
    float _3322 = _3276;
    float _3324 = _3142;
    if (_2728)
    {
        float _3326 = in.m_64.z;
        _3322 = _3326;
    }
    float _3328 = _3322;
    int _3330 = abs(_2350);
    float _3332 = exp2(_3304);
    int _3334 = ~_3264;
    int _3336 = _3334 + 1;
    int _3338 = _3336 + 1;
    int _3340 = _3310 * as_type<int>(_3134);
    int _3342 = _3340 + _3314;
    int _3344 = ~_3316;
    int _3346 = _3344 + 1;
    int _3348 = _3346 + 1;
    int _3350 = ~_3330;
    int _3352 = _3350 + 1;
    int _3354 = _3352 + 1;
    int _3356 = _3338 * as_type<int>(_3100);
    int _3358 = _3356 + _3320;
    int _3360 = abs(_2700);
    int _3362 = _3348 * as_type<int>(_3142);
    int _3364 = _3362 + _3342;
    float _3366 = float(uint(_1620));
    float _3368 = as_type<float>(_3348);
    float _3370 = as_type<float>(_3338);
    if (_2736)
    {
        float _3372 = _3254 * 3.1415927410125732421875;
        _3368 = _3372;
    }
    float _3374 = _3368;
    int _3376 = abs(_2244);
    int _3378 = _3354 * as_type<int>(_3170);
    int _3380 = _3378 + _3228;
    int _3382 = ~_3360;
    int _3384 = _3382 + 1;
    int _3386 = _3384 + 1;
    int _3388 = abs(_2392);
    float _3390 = 1.0 / _3366;
    int _3392 = abs(_2564);
    int _3394 = _3386 * as_type<int>(_3178);
    int _3396 = _3394 + _3380;
    int _3398 = abs(_2714);
    float _3400 = _3296;
    float _3402 = as_type<float>(_3380);
    if (_2732)
    {
        float _3404 = _3296 * 3.1415927410125732421875;
        _3400 = _3404;
    }
    float _3406 = _3400;
    float _3408 = _3328;
    if (_2728)
    {
        float _3410 = _3328 * 3.1415927410125732421875;
        _3408 = _3410;
    }
    float _3412 = _3408;
    int _3414 = ~_3282;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    if (_2732)
    {
        float _3420 = _3406 * 0.15915493667125701904296875;
        _3370 = _3420;
    }
    float _3422 = _3370;
    if (_2736)
    {
        float _3424 = _3374 * 0.15915493667125701904296875;
        _3402 = _3424;
    }
    float _3426 = _3402;
    int _3428 = ~_3376;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    int _3434 = _3418 * as_type<int>(_3216);
    int _3436 = _3434 + _3274;
    int _3438 = ~_3398;
    int _3440 = _3438 + 1;
    int _3442 = _3440 + 1;
    if (_2728)
    {
        float _3444 = _3412 * 0.15915493667125701904296875;
        _3324 = _3444;
    }
    float _3446 = _3324;
    float _3448 = float(uint(_3156));
    int _3450 = _3432 * _3358;
    int _3452 = ~_3392;
    int _3454 = _3452 + 1;
    int _3456 = _3454 + 1;
    int _3458 = _3442 * as_type<int>(_3224);
    int _3460 = _3458 + _3436;
    int _3462 = ~_3388;
    int _3464 = _3462 + 1;
    int _3466 = _3464 + 1;
    int _3468 = _2522 * _3376;
    int _3470 = _3468 + _3450;
    float _3472 = 1.0 / _3448;
    int _3474 = abs(_1620);
    int _3476 = _3456 * _3364;
    float _3478 = float(uint(_3196));
    int _3480 = _3466 * _3396;
    int _3482 = as_type<int>(_3390) + (-2);
    int _3484 = _2614 * _3392;
    int _3486 = _3484 + _3476;
    float _3488 = float(uint(_3470));
    float _3490 = _3446;
    if (_2728)
    {
        float _3492 = _3446 * 6.283185482025146484375;
        float _3494 = sin(_3492);
        _3490 = _3494;
    }
    float _3496 = _3490;
    float _3498 = float(uint(_3474));
    int _3500 = _2556 * _3388;
    int _3502 = _3500 + _3480;
    int _3504 = abs(_2660);
    float _3506 = as_type<float>(_3482) * _3488;
    bool _3508 = !_1944;
    int _3510 = _3508 ? _3122 : (-1);
    float _3512 = _1110 * 2.0;
    int _3514 = ~_3504;
    int _3516 = _3514 + 1;
    int _3518 = _3516 + 1;
    float _3520 = 1.0 / _3478;
    int _3522 = abs(_3080);
    float _3524 = -_3332;
    float _3526 = _3524 + 1.0;
    int _3528 = abs(_3196);
    int _3530 = _3518 * _3460;
    int _3532 = as_type<int>(_3472) + (-2);
    float _3534 = float(uint(_3486));
    float _3536 = 1.0 / _3498;
    float _3538 = float(uint(_3522));
    int _3540 = _3510 * _3504;
    int _3542 = _3540 + _3530;
    int _3544 = abs(_3156);
    float _3546 = as_type<float>(_3532) * _3534;
    int _3548 = ~_1620;
    int _3550 = _3548 + 1;
    float _3552 = trunc(_3506);
    float _3554 = precise::max(_3552, 0.0);
    uint _3556 = uint(_3554);
    float _3558 = as_type<float>(_3530);
    if (_2728)
    {
        bool _3560 = _3496 > 0.5;
        _2126 = _3560;
    }
    bool _3562 = _2126;
    float _3564 = float(uint(_3544));
    int _3566 = as_type<int>(_3520) + (-2);
    float _3568 = float(uint(_3542));
    float _3570 = _3422;
    bool _3572 = _3562;
    if (_2732)
    {
        float _3574 = _3422 * 6.283185482025146484375;
        float _3576 = sin(_3574);
        _3570 = _3576;
    }
    float _3578 = _3570;
    float _3580 = float(uint(_3528));
    int _3582 = abs(_3470);
    int _3584 = as_type<int>(_3284) + (-2);
    float _3586 = 1.0 / _3538;
    float _3588 = float(uint(_3502));
    int _3590 = _3550 * int(_3556);
    int _3592 = _3590 + _3470;
    int _3594 = as_type<int>(_3536) + (-2);
    float _3596 = as_type<float>(_3566) * _3568;
    float _3598 = as_type<float>(_3584) * _3588;
    int _3600 = abs(_3502);
    float _3602 = as_type<float>(_3442);
    if (_2736)
    {
        float _3604 = _3426 * 6.283185482025146484375;
        float _3606 = sin(_3604);
        _3602 = _3606;
    }
    float _3608 = _3602;
    float _3610 = float(uint(_3582));
    if (!_2728)
    {
        _3558 = _225;
    }
    float _3612 = _3558;
    float _3614 = _3612;
    if (_2728)
    {
        float _3616 = -_225;
        float _3618 = _3562 ? _3616 : _225;
        _3614 = _3618;
    }
    float _3620 = _3614;
    if (_2732)
    {
        bool _3622 = _3578 > 0.5;
        _3572 = _3622;
    }
    bool _3624 = _3572;
    float _3626 = 1.0 / _3564;
    float _3628 = float(uint(_3592));
    int _3630 = as_type<int>(_3586) + (-2);
    float _3632 = as_type<float>(_3482) * _3628;
    float _3634 = float(uint(_3600));
    float _3636 = 1.0 / _3580;
    if (_2736)
    {
        bool _3638 = _3608 > 0.5;
        _3250 = _3638;
    }
    bool _3640 = _3250;
    int _3642 = abs(_3542);
    float _3644 = as_type<float>(_3630) * _3634;
    int _3646 = ~_3080;
    int _3648 = _3646 + 1;
    int _3650 = ~_3156;
    int _3652 = _3650 + 1;
    float _3654 = trunc(_3598);
    float _3656 = precise::max(_3654, 0.0);
    uint _3658 = uint(_3656);
    int _3660 = as_type<int>(_3626) + (-2);
    float _3662 = float(uint(_3642));
    int _3664 = ~_3196;
    int _3666 = _3664 + 1;
    int _3668 = ~_3474;
    int _3670 = _3668 + 1;
    float _3672 = trunc(_3546);
    float _3674 = precise::max(_3672, 0.0);
    uint _3676 = uint(_3674);
    int _3678 = as_type<int>(_3636) + (-2);
    int _3680 = ~_3528;
    int _3682 = _3680 + 1;
    float _3684 = as_type<float>(_3678) * _3662;
    float _3686 = floor(_3512);
    float _3688 = as_type<float>(_3594) * _3610;
    int _3690 = abs(_3486);
    int _3692 = _3648 * int(_3658);
    int _3694 = _3692 + _3502;
    float _3696 = trunc(_3596);
    float _3698 = precise::max(_3696, 0.0);
    uint _3700 = uint(_3698);
    int _3702 = _3652 * int(_3676);
    int _3704 = _3702 + _3486;
    float _3706 = float(uint(_3690));
    float _3708 = float(uint(_3694));
    float _3710 = float(uint(_3704));
    float _3712 = as_type<float>(_3660) * _3706;
    float _3714 = _3706;
    float _3716 = _3686;
    if (!_2736)
    {
        _3714 = _225;
    }
    float _3718 = _3714;
    float _3720 = trunc(_3688);
    float _3722 = precise::max(_3720, 0.0);
    uint _3724 = uint(_3722);
    float _3726 = _3718;
    if (_2736)
    {
        float _3728 = -_225;
        float _3730 = _3640 ? _3728 : _225;
        _3726 = _3730;
    }
    float _3732 = _3726;
    float _3734 = as_type<float>(_3584) * _3708;
    bool _3736 = _1120 > 0.5;
    float _3738 = as_type<float>(_3532) * _3710;
    bool _3740 = _1122 > 0.5;
    float _3742 = -_233;
    int _3744 = _3736 ? as_type<int>(_3742) : as_type<int>(_233);
    int _3746 = _3666 * int(_3700);
    int _3748 = _3746 + _3542;
    bool _3750 = _3686 >= 0.0;
    bool _3752 = isnan(_3686);
    bool _3754 = _3750 || _3752;
    bool _3756 = isnan(0.0);
    bool _3758 = _3754 || _3756;
    float _3760 = trunc(_3632);
    float _3762 = precise::max(_3760, 0.0);
    uint _3764 = uint(_3762);
    int _3766 = ~_3522;
    int _3768 = _3766 + 1;
    int _3770 = _3758 ? 0 : 1;
    bool _3772 = _3686 > 0.0;
    float _3774 = float(uint(_3748));
    float _3776 = trunc(_3712);
    float _3778 = precise::max(_3776, 0.0);
    uint _3780 = uint(_3778);
    int _3782 = _3670 * int(_3724);
    int _3784 = _3782 + _3582;
    int _3786 = ~_3770;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    float _3792 = -_225;
    int _3794 = _3740 ? as_type<int>(_3792) : as_type<int>(_225);
    float _3796 = float(uint(_3784));
    float _3798 = trunc(_3644);
    float _3800 = precise::max(_3798, 0.0);
    uint _3802 = uint(_3800);
    bool _3804 = _1124 != 1;
    int _3806 = _3790;
    if (!_3772)
    {
        int _3808 = ~_3770;
        int _3810 = _3808 + 1;
        _3806 = _3810;
    }
    int _3812 = _3806;
    float _3814 = as_type<float>(_3566) * _3774;
    float _3816 = as_type<float>(_3594) * _3796;
    int _3818 = ~_3544;
    int _3820 = _3818 + 1;
    float _3822 = trunc(_3684);
    float _3824 = precise::max(_3822, 0.0);
    uint _3826 = uint(_3824);
    int _3828 = int(_3556) + int(_3764);
    bool _3830 = !_2748;
    float _3832 = _3830 ? _233 : as_type<float>(_3744);
    float _3834 = trunc(_3734);
    float _3836 = precise::max(_3834, 0.0);
    uint _3838 = uint(_3836);
    int _3840 = _3820 * int(_3780);
    int _3842 = _3840 + _3690;
    int _3844 = _3768 * int(_3802);
    int _3846 = _3844 + _3600;
    int _3848 = ~_1620;
    int _3850 = _3848 + 1;
    float _3852 = float(uint(_3842));
    float _3854 = trunc(_3738);
    float _3856 = precise::max(_3854, 0.0);
    uint _3858 = uint(_3856);
    int _3860 = _3682 * int(_3826);
    int _3862 = _3860 + _3642;
    float _3864 = float(uint(_3846));
    float _3866 = as_type<float>(_3660) * _3852;
    int _3868 = ~_3080;
    int _3870 = _3868 + 1;
    float _3872 = float(uint(_3862));
    float _3874 = trunc(_3814);
    float _3876 = precise::max(_3874, 0.0);
    uint _3878 = uint(_3876);
    int _3880 = int(_3658) + int(_3838);
    float _3882 = as_type<float>(_3630) * _3864;
    float _3884 = as_type<float>(_3678) * _3872;
    if (_1202)
    {
        _3716 = _1110;
    }
    float _3886 = _3716;
    int _3888 = _3870 * _3880;
    int _3890 = _3888 + _3502;
    float _3892 = _3886;
    if (!_1202)
    {
        _3892 = _1120;
    }
    float _3894 = _3892;
    float _3896 = trunc(_3816);
    float _3898 = precise::max(_3896, 0.0);
    uint _3900 = uint(_3898);
    int _3902 = int(_3676) + int(_3858);
    int _3904 = _3850 * _3828;
    int _3906 = _3904 + _3470;
    int _3908 = ~_3544;
    int _3910 = _3908 + 1;
    float _3912 = trunc(_3866);
    float _3914 = precise::max(_3912, 0.0);
    uint _3916 = uint(_3914);
    int _3918 = int(_3700) + int(_3878);
    float _3920 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    bool _3922 = !_3804;
    float _3924 = _3922 ? as_type<float>(_1126) : as_type<float>(_1128);
    float _3926 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _3928 = !_2744;
    float _3930 = _3928 ? _225 : as_type<float>(_3794);
    int _3932 = ~_3196;
    int _3934 = _3932 + 1;
    float _3936 = trunc(_3882);
    float _3938 = precise::max(_3936, 0.0);
    uint _3940 = uint(_3938);
    int _3942 = int(_3724) + int(_3900);
    bool _3944 = !_3804;
    float _3946 = _3944 ? as_type<float>(_1130) : as_type<float>(_1126);
    bool _3948 = uint(_3890) >= uint(_3080);
    bool _3950 = uint(_3906) >= uint(_1620);
    float _3952 = trunc(_3884);
    float _3954 = precise::max(_3952, 0.0);
    uint _3956 = uint(_3954);
    int _3958 = ~_3156;
    int _3960 = _3958 + 1;
    int _3962 = int(_3780) + int(_3916);
    int _3964 = _3960 * _3902;
    int _3966 = _3964 + _3486;
    int _3968 = ~_3528;
    int _3970 = _3968 + 1;
    int _3972 = _3910 * _3962;
    int _3974 = _3972 + _3690;
    bool _3976 = !_3950;
    int _3978 = _3976 ? 0 : (-1);
    int _3980 = _3934 * _3918;
    int _3982 = _3980 + _3542;
    bool _3984 = uint(_3966) >= uint(_3156);
    int _3986 = ~_3474;
    int _3988 = _3986 + 1;
    int _3990 = int(_3802) + int(_3940);
    float _3992 = _1224 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _3994 = int(_3826) + int(_3956);
    int _3996 = _3988 * _3942;
    int _3998 = _3996 + _3582;
    float _4000 = as_type<float>(_3906);
    if (_1202)
    {
        _4000 = _1122;
    }
    float _4002 = _4000;
    int _4004 = ~_3522;
    int _4006 = _4004 + 1;
    int _4008 = _3970 * _3994;
    int _4010 = _4008 + _3642;
    bool _4012 = uint(_3998) >= uint(_3474);
    bool _4014 = !_1202;
    float _4016 = _4014 ? as_type<float>(_1130) : as_type<float>(_1128);
    float _4018 = as_type<float>(_3474);
    float _4020 = _4002;
    if (_2740)
    {
        float _4022 = in.m_64.y;
        _4018 = _4022;
    }
    float _4024 = _4018;
    bool _4026 = !_1202;
    float _4028 = _4026 ? as_type<float>(_1128) : as_type<float>(_1126);
    int _4030 = _4006 * _3990;
    int _4032 = _4030 + _3600;
    if (!_1202)
    {
        _4020 = _1110;
    }
    float _4034 = _4020;
    bool _4036 = uint(_3982) >= uint(_3196);
    int _4038 = ~_3828;
    int _4040 = _4038 + _3978;
    int _4042 = _4040 + 1;
    float _4044 = _4034 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _4046 = !_3984;
    int _4048 = _4046 ? 0 : (-1);
    bool _4050 = !_4036;
    int _4052 = _4050 ? 0 : (-1);
    float _4054 = fma(_4044, -2.0, _3926);
    bool _4056 = !_3948;
    int _4058 = _4056 ? 0 : (-1);
    bool _4060 = uint(_3974) >= uint(_3544);
    int _4062 = _1620 * _4042;
    int _4064 = _4062 + _3470;
    bool _4066 = uint(_4010) >= uint(_3528);
    float _4068 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4054);
    int _4070 = _3470 ^ _1620;
    float _4072 = _1122 * 2.0;
    bool _4074 = uint(_4032) >= uint(_3522);
    int _4076 = _3502 ^ _3080;
    float _4078 = _4024;
    if (_2740)
    {
        float _4080 = _4024 * 3.1415927410125732421875;
        _4078 = _4080;
    }
    float _4082 = _4078;
    int _4084 = ~_3880;
    int _4086 = _4084 + _4058;
    int _4088 = _4086 + 1;
    float _4090 = floor(_4072);
    bool _4092 = !_4074;
    int _4094 = _4092 ? 0 : (-1);
    float _4096 = _4082;
    if (_2740)
    {
        float _4098 = _4082 * 0.15915493667125701904296875;
        _4096 = _4098;
    }
    float _4100 = _4096;
    uint _4102 = uint(int(uint(_4076) >> uint(31)));
    int _4104 = _3080 * _4088;
    int _4106 = _4104 + _3502;
    bool _4108 = !_4012;
    int _4110 = _4108 ? 0 : (-1);
    int _4112 = ~_3902;
    int _4114 = _4112 + _4048;
    int _4116 = _4114 + 1;
    float _4118 = _4100;
    if (_2740)
    {
        float _4120 = _4100 * 6.283185482025146484375;
        float _4122 = sin(_4120);
        _4118 = _4122;
    }
    float _4124 = _4118;
    bool _4126 = !_4066;
    int _4128 = _4126 ? 0 : (-1);
    bool _4130 = _3080 == 0;
    int _4132 = _3156 * _4116;
    int _4134 = _4132 + _3486;
    int _4136 = ~_3918;
    int _4138 = _4136 + _4052;
    int _4140 = _4138 + 1;
    uint _4142 = uint(int(uint(_4070) >> uint(31)));
    int _4144 = ~_4094;
    int _4146 = _3990 + _4144;
    int _4148 = _4146 + 1;
    int _4150 = _3196 * _4140;
    int _4152 = _4150 + _3542;
    int _4154 = ~int(_4102);
    int _4156 = _4154 + 1;
    float _4158 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4160 = _3034 + _4158;
    int _4162 = ~_4110;
    int _4164 = _3942 + _4162;
    int _4166 = _4164 + 1;
    bool _4168 = !_4130;
    int _4170 = _4168 ? _4106 : (-1);
    int _4172 = ~int(_4142);
    int _4174 = _4172 + 1;
    bool _4176 = _3156 == 0;
    int _4178 = _4148 ^ _4156;
    bool _4180 = _1620 == 0;
    bool _4182 = !_4060;
    int _4184 = _4182 ? 0 : (-1);
    int _4186 = _4166 ^ _4174;
    bool _4188 = _3080 == 0;
    bool _4190 = !_4176;
    int _4192 = _4190 ? _4134 : (-1);
    int _4194 = ~_4156;
    int _4196 = _4194 + _4178;
    int _4198 = _4196 + 1;
    bool _4200 = !_4180;
    int _4202 = _4200 ? _4064 : (-1);
    bool _4204 = _3196 == 0;
    bool _4206 = _3196 == 0;
    int _4208 = _3542 ^ _3196;
    bool _4210 = _1620 == 0;
    float _4212 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4214 = _2852 + _4212;
    int _4216 = ~_4174;
    int _4218 = _4216 + _4186;
    int _4220 = _4218 + 1;
    bool _4222 = !_4188;
    int _4224 = _4222 ? _4198 : (-1);
    bool _4226 = !_4204;
    int _4228 = _4226 ? _4152 : (-1);
    bool _4230 = _4090 > 0.0;
    bool _4232 = _3156 == 0;
    int _4234 = _3486 ^ _3156;
    bool _4236 = !_4210;
    int _4238 = _4236 ? _4220 : (-1);
    float _4240 = _1120 * 2.0;
    bool _4242 = _4090 >= 0.0;
    bool _4244 = isnan(_4090);
    bool _4246 = _4242 || _4244;
    bool _4248 = isnan(0.0);
    bool _4250 = _4246 || _4248;
    int _4252 = ~_4184;
    int _4254 = _3962 + _4252;
    int _4256 = _4254 + 1;
    float _4258 = floor(_4240);
    int _4260 = _4250 ? 0 : 1;
    uint _4262 = uint(int(uint(_4208) >> uint(31)));
    int _4264 = ~_4260;
    int _4266 = _4264 + 1;
    int _4268 = _4266 + 1;
    int _4270 = _4268;
    bool _4272 = _4250;
    if (!_4230)
    {
        int _4274 = ~_4260;
        int _4276 = _4274 + 1;
        _4270 = _4276;
    }
    int _4278 = _4270;
    uint _4280 = uint(int(uint(_4234) >> uint(31)));
    int _4282 = ~_4128;
    int _4284 = _3994 + _4282;
    int _4286 = _4284 + 1;
    float _4288 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _4290 = ~int(_4262);
    int _4292 = _4290 + 1;
    float _4294 = fma(as_type<float>(_1128), (*spvDescriptorSet0.vp_c9)._m0[93].z, _4288);
    int _4296 = ~int(_4280);
    int _4298 = _4296 + 1;
    float _4300 = as_type<float>(_1128) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    if (_2740)
    {
        bool _4302 = _4124 > 0.5;
        _4272 = _4302;
    }
    bool _4304 = _4272;
    float _4306 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _4308 = _4286 ^ _4292;
    float _4310 = _4160 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4312 = _4256 ^ _4298;
    float _4314 = -_4306;
    float _4316 = fma(_4300, 2.0, _4314);
    int _4318 = ~_4292;
    int _4320 = _4318 + _4308;
    int _4322 = _4320 + 1;
    float _4324 = _4160 * _4160;
    float _4326 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4310);
    int _4328 = ~_4298;
    int _4330 = _4328 + _4312;
    int _4332 = _4330 + 1;
    float _4334 = fma(_3234, _3234, _4324);
    bool _4336 = !_4206;
    int _4338 = _4336 ? _4322 : (-1);
    float _4340 = (*spvDescriptorSet0.vp_c9)._m0[103].z + (*spvDescriptorSet0.vp_c9)._m0[103].x;
    bool _4342 = !_4232;
    int _4344 = _4342 ? _4332 : (-1);
    float _4346 = fma(_4214, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4326);
    int _4348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4350 = _4348 != 0;
    int _4352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4354 = _4352 != 0;
    int _4356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4358 = _4356 != 0;
    float _4360 = fma(as_type<float>(_1128), (*spvDescriptorSet0.vp_c9)._m0[103].z, _4340);
    float _4362 = fma(_4214, _4214, _4334);
    float _4364 = fma(_2830, _3008, _3206);
    float _4366 = _1122 + _1120;
    bool _4368 = !_4354;
    int _4370 = _4368 ? 0 : 1;
    float _4372 = sqrt(_4362);
    bool _4374 = _4346 >= 0.0;
    float _4376 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _4378 = _4366 + (-1.0);
    float _4380 = _1110 + _1122;
    float _4382 = (*spvDescriptorSet0.vp_c9)._m0[103].w + (*spvDescriptorSet0.vp_c9)._m0[103].y;
    float _4384 = fma(as_type<float>(_1126), (*spvDescriptorSet0.vp_c9)._m0[93].w, _4376);
    float _4386 = fma(_4378, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _4388 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4390 = fma(as_type<float>(_1126), (*spvDescriptorSet0.vp_c9)._m0[103].w, _4382);
    float _4392 = as_type<float>(_1126) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _4394 = _4380 + (-1.0);
    float _4396 = _4378;
    if (_4374)
    {
        _4396 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4398 = _4396;
    float _4400 = fma(_2822, _3002, _4364);
    float _4402 = fma(_4392, -2.0, _4388);
    float _4404 = fma(_4394, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _4406 = _4372 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _4408 = as_type<int>(_4398);
    if (_4374)
    {
        float _4410 = _4398 * 5.0;
        _4408 = as_type<int>(_4410);
    }
    int _4412 = _4408;
    float _4414 = fma(_2844, _2940, _4400);
    float _4416 = precise::min(_3992, _4406);
    float _4418 = -_153;
    float _4420 = fma(_4418, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4316);
    if (_4374)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12146 = as_type<float>(_4412);
        out.gl_Position.z = _12146;
    }
    float _4422 = fma(_3032, _2936, _4414);
    bool _4424 = !_4350;
    int _4426 = _4424 ? 0 : 1;
    out.m_72.w = _4416;
    bool _4428 = _4258 >= 0.0;
    bool _4430 = isnan(_4258);
    bool _4432 = _4428 || _4430;
    bool _4434 = isnan(0.0);
    bool _4436 = _4432 || _4434;
    float _4438 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _4440 = fma(_2896, (*spvDescriptorSet0.vp_c9)._m0[166].x, _4422);
    float _4442 = fma(_3946, (*spvDescriptorSet0.vp_c9)._m0[98].w, _4438);
    int _4444 = _4436 ? 0 : 1;
    float _4446 = rsqrt(_4362);
    float _4448 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _4450 = _3946 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    bool _4452 = _4258 > 0.0;
    float _4454 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _4456 = (*spvDescriptorSet0.vp_c9)._m0[102].y + (*spvDescriptorSet0.vp_c9)._m0[101].w;
    float _4458 = fma(_4450, -2.0, _4448);
    float _4460 = _4016 * (*spvDescriptorSet0.vp_c9)._m0[102].x;
    float _4462 = _4028 * (*spvDescriptorSet0.vp_c9)._m0[102].y;
    float _4464 = fma(_3924, (*spvDescriptorSet0.vp_c9)._m0[98].z, _4454);
    float _4466 = _3924 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _4468 = fma(_4462, -2.0, _4456);
    float _4470 = _3894 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _4472 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4474 = -_3920;
    float _4476 = fma(_4466, 2.0, _4474);
    float _4478 = _4160 * _4446;
    float _4480 = _4214 * _4446;
    float _4482 = -_4472;
    float _4484 = fma(_4470, 2.0, _4482);
    float _4486 = _3234 * _4446;
    float _4488 = -_4478;
    float _4490 = fma(_4488, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4160);
    int _4492 = ~_4444;
    int _4494 = _4492 + 1;
    int _4496 = _4494 + 1;
    float _4498 = _4478 * _4416;
    int _4500 = _4496;
    if (!_4452)
    {
        int _4502 = ~_4444;
        int _4504 = _4502 + 1;
        _4500 = _4504;
    }
    int _4506 = _4500;
    float _4508 = -_4486;
    float _4510 = fma(_4508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3234);
    float _4512 = _4490 * _4490;
    float _4514 = _4480 * _4416;
    float _4516 = _4486 * _4416;
    float _4518 = -_4498;
    float _4520 = _4160 + _4518;
    float _4522 = fma(_4510, _4510, _4512);
    float _4524 = -_4480;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4214);
    float _4528 = -_4514;
    float _4530 = _4214 + _4528;
    float _4532 = -_4516;
    float _4534 = _3234 + _4532;
    float _4536 = _4520 * _4520;
    float _4538 = fma(_4526, _4526, _4522);
    float _4540 = fma(_4534, _4534, _4536);
    float _4542 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4544 = abs(_4426);
    float _4546 = (*spvDescriptorSet0.vp_c9)._m0[102].x + (*spvDescriptorSet0.vp_c9)._m0[101].z;
    float _4548 = fma(_4530, _4530, _4540);
    float _4550 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4542);
    float _4552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _4554 = -_4546;
    float _4556 = fma(_4460, 2.0, _4554);
    float _4558 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4560 = 1.0 + _4558;
    float _4562 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[101].y, _4468);
    bool _4564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4566 = isnan(0.0);
    bool _4568 = _4564 || _4566;
    bool _4570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4572 = _4568 || _4570;
    float _4574 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4550);
    out.m_74.x = _4440;
    float _4576 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _4578 = -_153;
    float _4580 = fma(_4578, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4484);
    int _4582 = abs(_4370);
    float _4584 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[92].z, _4294);
    float _4586 = float(_4506);
    float _4588 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4590 = _4572 ? _3526 : 0.0;
    float _4592 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4594 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4596 = isnan(1.0);
    bool _4598 = _4594 || _4596;
    bool _4600 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4602 = _4598 || _4600;
    float _4604 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4588);
    float _4606 = float(_4544);
    float _4608 = _4552 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4610 = float(_3812);
    float _4612 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4604);
    float _4614 = float(_4582);
    float _4616 = sqrt(_4538);
    float _4618 = _4606 * _4586;
    float _4620 = float(_4202);
    float _4622 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4384);
    float _4624 = float(_4170);
    float _4626 = _4576 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _4628 = _4614 * _4610;
    float _4630 = float(_4228);
    float _4632 = sqrt(_4548);
    float _4634 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[102].z, _4360);
    float _4636 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[102].w, _4390);
    float _4638 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4402);
    float _4640 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[97].z, _4464);
    float _4642 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[97].w, _4442);
    float _4644 = -_153;
    float _4646 = fma(_4644, (*spvDescriptorSet0.vp_c9)._m0[96].x, _4476);
    float _4648 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[96].y, _4458);
    float _4650 = 1.0 / _4560;
    float _4652 = -_153;
    float _4654 = fma(_4652, (*spvDescriptorSet0.vp_c9)._m0[101].x, _4556);
    float _4656 = _4446 * _4616;
    float _4658 = _4592 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _4660 = fma(_4608, _4620, _4580);
    float _4662 = fma(_4626, _4624, _4420);
    float _4664 = _2140 + 0.5;
    float _4666 = fma(_4658, _4630, _4654);
    float _4668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _4670 = _4446 * _4632;
    float _4672 = _3930 + 0.5;
    float _4674 = float(_4192);
    float _4676 = _3620 + 0.5;
    float _4678 = float(_4238);
    float _4680 = fma(_4608, _4672, _4660);
    float _4682 = fma(_4626, _4664, _4662);
    float _4684 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _4686 = _4676;
    if (_4602)
    {
        float _4688 = _4590 * _4650;
        _157 = _4688;
    }
    float _4690 = _157;
    float _4692 = float(_4224);
    float _4694 = -_4574;
    float _4696 = _4694 + 1.0;
    float _4698 = float(_4344);
    float _4700 = -_4640;
    float _4702 = _4700 + 1.0;
    float _4704 = float(_4338);
    float _4706 = -_4696;
    float _4708 = fma(_3930, _4706, _4680);
    float _4710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4712 = _4668 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    if (_4374)
    {
        out.m_49.x = 0.0;
    }
    bool _4714 = !_4358;
    int _4716 = _4714 ? 0 : 1;
    float _4718 = fma(_4712, _4674, _4646);
    float _4720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _4722 = _4684 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4724 = _3732 + 0.5;
    float _4726 = fma(_4712, _4676, _4718);
    float _4728 = _4718;
    if (!_2732)
    {
        _4686 = _233;
    }
    float _4730 = _4686;
    float _4732 = -_4068;
    float _4734 = fma(_4722, _4678, _4732);
    float _4736 = fma(_4658, _4724, _4666);
    float _4738 = _3832 + (-0.5);
    float _4740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    float _4742 = _4710 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _4744 = _4730;
    if (_2732)
    {
        float _4746 = -_233;
        float _4748 = _3624 ? _4746 : _233;
        _4744 = _4748;
    }
    float _4750 = _4744;
    float _4752 = -_4722;
    float _4754 = fma(_4752, _4738, _4734);
    float _4756 = _2540 + (-0.5);
    float _4758 = -_4638;
    float _4760 = fma(_4742, _4692, _4758);
    if (!_2740)
    {
        _4728 = _233;
    }
    float _4762 = _4728;
    float _4764 = _4720 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _4766 = _4762;
    if (_2740)
    {
        float _4768 = -_233;
        float _4770 = _4304 ? _4768 : _233;
        _4766 = _4770;
    }
    float _4772 = _4766;
    float _4774 = -_4648;
    float _4776 = fma(_4764, _4698, _4774);
    float _4778 = -_4742;
    float _4780 = fma(_4778, _4756, _4760);
    float _4782 = -_4584;
    float _4784 = _4782 + 1.0;
    float _4786 = _4772 + (-0.5);
    float _4788 = _4740 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    float _4790 = _4750 + (-0.5);
    float _4792 = -_4562;
    float _4794 = fma(_4788, _4704, _4792);
    float _4796 = -_4764;
    float _4798 = fma(_4796, _4790, _4776);
    float _4800 = -_4612;
    float _4802 = _4800 + 1.0;
    float _4804 = -_4784;
    float _4806 = fma(_4804, _2140, _4682);
    float _4808 = -_4642;
    float _4810 = _4808 + 1.0;
    float _4812 = -_4788;
    float _4814 = fma(_4812, _4786, _4794);
    float _4816 = fma(_3832, _4802, _4754);
    float _4818 = -_4634;
    float _4820 = _4818 + 1.0;
    float _4822 = in.m_76.x;
    float _4824 = in.m_76.y;
    float _4826 = in.m_76.z;
    float _4828 = fma(_4810, _4750, _4798);
    float _4830 = -_4622;
    float _4832 = _4830 + 1.0;
    float _4834 = -_4636;
    float _4836 = _4834 + 1.0;
    float _4838 = _4670 * _4656;
    float _4840 = -_4702;
    float _4842 = fma(_4840, _3620, _4726);
    float _4844 = -_4820;
    float _4846 = fma(_4844, _3732, _4736);
    float _4848 = fma(_4832, _2540, _4780);
    float _4850 = fma(_4836, _4772, _4814);
    float _4852 = _1224 * _4838;
    out.m_78.x = _4708;
    out.m_78.y = _4816;
    out.m_80.x = _4806;
    out.m_80.y = _4848;
    out.m_82.x = _4842;
    out.m_82.y = _4828;
    out.m_84.x = _4846;
    out.m_84.y = _4850;
    out.m_86.x = _4852;
    float _4854 = _4826;
    if (_4374)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4856 = -_4478;
    float _4858 = fma(_4856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3034);
    float _4860 = _4618 * (-2.0);
    float _4862 = _1110 + (-0.5);
    float _4864 = -_4486;
    float _4866 = fma(_4864, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3072);
    float _4868 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4870 = _4858 + _4868;
    float _4872 = fma(_4860, _4822, _4822);
    int _4874 = abs(_4716);
    float _4876 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4878 = _4866 + _4876;
    float _4880 = _4870 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _4882 = fma(_4862, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4872);
    float _4884 = -_4480;
    float _4886 = fma(_4884, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2852);
    float _4888 = _4628 * (-2.0);
    float _4890 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4880);
    float _4892 = _1122 + (-0.5);
    float _4894 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4896 = _4886 + _4894;
    float _4898 = fma(_4386, _4888, _4386);
    float _4900 = fma(_4888, _4824, _4824);
    float _4902 = fma(_4896, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4890);
    float _4904 = float(_4278);
    float _4906 = _1110 + _1120;
    float _4908 = float(_4874);
    float _4910 = fma(_4892, (*spvDescriptorSet0.vp_c9)._m0[196].y, _4900);
    bool _4912 = _4902 >= 0.0;
    float _4914 = _4906 + (-1.0);
    float _4916 = fma(_4404, _4860, _4404);
    float _4918 = _4908 * _4904;
    float _4920 = fma(_4898, _4690, _4910);
    float _4922 = _1120 + (-0.5);
    float _4924 = _4918 * (-2.0);
    float _4926 = fma(_4916, _4690, _4882);
    float _4928 = fma(_4914, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _4930 = _4920 * 0.15915493667125701904296875;
    float _4932 = fma(_4924, _4826, _4826);
    float _4934 = _4926 * 0.15915493667125701904296875;
    float _4936 = fma(_4928, _4924, _4928);
    int _4938 = as_type<int>(_4922);
    if (_4912)
    {
        _4854 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _4940 = _4854;
    float _4942 = fma(_4922, (*spvDescriptorSet0.vp_c9)._m0[196].z, _4932);
    float _4944 = _4934 * 6.283185482025146484375;
    float _4946 = sin(_4944);
    if (_4912)
    {
        out.m_49.x = 0.0;
    }
    float _4948 = fma(_4936, _4690, _4942);
    if (_4912)
    {
        float _4950 = _4940 * 5.0;
        _4938 = as_type<int>(_4950);
    }
    int _4952 = _4938;
    float _4954 = _4948 * 0.15915493667125701904296875;
    float _4956 = _4934 * 6.283185482025146484375;
    float _4958 = cos(_4956);
    if (_4912)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13028 = as_type<float>(_4952);
        out.gl_Position.z = _13028;
    }
    float _4960 = _4930 * 6.283185482025146484375;
    float _4962 = sin(_4960);
    float _4964 = _4930 * 6.283185482025146484375;
    float _4966 = cos(_4964);
    if (_4912)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4968 = _4954 * 6.283185482025146484375;
    float _4970 = cos(_4968);
    float _4972 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _4974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _233);
    float _4976 = _4946 * _4962;
    float _4978 = _4958 * _4966;
    float _4980 = _4972 * _4838;
    float _4982 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _225);
    float _4984 = _4958 * _4962;
    float _4986 = _4954 * 6.283185482025146484375;
    float _4988 = sin(_4986);
    float _4990 = _4980 * _4974;
    float _4992 = _4946 * _4966;
    float _4994 = _4852 * _4982;
    float _4996 = _4838 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _4998 = _4996 * 0.5;
    float _5000 = _233 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5002 = _4958 * _4970;
    float _5004 = _4966 * _4970;
    float _5006 = _4946 * _4970;
    float _5008 = _4962 * _4970;
    float _5010 = _5002 * _4990;
    float _5012 = fma(_4988, _4978, _4976);
    float _5014 = -_4992;
    float _5016 = fma(_4988, _4984, _5014);
    float _5018 = -_4990;
    float _5020 = _4988 * _5018;
    float _5022 = -_4984;
    float _5024 = fma(_4988, _4992, _5022);
    float _5026 = fma(_5012, _4994, _5010);
    float _5028 = _5006 * _4990;
    float _5030 = fma(_5004, _4994, _5020);
    float _5032 = fma(_4988, _4976, _4978);
    float _5034 = fma(_5016, _4998, _5026);
    float _5036 = fma(_5024, _4994, _5028);
    float _5038 = fma(_5008, _4998, _5030);
    float _5040 = _5034 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5042 = fma(_5032, _4998, _5036);
    float _5044 = _5034 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5046 = _5012 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5048 = fma(_5038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5040);
    float _5050 = fma(_5038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5044);
    float _5052 = fma(_5004, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5046);
    float _5054 = fma(_5042, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5048);
    float _5056 = fma(_5042, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5050);
    float _5058 = _5054 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _5060 = _5056 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _5062 = _5034 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5064 = _2852 + _5058;
    float _5066 = _5012 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5068 = _3072 + _5060;
    float _5070 = fma(_5038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5062);
    float _5072 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5074 = _5064 + _5072;
    float _5076 = fma(_5004, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5066);
    float _5078 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5080 = _5068 + _5078;
    float _5082 = fma(_5042, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5070);
    float _5084 = _5074 * _5074;
    float _5086 = _5002 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5088 = fma(_5080, _5080, _5084);
    float _5090 = _5012 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5092 = -_4988;
    float _5094 = fma(_5092, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5086);
    float _5096 = sqrt(_5088);
    float _5098 = fma(_5004, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5090);
    float _5100 = _5082 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _5102 = _5002 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5104 = _5002 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5106 = _3034 + _5100;
    float _5108 = -_4988;
    float _5110 = fma(_5108, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5102);
    float _5112 = -_4988;
    float _5114 = fma(_5112, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5104);
    bool _5116 = _5096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5118 = _5100;
    float _5120 = _5086;
    float _5122 = _5102;
    if (!_5116)
    {
        _5118 = _5068;
    }
    float _5124 = _5118;
    float _5126 = _5124;
    if (!_5116)
    {
        _5120 = _5064;
    }
    float _5128 = _5120;
    float _5130 = _5128;
    if (!_5116)
    {
        _5122 = _5106;
    }
    float _5132 = _5122;
    bool _5134 = !_5116;
    float _5136 = _5132;
    if (!_5134)
    {
        float _5138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5142 = _5096 + _5140;
        float _5144 = _5106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5146 = rsqrt(_5088);
        float _5148 = _5142 * _5138;
        float _5150 = _5148 * 0.15915493667125701904296875;
        float _5152 = _5150 * 6.283185482025146484375;
        float _5154 = cos(_5152);
        float _5156 = _5150 * 6.283185482025146484375;
        float _5158 = sin(_5156);
        float _5160 = _5154 + (-1.0);
        float _5162 = _5160 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5164 = fma(_5158, _5144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5166 = fma(_5106, _5154, _5162);
        float _5168 = _5146 * _5164;
        float _5170 = fma(_5080, _5168, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5172 = fma(_5074, _5168, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5136 = _5166;
        _5126 = _5170;
        _5130 = _5172;
    }
    float _5174 = _5136;
    float _5176 = _5126;
    float _5178 = _5130;
    float _5180 = _5016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _5182 = _5016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _5184 = _5016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _5186 = fma(_5000, _5000, 1.0);
    float _5188 = -_4498;
    float _5190 = _5188 + _5174;
    float _5192 = fma(_5008, (*spvDescriptorSet0.vp_c8)._m0[24].x, _5180);
    float _5194 = fma(_5008, (*spvDescriptorSet0.vp_c8)._m0[25].x, _5182);
    float _5196 = fma(_5008, (*spvDescriptorSet0.vp_c8)._m0[26].x, _5184);
    float _5198 = -_4516;
    float _5200 = _5198 + _5176;
    float _5202 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5204 = _5190 + _5202;
    float _5206 = rsqrt(_5186);
    float _5208 = -_4514;
    float _5210 = _5208 + _5178;
    float _5212 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5214 = _5200 + _5212;
    float _5216 = _5204 * _5204;
    float _5218 = fma(_5006, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5110);
    float _5220 = fma(_5006, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5094);
    float _5222 = fma(_5006, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5114);
    float _5224 = fma(_5214, _5214, _5216);
    float _5226 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5228 = _5210 + _5226;
    float _5230 = fma(_5032, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5192);
    float _5232 = fma(_5032, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5194);
    float _5234 = fma(_5032, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5196);
    float _5236 = fma(_5228, _5228, _5224);
    float _5238 = fma(_5024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _5098);
    float _5240 = fma(_5024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _5076);
    float _5242 = fma(_5024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _5052);
    float _5244 = _225 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _5246 = _5000 * _5206;
    float _5248 = _5000 * _5218;
    float _5250 = _5000 * _5220;
    float _5252 = _5000 * _5222;
    float _5254 = sqrt(_5236);
    float _5256 = -_5230;
    float _5258 = _5246 * _5256;
    float _5260 = -_5232;
    float _5262 = _5246 * _5260;
    float _5264 = -_5234;
    float _5266 = _5246 * _5264;
    float _5268 = fma(_5244, _5238, _5248);
    float _5270 = fma(_5244, _5240, _5250);
    float _5272 = fma(_5244, _5242, _5252);
    float _5274 = fma(_5206, _5218, _5258);
    float _5276 = fma(_5206, _5220, _5262);
    float _5278 = fma(_5206, _5222, _5266);
    float _5280 = _5230 + _5268;
    float _5282 = _5232 + _5270;
    float _5284 = _5234 + _5272;
    out.m_88.x = _5238;
    out.m_88.y = _5240;
    out.m_88.z = _5242;
    float _5286 = -_4516;
    float _5288 = _3072 + _5286;
    bool _5290 = _5254 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5292 = isnan(_5254);
    bool _5294 = _5290 || _5292;
    bool _5296 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5298 = _5294 || _5296;
    out.m_90.x = _5274;
    out.m_90.y = _5276;
    out.m_90.z = _5278;
    float _5300 = -_4498;
    float _5302 = _3034 + _5300;
    float _5304 = -_4514;
    float _5306 = _2852 + _5304;
    out.m_92.x = _5280;
    out.m_92.y = _5282;
    out.m_92.z = _5284;
    float _5308 = _5206;
    float _5310 = _5274;
    float _5312 = _5270;
    float _5314 = _5262;
    if (!_5298)
    {
        _5308 = 1.0;
    }
    float _5316 = _5308;
    bool _5318 = !_5298;
    float _5320 = _5316;
    if (!_5318)
    {
        bool _5322 = _5254 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5324 = isnan(_5254);
        bool _5326 = _5322 || _5324;
        bool _5328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5330 = _5326 || _5328;
        if (!_5330)
        {
            float _5332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5334 = _5254 + _5332;
            float _5336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5336;
            float _5340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5342 = _5340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5344 = 1.0 / _5338;
            float _5346 = _5334 * _5344;
            float _5348 = fma(_5346, _5342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5320 = _5348;
            _5350 = true;
        }
        else
        {
            bool _5352 = _5254 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5354 = isnan(_5254);
            bool _5356 = _5352 || _5354;
            bool _5358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5360 = _5356 || _5358;
            if (!_5360)
            {
                float _5362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5364 = _5254 + _5362;
                float _5366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5368 = _5366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5372 = _5370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5374 = 1.0 / _5368;
                float _5376 = _5364 * _5374;
                float _5378 = fma(_5376, _5372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5320 = _5378;
                _5350 = true;
            }
            else
            {
                _5320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5350 = false;
    float _5380 = _5320;
    float _5382 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5384 = _5190 + _5382;
    float _5386 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5388 = _5200 + _5386;
    float _5390 = -_4486;
    float _5392 = fma(_5390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5288);
    float _5394 = fma(_5384, _5380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5396 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5398 = _5210 + _5396;
    float _5400 = fma(_5388, _5380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5402 = -_5302;
    float _5404 = _5402 + _5394;
    float _5406 = fma(_5398, _5380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5408 = -_5288;
    float _5410 = _5408 + _5400;
    float _5412 = _5404 * _5404;
    float _5414 = -_5306;
    float _5416 = _5414 + _5406;
    float _5418 = fma(_5410, _5410, _5412);
    float _5420 = fma(_5416, _5416, _5418);
    float _5422 = sqrt(_5420);
    bool _5424 = _5422 > 0.0;
    bool _5426 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5428 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5430 = _5426 || _5428;
    bool _5432 = isnan(0.5);
    bool _5434 = _5430 || _5432;
    float _5436 = _5380;
    float _5438 = _5400;
    float _5440 = _5406;
    if (!_5424)
    {
        _5310 = _5394;
    }
    float _5442 = _5310;
    float _5444 = _5442;
    float _5446 = _5442;
    if (!_5424)
    {
        _5436 = _5406;
    }
    float _5448 = _5436;
    bool _5450 = !_5424;
    float _5452 = _5448;
    if (!_5450)
    {
        float _5454 = _229 * _229;
        float _5456 = rsqrt(_5420);
        float _5458 = fma(_221, _221, _5454);
        float _5460 = fma(_235, _235, _5458);
        float _5462 = sqrt(_5460);
        float _5464 = _5410 * _5456;
        float _5466 = _5404 * _5456;
        float _5468 = _5416 * _5456;
        bool _5470 = _5462 > 0.0;
        float _5472 = _5462;
        _5312 = _5464;
        if (!_5470)
        {
            _5444 = _5394;
        }
        float _5474 = _5444;
        _5446 = _5474;
        if (!_5470)
        {
            _5472 = _5406;
        }
        float _5476 = _5472;
        bool _5478 = !_5470;
        _5452 = _5476;
        if (!_5478)
        {
            float _5480 = rsqrt(_5460);
            float _5482 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5484 = _229 * _5480;
            float _5486 = _221 * _5480;
            float _5488 = _5466 * _5484;
            float _5490 = _235 * _5480;
            float _5492 = fma(_5464, _5486, _5488);
            float _5494 = _5482 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5496 = fma(_5468, _5490, _5492);
            float _5498 = _5496 * _5494;
            float _5500 = fma(_221, _5498, _5400);
            float _5502 = fma(_229, _5498, _5394);
            float _5504 = fma(_235, _5498, _5406);
            _5446 = _5502;
            _5452 = _5504;
            _5438 = _5500;
        }
    }
    float _5506 = _5446;
    float _5508 = _5452;
    float _5510 = _5438;
    float _5512 = _5312;
    float _5514 = -_4478;
    float _5516 = fma(_5514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5506);
    float _5518 = -_4480;
    float _5520 = fma(_5518, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5508);
    float _5522 = -_4486;
    float _5524 = fma(_5522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5510);
    float _5526 = -_4478;
    float _5528 = fma(_5526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5302);
    float _5530 = -_4480;
    float _5532 = fma(_5530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5306);
    float _5534 = _5516;
    float _5536 = _5524;
    float _5538 = _5520;
    float _5540 = _5512;
    if (!_5434)
    {
        float _5542 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _5544 = _5528 + _5542;
        float _5546 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _5548 = _5392 + _5546;
        float _5550 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5552 = -_5306;
        float _5554 = _5552 + _5508;
        float _5556 = _5544 * _5544;
        float _5558 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _5560 = _5532 + _5558;
        float _5562 = -_5288;
        float _5564 = _5562 + _5510;
        float _5566 = -_5302;
        float _5568 = _5566 + _5506;
        float _5570 = fma(_5548, _5548, _5556);
        float _5572 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5574 = fma(_5560, _5560, _5570);
        float _5576 = sqrt(_5574);
        float _5578 = 1.0 / _4656;
        float _5580 = _5572 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5582 = precise::min(_5576, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5584 = _5582 * _5550;
        float _5586 = _5584 * _5578;
        float _5588 = _5580 * _5586;
        float _5590 = _5554 * _5586;
        float _5592 = fma(_5564, _5588, _5392);
        float _5594 = fma(_5568, _5588, _5528);
        float _5596 = fma(_5580, _5590, _5532);
        _5534 = _5594;
        _5536 = _5592;
        _5538 = _5596;
        _5440 = _5580;
    }
    float _5598 = _5534;
    float _5600 = _5536;
    float _5602 = _5538;
    float _5604 = _5440;
    float _5606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5608 = _5598 + _5606;
    float _5610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5612 = _5600 + _5610;
    float _5614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5616 = _5602 + _5614;
    float _5618 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _5620 = _5608 * _5608;
    float _5622 = fma(_5612, _5612, _5620);
    float _5624 = fma(_5616, _5616, _5622);
    float _5626 = rsqrt(_5624);
    float _5628 = sqrt(_5624);
    float _5630 = _5626 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5632 = _5612 * _5630;
    float _5634 = _5616 * _5630;
    float _5636 = _5632 * _5632;
    float _5638 = _5634 * _5634;
    float _5640 = _5636 + _5638;
    float _5642 = sqrt(_5640);
    bool _5644 = _5642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5648 = _5642 + _5646;
    float _5650 = _5626;
    float _5652 = _5648;
    float _5654 = _5608;
    float _5656 = _5630;
    if (_5644)
    {
        float _5658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5650 = _5658;
    }
    float _5660 = _5650;
    float _5662 = _5660;
    if (_5644)
    {
        float _5664 = _5648 * _5660;
        _5652 = _5664;
    }
    float _5666 = _5652;
    if (_5644)
    {
        float _5668 = rsqrt(_5640);
        _5662 = _5668;
    }
    float _5670 = _5662;
    float _5672 = _5670;
    if (_5644)
    {
        float _5674 = _5666 * 0.15915493667125701904296875;
        _5540 = _5674;
    }
    float _5676 = _5540;
    float _5678 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5680 = _5616;
    float _5682 = _5676;
    if (_5644)
    {
        float _5684 = _5676 * 6.283185482025146484375;
        float _5686 = sin(_5684);
        _5680 = _5686;
    }
    float _5688 = _5680;
    float _5690 = precise::max(0.0, _5678);
    float _5692 = _5604;
    float _5694 = _5690;
    if (_5644)
    {
        float _5696 = _5676 * 6.283185482025146484375;
        float _5698 = cos(_5696);
        _5692 = _5698;
    }
    float _5700 = _5692;
    float _5702 = -_5630;
    float _5704 = -_5690;
    float _5706 = fma(_5608, _5702, _5704);
    if (_5644)
    {
        float _5708 = _5706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5654 = _5708;
    }
    float _5710 = _5654;
    float _5712 = _5688;
    float _5714 = _5710;
    if (_5644)
    {
        float _5716 = fma(_5688, _5710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5712 = _5716;
    }
    float _5718 = _5712;
    float _5720 = _5718;
    if (!_5644)
    {
        _5714 = _5634;
    }
    float _5722 = _5714;
    float _5724 = _5722;
    if (!_5644)
    {
        _5682 = _5636;
    }
    float _5726 = _5682;
    float _5728 = _5726;
    if (_5644)
    {
        float _5730 = _5670 * _5718;
        _5314 = _5730;
    }
    float _5732 = _5314;
    if (!_5644)
    {
        _5672 = _5632;
    }
    float _5734 = _5672;
    float _5736 = _5734;
    if (_5644)
    {
        float _5738 = _5700 + (-1.0);
        _5694 = _5738;
    }
    float _5740 = _5694;
    float _5742 = _5740;
    if (_5644)
    {
        float _5744 = _5632 * _5732;
        _5736 = _5744;
    }
    float _5746 = _5736;
    if (!_5644)
    {
        _5720 = _5706;
    }
    float _5748 = _5720;
    float _5750 = _5748;
    if (_5644)
    {
        float _5752 = _5634 * _5732;
        _5724 = _5752;
    }
    float _5754 = _5724;
    if (_5644)
    {
        float _5756 = _5740 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5656 = _5756;
    }
    float _5758 = _5656;
    if (_5644)
    {
        float _5760 = _5746 * _5746;
        _5728 = _5760;
    }
    float _5762 = _5728;
    if (!_5644)
    {
        _5742 = _5638;
    }
    float _5764 = _5742;
    float _5766 = _5764;
    if (_5644)
    {
        float _5768 = _5754 * _5754;
        _5766 = _5768;
    }
    float _5770 = _5766;
    if (_5644)
    {
        float _5772 = fma(_5706, _5700, _5758);
        _5750 = _5772;
    }
    float _5774 = _5750;
    float _5776 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _5778 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5780 = fma(_5774, _5774, _5762);
    float _5782 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[2].x, _5776);
    float _5784 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5786 = fma(_5628, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5784);
    float _5788 = precise::clamp(_5786, 0.0, 1.0);
    float _5790 = _5780 + _5770;
    float _5792 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5794 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[2].z, _5782);
    float _5796 = -_5788;
    float _5798 = _5796 + 1.0;
    float _5800 = rsqrt(_5790);
    float _5802 = _5598 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5804 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5792);
    float _5806 = _5794 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _5808 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5778);
    float _5810 = fma(_5600, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5802);
    float _5812 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5804);
    float _5814 = _5806 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5816 = abs(_5798);
    float _5818 = log2(_5816);
    float _5820 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5810);
    float _5822 = _5812 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5824 = -_5814;
    float _5826 = fma(_5824, _5618, 1.0);
    float _5828 = fma(_5602, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5808);
    float _5830 = _5820 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5832 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5834 = _5800 * _5746;
    float _5836 = _5800 * _5774;
    float _5838 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5832);
    float _5840 = _5828 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _5842 = _5834 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5844 = _5800 * _5754;
    float _5846 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5838);
    float _5848 = log2(_5826);
    float _5850 = -_5842;
    float _5852 = fma(_5836, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5850);
    float _5854 = _5818 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5856 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5846);
    float _5858 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5860 = -_5844;
    float _5862 = fma(_5860, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5852);
    float _5864 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5866 = exp2(_5854);
    float _5868 = fma(_5862, -0.5, 0.5);
    float _5870 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5864);
    float _5872 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5858);
    float _5874 = fma(_5862, 0.5, 0.5);
    float _5876 = _5836 + 1.0;
    float _5878 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5870);
    float _5880 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5872);
    float _5882 = 1.0 / _5856;
    float _5884 = fma(_5874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5886 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5878);
    float _5888 = _5848 * 0.693147182464599609375;
    float _5890 = fma(_5874, _5884, -0.212114393711090087890625);
    float _5892 = _5888 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5894 = sqrt(_5868);
    float _5896 = -_5836;
    float _5898 = fma(_5866, _5876, _5896);
    float _5900 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5880);
    float _5902 = fma(_5874, _5890, 1.570728778839111328125);
    float _5904 = fma(_5898, 0.5, 0.5);
    float _5906 = _5886 * _5882;
    float _5908 = _5900 * _5882;
    float _5910 = fma(_5906, 0.5, 0.5);
    float _5912 = fma(_5908, -0.5, 0.5);
    float _5914 = _5894 * 0.636619746685028076171875;
    float3 _14626 = float3(_5910, _5912, _5892);
    float _5916 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_14626, float3(0.0), isnan(_14626)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_14626, float3(0.0), isnan(_14626)), level(0.0)).x;
    float _5918 = -_5902;
    float _5920 = fma(_5914, _5918, 1.0);
    float3 _14642 = float3(_5910, _5912, _5892);
    float4 _5923 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_14642, float3(0.0), isnan(_14642)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_14642, float3(0.0), isnan(_14642)), level(0.0)).xyzw;
    float _5925 = _5923.x;
    float _5927 = _5923.y;
    float _5929 = _5923.z;
    float _5931 = _5923.w;
    float2 _14659 = float2(_5920, _5904);
    float3 _5935 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_14659, float2(0.0), isnan(_14659)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_14659, float2(0.0), isnan(_14659)), level(0.0)).xyz;
    float _5937 = _5935.x;
    float _5939 = _5935.y;
    float _5941 = _5935.z;
    float _5943 = _5528 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5945 = _5818 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5947 = _5822 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5949 = fma(_5392, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5943);
    bool _5951 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5953 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5955 = _5951 || _5953;
    bool _5957 = isnan(0.5);
    bool _5959 = _5955 || _5957;
    float _5961 = exp2(_5945);
    float _5963 = fma(_5830, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5947);
    float _5965 = fma(_5532, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5949);
    float _5967 = _5528 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_94.x = _5392;
    out.m_94.y = _5528;
    out.m_94.z = _5532;
    float _5969 = _5965 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5971 = fma(_5392, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5967);
    out.m_96.x = _5600;
    out.m_96.y = _5598;
    out.m_96.z = _5602;
    float _5973 = 1.0 / _5969;
    float _5975 = fma(_5532, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5971);
    float _5977 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5979 = _5830;
    if (!_5959)
    {
        _5977 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _5981 = _5977;
    float _5983 = _5981;
    if (_5959)
    {
        _5979 = 1.0;
    }
    float _5985 = _5979;
    float _5987 = _5975 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5989 = -_5961;
    float _5991 = _5989 + 1.0;
    float _5993 = _5987 + _5969;
    float _5995 = fma(_5806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5963);
    float _5997 = _5991 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5999 = _5886 + _5856;
    float _6001 = _5856 * 0.5;
    float _6003 = fma(_5840, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5995);
    float _6005 = -_5997;
    float _6007 = _6005 + 1.0;
    float _6009 = _5993 * _5973;
    float _6011 = _6009 * 0.5;
    out.gl_Position.x = _5886;
    out.gl_Position.y = _5900;
    out.gl_Position.z = _6003;
    out.gl_Position.w = _5856;
    float _6013 = _5973;
    float _6015 = _6011;
    float _6017 = _5985;
    if (!_5959)
    {
        float _6019 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _6021 = fma(_6011, _5981, _6019);
        _6013 = _6021;
    }
    float _6023 = _6013;
    if (!_5959)
    {
        _6015 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _6025 = _6015;
    float _6027 = _6025;
    if (!_5959)
    {
        float _6029 = -_6025;
        float _6031 = _6029 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _5983 = _6031;
    }
    float _6033 = _5983;
    float _6035 = _6023;
    if (!_5959)
    {
        float _6037 = 1.0 / _6023;
        _6035 = _6037;
    }
    float _6039 = _6035;
    float _6041 = _6033;
    if (!_5959)
    {
        float _6043 = 1.0 / _6033;
        _6041 = _6043;
    }
    float _6045 = _6041;
    if (!_5959)
    {
        float _6047 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _6049 = -_6025;
        float _6051 = fma(_6039, _6047, _6049);
        _6027 = _6051;
    }
    float _6053 = _6027;
    float _6055 = _5999 * 0.5;
    if (!_5959)
    {
        float _6057 = _6053 * _6045;
        float _6059 = precise::clamp(_6057, 0.0, 1.0);
        _6017 = _6059;
    }
    float _6061 = _6017;
    float _6063 = _6003 + _5856;
    float _6065 = fma(_5900, -0.5, _6001);
    float _6067 = _6061 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _6069 = _6061 > 0.0;
    bool _6071 = isnan(_6061);
    bool _6073 = _6069 || _6071;
    bool _6075 = isnan(0.0);
    bool _6077 = _6073 || _6075;
    float _6079 = _6063 * 0.5;
    float _6081 = _6067 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_98.x = _6055;
    out.m_98.y = _6065;
    out.m_98.z = _6079;
    out.m_98.w = _5856;
    out.m_49.x = _6081;
    float _6083 = _5997 * _5916;
    float _6085 = _5931 * _6083;
    float _6087 = _5931 * _6007;
    float _6089 = _5941 * _6083;
    float _6091 = fma(_5937, _6085, _5925);
    float _6093 = fma(_5939, _6085, _5927);
    float _6095 = fma(_5931, _6089, _5929);
    out.m_100.x = _6091;
    out.m_100.y = _6093;
    out.m_100.z = _6095;
    out.m_100.w = _6087;
    if (_6077)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _6097 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6097;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

