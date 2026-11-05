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
    float4 m_70 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_76 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
    float4 m_72 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1431 = false;
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
        float _2079 = as_type<float>(_111);
        out.gl_Position.z = _2079;
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
        float _2148 = as_type<float>(_149);
        out.gl_Position.z = _2148;
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
    float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _367 = log2(_365);
    float _369 = in.m_44.x;
    float _371 = in.m_44.y;
    float _373 = in.m_44.z;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _381 = _379 != 0;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _387 = _385 != 0;
    float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _393 = _391 != 0;
    float _395 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _361 * 2.0;
    bool _403 = _363 > 0.5;
    bool _405 = _357 > 0.5;
    float _407 = _161 * _371;
    float _409 = _167 * _371;
    bool _411 = _359 > 0.5;
    float _413 = floor(_401);
    float _415 = -_189;
    int _417 = _405 ? as_type<int>(_415) : as_type<int>(_189);
    float _419 = _173 * _371;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _423 = _421 != 0;
    float _425 = fma(_159, _369, _407);
    float _427 = -_193;
    int _429 = _411 ? as_type<int>(_427) : as_type<int>(_193);
    float _431 = fma(_165, _369, _409);
    bool _433 = _361 > 0.5;
    float _435 = fma(_171, _369, _419);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = !_377;
    float _443 = _441 ? _189 : as_type<float>(_417);
    float _445 = fma(_163, _373, _425);
    float _447 = 1.0 / _439;
    float _449 = fma(_175, _373, _435);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _453 = -_189;
    int _455 = _433 ? as_type<int>(_453) : as_type<int>(_189);
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _459 = !_381;
    float _461 = _459 ? _193 : as_type<float>(_429);
    float _463 = _357 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _481 = -_451;
    float _483 = fma(_463, 2.0, _481);
    float _485 = _463;
    float _487 = _477;
    float _489 = _369;
    if (!_423)
    {
        _485 = _361;
    }
    float _491 = _485;
    float _493 = fma(_477, -2.0, _457);
    float _495 = _479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _491;
    if (!_423)
    {
        _487 = _359;
    }
    float _499 = _487;
    float _501 = _357 * 2.0;
    float _503 = _499;
    if (!_423)
    {
        _489 = _361;
    }
    float _505 = _489;
    float _507 = _359 + _361;
    float _509 = _505;
    if (_423)
    {
        _503 = _357;
    }
    float _511 = _503;
    out.m_64.x = _399;
    out.m_64.y = _495;
    out.m_64.z = _395;
    if (_423)
    {
        _497 = _359;
    }
    float _513 = _497;
    float _515 = fma(_169, _373, _431);
    if (_423)
    {
        _509 = _359;
    }
    float _517 = _509;
    float _519 = floor(_501);
    bool _521 = _413 >= 0.0;
    bool _523 = isnan(_413);
    bool _525 = _521 || _523;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    float _531 = _359 + _357;
    float _533 = -_129;
    float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[76].x, _483);
    float _537 = _531 + (-1.0);
    float _539 = _443 + 0.5;
    int _541 = _529 ? 0 : 1;
    float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _545 = _413 > 0.0;
    float _547 = _507 + (-1.0);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _549;
    float _553 = _513 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _555 = !_387;
    float _557 = _555 ? _189 : as_type<float>(_455);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _563 = _551 * _447;
    int _565 = ~_541;
    int _567 = _565 + 1;
    int _569 = _567 + 1;
    float _571 = _449 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _573 = _569;
    if (!_545)
    {
        int _575 = ~_541;
        int _577 = _575 + 1;
        _573 = _577;
    }
    int _579 = _573;
    float _581 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _585 = _355 + _583;
    float _587 = _543 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _589 = _519 >= 0.0;
    bool _591 = isnan(_519);
    bool _593 = _589 || _591;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _601 = fma(_563, _585, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _603 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = isnan(_355);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = fma(_587, _539, _535);
    bool _617 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_355);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _493);
    int _631 = _597 ? 0 : 1;
    float _633 = -_613;
    float _635 = _633 + 1.0;
    float _637 = _561 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _639 = _461 + (-0.5);
    bool _641 = _519 > 0.0;
    float _643 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[83].w, _599);
    float _645 = _627 * _635;
    float _647 = -_637;
    float _649 = -_629;
    float _651 = fma(_647, _639, _649);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _655 = _601 * _645;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _661 = -_627;
    float _663 = _661 + 1.0;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _667 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[83].z, _657);
    float _669 = _511 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _671 = ~_631;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = fma(_553, -2.0, _665);
    int _679 = _675;
    if (!_641)
    {
        int _681 = ~_631;
        int _683 = _681 + 1;
        _679 = _683;
    }
    int _685 = _679;
    float _687 = _367 * _129;
    float _689 = -_659;
    float _691 = fma(_669, 2.0, _689);
    float _693 = _389 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _695 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _655);
    float _697 = _653 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _699 = exp2(_687);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _703 = 1.0 + _701;
    float _705 = _557 + 0.5;
    float _707 = -_129;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[81].x, _691);
    float _711 = -_193;
    int _713 = _403 ? as_type<int>(_711) : as_type<int>(_193);
    float _715 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _667);
    float _717 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _643);
    float _719 = 1.0 / _703;
    bool _721 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _723 = isnan(1.0);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _729 = _725 || _727;
    float _731 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _677);
    float _733 = fma(_697, _705, _709);
    bool _735 = !_393;
    float _737 = _735 ? _193 : as_type<float>(_713);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _743 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(0.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = -_699;
    float _755 = _753 + 1.0;
    float _757 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _759 = _737 + (-0.5);
    float _761 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _763 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[116].x, _695);
    float _765 = _751 ? _755 : 0.0;
    float _767 = -_693;
    float _769 = -_731;
    float _771 = fma(_767, _759, _769);
    float _773 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _757);
    float _775 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _761);
    bool _777 = !_467;
    int _779 = _777 ? 0 : 1;
    float _781 = _715;
    if (_729)
    {
        float _783 = _765 * _719;
        _133 = _783;
    }
    float _785 = _133;
    float _787 = _515 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _789 = !_471;
    int _791 = _789 ? 0 : 1;
    float _793 = _445 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _795 = abs(_779);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _799 = _787 + _797;
    int _801 = abs(_791);
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _805 = _793 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _809 = _571 + _807;
    float _811 = _799 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _813 = float(_795);
    float _815 = -_717;
    float _817 = _815 + 1.0;
    float _819 = float(_685);
    float _821 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[28].x, _811);
    float _823 = float(_801);
    float _825 = fma(_737, _817, _771);
    float _827 = float(_579);
    float _829 = -_773;
    float _831 = _829 + 1.0;
    float _833 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[28].z, _821);
    float _835 = _359 * 2.0;
    float _837 = -_775;
    float _839 = _837 + 1.0;
    float _841 = -_831;
    float _843 = fma(_443, _841, _615);
    float _845 = _799 * _799;
    float _847 = _813 * _827;
    float _849 = -_715;
    float _851 = _849 + 1.0;
    bool _853 = _833 >= 0.0;
    float _855 = fma(_805, _805, _845);
    float _857 = _823 * _819;
    float _859 = -_851;
    float _861 = fma(_557, _859, _733);
    float _863 = _323 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _865 = fma(_809, _809, _855);
    float _867 = _763 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _869 = fma(_461, _839, _651);
    float _871 = in.m_66.x;
    float _873 = in.m_66.y;
    float _875 = in.m_66.z;
    float _877 = _321 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _879 = _325 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _881 = rsqrt(_865);
    if (_853)
    {
        _781 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _883 = _781;
    float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _843;
    out.m_68.y = _869;
    out.m_68.z = _861;
    out.m_68.w = _825;
    int _891 = as_type<int>(_883);
    if (_853)
    {
        float _893 = _883 * 5.0;
        _891 = as_type<int>(_893);
    }
    int _895 = _891;
    float _897 = floor(_835);
    bool _899 = !_475;
    int _901 = _899 ? 0 : 1;
    out.m_70.x = _885;
    out.m_70.y = _887;
    out.m_70.z = _889;
    out.m_70.w = _867;
    if (_853)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3363 = as_type<float>(_895);
        out.gl_Position.z = _3363;
    }
    float _903 = _799 * _881;
    float _905 = _805 * _881;
    if (_853)
    {
        out.m_47.x = 0.0;
    }
    if (_853)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _907 = -_903;
    float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    float _911 = _809 * _881;
    float _913 = -_905;
    float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _917 = _847 * (-2.0);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _921 = _909 + _919;
    float _923 = -_911;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _571);
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _929 = _915 + _927;
    float _931 = _357 + (-0.5);
    float _933 = _921 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _935 = fma(_917, _871, _871);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _939 = _925 + _937;
    float _941 = fma(_581, _917, _581);
    float _943 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[28].x, _933);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].x, _935);
    float _947 = _857 * (-2.0);
    bool _949 = _897 > 0.0;
    float _951 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[28].z, _943);
    float _953 = fma(_941, _785, _945);
    float _955 = fma(_559, _947, _559);
    float _957 = fma(_947, _873, _873);
    float _959 = _359 + (-0.5);
    bool _961 = _897 >= 0.0;
    bool _963 = isnan(_897);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = _953 * 0.15915493667125701904296875;
    bool _973 = _951 >= 0.0;
    float _975 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].y, _957);
    int _977 = _969 ? 0 : 1;
    float _979 = _361 + _357;
    int _981 = abs(_901);
    float _983 = fma(_955, _785, _975);
    int _985 = ~_977;
    int _987 = _985 + 1;
    int _989 = _987 + 1;
    float _991 = _971 * 6.283185482025146484375;
    float _993 = sin(_991);
    int _995 = _989;
    float _997 = _941;
    if (!_949)
    {
        int _999 = ~_977;
        int _1001 = _999 + 1;
        _995 = _1001;
    }
    int _1003 = _995;
    float _1005 = _983 * 0.15915493667125701904296875;
    float _1007 = float(_981);
    float _1009 = float(_1003);
    float _1011 = _361 + (-0.5);
    if (_973)
    {
        _997 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1013 = _997;
    float _1015 = _971 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    int _1019 = as_type<int>(_1013);
    if (_973)
    {
        out.m_47.x = 0.0;
    }
    float _1021 = _1007 * _1009;
    if (_973)
    {
        float _1023 = _1013 * 5.0;
        _1019 = as_type<int>(_1023);
    }
    int _1025 = _1019;
    float _1027 = _1005 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    if (_973)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3571 = as_type<float>(_1025);
        out.gl_Position.z = _3571;
    }
    if (_973)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1031 = -_787;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1035 = -_793;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1039 = -_571;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1043 = -_903;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _799);
    float _1047 = _1033 * _1033;
    float _1049 = _979 + (-1.0);
    float _1051 = _1021 * (-2.0);
    float _1053 = -_905;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _805);
    float _1057 = fma(_1037, _1037, _1047);
    float _1059 = _1045 * _1045;
    float _1061 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1063 = fma(_1051, _875, _875);
    float _1065 = fma(_1041, _1041, _1057);
    float _1067 = fma(_1055, _1055, _1059);
    float _1069 = -_911;
    float _1071 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _809);
    float _1073 = fma(_1061, _1051, _1061);
    float _1075 = rsqrt(_1065);
    float _1077 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1063);
    float _1079 = fma(_1071, _1071, _1067);
    float _1081 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1083 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1085 = fma(_1073, _785, _1077);
    float _1087 = _1005 * 6.283185482025146484375;
    float _1089 = cos(_1087);
    float _1091 = _993 * _1029;
    float _1093 = sqrt(_1079);
    float _1095 = _1085 * 0.15915493667125701904296875;
    float _1097 = _1037 * _1075;
    float _1099 = in.m_72.x;
    float _1101 = in.m_72.y;
    float _1103 = _1041 * _1075;
    float _1105 = _1033 * _1075;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1109 = _1097 * _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1113 = _1103 * _1111;
    float _1115 = _1095 * 6.283185482025146484375;
    float _1117 = sin(_1115);
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1121 = -_1109;
    float _1123 = fma(_1103, _1119, _1121);
    float _1125 = _1017 * _1089;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1129 = -_1113;
    float _1131 = fma(_1105, _1127, _1129);
    float _1133 = _1123 * _1123;
    float _1135 = _881 * _1093;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1139 = _1105 * _1137;
    float _1141 = fma(_1131, _1131, _1133);
    float _1143 = _1095 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1149 = -_1139;
    float _1151 = fma(_1097, _1147, _1149);
    float _1153 = fma(_1151, _1151, _1141);
    float _1155 = fma(_1117, _1125, _1091);
    float _1157 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1159 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1161 = fma(_1117, _1091, _1125);
    float _1163 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1165 = rsqrt(_1153);
    float _1167 = _1159 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1169 = _1017 * _1029;
    float _1171 = _1163 * _1135;
    float _1173 = _1029 * _1145;
    float _1175 = _1167 * _1135;
    float _1177 = _993 * _1089;
    float _1179 = _1081 * _1171;
    float _1181 = _1089 * _1145;
    float _1183 = _1083 * _1175;
    float _1185 = -_1169;
    float _1187 = fma(_1117, _1177, _1185);
    float _1189 = _1145 * _1179;
    float _1191 = -_1179;
    float _1193 = _1117 * _1191;
    float _1195 = -_1177;
    float _1197 = fma(_1117, _1169, _1195);
    float _1199 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1017 * _1189;
    float _1205 = _1123 * _1165;
    float _1207 = _1131 * _1165;
    float _1209 = _1151 * _1165;
    float _1211 = fma(_1155, _1183, _1203);
    float _1213 = _1103 * _1205;
    float _1215 = _1105 * _1207;
    float _1217 = _993 * _1189;
    float _1219 = fma(_1181, _1183, _1193);
    float _1221 = fma(_1197, _1201, _1211);
    float _1223 = -_1213;
    float _1225 = fma(_1105, _1209, _1223);
    float _1227 = -_1215;
    float _1229 = fma(_1097, _1205, _1227);
    float _1231 = fma(_1187, _1183, _1217);
    float _1233 = fma(_1173, _1201, _1219);
    float _1235 = _1225 * _1221;
    float _1237 = _1229 * _1221;
    float _1239 = fma(_1161, _1201, _1231);
    float _1241 = fma(_1207, _1233, _1235);
    float _1243 = fma(_1209, _1233, _1237);
    float _1245 = _1097 * _1209;
    float _1247 = fma(_1097, _1239, _1241);
    float _1249 = fma(_1103, _1239, _1243);
    float _1251 = -_1245;
    float _1253 = fma(_1103, _1207, _1251);
    float _1255 = _793 + _1247;
    float _1257 = _571 + _1249;
    float _1259 = _1253 * _1221;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1263 = _1255 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1267 = _1257 + _1265;
    float _1269 = fma(_1205, _1233, _1259);
    float _1271 = _1263 * _1263;
    float _1273 = _1267 * _1267;
    float _1275 = fma(_1105, _1239, _1269);
    float _1277 = _1271 + _1273;
    float _1279 = _787 + _1275;
    float _1281 = sqrt(_1277);
    bool _1283 = _1281 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1285 = _1097;
    float _1287 = _1259;
    float _1289 = _1239;
    float _1291 = _1233;
    float _1293 = _1255;
    float _1295 = _1103;
    if (!_1283)
    {
        _1285 = _1273;
    }
    float _1297 = _1285;
    float _1299 = _1297;
    if (!_1283)
    {
        _1287 = _1271;
    }
    float _1301 = _1287;
    float _1303 = _1301;
    if (!_1283)
    {
        _1289 = _1257;
    }
    float _1305 = _1289;
    float _1307 = _1305;
    if (!_1283)
    {
        _1291 = _1279;
    }
    float _1309 = _1291;
    bool _1311 = !_1283;
    float _1313 = _1309;
    if (!_1311)
    {
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1319 = _1281 + _1317;
        float _1321 = rsqrt(_1277);
        float _1323 = _1319 * _1315;
        float _1325 = _1279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1327 = _1323 * 0.15915493667125701904296875;
        float _1329 = _1327 * 6.283185482025146484375;
        float _1331 = sin(_1329);
        float _1333 = _1327 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = fma(_1331, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1339 = _1321 * _1337;
        float _1341 = _1335 + (-1.0);
        float _1343 = fma(_1263, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1345 = fma(_1267, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1347 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1351 = _1343 + _1349;
        float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1355 = _1345 + _1353;
        float _1357 = fma(_1279, _1335, _1347);
        float _1359 = _1351 * _1351;
        float _1361 = _1355 * _1355;
        _1313 = _1357;
        _1303 = _1359;
        _1299 = _1361;
        _1293 = _1343;
        _1307 = _1345;
    }
    float _1363 = _1313;
    float _1365 = _1303;
    float _1367 = _1299;
    float _1369 = _1293;
    float _1371 = _1307;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1375 = _1363 + _1373;
    float _1377 = fma(_1375, _1375, _1365);
    float _1379 = _1377 + _1367;
    float _1381 = sqrt(_1379);
    bool _1383 = _1381 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1385 = isnan(_1381);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1391 = _1387 || _1389;
    float _1393 = _1365;
    float _1395 = _1363;
    if (!_1391)
    {
        _1393 = 1.0;
    }
    float _1397 = _1393;
    bool _1399 = !_1391;
    float _1401 = _1397;
    if (!_1399)
    {
        bool _1403 = _1381 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1405 = isnan(_1381);
        bool _1407 = _1403 || _1405;
        bool _1409 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1411 = _1407 || _1409;
        if (!_1411)
        {
            float _1413 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1415 = _1381 + _1413;
            float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1419 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1417;
            float _1421 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1423 = _1421 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1425 = 1.0 / _1419;
            float _1427 = _1415 * _1425;
            float _1429 = fma(_1427, _1423, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1401 = _1429;
            _1431 = true;
        }
        else
        {
            bool _1433 = _1381 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1435 = isnan(_1381);
            bool _1437 = _1433 || _1435;
            bool _1439 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1441 = _1437 || _1439;
            if (!_1441)
            {
                float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1445 = _1381 + _1443;
                float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1449 = _1447 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1453 = _1451 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1455 = 1.0 / _1449;
                float _1457 = _1445 * _1455;
                float _1459 = fma(_1457, _1453, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1401 = _1459;
                _1431 = true;
            }
            else
            {
                _1401 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1431 = false;
    float _1461 = _1401;
    float _1463 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1465 = _1363 + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1469 = _1369 + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1473 = _1371 + _1471;
    float _1475 = fma(_1465, _1461, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1477 = fma(_1469, _1461, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1479 = fma(_1473, _1461, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1481 = -_787;
    float _1483 = _1481 + _1475;
    float _1485 = -_793;
    float _1487 = _1485 + _1477;
    float _1489 = -_571;
    float _1491 = _1489 + _1479;
    float _1493 = _1483 * _1483;
    float _1495 = fma(_1487, _1487, _1493);
    float _1497 = fma(_1491, _1491, _1495);
    float _1499 = sqrt(_1497);
    bool _1501 = _1499 > 0.0;
    bool _1503 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1505 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan(0.5);
    bool _1511 = _1507 || _1509;
    float _1513 = _1475;
    float _1515 = _1479;
    if (!_1501)
    {
        _1395 = _1477;
    }
    float _1517 = _1395;
    bool _1519 = !_1501;
    float _1521 = _1517;
    if (!_1519)
    {
        float _1523 = _209 * _209;
        float _1525 = fma(_205, _205, _1523);
        float _1527 = rsqrt(_1497);
        float _1529 = fma(_211, _211, _1525);
        float _1531 = sqrt(_1529);
        float _1533 = _1487 * _1527;
        float _1535 = _1483 * _1527;
        float _1537 = _1491 * _1527;
        bool _1539 = _1531 > 0.0;
        float _1541 = _1531;
        _1295 = _1533;
        if (!_1539)
        {
            _1541 = _1477;
        }
        float _1543 = _1541;
        bool _1545 = !_1539;
        _1521 = _1543;
        if (!_1545)
        {
            float _1547 = rsqrt(_1529);
            float _1549 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1551 = _209 * _1547;
            float _1553 = _205 * _1547;
            float _1555 = _211 * _1547;
            float _1557 = _1535 * _1551;
            float _1559 = fma(_1533, _1553, _1557);
            float _1561 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1563 = fma(_1537, _1555, _1559);
            float _1565 = _1563 * _1561;
            float _1567 = fma(_205, _1565, _1477);
            float _1569 = fma(_209, _1565, _1475);
            float _1571 = fma(_211, _1565, _1479);
            _1521 = _1567;
            _1513 = _1569;
            _1515 = _1571;
        }
    }
    float _1573 = _1521;
    float _1575 = _1513;
    float _1577 = _1515;
    float _1579 = _1295;
    float _1581 = -_905;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    float _1585 = -_903;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    float _1589 = -_911;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1577);
    float _1593 = _1587;
    float _1595 = _1583;
    float _1597 = _1591;
    float _1599 = _1579;
    if (!_1511)
    {
        float _1601 = _921 * _921;
        float _1603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1605 = fma(_929, _929, _1601);
        float _1607 = fma(_939, _939, _1605);
        float _1609 = 1.0 / _1135;
        float _1611 = sqrt(_1607);
        float _1613 = precise::min(_1611, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1615 = _1613 * _1603;
        float _1617 = -_793;
        float _1619 = _1617 + _1573;
        float _1621 = -_571;
        float _1623 = _1621 + _1577;
        float _1625 = _1615 * _1609;
        float _1627 = -_787;
        float _1629 = _1627 + _1575;
        float _1631 = fma(_1619, _1625, _915);
        float _1633 = fma(_1629, _1625, _909);
        float _1635 = fma(_1623, _1625, _925);
        _1593 = _1633;
        _1595 = _1631;
        _1597 = _1635;
    }
    float _1637 = _1593;
    float _1639 = _1595;
    float _1641 = _1597;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1645 = _1637 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1649 = _1639 + _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1653 = _1641 + _1651;
    float _1655 = _1645 * _1645;
    float _1657 = fma(_1649, _1649, _1655);
    float _1659 = fma(_1653, _1653, _1657);
    float _1661 = rsqrt(_1659);
    float _1663 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1665 = _1649 * _1663;
    float _1667 = _1653 * _1663;
    float _1669 = _1665 * _1665;
    float _1671 = _1667 * _1667;
    float _1673 = _1669 + _1671;
    float _1675 = sqrt(_1673);
    bool _1677 = _1675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1681 = _1675 + _1679;
    float _1683 = _909;
    float _1685 = _1673;
    float _1687 = _1681;
    float _1689 = _1645;
    float _1691 = _1663;
    float _1693 = _1665;
    float _1695 = _1669;
    if (_1677)
    {
        float _1697 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1697;
    }
    float _1699 = _1683;
    if (_1677)
    {
        float _1701 = rsqrt(_1673);
        _1685 = _1701;
    }
    float _1703 = _1685;
    float _1705 = _1699;
    if (_1677)
    {
        float _1707 = _1681 * _1699;
        _1687 = _1707;
    }
    float _1709 = _1687;
    if (_1677)
    {
        float _1711 = _1709 * 0.15915493667125701904296875;
        _1599 = _1711;
    }
    float _1713 = _1599;
    float _1715 = _1661;
    if (_1677)
    {
        float _1717 = _1713 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        _1715 = _1719;
    }
    float _1721 = _1715;
    float _1723 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1725 = precise::max(0.0, _1723);
    float _1727 = _1653;
    float _1729 = _1725;
    if (_1677)
    {
        float _1731 = _1713 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        _1727 = _1733;
    }
    float _1735 = _1727;
    float _1737 = -_1663;
    float _1739 = -_1725;
    float _1741 = fma(_1645, _1737, _1739);
    if (_1677)
    {
        float _1743 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1689 = _1743;
    }
    float _1745 = _1689;
    float _1747 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1749 = _1745;
    float _1751 = _1721;
    if (_1677)
    {
        float _1753 = fma(_1721, _1745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1749 = _1753;
    }
    float _1755 = _1749;
    float _1757 = _1755;
    if (!_1677)
    {
        _1751 = _1741;
    }
    float _1759 = _1751;
    float _1761 = _1759;
    if (_1677)
    {
        float _1763 = _1735 + (-1.0);
        _1729 = _1763;
    }
    float _1765 = _1729;
    float _1767 = _1765;
    if (_1677)
    {
        float _1769 = _1703 * _1755;
        _1691 = _1769;
    }
    float _1771 = _1691;
    if (!_1677)
    {
        _1757 = _1667;
    }
    float _1773 = _1757;
    float _1775 = sqrt(_1659);
    float _1777 = _1773;
    if (_1677)
    {
        float _1779 = _1765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1705 = _1779;
    }
    float _1781 = _1705;
    if (_1677)
    {
        float _1783 = _1665 * _1771;
        _1693 = _1783;
    }
    float _1785 = _1693;
    if (_1677)
    {
        float _1787 = _1667 * _1771;
        _1777 = _1787;
    }
    float _1789 = _1777;
    if (!_1677)
    {
        _1767 = _1671;
    }
    float _1791 = _1767;
    float _1793 = _1791;
    if (_1677)
    {
        float _1795 = fma(_1741, _1735, _1781);
        _1761 = _1795;
    }
    float _1797 = _1761;
    if (_1677)
    {
        float _1799 = _1785 * _1785;
        _1695 = _1799;
    }
    float _1801 = _1695;
    if (_1677)
    {
        float _1803 = _1789 * _1789;
        _1793 = _1803;
    }
    float _1805 = _1793;
    float _1807 = fma(_1797, _1797, _1801);
    float _1809 = _1807 + _1805;
    float _1811 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1813 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1815 = fma(_1775, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1813);
    float _1817 = precise::clamp(_1815, 0.0, 1.0);
    float _1819 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1747);
    float _1821 = rsqrt(_1809);
    float _1823 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1811);
    float _1825 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1827 = -_1817;
    float _1829 = _1827 + 1.0;
    float _1831 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1833 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1823);
    float _1835 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1825);
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1839 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1831);
    float _1841 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1843 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1835);
    float _1845 = abs(_1829);
    float _1847 = log2(_1845);
    float _1849 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1839);
    float _1851 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1853 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1855 = _1821 * _1785;
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1859 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1861 = _1821 * _1797;
    float _1863 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1865 = -_1851;
    float _1867 = fma(_1865, _1837, 1.0);
    float _1869 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1819);
    float _1871 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    float _1873 = _1821 * _1789;
    float _1875 = -_1863;
    float _1877 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1875);
    float _1879 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1881 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1883 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1871);
    float _1885 = -_1873;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1877);
    float _1889 = log2(_1867);
    float _1891 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1893 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1883);
    float _1895 = fma(_1887, -0.5, 0.5);
    float _1897 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1899 = fma(_1887, 0.5, 0.5);
    float _1901 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1891);
    float _1903 = exp2(_1881);
    float _1905 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1897);
    float _1907 = fma(_1899, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1909 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1901);
    float _1911 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1905);
    float _1913 = fma(_1899, _1907, -0.212114393711090087890625);
    float _1915 = 1.0 / _1893;
    float _1917 = _1861 + 1.0;
    float _1919 = fma(_1899, _1913, 1.570728778839111328125);
    float _1921 = _1889 * 0.693147182464599609375;
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1925 = sqrt(_1895);
    float _1927 = -_1861;
    float _1929 = fma(_1903, _1917, _1927);
    float _1931 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1911);
    float _1933 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1909);
    float _1935 = fma(_1929, 0.5, 0.5);
    float _1937 = _1931 * _1915;
    float _1939 = _1933 * _1915;
    float _1941 = fma(_1937, 0.5, 0.5);
    float _1943 = fma(_1939, -0.5, 0.5);
    float _1945 = _1925 * 0.636619746685028076171875;
    float3 _5037 = float3(_1941, _1943, _1923);
    float _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5037, float3(0.0), isnan(_5037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5037, float3(0.0), isnan(_5037)), level(0.0)).x;
    float3 _5048 = float3(_1941, _1943, _1923);
    float4 _1950 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5048, float3(0.0), isnan(_5048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5048, float3(0.0), isnan(_5048)), level(0.0)).xyzw;
    float _1952 = _1950.x;
    float _1954 = _1950.y;
    float _1956 = _1950.z;
    float _1958 = _1950.w;
    float _1960 = -_1919;
    float _1962 = fma(_1945, _1960, 1.0);
    float2 _5070 = float2(_1962, _1935);
    float3 _1966 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5070, float2(0.0), isnan(_5070)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5070, float2(0.0), isnan(_5070)), level(0.0)).xyz;
    float _1968 = _1966.x;
    float _1970 = _1966.y;
    float _1972 = _1966.z;
    float _1974 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1976 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1978 = _1931 + _1893;
    float _1980 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1976);
    float _1982 = exp2(_1974);
    float _1984 = _1978 * 0.5;
    float _1986 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1980);
    float _1988 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1986);
    float _1990 = _1893 * 0.5;
    float _1992 = _1988 + _1893;
    float _1994 = fma(_1933, -0.5, _1990);
    float _1996 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1998 = _1992 * 0.5;
    float _2000 = -_1982;
    float _2002 = _2000 + 1.0;
    out.gl_Position.x = _1931;
    out.gl_Position.y = _1933;
    out.gl_Position.z = _1988;
    out.gl_Position.w = _1893;
    float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _1984;
    out.m_74.y = _1994;
    out.m_74.z = _1998;
    out.m_74.w = _1893;
    out.m_47.x = _1996;
    float _2006 = _2004 * _1947;
    float _2008 = -_2004;
    float _2010 = _2008 + 1.0;
    float _2012 = _1958 * _2006;
    float _2014 = _1958 * _2010;
    float _2016 = _1972 * _2006;
    float _2018 = fma(_1968, _2012, _1952);
    float _2020 = fma(_1970, _2012, _1954);
    float _2022 = fma(_1958, _2016, _1956);
    out.m_76.x = _2018;
    out.m_76.y = _2020;
    out.m_76.z = _2022;
    out.m_76.w = _2014;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1431 = false;
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
        float _2079 = as_type<float>(_111);
        out.gl_Position.z = _2079;
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
        float _2148 = as_type<float>(_149);
        out.gl_Position.z = _2148;
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
    float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _367 = log2(_365);
    float _369 = in.m_44.x;
    float _371 = in.m_44.y;
    float _373 = in.m_44.z;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _381 = _379 != 0;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _387 = _385 != 0;
    float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _393 = _391 != 0;
    float _395 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _361 * 2.0;
    bool _403 = _363 > 0.5;
    bool _405 = _357 > 0.5;
    float _407 = _161 * _371;
    float _409 = _167 * _371;
    bool _411 = _359 > 0.5;
    float _413 = floor(_401);
    float _415 = -_189;
    int _417 = _405 ? as_type<int>(_415) : as_type<int>(_189);
    float _419 = _173 * _371;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _423 = _421 != 0;
    float _425 = fma(_159, _369, _407);
    float _427 = -_193;
    int _429 = _411 ? as_type<int>(_427) : as_type<int>(_193);
    float _431 = fma(_165, _369, _409);
    bool _433 = _361 > 0.5;
    float _435 = fma(_171, _369, _419);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = !_377;
    float _443 = _441 ? _189 : as_type<float>(_417);
    float _445 = fma(_163, _373, _425);
    float _447 = 1.0 / _439;
    float _449 = fma(_175, _373, _435);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _453 = -_189;
    int _455 = _433 ? as_type<int>(_453) : as_type<int>(_189);
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _459 = !_381;
    float _461 = _459 ? _193 : as_type<float>(_429);
    float _463 = _357 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _481 = -_451;
    float _483 = fma(_463, 2.0, _481);
    float _485 = _463;
    float _487 = _477;
    float _489 = _369;
    if (!_423)
    {
        _485 = _361;
    }
    float _491 = _485;
    float _493 = fma(_477, -2.0, _457);
    float _495 = _479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _491;
    if (!_423)
    {
        _487 = _359;
    }
    float _499 = _487;
    float _501 = _357 * 2.0;
    float _503 = _499;
    if (!_423)
    {
        _489 = _361;
    }
    float _505 = _489;
    float _507 = _359 + _361;
    float _509 = _505;
    if (_423)
    {
        _503 = _357;
    }
    float _511 = _503;
    out.m_64.x = _399;
    out.m_64.y = _495;
    out.m_64.z = _395;
    if (_423)
    {
        _497 = _359;
    }
    float _513 = _497;
    float _515 = fma(_169, _373, _431);
    if (_423)
    {
        _509 = _359;
    }
    float _517 = _509;
    float _519 = floor(_501);
    bool _521 = _413 >= 0.0;
    bool _523 = isnan(_413);
    bool _525 = _521 || _523;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    float _531 = _359 + _357;
    float _533 = -_129;
    float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[76].x, _483);
    float _537 = _531 + (-1.0);
    float _539 = _443 + 0.5;
    int _541 = _529 ? 0 : 1;
    float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _545 = _413 > 0.0;
    float _547 = _507 + (-1.0);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _549;
    float _553 = _513 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _555 = !_387;
    float _557 = _555 ? _189 : as_type<float>(_455);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _563 = _551 * _447;
    int _565 = ~_541;
    int _567 = _565 + 1;
    int _569 = _567 + 1;
    float _571 = _449 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _573 = _569;
    if (!_545)
    {
        int _575 = ~_541;
        int _577 = _575 + 1;
        _573 = _577;
    }
    int _579 = _573;
    float _581 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _585 = _355 + _583;
    float _587 = _543 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _589 = _519 >= 0.0;
    bool _591 = isnan(_519);
    bool _593 = _589 || _591;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _601 = fma(_563, _585, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _603 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = isnan(_355);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = fma(_587, _539, _535);
    bool _617 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_355);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _493);
    int _631 = _597 ? 0 : 1;
    float _633 = -_613;
    float _635 = _633 + 1.0;
    float _637 = _561 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _639 = _461 + (-0.5);
    bool _641 = _519 > 0.0;
    float _643 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[83].w, _599);
    float _645 = _627 * _635;
    float _647 = -_637;
    float _649 = -_629;
    float _651 = fma(_647, _639, _649);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _655 = _601 * _645;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _661 = -_627;
    float _663 = _661 + 1.0;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _667 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[83].z, _657);
    float _669 = _511 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _671 = ~_631;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = fma(_553, -2.0, _665);
    int _679 = _675;
    if (!_641)
    {
        int _681 = ~_631;
        int _683 = _681 + 1;
        _679 = _683;
    }
    int _685 = _679;
    float _687 = _367 * _129;
    float _689 = -_659;
    float _691 = fma(_669, 2.0, _689);
    float _693 = _389 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _695 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _655);
    float _697 = _653 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _699 = exp2(_687);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _703 = 1.0 + _701;
    float _705 = _557 + 0.5;
    float _707 = -_129;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[81].x, _691);
    float _711 = -_193;
    int _713 = _403 ? as_type<int>(_711) : as_type<int>(_193);
    float _715 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _667);
    float _717 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _643);
    float _719 = 1.0 / _703;
    bool _721 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _723 = isnan(1.0);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _729 = _725 || _727;
    float _731 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _677);
    float _733 = fma(_697, _705, _709);
    bool _735 = !_393;
    float _737 = _735 ? _193 : as_type<float>(_713);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _743 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(0.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = -_699;
    float _755 = _753 + 1.0;
    float _757 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _759 = _737 + (-0.5);
    float _761 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _763 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[116].x, _695);
    float _765 = _751 ? _755 : 0.0;
    float _767 = -_693;
    float _769 = -_731;
    float _771 = fma(_767, _759, _769);
    float _773 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _757);
    float _775 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _761);
    bool _777 = !_467;
    int _779 = _777 ? 0 : 1;
    float _781 = _715;
    if (_729)
    {
        float _783 = _765 * _719;
        _133 = _783;
    }
    float _785 = _133;
    float _787 = _515 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _789 = !_471;
    int _791 = _789 ? 0 : 1;
    float _793 = _445 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _795 = abs(_779);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _799 = _787 + _797;
    int _801 = abs(_791);
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _805 = _793 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _809 = _571 + _807;
    float _811 = _799 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _813 = float(_795);
    float _815 = -_717;
    float _817 = _815 + 1.0;
    float _819 = float(_685);
    float _821 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[28].x, _811);
    float _823 = float(_801);
    float _825 = fma(_737, _817, _771);
    float _827 = float(_579);
    float _829 = -_773;
    float _831 = _829 + 1.0;
    float _833 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[28].z, _821);
    float _835 = _359 * 2.0;
    float _837 = -_775;
    float _839 = _837 + 1.0;
    float _841 = -_831;
    float _843 = fma(_443, _841, _615);
    float _845 = _799 * _799;
    float _847 = _813 * _827;
    float _849 = -_715;
    float _851 = _849 + 1.0;
    bool _853 = _833 >= 0.0;
    float _855 = fma(_805, _805, _845);
    float _857 = _823 * _819;
    float _859 = -_851;
    float _861 = fma(_557, _859, _733);
    float _863 = _323 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _865 = fma(_809, _809, _855);
    float _867 = _763 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _869 = fma(_461, _839, _651);
    float _871 = in.m_66.x;
    float _873 = in.m_66.y;
    float _875 = in.m_66.z;
    float _877 = _321 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _879 = _325 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _881 = rsqrt(_865);
    if (_853)
    {
        _781 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _883 = _781;
    float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _843;
    out.m_68.y = _869;
    out.m_68.z = _861;
    out.m_68.w = _825;
    int _891 = as_type<int>(_883);
    if (_853)
    {
        float _893 = _883 * 5.0;
        _891 = as_type<int>(_893);
    }
    int _895 = _891;
    float _897 = floor(_835);
    bool _899 = !_475;
    int _901 = _899 ? 0 : 1;
    out.m_70.x = _885;
    out.m_70.y = _887;
    out.m_70.z = _889;
    out.m_70.w = _867;
    if (_853)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3363 = as_type<float>(_895);
        out.gl_Position.z = _3363;
    }
    float _903 = _799 * _881;
    float _905 = _805 * _881;
    if (_853)
    {
        out.m_47.x = 0.0;
    }
    if (_853)
    {
        return out;
    }
    float _907 = -_903;
    float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    float _911 = _809 * _881;
    float _913 = -_905;
    float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _917 = _847 * (-2.0);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _921 = _909 + _919;
    float _923 = -_911;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _571);
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _929 = _915 + _927;
    float _931 = _357 + (-0.5);
    float _933 = _921 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _935 = fma(_917, _871, _871);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _939 = _925 + _937;
    float _941 = fma(_581, _917, _581);
    float _943 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[28].x, _933);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].x, _935);
    float _947 = _857 * (-2.0);
    bool _949 = _897 > 0.0;
    float _951 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[28].z, _943);
    float _953 = fma(_941, _785, _945);
    float _955 = fma(_559, _947, _559);
    float _957 = fma(_947, _873, _873);
    float _959 = _359 + (-0.5);
    bool _961 = _897 >= 0.0;
    bool _963 = isnan(_897);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = _953 * 0.15915493667125701904296875;
    bool _973 = _951 >= 0.0;
    float _975 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].y, _957);
    int _977 = _969 ? 0 : 1;
    float _979 = _361 + _357;
    int _981 = abs(_901);
    float _983 = fma(_955, _785, _975);
    int _985 = ~_977;
    int _987 = _985 + 1;
    int _989 = _987 + 1;
    float _991 = _971 * 6.283185482025146484375;
    float _993 = sin(_991);
    int _995 = _989;
    float _997 = _941;
    if (!_949)
    {
        int _999 = ~_977;
        int _1001 = _999 + 1;
        _995 = _1001;
    }
    int _1003 = _995;
    float _1005 = _983 * 0.15915493667125701904296875;
    float _1007 = float(_981);
    float _1009 = float(_1003);
    float _1011 = _361 + (-0.5);
    if (_973)
    {
        _997 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1013 = _997;
    float _1015 = _971 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    int _1019 = as_type<int>(_1013);
    if (_973)
    {
        out.m_47.x = 0.0;
    }
    float _1021 = _1007 * _1009;
    if (_973)
    {
        float _1023 = _1013 * 5.0;
        _1019 = as_type<int>(_1023);
    }
    int _1025 = _1019;
    float _1027 = _1005 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    if (_973)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3571 = as_type<float>(_1025);
        out.gl_Position.z = _3571;
    }
    if (_973)
    {
        return out;
    }
    float _1031 = -_787;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1035 = -_793;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1039 = -_571;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1043 = -_903;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _799);
    float _1047 = _1033 * _1033;
    float _1049 = _979 + (-1.0);
    float _1051 = _1021 * (-2.0);
    float _1053 = -_905;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _805);
    float _1057 = fma(_1037, _1037, _1047);
    float _1059 = _1045 * _1045;
    float _1061 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1063 = fma(_1051, _875, _875);
    float _1065 = fma(_1041, _1041, _1057);
    float _1067 = fma(_1055, _1055, _1059);
    float _1069 = -_911;
    float _1071 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _809);
    float _1073 = fma(_1061, _1051, _1061);
    float _1075 = rsqrt(_1065);
    float _1077 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1063);
    float _1079 = fma(_1071, _1071, _1067);
    float _1081 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1083 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1085 = fma(_1073, _785, _1077);
    float _1087 = _1005 * 6.283185482025146484375;
    float _1089 = cos(_1087);
    float _1091 = _993 * _1029;
    float _1093 = sqrt(_1079);
    float _1095 = _1085 * 0.15915493667125701904296875;
    float _1097 = _1037 * _1075;
    float _1099 = in.m_72.x;
    float _1101 = in.m_72.y;
    float _1103 = _1041 * _1075;
    float _1105 = _1033 * _1075;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1109 = _1097 * _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1113 = _1103 * _1111;
    float _1115 = _1095 * 6.283185482025146484375;
    float _1117 = sin(_1115);
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1121 = -_1109;
    float _1123 = fma(_1103, _1119, _1121);
    float _1125 = _1017 * _1089;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1129 = -_1113;
    float _1131 = fma(_1105, _1127, _1129);
    float _1133 = _1123 * _1123;
    float _1135 = _881 * _1093;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1139 = _1105 * _1137;
    float _1141 = fma(_1131, _1131, _1133);
    float _1143 = _1095 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1149 = -_1139;
    float _1151 = fma(_1097, _1147, _1149);
    float _1153 = fma(_1151, _1151, _1141);
    float _1155 = fma(_1117, _1125, _1091);
    float _1157 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1159 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1161 = fma(_1117, _1091, _1125);
    float _1163 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1165 = rsqrt(_1153);
    float _1167 = _1159 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1169 = _1017 * _1029;
    float _1171 = _1163 * _1135;
    float _1173 = _1029 * _1145;
    float _1175 = _1167 * _1135;
    float _1177 = _993 * _1089;
    float _1179 = _1081 * _1171;
    float _1181 = _1089 * _1145;
    float _1183 = _1083 * _1175;
    float _1185 = -_1169;
    float _1187 = fma(_1117, _1177, _1185);
    float _1189 = _1145 * _1179;
    float _1191 = -_1179;
    float _1193 = _1117 * _1191;
    float _1195 = -_1177;
    float _1197 = fma(_1117, _1169, _1195);
    float _1199 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1017 * _1189;
    float _1205 = _1123 * _1165;
    float _1207 = _1131 * _1165;
    float _1209 = _1151 * _1165;
    float _1211 = fma(_1155, _1183, _1203);
    float _1213 = _1103 * _1205;
    float _1215 = _1105 * _1207;
    float _1217 = _993 * _1189;
    float _1219 = fma(_1181, _1183, _1193);
    float _1221 = fma(_1197, _1201, _1211);
    float _1223 = -_1213;
    float _1225 = fma(_1105, _1209, _1223);
    float _1227 = -_1215;
    float _1229 = fma(_1097, _1205, _1227);
    float _1231 = fma(_1187, _1183, _1217);
    float _1233 = fma(_1173, _1201, _1219);
    float _1235 = _1225 * _1221;
    float _1237 = _1229 * _1221;
    float _1239 = fma(_1161, _1201, _1231);
    float _1241 = fma(_1207, _1233, _1235);
    float _1243 = fma(_1209, _1233, _1237);
    float _1245 = _1097 * _1209;
    float _1247 = fma(_1097, _1239, _1241);
    float _1249 = fma(_1103, _1239, _1243);
    float _1251 = -_1245;
    float _1253 = fma(_1103, _1207, _1251);
    float _1255 = _793 + _1247;
    float _1257 = _571 + _1249;
    float _1259 = _1253 * _1221;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1263 = _1255 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1267 = _1257 + _1265;
    float _1269 = fma(_1205, _1233, _1259);
    float _1271 = _1263 * _1263;
    float _1273 = _1267 * _1267;
    float _1275 = fma(_1105, _1239, _1269);
    float _1277 = _1271 + _1273;
    float _1279 = _787 + _1275;
    float _1281 = sqrt(_1277);
    bool _1283 = _1281 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1285 = _1097;
    float _1287 = _1259;
    float _1289 = _1239;
    float _1291 = _1233;
    float _1293 = _1255;
    float _1295 = _1103;
    if (!_1283)
    {
        _1285 = _1273;
    }
    float _1297 = _1285;
    float _1299 = _1297;
    if (!_1283)
    {
        _1287 = _1271;
    }
    float _1301 = _1287;
    float _1303 = _1301;
    if (!_1283)
    {
        _1289 = _1257;
    }
    float _1305 = _1289;
    float _1307 = _1305;
    if (!_1283)
    {
        _1291 = _1279;
    }
    float _1309 = _1291;
    bool _1311 = !_1283;
    float _1313 = _1309;
    if (!_1311)
    {
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1319 = _1281 + _1317;
        float _1321 = rsqrt(_1277);
        float _1323 = _1319 * _1315;
        float _1325 = _1279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1327 = _1323 * 0.15915493667125701904296875;
        float _1329 = _1327 * 6.283185482025146484375;
        float _1331 = sin(_1329);
        float _1333 = _1327 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = fma(_1331, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1339 = _1321 * _1337;
        float _1341 = _1335 + (-1.0);
        float _1343 = fma(_1263, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1345 = fma(_1267, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1347 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1351 = _1343 + _1349;
        float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1355 = _1345 + _1353;
        float _1357 = fma(_1279, _1335, _1347);
        float _1359 = _1351 * _1351;
        float _1361 = _1355 * _1355;
        _1313 = _1357;
        _1303 = _1359;
        _1299 = _1361;
        _1293 = _1343;
        _1307 = _1345;
    }
    float _1363 = _1313;
    float _1365 = _1303;
    float _1367 = _1299;
    float _1369 = _1293;
    float _1371 = _1307;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1375 = _1363 + _1373;
    float _1377 = fma(_1375, _1375, _1365);
    float _1379 = _1377 + _1367;
    float _1381 = sqrt(_1379);
    bool _1383 = _1381 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1385 = isnan(_1381);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1391 = _1387 || _1389;
    float _1393 = _1365;
    float _1395 = _1363;
    if (!_1391)
    {
        _1393 = 1.0;
    }
    float _1397 = _1393;
    bool _1399 = !_1391;
    float _1401 = _1397;
    if (!_1399)
    {
        bool _1403 = _1381 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1405 = isnan(_1381);
        bool _1407 = _1403 || _1405;
        bool _1409 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1411 = _1407 || _1409;
        if (!_1411)
        {
            float _1413 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1415 = _1381 + _1413;
            float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1419 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1417;
            float _1421 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1423 = _1421 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1425 = 1.0 / _1419;
            float _1427 = _1415 * _1425;
            float _1429 = fma(_1427, _1423, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1401 = _1429;
            _1431 = true;
        }
        else
        {
            bool _1433 = _1381 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1435 = isnan(_1381);
            bool _1437 = _1433 || _1435;
            bool _1439 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1441 = _1437 || _1439;
            if (!_1441)
            {
                float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1445 = _1381 + _1443;
                float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1449 = _1447 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1453 = _1451 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1455 = 1.0 / _1449;
                float _1457 = _1445 * _1455;
                float _1459 = fma(_1457, _1453, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1401 = _1459;
                _1431 = true;
            }
            else
            {
                _1401 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1431 = false;
    float _1461 = _1401;
    float _1463 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1465 = _1363 + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1469 = _1369 + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1473 = _1371 + _1471;
    float _1475 = fma(_1465, _1461, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1477 = fma(_1469, _1461, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1479 = fma(_1473, _1461, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1481 = -_787;
    float _1483 = _1481 + _1475;
    float _1485 = -_793;
    float _1487 = _1485 + _1477;
    float _1489 = -_571;
    float _1491 = _1489 + _1479;
    float _1493 = _1483 * _1483;
    float _1495 = fma(_1487, _1487, _1493);
    float _1497 = fma(_1491, _1491, _1495);
    float _1499 = sqrt(_1497);
    bool _1501 = _1499 > 0.0;
    bool _1503 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1505 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan(0.5);
    bool _1511 = _1507 || _1509;
    float _1513 = _1475;
    float _1515 = _1479;
    if (!_1501)
    {
        _1395 = _1477;
    }
    float _1517 = _1395;
    bool _1519 = !_1501;
    float _1521 = _1517;
    if (!_1519)
    {
        float _1523 = _209 * _209;
        float _1525 = fma(_205, _205, _1523);
        float _1527 = rsqrt(_1497);
        float _1529 = fma(_211, _211, _1525);
        float _1531 = sqrt(_1529);
        float _1533 = _1487 * _1527;
        float _1535 = _1483 * _1527;
        float _1537 = _1491 * _1527;
        bool _1539 = _1531 > 0.0;
        float _1541 = _1531;
        _1295 = _1533;
        if (!_1539)
        {
            _1541 = _1477;
        }
        float _1543 = _1541;
        bool _1545 = !_1539;
        _1521 = _1543;
        if (!_1545)
        {
            float _1547 = rsqrt(_1529);
            float _1549 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1551 = _209 * _1547;
            float _1553 = _205 * _1547;
            float _1555 = _211 * _1547;
            float _1557 = _1535 * _1551;
            float _1559 = fma(_1533, _1553, _1557);
            float _1561 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1563 = fma(_1537, _1555, _1559);
            float _1565 = _1563 * _1561;
            float _1567 = fma(_205, _1565, _1477);
            float _1569 = fma(_209, _1565, _1475);
            float _1571 = fma(_211, _1565, _1479);
            _1521 = _1567;
            _1513 = _1569;
            _1515 = _1571;
        }
    }
    float _1573 = _1521;
    float _1575 = _1513;
    float _1577 = _1515;
    float _1579 = _1295;
    float _1581 = -_905;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    float _1585 = -_903;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    float _1589 = -_911;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1577);
    float _1593 = _1587;
    float _1595 = _1583;
    float _1597 = _1591;
    float _1599 = _1579;
    if (!_1511)
    {
        float _1601 = _921 * _921;
        float _1603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1605 = fma(_929, _929, _1601);
        float _1607 = fma(_939, _939, _1605);
        float _1609 = 1.0 / _1135;
        float _1611 = sqrt(_1607);
        float _1613 = precise::min(_1611, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1615 = _1613 * _1603;
        float _1617 = -_793;
        float _1619 = _1617 + _1573;
        float _1621 = -_571;
        float _1623 = _1621 + _1577;
        float _1625 = _1615 * _1609;
        float _1627 = -_787;
        float _1629 = _1627 + _1575;
        float _1631 = fma(_1619, _1625, _915);
        float _1633 = fma(_1629, _1625, _909);
        float _1635 = fma(_1623, _1625, _925);
        _1593 = _1633;
        _1595 = _1631;
        _1597 = _1635;
    }
    float _1637 = _1593;
    float _1639 = _1595;
    float _1641 = _1597;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1645 = _1637 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1649 = _1639 + _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1653 = _1641 + _1651;
    float _1655 = _1645 * _1645;
    float _1657 = fma(_1649, _1649, _1655);
    float _1659 = fma(_1653, _1653, _1657);
    float _1661 = rsqrt(_1659);
    float _1663 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1665 = _1649 * _1663;
    float _1667 = _1653 * _1663;
    float _1669 = _1665 * _1665;
    float _1671 = _1667 * _1667;
    float _1673 = _1669 + _1671;
    float _1675 = sqrt(_1673);
    bool _1677 = _1675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1681 = _1675 + _1679;
    float _1683 = _909;
    float _1685 = _1673;
    float _1687 = _1681;
    float _1689 = _1645;
    float _1691 = _1663;
    float _1693 = _1665;
    float _1695 = _1669;
    if (_1677)
    {
        float _1697 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1697;
    }
    float _1699 = _1683;
    if (_1677)
    {
        float _1701 = rsqrt(_1673);
        _1685 = _1701;
    }
    float _1703 = _1685;
    float _1705 = _1699;
    if (_1677)
    {
        float _1707 = _1681 * _1699;
        _1687 = _1707;
    }
    float _1709 = _1687;
    if (_1677)
    {
        float _1711 = _1709 * 0.15915493667125701904296875;
        _1599 = _1711;
    }
    float _1713 = _1599;
    float _1715 = _1661;
    if (_1677)
    {
        float _1717 = _1713 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        _1715 = _1719;
    }
    float _1721 = _1715;
    float _1723 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1725 = precise::max(0.0, _1723);
    float _1727 = _1653;
    float _1729 = _1725;
    if (_1677)
    {
        float _1731 = _1713 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        _1727 = _1733;
    }
    float _1735 = _1727;
    float _1737 = -_1663;
    float _1739 = -_1725;
    float _1741 = fma(_1645, _1737, _1739);
    if (_1677)
    {
        float _1743 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1689 = _1743;
    }
    float _1745 = _1689;
    float _1747 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1749 = _1745;
    float _1751 = _1721;
    if (_1677)
    {
        float _1753 = fma(_1721, _1745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1749 = _1753;
    }
    float _1755 = _1749;
    float _1757 = _1755;
    if (!_1677)
    {
        _1751 = _1741;
    }
    float _1759 = _1751;
    float _1761 = _1759;
    if (_1677)
    {
        float _1763 = _1735 + (-1.0);
        _1729 = _1763;
    }
    float _1765 = _1729;
    float _1767 = _1765;
    if (_1677)
    {
        float _1769 = _1703 * _1755;
        _1691 = _1769;
    }
    float _1771 = _1691;
    if (!_1677)
    {
        _1757 = _1667;
    }
    float _1773 = _1757;
    float _1775 = sqrt(_1659);
    float _1777 = _1773;
    if (_1677)
    {
        float _1779 = _1765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1705 = _1779;
    }
    float _1781 = _1705;
    if (_1677)
    {
        float _1783 = _1665 * _1771;
        _1693 = _1783;
    }
    float _1785 = _1693;
    if (_1677)
    {
        float _1787 = _1667 * _1771;
        _1777 = _1787;
    }
    float _1789 = _1777;
    if (!_1677)
    {
        _1767 = _1671;
    }
    float _1791 = _1767;
    float _1793 = _1791;
    if (_1677)
    {
        float _1795 = fma(_1741, _1735, _1781);
        _1761 = _1795;
    }
    float _1797 = _1761;
    if (_1677)
    {
        float _1799 = _1785 * _1785;
        _1695 = _1799;
    }
    float _1801 = _1695;
    if (_1677)
    {
        float _1803 = _1789 * _1789;
        _1793 = _1803;
    }
    float _1805 = _1793;
    float _1807 = fma(_1797, _1797, _1801);
    float _1809 = _1807 + _1805;
    float _1811 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1813 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1815 = fma(_1775, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1813);
    float _1817 = precise::clamp(_1815, 0.0, 1.0);
    float _1819 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1747);
    float _1821 = rsqrt(_1809);
    float _1823 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1811);
    float _1825 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1827 = -_1817;
    float _1829 = _1827 + 1.0;
    float _1831 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1833 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1823);
    float _1835 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1825);
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1839 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1831);
    float _1841 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1843 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1835);
    float _1845 = abs(_1829);
    float _1847 = log2(_1845);
    float _1849 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1839);
    float _1851 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1853 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1855 = _1821 * _1785;
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1859 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1861 = _1821 * _1797;
    float _1863 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1865 = -_1851;
    float _1867 = fma(_1865, _1837, 1.0);
    float _1869 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1819);
    float _1871 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    float _1873 = _1821 * _1789;
    float _1875 = -_1863;
    float _1877 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1875);
    float _1879 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1881 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1883 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1871);
    float _1885 = -_1873;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1877);
    float _1889 = log2(_1867);
    float _1891 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1893 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1883);
    float _1895 = fma(_1887, -0.5, 0.5);
    float _1897 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1899 = fma(_1887, 0.5, 0.5);
    float _1901 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1891);
    float _1903 = exp2(_1881);
    float _1905 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1897);
    float _1907 = fma(_1899, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1909 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1901);
    float _1911 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1905);
    float _1913 = fma(_1899, _1907, -0.212114393711090087890625);
    float _1915 = 1.0 / _1893;
    float _1917 = _1861 + 1.0;
    float _1919 = fma(_1899, _1913, 1.570728778839111328125);
    float _1921 = _1889 * 0.693147182464599609375;
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1925 = sqrt(_1895);
    float _1927 = -_1861;
    float _1929 = fma(_1903, _1917, _1927);
    float _1931 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1911);
    float _1933 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1909);
    float _1935 = fma(_1929, 0.5, 0.5);
    float _1937 = _1931 * _1915;
    float _1939 = _1933 * _1915;
    float _1941 = fma(_1937, 0.5, 0.5);
    float _1943 = fma(_1939, -0.5, 0.5);
    float _1945 = _1925 * 0.636619746685028076171875;
    float3 _5037 = float3(_1941, _1943, _1923);
    float _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5037, float3(0.0), isnan(_5037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5037, float3(0.0), isnan(_5037)), level(0.0)).x;
    float3 _5048 = float3(_1941, _1943, _1923);
    float4 _1950 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5048, float3(0.0), isnan(_5048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5048, float3(0.0), isnan(_5048)), level(0.0)).xyzw;
    float _1952 = _1950.x;
    float _1954 = _1950.y;
    float _1956 = _1950.z;
    float _1958 = _1950.w;
    float _1960 = -_1919;
    float _1962 = fma(_1945, _1960, 1.0);
    float2 _5070 = float2(_1962, _1935);
    float3 _1966 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5070, float2(0.0), isnan(_5070)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5070, float2(0.0), isnan(_5070)), level(0.0)).xyz;
    float _1968 = _1966.x;
    float _1970 = _1966.y;
    float _1972 = _1966.z;
    float _1974 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1976 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1978 = _1931 + _1893;
    float _1980 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1976);
    float _1982 = exp2(_1974);
    float _1984 = _1978 * 0.5;
    float _1986 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1980);
    float _1988 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1986);
    float _1990 = _1893 * 0.5;
    float _1992 = _1988 + _1893;
    float _1994 = fma(_1933, -0.5, _1990);
    float _1996 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1998 = _1992 * 0.5;
    float _2000 = -_1982;
    float _2002 = _2000 + 1.0;
    out.gl_Position.x = _1931;
    out.gl_Position.y = _1933;
    out.gl_Position.z = _1988;
    out.gl_Position.w = _1893;
    float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _1984;
    out.m_74.y = _1994;
    out.m_74.z = _1998;
    out.m_74.w = _1893;
    out.m_47.x = _1996;
    float _2006 = _2004 * _1947;
    float _2008 = -_2004;
    float _2010 = _2008 + 1.0;
    float _2012 = _1958 * _2006;
    float _2014 = _1958 * _2010;
    float _2016 = _1972 * _2006;
    float _2018 = fma(_1968, _2012, _1952);
    float _2020 = fma(_1970, _2012, _1954);
    float _2022 = fma(_1958, _2016, _1956);
    out.m_76.x = _2018;
    out.m_76.y = _2020;
    out.m_76.z = _2022;
    out.m_76.w = _2014;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1431 = false;
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
        float _2079 = as_type<float>(_111);
        out.gl_Position.z = _2079;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2148 = as_type<float>(_149);
        out.gl_Position.z = _2148;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _367 = log2(_365);
    float _369 = in.m_44.x;
    float _371 = in.m_44.y;
    float _373 = in.m_44.z;
    int _375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _377 = _375 != 0;
    int _379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _381 = _379 != 0;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _385 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _387 = _385 != 0;
    float _389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _393 = _391 != 0;
    float _395 = _383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _399 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _401 = _361 * 2.0;
    bool _403 = _363 > 0.5;
    bool _405 = _357 > 0.5;
    float _407 = _161 * _371;
    float _409 = _167 * _371;
    bool _411 = _359 > 0.5;
    float _413 = floor(_401);
    float _415 = -_189;
    int _417 = _405 ? as_type<int>(_415) : as_type<int>(_189);
    float _419 = _173 * _371;
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _423 = _421 != 0;
    float _425 = fma(_159, _369, _407);
    float _427 = -_193;
    int _429 = _411 ? as_type<int>(_427) : as_type<int>(_193);
    float _431 = fma(_165, _369, _409);
    bool _433 = _361 > 0.5;
    float _435 = fma(_171, _369, _419);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = !_377;
    float _443 = _441 ? _189 : as_type<float>(_417);
    float _445 = fma(_163, _373, _425);
    float _447 = 1.0 / _439;
    float _449 = fma(_175, _373, _435);
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _453 = -_189;
    int _455 = _433 ? as_type<int>(_453) : as_type<int>(_189);
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _459 = !_381;
    float _461 = _459 ? _193 : as_type<float>(_429);
    float _463 = _357 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _467 = _465 != 0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _471 = _469 != 0;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _475 = _473 != 0;
    float _477 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _481 = -_451;
    float _483 = fma(_463, 2.0, _481);
    float _485 = _463;
    float _487 = _477;
    float _489 = _369;
    if (!_423)
    {
        _485 = _361;
    }
    float _491 = _485;
    float _493 = fma(_477, -2.0, _457);
    float _495 = _479 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _491;
    if (!_423)
    {
        _487 = _359;
    }
    float _499 = _487;
    float _501 = _357 * 2.0;
    float _503 = _499;
    if (!_423)
    {
        _489 = _361;
    }
    float _505 = _489;
    float _507 = _359 + _361;
    float _509 = _505;
    if (_423)
    {
        _503 = _357;
    }
    float _511 = _503;
    out.m_64.x = _399;
    out.m_64.y = _495;
    out.m_64.z = _395;
    if (_423)
    {
        _497 = _359;
    }
    float _513 = _497;
    float _515 = fma(_169, _373, _431);
    if (_423)
    {
        _509 = _359;
    }
    float _517 = _509;
    float _519 = floor(_501);
    bool _521 = _413 >= 0.0;
    bool _523 = isnan(_413);
    bool _525 = _521 || _523;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    float _531 = _359 + _357;
    float _533 = -_129;
    float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[76].x, _483);
    float _537 = _531 + (-1.0);
    float _539 = _443 + 0.5;
    int _541 = _529 ? 0 : 1;
    float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _545 = _413 > 0.0;
    float _547 = _507 + (-1.0);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _549;
    float _553 = _513 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _555 = !_387;
    float _557 = _555 ? _189 : as_type<float>(_455);
    float _559 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _561 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _563 = _551 * _447;
    int _565 = ~_541;
    int _567 = _565 + 1;
    int _569 = _567 + 1;
    float _571 = _449 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _573 = _569;
    if (!_545)
    {
        int _575 = ~_541;
        int _577 = _575 + 1;
        _573 = _577;
    }
    int _579 = _573;
    float _581 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _585 = _355 + _583;
    float _587 = _543 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _589 = _519 >= 0.0;
    bool _591 = isnan(_519);
    bool _593 = _589 || _591;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _601 = fma(_563, _585, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _603 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _605 = isnan(_355);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = fma(_587, _539, _535);
    bool _617 = _355 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _619 = isnan(_355);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _493);
    int _631 = _597 ? 0 : 1;
    float _633 = -_613;
    float _635 = _633 + 1.0;
    float _637 = _561 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _639 = _461 + (-0.5);
    bool _641 = _519 > 0.0;
    float _643 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[83].w, _599);
    float _645 = _627 * _635;
    float _647 = -_637;
    float _649 = -_629;
    float _651 = fma(_647, _639, _649);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _655 = _601 * _645;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _661 = -_627;
    float _663 = _661 + 1.0;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _667 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[83].z, _657);
    float _669 = _511 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _671 = ~_631;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = fma(_553, -2.0, _665);
    int _679 = _675;
    if (!_641)
    {
        int _681 = ~_631;
        int _683 = _681 + 1;
        _679 = _683;
    }
    int _685 = _679;
    float _687 = _367 * _129;
    float _689 = -_659;
    float _691 = fma(_669, 2.0, _689);
    float _693 = _389 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _695 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _655);
    float _697 = _653 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _699 = exp2(_687);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _703 = 1.0 + _701;
    float _705 = _557 + 0.5;
    float _707 = -_129;
    float _709 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[81].x, _691);
    float _711 = -_193;
    int _713 = _403 ? as_type<int>(_711) : as_type<int>(_193);
    float _715 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _667);
    float _717 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _643);
    float _719 = 1.0 / _703;
    bool _721 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _723 = isnan(1.0);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _729 = _725 || _727;
    float _731 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _677);
    float _733 = fma(_697, _705, _709);
    bool _735 = !_393;
    float _737 = _735 ? _193 : as_type<float>(_713);
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _743 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _745 = isnan(0.0);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _751 = _747 || _749;
    float _753 = -_699;
    float _755 = _753 + 1.0;
    float _757 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[78].z, _739);
    float _759 = _737 + (-0.5);
    float _761 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].w, _741);
    float _763 = fma(_613, (*spvDescriptorSet0.vp_c9)._m0[116].x, _695);
    float _765 = _751 ? _755 : 0.0;
    float _767 = -_693;
    float _769 = -_731;
    float _771 = fma(_767, _759, _769);
    float _773 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _757);
    float _775 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _761);
    bool _777 = !_467;
    int _779 = _777 ? 0 : 1;
    float _781 = _715;
    if (_729)
    {
        float _783 = _765 * _719;
        _133 = _783;
    }
    float _785 = _133;
    float _787 = _515 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _789 = !_471;
    int _791 = _789 ? 0 : 1;
    float _793 = _445 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _795 = abs(_779);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _799 = _787 + _797;
    int _801 = abs(_791);
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _805 = _793 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _809 = _571 + _807;
    float _811 = _799 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _813 = float(_795);
    float _815 = -_717;
    float _817 = _815 + 1.0;
    float _819 = float(_685);
    float _821 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[28].x, _811);
    float _823 = float(_801);
    float _825 = fma(_737, _817, _771);
    float _827 = float(_579);
    float _829 = -_773;
    float _831 = _829 + 1.0;
    float _833 = fma(_809, (*spvDescriptorSet0.vp_c8)._m0[28].z, _821);
    float _835 = _359 * 2.0;
    float _837 = -_775;
    float _839 = _837 + 1.0;
    float _841 = -_831;
    float _843 = fma(_443, _841, _615);
    float _845 = _799 * _799;
    float _847 = _813 * _827;
    float _849 = -_715;
    float _851 = _849 + 1.0;
    bool _853 = _833 >= 0.0;
    float _855 = fma(_805, _805, _845);
    float _857 = _823 * _819;
    float _859 = -_851;
    float _861 = fma(_557, _859, _733);
    float _863 = _323 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _865 = fma(_809, _809, _855);
    float _867 = _763 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _869 = fma(_461, _839, _651);
    float _871 = in.m_66.x;
    float _873 = in.m_66.y;
    float _875 = in.m_66.z;
    float _877 = _321 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _879 = _325 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _881 = rsqrt(_865);
    if (_853)
    {
        _781 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _883 = _781;
    float _885 = _877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _887 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _889 = _879 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _843;
    out.m_68.y = _869;
    out.m_68.z = _861;
    out.m_68.w = _825;
    int _891 = as_type<int>(_883);
    if (_853)
    {
        float _893 = _883 * 5.0;
        _891 = as_type<int>(_893);
    }
    int _895 = _891;
    float _897 = floor(_835);
    bool _899 = !_475;
    int _901 = _899 ? 0 : 1;
    out.m_70.x = _885;
    out.m_70.y = _887;
    out.m_70.z = _889;
    out.m_70.w = _867;
    if (_853)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3363 = as_type<float>(_895);
        out.gl_Position.z = _3363;
    }
    float _903 = _799 * _881;
    float _905 = _805 * _881;
    if (_853)
    {
        out.m_47.x = 0.0;
    }
    if (_853)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _907 = -_903;
    float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[18].w, _787);
    float _911 = _809 * _881;
    float _913 = -_905;
    float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _793);
    float _917 = _847 * (-2.0);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _921 = _909 + _919;
    float _923 = -_911;
    float _925 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[18].w, _571);
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _929 = _915 + _927;
    float _931 = _357 + (-0.5);
    float _933 = _921 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _935 = fma(_917, _871, _871);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _939 = _925 + _937;
    float _941 = fma(_581, _917, _581);
    float _943 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[28].x, _933);
    float _945 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[196].x, _935);
    float _947 = _857 * (-2.0);
    bool _949 = _897 > 0.0;
    float _951 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[28].z, _943);
    float _953 = fma(_941, _785, _945);
    float _955 = fma(_559, _947, _559);
    float _957 = fma(_947, _873, _873);
    float _959 = _359 + (-0.5);
    bool _961 = _897 >= 0.0;
    bool _963 = isnan(_897);
    bool _965 = _961 || _963;
    bool _967 = isnan(0.0);
    bool _969 = _965 || _967;
    float _971 = _953 * 0.15915493667125701904296875;
    bool _973 = _951 >= 0.0;
    float _975 = fma(_959, (*spvDescriptorSet0.vp_c9)._m0[196].y, _957);
    int _977 = _969 ? 0 : 1;
    float _979 = _361 + _357;
    int _981 = abs(_901);
    float _983 = fma(_955, _785, _975);
    int _985 = ~_977;
    int _987 = _985 + 1;
    int _989 = _987 + 1;
    float _991 = _971 * 6.283185482025146484375;
    float _993 = sin(_991);
    int _995 = _989;
    float _997 = _941;
    if (!_949)
    {
        int _999 = ~_977;
        int _1001 = _999 + 1;
        _995 = _1001;
    }
    int _1003 = _995;
    float _1005 = _983 * 0.15915493667125701904296875;
    float _1007 = float(_981);
    float _1009 = float(_1003);
    float _1011 = _361 + (-0.5);
    if (_973)
    {
        _997 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1013 = _997;
    float _1015 = _971 * 6.283185482025146484375;
    float _1017 = cos(_1015);
    int _1019 = as_type<int>(_1013);
    if (_973)
    {
        out.m_47.x = 0.0;
    }
    float _1021 = _1007 * _1009;
    if (_973)
    {
        float _1023 = _1013 * 5.0;
        _1019 = as_type<int>(_1023);
    }
    int _1025 = _1019;
    float _1027 = _1005 * 6.283185482025146484375;
    float _1029 = sin(_1027);
    if (_973)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3571 = as_type<float>(_1025);
        out.gl_Position.z = _3571;
    }
    if (_973)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1031 = -_787;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1035 = -_793;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1039 = -_571;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1043 = -_903;
    float _1045 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[18].w, _799);
    float _1047 = _1033 * _1033;
    float _1049 = _979 + (-1.0);
    float _1051 = _1021 * (-2.0);
    float _1053 = -_905;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _805);
    float _1057 = fma(_1037, _1037, _1047);
    float _1059 = _1045 * _1045;
    float _1061 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1063 = fma(_1051, _875, _875);
    float _1065 = fma(_1041, _1041, _1057);
    float _1067 = fma(_1055, _1055, _1059);
    float _1069 = -_911;
    float _1071 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _809);
    float _1073 = fma(_1061, _1051, _1061);
    float _1075 = rsqrt(_1065);
    float _1077 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1063);
    float _1079 = fma(_1071, _1071, _1067);
    float _1081 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1083 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1085 = fma(_1073, _785, _1077);
    float _1087 = _1005 * 6.283185482025146484375;
    float _1089 = cos(_1087);
    float _1091 = _993 * _1029;
    float _1093 = sqrt(_1079);
    float _1095 = _1085 * 0.15915493667125701904296875;
    float _1097 = _1037 * _1075;
    float _1099 = in.m_72.x;
    float _1101 = in.m_72.y;
    float _1103 = _1041 * _1075;
    float _1105 = _1033 * _1075;
    float _1107 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1109 = _1097 * _1107;
    float _1111 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1113 = _1103 * _1111;
    float _1115 = _1095 * 6.283185482025146484375;
    float _1117 = sin(_1115);
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1121 = -_1109;
    float _1123 = fma(_1103, _1119, _1121);
    float _1125 = _1017 * _1089;
    float _1127 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1129 = -_1113;
    float _1131 = fma(_1105, _1127, _1129);
    float _1133 = _1123 * _1123;
    float _1135 = _881 * _1093;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1139 = _1105 * _1137;
    float _1141 = fma(_1131, _1131, _1133);
    float _1143 = _1095 * 6.283185482025146484375;
    float _1145 = cos(_1143);
    float _1147 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1149 = -_1139;
    float _1151 = fma(_1097, _1147, _1149);
    float _1153 = fma(_1151, _1151, _1141);
    float _1155 = fma(_1117, _1125, _1091);
    float _1157 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1159 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1161 = fma(_1117, _1091, _1125);
    float _1163 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1165 = rsqrt(_1153);
    float _1167 = _1159 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1169 = _1017 * _1029;
    float _1171 = _1163 * _1135;
    float _1173 = _1029 * _1145;
    float _1175 = _1167 * _1135;
    float _1177 = _993 * _1089;
    float _1179 = _1081 * _1171;
    float _1181 = _1089 * _1145;
    float _1183 = _1083 * _1175;
    float _1185 = -_1169;
    float _1187 = fma(_1117, _1177, _1185);
    float _1189 = _1145 * _1179;
    float _1191 = -_1179;
    float _1193 = _1117 * _1191;
    float _1195 = -_1177;
    float _1197 = fma(_1117, _1169, _1195);
    float _1199 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1017 * _1189;
    float _1205 = _1123 * _1165;
    float _1207 = _1131 * _1165;
    float _1209 = _1151 * _1165;
    float _1211 = fma(_1155, _1183, _1203);
    float _1213 = _1103 * _1205;
    float _1215 = _1105 * _1207;
    float _1217 = _993 * _1189;
    float _1219 = fma(_1181, _1183, _1193);
    float _1221 = fma(_1197, _1201, _1211);
    float _1223 = -_1213;
    float _1225 = fma(_1105, _1209, _1223);
    float _1227 = -_1215;
    float _1229 = fma(_1097, _1205, _1227);
    float _1231 = fma(_1187, _1183, _1217);
    float _1233 = fma(_1173, _1201, _1219);
    float _1235 = _1225 * _1221;
    float _1237 = _1229 * _1221;
    float _1239 = fma(_1161, _1201, _1231);
    float _1241 = fma(_1207, _1233, _1235);
    float _1243 = fma(_1209, _1233, _1237);
    float _1245 = _1097 * _1209;
    float _1247 = fma(_1097, _1239, _1241);
    float _1249 = fma(_1103, _1239, _1243);
    float _1251 = -_1245;
    float _1253 = fma(_1103, _1207, _1251);
    float _1255 = _793 + _1247;
    float _1257 = _571 + _1249;
    float _1259 = _1253 * _1221;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1263 = _1255 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1267 = _1257 + _1265;
    float _1269 = fma(_1205, _1233, _1259);
    float _1271 = _1263 * _1263;
    float _1273 = _1267 * _1267;
    float _1275 = fma(_1105, _1239, _1269);
    float _1277 = _1271 + _1273;
    float _1279 = _787 + _1275;
    float _1281 = sqrt(_1277);
    bool _1283 = _1281 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1285 = _1097;
    float _1287 = _1259;
    float _1289 = _1239;
    float _1291 = _1233;
    float _1293 = _1255;
    float _1295 = _1103;
    if (!_1283)
    {
        _1285 = _1273;
    }
    float _1297 = _1285;
    float _1299 = _1297;
    if (!_1283)
    {
        _1287 = _1271;
    }
    float _1301 = _1287;
    float _1303 = _1301;
    if (!_1283)
    {
        _1289 = _1257;
    }
    float _1305 = _1289;
    float _1307 = _1305;
    if (!_1283)
    {
        _1291 = _1279;
    }
    float _1309 = _1291;
    bool _1311 = !_1283;
    float _1313 = _1309;
    if (!_1311)
    {
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1319 = _1281 + _1317;
        float _1321 = rsqrt(_1277);
        float _1323 = _1319 * _1315;
        float _1325 = _1279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1327 = _1323 * 0.15915493667125701904296875;
        float _1329 = _1327 * 6.283185482025146484375;
        float _1331 = sin(_1329);
        float _1333 = _1327 * 6.283185482025146484375;
        float _1335 = cos(_1333);
        float _1337 = fma(_1331, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1339 = _1321 * _1337;
        float _1341 = _1335 + (-1.0);
        float _1343 = fma(_1263, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1345 = fma(_1267, _1339, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1347 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1351 = _1343 + _1349;
        float _1353 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1355 = _1345 + _1353;
        float _1357 = fma(_1279, _1335, _1347);
        float _1359 = _1351 * _1351;
        float _1361 = _1355 * _1355;
        _1313 = _1357;
        _1303 = _1359;
        _1299 = _1361;
        _1293 = _1343;
        _1307 = _1345;
    }
    float _1363 = _1313;
    float _1365 = _1303;
    float _1367 = _1299;
    float _1369 = _1293;
    float _1371 = _1307;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1375 = _1363 + _1373;
    float _1377 = fma(_1375, _1375, _1365);
    float _1379 = _1377 + _1367;
    float _1381 = sqrt(_1379);
    bool _1383 = _1381 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1385 = isnan(_1381);
    bool _1387 = _1383 || _1385;
    bool _1389 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1391 = _1387 || _1389;
    float _1393 = _1365;
    float _1395 = _1363;
    if (!_1391)
    {
        _1393 = 1.0;
    }
    float _1397 = _1393;
    bool _1399 = !_1391;
    float _1401 = _1397;
    if (!_1399)
    {
        bool _1403 = _1381 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1405 = isnan(_1381);
        bool _1407 = _1403 || _1405;
        bool _1409 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1411 = _1407 || _1409;
        if (!_1411)
        {
            float _1413 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1415 = _1381 + _1413;
            float _1417 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1419 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1417;
            float _1421 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1423 = _1421 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1425 = 1.0 / _1419;
            float _1427 = _1415 * _1425;
            float _1429 = fma(_1427, _1423, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1401 = _1429;
            _1431 = true;
        }
        else
        {
            bool _1433 = _1381 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1435 = isnan(_1381);
            bool _1437 = _1433 || _1435;
            bool _1439 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1441 = _1437 || _1439;
            if (!_1441)
            {
                float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1445 = _1381 + _1443;
                float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1449 = _1447 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1451 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1453 = _1451 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1455 = 1.0 / _1449;
                float _1457 = _1445 * _1455;
                float _1459 = fma(_1457, _1453, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1401 = _1459;
                _1431 = true;
            }
            else
            {
                _1401 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1431 = false;
    float _1461 = _1401;
    float _1463 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1465 = _1363 + _1463;
    float _1467 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1469 = _1369 + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1473 = _1371 + _1471;
    float _1475 = fma(_1465, _1461, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1477 = fma(_1469, _1461, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1479 = fma(_1473, _1461, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1481 = -_787;
    float _1483 = _1481 + _1475;
    float _1485 = -_793;
    float _1487 = _1485 + _1477;
    float _1489 = -_571;
    float _1491 = _1489 + _1479;
    float _1493 = _1483 * _1483;
    float _1495 = fma(_1487, _1487, _1493);
    float _1497 = fma(_1491, _1491, _1495);
    float _1499 = sqrt(_1497);
    bool _1501 = _1499 > 0.0;
    bool _1503 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1505 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan(0.5);
    bool _1511 = _1507 || _1509;
    float _1513 = _1475;
    float _1515 = _1479;
    if (!_1501)
    {
        _1395 = _1477;
    }
    float _1517 = _1395;
    bool _1519 = !_1501;
    float _1521 = _1517;
    if (!_1519)
    {
        float _1523 = _209 * _209;
        float _1525 = fma(_205, _205, _1523);
        float _1527 = rsqrt(_1497);
        float _1529 = fma(_211, _211, _1525);
        float _1531 = sqrt(_1529);
        float _1533 = _1487 * _1527;
        float _1535 = _1483 * _1527;
        float _1537 = _1491 * _1527;
        bool _1539 = _1531 > 0.0;
        float _1541 = _1531;
        _1295 = _1533;
        if (!_1539)
        {
            _1541 = _1477;
        }
        float _1543 = _1541;
        bool _1545 = !_1539;
        _1521 = _1543;
        if (!_1545)
        {
            float _1547 = rsqrt(_1529);
            float _1549 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1551 = _209 * _1547;
            float _1553 = _205 * _1547;
            float _1555 = _211 * _1547;
            float _1557 = _1535 * _1551;
            float _1559 = fma(_1533, _1553, _1557);
            float _1561 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1563 = fma(_1537, _1555, _1559);
            float _1565 = _1563 * _1561;
            float _1567 = fma(_205, _1565, _1477);
            float _1569 = fma(_209, _1565, _1475);
            float _1571 = fma(_211, _1565, _1479);
            _1521 = _1567;
            _1513 = _1569;
            _1515 = _1571;
        }
    }
    float _1573 = _1521;
    float _1575 = _1513;
    float _1577 = _1515;
    float _1579 = _1295;
    float _1581 = -_905;
    float _1583 = fma(_1581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    float _1585 = -_903;
    float _1587 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    float _1589 = -_911;
    float _1591 = fma(_1589, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1577);
    float _1593 = _1587;
    float _1595 = _1583;
    float _1597 = _1591;
    float _1599 = _1579;
    if (!_1511)
    {
        float _1601 = _921 * _921;
        float _1603 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1605 = fma(_929, _929, _1601);
        float _1607 = fma(_939, _939, _1605);
        float _1609 = 1.0 / _1135;
        float _1611 = sqrt(_1607);
        float _1613 = precise::min(_1611, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1615 = _1613 * _1603;
        float _1617 = -_793;
        float _1619 = _1617 + _1573;
        float _1621 = -_571;
        float _1623 = _1621 + _1577;
        float _1625 = _1615 * _1609;
        float _1627 = -_787;
        float _1629 = _1627 + _1575;
        float _1631 = fma(_1619, _1625, _915);
        float _1633 = fma(_1629, _1625, _909);
        float _1635 = fma(_1623, _1625, _925);
        _1593 = _1633;
        _1595 = _1631;
        _1597 = _1635;
    }
    float _1637 = _1593;
    float _1639 = _1595;
    float _1641 = _1597;
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1645 = _1637 + _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1649 = _1639 + _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1653 = _1641 + _1651;
    float _1655 = _1645 * _1645;
    float _1657 = fma(_1649, _1649, _1655);
    float _1659 = fma(_1653, _1653, _1657);
    float _1661 = rsqrt(_1659);
    float _1663 = _1661 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1665 = _1649 * _1663;
    float _1667 = _1653 * _1663;
    float _1669 = _1665 * _1665;
    float _1671 = _1667 * _1667;
    float _1673 = _1669 + _1671;
    float _1675 = sqrt(_1673);
    bool _1677 = _1675 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1679 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1681 = _1675 + _1679;
    float _1683 = _909;
    float _1685 = _1673;
    float _1687 = _1681;
    float _1689 = _1645;
    float _1691 = _1663;
    float _1693 = _1665;
    float _1695 = _1669;
    if (_1677)
    {
        float _1697 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1683 = _1697;
    }
    float _1699 = _1683;
    if (_1677)
    {
        float _1701 = rsqrt(_1673);
        _1685 = _1701;
    }
    float _1703 = _1685;
    float _1705 = _1699;
    if (_1677)
    {
        float _1707 = _1681 * _1699;
        _1687 = _1707;
    }
    float _1709 = _1687;
    if (_1677)
    {
        float _1711 = _1709 * 0.15915493667125701904296875;
        _1599 = _1711;
    }
    float _1713 = _1599;
    float _1715 = _1661;
    if (_1677)
    {
        float _1717 = _1713 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        _1715 = _1719;
    }
    float _1721 = _1715;
    float _1723 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1725 = precise::max(0.0, _1723);
    float _1727 = _1653;
    float _1729 = _1725;
    if (_1677)
    {
        float _1731 = _1713 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        _1727 = _1733;
    }
    float _1735 = _1727;
    float _1737 = -_1663;
    float _1739 = -_1725;
    float _1741 = fma(_1645, _1737, _1739);
    if (_1677)
    {
        float _1743 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1689 = _1743;
    }
    float _1745 = _1689;
    float _1747 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1749 = _1745;
    float _1751 = _1721;
    if (_1677)
    {
        float _1753 = fma(_1721, _1745, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1749 = _1753;
    }
    float _1755 = _1749;
    float _1757 = _1755;
    if (!_1677)
    {
        _1751 = _1741;
    }
    float _1759 = _1751;
    float _1761 = _1759;
    if (_1677)
    {
        float _1763 = _1735 + (-1.0);
        _1729 = _1763;
    }
    float _1765 = _1729;
    float _1767 = _1765;
    if (_1677)
    {
        float _1769 = _1703 * _1755;
        _1691 = _1769;
    }
    float _1771 = _1691;
    if (!_1677)
    {
        _1757 = _1667;
    }
    float _1773 = _1757;
    float _1775 = sqrt(_1659);
    float _1777 = _1773;
    if (_1677)
    {
        float _1779 = _1765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1705 = _1779;
    }
    float _1781 = _1705;
    if (_1677)
    {
        float _1783 = _1665 * _1771;
        _1693 = _1783;
    }
    float _1785 = _1693;
    if (_1677)
    {
        float _1787 = _1667 * _1771;
        _1777 = _1787;
    }
    float _1789 = _1777;
    if (!_1677)
    {
        _1767 = _1671;
    }
    float _1791 = _1767;
    float _1793 = _1791;
    if (_1677)
    {
        float _1795 = fma(_1741, _1735, _1781);
        _1761 = _1795;
    }
    float _1797 = _1761;
    if (_1677)
    {
        float _1799 = _1785 * _1785;
        _1695 = _1799;
    }
    float _1801 = _1695;
    if (_1677)
    {
        float _1803 = _1789 * _1789;
        _1793 = _1803;
    }
    float _1805 = _1793;
    float _1807 = fma(_1797, _1797, _1801);
    float _1809 = _1807 + _1805;
    float _1811 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1813 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1815 = fma(_1775, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1813);
    float _1817 = precise::clamp(_1815, 0.0, 1.0);
    float _1819 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1747);
    float _1821 = rsqrt(_1809);
    float _1823 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1811);
    float _1825 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1827 = -_1817;
    float _1829 = _1827 + 1.0;
    float _1831 = _1637 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1833 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1823);
    float _1835 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1825);
    float _1837 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1839 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1831);
    float _1841 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1843 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1835);
    float _1845 = abs(_1829);
    float _1847 = log2(_1845);
    float _1849 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1839);
    float _1851 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1853 = _1843 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1855 = _1821 * _1785;
    float _1857 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1859 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1861 = _1821 * _1797;
    float _1863 = _1855 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1865 = -_1851;
    float _1867 = fma(_1865, _1837, 1.0);
    float _1869 = fma(_1641, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1819);
    float _1871 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1859);
    float _1873 = _1821 * _1789;
    float _1875 = -_1863;
    float _1877 = fma(_1861, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1875);
    float _1879 = _1869 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1881 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1883 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1871);
    float _1885 = -_1873;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1877);
    float _1889 = log2(_1867);
    float _1891 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1893 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1883);
    float _1895 = fma(_1887, -0.5, 0.5);
    float _1897 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1899 = fma(_1887, 0.5, 0.5);
    float _1901 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1891);
    float _1903 = exp2(_1881);
    float _1905 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1897);
    float _1907 = fma(_1899, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1909 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1901);
    float _1911 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1905);
    float _1913 = fma(_1899, _1907, -0.212114393711090087890625);
    float _1915 = 1.0 / _1893;
    float _1917 = _1861 + 1.0;
    float _1919 = fma(_1899, _1913, 1.570728778839111328125);
    float _1921 = _1889 * 0.693147182464599609375;
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1925 = sqrt(_1895);
    float _1927 = -_1861;
    float _1929 = fma(_1903, _1917, _1927);
    float _1931 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1911);
    float _1933 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1909);
    float _1935 = fma(_1929, 0.5, 0.5);
    float _1937 = _1931 * _1915;
    float _1939 = _1933 * _1915;
    float _1941 = fma(_1937, 0.5, 0.5);
    float _1943 = fma(_1939, -0.5, 0.5);
    float _1945 = _1925 * 0.636619746685028076171875;
    float3 _5037 = float3(_1941, _1943, _1923);
    float _1947 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5037, float3(0.0), isnan(_5037)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5037, float3(0.0), isnan(_5037)), level(0.0)).x;
    float3 _5048 = float3(_1941, _1943, _1923);
    float4 _1950 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5048, float3(0.0), isnan(_5048)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5048, float3(0.0), isnan(_5048)), level(0.0)).xyzw;
    float _1952 = _1950.x;
    float _1954 = _1950.y;
    float _1956 = _1950.z;
    float _1958 = _1950.w;
    float _1960 = -_1919;
    float _1962 = fma(_1945, _1960, 1.0);
    float2 _5070 = float2(_1962, _1935);
    float3 _1966 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5070, float2(0.0), isnan(_5070)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5070, float2(0.0), isnan(_5070)), level(0.0)).xyz;
    float _1968 = _1966.x;
    float _1970 = _1966.y;
    float _1972 = _1966.z;
    float _1974 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1976 = _1853 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1978 = _1931 + _1893;
    float _1980 = fma(_1857, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1976);
    float _1982 = exp2(_1974);
    float _1984 = _1978 * 0.5;
    float _1986 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1980);
    float _1988 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1986);
    float _1990 = _1893 * 0.5;
    float _1992 = _1988 + _1893;
    float _1994 = fma(_1933, -0.5, _1990);
    float _1996 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1998 = _1992 * 0.5;
    float _2000 = -_1982;
    float _2002 = _2000 + 1.0;
    out.gl_Position.x = _1931;
    out.gl_Position.y = _1933;
    out.gl_Position.z = _1988;
    out.gl_Position.w = _1893;
    float _2004 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _1984;
    out.m_74.y = _1994;
    out.m_74.z = _1998;
    out.m_74.w = _1893;
    out.m_47.x = _1996;
    float _2006 = _2004 * _1947;
    float _2008 = -_2004;
    float _2010 = _2008 + 1.0;
    float _2012 = _1958 * _2006;
    float _2014 = _1958 * _2010;
    float _2016 = _1972 * _2006;
    float _2018 = fma(_1968, _2012, _1952);
    float _2020 = fma(_1970, _2012, _1954);
    float _2022 = fma(_1958, _2016, _1956);
    out.m_76.x = _2018;
    out.m_76.y = _2020;
    out.m_76.z = _2022;
    out.m_76.w = _2014;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

