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
    float4 m_56 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _397 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1385 = as_type<float>(_99);
        out.gl_Position.z = _1385;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1454 = as_type<float>(_135);
        out.gl_Position.z = _1454;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = 0.0;
    float _161 = _145;
    if (!_155)
    {
        float _163 = _145 * _145;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _171 = _167;
    if (!_155)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = floor(_169);
    int _179 = as_type<int>(_143) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_143) & 2;
    bool _185 = _183 != 0;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = -_177;
    float _197 = _169 + _195;
    float _199 = _169 * 6.283185482025146484375;
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _199 * 0.15915493667125701904296875;
    bool _207 = !_155;
    float _209 = _175;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _145 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _145);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_155;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _145 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _161 = _263;
    }
    float _265 = _161;
    float _267 = _205 * 6.283185482025146484375;
    float _269 = cos(_267);
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = in.m_54.w;
    bool _281 = _197 < 0.5;
    float _283 = float(_281);
    float _285 = in.m_47.x;
    float _287 = in.m_47.y;
    float _289 = in.m_47.z;
    float _291 = -_197;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = in.m_42.x;
    float _297 = in.m_42.y;
    float _299 = in.m_42.z;
    float _301 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = -_283;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _309 = fma(_269, 0.5, 0.5);
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _315 = !_189;
    int _317 = _315 ? 0 : 1;
    float _319 = -_309;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _323 = !_273;
    int _325 = _323 ? 0 : 1;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _329 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _331 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _333 = abs(_325);
    float _335 = _313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    int _339 = abs(_317);
    float _341 = fma(_265, _285, _301);
    bool _343 = !_277;
    int _345 = _343 ? 0 : 1;
    float _347 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_56.x = _329;
    out.m_56.y = _331;
    out.m_56.z = _335;
    out.m_56.w = _327;
    int _349 = abs(_345);
    float _351 = fma(_265, _287, _347);
    float _353 = float(_333);
    float _355 = float(_339);
    float _357 = fma(_351, _279, _297);
    float _359 = abs(_293);
    float _361 = _353 * _359;
    float _363 = fma(_355, _321, _361);
    float _365 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_341, _279, _295);
    float _369 = fma(_265, _289, _365);
    float _371 = float(_349);
    float _373 = fma(_369, _279, _299);
    float _375 = abs(_305);
    float _377 = fma(_371, _375, _363);
    bool _379 = !_337;
    float _395;
    if (!_379)
    {
        float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _383 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _387 = _385 * _381;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = true;
    }
    else
    {
        float _399 = float(_83);
        float _401 = 1.0 / _399;
        float _403 = _117 * _401;
        _395 = _403;
    }
    _397 = false;
    float _405 = _395;
    float _407 = in.m_49.y;
    float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _411 = _137 > 0.5;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _413;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _419 = _417 != 0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _423 = _405 + _421;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _427 = _425 != 0;
    float _429 = 1.0 / _415;
    float _431 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _437 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _439;
    bool _443 = _407 > 0.5;
    float _445 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _447 = _423 * _429;
    float _449 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].x, _445);
    bool _453 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _455 = isnan(_405);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _465;
    float _469 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    bool _471 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _473 = isnan(_405);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _483;
    float _487 = -_463;
    float _489 = _487 + 1.0;
    float _491 = fma(_467, _447, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _493 = fma(_441, _447, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _495 = fma(_485, _447, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _497 = _481 * _489;
    float _499 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    float _501 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    float _503 = -_203;
    int _505 = _411 ? as_type<int>(_503) : as_type<int>(_203);
    float _507 = _495 * _497;
    float _509 = _499 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _511 = _491 * _497;
    float _513 = -_481;
    float _515 = _513 + 1.0;
    float _517 = _437 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _519 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _521 = _509 + _519;
    float _523 = _501 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _525 = _493 * _497;
    float _527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _529 = _517 + _527;
    float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _535 = _523 + _533;
    float _537 = -_193;
    int _539 = _443 ? as_type<int>(_537) : as_type<int>(_193);
    float _541 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[123].x, _507);
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[28].x, _531);
    bool _545 = !_419;
    float _547 = _545 ? _203 : as_type<float>(_505);
    float _549 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[123].y, _511);
    bool _551 = !_427;
    float _553 = _551 ? _193 : as_type<float>(_539);
    float _555 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[28].z, _543);
    float _557 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[123].z, _525);
    float _559 = _521 * _521;
    float _561 = _547 + 0.5;
    float _563 = -_553;
    float _565 = _563 + 0.5;
    bool _567 = _555 >= 0.0;
    float _569 = fma(_529, _529, _559);
    float _571 = _561 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _573 = _565 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _575 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[124].x, _541);
    float _577 = fma(_535, _535, _569);
    float _579 = _571 * _409;
    float _581 = _573 * _435;
    float _583 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[124].y, _549);
    float _585 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[124].z, _557);
    float _587 = rsqrt(_577);
    float _589 = _575 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _591 = _583 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _593 = _463;
    float _595 = _509;
    if (_567)
    {
        _593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _597 = _593;
    float _599 = _585 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _601 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _607 = as_type<int>(_597);
    if (_567)
    {
        float _609 = _597 * 5.0;
        _607 = as_type<int>(_609);
    }
    int _611 = _607;
    out.m_58.x = _579;
    out.m_58.y = _581;
    out.m_60.x = _601;
    out.m_60.y = _603;
    out.m_60.z = _605;
    float _613 = _521 * _587;
    float _615 = _529 * _587;
    float _617 = as_type<float>(_611);
    if (_567)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2248 = as_type<float>(_611);
        out.gl_Position.z = _2248;
    }
    if (_567)
    {
        out.m_45.x = 0.0;
    }
    if (_567)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _619 = -_613;
    float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _623 = -_615;
    float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    float _627 = _535 * _587;
    float _629 = -_613;
    float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _521);
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _635 = _621 + _633;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _639 = _625 + _637;
    float _641 = -_627;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _645 = in.m_54.x;
    float _647 = in.m_54.y;
    float _649 = _635 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _651 = -_615;
    float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _529);
    float _655 = _631 * _631;
    float _657 = -_627;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _535);
    float _661 = fma(_639, (*spvDescriptorSet0.vp_c8)._m0[28].x, _649);
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _665 = _643 + _663;
    float _667 = fma(_653, _653, _655);
    float _669 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[28].z, _661);
    float _671 = fma(_659, _659, _667);
    bool _673 = _669 >= 0.0;
    float _675 = sqrt(_671);
    float _677 = _645 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _679 = _647 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    if (_673)
    {
        _617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _681 = _617;
    int _683 = as_type<int>(_681);
    if (_673)
    {
        out.m_45.x = 0.0;
    }
    float _685 = _377 * _677;
    float _687 = _377 * _679;
    float _689 = _587 * _675;
    if (_673)
    {
        float _691 = _681 * 5.0;
        _683 = as_type<int>(_691);
    }
    int _693 = _683;
    if (_673)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2398 = as_type<float>(_693);
        out.gl_Position.z = _2398;
    }
    if (_673)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _695 = _687 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _697 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _703 = _689 * _695;
    float _705 = _689 * _697;
    float _707 = _689 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _709 = _707 * 0.5;
    float _711 = _699 * _703;
    float _713 = _701 * _705;
    float _715 = _711 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _717 = _711 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _719 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[26].x, _715);
    float _721 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[24].x, _717);
    float _723 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[26].z, _719);
    float _725 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[24].z, _721);
    float _727 = _723 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _729 = _725 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _731 = _523 + _727;
    float _733 = _517 + _729;
    float _735 = _711 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _731 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _733 + _741;
    float _745 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[25].x, _735);
    float _747 = _739 * _739;
    float _749 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[25].z, _745);
    float _751 = fma(_743, _743, _747);
    float _753 = _749 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _755 = sqrt(_751);
    float _757 = _509 + _753;
    bool _759 = _755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _761 = _753;
    float _763 = _709;
    float _765 = _733;
    float _767 = _731;
    if (!_759)
    {
        _761 = _733;
    }
    float _769 = _761;
    float _771 = _769;
    if (!_759)
    {
        _595 = _731;
    }
    float _773 = _595;
    float _775 = _773;
    if (!_759)
    {
        _763 = _757;
    }
    float _777 = _763;
    bool _779 = !_759;
    float _781 = _777;
    if (!_779)
    {
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _785 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _787 = _755 + _785;
        float _789 = rsqrt(_751);
        float _791 = _787 * _783;
        float _793 = _757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = _791 * 0.15915493667125701904296875;
        float _797 = _795 * 6.283185482025146484375;
        float _799 = sin(_797);
        float _801 = _795 * 6.283185482025146484375;
        float _803 = cos(_801);
        float _805 = fma(_799, _793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _807 = _789 * _805;
        float _809 = _803 + (-1.0);
        float _811 = fma(_743, _807, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _813 = fma(_739, _807, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _815 = _809 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _817 = fma(_757, _803, _815);
        _781 = _817;
        _771 = _811;
        _775 = _813;
    }
    float _819 = _781;
    float _821 = _771;
    float _823 = _775;
    float _825 = -_613;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _819);
    float _829 = -_615;
    float _831 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _821);
    float _833 = -_627;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _823);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _839 = _827 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _843 = _831 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _847 = _835 + _845;
    float _849 = _839 * _839;
    float _851 = fma(_843, _843, _849);
    float _853 = fma(_847, _847, _851);
    float _855 = rsqrt(_853);
    float _857 = sqrt(_853);
    float _859 = _855 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _861 = _843 * _859;
    float _863 = _847 * _859;
    float _865 = _861 * _861;
    float _867 = _863 * _863;
    float _869 = _865 + _867;
    float _871 = sqrt(_869);
    bool _873 = _871 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _877 = _871 + _875;
    float _879 = _847;
    float _881 = _869;
    float _883 = _877;
    float _885 = _839;
    if (_873)
    {
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _887;
    }
    float _889 = _879;
    if (_873)
    {
        float _891 = rsqrt(_869);
        _881 = _891;
    }
    float _893 = _881;
    if (_873)
    {
        float _895 = _877 * _889;
        _883 = _895;
    }
    float _897 = _883;
    if (_873)
    {
        float _899 = _897 * 0.15915493667125701904296875;
        _765 = _899;
    }
    float _901 = _765;
    float _903 = _855;
    if (_873)
    {
        float _905 = _901 * 6.283185482025146484375;
        float _907 = sin(_905);
        _903 = _907;
    }
    float _909 = _903;
    float _911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _913 = precise::max(0.0, _911);
    float _915 = _851;
    float _917 = _911;
    float _919 = _913;
    if (_873)
    {
        float _921 = _901 * 6.283185482025146484375;
        float _923 = cos(_921);
        _915 = _923;
    }
    float _925 = _915;
    float _927 = -_859;
    float _929 = -_913;
    float _931 = fma(_839, _927, _929);
    if (!_873)
    {
        _885 = _861;
    }
    float _933 = _885;
    float _935 = _933;
    if (_873)
    {
        float _937 = _931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _917 = _937;
    }
    float _939 = _917;
    float _941 = _827 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _943 = _909;
    float _945 = _939;
    if (_873)
    {
        float _947 = fma(_909, _939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _767 = _947;
    }
    float _949 = _767;
    float _951 = _949;
    if (!_873)
    {
        _943 = _931;
    }
    float _953 = _943;
    float _955 = _953;
    float _957 = _925;
    if (_873)
    {
        float _959 = _925 + (-1.0);
        _945 = _959;
    }
    float _961 = _945;
    float _963 = _961;
    if (_873)
    {
        float _965 = _893 * _949;
        _951 = _965;
    }
    float _967 = _951;
    float _969 = _827 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_873)
    {
        float _971 = _961 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _919 = _971;
    }
    float _973 = _919;
    float _975 = _973;
    if (_873)
    {
        float _977 = _861 * _967;
        _935 = _977;
    }
    float _979 = _935;
    if (!_873)
    {
        _963 = _863;
    }
    float _981 = _963;
    float _983 = _981;
    if (_873)
    {
        float _985 = _863 * _967;
        _983 = _985;
    }
    float _987 = _983;
    if (_873)
    {
        float _989 = fma(_931, _925, _973);
        _955 = _989;
    }
    float _991 = _955;
    if (!_873)
    {
        _957 = _865;
    }
    float _993 = _957;
    float _995 = _993;
    if (_873)
    {
        float _997 = _979 * _979;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = _827 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1003 = _827 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_873)
    {
        _975 = _867;
    }
    float _1005 = _975;
    float _1007 = _1005;
    if (_873)
    {
        float _1009 = _987 * _987;
        _1007 = _1009;
    }
    float _1011 = _1007;
    float _1013 = fma(_991, _991, _999);
    float _1015 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].x, _969);
    float _1017 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1001);
    float _1019 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].x, _941);
    float _1021 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1003);
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1025 = fma(_857, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1023);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = _1013 + _1011;
    float _1031 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1017);
    float _1033 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1019);
    float _1035 = rsqrt(_1029);
    float _1037 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1015);
    float _1039 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1041 = -_1027;
    float _1043 = _1041 + 1.0;
    float _1045 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1047 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1051 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1053 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1021);
    float _1055 = abs(_1043);
    float _1057 = log2(_1055);
    float _1059 = -_1049;
    float _1061 = fma(_1059, _1045, 1.0);
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1065 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1067 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1063);
    float _1069 = _1035 * _979;
    float _1071 = _1035 * _991;
    float _1073 = _1035 * _987;
    float _1075 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1067);
    float _1077 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1079 = log2(_1061);
    float _1081 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1075);
    float _1083 = -_1077;
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1083);
    float _1087 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1089 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1091 = -_1073;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1085);
    float _1095 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1097 = 1.0 / _1081;
    float _1099 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1089);
    float _1101 = fma(_1093, -0.5, 0.5);
    float _1103 = fma(_1093, 0.5, 0.5);
    float _1105 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1095);
    float _1107 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1099);
    float _1109 = _1071 + 1.0;
    float _1111 = fma(_1103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1113 = exp2(_1087);
    float _1115 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1105);
    float _1117 = _1079 * 0.693147182464599609375;
    float _1119 = fma(_1103, _1111, -0.212114393711090087890625);
    float _1121 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1115);
    float _1123 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1107);
    float _1125 = fma(_1103, _1119, 1.570728778839111328125);
    float _1127 = sqrt(_1101);
    float _1129 = _1121 * _1097;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1133 = fma(_1129, 0.5, 0.5);
    float _1135 = -_1071;
    float _1137 = fma(_1113, _1109, _1135);
    float _1139 = _1123 * _1097;
    float _1141 = fma(_1137, 0.5, 0.5);
    float _1143 = fma(_1139, -0.5, 0.5);
    float _1145 = _1127 * 0.636619746685028076171875;
    float _1147 = -_1125;
    float _1149 = fma(_1145, _1147, 1.0);
    float3 _3164 = float3(_1133, _1143, _1131);
    float _1151 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3164, float3(0.0), isnan(_3164)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3164, float3(0.0), isnan(_3164)), level(0.0)).x;
    float3 _3175 = float3(_1133, _1143, _1131);
    float4 _1154 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3175, float3(0.0), isnan(_3175)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3175, float3(0.0), isnan(_3175)), level(0.0)).xyzw;
    float _1156 = _1154.x;
    float _1158 = _1154.y;
    float _1160 = _1154.z;
    float _1162 = _1154.w;
    float2 _3192 = float2(_1149, _1141);
    float3 _1166 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3192, float2(0.0), isnan(_3192)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3192, float2(0.0), isnan(_3192)), level(0.0)).xyz;
    float _1168 = _1166.x;
    float _1170 = _1166.y;
    float _1172 = _1166.z;
    float _1174 = _621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1176 = _621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1178 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1180 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1182 = isnan(0.5);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1188 = _1184 || _1186;
    float _1190 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1174);
    float _1192 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1176);
    float _1194 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1190);
    float _1198 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1192);
    float _1200 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    float _1202 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1206 = exp2(_1178);
    float _1208 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1200);
    float _1210 = _1204 + _1202;
    float _1212 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1208);
    float _1214 = 1.0 / _1202;
    float _1216 = _1210 * _1214;
    float _1218 = _1216 * 0.5;
    float _1220 = _1214;
    if (_1188)
    {
        _1220 = 1.0;
    }
    float _1222 = _1220;
    float _1224 = _1222;
    if (!_1188)
    {
        float _1226 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1228 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1230 = _1226 * 0.15915493667125701904296875;
        float _1232 = _1228 * 0.15915493667125701904296875;
        float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1236 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1234);
        float _1238 = _1230 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        float _1242 = _1230 * 6.283185482025146484375;
        float _1244 = sin(_1242);
        float _1246 = 1.0 / _1240;
        float _1248 = _1232 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1244 * _1246;
        float _1254 = _1232 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = _1250 * _1252;
        float _1260 = 1.0 / _1236;
        float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1264 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1262;
        float _1266 = 1.0 / _1258;
        float _1268 = 1.0 / _1264;
        float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1272 = _1260 * _1270;
        float _1274 = _1256 * _1266;
        float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1278 = fma(_1274, _1272, _1276);
        float _1280 = _1278 * _1268;
        float _1282 = precise::clamp(_1280, 0.0, 1.0);
        _1224 = _1282;
    }
    float _1284 = _1224;
    float _1286 = -_1206;
    float _1288 = _1286 + 1.0;
    float _1290 = _1212 + _1081;
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1294 = _1284 > 0.0;
    bool _1296 = isnan(_1284);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan(0.0);
    bool _1302 = _1298 || _1300;
    float _1304 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1306 = _1290 * 0.5;
    float _1308 = _1292 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1310 = _1304 * _1151;
    float _1312 = -_1304;
    float _1314 = _1312 + 1.0;
    out.gl_Position.x = _1121;
    out.gl_Position.y = _1123;
    out.gl_Position.z = _1212;
    out.gl_Position.w = _1081;
    float _1316 = _1162 * _1310;
    float _1318 = _1172 * _1310;
    float _1320 = _1162 * _1314;
    out.m_62.z = _1306;
    out.m_62.w = _1081;
    float _1322 = fma(_1168, _1316, _1156);
    float _1324 = fma(_1170, _1316, _1158);
    float _1326 = fma(_1162, _1318, _1160);
    out.m_45.x = _1308;
    out.m_64.x = _1322;
    out.m_64.y = _1324;
    out.m_64.z = _1326;
    out.m_64.w = _1320;
    if (_1302)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1328 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1328;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _397 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1385 = as_type<float>(_99);
        out.gl_Position.z = _1385;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1454 = as_type<float>(_135);
        out.gl_Position.z = _1454;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = 0.0;
    float _161 = _145;
    if (!_155)
    {
        float _163 = _145 * _145;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _171 = _167;
    if (!_155)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = floor(_169);
    int _179 = as_type<int>(_143) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_143) & 2;
    bool _185 = _183 != 0;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = -_177;
    float _197 = _169 + _195;
    float _199 = _169 * 6.283185482025146484375;
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _199 * 0.15915493667125701904296875;
    bool _207 = !_155;
    float _209 = _175;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _145 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _145);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_155;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _145 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _161 = _263;
    }
    float _265 = _161;
    float _267 = _205 * 6.283185482025146484375;
    float _269 = cos(_267);
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = in.m_54.w;
    bool _281 = _197 < 0.5;
    float _283 = float(_281);
    float _285 = in.m_47.x;
    float _287 = in.m_47.y;
    float _289 = in.m_47.z;
    float _291 = -_197;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = in.m_42.x;
    float _297 = in.m_42.y;
    float _299 = in.m_42.z;
    float _301 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = -_283;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _309 = fma(_269, 0.5, 0.5);
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _315 = !_189;
    int _317 = _315 ? 0 : 1;
    float _319 = -_309;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _323 = !_273;
    int _325 = _323 ? 0 : 1;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _329 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _331 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _333 = abs(_325);
    float _335 = _313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    int _339 = abs(_317);
    float _341 = fma(_265, _285, _301);
    bool _343 = !_277;
    int _345 = _343 ? 0 : 1;
    float _347 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_56.x = _329;
    out.m_56.y = _331;
    out.m_56.z = _335;
    out.m_56.w = _327;
    int _349 = abs(_345);
    float _351 = fma(_265, _287, _347);
    float _353 = float(_333);
    float _355 = float(_339);
    float _357 = fma(_351, _279, _297);
    float _359 = abs(_293);
    float _361 = _353 * _359;
    float _363 = fma(_355, _321, _361);
    float _365 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_341, _279, _295);
    float _369 = fma(_265, _289, _365);
    float _371 = float(_349);
    float _373 = fma(_369, _279, _299);
    float _375 = abs(_305);
    float _377 = fma(_371, _375, _363);
    bool _379 = !_337;
    float _395;
    if (!_379)
    {
        float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _383 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _387 = _385 * _381;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = true;
    }
    else
    {
        float _399 = float(_83);
        float _401 = 1.0 / _399;
        float _403 = _117 * _401;
        _395 = _403;
    }
    _397 = false;
    float _405 = _395;
    float _407 = in.m_49.y;
    float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _411 = _137 > 0.5;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _413;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _419 = _417 != 0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _423 = _405 + _421;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _427 = _425 != 0;
    float _429 = 1.0 / _415;
    float _431 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _437 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _439;
    bool _443 = _407 > 0.5;
    float _445 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _447 = _423 * _429;
    float _449 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].x, _445);
    bool _453 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _455 = isnan(_405);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _465;
    float _469 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    bool _471 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _473 = isnan(_405);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _483;
    float _487 = -_463;
    float _489 = _487 + 1.0;
    float _491 = fma(_467, _447, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _493 = fma(_441, _447, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _495 = fma(_485, _447, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _497 = _481 * _489;
    float _499 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    float _501 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    float _503 = -_203;
    int _505 = _411 ? as_type<int>(_503) : as_type<int>(_203);
    float _507 = _495 * _497;
    float _509 = _499 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _511 = _491 * _497;
    float _513 = -_481;
    float _515 = _513 + 1.0;
    float _517 = _437 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _519 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _521 = _509 + _519;
    float _523 = _501 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _525 = _493 * _497;
    float _527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _529 = _517 + _527;
    float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _535 = _523 + _533;
    float _537 = -_193;
    int _539 = _443 ? as_type<int>(_537) : as_type<int>(_193);
    float _541 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[123].x, _507);
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[28].x, _531);
    bool _545 = !_419;
    float _547 = _545 ? _203 : as_type<float>(_505);
    float _549 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[123].y, _511);
    bool _551 = !_427;
    float _553 = _551 ? _193 : as_type<float>(_539);
    float _555 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[28].z, _543);
    float _557 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[123].z, _525);
    float _559 = _521 * _521;
    float _561 = _547 + 0.5;
    float _563 = -_553;
    float _565 = _563 + 0.5;
    bool _567 = _555 >= 0.0;
    float _569 = fma(_529, _529, _559);
    float _571 = _561 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _573 = _565 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _575 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[124].x, _541);
    float _577 = fma(_535, _535, _569);
    float _579 = _571 * _409;
    float _581 = _573 * _435;
    float _583 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[124].y, _549);
    float _585 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[124].z, _557);
    float _587 = rsqrt(_577);
    float _589 = _575 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _591 = _583 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _593 = _463;
    float _595 = _509;
    if (_567)
    {
        _593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _597 = _593;
    float _599 = _585 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _601 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _607 = as_type<int>(_597);
    if (_567)
    {
        float _609 = _597 * 5.0;
        _607 = as_type<int>(_609);
    }
    int _611 = _607;
    out.m_58.x = _579;
    out.m_58.y = _581;
    out.m_60.x = _601;
    out.m_60.y = _603;
    out.m_60.z = _605;
    float _613 = _521 * _587;
    float _615 = _529 * _587;
    float _617 = as_type<float>(_611);
    if (_567)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2248 = as_type<float>(_611);
        out.gl_Position.z = _2248;
    }
    if (_567)
    {
        out.m_45.x = 0.0;
    }
    if (_567)
    {
        return out;
    }
    float _619 = -_613;
    float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _623 = -_615;
    float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    float _627 = _535 * _587;
    float _629 = -_613;
    float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _521);
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _635 = _621 + _633;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _639 = _625 + _637;
    float _641 = -_627;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _645 = in.m_54.x;
    float _647 = in.m_54.y;
    float _649 = _635 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _651 = -_615;
    float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _529);
    float _655 = _631 * _631;
    float _657 = -_627;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _535);
    float _661 = fma(_639, (*spvDescriptorSet0.vp_c8)._m0[28].x, _649);
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _665 = _643 + _663;
    float _667 = fma(_653, _653, _655);
    float _669 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[28].z, _661);
    float _671 = fma(_659, _659, _667);
    bool _673 = _669 >= 0.0;
    float _675 = sqrt(_671);
    float _677 = _645 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _679 = _647 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    if (_673)
    {
        _617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _681 = _617;
    int _683 = as_type<int>(_681);
    if (_673)
    {
        out.m_45.x = 0.0;
    }
    float _685 = _377 * _677;
    float _687 = _377 * _679;
    float _689 = _587 * _675;
    if (_673)
    {
        float _691 = _681 * 5.0;
        _683 = as_type<int>(_691);
    }
    int _693 = _683;
    if (_673)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2398 = as_type<float>(_693);
        out.gl_Position.z = _2398;
    }
    if (_673)
    {
        return out;
    }
    float _695 = _687 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _697 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _703 = _689 * _695;
    float _705 = _689 * _697;
    float _707 = _689 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _709 = _707 * 0.5;
    float _711 = _699 * _703;
    float _713 = _701 * _705;
    float _715 = _711 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _717 = _711 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _719 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[26].x, _715);
    float _721 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[24].x, _717);
    float _723 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[26].z, _719);
    float _725 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[24].z, _721);
    float _727 = _723 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _729 = _725 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _731 = _523 + _727;
    float _733 = _517 + _729;
    float _735 = _711 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _731 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _733 + _741;
    float _745 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[25].x, _735);
    float _747 = _739 * _739;
    float _749 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[25].z, _745);
    float _751 = fma(_743, _743, _747);
    float _753 = _749 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _755 = sqrt(_751);
    float _757 = _509 + _753;
    bool _759 = _755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _761 = _753;
    float _763 = _709;
    float _765 = _733;
    float _767 = _731;
    if (!_759)
    {
        _761 = _733;
    }
    float _769 = _761;
    float _771 = _769;
    if (!_759)
    {
        _595 = _731;
    }
    float _773 = _595;
    float _775 = _773;
    if (!_759)
    {
        _763 = _757;
    }
    float _777 = _763;
    bool _779 = !_759;
    float _781 = _777;
    if (!_779)
    {
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _785 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _787 = _755 + _785;
        float _789 = rsqrt(_751);
        float _791 = _787 * _783;
        float _793 = _757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = _791 * 0.15915493667125701904296875;
        float _797 = _795 * 6.283185482025146484375;
        float _799 = sin(_797);
        float _801 = _795 * 6.283185482025146484375;
        float _803 = cos(_801);
        float _805 = fma(_799, _793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _807 = _789 * _805;
        float _809 = _803 + (-1.0);
        float _811 = fma(_743, _807, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _813 = fma(_739, _807, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _815 = _809 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _817 = fma(_757, _803, _815);
        _781 = _817;
        _771 = _811;
        _775 = _813;
    }
    float _819 = _781;
    float _821 = _771;
    float _823 = _775;
    float _825 = -_613;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _819);
    float _829 = -_615;
    float _831 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _821);
    float _833 = -_627;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _823);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _839 = _827 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _843 = _831 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _847 = _835 + _845;
    float _849 = _839 * _839;
    float _851 = fma(_843, _843, _849);
    float _853 = fma(_847, _847, _851);
    float _855 = rsqrt(_853);
    float _857 = sqrt(_853);
    float _859 = _855 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _861 = _843 * _859;
    float _863 = _847 * _859;
    float _865 = _861 * _861;
    float _867 = _863 * _863;
    float _869 = _865 + _867;
    float _871 = sqrt(_869);
    bool _873 = _871 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _877 = _871 + _875;
    float _879 = _847;
    float _881 = _869;
    float _883 = _877;
    float _885 = _839;
    if (_873)
    {
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _887;
    }
    float _889 = _879;
    if (_873)
    {
        float _891 = rsqrt(_869);
        _881 = _891;
    }
    float _893 = _881;
    if (_873)
    {
        float _895 = _877 * _889;
        _883 = _895;
    }
    float _897 = _883;
    if (_873)
    {
        float _899 = _897 * 0.15915493667125701904296875;
        _765 = _899;
    }
    float _901 = _765;
    float _903 = _855;
    if (_873)
    {
        float _905 = _901 * 6.283185482025146484375;
        float _907 = sin(_905);
        _903 = _907;
    }
    float _909 = _903;
    float _911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _913 = precise::max(0.0, _911);
    float _915 = _851;
    float _917 = _911;
    float _919 = _913;
    if (_873)
    {
        float _921 = _901 * 6.283185482025146484375;
        float _923 = cos(_921);
        _915 = _923;
    }
    float _925 = _915;
    float _927 = -_859;
    float _929 = -_913;
    float _931 = fma(_839, _927, _929);
    if (!_873)
    {
        _885 = _861;
    }
    float _933 = _885;
    float _935 = _933;
    if (_873)
    {
        float _937 = _931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _917 = _937;
    }
    float _939 = _917;
    float _941 = _827 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _943 = _909;
    float _945 = _939;
    if (_873)
    {
        float _947 = fma(_909, _939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _767 = _947;
    }
    float _949 = _767;
    float _951 = _949;
    if (!_873)
    {
        _943 = _931;
    }
    float _953 = _943;
    float _955 = _953;
    float _957 = _925;
    if (_873)
    {
        float _959 = _925 + (-1.0);
        _945 = _959;
    }
    float _961 = _945;
    float _963 = _961;
    if (_873)
    {
        float _965 = _893 * _949;
        _951 = _965;
    }
    float _967 = _951;
    float _969 = _827 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_873)
    {
        float _971 = _961 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _919 = _971;
    }
    float _973 = _919;
    float _975 = _973;
    if (_873)
    {
        float _977 = _861 * _967;
        _935 = _977;
    }
    float _979 = _935;
    if (!_873)
    {
        _963 = _863;
    }
    float _981 = _963;
    float _983 = _981;
    if (_873)
    {
        float _985 = _863 * _967;
        _983 = _985;
    }
    float _987 = _983;
    if (_873)
    {
        float _989 = fma(_931, _925, _973);
        _955 = _989;
    }
    float _991 = _955;
    if (!_873)
    {
        _957 = _865;
    }
    float _993 = _957;
    float _995 = _993;
    if (_873)
    {
        float _997 = _979 * _979;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = _827 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1003 = _827 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_873)
    {
        _975 = _867;
    }
    float _1005 = _975;
    float _1007 = _1005;
    if (_873)
    {
        float _1009 = _987 * _987;
        _1007 = _1009;
    }
    float _1011 = _1007;
    float _1013 = fma(_991, _991, _999);
    float _1015 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].x, _969);
    float _1017 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1001);
    float _1019 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].x, _941);
    float _1021 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1003);
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1025 = fma(_857, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1023);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = _1013 + _1011;
    float _1031 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1017);
    float _1033 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1019);
    float _1035 = rsqrt(_1029);
    float _1037 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1015);
    float _1039 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1041 = -_1027;
    float _1043 = _1041 + 1.0;
    float _1045 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1047 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1051 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1053 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1021);
    float _1055 = abs(_1043);
    float _1057 = log2(_1055);
    float _1059 = -_1049;
    float _1061 = fma(_1059, _1045, 1.0);
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1065 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1067 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1063);
    float _1069 = _1035 * _979;
    float _1071 = _1035 * _991;
    float _1073 = _1035 * _987;
    float _1075 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1067);
    float _1077 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1079 = log2(_1061);
    float _1081 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1075);
    float _1083 = -_1077;
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1083);
    float _1087 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1089 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1091 = -_1073;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1085);
    float _1095 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1097 = 1.0 / _1081;
    float _1099 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1089);
    float _1101 = fma(_1093, -0.5, 0.5);
    float _1103 = fma(_1093, 0.5, 0.5);
    float _1105 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1095);
    float _1107 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1099);
    float _1109 = _1071 + 1.0;
    float _1111 = fma(_1103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1113 = exp2(_1087);
    float _1115 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1105);
    float _1117 = _1079 * 0.693147182464599609375;
    float _1119 = fma(_1103, _1111, -0.212114393711090087890625);
    float _1121 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1115);
    float _1123 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1107);
    float _1125 = fma(_1103, _1119, 1.570728778839111328125);
    float _1127 = sqrt(_1101);
    float _1129 = _1121 * _1097;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1133 = fma(_1129, 0.5, 0.5);
    float _1135 = -_1071;
    float _1137 = fma(_1113, _1109, _1135);
    float _1139 = _1123 * _1097;
    float _1141 = fma(_1137, 0.5, 0.5);
    float _1143 = fma(_1139, -0.5, 0.5);
    float _1145 = _1127 * 0.636619746685028076171875;
    float _1147 = -_1125;
    float _1149 = fma(_1145, _1147, 1.0);
    float3 _3164 = float3(_1133, _1143, _1131);
    float _1151 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3164, float3(0.0), isnan(_3164)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3164, float3(0.0), isnan(_3164)), level(0.0)).x;
    float3 _3175 = float3(_1133, _1143, _1131);
    float4 _1154 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3175, float3(0.0), isnan(_3175)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3175, float3(0.0), isnan(_3175)), level(0.0)).xyzw;
    float _1156 = _1154.x;
    float _1158 = _1154.y;
    float _1160 = _1154.z;
    float _1162 = _1154.w;
    float2 _3192 = float2(_1149, _1141);
    float3 _1166 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3192, float2(0.0), isnan(_3192)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3192, float2(0.0), isnan(_3192)), level(0.0)).xyz;
    float _1168 = _1166.x;
    float _1170 = _1166.y;
    float _1172 = _1166.z;
    float _1174 = _621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1176 = _621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1178 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1180 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1182 = isnan(0.5);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1188 = _1184 || _1186;
    float _1190 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1174);
    float _1192 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1176);
    float _1194 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1190);
    float _1198 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1192);
    float _1200 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    float _1202 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1206 = exp2(_1178);
    float _1208 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1200);
    float _1210 = _1204 + _1202;
    float _1212 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1208);
    float _1214 = 1.0 / _1202;
    float _1216 = _1210 * _1214;
    float _1218 = _1216 * 0.5;
    float _1220 = _1214;
    if (_1188)
    {
        _1220 = 1.0;
    }
    float _1222 = _1220;
    float _1224 = _1222;
    if (!_1188)
    {
        float _1226 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1228 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1230 = _1226 * 0.15915493667125701904296875;
        float _1232 = _1228 * 0.15915493667125701904296875;
        float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1236 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1234);
        float _1238 = _1230 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        float _1242 = _1230 * 6.283185482025146484375;
        float _1244 = sin(_1242);
        float _1246 = 1.0 / _1240;
        float _1248 = _1232 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1244 * _1246;
        float _1254 = _1232 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = _1250 * _1252;
        float _1260 = 1.0 / _1236;
        float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1264 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1262;
        float _1266 = 1.0 / _1258;
        float _1268 = 1.0 / _1264;
        float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1272 = _1260 * _1270;
        float _1274 = _1256 * _1266;
        float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1278 = fma(_1274, _1272, _1276);
        float _1280 = _1278 * _1268;
        float _1282 = precise::clamp(_1280, 0.0, 1.0);
        _1224 = _1282;
    }
    float _1284 = _1224;
    float _1286 = -_1206;
    float _1288 = _1286 + 1.0;
    float _1290 = _1212 + _1081;
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1294 = _1284 > 0.0;
    bool _1296 = isnan(_1284);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan(0.0);
    bool _1302 = _1298 || _1300;
    float _1304 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1306 = _1290 * 0.5;
    float _1308 = _1292 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1310 = _1304 * _1151;
    float _1312 = -_1304;
    float _1314 = _1312 + 1.0;
    out.gl_Position.x = _1121;
    out.gl_Position.y = _1123;
    out.gl_Position.z = _1212;
    out.gl_Position.w = _1081;
    float _1316 = _1162 * _1310;
    float _1318 = _1172 * _1310;
    float _1320 = _1162 * _1314;
    out.m_62.z = _1306;
    out.m_62.w = _1081;
    float _1322 = fma(_1168, _1316, _1156);
    float _1324 = fma(_1170, _1316, _1158);
    float _1326 = fma(_1162, _1318, _1160);
    out.m_45.x = _1308;
    out.m_64.x = _1322;
    out.m_64.y = _1324;
    out.m_64.z = _1326;
    out.m_64.w = _1320;
    if (_1302)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1328 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1328;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _397 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1385 = as_type<float>(_99);
        out.gl_Position.z = _1385;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1454 = as_type<float>(_135);
        out.gl_Position.z = _1454;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = 0.0;
    float _161 = _145;
    if (!_155)
    {
        float _163 = _145 * _145;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _171 = _167;
    if (!_155)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = floor(_169);
    int _179 = as_type<int>(_143) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_143) & 2;
    bool _185 = _183 != 0;
    int _187 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = -_177;
    float _197 = _169 + _195;
    float _199 = _169 * 6.283185482025146484375;
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _199 * 0.15915493667125701904296875;
    bool _207 = !_155;
    float _209 = _175;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _145 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _145);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
    }
    float _241 = _209;
    bool _243 = !_155;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _145 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _161 = _263;
    }
    float _265 = _161;
    float _267 = _205 * 6.283185482025146484375;
    float _269 = cos(_267);
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _277 = _275 != 0;
    float _279 = in.m_54.w;
    bool _281 = _197 < 0.5;
    float _283 = float(_281);
    float _285 = in.m_47.x;
    float _287 = in.m_47.y;
    float _289 = in.m_47.z;
    float _291 = -_197;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = in.m_42.x;
    float _297 = in.m_42.y;
    float _299 = in.m_42.z;
    float _301 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = -_283;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _309 = fma(_269, 0.5, 0.5);
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _315 = !_189;
    int _317 = _315 ? 0 : 1;
    float _319 = -_309;
    float _321 = fma(_319, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _323 = !_273;
    int _325 = _323 ? 0 : 1;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _329 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _331 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _333 = abs(_325);
    float _335 = _313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _337 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    int _339 = abs(_317);
    float _341 = fma(_265, _285, _301);
    bool _343 = !_277;
    int _345 = _343 ? 0 : 1;
    float _347 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    out.m_56.x = _329;
    out.m_56.y = _331;
    out.m_56.z = _335;
    out.m_56.w = _327;
    int _349 = abs(_345);
    float _351 = fma(_265, _287, _347);
    float _353 = float(_333);
    float _355 = float(_339);
    float _357 = fma(_351, _279, _297);
    float _359 = abs(_293);
    float _361 = _353 * _359;
    float _363 = fma(_355, _321, _361);
    float _365 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _367 = fma(_341, _279, _295);
    float _369 = fma(_265, _289, _365);
    float _371 = float(_349);
    float _373 = fma(_369, _279, _299);
    float _375 = abs(_305);
    float _377 = fma(_371, _375, _363);
    bool _379 = !_337;
    float _395;
    if (!_379)
    {
        float _381 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _383 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _385 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _387 = _385 * _381;
        float _389 = floor(_387);
        float _391 = -_389;
        float _393 = _387 + _391;
        _395 = _393;
        _397 = true;
    }
    else
    {
        float _399 = float(_83);
        float _401 = 1.0 / _399;
        float _403 = _117 * _401;
        _395 = _403;
    }
    _397 = false;
    float _405 = _395;
    float _407 = in.m_49.y;
    float _409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _411 = _137 > 0.5;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _413;
    int _417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _419 = _417 != 0;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _423 = _405 + _421;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _427 = _425 != 0;
    float _429 = 1.0 / _415;
    float _431 = _357 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _433 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[4].x, _431);
    float _435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _437 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[4].z, _433);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _439;
    bool _443 = _407 > 0.5;
    float _445 = _357 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _447 = _423 * _429;
    float _449 = _357 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _451 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[5].x, _445);
    bool _453 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _455 = isnan(_405);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _465;
    float _469 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[6].x, _449);
    bool _471 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _473 = isnan(_405);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _483;
    float _487 = -_463;
    float _489 = _487 + 1.0;
    float _491 = fma(_467, _447, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _493 = fma(_441, _447, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _495 = fma(_485, _447, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _497 = _481 * _489;
    float _499 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[5].z, _451);
    float _501 = fma(_373, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    float _503 = -_203;
    int _505 = _411 ? as_type<int>(_503) : as_type<int>(_203);
    float _507 = _495 * _497;
    float _509 = _499 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _511 = _491 * _497;
    float _513 = -_481;
    float _515 = _513 + 1.0;
    float _517 = _437 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _519 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _521 = _509 + _519;
    float _523 = _501 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _525 = _493 * _497;
    float _527 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _529 = _517 + _527;
    float _531 = _521 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _533 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _535 = _523 + _533;
    float _537 = -_193;
    int _539 = _443 ? as_type<int>(_537) : as_type<int>(_193);
    float _541 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[123].x, _507);
    float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[28].x, _531);
    bool _545 = !_419;
    float _547 = _545 ? _203 : as_type<float>(_505);
    float _549 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[123].y, _511);
    bool _551 = !_427;
    float _553 = _551 ? _193 : as_type<float>(_539);
    float _555 = fma(_535, (*spvDescriptorSet0.vp_c8)._m0[28].z, _543);
    float _557 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[123].z, _525);
    float _559 = _521 * _521;
    float _561 = _547 + 0.5;
    float _563 = -_553;
    float _565 = _563 + 0.5;
    bool _567 = _555 >= 0.0;
    float _569 = fma(_529, _529, _559);
    float _571 = _561 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _573 = _565 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _575 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[124].x, _541);
    float _577 = fma(_535, _535, _569);
    float _579 = _571 * _409;
    float _581 = _573 * _435;
    float _583 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[124].y, _549);
    float _585 = fma(_463, (*spvDescriptorSet0.vp_c9)._m0[124].z, _557);
    float _587 = rsqrt(_577);
    float _589 = _575 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _591 = _583 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _593 = _463;
    float _595 = _509;
    if (_567)
    {
        _593 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _597 = _593;
    float _599 = _585 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _601 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = _599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _607 = as_type<int>(_597);
    if (_567)
    {
        float _609 = _597 * 5.0;
        _607 = as_type<int>(_609);
    }
    int _611 = _607;
    out.m_58.x = _579;
    out.m_58.y = _581;
    out.m_60.x = _601;
    out.m_60.y = _603;
    out.m_60.z = _605;
    float _613 = _521 * _587;
    float _615 = _529 * _587;
    float _617 = as_type<float>(_611);
    if (_567)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2248 = as_type<float>(_611);
        out.gl_Position.z = _2248;
    }
    if (_567)
    {
        out.m_45.x = 0.0;
    }
    if (_567)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _619 = -_613;
    float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _509);
    float _623 = -_615;
    float _625 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    float _627 = _535 * _587;
    float _629 = -_613;
    float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[18].w, _521);
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _635 = _621 + _633;
    float _637 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _639 = _625 + _637;
    float _641 = -_627;
    float _643 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _645 = in.m_54.x;
    float _647 = in.m_54.y;
    float _649 = _635 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _651 = -_615;
    float _653 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _529);
    float _655 = _631 * _631;
    float _657 = -_627;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _535);
    float _661 = fma(_639, (*spvDescriptorSet0.vp_c8)._m0[28].x, _649);
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _665 = _643 + _663;
    float _667 = fma(_653, _653, _655);
    float _669 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[28].z, _661);
    float _671 = fma(_659, _659, _667);
    bool _673 = _669 >= 0.0;
    float _675 = sqrt(_671);
    float _677 = _645 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _679 = _647 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    if (_673)
    {
        _617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _681 = _617;
    int _683 = as_type<int>(_681);
    if (_673)
    {
        out.m_45.x = 0.0;
    }
    float _685 = _377 * _677;
    float _687 = _377 * _679;
    float _689 = _587 * _675;
    if (_673)
    {
        float _691 = _681 * 5.0;
        _683 = as_type<int>(_691);
    }
    int _693 = _683;
    if (_673)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2398 = as_type<float>(_693);
        out.gl_Position.z = _2398;
    }
    if (_673)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _695 = _687 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _697 = _685 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _701 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _703 = _689 * _695;
    float _705 = _689 * _697;
    float _707 = _689 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _709 = _707 * 0.5;
    float _711 = _699 * _703;
    float _713 = _701 * _705;
    float _715 = _711 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _717 = _711 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _719 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[26].x, _715);
    float _721 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[24].x, _717);
    float _723 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[26].z, _719);
    float _725 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[24].z, _721);
    float _727 = _723 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _729 = _725 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _731 = _523 + _727;
    float _733 = _517 + _729;
    float _735 = _711 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _737 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _739 = _731 + _737;
    float _741 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _743 = _733 + _741;
    float _745 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[25].x, _735);
    float _747 = _739 * _739;
    float _749 = fma(_709, (*spvDescriptorSet0.vp_c8)._m0[25].z, _745);
    float _751 = fma(_743, _743, _747);
    float _753 = _749 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _755 = sqrt(_751);
    float _757 = _509 + _753;
    bool _759 = _755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _761 = _753;
    float _763 = _709;
    float _765 = _733;
    float _767 = _731;
    if (!_759)
    {
        _761 = _733;
    }
    float _769 = _761;
    float _771 = _769;
    if (!_759)
    {
        _595 = _731;
    }
    float _773 = _595;
    float _775 = _773;
    if (!_759)
    {
        _763 = _757;
    }
    float _777 = _763;
    bool _779 = !_759;
    float _781 = _777;
    if (!_779)
    {
        float _783 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _785 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _787 = _755 + _785;
        float _789 = rsqrt(_751);
        float _791 = _787 * _783;
        float _793 = _757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _795 = _791 * 0.15915493667125701904296875;
        float _797 = _795 * 6.283185482025146484375;
        float _799 = sin(_797);
        float _801 = _795 * 6.283185482025146484375;
        float _803 = cos(_801);
        float _805 = fma(_799, _793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _807 = _789 * _805;
        float _809 = _803 + (-1.0);
        float _811 = fma(_743, _807, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _813 = fma(_739, _807, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _815 = _809 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _817 = fma(_757, _803, _815);
        _781 = _817;
        _771 = _811;
        _775 = _813;
    }
    float _819 = _781;
    float _821 = _771;
    float _823 = _775;
    float _825 = -_613;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[18].w, _819);
    float _829 = -_615;
    float _831 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[18].w, _821);
    float _833 = -_627;
    float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _823);
    float _837 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _839 = _827 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _843 = _831 + _841;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _847 = _835 + _845;
    float _849 = _839 * _839;
    float _851 = fma(_843, _843, _849);
    float _853 = fma(_847, _847, _851);
    float _855 = rsqrt(_853);
    float _857 = sqrt(_853);
    float _859 = _855 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _861 = _843 * _859;
    float _863 = _847 * _859;
    float _865 = _861 * _861;
    float _867 = _863 * _863;
    float _869 = _865 + _867;
    float _871 = sqrt(_869);
    bool _873 = _871 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _877 = _871 + _875;
    float _879 = _847;
    float _881 = _869;
    float _883 = _877;
    float _885 = _839;
    if (_873)
    {
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _879 = _887;
    }
    float _889 = _879;
    if (_873)
    {
        float _891 = rsqrt(_869);
        _881 = _891;
    }
    float _893 = _881;
    if (_873)
    {
        float _895 = _877 * _889;
        _883 = _895;
    }
    float _897 = _883;
    if (_873)
    {
        float _899 = _897 * 0.15915493667125701904296875;
        _765 = _899;
    }
    float _901 = _765;
    float _903 = _855;
    if (_873)
    {
        float _905 = _901 * 6.283185482025146484375;
        float _907 = sin(_905);
        _903 = _907;
    }
    float _909 = _903;
    float _911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _913 = precise::max(0.0, _911);
    float _915 = _851;
    float _917 = _911;
    float _919 = _913;
    if (_873)
    {
        float _921 = _901 * 6.283185482025146484375;
        float _923 = cos(_921);
        _915 = _923;
    }
    float _925 = _915;
    float _927 = -_859;
    float _929 = -_913;
    float _931 = fma(_839, _927, _929);
    if (!_873)
    {
        _885 = _861;
    }
    float _933 = _885;
    float _935 = _933;
    if (_873)
    {
        float _937 = _931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _917 = _937;
    }
    float _939 = _917;
    float _941 = _827 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _943 = _909;
    float _945 = _939;
    if (_873)
    {
        float _947 = fma(_909, _939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _767 = _947;
    }
    float _949 = _767;
    float _951 = _949;
    if (!_873)
    {
        _943 = _931;
    }
    float _953 = _943;
    float _955 = _953;
    float _957 = _925;
    if (_873)
    {
        float _959 = _925 + (-1.0);
        _945 = _959;
    }
    float _961 = _945;
    float _963 = _961;
    if (_873)
    {
        float _965 = _893 * _949;
        _951 = _965;
    }
    float _967 = _951;
    float _969 = _827 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_873)
    {
        float _971 = _961 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _919 = _971;
    }
    float _973 = _919;
    float _975 = _973;
    if (_873)
    {
        float _977 = _861 * _967;
        _935 = _977;
    }
    float _979 = _935;
    if (!_873)
    {
        _963 = _863;
    }
    float _981 = _963;
    float _983 = _981;
    if (_873)
    {
        float _985 = _863 * _967;
        _983 = _985;
    }
    float _987 = _983;
    if (_873)
    {
        float _989 = fma(_931, _925, _973);
        _955 = _989;
    }
    float _991 = _955;
    if (!_873)
    {
        _957 = _865;
    }
    float _993 = _957;
    float _995 = _993;
    if (_873)
    {
        float _997 = _979 * _979;
        _995 = _997;
    }
    float _999 = _995;
    float _1001 = _827 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1003 = _827 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (!_873)
    {
        _975 = _867;
    }
    float _1005 = _975;
    float _1007 = _1005;
    if (_873)
    {
        float _1009 = _987 * _987;
        _1007 = _1009;
    }
    float _1011 = _1007;
    float _1013 = fma(_991, _991, _999);
    float _1015 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[0].x, _969);
    float _1017 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1001);
    float _1019 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[2].x, _941);
    float _1021 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1003);
    float _1023 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1025 = fma(_857, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1023);
    float _1027 = precise::clamp(_1025, 0.0, 1.0);
    float _1029 = _1013 + _1011;
    float _1031 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1017);
    float _1033 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1019);
    float _1035 = rsqrt(_1029);
    float _1037 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1015);
    float _1039 = _1033 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1041 = -_1027;
    float _1043 = _1041 + 1.0;
    float _1045 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1047 = _1037 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1049 = _1039 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1051 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1053 = fma(_835, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1021);
    float _1055 = abs(_1043);
    float _1057 = log2(_1055);
    float _1059 = -_1049;
    float _1061 = fma(_1059, _1045, 1.0);
    float _1063 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1065 = _1053 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1067 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1063);
    float _1069 = _1035 * _979;
    float _1071 = _1035 * _991;
    float _1073 = _1035 * _987;
    float _1075 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1067);
    float _1077 = _1069 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1079 = log2(_1061);
    float _1081 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1075);
    float _1083 = -_1077;
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1083);
    float _1087 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1089 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1091 = -_1073;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1085);
    float _1095 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1097 = 1.0 / _1081;
    float _1099 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1089);
    float _1101 = fma(_1093, -0.5, 0.5);
    float _1103 = fma(_1093, 0.5, 0.5);
    float _1105 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1095);
    float _1107 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1099);
    float _1109 = _1071 + 1.0;
    float _1111 = fma(_1103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1113 = exp2(_1087);
    float _1115 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1105);
    float _1117 = _1079 * 0.693147182464599609375;
    float _1119 = fma(_1103, _1111, -0.212114393711090087890625);
    float _1121 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1115);
    float _1123 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1107);
    float _1125 = fma(_1103, _1119, 1.570728778839111328125);
    float _1127 = sqrt(_1101);
    float _1129 = _1121 * _1097;
    float _1131 = _1117 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1133 = fma(_1129, 0.5, 0.5);
    float _1135 = -_1071;
    float _1137 = fma(_1113, _1109, _1135);
    float _1139 = _1123 * _1097;
    float _1141 = fma(_1137, 0.5, 0.5);
    float _1143 = fma(_1139, -0.5, 0.5);
    float _1145 = _1127 * 0.636619746685028076171875;
    float _1147 = -_1125;
    float _1149 = fma(_1145, _1147, 1.0);
    float3 _3164 = float3(_1133, _1143, _1131);
    float _1151 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3164, float3(0.0), isnan(_3164)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3164, float3(0.0), isnan(_3164)), level(0.0)).x;
    float3 _3175 = float3(_1133, _1143, _1131);
    float4 _1154 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3175, float3(0.0), isnan(_3175)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3175, float3(0.0), isnan(_3175)), level(0.0)).xyzw;
    float _1156 = _1154.x;
    float _1158 = _1154.y;
    float _1160 = _1154.z;
    float _1162 = _1154.w;
    float2 _3192 = float2(_1149, _1141);
    float3 _1166 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3192, float2(0.0), isnan(_3192)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3192, float2(0.0), isnan(_3192)), level(0.0)).xyz;
    float _1168 = _1166.x;
    float _1170 = _1166.y;
    float _1172 = _1166.z;
    float _1174 = _621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1176 = _621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1178 = _1057 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1180 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1182 = isnan(0.5);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1188 = _1184 || _1186;
    float _1190 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1174);
    float _1192 = fma(_625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1176);
    float _1194 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1196 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1190);
    float _1198 = fma(_643, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1192);
    float _1200 = fma(_1047, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1194);
    float _1202 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1204 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1206 = exp2(_1178);
    float _1208 = fma(_1039, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1200);
    float _1210 = _1204 + _1202;
    float _1212 = fma(_1065, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1208);
    float _1214 = 1.0 / _1202;
    float _1216 = _1210 * _1214;
    float _1218 = _1216 * 0.5;
    float _1220 = _1214;
    if (_1188)
    {
        _1220 = 1.0;
    }
    float _1222 = _1220;
    float _1224 = _1222;
    if (!_1188)
    {
        float _1226 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1228 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1230 = _1226 * 0.15915493667125701904296875;
        float _1232 = _1228 * 0.15915493667125701904296875;
        float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1236 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1234);
        float _1238 = _1230 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        float _1242 = _1230 * 6.283185482025146484375;
        float _1244 = sin(_1242);
        float _1246 = 1.0 / _1240;
        float _1248 = _1232 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = _1244 * _1246;
        float _1254 = _1232 * 6.283185482025146484375;
        float _1256 = sin(_1254);
        float _1258 = _1250 * _1252;
        float _1260 = 1.0 / _1236;
        float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1264 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1262;
        float _1266 = 1.0 / _1258;
        float _1268 = 1.0 / _1264;
        float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1272 = _1260 * _1270;
        float _1274 = _1256 * _1266;
        float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1278 = fma(_1274, _1272, _1276);
        float _1280 = _1278 * _1268;
        float _1282 = precise::clamp(_1280, 0.0, 1.0);
        _1224 = _1282;
    }
    float _1284 = _1224;
    float _1286 = -_1206;
    float _1288 = _1286 + 1.0;
    float _1290 = _1212 + _1081;
    float _1292 = _1284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1294 = _1284 > 0.0;
    bool _1296 = isnan(_1284);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan(0.0);
    bool _1302 = _1298 || _1300;
    float _1304 = _1288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1306 = _1290 * 0.5;
    float _1308 = _1292 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1310 = _1304 * _1151;
    float _1312 = -_1304;
    float _1314 = _1312 + 1.0;
    out.gl_Position.x = _1121;
    out.gl_Position.y = _1123;
    out.gl_Position.z = _1212;
    out.gl_Position.w = _1081;
    float _1316 = _1162 * _1310;
    float _1318 = _1172 * _1310;
    float _1320 = _1162 * _1314;
    out.m_62.z = _1306;
    out.m_62.w = _1081;
    float _1322 = fma(_1168, _1316, _1156);
    float _1324 = fma(_1170, _1316, _1158);
    float _1326 = fma(_1162, _1318, _1160);
    out.m_45.x = _1308;
    out.m_64.x = _1322;
    out.m_64.y = _1324;
    out.m_64.z = _1326;
    out.m_64.w = _1320;
    if (_1302)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1328 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1328;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

