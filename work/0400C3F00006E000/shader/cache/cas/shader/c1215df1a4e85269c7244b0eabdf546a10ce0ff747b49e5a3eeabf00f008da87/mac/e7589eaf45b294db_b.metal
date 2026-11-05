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
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_68 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_78 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2198 = false;
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
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2498 = as_type<float>(_119);
        out.gl_Position.z = _2498;
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
        _111 = _141;
    }
    float _143 = _111;
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
        float _2568 = as_type<float>(_157);
        out.gl_Position.z = _2568;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _163 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _165 = in.m_56.x;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _169 = _167 != 0;
    float _171 = in.m_56.z;
    float _173 = in.m_56.w;
    float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _177 = log2(_175);
    float _179 = in.m_56.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _183 = in.m_46.x;
    float _185 = in.m_46.y;
    float _187 = in.m_46.z;
    float _189 = _163 * _161;
    float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _197 = as_type<int>(_159) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_159) & 2;
    bool _203 = _201 != 0;
    float _205 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _207 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _209 = _207 != 0;
    float _211 = _177 * _137;
    float _213 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _215 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _189);
    int _217 = int(_199);
    int _219 = _203 ? 2 : 0;
    int _221 = _217 | _219;
    int _223 = _209 ? 4 : 0;
    int _225 = _221 | _223;
    int _227 = _169 ? 8 : 0;
    int _229 = _225 | _227;
    int _231 = false ? 16 : 0;
    int _233 = _229 | _231;
    int _235 = false ? 32 : 0;
    int _237 = _233 | _235;
    int _239 = false ? 64 : 0;
    int _241 = _237 | _239;
    int _243 = _241 & 4;
    float _245 = _171 * 2.0;
    bool _247 = _173 > 0.5;
    float _249 = -_195;
    float _251 = fma(_213, 2.0, _249);
    float _253 = exp2(_211);
    float _255 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _257 = as_type<float>(_243);
    float _259 = _183;
    if (!_169)
    {
        float _261 = in.m_56.z;
        _257 = _261;
    }
    float _263 = _257;
    float _265 = 0.0;
    if (!_169)
    {
        _265 = _179;
    }
    float _267 = _265;
    float _269 = _205 * _191;
    float _271 = _185 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _273 = _185 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _275 = _185 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _277 = fma(_255, -2.0, _181);
    float _279 = floor(_245);
    float _281 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].x, _273);
    float _283 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].x, _271);
    float _285 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    float _287 = _267;
    float _289 = _275;
    float _291 = _191;
    if (_169)
    {
        _259 = _165;
    }
    float _293 = _259;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _297 = _293;
    if (!_169)
    {
        _297 = _171;
    }
    float _299 = _297;
    float _301 = -_253;
    float _303 = _301 + 1.0;
    if (_169)
    {
        _287 = _165;
    }
    float _305 = _287;
    float _307 = -_137;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[76].x, _251);
    int _311 = int(_199);
    int _313 = _203 ? 2 : 0;
    int _315 = _311 | _313;
    int _317 = _247 ? 4 : 0;
    int _319 = _315 | _317;
    int _321 = _169 ? 8 : 0;
    int _323 = _319 | _321;
    int _325 = false ? 16 : 0;
    int _327 = _323 | _325;
    int _329 = false ? 32 : 0;
    int _331 = _327 | _329;
    int _333 = false ? 64 : 0;
    int _335 = _331 | _333;
    int _337 = _335 & 4;
    float _339 = _299 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_169)
    {
        _289 = _171;
    }
    float _341 = _289;
    float _343 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _277);
    float _345 = _341;
    if (!_169)
    {
        _345 = _179;
    }
    float _347 = _345;
    float _349 = -_193;
    float _351 = fma(_339, 2.0, _349);
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _355 = _279 > 0.0;
    float _357 = -_137;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[86].x, _351);
    bool _361 = _279 >= 0.0;
    bool _363 = isnan(_279);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.0);
    bool _369 = _365 || _367;
    float _371 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[83].z, _353);
    float _373 = _279;
    if (_169)
    {
        _373 = _179;
    }
    float _375 = _373;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _379 = _305 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _381 = _375;
    if (!_169)
    {
        _381 = _165;
    }
    float _383 = _381;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _387 = _263;
    if (!_169)
    {
        _291 = _263;
    }
    float _389 = _291;
    float _391 = -_377;
    float _393 = fma(_379, 2.0, _391);
    float _395 = _389;
    if (_169)
    {
        _395 = _179;
    }
    float _397 = _395;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _401 = _383 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_169)
    {
        _387 = _179;
    }
    float _403 = _387;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _407 = _397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _409 = fma(_401, -2.0, _295);
    bool _411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _419 = _415 || _417;
    float _421 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[83].w, _399);
    float _423 = fma(_407, -2.0, _385);
    float _425 = _419 ? _303 : 0.0;
    float _427 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[89].z, _405);
    bool _429 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _431 = isnan(1.0);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _437 = _433 || _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _441 = 1.0 + _439;
    float _443 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _421);
    float _445 = 1.0 / _441;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _453 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _447);
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _457 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _449);
    float _459 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _451);
    float _461 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _455);
    bool _463 = !_199;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = _179 * 2.0;
    float _469 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _453);
    bool _471 = _337 != 0;
    float _473 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _457);
    bool _475 = !_203;
    float _477 = _475 ? (-0.5) : 0.5;
    float _479 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _459);
    float _481 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _483 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _485 = precise::max(_481, _483);
    float _487 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _461);
    float _489 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _371);
    float _491 = -_137;
    float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[81].x, _393);
    float _495 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[89].x, _427);
    float _497 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _423);
    float _499 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _409);
    if (_437)
    {
        float _501 = _425 * _445;
        _139 = _501;
    }
    float _503 = _139;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _515 = _513 != 0;
    float _517 = floor(_467);
    float _519 = -_477;
    int _521 = _471 ? as_type<int>(_519) : as_type<int>(_477);
    float _523 = _165 * 2.0;
    bool _525 = _485 >= 16.0;
    float _527 = _165 + _171;
    float _529 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[5].z, _281);
    int _531 = _369 ? 0 : 1;
    float _533 = _527 + (-1.0);
    float _535 = floor(_523);
    bool _537 = _179 > 0.5;
    float _539 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[4].z, _283);
    float _541 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _543 = !_507;
    float _545 = _543 ? _477 : as_type<float>(_521);
    float _547 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _269);
    int _549 = ~_531;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[6].z, _285);
    float _557 = floor(_215);
    float _559 = _539 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _561 = _517 > 0.0;
    float _563 = -_465;
    int _565 = _537 ? as_type<int>(_563) : as_type<int>(_465);
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _569 = _559 + _567;
    bool _571 = _517 >= 0.0;
    bool _573 = isnan(_517);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    bool _583 = !_511;
    float _585 = _583 ? _465 : as_type<float>(_565);
    float _587 = _165 + _179;
    bool _589 = _535 > 0.0;
    float _591 = floor(_547);
    int _593 = _553;
    float _595 = _559;
    if (!_355)
    {
        int _597 = ~_531;
        int _599 = _597 + 1;
        _593 = _599;
    }
    int _601 = _593;
    float _603 = _179 + _171;
    int _605 = _579 ? 0 : 1;
    float _607 = -_557;
    float _609 = _215 + _607;
    bool _611 = _535 >= 0.0;
    bool _613 = isnan(_535);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = _529 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _623 = _215 * 6.283185482025146484375;
    bool _625 = _171 > 0.5;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _629 = _621 + _627;
    float _631 = _623 * 0.15915493667125701904296875;
    int _633 = ~_605;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = _555 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _641 = _637;
    if (!_561)
    {
        int _643 = ~_605;
        int _645 = _643 + 1;
        _641 = _645;
    }
    int _647 = _641;
    float _649 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _651 = _619 ? 0 : 1;
    float _653 = _629 * _629;
    float _655 = -_477;
    int _657 = _625 ? as_type<int>(_655) : as_type<int>(_477);
    float _659 = _631 * 6.283185482025146484375;
    float _661 = cos(_659);
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _665 = _663 != 0;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _669 = _667 != 0;
    float _671 = fma(_569, _569, _653);
    int _673 = ~_651;
    int _675 = _673 + 1;
    int _677 = _675 + 1;
    float _679 = _603 + (-1.0);
    float _681 = _525 ? _581 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _683 = _587 + (-1.0);
    bool _685 = !_515;
    float _687 = _685 ? _477 : as_type<float>(_657);
    int _689 = _677;
    int _691 = _647;
    if (!_589)
    {
        int _693 = ~_651;
        int _695 = _693 + 1;
        _689 = _695;
    }
    int _697 = _689;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _709 = _707 != 0;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _639 + _711;
    float _715 = _525 ? _649 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _717 = abs(_681);
    bool _719 = _717 != 0.0;
    bool _721 = isnan(_717);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    float _729 = fma(_713, _713, _671);
    bool _731 = !_665;
    int _733 = _731 ? 0 : 1;
    float _735 = fma(_661, 0.5, 0.5);
    bool _737 = !_701;
    int _739 = _737 ? 0 : 1;
    float _741 = abs(_715);
    bool _743 = _741 == 0.0;
    bool _745 = !_727;
    bool _747 = _743 && _745;
    int _749 = abs(_739);
    float _751 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _753 = rsqrt(_729);
    float _755 = abs(_715);
    bool _757 = _755 == 0.0;
    bool _759 = !_709;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _765 = !_669;
    int _767 = _765 ? 0 : 1;
    int _769 = abs(_761);
    float _771 = -_609;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _775 = float(_601);
    float _777 = -_735;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _781 = _669;
    int _783 = _749;
    if (_747)
    {
        bool _785 = as_type<int>(_715) >= 0;
        _781 = _785;
    }
    bool _787 = _781;
    float _789 = float(_749);
    bool _791 = _609 < 0.5;
    float _793 = float(_791);
    float _795 = _789 * _775;
    int _797 = _787 ? (-1) : 0;
    if (_747)
    {
        int _799 = _787 ? 0 : 1078530011;
        _783 = _799;
    }
    int _801 = _783;
    float _803 = -_793;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _807 = float(_647);
    float _809 = float(_769);
    float _811 = _629 * _753;
    bool _813 = !_705;
    int _815 = _813 ? 0 : 1;
    if (_747)
    {
        int _817 = int(0x80000000) & as_type<int>(_681);
        int _819 = _801 | _817;
        _691 = _819;
    }
    int _821 = _691;
    bool _823 = !_727;
    bool _825 = _823 && _757;
    int _827 = _821;
    float _829 = as_type<float>(_821);
    if (!_825)
    {
        float _831 = abs(_681);
        bool _833 = _831 != as_type<float>(0x7f800000u /* inf */);
        bool _835 = isnan(_831);
        bool _837 = _833 || _835;
        bool _839 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _841 = _837 || _839;
        float _843 = abs(_715);
        bool _845 = _843 == as_type<float>(0x7f800000u /* inf */);
        float _847 = abs(_715);
        bool _849 = _847 == as_type<float>(0x7f800000u /* inf */);
        bool _851 = !_841;
        bool _853 = _849 && _851;
        if (_853)
        {
            bool _855 = as_type<int>(_715) >= 0;
            _797 = _855 ? (-1) : 0;
        }
        int _857 = _797;
        if (_853)
        {
            _827 = 1075235812;
        }
        int _859 = _827;
        int _861 = _859;
        if (_853)
        {
            int _863 = ~_857;
            int _865 = (_863 != 0) ? _859 : 1061752795;
            _861 = _865;
        }
        int _867 = _861;
        float _869 = as_type<float>(_867);
        if (_853)
        {
            int _871 = int(0x80000000) & as_type<int>(_681);
            int _873 = _867 | _871;
            _869 = as_type<float>(_873);
        }
        float _875 = _869;
        bool _877 = !_841;
        bool _879 = _877 && _845;
        _829 = _875;
        if (!_879)
        {
            float _881 = abs(_681);
            float _883 = abs(_715);
            float _885 = precise::max(_881, _883);
            float _887 = abs(_681);
            float _889 = abs(_715);
            float _891 = precise::min(_887, _889);
            float _893 = 1.0 / _885;
            float _895 = abs(_681);
            float _897 = abs(_715);
            bool _899 = _895 > _897;
            bool _901 = as_type<int>(_715) >= 0;
            float _903 = _891 * _893;
            float _905 = abs(_681);
            float _907 = abs(_715);
            float _909 = _905 + _907;
            int _911 = as_type<int>(_681) & int(0x80000000);
            float _913 = _903 * _903;
            bool _915 = _909 > as_type<float>(0x7f800000u /* inf */);
            bool _917 = isnan(_909);
            bool _919 = _915 || _917;
            bool _921 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _923 = _919 || _921;
            float _925 = _913 + 11.33538818359375;
            float _927 = fma(_913, _925, 28.84246826171875);
            float _929 = fma(_913, _927, 19.6966705322265625);
            float _931 = fma(_913, -0.82336294651031494140625, -5.674867153167724609375);
            float _933 = fma(_913, _931, -6.565555095672607421875);
            float _935 = 1.0 / _929;
            float _937 = _913 * _933;
            float _939 = _903 * _937;
            float _941 = fma(_939, _935, _903);
            float _943 = _941;
            _829 = _909;
            if (_899)
            {
                float _945 = -_941;
                float _947 = _945 + 1.57079637050628662109375;
                _943 = _947;
            }
            float _949 = _943;
            int _951 = as_type<int>(_949);
            if (!_901)
            {
                float _953 = -_949;
                float _955 = _953 + 3.1415927410125732421875;
                _951 = as_type<int>(_955);
            }
            int _957 = _951;
            if (!_923)
            {
                int _959 = _911 | _957;
                _829 = as_type<float>(_959);
            }
        }
    }
    float _961 = _829;
    float _963 = _795 * (-2.0);
    float _965 = _569 * _753;
    float _967 = -_811;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _629);
    int _971 = abs(_815);
    float _973 = fma(_763, _963, _763);
    float _975 = _165 + (-0.5);
    float _977 = float(_697);
    float _979 = _809 * _807;
    float _981 = -_965;
    float _983 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _985 = _969 * _969;
    float _987 = float(_971);
    float _989 = _713 * _753;
    float _991 = _975 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _993 = fma(_983, _983, _985);
    float _995 = _979 * (-2.0);
    float _997 = -_989;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _1001 = _987 * _977;
    float _1003 = -_591;
    float _1005 = _547 + _1003;
    float _1007 = _547 * 6.283185482025146484375;
    float _1009 = fma(_973, _503, _991);
    float _1011 = fma(_541, _995, _541);
    float _1013 = fma(_999, _999, _993);
    float _1015 = _1001 * (-2.0);
    float _1017 = _179 + (-0.5);
    float _1019 = _1007 * 0.15915493667125701904296875;
    int _1021 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1023 = _1021 != 0;
    float _1025 = fma(_751, _1015, _751);
    float _1027 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1029 = _171 + (-0.5);
    bool _1031 = !_1023;
    int _1033 = _1031 ? 0 : 1;
    float _1035 = _1019 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = fma(_1025, _503, _1027);
    float _1041 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _1043 = abs(_1033);
    float _1045 = _1009 * 0.15915493667125701904296875;
    float _1047 = _1039 + _961;
    float _1049 = in.m_58.x;
    float _1051 = in.m_58.y;
    int _1053 = abs(_733);
    float _1055 = fma(_1011, _503, _1041);
    bool _1057 = _1005 < 0.5;
    float _1059 = float(_1057);
    float _1061 = -_1005;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _1065 = abs(_767);
    float _1067 = sqrt(_1013);
    float _1069 = float(_1053);
    float _1071 = -_1059;
    float _1073 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1075 = fma(_1037, 0.5, 0.5);
    float _1077 = float(_1043);
    float _1079 = _1055 * 0.15915493667125701904296875;
    float _1081 = abs(_1063);
    float _1083 = _1069 * _1081;
    float _1085 = -_1075;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1089 = abs(_773);
    float _1091 = _1069 * _1089;
    float _1093 = _1047 * 0.15915493667125701904296875;
    float _1095 = fma(_1077, _1087, _1083);
    float _1097 = float(_1065);
    float _1099 = fma(_1077, _779, _1091);
    float _1101 = _1045 * 6.283185482025146484375;
    float _1103 = sin(_1101);
    float _1105 = _753 * _1067;
    float _1107 = abs(_1073);
    float _1109 = fma(_1097, _1107, _1095);
    float _1111 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1113 = abs(_805);
    float _1115 = fma(_1097, _1113, _1099);
    float _1117 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1119 = _1045 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    float _1123 = _1109 * _1111;
    float _1125 = _1115 * _1117;
    float _1127 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _477);
    float _1129 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1131 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _465);
    float _1135 = _1079 * 6.283185482025146484375;
    float _1137 = cos(_1135);
    float _1139 = _1105 * _1129;
    float _1141 = _1105 * _1131;
    float _1143 = _1139 * _1127;
    float _1145 = _1141 * _1133;
    float _1147 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1149 = _1147 * 0.5;
    float _1151 = _1093 * 6.283185482025146484375;
    float _1153 = sin(_1151);
    float _1155 = _1093 * 6.283185482025146484375;
    float _1157 = cos(_1155);
    float _1159 = _1103 * _1137;
    float _1161 = _1159 * _1143;
    float _1163 = _1079 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    float _1167 = _1121 * _1153;
    float _1169 = _1103 * _1153;
    float _1171 = _1153 * _1137;
    float _1173 = _1103 * _1157;
    float _1175 = _1121 * _1157;
    float _1177 = _1157 * _1137;
    float _1179 = _1121 * _1137;
    float _1181 = -_1167;
    float _1183 = fma(_1165, _1173, _1181);
    float _1185 = fma(_1165, _1169, _1175);
    float _1187 = -_1143;
    float _1189 = _1165 * _1187;
    float _1191 = fma(_1165, _1175, _1169);
    float _1193 = fma(_1183, _1145, _1161);
    float _1195 = _1179 * _1143;
    float _1197 = fma(_1177, _1145, _1189);
    float _1199 = -_1173;
    float _1201 = fma(_1165, _1167, _1199);
    float _1203 = fma(_1185, _1149, _1193);
    float _1205 = fma(_1191, _1145, _1195);
    float _1207 = fma(_1171, _1149, _1197);
    float _1209 = _639 + _1203;
    float _1211 = fma(_1201, _1149, _1205);
    float _1213 = _559 + _1207;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1209 + _1215;
    float _1219 = _621 + _1211;
    float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1223 = _1213 + _1221;
    float _1225 = _1217 * _1217;
    float _1227 = fma(_1223, _1223, _1225);
    float _1229 = sqrt(_1227);
    bool _1231 = _1229 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1233 = _1167;
    float _1235 = _1169;
    float _1237 = _1149;
    float _1239 = _1211;
    float _1241 = as_type<float>(_1065);
    if (!_1231)
    {
        _1233 = _1213;
    }
    float _1243 = _1233;
    float _1245 = _1243;
    if (!_1231)
    {
        _1235 = _1209;
    }
    float _1247 = _1235;
    float _1249 = _1247;
    if (!_1231)
    {
        _1237 = _1219;
    }
    float _1251 = _1237;
    bool _1253 = !_1231;
    float _1255 = _1251;
    if (!_1253)
    {
        float _1257 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1261 = _1229 + _1259;
        float _1263 = rsqrt(_1227);
        float _1265 = _1261 * _1257;
        float _1267 = _1219 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = _1265 * 0.15915493667125701904296875;
        float _1271 = _1269 * 6.283185482025146484375;
        float _1273 = cos(_1271);
        float _1275 = _1269 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        float _1279 = _1273 + (-1.0);
        float _1281 = fma(_1277, _1267, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1283 = _1279 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1285 = _1263 * _1281;
        float _1287 = fma(_1219, _1273, _1283);
        float _1289 = fma(_1223, _1285, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1291 = fma(_1217, _1285, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1255 = _1287;
        _1245 = _1289;
        _1249 = _1291;
    }
    float _1293 = _1255;
    float _1295 = _1245;
    float _1297 = _1249;
    float _1299 = -_811;
    float _1301 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1293);
    float _1303 = -_965;
    float _1305 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1295);
    float _1307 = -_989;
    float _1309 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1297);
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1313 = _1301 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1317 = _1305 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1321 = _1309 + _1319;
    float _1323 = -_965;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _559);
    float _1327 = _1313 * _1313;
    float _1329 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1331 = -_989;
    float _1333 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1335 = fma(_1317, _1317, _1327);
    float _1337 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1329);
    float _1339 = fma(_1321, _1321, _1335);
    float _1341 = rsqrt(_1339);
    float _1343 = sqrt(_1339);
    float _1345 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1347 = _1317 * _1345;
    float _1349 = _1321 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 * _1349;
    float _1355 = _1351 + _1353;
    float _1357 = sqrt(_1355);
    bool _1359 = _1357 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1363 = _1357 + _1361;
    float _1365 = _1137;
    float _1367 = _1363;
    float _1369 = _1349;
    float _1371 = _1351;
    float _1373 = _1353;
    if (_1359)
    {
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1375;
    }
    float _1377 = _1365;
    if (!_1359)
    {
        _595 = _1347;
    }
    float _1379 = _595;
    float _1381 = _1379;
    if (_1359)
    {
        float _1383 = rsqrt(_1355);
        _1239 = _1383;
    }
    float _1385 = _1239;
    if (_1359)
    {
        float _1387 = _1363 * _1377;
        _1367 = _1387;
    }
    float _1389 = _1367;
    if (_1359)
    {
        float _1391 = _1389 * 0.15915493667125701904296875;
        _1241 = _1391;
    }
    float _1393 = _1241;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = _1093;
    if (_1359)
    {
        float _1399 = _1393 * 6.283185482025146484375;
        float _1401 = sin(_1399);
        _1397 = _1401;
    }
    float _1403 = _1397;
    float _1405 = precise::max(0.0, _1395);
    float _1407 = -_1345;
    float _1409 = -_1405;
    float _1411 = fma(_1313, _1407, _1409);
    float _1413 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1415 = _1405;
    float _1417 = _1411;
    if (_1359)
    {
        float _1419 = _1393 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        _1413 = _1421;
    }
    float _1423 = _1413;
    float _1425 = fma(_1325, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1427 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1359)
    {
        float _1429 = _1411 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1415 = _1429;
    }
    float _1431 = _1415;
    float _1433 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1337);
    float _1435 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1427);
    float _1437 = _1403;
    float _1439 = _1431;
    if (_1359)
    {
        float _1441 = fma(_1403, _1431, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = floor(_1425);
    float _1447 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1435);
    float _1449 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1451 = _1443;
    if (_1359)
    {
        float _1453 = _1385 * _1443;
        _1451 = _1453;
    }
    float _1455 = _1451;
    float _1457 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1459 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1359)
    {
        float _1461 = _1423 + (-1.0);
        _1439 = _1461;
    }
    float _1463 = _1439;
    float _1465 = _1463;
    if (_1359)
    {
        float _1467 = _1347 * _1455;
        _1381 = _1467;
    }
    float _1469 = _1381;
    if (_1359)
    {
        float _1471 = _1349 * _1455;
        _1369 = _1471;
    }
    float _1473 = _1369;
    if (_1359)
    {
        float _1475 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1465 = _1475;
    }
    float _1477 = _1465;
    if (_1359)
    {
        float _1479 = _1469 * _1469;
        _1371 = _1479;
    }
    float _1481 = _1371;
    if (_1359)
    {
        float _1483 = _1473 * _1473;
        _1373 = _1483;
    }
    float _1485 = _1373;
    float _1487 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1457);
    if (_1359)
    {
        float _1489 = fma(_1411, _1423, _1477);
        _1417 = _1489;
    }
    float _1491 = _1417;
    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1495 = fma(_1343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1493);
    float _1497 = precise::clamp(_1495, 0.0, 1.0);
    float _1499 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1487);
    float _1501 = fma(_1491, _1491, _1481);
    float _1503 = -_1497;
    float _1505 = _1503 + 1.0;
    float _1507 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1509 = _1501 + _1485;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1513 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1515 = fma(_1333, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1517 = abs(_1505);
    float _1519 = log2(_1517);
    float _1521 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1523 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1513);
    float _1525 = -_1521;
    float _1527 = fma(_1525, _1511, 1.0);
    float _1529 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1523);
    float _1531 = rsqrt(_1509);
    float _1533 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1535 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1537 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1535);
    float _1539 = floor(_1515);
    float _1541 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1543 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1537);
    float _1545 = _1531 * _1469;
    float _1547 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1543);
    float _1549 = _1531 * _1491;
    float _1551 = _1531 * _1473;
    float _1553 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1555 = exp2(_1541);
    float _1557 = -_1553;
    float _1559 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1557);
    float _1561 = -_1539;
    float _1563 = _1515 + _1561;
    float _1565 = _1549 + 1.0;
    float _1567 = -_1551;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1559);
    float _1571 = -_1445;
    float _1573 = _1425 + _1571;
    float _1575 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1577 = 1.0 / _1547;
    float _1579 = fma(_1569, -0.5, 0.5);
    float _1581 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1583 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1575);
    float _1585 = fma(_1569, 0.5, 0.5);
    float _1587 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1581);
    float _1589 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1583);
    float _1591 = log2(_1527);
    float _1593 = fma(_1585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1595 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1587);
    float _1597 = -_1549;
    float _1599 = fma(_1555, _1565, _1597);
    float _1601 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1589);
    float _1603 = fma(_1585, _1593, -0.212114393711090087890625);
    float _1605 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1595);
    float _1607 = fma(_1599, 0.5, 0.5);
    float _1609 = sqrt(_1579);
    float _1611 = _1601 * _1577;
    float _1613 = _1605 * _1577;
    float _1615 = fma(_1585, _1603, 1.570728778839111328125);
    float _1617 = _1591 * 0.693147182464599609375;
    float2 _4838 = float2(_1573, _1563);
    float _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4838, float2(0.0), isnan(_4838)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4838, float2(0.0), isnan(_4838)), level(0.0)).x;
    float _1621 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1623 = _1609 * 0.636619746685028076171875;
    float _1625 = fma(_1611, 0.5, 0.5);
    float _1627 = fma(_1613, -0.5, 0.5);
    float _1629 = -_1615;
    float _1631 = fma(_1623, _1629, 1.0);
    float3 _4865 = float3(_1625, _1627, _1621);
    float _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4865, float3(0.0), isnan(_4865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4865, float3(0.0), isnan(_4865)), level(0.0)).x;
    float3 _4876 = float3(_1625, _1627, _1621);
    float4 _1636 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4876, float3(0.0), isnan(_4876)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4876, float3(0.0), isnan(_4876)), level(0.0)).xyzw;
    float _1638 = _1636.x;
    float _1640 = _1636.y;
    float _1642 = _1636.z;
    float _1644 = _1636.w;
    float2 _4892 = float2(_1631, _1607);
    float3 _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4892, float2(0.0), isnan(_4892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4892, float2(0.0), isnan(_4892)), level(0.0)).xyz;
    float _1650 = _1648.x;
    float _1652 = _1648.y;
    float _1654 = _1648.z;
    float _1656 = -_811;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _621);
    bool _1660 = _165 > 0.5;
    float _1662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1664 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1666 = _495 * (-0.15915493667125701904296875);
    float _1668 = -_489;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1664);
    bool _1674 = _179 > 0.5;
    float _1676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1678 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1672);
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1682 = _1680 != 0;
    float _1684 = -_443;
    float _1686 = _1684 + 1.0;
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1690 = _1688 != 0;
    float _1692 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1694 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1696 = _1666 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    float _1700 = -_477;
    int _1702 = _1674 ? as_type<int>(_1700) : as_type<int>(_477);
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1706 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1694);
    float _1708 = -_479;
    float _1710 = _1708 + 1.0;
    bool _1712 = !_1690;
    float _1714 = _1712 ? _477 : as_type<float>(_1702);
    float _1716 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1706);
    float _1718 = 1.0 / _1692;
    float _1720 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1722 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1724 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1726 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1728 = _1714 + (-0.5);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1732 = _1730 != 0;
    float _1734 = _1724 + _1692;
    float _1736 = _1666 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = -_1722;
    float _1742 = -_343;
    float _1744 = fma(_1740, _1728, _1742);
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1748 = -_487;
    float _1750 = _1748 + 1.0;
    float _1752 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1734 * _1718;
    float _1758 = _1756 * 0.5;
    float _1760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1766 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1764);
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1770 = _687 * _1738;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1774 = 1.0 / _1766;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1780 = -_465;
    int _1782 = _1660 ? as_type<int>(_1780) : as_type<int>(_465);
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1786 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1790 = !_1682;
    float _1792 = _1790 ? _465 : as_type<float>(_1782);
    float _1794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1802 = _1792 + 0.5;
    bool _1804 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1806 = isnan(0.5);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1812 = _1808 || _1810;
    out.m_60.x = _1786;
    out.m_60.y = _1754;
    out.m_60.z = _1796;
    out.m_60.w = _1776;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1816 = _1774 * _1814;
    float _1818 = fma(_1726, _1802, _309);
    float _1820 = _687 * _1698;
    float _1822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1824 = -_465;
    int _1826 = _625 ? as_type<int>(_1824) : as_type<int>(_465);
    out.m_62.x = _1788;
    out.m_62.y = _1720;
    out.m_62.z = _1798;
    out.m_62.w = _1778;
    float _1828 = -_1820;
    float _1830 = fma(_585, _1738, _1828);
    float _1832 = fma(_585, _1698, _1770);
    float _1834 = abs(_1816);
    float _1836 = log2(_1834);
    bool _1838 = !_1732;
    float _1840 = _1838 ? _465 : as_type<float>(_1826);
    float _1842 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1844 = _545 + (-0.5);
    float _1846 = _465 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1848 = _1840 + 0.5;
    float _1850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1852 = _1832 + (-0.5);
    float _1854 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1856 = _1830 + 0.5;
    float _1858 = fma(_1800, _1848, _493);
    float _1860 = -_1842;
    float _1862 = -_499;
    float _1864 = fma(_1860, _1852, _1862);
    float _1866 = -_1854;
    float _1868 = -_497;
    float _1870 = fma(_1866, _1844, _1868);
    float _1872 = -_469;
    float _1874 = _1872 + 1.0;
    float _1876 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1878 = -_473;
    float _1880 = _1878 + 1.0;
    float _1882 = fma(_1714, _1874, _1744);
    float _1884 = -_1670;
    float _1886 = fma(_1840, _1884, _1858);
    float _1888 = -_1880;
    float _1890 = fma(_1792, _1888, _1818);
    float _1892 = exp2(_1876);
    float _1894 = fma(_545, _1686, _1870);
    float _1896 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1898 = fma(_1832, _1750, _1864);
    float _1900 = fma(_1896, _1856, _359);
    float _1902 = -_477;
    float _1904 = _1902 + 0.5;
    float _1906 = _477 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_64.x = _1890;
    out.m_64.y = _1882;
    out.m_64.z = _1886;
    out.m_64.w = _1894;
    float _1908 = -_1710;
    float _1910 = fma(_1830, _1908, _1900);
    float _1912 = exp2(_1752);
    float _1914 = -_1906;
    float _1916 = _1165 * _1914;
    float _1918 = in.m_66.x;
    float _1920 = _1864;
    float _1922 = _1547;
    float _1924 = _1605;
    if (_1812)
    {
        _1920 = 1.0;
    }
    float _1926 = _1920;
    float _1928 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1930 = precise::clamp(_1928, 0.0, 1.0);
    float _1932 = _1179 * _1906;
    float _1934 = _1159 * _1906;
    out.m_68.x = _1910;
    out.m_68.y = _1898;
    float _1936 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_70.y = _1904;
    float _1938 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1936);
    float _1940 = fma(_1183, _1846, _1934);
    float _1942 = fma(_1177, _1846, _1916);
    float _1944 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1938);
    float _1946 = fma(_1930, -2.0, 3.0);
    float _1948 = _1930 * _1930;
    float _1950 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1944);
    float _1952 = _1948 * _1946;
    bool _1954 = _1816 <= 8000.0;
    bool _1956 = isnan(_1816);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(8000.0);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = _1950 + _1547;
    float _1968 = -_1952;
    float _1970 = _1968 + 1.0;
    float _1972 = _1966 * 0.5;
    float _1974 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1952);
    float _1976 = fma(_1191, _1846, _1932);
    float _1978 = _1964 * _1974;
    float _1980 = _1926;
    float _1982 = _1950;
    float _1984 = _1972;
    if (!_1812)
    {
        float _1986 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1988 = _1986 * 0.15915493667125701904296875;
        float _1990 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1992 = _1988 * 6.283185482025146484375;
        float _1994 = cos(_1992);
        float _1996 = _1990 * 0.15915493667125701904296875;
        float _1998 = _1988 * 6.283185482025146484375;
        float _2000 = sin(_1998);
        float _2002 = 1.0 / _1994;
        float _2004 = _1996 * 6.283185482025146484375;
        float _2006 = cos(_2004);
        float _2008 = _2000 * _2002;
        float _2010 = _1996 * 6.283185482025146484375;
        float _2012 = sin(_2010);
        float _2014 = _2006 * _2008;
        float _2016 = 1.0 / _2014;
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2020 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2018;
        float _2022 = 1.0 / _2020;
        float _2024 = _2012 * _2016;
        float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2028 = fma(_1816, _2024, _2026);
        float _2030 = _2028 * _2022;
        float _2032 = precise::clamp(_2030, 0.0, 1.0);
        _1980 = _2032;
    }
    float _2034 = _1980;
    float _2036 = -_1912;
    float _2038 = _2036 + 1.0;
    float _2040 = _1201 + _1976;
    float _2042 = _1185 + _1940;
    float _2044 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2048 = -_1619;
    float _2050 = _2048 + 1.0;
    out.gl_Position.x = _1601;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _1950;
    out.gl_Position.w = _1547;
    float _2052 = _2046 * _1633;
    float _2054 = _2050 * _2044;
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = -_2046;
    float _2060 = _2058 + 1.0;
    float _2062 = _1171 + _1942;
    float _2064 = _1644 * _2052;
    float _2066 = _1654 * _2052;
    float _2068 = _1644 * _2060;
    out.m_72.x = _1305;
    out.m_72.y = _1301;
    out.m_72.z = _1309;
    bool _2070 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2072 = isnan(_1343);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2078 = _2074 || _2076;
    float _2080 = fma(_1644, _2066, _1642);
    out.m_74.x = _2062;
    out.m_74.y = _2040;
    out.m_74.z = _2042;
    float _2082 = -_2056;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2086 = fma(_1650, _2064, _1638);
    float _2088 = fma(_1652, _2064, _1640);
    out.m_76.z = _1972;
    out.m_76.w = _1547;
    float _2090 = _2084 * _1918;
    out.m_78.x = _2086;
    out.m_78.y = _2088;
    out.m_78.z = _2080;
    out.m_78.w = _2068;
    float _2092 = _2090 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2094 = _2090;
    float _2096 = _2092;
    if (!_2078)
    {
        _1922 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2098 = _1922;
    float _2100 = _2098;
    float _2102 = _2098;
    if (!_2078)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2104 = _1982;
    out.m_80.x = _2092;
    float _2106 = _2034 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2108 = _2104;
    float _2110 = _2104;
    if (!_2078)
    {
        _1984 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2112 = _1984;
    float _2114 = _2112;
    float _2116 = _2112;
    if (!_2078)
    {
        _1924 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2118 = _1924;
    float _2120 = _2118;
    float _2122 = _2118;
    if (!_2078)
    {
        _2094 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2124 = _2094;
    float _2126 = _2124;
    float _2128 = _2124;
    if (!_2078)
    {
        _2096 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2130 = _2096;
    bool _2132 = !_2078;
    float _2134 = _2130;
    float _2136 = _2130;
    if (!_2132)
    {
        bool _2138 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2140 = isnan(_1343);
        bool _2142 = _2138 || _2140;
        bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2146 = _2142 || _2144;
        if (!_2146)
        {
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2150 = _1343 + _2148;
            float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2154 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2152;
            float _2156 = 1.0 / _2154;
            float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2178 = _2150 * _2156;
            float _2180 = precise::clamp(_2178, 0.0, 1.0);
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2186 = fma(_2180, _2160, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2188 = fma(_2180, _2184, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2190 = fma(_2180, _2164, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2192 = fma(_2180, _2168, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2194 = fma(_2180, _2172, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2196 = fma(_2180, _2176, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2102 = _2188;
            _2128 = _2194;
            _2116 = _2186;
            _2122 = _2192;
            _2110 = _2190;
            _2136 = _2196;
            _2198 = true;
        }
        else
        {
            bool _2200 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2202 = isnan(_1343);
            bool _2204 = _2200 || _2202;
            bool _2206 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2208 = _2204 || _2206;
            if (!_2208)
            {
                _2114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2210 = _2114;
            _2116 = _2210;
            if (!_2208)
            {
                _2100 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2212 = _2100;
            _2102 = _2212;
            if (!_2208)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2214 = _2108;
            _2110 = _2214;
            if (!_2208)
            {
                _2120 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2216 = _2120;
            _2122 = _2216;
            if (!_2208)
            {
                _2126 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2218 = _2126;
            _2128 = _2218;
            if (!_2208)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2220 = _2134;
            bool _2222 = !_2208;
            _2136 = _2220;
            if (!_2222)
            {
                bool _2224 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2226 = isnan(_1343);
                bool _2228 = _2224 || _2226;
                bool _2230 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2232 = _2228 || _2230;
                if (!_2232)
                {
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2236 = _1343 + _2234;
                    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2240 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2238;
                    float _2242 = 1.0 / _2240;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2264 = _2236 * _2242;
                    float _2266 = precise::clamp(_2264, 0.0, 1.0);
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2272 = fma(_2266, _2246, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2274 = fma(_2266, _2270, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2276 = fma(_2266, _2250, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2278 = fma(_2266, _2254, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2280 = fma(_2266, _2258, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2282 = fma(_2266, _2262, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2102 = _2274;
                    _2128 = _2280;
                    _2116 = _2272;
                    _2122 = _2278;
                    _2110 = _2276;
                    _2136 = _2282;
                    _2198 = true;
                }
                else
                {
                    _2102 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2128 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2122 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2198 = false;
    float _2284 = _2102;
    float _2286 = _2128;
    float _2288 = _2116;
    float _2290 = _2122;
    float _2292 = _2110;
    float _2294 = _2136;
    float _2296 = fma(_2040, -0.5, 0.5);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = -_2284;
    float _2302 = _2300 + _2286;
    float _2304 = _2106 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2306 = -_2288;
    float _2308 = _2306 + _2290;
    float _2310 = fma(_2298, _2302, _2284);
    out.m_82.x = 0.0;
    float _2312 = -_2292;
    float _2314 = _2312 + _2294;
    float _2316 = fma(_2298, _2308, _2288);
    float _2318 = _2310 * 0.586610972881317138671875;
    out.m_49.x = _2304;
    bool _2320 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2322 = fma(_2298, _2314, _2292);
    float _2324 = fma(_2316, 0.298911988735198974609375, _2318);
    bool _2326 = _2034 > 0.0;
    bool _2328 = isnan(_2034);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(0.0);
    bool _2334 = _2330 || _2332;
    float _2336 = fma(_2322, 0.114477999508380889892578125, _2324);
    float _2338 = -_2336;
    float _2340 = _2316 + _2338;
    float _2342 = -_2336;
    float _2344 = _2310 + _2342;
    float _2346 = -_2336;
    float _2348 = _2322 + _2346;
    float _2350 = fma(_2340, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2336);
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2336);
    float _2354 = fma(_2348, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2336);
    bool _2356 = !_2320;
    if (!_2356)
    {
        float _2358 = -_1301;
        float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2362 = -_1305;
        float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2366 = -_1309;
        float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2370 = _2360 * _2360;
        float _2372 = fma(_2364, _2364, _2370);
        float _2374 = fma(_2368, _2368, _2372);
        float _2376 = sqrt(_2374);
        float _2378 = rsqrt(_2374);
        float _2380 = -_2376;
        float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2384 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2386 = precise::clamp(_2384, 0.0, 1.0);
        float _2388 = _2364 * _2378;
        float _2390 = _2360 * _2378;
        float _2392 = abs(_2386);
        float _2394 = log2(_2392);
        float _2396 = _2368 * _2378;
        float _2398 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2400 = _2040 * _2390;
        float _2402 = -_2390;
        float _2404 = -_2398;
        float _2406 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2404);
        float _2408 = fma(_2062, _2388, _2400);
        float _2410 = -_2396;
        float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2406);
        float _2414 = fma(_2042, _2396, _2408);
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2420 = _2412 + _2418;
        float _2422 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2424 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2426 = precise::clamp(_2424, 0.0, 1.0);
        float _2428 = exp2(_2422);
        float _2430 = _2428 * _2426;
        float _2432 = _2416 * _2430;
        float _2434 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2436 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2438 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2434;
        out.m_82.y = _2436;
        out.m_82.z = _2438;
    }
    out.m_84.x = _2350;
    out.m_84.y = _2352;
    out.m_84.z = _2354;
    if (_2334)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2440 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2440;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2198 = false;
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
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2498 = as_type<float>(_119);
        out.gl_Position.z = _2498;
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
        _111 = _141;
    }
    float _143 = _111;
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
        float _2568 = as_type<float>(_157);
        out.gl_Position.z = _2568;
    }
    if (_149)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _163 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _165 = in.m_56.x;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _169 = _167 != 0;
    float _171 = in.m_56.z;
    float _173 = in.m_56.w;
    float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _177 = log2(_175);
    float _179 = in.m_56.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _183 = in.m_46.x;
    float _185 = in.m_46.y;
    float _187 = in.m_46.z;
    float _189 = _163 * _161;
    float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _197 = as_type<int>(_159) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_159) & 2;
    bool _203 = _201 != 0;
    float _205 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _207 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _209 = _207 != 0;
    float _211 = _177 * _137;
    float _213 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _215 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _189);
    int _217 = int(_199);
    int _219 = _203 ? 2 : 0;
    int _221 = _217 | _219;
    int _223 = _209 ? 4 : 0;
    int _225 = _221 | _223;
    int _227 = _169 ? 8 : 0;
    int _229 = _225 | _227;
    int _231 = false ? 16 : 0;
    int _233 = _229 | _231;
    int _235 = false ? 32 : 0;
    int _237 = _233 | _235;
    int _239 = false ? 64 : 0;
    int _241 = _237 | _239;
    int _243 = _241 & 4;
    float _245 = _171 * 2.0;
    bool _247 = _173 > 0.5;
    float _249 = -_195;
    float _251 = fma(_213, 2.0, _249);
    float _253 = exp2(_211);
    float _255 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _257 = as_type<float>(_243);
    float _259 = _183;
    if (!_169)
    {
        float _261 = in.m_56.z;
        _257 = _261;
    }
    float _263 = _257;
    float _265 = 0.0;
    if (!_169)
    {
        _265 = _179;
    }
    float _267 = _265;
    float _269 = _205 * _191;
    float _271 = _185 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _273 = _185 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _275 = _185 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _277 = fma(_255, -2.0, _181);
    float _279 = floor(_245);
    float _281 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].x, _273);
    float _283 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].x, _271);
    float _285 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    float _287 = _267;
    float _289 = _275;
    float _291 = _191;
    if (_169)
    {
        _259 = _165;
    }
    float _293 = _259;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _297 = _293;
    if (!_169)
    {
        _297 = _171;
    }
    float _299 = _297;
    float _301 = -_253;
    float _303 = _301 + 1.0;
    if (_169)
    {
        _287 = _165;
    }
    float _305 = _287;
    float _307 = -_137;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[76].x, _251);
    int _311 = int(_199);
    int _313 = _203 ? 2 : 0;
    int _315 = _311 | _313;
    int _317 = _247 ? 4 : 0;
    int _319 = _315 | _317;
    int _321 = _169 ? 8 : 0;
    int _323 = _319 | _321;
    int _325 = false ? 16 : 0;
    int _327 = _323 | _325;
    int _329 = false ? 32 : 0;
    int _331 = _327 | _329;
    int _333 = false ? 64 : 0;
    int _335 = _331 | _333;
    int _337 = _335 & 4;
    float _339 = _299 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_169)
    {
        _289 = _171;
    }
    float _341 = _289;
    float _343 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _277);
    float _345 = _341;
    if (!_169)
    {
        _345 = _179;
    }
    float _347 = _345;
    float _349 = -_193;
    float _351 = fma(_339, 2.0, _349);
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _355 = _279 > 0.0;
    float _357 = -_137;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[86].x, _351);
    bool _361 = _279 >= 0.0;
    bool _363 = isnan(_279);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.0);
    bool _369 = _365 || _367;
    float _371 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[83].z, _353);
    float _373 = _279;
    if (_169)
    {
        _373 = _179;
    }
    float _375 = _373;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _379 = _305 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _381 = _375;
    if (!_169)
    {
        _381 = _165;
    }
    float _383 = _381;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _387 = _263;
    if (!_169)
    {
        _291 = _263;
    }
    float _389 = _291;
    float _391 = -_377;
    float _393 = fma(_379, 2.0, _391);
    float _395 = _389;
    if (_169)
    {
        _395 = _179;
    }
    float _397 = _395;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _401 = _383 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_169)
    {
        _387 = _179;
    }
    float _403 = _387;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _407 = _397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _409 = fma(_401, -2.0, _295);
    bool _411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _419 = _415 || _417;
    float _421 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[83].w, _399);
    float _423 = fma(_407, -2.0, _385);
    float _425 = _419 ? _303 : 0.0;
    float _427 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[89].z, _405);
    bool _429 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _431 = isnan(1.0);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _437 = _433 || _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _441 = 1.0 + _439;
    float _443 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _421);
    float _445 = 1.0 / _441;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _453 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _447);
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _457 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _449);
    float _459 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _451);
    float _461 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _455);
    bool _463 = !_199;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = _179 * 2.0;
    float _469 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _453);
    bool _471 = _337 != 0;
    float _473 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _457);
    bool _475 = !_203;
    float _477 = _475 ? (-0.5) : 0.5;
    float _479 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _459);
    float _481 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _483 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _485 = precise::max(_481, _483);
    float _487 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _461);
    float _489 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _371);
    float _491 = -_137;
    float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[81].x, _393);
    float _495 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[89].x, _427);
    float _497 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _423);
    float _499 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _409);
    if (_437)
    {
        float _501 = _425 * _445;
        _139 = _501;
    }
    float _503 = _139;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _515 = _513 != 0;
    float _517 = floor(_467);
    float _519 = -_477;
    int _521 = _471 ? as_type<int>(_519) : as_type<int>(_477);
    float _523 = _165 * 2.0;
    bool _525 = _485 >= 16.0;
    float _527 = _165 + _171;
    float _529 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[5].z, _281);
    int _531 = _369 ? 0 : 1;
    float _533 = _527 + (-1.0);
    float _535 = floor(_523);
    bool _537 = _179 > 0.5;
    float _539 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[4].z, _283);
    float _541 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _543 = !_507;
    float _545 = _543 ? _477 : as_type<float>(_521);
    float _547 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _269);
    int _549 = ~_531;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[6].z, _285);
    float _557 = floor(_215);
    float _559 = _539 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _561 = _517 > 0.0;
    float _563 = -_465;
    int _565 = _537 ? as_type<int>(_563) : as_type<int>(_465);
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _569 = _559 + _567;
    bool _571 = _517 >= 0.0;
    bool _573 = isnan(_517);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    bool _583 = !_511;
    float _585 = _583 ? _465 : as_type<float>(_565);
    float _587 = _165 + _179;
    bool _589 = _535 > 0.0;
    float _591 = floor(_547);
    int _593 = _553;
    float _595 = _559;
    if (!_355)
    {
        int _597 = ~_531;
        int _599 = _597 + 1;
        _593 = _599;
    }
    int _601 = _593;
    float _603 = _179 + _171;
    int _605 = _579 ? 0 : 1;
    float _607 = -_557;
    float _609 = _215 + _607;
    bool _611 = _535 >= 0.0;
    bool _613 = isnan(_535);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = _529 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _623 = _215 * 6.283185482025146484375;
    bool _625 = _171 > 0.5;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _629 = _621 + _627;
    float _631 = _623 * 0.15915493667125701904296875;
    int _633 = ~_605;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = _555 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _641 = _637;
    if (!_561)
    {
        int _643 = ~_605;
        int _645 = _643 + 1;
        _641 = _645;
    }
    int _647 = _641;
    float _649 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _651 = _619 ? 0 : 1;
    float _653 = _629 * _629;
    float _655 = -_477;
    int _657 = _625 ? as_type<int>(_655) : as_type<int>(_477);
    float _659 = _631 * 6.283185482025146484375;
    float _661 = cos(_659);
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _665 = _663 != 0;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _669 = _667 != 0;
    float _671 = fma(_569, _569, _653);
    int _673 = ~_651;
    int _675 = _673 + 1;
    int _677 = _675 + 1;
    float _679 = _603 + (-1.0);
    float _681 = _525 ? _581 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _683 = _587 + (-1.0);
    bool _685 = !_515;
    float _687 = _685 ? _477 : as_type<float>(_657);
    int _689 = _677;
    int _691 = _647;
    if (!_589)
    {
        int _693 = ~_651;
        int _695 = _693 + 1;
        _689 = _695;
    }
    int _697 = _689;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _709 = _707 != 0;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _639 + _711;
    float _715 = _525 ? _649 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _717 = abs(_681);
    bool _719 = _717 != 0.0;
    bool _721 = isnan(_717);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    float _729 = fma(_713, _713, _671);
    bool _731 = !_665;
    int _733 = _731 ? 0 : 1;
    float _735 = fma(_661, 0.5, 0.5);
    bool _737 = !_701;
    int _739 = _737 ? 0 : 1;
    float _741 = abs(_715);
    bool _743 = _741 == 0.0;
    bool _745 = !_727;
    bool _747 = _743 && _745;
    int _749 = abs(_739);
    float _751 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _753 = rsqrt(_729);
    float _755 = abs(_715);
    bool _757 = _755 == 0.0;
    bool _759 = !_709;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _765 = !_669;
    int _767 = _765 ? 0 : 1;
    int _769 = abs(_761);
    float _771 = -_609;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _775 = float(_601);
    float _777 = -_735;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _781 = _669;
    int _783 = _749;
    if (_747)
    {
        bool _785 = as_type<int>(_715) >= 0;
        _781 = _785;
    }
    bool _787 = _781;
    float _789 = float(_749);
    bool _791 = _609 < 0.5;
    float _793 = float(_791);
    float _795 = _789 * _775;
    int _797 = _787 ? (-1) : 0;
    if (_747)
    {
        int _799 = _787 ? 0 : 1078530011;
        _783 = _799;
    }
    int _801 = _783;
    float _803 = -_793;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _807 = float(_647);
    float _809 = float(_769);
    float _811 = _629 * _753;
    bool _813 = !_705;
    int _815 = _813 ? 0 : 1;
    if (_747)
    {
        int _817 = int(0x80000000) & as_type<int>(_681);
        int _819 = _801 | _817;
        _691 = _819;
    }
    int _821 = _691;
    bool _823 = !_727;
    bool _825 = _823 && _757;
    int _827 = _821;
    float _829 = as_type<float>(_821);
    if (!_825)
    {
        float _831 = abs(_681);
        bool _833 = _831 != as_type<float>(0x7f800000u /* inf */);
        bool _835 = isnan(_831);
        bool _837 = _833 || _835;
        bool _839 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _841 = _837 || _839;
        float _843 = abs(_715);
        bool _845 = _843 == as_type<float>(0x7f800000u /* inf */);
        float _847 = abs(_715);
        bool _849 = _847 == as_type<float>(0x7f800000u /* inf */);
        bool _851 = !_841;
        bool _853 = _849 && _851;
        if (_853)
        {
            bool _855 = as_type<int>(_715) >= 0;
            _797 = _855 ? (-1) : 0;
        }
        int _857 = _797;
        if (_853)
        {
            _827 = 1075235812;
        }
        int _859 = _827;
        int _861 = _859;
        if (_853)
        {
            int _863 = ~_857;
            int _865 = (_863 != 0) ? _859 : 1061752795;
            _861 = _865;
        }
        int _867 = _861;
        float _869 = as_type<float>(_867);
        if (_853)
        {
            int _871 = int(0x80000000) & as_type<int>(_681);
            int _873 = _867 | _871;
            _869 = as_type<float>(_873);
        }
        float _875 = _869;
        bool _877 = !_841;
        bool _879 = _877 && _845;
        _829 = _875;
        if (!_879)
        {
            float _881 = abs(_681);
            float _883 = abs(_715);
            float _885 = precise::max(_881, _883);
            float _887 = abs(_681);
            float _889 = abs(_715);
            float _891 = precise::min(_887, _889);
            float _893 = 1.0 / _885;
            float _895 = abs(_681);
            float _897 = abs(_715);
            bool _899 = _895 > _897;
            bool _901 = as_type<int>(_715) >= 0;
            float _903 = _891 * _893;
            float _905 = abs(_681);
            float _907 = abs(_715);
            float _909 = _905 + _907;
            int _911 = as_type<int>(_681) & int(0x80000000);
            float _913 = _903 * _903;
            bool _915 = _909 > as_type<float>(0x7f800000u /* inf */);
            bool _917 = isnan(_909);
            bool _919 = _915 || _917;
            bool _921 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _923 = _919 || _921;
            float _925 = _913 + 11.33538818359375;
            float _927 = fma(_913, _925, 28.84246826171875);
            float _929 = fma(_913, _927, 19.6966705322265625);
            float _931 = fma(_913, -0.82336294651031494140625, -5.674867153167724609375);
            float _933 = fma(_913, _931, -6.565555095672607421875);
            float _935 = 1.0 / _929;
            float _937 = _913 * _933;
            float _939 = _903 * _937;
            float _941 = fma(_939, _935, _903);
            float _943 = _941;
            _829 = _909;
            if (_899)
            {
                float _945 = -_941;
                float _947 = _945 + 1.57079637050628662109375;
                _943 = _947;
            }
            float _949 = _943;
            int _951 = as_type<int>(_949);
            if (!_901)
            {
                float _953 = -_949;
                float _955 = _953 + 3.1415927410125732421875;
                _951 = as_type<int>(_955);
            }
            int _957 = _951;
            if (!_923)
            {
                int _959 = _911 | _957;
                _829 = as_type<float>(_959);
            }
        }
    }
    float _961 = _829;
    float _963 = _795 * (-2.0);
    float _965 = _569 * _753;
    float _967 = -_811;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _629);
    int _971 = abs(_815);
    float _973 = fma(_763, _963, _763);
    float _975 = _165 + (-0.5);
    float _977 = float(_697);
    float _979 = _809 * _807;
    float _981 = -_965;
    float _983 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _985 = _969 * _969;
    float _987 = float(_971);
    float _989 = _713 * _753;
    float _991 = _975 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _993 = fma(_983, _983, _985);
    float _995 = _979 * (-2.0);
    float _997 = -_989;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _1001 = _987 * _977;
    float _1003 = -_591;
    float _1005 = _547 + _1003;
    float _1007 = _547 * 6.283185482025146484375;
    float _1009 = fma(_973, _503, _991);
    float _1011 = fma(_541, _995, _541);
    float _1013 = fma(_999, _999, _993);
    float _1015 = _1001 * (-2.0);
    float _1017 = _179 + (-0.5);
    float _1019 = _1007 * 0.15915493667125701904296875;
    int _1021 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1023 = _1021 != 0;
    float _1025 = fma(_751, _1015, _751);
    float _1027 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1029 = _171 + (-0.5);
    bool _1031 = !_1023;
    int _1033 = _1031 ? 0 : 1;
    float _1035 = _1019 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = fma(_1025, _503, _1027);
    float _1041 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _1043 = abs(_1033);
    float _1045 = _1009 * 0.15915493667125701904296875;
    float _1047 = _1039 + _961;
    float _1049 = in.m_58.x;
    float _1051 = in.m_58.y;
    int _1053 = abs(_733);
    float _1055 = fma(_1011, _503, _1041);
    bool _1057 = _1005 < 0.5;
    float _1059 = float(_1057);
    float _1061 = -_1005;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _1065 = abs(_767);
    float _1067 = sqrt(_1013);
    float _1069 = float(_1053);
    float _1071 = -_1059;
    float _1073 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1075 = fma(_1037, 0.5, 0.5);
    float _1077 = float(_1043);
    float _1079 = _1055 * 0.15915493667125701904296875;
    float _1081 = abs(_1063);
    float _1083 = _1069 * _1081;
    float _1085 = -_1075;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1089 = abs(_773);
    float _1091 = _1069 * _1089;
    float _1093 = _1047 * 0.15915493667125701904296875;
    float _1095 = fma(_1077, _1087, _1083);
    float _1097 = float(_1065);
    float _1099 = fma(_1077, _779, _1091);
    float _1101 = _1045 * 6.283185482025146484375;
    float _1103 = sin(_1101);
    float _1105 = _753 * _1067;
    float _1107 = abs(_1073);
    float _1109 = fma(_1097, _1107, _1095);
    float _1111 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1113 = abs(_805);
    float _1115 = fma(_1097, _1113, _1099);
    float _1117 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1119 = _1045 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    float _1123 = _1109 * _1111;
    float _1125 = _1115 * _1117;
    float _1127 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _477);
    float _1129 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1131 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _465);
    float _1135 = _1079 * 6.283185482025146484375;
    float _1137 = cos(_1135);
    float _1139 = _1105 * _1129;
    float _1141 = _1105 * _1131;
    float _1143 = _1139 * _1127;
    float _1145 = _1141 * _1133;
    float _1147 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1149 = _1147 * 0.5;
    float _1151 = _1093 * 6.283185482025146484375;
    float _1153 = sin(_1151);
    float _1155 = _1093 * 6.283185482025146484375;
    float _1157 = cos(_1155);
    float _1159 = _1103 * _1137;
    float _1161 = _1159 * _1143;
    float _1163 = _1079 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    float _1167 = _1121 * _1153;
    float _1169 = _1103 * _1153;
    float _1171 = _1153 * _1137;
    float _1173 = _1103 * _1157;
    float _1175 = _1121 * _1157;
    float _1177 = _1157 * _1137;
    float _1179 = _1121 * _1137;
    float _1181 = -_1167;
    float _1183 = fma(_1165, _1173, _1181);
    float _1185 = fma(_1165, _1169, _1175);
    float _1187 = -_1143;
    float _1189 = _1165 * _1187;
    float _1191 = fma(_1165, _1175, _1169);
    float _1193 = fma(_1183, _1145, _1161);
    float _1195 = _1179 * _1143;
    float _1197 = fma(_1177, _1145, _1189);
    float _1199 = -_1173;
    float _1201 = fma(_1165, _1167, _1199);
    float _1203 = fma(_1185, _1149, _1193);
    float _1205 = fma(_1191, _1145, _1195);
    float _1207 = fma(_1171, _1149, _1197);
    float _1209 = _639 + _1203;
    float _1211 = fma(_1201, _1149, _1205);
    float _1213 = _559 + _1207;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1209 + _1215;
    float _1219 = _621 + _1211;
    float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1223 = _1213 + _1221;
    float _1225 = _1217 * _1217;
    float _1227 = fma(_1223, _1223, _1225);
    float _1229 = sqrt(_1227);
    bool _1231 = _1229 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1233 = _1167;
    float _1235 = _1169;
    float _1237 = _1149;
    float _1239 = _1211;
    float _1241 = as_type<float>(_1065);
    if (!_1231)
    {
        _1233 = _1213;
    }
    float _1243 = _1233;
    float _1245 = _1243;
    if (!_1231)
    {
        _1235 = _1209;
    }
    float _1247 = _1235;
    float _1249 = _1247;
    if (!_1231)
    {
        _1237 = _1219;
    }
    float _1251 = _1237;
    bool _1253 = !_1231;
    float _1255 = _1251;
    if (!_1253)
    {
        float _1257 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1261 = _1229 + _1259;
        float _1263 = rsqrt(_1227);
        float _1265 = _1261 * _1257;
        float _1267 = _1219 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = _1265 * 0.15915493667125701904296875;
        float _1271 = _1269 * 6.283185482025146484375;
        float _1273 = cos(_1271);
        float _1275 = _1269 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        float _1279 = _1273 + (-1.0);
        float _1281 = fma(_1277, _1267, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1283 = _1279 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1285 = _1263 * _1281;
        float _1287 = fma(_1219, _1273, _1283);
        float _1289 = fma(_1223, _1285, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1291 = fma(_1217, _1285, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1255 = _1287;
        _1245 = _1289;
        _1249 = _1291;
    }
    float _1293 = _1255;
    float _1295 = _1245;
    float _1297 = _1249;
    float _1299 = -_811;
    float _1301 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1293);
    float _1303 = -_965;
    float _1305 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1295);
    float _1307 = -_989;
    float _1309 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1297);
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1313 = _1301 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1317 = _1305 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1321 = _1309 + _1319;
    float _1323 = -_965;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _559);
    float _1327 = _1313 * _1313;
    float _1329 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1331 = -_989;
    float _1333 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1335 = fma(_1317, _1317, _1327);
    float _1337 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1329);
    float _1339 = fma(_1321, _1321, _1335);
    float _1341 = rsqrt(_1339);
    float _1343 = sqrt(_1339);
    float _1345 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1347 = _1317 * _1345;
    float _1349 = _1321 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 * _1349;
    float _1355 = _1351 + _1353;
    float _1357 = sqrt(_1355);
    bool _1359 = _1357 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1363 = _1357 + _1361;
    float _1365 = _1137;
    float _1367 = _1363;
    float _1369 = _1349;
    float _1371 = _1351;
    float _1373 = _1353;
    if (_1359)
    {
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1375;
    }
    float _1377 = _1365;
    if (!_1359)
    {
        _595 = _1347;
    }
    float _1379 = _595;
    float _1381 = _1379;
    if (_1359)
    {
        float _1383 = rsqrt(_1355);
        _1239 = _1383;
    }
    float _1385 = _1239;
    if (_1359)
    {
        float _1387 = _1363 * _1377;
        _1367 = _1387;
    }
    float _1389 = _1367;
    if (_1359)
    {
        float _1391 = _1389 * 0.15915493667125701904296875;
        _1241 = _1391;
    }
    float _1393 = _1241;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = _1093;
    if (_1359)
    {
        float _1399 = _1393 * 6.283185482025146484375;
        float _1401 = sin(_1399);
        _1397 = _1401;
    }
    float _1403 = _1397;
    float _1405 = precise::max(0.0, _1395);
    float _1407 = -_1345;
    float _1409 = -_1405;
    float _1411 = fma(_1313, _1407, _1409);
    float _1413 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1415 = _1405;
    float _1417 = _1411;
    if (_1359)
    {
        float _1419 = _1393 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        _1413 = _1421;
    }
    float _1423 = _1413;
    float _1425 = fma(_1325, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1427 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1359)
    {
        float _1429 = _1411 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1415 = _1429;
    }
    float _1431 = _1415;
    float _1433 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1337);
    float _1435 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1427);
    float _1437 = _1403;
    float _1439 = _1431;
    if (_1359)
    {
        float _1441 = fma(_1403, _1431, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = floor(_1425);
    float _1447 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1435);
    float _1449 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1451 = _1443;
    if (_1359)
    {
        float _1453 = _1385 * _1443;
        _1451 = _1453;
    }
    float _1455 = _1451;
    float _1457 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1459 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1359)
    {
        float _1461 = _1423 + (-1.0);
        _1439 = _1461;
    }
    float _1463 = _1439;
    float _1465 = _1463;
    if (_1359)
    {
        float _1467 = _1347 * _1455;
        _1381 = _1467;
    }
    float _1469 = _1381;
    if (_1359)
    {
        float _1471 = _1349 * _1455;
        _1369 = _1471;
    }
    float _1473 = _1369;
    if (_1359)
    {
        float _1475 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1465 = _1475;
    }
    float _1477 = _1465;
    if (_1359)
    {
        float _1479 = _1469 * _1469;
        _1371 = _1479;
    }
    float _1481 = _1371;
    if (_1359)
    {
        float _1483 = _1473 * _1473;
        _1373 = _1483;
    }
    float _1485 = _1373;
    float _1487 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1457);
    if (_1359)
    {
        float _1489 = fma(_1411, _1423, _1477);
        _1417 = _1489;
    }
    float _1491 = _1417;
    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1495 = fma(_1343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1493);
    float _1497 = precise::clamp(_1495, 0.0, 1.0);
    float _1499 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1487);
    float _1501 = fma(_1491, _1491, _1481);
    float _1503 = -_1497;
    float _1505 = _1503 + 1.0;
    float _1507 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1509 = _1501 + _1485;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1513 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1515 = fma(_1333, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1517 = abs(_1505);
    float _1519 = log2(_1517);
    float _1521 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1523 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1513);
    float _1525 = -_1521;
    float _1527 = fma(_1525, _1511, 1.0);
    float _1529 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1523);
    float _1531 = rsqrt(_1509);
    float _1533 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1535 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1537 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1535);
    float _1539 = floor(_1515);
    float _1541 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1543 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1537);
    float _1545 = _1531 * _1469;
    float _1547 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1543);
    float _1549 = _1531 * _1491;
    float _1551 = _1531 * _1473;
    float _1553 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1555 = exp2(_1541);
    float _1557 = -_1553;
    float _1559 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1557);
    float _1561 = -_1539;
    float _1563 = _1515 + _1561;
    float _1565 = _1549 + 1.0;
    float _1567 = -_1551;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1559);
    float _1571 = -_1445;
    float _1573 = _1425 + _1571;
    float _1575 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1577 = 1.0 / _1547;
    float _1579 = fma(_1569, -0.5, 0.5);
    float _1581 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1583 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1575);
    float _1585 = fma(_1569, 0.5, 0.5);
    float _1587 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1581);
    float _1589 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1583);
    float _1591 = log2(_1527);
    float _1593 = fma(_1585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1595 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1587);
    float _1597 = -_1549;
    float _1599 = fma(_1555, _1565, _1597);
    float _1601 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1589);
    float _1603 = fma(_1585, _1593, -0.212114393711090087890625);
    float _1605 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1595);
    float _1607 = fma(_1599, 0.5, 0.5);
    float _1609 = sqrt(_1579);
    float _1611 = _1601 * _1577;
    float _1613 = _1605 * _1577;
    float _1615 = fma(_1585, _1603, 1.570728778839111328125);
    float _1617 = _1591 * 0.693147182464599609375;
    float2 _4838 = float2(_1573, _1563);
    float _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4838, float2(0.0), isnan(_4838)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4838, float2(0.0), isnan(_4838)), level(0.0)).x;
    float _1621 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1623 = _1609 * 0.636619746685028076171875;
    float _1625 = fma(_1611, 0.5, 0.5);
    float _1627 = fma(_1613, -0.5, 0.5);
    float _1629 = -_1615;
    float _1631 = fma(_1623, _1629, 1.0);
    float3 _4865 = float3(_1625, _1627, _1621);
    float _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4865, float3(0.0), isnan(_4865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4865, float3(0.0), isnan(_4865)), level(0.0)).x;
    float3 _4876 = float3(_1625, _1627, _1621);
    float4 _1636 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4876, float3(0.0), isnan(_4876)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4876, float3(0.0), isnan(_4876)), level(0.0)).xyzw;
    float _1638 = _1636.x;
    float _1640 = _1636.y;
    float _1642 = _1636.z;
    float _1644 = _1636.w;
    float2 _4892 = float2(_1631, _1607);
    float3 _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4892, float2(0.0), isnan(_4892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4892, float2(0.0), isnan(_4892)), level(0.0)).xyz;
    float _1650 = _1648.x;
    float _1652 = _1648.y;
    float _1654 = _1648.z;
    float _1656 = -_811;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _621);
    bool _1660 = _165 > 0.5;
    float _1662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1664 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1666 = _495 * (-0.15915493667125701904296875);
    float _1668 = -_489;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1664);
    bool _1674 = _179 > 0.5;
    float _1676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1678 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1672);
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1682 = _1680 != 0;
    float _1684 = -_443;
    float _1686 = _1684 + 1.0;
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1690 = _1688 != 0;
    float _1692 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1694 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1696 = _1666 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    float _1700 = -_477;
    int _1702 = _1674 ? as_type<int>(_1700) : as_type<int>(_477);
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1706 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1694);
    float _1708 = -_479;
    float _1710 = _1708 + 1.0;
    bool _1712 = !_1690;
    float _1714 = _1712 ? _477 : as_type<float>(_1702);
    float _1716 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1706);
    float _1718 = 1.0 / _1692;
    float _1720 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1722 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1724 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1726 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1728 = _1714 + (-0.5);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1732 = _1730 != 0;
    float _1734 = _1724 + _1692;
    float _1736 = _1666 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = -_1722;
    float _1742 = -_343;
    float _1744 = fma(_1740, _1728, _1742);
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1748 = -_487;
    float _1750 = _1748 + 1.0;
    float _1752 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1734 * _1718;
    float _1758 = _1756 * 0.5;
    float _1760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1766 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1764);
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1770 = _687 * _1738;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1774 = 1.0 / _1766;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1780 = -_465;
    int _1782 = _1660 ? as_type<int>(_1780) : as_type<int>(_465);
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1786 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1790 = !_1682;
    float _1792 = _1790 ? _465 : as_type<float>(_1782);
    float _1794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1802 = _1792 + 0.5;
    bool _1804 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1806 = isnan(0.5);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1812 = _1808 || _1810;
    out.m_60.x = _1786;
    out.m_60.y = _1754;
    out.m_60.z = _1796;
    out.m_60.w = _1776;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1816 = _1774 * _1814;
    float _1818 = fma(_1726, _1802, _309);
    float _1820 = _687 * _1698;
    float _1822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1824 = -_465;
    int _1826 = _625 ? as_type<int>(_1824) : as_type<int>(_465);
    out.m_62.x = _1788;
    out.m_62.y = _1720;
    out.m_62.z = _1798;
    out.m_62.w = _1778;
    float _1828 = -_1820;
    float _1830 = fma(_585, _1738, _1828);
    float _1832 = fma(_585, _1698, _1770);
    float _1834 = abs(_1816);
    float _1836 = log2(_1834);
    bool _1838 = !_1732;
    float _1840 = _1838 ? _465 : as_type<float>(_1826);
    float _1842 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1844 = _545 + (-0.5);
    float _1846 = _465 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1848 = _1840 + 0.5;
    float _1850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1852 = _1832 + (-0.5);
    float _1854 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1856 = _1830 + 0.5;
    float _1858 = fma(_1800, _1848, _493);
    float _1860 = -_1842;
    float _1862 = -_499;
    float _1864 = fma(_1860, _1852, _1862);
    float _1866 = -_1854;
    float _1868 = -_497;
    float _1870 = fma(_1866, _1844, _1868);
    float _1872 = -_469;
    float _1874 = _1872 + 1.0;
    float _1876 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1878 = -_473;
    float _1880 = _1878 + 1.0;
    float _1882 = fma(_1714, _1874, _1744);
    float _1884 = -_1670;
    float _1886 = fma(_1840, _1884, _1858);
    float _1888 = -_1880;
    float _1890 = fma(_1792, _1888, _1818);
    float _1892 = exp2(_1876);
    float _1894 = fma(_545, _1686, _1870);
    float _1896 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1898 = fma(_1832, _1750, _1864);
    float _1900 = fma(_1896, _1856, _359);
    float _1902 = -_477;
    float _1904 = _1902 + 0.5;
    float _1906 = _477 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_64.x = _1890;
    out.m_64.y = _1882;
    out.m_64.z = _1886;
    out.m_64.w = _1894;
    float _1908 = -_1710;
    float _1910 = fma(_1830, _1908, _1900);
    float _1912 = exp2(_1752);
    float _1914 = -_1906;
    float _1916 = _1165 * _1914;
    float _1918 = in.m_66.x;
    float _1920 = _1864;
    float _1922 = _1547;
    float _1924 = _1605;
    if (_1812)
    {
        _1920 = 1.0;
    }
    float _1926 = _1920;
    float _1928 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1930 = precise::clamp(_1928, 0.0, 1.0);
    float _1932 = _1179 * _1906;
    float _1934 = _1159 * _1906;
    out.m_68.x = _1910;
    out.m_68.y = _1898;
    float _1936 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_70.y = _1904;
    float _1938 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1936);
    float _1940 = fma(_1183, _1846, _1934);
    float _1942 = fma(_1177, _1846, _1916);
    float _1944 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1938);
    float _1946 = fma(_1930, -2.0, 3.0);
    float _1948 = _1930 * _1930;
    float _1950 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1944);
    float _1952 = _1948 * _1946;
    bool _1954 = _1816 <= 8000.0;
    bool _1956 = isnan(_1816);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(8000.0);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = _1950 + _1547;
    float _1968 = -_1952;
    float _1970 = _1968 + 1.0;
    float _1972 = _1966 * 0.5;
    float _1974 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1952);
    float _1976 = fma(_1191, _1846, _1932);
    float _1978 = _1964 * _1974;
    float _1980 = _1926;
    float _1982 = _1950;
    float _1984 = _1972;
    if (!_1812)
    {
        float _1986 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1988 = _1986 * 0.15915493667125701904296875;
        float _1990 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1992 = _1988 * 6.283185482025146484375;
        float _1994 = cos(_1992);
        float _1996 = _1990 * 0.15915493667125701904296875;
        float _1998 = _1988 * 6.283185482025146484375;
        float _2000 = sin(_1998);
        float _2002 = 1.0 / _1994;
        float _2004 = _1996 * 6.283185482025146484375;
        float _2006 = cos(_2004);
        float _2008 = _2000 * _2002;
        float _2010 = _1996 * 6.283185482025146484375;
        float _2012 = sin(_2010);
        float _2014 = _2006 * _2008;
        float _2016 = 1.0 / _2014;
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2020 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2018;
        float _2022 = 1.0 / _2020;
        float _2024 = _2012 * _2016;
        float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2028 = fma(_1816, _2024, _2026);
        float _2030 = _2028 * _2022;
        float _2032 = precise::clamp(_2030, 0.0, 1.0);
        _1980 = _2032;
    }
    float _2034 = _1980;
    float _2036 = -_1912;
    float _2038 = _2036 + 1.0;
    float _2040 = _1201 + _1976;
    float _2042 = _1185 + _1940;
    float _2044 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2048 = -_1619;
    float _2050 = _2048 + 1.0;
    out.gl_Position.x = _1601;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _1950;
    out.gl_Position.w = _1547;
    float _2052 = _2046 * _1633;
    float _2054 = _2050 * _2044;
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = -_2046;
    float _2060 = _2058 + 1.0;
    float _2062 = _1171 + _1942;
    float _2064 = _1644 * _2052;
    float _2066 = _1654 * _2052;
    float _2068 = _1644 * _2060;
    out.m_72.x = _1305;
    out.m_72.y = _1301;
    out.m_72.z = _1309;
    bool _2070 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2072 = isnan(_1343);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2078 = _2074 || _2076;
    float _2080 = fma(_1644, _2066, _1642);
    out.m_74.x = _2062;
    out.m_74.y = _2040;
    out.m_74.z = _2042;
    float _2082 = -_2056;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2086 = fma(_1650, _2064, _1638);
    float _2088 = fma(_1652, _2064, _1640);
    out.m_76.z = _1972;
    out.m_76.w = _1547;
    float _2090 = _2084 * _1918;
    out.m_78.x = _2086;
    out.m_78.y = _2088;
    out.m_78.z = _2080;
    out.m_78.w = _2068;
    float _2092 = _2090 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2094 = _2090;
    float _2096 = _2092;
    if (!_2078)
    {
        _1922 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2098 = _1922;
    float _2100 = _2098;
    float _2102 = _2098;
    if (!_2078)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2104 = _1982;
    out.m_80.x = _2092;
    float _2106 = _2034 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2108 = _2104;
    float _2110 = _2104;
    if (!_2078)
    {
        _1984 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2112 = _1984;
    float _2114 = _2112;
    float _2116 = _2112;
    if (!_2078)
    {
        _1924 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2118 = _1924;
    float _2120 = _2118;
    float _2122 = _2118;
    if (!_2078)
    {
        _2094 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2124 = _2094;
    float _2126 = _2124;
    float _2128 = _2124;
    if (!_2078)
    {
        _2096 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2130 = _2096;
    bool _2132 = !_2078;
    float _2134 = _2130;
    float _2136 = _2130;
    if (!_2132)
    {
        bool _2138 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2140 = isnan(_1343);
        bool _2142 = _2138 || _2140;
        bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2146 = _2142 || _2144;
        if (!_2146)
        {
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2150 = _1343 + _2148;
            float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2154 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2152;
            float _2156 = 1.0 / _2154;
            float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2178 = _2150 * _2156;
            float _2180 = precise::clamp(_2178, 0.0, 1.0);
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2186 = fma(_2180, _2160, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2188 = fma(_2180, _2184, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2190 = fma(_2180, _2164, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2192 = fma(_2180, _2168, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2194 = fma(_2180, _2172, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2196 = fma(_2180, _2176, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2102 = _2188;
            _2128 = _2194;
            _2116 = _2186;
            _2122 = _2192;
            _2110 = _2190;
            _2136 = _2196;
            _2198 = true;
        }
        else
        {
            bool _2200 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2202 = isnan(_1343);
            bool _2204 = _2200 || _2202;
            bool _2206 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2208 = _2204 || _2206;
            if (!_2208)
            {
                _2114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2210 = _2114;
            _2116 = _2210;
            if (!_2208)
            {
                _2100 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2212 = _2100;
            _2102 = _2212;
            if (!_2208)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2214 = _2108;
            _2110 = _2214;
            if (!_2208)
            {
                _2120 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2216 = _2120;
            _2122 = _2216;
            if (!_2208)
            {
                _2126 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2218 = _2126;
            _2128 = _2218;
            if (!_2208)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2220 = _2134;
            bool _2222 = !_2208;
            _2136 = _2220;
            if (!_2222)
            {
                bool _2224 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2226 = isnan(_1343);
                bool _2228 = _2224 || _2226;
                bool _2230 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2232 = _2228 || _2230;
                if (!_2232)
                {
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2236 = _1343 + _2234;
                    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2240 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2238;
                    float _2242 = 1.0 / _2240;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2264 = _2236 * _2242;
                    float _2266 = precise::clamp(_2264, 0.0, 1.0);
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2272 = fma(_2266, _2246, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2274 = fma(_2266, _2270, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2276 = fma(_2266, _2250, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2278 = fma(_2266, _2254, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2280 = fma(_2266, _2258, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2282 = fma(_2266, _2262, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2102 = _2274;
                    _2128 = _2280;
                    _2116 = _2272;
                    _2122 = _2278;
                    _2110 = _2276;
                    _2136 = _2282;
                    _2198 = true;
                }
                else
                {
                    _2102 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2128 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2122 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2198 = false;
    float _2284 = _2102;
    float _2286 = _2128;
    float _2288 = _2116;
    float _2290 = _2122;
    float _2292 = _2110;
    float _2294 = _2136;
    float _2296 = fma(_2040, -0.5, 0.5);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = -_2284;
    float _2302 = _2300 + _2286;
    float _2304 = _2106 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2306 = -_2288;
    float _2308 = _2306 + _2290;
    float _2310 = fma(_2298, _2302, _2284);
    out.m_82.x = 0.0;
    float _2312 = -_2292;
    float _2314 = _2312 + _2294;
    float _2316 = fma(_2298, _2308, _2288);
    float _2318 = _2310 * 0.586610972881317138671875;
    out.m_49.x = _2304;
    bool _2320 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2322 = fma(_2298, _2314, _2292);
    float _2324 = fma(_2316, 0.298911988735198974609375, _2318);
    bool _2326 = _2034 > 0.0;
    bool _2328 = isnan(_2034);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(0.0);
    bool _2334 = _2330 || _2332;
    float _2336 = fma(_2322, 0.114477999508380889892578125, _2324);
    float _2338 = -_2336;
    float _2340 = _2316 + _2338;
    float _2342 = -_2336;
    float _2344 = _2310 + _2342;
    float _2346 = -_2336;
    float _2348 = _2322 + _2346;
    float _2350 = fma(_2340, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2336);
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2336);
    float _2354 = fma(_2348, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2336);
    bool _2356 = !_2320;
    if (!_2356)
    {
        float _2358 = -_1301;
        float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2362 = -_1305;
        float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2366 = -_1309;
        float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2370 = _2360 * _2360;
        float _2372 = fma(_2364, _2364, _2370);
        float _2374 = fma(_2368, _2368, _2372);
        float _2376 = sqrt(_2374);
        float _2378 = rsqrt(_2374);
        float _2380 = -_2376;
        float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2384 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2386 = precise::clamp(_2384, 0.0, 1.0);
        float _2388 = _2364 * _2378;
        float _2390 = _2360 * _2378;
        float _2392 = abs(_2386);
        float _2394 = log2(_2392);
        float _2396 = _2368 * _2378;
        float _2398 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2400 = _2040 * _2390;
        float _2402 = -_2390;
        float _2404 = -_2398;
        float _2406 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2404);
        float _2408 = fma(_2062, _2388, _2400);
        float _2410 = -_2396;
        float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2406);
        float _2414 = fma(_2042, _2396, _2408);
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2420 = _2412 + _2418;
        float _2422 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2424 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2426 = precise::clamp(_2424, 0.0, 1.0);
        float _2428 = exp2(_2422);
        float _2430 = _2428 * _2426;
        float _2432 = _2416 * _2430;
        float _2434 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2436 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2438 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2434;
        out.m_82.y = _2436;
        out.m_82.z = _2438;
    }
    out.m_84.x = _2350;
    out.m_84.y = _2352;
    out.m_84.z = _2354;
    if (_2334)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2440 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2440;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2198 = false;
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
    float _111 = as_type<float>(_103);
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _109;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _113 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2498 = as_type<float>(_119);
        out.gl_Position.z = _2498;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _111 = _141;
    }
    float _143 = _111;
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
        float _2568 = as_type<float>(_157);
        out.gl_Position.z = _2568;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _163 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _165 = in.m_56.x;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _169 = _167 != 0;
    float _171 = in.m_56.z;
    float _173 = in.m_56.w;
    float _175 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _177 = log2(_175);
    float _179 = in.m_56.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _183 = in.m_46.x;
    float _185 = in.m_46.y;
    float _187 = in.m_46.z;
    float _189 = _163 * _161;
    float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _193 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _197 = as_type<int>(_159) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_159) & 2;
    bool _203 = _201 != 0;
    float _205 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _207 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _209 = _207 != 0;
    float _211 = _177 * _137;
    float _213 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _215 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _189);
    int _217 = int(_199);
    int _219 = _203 ? 2 : 0;
    int _221 = _217 | _219;
    int _223 = _209 ? 4 : 0;
    int _225 = _221 | _223;
    int _227 = _169 ? 8 : 0;
    int _229 = _225 | _227;
    int _231 = false ? 16 : 0;
    int _233 = _229 | _231;
    int _235 = false ? 32 : 0;
    int _237 = _233 | _235;
    int _239 = false ? 64 : 0;
    int _241 = _237 | _239;
    int _243 = _241 & 4;
    float _245 = _171 * 2.0;
    bool _247 = _173 > 0.5;
    float _249 = -_195;
    float _251 = fma(_213, 2.0, _249);
    float _253 = exp2(_211);
    float _255 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _257 = as_type<float>(_243);
    float _259 = _183;
    if (!_169)
    {
        float _261 = in.m_56.z;
        _257 = _261;
    }
    float _263 = _257;
    float _265 = 0.0;
    if (!_169)
    {
        _265 = _179;
    }
    float _267 = _265;
    float _269 = _205 * _191;
    float _271 = _185 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _273 = _185 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _275 = _185 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _277 = fma(_255, -2.0, _181);
    float _279 = floor(_245);
    float _281 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[5].x, _273);
    float _283 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[4].x, _271);
    float _285 = fma(_183, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    float _287 = _267;
    float _289 = _275;
    float _291 = _191;
    if (_169)
    {
        _259 = _165;
    }
    float _293 = _259;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _297 = _293;
    if (!_169)
    {
        _297 = _171;
    }
    float _299 = _297;
    float _301 = -_253;
    float _303 = _301 + 1.0;
    if (_169)
    {
        _287 = _165;
    }
    float _305 = _287;
    float _307 = -_137;
    float _309 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[76].x, _251);
    int _311 = int(_199);
    int _313 = _203 ? 2 : 0;
    int _315 = _311 | _313;
    int _317 = _247 ? 4 : 0;
    int _319 = _315 | _317;
    int _321 = _169 ? 8 : 0;
    int _323 = _319 | _321;
    int _325 = false ? 16 : 0;
    int _327 = _323 | _325;
    int _329 = false ? 32 : 0;
    int _331 = _327 | _329;
    int _333 = false ? 64 : 0;
    int _335 = _331 | _333;
    int _337 = _335 & 4;
    float _339 = _299 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (_169)
    {
        _289 = _171;
    }
    float _341 = _289;
    float _343 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _277);
    float _345 = _341;
    if (!_169)
    {
        _345 = _179;
    }
    float _347 = _345;
    float _349 = -_193;
    float _351 = fma(_339, 2.0, _349);
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _355 = _279 > 0.0;
    float _357 = -_137;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[86].x, _351);
    bool _361 = _279 >= 0.0;
    bool _363 = isnan(_279);
    bool _365 = _361 || _363;
    bool _367 = isnan(0.0);
    bool _369 = _365 || _367;
    float _371 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[83].z, _353);
    float _373 = _279;
    if (_169)
    {
        _373 = _179;
    }
    float _375 = _373;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _379 = _305 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _381 = _375;
    if (!_169)
    {
        _381 = _165;
    }
    float _383 = _381;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _387 = _263;
    if (!_169)
    {
        _291 = _263;
    }
    float _389 = _291;
    float _391 = -_377;
    float _393 = fma(_379, 2.0, _391);
    float _395 = _389;
    if (_169)
    {
        _395 = _179;
    }
    float _397 = _395;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _401 = _383 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_169)
    {
        _387 = _179;
    }
    float _403 = _387;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _407 = _397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _409 = fma(_401, -2.0, _295);
    bool _411 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _413 = isnan(0.0);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _419 = _415 || _417;
    float _421 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[83].w, _399);
    float _423 = fma(_407, -2.0, _385);
    float _425 = _419 ? _303 : 0.0;
    float _427 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[89].z, _405);
    bool _429 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _431 = isnan(1.0);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _437 = _433 || _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _441 = 1.0 + _439;
    float _443 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _421);
    float _445 = 1.0 / _441;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _453 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _447);
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _457 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _449);
    float _459 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _451);
    float _461 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _455);
    bool _463 = !_199;
    float _465 = _463 ? (-0.5) : 0.5;
    float _467 = _179 * 2.0;
    float _469 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _453);
    bool _471 = _337 != 0;
    float _473 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _457);
    bool _475 = !_203;
    float _477 = _475 ? (-0.5) : 0.5;
    float _479 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _459);
    float _481 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _483 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _485 = precise::max(_481, _483);
    float _487 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _461);
    float _489 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _371);
    float _491 = -_137;
    float _493 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[81].x, _393);
    float _495 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[89].x, _427);
    float _497 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _423);
    float _499 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _409);
    if (_437)
    {
        float _501 = _425 * _445;
        _139 = _501;
    }
    float _503 = _139;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _515 = _513 != 0;
    float _517 = floor(_467);
    float _519 = -_477;
    int _521 = _471 ? as_type<int>(_519) : as_type<int>(_477);
    float _523 = _165 * 2.0;
    bool _525 = _485 >= 16.0;
    float _527 = _165 + _171;
    float _529 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[5].z, _281);
    int _531 = _369 ? 0 : 1;
    float _533 = _527 + (-1.0);
    float _535 = floor(_523);
    bool _537 = _179 > 0.5;
    float _539 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[4].z, _283);
    float _541 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _543 = !_507;
    float _545 = _543 ? _477 : as_type<float>(_521);
    float _547 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _269);
    int _549 = ~_531;
    int _551 = _549 + 1;
    int _553 = _551 + 1;
    float _555 = fma(_187, (*spvDescriptorSet0.vp_c10)._m0[6].z, _285);
    float _557 = floor(_215);
    float _559 = _539 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _561 = _517 > 0.0;
    float _563 = -_465;
    int _565 = _537 ? as_type<int>(_563) : as_type<int>(_465);
    float _567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _569 = _559 + _567;
    bool _571 = _517 >= 0.0;
    bool _573 = isnan(_517);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    bool _583 = !_511;
    float _585 = _583 ? _465 : as_type<float>(_565);
    float _587 = _165 + _179;
    bool _589 = _535 > 0.0;
    float _591 = floor(_547);
    int _593 = _553;
    float _595 = _559;
    if (!_355)
    {
        int _597 = ~_531;
        int _599 = _597 + 1;
        _593 = _599;
    }
    int _601 = _593;
    float _603 = _179 + _171;
    int _605 = _579 ? 0 : 1;
    float _607 = -_557;
    float _609 = _215 + _607;
    bool _611 = _535 >= 0.0;
    bool _613 = isnan(_535);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = _529 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _623 = _215 * 6.283185482025146484375;
    bool _625 = _171 > 0.5;
    float _627 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _629 = _621 + _627;
    float _631 = _623 * 0.15915493667125701904296875;
    int _633 = ~_605;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = _555 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _641 = _637;
    if (!_561)
    {
        int _643 = ~_605;
        int _645 = _643 + 1;
        _641 = _645;
    }
    int _647 = _641;
    float _649 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    int _651 = _619 ? 0 : 1;
    float _653 = _629 * _629;
    float _655 = -_477;
    int _657 = _625 ? as_type<int>(_655) : as_type<int>(_477);
    float _659 = _631 * 6.283185482025146484375;
    float _661 = cos(_659);
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _665 = _663 != 0;
    int _667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _669 = _667 != 0;
    float _671 = fma(_569, _569, _653);
    int _673 = ~_651;
    int _675 = _673 + 1;
    int _677 = _675 + 1;
    float _679 = _603 + (-1.0);
    float _681 = _525 ? _581 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _683 = _587 + (-1.0);
    bool _685 = !_515;
    float _687 = _685 ? _477 : as_type<float>(_657);
    int _689 = _677;
    int _691 = _647;
    if (!_589)
    {
        int _693 = ~_651;
        int _695 = _693 + 1;
        _689 = _695;
    }
    int _697 = _689;
    int _699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _701 = _699 != 0;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _705 = _703 != 0;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _709 = _707 != 0;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _713 = _639 + _711;
    float _715 = _525 ? _649 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _717 = abs(_681);
    bool _719 = _717 != 0.0;
    bool _721 = isnan(_717);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    float _729 = fma(_713, _713, _671);
    bool _731 = !_665;
    int _733 = _731 ? 0 : 1;
    float _735 = fma(_661, 0.5, 0.5);
    bool _737 = !_701;
    int _739 = _737 ? 0 : 1;
    float _741 = abs(_715);
    bool _743 = _741 == 0.0;
    bool _745 = !_727;
    bool _747 = _743 && _745;
    int _749 = abs(_739);
    float _751 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _753 = rsqrt(_729);
    float _755 = abs(_715);
    bool _757 = _755 == 0.0;
    bool _759 = !_709;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _765 = !_669;
    int _767 = _765 ? 0 : 1;
    int _769 = abs(_761);
    float _771 = -_609;
    float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _775 = float(_601);
    float _777 = -_735;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _781 = _669;
    int _783 = _749;
    if (_747)
    {
        bool _785 = as_type<int>(_715) >= 0;
        _781 = _785;
    }
    bool _787 = _781;
    float _789 = float(_749);
    bool _791 = _609 < 0.5;
    float _793 = float(_791);
    float _795 = _789 * _775;
    int _797 = _787 ? (-1) : 0;
    if (_747)
    {
        int _799 = _787 ? 0 : 1078530011;
        _783 = _799;
    }
    int _801 = _783;
    float _803 = -_793;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _807 = float(_647);
    float _809 = float(_769);
    float _811 = _629 * _753;
    bool _813 = !_705;
    int _815 = _813 ? 0 : 1;
    if (_747)
    {
        int _817 = int(0x80000000) & as_type<int>(_681);
        int _819 = _801 | _817;
        _691 = _819;
    }
    int _821 = _691;
    bool _823 = !_727;
    bool _825 = _823 && _757;
    int _827 = _821;
    float _829 = as_type<float>(_821);
    if (!_825)
    {
        float _831 = abs(_681);
        bool _833 = _831 != as_type<float>(0x7f800000u /* inf */);
        bool _835 = isnan(_831);
        bool _837 = _833 || _835;
        bool _839 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _841 = _837 || _839;
        float _843 = abs(_715);
        bool _845 = _843 == as_type<float>(0x7f800000u /* inf */);
        float _847 = abs(_715);
        bool _849 = _847 == as_type<float>(0x7f800000u /* inf */);
        bool _851 = !_841;
        bool _853 = _849 && _851;
        if (_853)
        {
            bool _855 = as_type<int>(_715) >= 0;
            _797 = _855 ? (-1) : 0;
        }
        int _857 = _797;
        if (_853)
        {
            _827 = 1075235812;
        }
        int _859 = _827;
        int _861 = _859;
        if (_853)
        {
            int _863 = ~_857;
            int _865 = (_863 != 0) ? _859 : 1061752795;
            _861 = _865;
        }
        int _867 = _861;
        float _869 = as_type<float>(_867);
        if (_853)
        {
            int _871 = int(0x80000000) & as_type<int>(_681);
            int _873 = _867 | _871;
            _869 = as_type<float>(_873);
        }
        float _875 = _869;
        bool _877 = !_841;
        bool _879 = _877 && _845;
        _829 = _875;
        if (!_879)
        {
            float _881 = abs(_681);
            float _883 = abs(_715);
            float _885 = precise::max(_881, _883);
            float _887 = abs(_681);
            float _889 = abs(_715);
            float _891 = precise::min(_887, _889);
            float _893 = 1.0 / _885;
            float _895 = abs(_681);
            float _897 = abs(_715);
            bool _899 = _895 > _897;
            bool _901 = as_type<int>(_715) >= 0;
            float _903 = _891 * _893;
            float _905 = abs(_681);
            float _907 = abs(_715);
            float _909 = _905 + _907;
            int _911 = as_type<int>(_681) & int(0x80000000);
            float _913 = _903 * _903;
            bool _915 = _909 > as_type<float>(0x7f800000u /* inf */);
            bool _917 = isnan(_909);
            bool _919 = _915 || _917;
            bool _921 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _923 = _919 || _921;
            float _925 = _913 + 11.33538818359375;
            float _927 = fma(_913, _925, 28.84246826171875);
            float _929 = fma(_913, _927, 19.6966705322265625);
            float _931 = fma(_913, -0.82336294651031494140625, -5.674867153167724609375);
            float _933 = fma(_913, _931, -6.565555095672607421875);
            float _935 = 1.0 / _929;
            float _937 = _913 * _933;
            float _939 = _903 * _937;
            float _941 = fma(_939, _935, _903);
            float _943 = _941;
            _829 = _909;
            if (_899)
            {
                float _945 = -_941;
                float _947 = _945 + 1.57079637050628662109375;
                _943 = _947;
            }
            float _949 = _943;
            int _951 = as_type<int>(_949);
            if (!_901)
            {
                float _953 = -_949;
                float _955 = _953 + 3.1415927410125732421875;
                _951 = as_type<int>(_955);
            }
            int _957 = _951;
            if (!_923)
            {
                int _959 = _911 | _957;
                _829 = as_type<float>(_959);
            }
        }
    }
    float _961 = _829;
    float _963 = _795 * (-2.0);
    float _965 = _569 * _753;
    float _967 = -_811;
    float _969 = fma(_967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _629);
    int _971 = abs(_815);
    float _973 = fma(_763, _963, _763);
    float _975 = _165 + (-0.5);
    float _977 = float(_697);
    float _979 = _809 * _807;
    float _981 = -_965;
    float _983 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[18].w, _569);
    float _985 = _969 * _969;
    float _987 = float(_971);
    float _989 = _713 * _753;
    float _991 = _975 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _993 = fma(_983, _983, _985);
    float _995 = _979 * (-2.0);
    float _997 = -_989;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _713);
    float _1001 = _987 * _977;
    float _1003 = -_591;
    float _1005 = _547 + _1003;
    float _1007 = _547 * 6.283185482025146484375;
    float _1009 = fma(_973, _503, _991);
    float _1011 = fma(_541, _995, _541);
    float _1013 = fma(_999, _999, _993);
    float _1015 = _1001 * (-2.0);
    float _1017 = _179 + (-0.5);
    float _1019 = _1007 * 0.15915493667125701904296875;
    int _1021 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _1023 = _1021 != 0;
    float _1025 = fma(_751, _1015, _751);
    float _1027 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1029 = _171 + (-0.5);
    bool _1031 = !_1023;
    int _1033 = _1031 ? 0 : 1;
    float _1035 = _1019 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = fma(_1025, _503, _1027);
    float _1041 = _1029 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _1043 = abs(_1033);
    float _1045 = _1009 * 0.15915493667125701904296875;
    float _1047 = _1039 + _961;
    float _1049 = in.m_58.x;
    float _1051 = in.m_58.y;
    int _1053 = abs(_733);
    float _1055 = fma(_1011, _503, _1041);
    bool _1057 = _1005 < 0.5;
    float _1059 = float(_1057);
    float _1061 = -_1005;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _1065 = abs(_767);
    float _1067 = sqrt(_1013);
    float _1069 = float(_1053);
    float _1071 = -_1059;
    float _1073 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1075 = fma(_1037, 0.5, 0.5);
    float _1077 = float(_1043);
    float _1079 = _1055 * 0.15915493667125701904296875;
    float _1081 = abs(_1063);
    float _1083 = _1069 * _1081;
    float _1085 = -_1075;
    float _1087 = fma(_1085, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1089 = abs(_773);
    float _1091 = _1069 * _1089;
    float _1093 = _1047 * 0.15915493667125701904296875;
    float _1095 = fma(_1077, _1087, _1083);
    float _1097 = float(_1065);
    float _1099 = fma(_1077, _779, _1091);
    float _1101 = _1045 * 6.283185482025146484375;
    float _1103 = sin(_1101);
    float _1105 = _753 * _1067;
    float _1107 = abs(_1073);
    float _1109 = fma(_1097, _1107, _1095);
    float _1111 = _1051 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1113 = abs(_805);
    float _1115 = fma(_1097, _1113, _1099);
    float _1117 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1119 = _1045 * 6.283185482025146484375;
    float _1121 = cos(_1119);
    float _1123 = _1109 * _1111;
    float _1125 = _1115 * _1117;
    float _1127 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _477);
    float _1129 = _1123 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1131 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _465);
    float _1135 = _1079 * 6.283185482025146484375;
    float _1137 = cos(_1135);
    float _1139 = _1105 * _1129;
    float _1141 = _1105 * _1131;
    float _1143 = _1139 * _1127;
    float _1145 = _1141 * _1133;
    float _1147 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1149 = _1147 * 0.5;
    float _1151 = _1093 * 6.283185482025146484375;
    float _1153 = sin(_1151);
    float _1155 = _1093 * 6.283185482025146484375;
    float _1157 = cos(_1155);
    float _1159 = _1103 * _1137;
    float _1161 = _1159 * _1143;
    float _1163 = _1079 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    float _1167 = _1121 * _1153;
    float _1169 = _1103 * _1153;
    float _1171 = _1153 * _1137;
    float _1173 = _1103 * _1157;
    float _1175 = _1121 * _1157;
    float _1177 = _1157 * _1137;
    float _1179 = _1121 * _1137;
    float _1181 = -_1167;
    float _1183 = fma(_1165, _1173, _1181);
    float _1185 = fma(_1165, _1169, _1175);
    float _1187 = -_1143;
    float _1189 = _1165 * _1187;
    float _1191 = fma(_1165, _1175, _1169);
    float _1193 = fma(_1183, _1145, _1161);
    float _1195 = _1179 * _1143;
    float _1197 = fma(_1177, _1145, _1189);
    float _1199 = -_1173;
    float _1201 = fma(_1165, _1167, _1199);
    float _1203 = fma(_1185, _1149, _1193);
    float _1205 = fma(_1191, _1145, _1195);
    float _1207 = fma(_1171, _1149, _1197);
    float _1209 = _639 + _1203;
    float _1211 = fma(_1201, _1149, _1205);
    float _1213 = _559 + _1207;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1217 = _1209 + _1215;
    float _1219 = _621 + _1211;
    float _1221 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1223 = _1213 + _1221;
    float _1225 = _1217 * _1217;
    float _1227 = fma(_1223, _1223, _1225);
    float _1229 = sqrt(_1227);
    bool _1231 = _1229 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1233 = _1167;
    float _1235 = _1169;
    float _1237 = _1149;
    float _1239 = _1211;
    float _1241 = as_type<float>(_1065);
    if (!_1231)
    {
        _1233 = _1213;
    }
    float _1243 = _1233;
    float _1245 = _1243;
    if (!_1231)
    {
        _1235 = _1209;
    }
    float _1247 = _1235;
    float _1249 = _1247;
    if (!_1231)
    {
        _1237 = _1219;
    }
    float _1251 = _1237;
    bool _1253 = !_1231;
    float _1255 = _1251;
    if (!_1253)
    {
        float _1257 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1261 = _1229 + _1259;
        float _1263 = rsqrt(_1227);
        float _1265 = _1261 * _1257;
        float _1267 = _1219 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = _1265 * 0.15915493667125701904296875;
        float _1271 = _1269 * 6.283185482025146484375;
        float _1273 = cos(_1271);
        float _1275 = _1269 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        float _1279 = _1273 + (-1.0);
        float _1281 = fma(_1277, _1267, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1283 = _1279 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1285 = _1263 * _1281;
        float _1287 = fma(_1219, _1273, _1283);
        float _1289 = fma(_1223, _1285, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1291 = fma(_1217, _1285, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1255 = _1287;
        _1245 = _1289;
        _1249 = _1291;
    }
    float _1293 = _1255;
    float _1295 = _1245;
    float _1297 = _1249;
    float _1299 = -_811;
    float _1301 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1293);
    float _1303 = -_965;
    float _1305 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1295);
    float _1307 = -_989;
    float _1309 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1297);
    float _1311 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1313 = _1301 + _1311;
    float _1315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1317 = _1305 + _1315;
    float _1319 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1321 = _1309 + _1319;
    float _1323 = -_965;
    float _1325 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[18].w, _559);
    float _1327 = _1313 * _1313;
    float _1329 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1331 = -_989;
    float _1333 = fma(_1331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _639);
    float _1335 = fma(_1317, _1317, _1327);
    float _1337 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1329);
    float _1339 = fma(_1321, _1321, _1335);
    float _1341 = rsqrt(_1339);
    float _1343 = sqrt(_1339);
    float _1345 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1347 = _1317 * _1345;
    float _1349 = _1321 * _1345;
    float _1351 = _1347 * _1347;
    float _1353 = _1349 * _1349;
    float _1355 = _1351 + _1353;
    float _1357 = sqrt(_1355);
    bool _1359 = _1357 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1363 = _1357 + _1361;
    float _1365 = _1137;
    float _1367 = _1363;
    float _1369 = _1349;
    float _1371 = _1351;
    float _1373 = _1353;
    if (_1359)
    {
        float _1375 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1375;
    }
    float _1377 = _1365;
    if (!_1359)
    {
        _595 = _1347;
    }
    float _1379 = _595;
    float _1381 = _1379;
    if (_1359)
    {
        float _1383 = rsqrt(_1355);
        _1239 = _1383;
    }
    float _1385 = _1239;
    if (_1359)
    {
        float _1387 = _1363 * _1377;
        _1367 = _1387;
    }
    float _1389 = _1367;
    if (_1359)
    {
        float _1391 = _1389 * 0.15915493667125701904296875;
        _1241 = _1391;
    }
    float _1393 = _1241;
    float _1395 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1397 = _1093;
    if (_1359)
    {
        float _1399 = _1393 * 6.283185482025146484375;
        float _1401 = sin(_1399);
        _1397 = _1401;
    }
    float _1403 = _1397;
    float _1405 = precise::max(0.0, _1395);
    float _1407 = -_1345;
    float _1409 = -_1405;
    float _1411 = fma(_1313, _1407, _1409);
    float _1413 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1415 = _1405;
    float _1417 = _1411;
    if (_1359)
    {
        float _1419 = _1393 * 6.283185482025146484375;
        float _1421 = cos(_1419);
        _1413 = _1421;
    }
    float _1423 = _1413;
    float _1425 = fma(_1325, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1427 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1359)
    {
        float _1429 = _1411 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1415 = _1429;
    }
    float _1431 = _1415;
    float _1433 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1337);
    float _1435 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1427);
    float _1437 = _1403;
    float _1439 = _1431;
    if (_1359)
    {
        float _1441 = fma(_1403, _1431, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1437 = _1441;
    }
    float _1443 = _1437;
    float _1445 = floor(_1425);
    float _1447 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1435);
    float _1449 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1451 = _1443;
    if (_1359)
    {
        float _1453 = _1385 * _1443;
        _1451 = _1453;
    }
    float _1455 = _1451;
    float _1457 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1459 = _1447 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1359)
    {
        float _1461 = _1423 + (-1.0);
        _1439 = _1461;
    }
    float _1463 = _1439;
    float _1465 = _1463;
    if (_1359)
    {
        float _1467 = _1347 * _1455;
        _1381 = _1467;
    }
    float _1469 = _1381;
    if (_1359)
    {
        float _1471 = _1349 * _1455;
        _1369 = _1471;
    }
    float _1473 = _1369;
    if (_1359)
    {
        float _1475 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1465 = _1475;
    }
    float _1477 = _1465;
    if (_1359)
    {
        float _1479 = _1469 * _1469;
        _1371 = _1479;
    }
    float _1481 = _1371;
    if (_1359)
    {
        float _1483 = _1473 * _1473;
        _1373 = _1483;
    }
    float _1485 = _1373;
    float _1487 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1457);
    if (_1359)
    {
        float _1489 = fma(_1411, _1423, _1477);
        _1417 = _1489;
    }
    float _1491 = _1417;
    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1495 = fma(_1343, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1493);
    float _1497 = precise::clamp(_1495, 0.0, 1.0);
    float _1499 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1487);
    float _1501 = fma(_1491, _1491, _1481);
    float _1503 = -_1497;
    float _1505 = _1503 + 1.0;
    float _1507 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1509 = _1501 + _1485;
    float _1511 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1513 = _1301 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1515 = fma(_1333, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1517 = abs(_1505);
    float _1519 = log2(_1517);
    float _1521 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1523 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1513);
    float _1525 = -_1521;
    float _1527 = fma(_1525, _1511, 1.0);
    float _1529 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1523);
    float _1531 = rsqrt(_1509);
    float _1533 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1535 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1537 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1535);
    float _1539 = floor(_1515);
    float _1541 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1543 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1537);
    float _1545 = _1531 * _1469;
    float _1547 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1543);
    float _1549 = _1531 * _1491;
    float _1551 = _1531 * _1473;
    float _1553 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1555 = exp2(_1541);
    float _1557 = -_1553;
    float _1559 = fma(_1549, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1557);
    float _1561 = -_1539;
    float _1563 = _1515 + _1561;
    float _1565 = _1549 + 1.0;
    float _1567 = -_1551;
    float _1569 = fma(_1567, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1559);
    float _1571 = -_1445;
    float _1573 = _1425 + _1571;
    float _1575 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1577 = 1.0 / _1547;
    float _1579 = fma(_1569, -0.5, 0.5);
    float _1581 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1583 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1575);
    float _1585 = fma(_1569, 0.5, 0.5);
    float _1587 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1581);
    float _1589 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1583);
    float _1591 = log2(_1527);
    float _1593 = fma(_1585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1595 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1587);
    float _1597 = -_1549;
    float _1599 = fma(_1555, _1565, _1597);
    float _1601 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1589);
    float _1603 = fma(_1585, _1593, -0.212114393711090087890625);
    float _1605 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1595);
    float _1607 = fma(_1599, 0.5, 0.5);
    float _1609 = sqrt(_1579);
    float _1611 = _1601 * _1577;
    float _1613 = _1605 * _1577;
    float _1615 = fma(_1585, _1603, 1.570728778839111328125);
    float _1617 = _1591 * 0.693147182464599609375;
    float2 _4838 = float2(_1573, _1563);
    float _1619 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4838, float2(0.0), isnan(_4838)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4838, float2(0.0), isnan(_4838)), level(0.0)).x;
    float _1621 = _1617 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1623 = _1609 * 0.636619746685028076171875;
    float _1625 = fma(_1611, 0.5, 0.5);
    float _1627 = fma(_1613, -0.5, 0.5);
    float _1629 = -_1615;
    float _1631 = fma(_1623, _1629, 1.0);
    float3 _4865 = float3(_1625, _1627, _1621);
    float _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4865, float3(0.0), isnan(_4865)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4865, float3(0.0), isnan(_4865)), level(0.0)).x;
    float3 _4876 = float3(_1625, _1627, _1621);
    float4 _1636 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4876, float3(0.0), isnan(_4876)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4876, float3(0.0), isnan(_4876)), level(0.0)).xyzw;
    float _1638 = _1636.x;
    float _1640 = _1636.y;
    float _1642 = _1636.z;
    float _1644 = _1636.w;
    float2 _4892 = float2(_1631, _1607);
    float3 _1648 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4892, float2(0.0), isnan(_4892)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4892, float2(0.0), isnan(_4892)), level(0.0)).xyz;
    float _1650 = _1648.x;
    float _1652 = _1648.y;
    float _1654 = _1648.z;
    float _1656 = -_811;
    float _1658 = fma(_1656, (*spvDescriptorSet0.vp_c9)._m0[18].w, _621);
    bool _1660 = _165 > 0.5;
    float _1662 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1664 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1666 = _495 * (-0.15915493667125701904296875);
    float _1668 = -_489;
    float _1670 = _1668 + 1.0;
    float _1672 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1664);
    bool _1674 = _179 > 0.5;
    float _1676 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1678 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1672);
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1682 = _1680 != 0;
    float _1684 = -_443;
    float _1686 = _1684 + 1.0;
    int _1688 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1690 = _1688 != 0;
    float _1692 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1694 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1696 = _1666 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    float _1700 = -_477;
    int _1702 = _1674 ? as_type<int>(_1700) : as_type<int>(_477);
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1706 = fma(_1325, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1694);
    float _1708 = -_479;
    float _1710 = _1708 + 1.0;
    bool _1712 = !_1690;
    float _1714 = _1712 ? _477 : as_type<float>(_1702);
    float _1716 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1706);
    float _1718 = 1.0 / _1692;
    float _1720 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1722 = _1662 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1724 = _1716 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1726 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1728 = _1714 + (-0.5);
    int _1730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1732 = _1730 != 0;
    float _1734 = _1724 + _1692;
    float _1736 = _1666 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = -_1722;
    float _1742 = -_343;
    float _1744 = fma(_1740, _1728, _1742);
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1748 = -_487;
    float _1750 = _1748 + 1.0;
    float _1752 = _1519 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1734 * _1718;
    float _1758 = _1756 * 0.5;
    float _1760 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1764 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1766 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1764);
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1770 = _687 * _1738;
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1774 = 1.0 / _1766;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1780 = -_465;
    int _1782 = _1660 ? as_type<int>(_1780) : as_type<int>(_465);
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1786 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1788 = _1762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1790 = !_1682;
    float _1792 = _1790 ? _465 : as_type<float>(_1782);
    float _1794 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1796 = _1784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1798 = _1772 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1760 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1802 = _1792 + 0.5;
    bool _1804 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1806 = isnan(0.5);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1812 = _1808 || _1810;
    out.m_60.x = _1786;
    out.m_60.y = _1754;
    out.m_60.z = _1796;
    out.m_60.w = _1776;
    float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1816 = _1774 * _1814;
    float _1818 = fma(_1726, _1802, _309);
    float _1820 = _687 * _1698;
    float _1822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1824 = -_465;
    int _1826 = _625 ? as_type<int>(_1824) : as_type<int>(_465);
    out.m_62.x = _1788;
    out.m_62.y = _1720;
    out.m_62.z = _1798;
    out.m_62.w = _1778;
    float _1828 = -_1820;
    float _1830 = fma(_585, _1738, _1828);
    float _1832 = fma(_585, _1698, _1770);
    float _1834 = abs(_1816);
    float _1836 = log2(_1834);
    bool _1838 = !_1732;
    float _1840 = _1838 ? _465 : as_type<float>(_1826);
    float _1842 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1844 = _545 + (-0.5);
    float _1846 = _465 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1848 = _1840 + 0.5;
    float _1850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1852 = _1832 + (-0.5);
    float _1854 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1856 = _1830 + 0.5;
    float _1858 = fma(_1800, _1848, _493);
    float _1860 = -_1842;
    float _1862 = -_499;
    float _1864 = fma(_1860, _1852, _1862);
    float _1866 = -_1854;
    float _1868 = -_497;
    float _1870 = fma(_1866, _1844, _1868);
    float _1872 = -_469;
    float _1874 = _1872 + 1.0;
    float _1876 = _1836 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1878 = -_473;
    float _1880 = _1878 + 1.0;
    float _1882 = fma(_1714, _1874, _1744);
    float _1884 = -_1670;
    float _1886 = fma(_1840, _1884, _1858);
    float _1888 = -_1880;
    float _1890 = fma(_1792, _1888, _1818);
    float _1892 = exp2(_1876);
    float _1894 = fma(_545, _1686, _1870);
    float _1896 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1898 = fma(_1832, _1750, _1864);
    float _1900 = fma(_1896, _1856, _359);
    float _1902 = -_477;
    float _1904 = _1902 + 0.5;
    float _1906 = _477 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_64.x = _1890;
    out.m_64.y = _1882;
    out.m_64.z = _1886;
    out.m_64.w = _1894;
    float _1908 = -_1710;
    float _1910 = fma(_1830, _1908, _1900);
    float _1912 = exp2(_1752);
    float _1914 = -_1906;
    float _1916 = _1165 * _1914;
    float _1918 = in.m_66.x;
    float _1920 = _1864;
    float _1922 = _1547;
    float _1924 = _1605;
    if (_1812)
    {
        _1920 = 1.0;
    }
    float _1926 = _1920;
    float _1928 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1930 = precise::clamp(_1928, 0.0, 1.0);
    float _1932 = _1179 * _1906;
    float _1934 = _1159 * _1906;
    out.m_68.x = _1910;
    out.m_68.y = _1898;
    float _1936 = _1507 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_70.y = _1904;
    float _1938 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1936);
    float _1940 = fma(_1183, _1846, _1934);
    float _1942 = fma(_1177, _1846, _1916);
    float _1944 = fma(_1459, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1938);
    float _1946 = fma(_1930, -2.0, 3.0);
    float _1948 = _1930 * _1930;
    float _1950 = fma(_1449, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1944);
    float _1952 = _1948 * _1946;
    bool _1954 = _1816 <= 8000.0;
    bool _1956 = isnan(_1816);
    bool _1958 = _1954 || _1956;
    bool _1960 = isnan(8000.0);
    bool _1962 = _1958 || _1960;
    float _1964 = float(_1962);
    float _1966 = _1950 + _1547;
    float _1968 = -_1952;
    float _1970 = _1968 + 1.0;
    float _1972 = _1966 * 0.5;
    float _1974 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1952);
    float _1976 = fma(_1191, _1846, _1932);
    float _1978 = _1964 * _1974;
    float _1980 = _1926;
    float _1982 = _1950;
    float _1984 = _1972;
    if (!_1812)
    {
        float _1986 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1988 = _1986 * 0.15915493667125701904296875;
        float _1990 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1992 = _1988 * 6.283185482025146484375;
        float _1994 = cos(_1992);
        float _1996 = _1990 * 0.15915493667125701904296875;
        float _1998 = _1988 * 6.283185482025146484375;
        float _2000 = sin(_1998);
        float _2002 = 1.0 / _1994;
        float _2004 = _1996 * 6.283185482025146484375;
        float _2006 = cos(_2004);
        float _2008 = _2000 * _2002;
        float _2010 = _1996 * 6.283185482025146484375;
        float _2012 = sin(_2010);
        float _2014 = _2006 * _2008;
        float _2016 = 1.0 / _2014;
        float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2020 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2018;
        float _2022 = 1.0 / _2020;
        float _2024 = _2012 * _2016;
        float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2028 = fma(_1816, _2024, _2026);
        float _2030 = _2028 * _2022;
        float _2032 = precise::clamp(_2030, 0.0, 1.0);
        _1980 = _2032;
    }
    float _2034 = _1980;
    float _2036 = -_1912;
    float _2038 = _2036 + 1.0;
    float _2040 = _1201 + _1976;
    float _2042 = _1185 + _1940;
    float _2044 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2046 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2048 = -_1619;
    float _2050 = _2048 + 1.0;
    out.gl_Position.x = _1601;
    out.gl_Position.y = _1605;
    out.gl_Position.z = _1950;
    out.gl_Position.w = _1547;
    float _2052 = _2046 * _1633;
    float _2054 = _2050 * _2044;
    float _2056 = precise::clamp(_2054, 0.0, 1.0);
    float _2058 = -_2046;
    float _2060 = _2058 + 1.0;
    float _2062 = _1171 + _1942;
    float _2064 = _1644 * _2052;
    float _2066 = _1654 * _2052;
    float _2068 = _1644 * _2060;
    out.m_72.x = _1305;
    out.m_72.y = _1301;
    out.m_72.z = _1309;
    bool _2070 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2072 = isnan(_1343);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2078 = _2074 || _2076;
    float _2080 = fma(_1644, _2066, _1642);
    out.m_74.x = _2062;
    out.m_74.y = _2040;
    out.m_74.z = _2042;
    float _2082 = -_2056;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2086 = fma(_1650, _2064, _1638);
    float _2088 = fma(_1652, _2064, _1640);
    out.m_76.z = _1972;
    out.m_76.w = _1547;
    float _2090 = _2084 * _1918;
    out.m_78.x = _2086;
    out.m_78.y = _2088;
    out.m_78.z = _2080;
    out.m_78.w = _2068;
    float _2092 = _2090 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2094 = _2090;
    float _2096 = _2092;
    if (!_2078)
    {
        _1922 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2098 = _1922;
    float _2100 = _2098;
    float _2102 = _2098;
    if (!_2078)
    {
        _1982 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2104 = _1982;
    out.m_80.x = _2092;
    float _2106 = _2034 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2108 = _2104;
    float _2110 = _2104;
    if (!_2078)
    {
        _1984 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2112 = _1984;
    float _2114 = _2112;
    float _2116 = _2112;
    if (!_2078)
    {
        _1924 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2118 = _1924;
    float _2120 = _2118;
    float _2122 = _2118;
    if (!_2078)
    {
        _2094 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2124 = _2094;
    float _2126 = _2124;
    float _2128 = _2124;
    if (!_2078)
    {
        _2096 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2130 = _2096;
    bool _2132 = !_2078;
    float _2134 = _2130;
    float _2136 = _2130;
    if (!_2132)
    {
        bool _2138 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2140 = isnan(_1343);
        bool _2142 = _2138 || _2140;
        bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2146 = _2142 || _2144;
        if (!_2146)
        {
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2150 = _1343 + _2148;
            float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2154 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2152;
            float _2156 = 1.0 / _2154;
            float _2158 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2160 = _2158 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2164 = _2162 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2166 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2168 = _2166 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2170 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2172 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2176 = _2174 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2178 = _2150 * _2156;
            float _2180 = precise::clamp(_2178, 0.0, 1.0);
            float _2182 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2184 = _2182 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2186 = fma(_2180, _2160, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2188 = fma(_2180, _2184, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2190 = fma(_2180, _2164, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2192 = fma(_2180, _2168, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2194 = fma(_2180, _2172, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2196 = fma(_2180, _2176, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2102 = _2188;
            _2128 = _2194;
            _2116 = _2186;
            _2122 = _2192;
            _2110 = _2190;
            _2136 = _2196;
            _2198 = true;
        }
        else
        {
            bool _2200 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2202 = isnan(_1343);
            bool _2204 = _2200 || _2202;
            bool _2206 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2208 = _2204 || _2206;
            if (!_2208)
            {
                _2114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2210 = _2114;
            _2116 = _2210;
            if (!_2208)
            {
                _2100 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2212 = _2100;
            _2102 = _2212;
            if (!_2208)
            {
                _2108 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2214 = _2108;
            _2110 = _2214;
            if (!_2208)
            {
                _2120 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2216 = _2120;
            _2122 = _2216;
            if (!_2208)
            {
                _2126 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2218 = _2126;
            _2128 = _2218;
            if (!_2208)
            {
                _2134 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2220 = _2134;
            bool _2222 = !_2208;
            _2136 = _2220;
            if (!_2222)
            {
                bool _2224 = _1343 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2226 = isnan(_1343);
                bool _2228 = _2224 || _2226;
                bool _2230 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2232 = _2228 || _2230;
                if (!_2232)
                {
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2236 = _1343 + _2234;
                    float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2240 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2238;
                    float _2242 = 1.0 / _2240;
                    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2246 = _2244 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2248 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2250 = _2248 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2254 = _2252 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2258 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2260 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2262 = _2260 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2264 = _2236 * _2242;
                    float _2266 = precise::clamp(_2264, 0.0, 1.0);
                    float _2268 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2270 = _2268 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2272 = fma(_2266, _2246, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2274 = fma(_2266, _2270, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2276 = fma(_2266, _2250, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2278 = fma(_2266, _2254, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2280 = fma(_2266, _2258, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2282 = fma(_2266, _2262, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2102 = _2274;
                    _2128 = _2280;
                    _2116 = _2272;
                    _2122 = _2278;
                    _2110 = _2276;
                    _2136 = _2282;
                    _2198 = true;
                }
                else
                {
                    _2102 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2128 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2122 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2110 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2136 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2198 = false;
    float _2284 = _2102;
    float _2286 = _2128;
    float _2288 = _2116;
    float _2290 = _2122;
    float _2292 = _2110;
    float _2294 = _2136;
    float _2296 = fma(_2040, -0.5, 0.5);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = -_2284;
    float _2302 = _2300 + _2286;
    float _2304 = _2106 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2306 = -_2288;
    float _2308 = _2306 + _2290;
    float _2310 = fma(_2298, _2302, _2284);
    out.m_82.x = 0.0;
    float _2312 = -_2292;
    float _2314 = _2312 + _2294;
    float _2316 = fma(_2298, _2308, _2288);
    float _2318 = _2310 * 0.586610972881317138671875;
    out.m_49.x = _2304;
    bool _2320 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2322 = fma(_2298, _2314, _2292);
    float _2324 = fma(_2316, 0.298911988735198974609375, _2318);
    bool _2326 = _2034 > 0.0;
    bool _2328 = isnan(_2034);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(0.0);
    bool _2334 = _2330 || _2332;
    float _2336 = fma(_2322, 0.114477999508380889892578125, _2324);
    float _2338 = -_2336;
    float _2340 = _2316 + _2338;
    float _2342 = -_2336;
    float _2344 = _2310 + _2342;
    float _2346 = -_2336;
    float _2348 = _2322 + _2346;
    float _2350 = fma(_2340, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2336);
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2336);
    float _2354 = fma(_2348, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2336);
    bool _2356 = !_2320;
    if (!_2356)
    {
        float _2358 = -_1301;
        float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2362 = -_1305;
        float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2366 = -_1309;
        float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2370 = _2360 * _2360;
        float _2372 = fma(_2364, _2364, _2370);
        float _2374 = fma(_2368, _2368, _2372);
        float _2376 = sqrt(_2374);
        float _2378 = rsqrt(_2374);
        float _2380 = -_2376;
        float _2382 = _2380 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2384 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2386 = precise::clamp(_2384, 0.0, 1.0);
        float _2388 = _2364 * _2378;
        float _2390 = _2360 * _2378;
        float _2392 = abs(_2386);
        float _2394 = log2(_2392);
        float _2396 = _2368 * _2378;
        float _2398 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2400 = _2040 * _2390;
        float _2402 = -_2390;
        float _2404 = -_2398;
        float _2406 = fma(_2402, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2404);
        float _2408 = fma(_2062, _2388, _2400);
        float _2410 = -_2396;
        float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2406);
        float _2414 = fma(_2042, _2396, _2408);
        float _2416 = precise::clamp(_2414, 0.0, 1.0);
        float _2418 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2420 = _2412 + _2418;
        float _2422 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2424 = _2420 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2426 = precise::clamp(_2424, 0.0, 1.0);
        float _2428 = exp2(_2422);
        float _2430 = _2428 * _2426;
        float _2432 = _2416 * _2430;
        float _2434 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2436 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2438 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2434;
        out.m_82.y = _2436;
        out.m_82.z = _2438;
    }
    out.m_84.x = _2350;
    out.m_84.y = _2352;
    out.m_84.z = _2354;
    if (_2334)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2440 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2440;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

