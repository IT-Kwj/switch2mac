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
    float4 m_64 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
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
    float4 m_68 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2164 = false;
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
        float _2464 = as_type<float>(_119);
        out.gl_Position.z = _2464;
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
        float _2534 = as_type<float>(_157);
        out.gl_Position.z = _2534;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _163 = log2(_161);
    float _165 = in.m_56.x;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _169 = _167 != 0;
    float _171 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = in.m_56.z;
    float _175 = in.m_56.w;
    float _177 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _179 = in.m_56.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _185 = 0.0;
    float _187 = _181;
    if (!_169)
    {
        float _189 = in.m_56.z;
        _185 = _189;
    }
    float _191 = _185;
    float _193 = _163 * _137;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _201 = as_type<int>(_159) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_159) & 2;
    bool _207 = _205 != 0;
    int _209 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _211 = _209 != 0;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _215 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _217 = _165 * 2.0;
    float _219 = exp2(_193);
    float _221 = _173 * 2.0;
    float _223 = -_181;
    float _225 = fma(_215, 2.0, _223);
    float _227 = _215;
    if (_169)
    {
        _187 = _165;
    }
    float _229 = _187;
    float _231 = _171 * _183;
    float _233 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _235 = _229;
    float _237 = _191;
    if (!_169)
    {
        _227 = _179;
    }
    float _239 = _227;
    float _241 = -_137;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[76].x, _225);
    float _245 = floor(_221);
    float _247 = fma(_233, -2.0, _177);
    float _249 = _239;
    if (!_169)
    {
        _235 = _173;
    }
    float _251 = _235;
    float _253 = _179 * 2.0;
    float _255 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _247);
    if (_169)
    {
        _249 = _165;
    }
    float _257 = _249;
    float _259 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _231);
    float _261 = floor(_217);
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _265 = _251 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _269 = _257 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _271 = -_263;
    float _273 = fma(_265, 2.0, _271);
    float _275 = -_267;
    float _277 = fma(_269, 2.0, _275);
    float _279 = _267;
    float _281 = _257;
    float _283 = _269;
    if (!_169)
    {
        _279 = _191;
    }
    float _285 = _279;
    float _287 = -_137;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[86].x, _273);
    float _291 = _285;
    if (_169)
    {
        _291 = _179;
    }
    float _293 = _291;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _297 = _245 > 0.0;
    float _299 = -_137;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[81].x, _277);
    bool _303 = _245 >= 0.0;
    bool _305 = isnan(_245);
    bool _307 = _303 || _305;
    bool _309 = isnan(0.0);
    bool _311 = _307 || _309;
    float _313 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[83].z, _195);
    float _315 = _293 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_169)
    {
        _281 = _179;
    }
    float _317 = _281;
    float _319 = floor(_253);
    float _321 = fma(_315, -2.0, _295);
    float _323 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _313);
    float _325 = _317;
    if (!_169)
    {
        _325 = _165;
    }
    float _327 = _325;
    float _329 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _321);
    if (_169)
    {
        _283 = _173;
    }
    float _331 = _283;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _335 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _337 = isnan(1.0);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _343 = _339 || _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _347 = 1.0 + _345;
    float _349 = _331;
    if (_169)
    {
        _237 = _179;
    }
    float _351 = _237;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_169)
    {
        _349 = _179;
    }
    float _355 = _349;
    float _357 = 1.0 / _347;
    float _359 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[83].w, _197);
    float _361 = fma(_353, -2.0, _333);
    float _363 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[89].z, _213);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _367 = -_219;
    float _369 = _367 + 1.0;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _373 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _375 = isnan(0.0);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _381 = _377 || _379;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _385 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _365);
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _389 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _371);
    float _391 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _383);
    float _393 = _381 ? _369 : 0.0;
    float _395 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _387);
    float _397 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _385);
    float _399 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _401 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _389);
    float _403 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _391);
    float _405 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _395);
    float _407 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _359);
    float _409 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[89].x, _363);
    float _411 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _361);
    if (_343)
    {
        float _413 = _393 * _357;
        _139 = _413;
    }
    float _415 = _139;
    float _417 = in.m_46.x;
    float _419 = in.m_46.y;
    float _421 = in.m_46.z;
    float _423 = _399 * _199;
    bool _425 = !_203;
    float _427 = _425 ? (-0.5) : 0.5;
    float _429 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _423);
    bool _431 = !_207;
    float _433 = _431 ? (-0.5) : 0.5;
    bool _435 = _173 > 0.5;
    float _437 = floor(_429);
    bool _439 = _179 > 0.5;
    bool _441 = !_211;
    int _443 = _441 ? 0 : 1;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _455 = _453 != 0;
    float _457 = -_427;
    int _459 = _439 ? as_type<int>(_457) : as_type<int>(_427);
    float _461 = -_433;
    int _463 = _435 ? as_type<int>(_461) : as_type<int>(_433);
    int _465 = _311 ? 0 : 1;
    float _467 = _419 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _469 = !_451;
    float _471 = _469 ? _427 : as_type<float>(_459);
    float _473 = -_437;
    float _475 = _429 + _473;
    bool _477 = !_455;
    float _479 = _477 ? _433 : as_type<float>(_463);
    float _481 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].x, _467);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _493 = _491 != 0;
    bool _495 = _319 > 0.0;
    float _497 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _481);
    int _499 = ~_465;
    int _501 = _499 + 1;
    int _503 = _501 + 1;
    int _505 = _503;
    if (!_297)
    {
        int _507 = ~_465;
        int _509 = _507 + 1;
        _505 = _509;
    }
    int _511 = _505;
    float _513 = _497 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _515 = _319 >= 0.0;
    bool _517 = isnan(_319);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    float _525 = _419 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _527 = _419 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _529 = !_485;
    int _531 = _529 ? 0 : 1;
    float _533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _535 = _513 + _533;
    int _537 = _523 ? 0 : 1;
    float _539 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
    bool _541 = !_489;
    int _543 = _541 ? 0 : 1;
    float _545 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].x, _525);
    bool _547 = _175 > 0.5;
    float _549 = _179 + _173;
    bool _551 = _261 >= 0.0;
    bool _553 = isnan(_261);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = _165 + _179;
    int _563 = ~_537;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
    int _571 = _567;
    if (!_495)
    {
        int _573 = ~_537;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _165 + _173;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _587 = _585 != 0;
    float _589 = _561 + (-1.0);
    int _591 = _559 ? 0 : 1;
    float _593 = _579 + (-1.0);
    bool _595 = _261 > 0.0;
    float _597 = _549 + (-1.0);
    float _599 = _429 * 6.283185482025146484375;
    float _601 = _569 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _603 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _605 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _607 = _599 * 0.15915493667125701904296875;
    float _609 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _539);
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _613 = _601 + _611;
    int _615 = ~_591;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    float _621 = _607 * 6.283185482025146484375;
    float _623 = cos(_621);
    int _625 = _619;
    bool _627 = _583;
    if (!_595)
    {
        int _629 = ~_591;
        int _631 = _629 + 1;
        _625 = _631;
    }
    int _633 = _625;
    float _635 = _609 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _637 = _613 * _613;
    float _639 = -_475;
    float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _643 = _475 < 0.5;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _649 = _635 + _647;
    float _651 = fma(_535, _535, _637);
    bool _653 = !_493;
    int _655 = _653 ? 0 : 1;
    float _657 = -_635;
    float _659 = _657 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _661 = abs(_531);
    float _663 = fma(_649, _649, _651);
    float _665 = -_645;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _669 = abs(_655);
    float _671 = fma(_623, 0.5, 0.5);
    float _673 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _675 = rsqrt(_663);
    float _677 = float(_511);
    float _679 = float(_661);
    float _681 = -_671;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _685 = abs(_543);
    float _687 = _679 * _677;
    float _689 = floor(_259);
    float _691 = float(_577);
    float _693 = _535 * 0.0625;
    float _695 = float(_669);
    float _697 = _687 * (-2.0);
    float _699 = abs(_535);
    float _701 = abs(_659);
    float _703 = precise::max(_699, _701);
    float _705 = _613 * _675;
    float _707 = _695 * _691;
    bool _709 = _703 >= 16.0;
    float _711 = _649 * _675;
    float _713 = float(_633);
    float _715 = _707 * (-2.0);
    float _717 = _709 ? _693 : _535;
    float _719 = _535 * _675;
    float _721 = float(_685);
    float _723 = -_705;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _727 = fma(_673, _697, _673);
    float _729 = fma(_605, _715, _605);
    float _731 = _165 + (-0.5);
    float _733 = -_689;
    float _735 = _259 + _733;
    float _737 = _259 * 6.283185482025146484375;
    float _739 = -_719;
    float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _535);
    float _743 = _725 * _725;
    float _745 = _721 * _713;
    float _747 = _731 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _749 = _737 * 0.15915493667125701904296875;
    float _751 = fma(_741, _741, _743);
    float _753 = _745 * (-2.0);
    float _755 = -_433;
    int _757 = _547 ? as_type<int>(_755) : as_type<int>(_433);
    float _759 = _659;
    float _761 = _719;
    if (_709)
    {
        float _763 = _659 * 0.0625;
        _759 = _763;
    }
    float _765 = _759;
    float _767 = fma(_727, _415, _747);
    float _769 = abs(_717);
    bool _771 = _769 != 0.0;
    bool _773 = isnan(_769);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = _173 + (-0.5);
    float _783 = _749 * 6.283185482025146484375;
    float _785 = cos(_783);
    float _787 = fma(_603, _753, _603);
    float _789 = abs(_765);
    bool _791 = _789 == 0.0;
    bool _793 = !_779;
    bool _795 = _791 && _793;
    float _797 = -_711;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    float _801 = in.m_58.x;
    float _803 = in.m_58.y;
    float _805 = _781 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _807 = _179 + (-0.5);
    bool _809 = !_447;
    float _811 = _809 ? _433 : as_type<float>(_757);
    float _813 = fma(_799, _799, _751);
    bool _815 = _735 < 0.5;
    float _817 = float(_815);
    float _819 = _767 * 0.15915493667125701904296875;
    float _821 = abs(_765);
    bool _823 = _821 == 0.0;
    float _825 = -_735;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _829 = _807 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _831 = -_817;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _835 = sqrt(_813);
    bool _837 = !_583;
    int _839 = _837 ? 0 : 1;
    float _841 = fma(_785, 0.5, 0.5);
    int _843 = as_type<int>(_787);
    int _845 = _839;
    int _847 = _823 ? (-1) : 0;
    if (_795)
    {
        bool _849 = as_type<int>(_765) >= 0;
        _627 = _849;
    }
    bool _851 = _627;
    float _853 = fma(_787, _415, _829);
    float _855 = fma(_729, _415, _805);
    int _857 = abs(_839);
    float _859 = -_841;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _863 = _819 * 6.283185482025146484375;
    float _865 = sin(_863);
    if (_795)
    {
        int _867 = _851 ? 0 : 1078530011;
        _843 = _867;
    }
    int _869 = _843;
    int _871 = abs(_443);
    bool _873 = !_587;
    int _875 = _873 ? 0 : 1;
    if (_795)
    {
        int _877 = int(0x80000000) & as_type<int>(_717);
        int _879 = _869 | _877;
        _845 = _879;
    }
    int _881 = _845;
    bool _883 = !_779;
    bool _885 = _883 && _823;
    int _887 = _881;
    float _889 = as_type<float>(_881);
    if (!_885)
    {
        float _891 = abs(_717);
        bool _893 = _891 != as_type<float>(0x7f800000u /* inf */);
        bool _895 = isnan(_891);
        bool _897 = _893 || _895;
        bool _899 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _901 = _897 || _899;
        float _903 = abs(_765);
        bool _905 = _903 == as_type<float>(0x7f800000u /* inf */);
        float _907 = abs(_765);
        bool _909 = _907 == as_type<float>(0x7f800000u /* inf */);
        bool _911 = !_901;
        bool _913 = _909 && _911;
        if (_913)
        {
            bool _915 = as_type<int>(_765) >= 0;
            _847 = _915 ? (-1) : 0;
        }
        int _917 = _847;
        if (_913)
        {
            _887 = 1075235812;
        }
        int _919 = _887;
        int _921 = _919;
        if (_913)
        {
            int _923 = ~_917;
            int _925 = (_923 != 0) ? _919 : 1061752795;
            _921 = _925;
        }
        int _927 = _921;
        float _929 = as_type<float>(_927);
        if (_913)
        {
            int _931 = int(0x80000000) & as_type<int>(_717);
            int _933 = _927 | _931;
            _929 = as_type<float>(_933);
        }
        float _935 = _929;
        bool _937 = !_901;
        bool _939 = _937 && _905;
        _889 = _935;
        if (!_939)
        {
            float _941 = abs(_765);
            float _943 = abs(_717);
            float _945 = precise::max(_941, _943);
            float _947 = abs(_765);
            float _949 = abs(_717);
            float _951 = precise::min(_947, _949);
            float _953 = 1.0 / _945;
            float _955 = abs(_717);
            float _957 = abs(_765);
            bool _959 = _955 > _957;
            bool _961 = as_type<int>(_765) >= 0;
            float _963 = _951 * _953;
            float _965 = _963 * _963;
            float _967 = _965 + 11.33538818359375;
            float _969 = fma(_965, _967, 28.84246826171875);
            float _971 = fma(_965, _969, 19.6966705322265625);
            float _973 = fma(_965, -0.82336294651031494140625, -5.674867153167724609375);
            float _975 = fma(_965, _973, -6.565555095672607421875);
            float _977 = 1.0 / _971;
            float _979 = _965 * _975;
            float _981 = abs(_765);
            float _983 = abs(_717);
            float _985 = _981 + _983;
            int _987 = as_type<int>(_717) & int(0x80000000);
            float _989 = _963 * _979;
            bool _991 = _985 > as_type<float>(0x7f800000u /* inf */);
            bool _993 = isnan(_985);
            bool _995 = _991 || _993;
            bool _997 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _999 = _995 || _997;
            float _1001 = fma(_989, _977, _963);
            float _1003 = _1001;
            _889 = _985;
            if (_959)
            {
                float _1005 = -_1001;
                float _1007 = _1005 + 1.57079637050628662109375;
                _1003 = _1007;
            }
            float _1009 = _1003;
            int _1011 = as_type<int>(_1009);
            if (!_961)
            {
                float _1013 = -_1009;
                float _1015 = _1013 + 3.1415927410125732421875;
                _1011 = as_type<int>(_1015);
            }
            int _1017 = _1011;
            if (!_999)
            {
                int _1019 = _987 | _1017;
                _889 = as_type<float>(_1019);
            }
        }
    }
    float _1021 = _889;
    float _1023 = -_1021;
    float _1025 = _853 + _1023;
    float _1027 = _855 * 0.15915493667125701904296875;
    float _1029 = float(_857);
    float _1031 = _1025 * 0.15915493667125701904296875;
    int _1033 = abs(_875);
    float _1035 = _819 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = float(_871);
    float _1041 = abs(_641);
    float _1043 = _1029 * _1041;
    float _1045 = abs(_827);
    float _1047 = _1029 * _1045;
    float _1049 = _675 * _835;
    float _1051 = fma(_1039, _683, _1043);
    float _1053 = float(_1033);
    float _1055 = fma(_1039, _861, _1047);
    float _1057 = _1027 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1063 = _1061 * 0.5;
    float _1065 = abs(_667);
    float _1067 = fma(_1053, _1065, _1051);
    float _1069 = abs(_833);
    float _1071 = fma(_1053, _1069, _1055);
    float _1073 = _801 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1075 = _803 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1077 = _1031 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1067 * _1073;
    float _1083 = _1071 * _1075;
    float _1085 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _433);
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _427);
    float _1089 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1093 = _1031 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = _1049 * _1089;
    float _1099 = _1049 * _1091;
    float _1101 = _865 * _1059;
    float _1103 = _1097 * _1087;
    float _1105 = _1099 * _1085;
    float _1107 = _1027 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = _1037 * _1079;
    float _1113 = _865 * _1079;
    float _1115 = _1101 * _1105;
    float _1117 = _1079 * _1059;
    float _1119 = _865 * _1095;
    float _1121 = _1037 * _1095;
    float _1123 = _1095 * _1059;
    float _1125 = _1037 * _1059;
    float _1127 = -_1111;
    float _1129 = fma(_1109, _1119, _1127);
    float _1131 = -_1105;
    float _1133 = _1109 * _1131;
    float _1135 = fma(_1109, _1113, _1121);
    float _1137 = fma(_1109, _1121, _1113);
    float _1139 = fma(_1129, _1103, _1115);
    float _1141 = fma(_1123, _1103, _1133);
    float _1143 = -_1119;
    float _1145 = fma(_1109, _1111, _1143);
    float _1147 = fma(_1135, _1063, _1139);
    float _1149 = fma(_1117, _1063, _1141);
    float _1151 = _635 + _1147;
    float _1153 = _513 + _1149;
    float _1155 = _1125 * _1105;
    float _1157 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1159 = _1151 + _1157;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1163 = _1153 + _1161;
    float _1165 = fma(_1137, _1103, _1155);
    float _1167 = _1159 * _1159;
    float _1169 = fma(_1145, _1063, _1165);
    float _1171 = fma(_1163, _1163, _1167);
    float _1173 = _601 + _1169;
    float _1175 = sqrt(_1171);
    bool _1177 = _1175 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1179 = _1063;
    float _1181 = _1165;
    float _1183 = _1105;
    float _1185 = _1175;
    float _1187 = _1151;
    float _1189 = _1171;
    if (!_1177)
    {
        _1179 = _1153;
    }
    float _1191 = _1179;
    float _1193 = _1191;
    if (!_1177)
    {
        _1181 = _1151;
    }
    float _1195 = _1181;
    float _1197 = _1195;
    if (!_1177)
    {
        _1183 = _1173;
    }
    float _1199 = _1183;
    bool _1201 = !_1177;
    float _1203 = _1199;
    if (!_1201)
    {
        float _1205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1209 = _1175 + _1207;
        float _1211 = rsqrt(_1171);
        float _1213 = _1209 * _1205;
        float _1215 = _1173 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = _1213 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = fma(_1221, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1211 * _1227;
        float _1231 = _1225 + (-1.0);
        float _1233 = fma(_1163, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1159, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1237 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = fma(_1173, _1225, _1237);
        _1203 = _1239;
        _1193 = _1233;
        _1197 = _1235;
        _1185 = _1217;
    }
    float _1241 = _1203;
    float _1243 = _1193;
    float _1245 = _1197;
    float _1247 = _1185;
    float _1249 = -_705;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1241);
    float _1253 = -_719;
    float _1255 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1257 = -_711;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1261 = -_719;
    float _1263 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[18].w, _513);
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1267 = _1251 + _1265;
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1271 = _1255 + _1269;
    float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1275 = _1259 + _1273;
    float _1277 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1279 = _1267 * _1267;
    float _1281 = -_711;
    float _1283 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _1285 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1277);
    float _1287 = fma(_1271, _1271, _1279);
    float _1289 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1291 = fma(_1275, _1275, _1287);
    float _1293 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1295 = rsqrt(_1291);
    float _1297 = sqrt(_1291);
    float _1299 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1301 = _1271 * _1299;
    float _1303 = _1275 * _1299;
    float _1305 = _1301 * _1301;
    float _1307 = _1303 * _1303;
    float _1309 = _1305 + _1307;
    float _1311 = sqrt(_1309);
    bool _1313 = _1311 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1317 = _1311 + _1315;
    float _1319 = _1247;
    float _1321 = _1317;
    float _1323 = _1301;
    float _1325 = _1305;
    if (_1313)
    {
        float _1327 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1319 = _1327;
    }
    float _1329 = _1319;
    if (_1313)
    {
        float _1331 = rsqrt(_1309);
        _1187 = _1331;
    }
    float _1333 = _1187;
    float _1335 = _1333;
    if (_1313)
    {
        float _1337 = _1317 * _1329;
        _1321 = _1337;
    }
    float _1339 = _1321;
    float _1341 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1313)
    {
        float _1343 = _1339 * 0.15915493667125701904296875;
        _1189 = _1343;
    }
    float _1345 = _1189;
    float _1347 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1349 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1341);
    float _1351 = _1153;
    if (_1313)
    {
        float _1353 = _1345 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        _1351 = _1355;
    }
    float _1357 = _1351;
    float _1359 = precise::max(0.0, _1347);
    float _1361 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1349);
    float _1363 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1365 = _1359;
    if (_1313)
    {
        float _1367 = _1345 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        _1363 = _1369;
    }
    float _1371 = _1363;
    float _1373 = -_1299;
    float _1375 = -_1359;
    float _1377 = fma(_1267, _1373, _1375);
    float _1379 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1313)
    {
        float _1381 = _1377 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1381;
    }
    float _1383 = _1365;
    float _1385 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1387 = _1357;
    float _1389 = _1383;
    if (_1313)
    {
        float _1391 = fma(_1357, _1383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = _1393;
    if (!_1313)
    {
        _1389 = _1377;
    }
    float _1397 = _1389;
    float _1399 = _1397;
    if (_1313)
    {
        float _1401 = _1333 * _1393;
        _1395 = _1401;
    }
    float _1403 = _1395;
    float _1405 = floor(_1385);
    float _1407 = _1371;
    if (_1313)
    {
        float _1409 = _1371 + (-1.0);
        _761 = _1409;
    }
    float _1411 = _761;
    float _1413 = _1411;
    if (_1313)
    {
        float _1415 = _1301 * _1403;
        _1323 = _1415;
    }
    float _1417 = _1323;
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1421 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1419);
    float _1423 = precise::clamp(_1421, 0.0, 1.0);
    if (_1313)
    {
        float _1425 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1425;
    }
    float _1427 = _1335;
    if (!_1313)
    {
        _1413 = _1303;
    }
    float _1429 = _1413;
    float _1431 = _1429;
    if (_1313)
    {
        float _1433 = _1303 * _1403;
        _1431 = _1433;
    }
    float _1435 = _1431;
    if (_1313)
    {
        float _1437 = _1417 * _1417;
        _1325 = _1437;
    }
    float _1439 = _1325;
    if (_1313)
    {
        float _1441 = fma(_1377, _1371, _1427);
        _1399 = _1441;
    }
    float _1443 = _1399;
    if (!_1313)
    {
        _1407 = _1307;
    }
    float _1445 = _1407;
    float _1447 = _1445;
    if (_1313)
    {
        float _1449 = _1435 * _1435;
        _1447 = _1449;
    }
    float _1451 = _1447;
    float _1453 = fma(_1443, _1443, _1439);
    float _1455 = -_1423;
    float _1457 = _1455 + 1.0;
    float _1459 = _1453 + _1451;
    float _1461 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1463 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1465 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = abs(_1457);
    float _1469 = log2(_1467);
    float _1471 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1473 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1463);
    float _1475 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1477 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1473);
    float _1479 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1475);
    float _1481 = rsqrt(_1459);
    float _1483 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1485 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1487 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1491 = -_1487;
    float _1493 = fma(_1491, _1461, 1.0);
    float _1495 = floor(_1471);
    float _1497 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1489);
    float _1499 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1497);
    float _1501 = _1481 * _1417;
    float _1503 = _1481 * _1443;
    float _1505 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1499);
    float _1507 = _1481 * _1435;
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1511 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1513 = 1.0 / _1505;
    float _1515 = -_1509;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1515);
    float _1519 = -_1405;
    float _1521 = _1385 + _1519;
    float _1523 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1525 = -_1495;
    float _1527 = _1471 + _1525;
    float _1529 = -_1507;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1517);
    float _1533 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1535 = exp2(_1511);
    float _1537 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1523);
    float _1539 = fma(_1531, -0.5, 0.5);
    float _1541 = fma(_1531, 0.5, 0.5);
    float _1543 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1533);
    float _1545 = _1503 + 1.0;
    float _1547 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1537);
    float _1549 = fma(_1541, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1551 = log2(_1493);
    float _1553 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1543);
    float _1555 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1547);
    float _1557 = fma(_1541, _1549, -0.212114393711090087890625);
    float _1559 = _1555 * _1513;
    float _1561 = fma(_1541, _1557, 1.570728778839111328125);
    float _1563 = sqrt(_1539);
    float _1565 = -_1503;
    float _1567 = fma(_1535, _1545, _1565);
    float _1569 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1553);
    float _1571 = fma(_1567, 0.5, 0.5);
    float _1573 = _1569 * _1513;
    float _1575 = _1551 * 0.693147182464599609375;
    float _1577 = fma(_1573, -0.5, 0.5);
    float _1579 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1581 = _1563 * 0.636619746685028076171875;
    float _1583 = fma(_1559, 0.5, 0.5);
    float _1585 = -_1561;
    float _1587 = fma(_1581, _1585, 1.0);
    float2 _4768 = float2(_1521, _1527);
    float _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4768, float2(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4768, float2(0.0), isnan(_4768)), level(0.0)).x;
    float3 _4779 = float3(_1583, _1577, _1579);
    float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4779, float3(0.0), isnan(_4779)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4779, float3(0.0), isnan(_4779)), level(0.0)).x;
    float3 _4790 = float3(_1583, _1577, _1579);
    float4 _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4790, float3(0.0), isnan(_4790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4790, float3(0.0), isnan(_4790)), level(0.0)).xyzw;
    float _1596 = _1594.x;
    float _1598 = _1594.y;
    float _1600 = _1594.z;
    float _1602 = _1594.w;
    float2 _4806 = float2(_1587, _1571);
    float3 _1606 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4806, float2(0.0), isnan(_4806)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4806, float2(0.0), isnan(_4806)), level(0.0)).xyz;
    float _1608 = _1606.x;
    float _1610 = _1606.y;
    float _1612 = _1606.z;
    float _1614 = -_705;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1620 = _165 > 0.5;
    float _1622 = -_401;
    float _1624 = _1622 + 1.0;
    float _1626 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1628 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1632 = _1630 != 0;
    float _1634 = -_407;
    float _1636 = _1634 + 1.0;
    float _1638 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1626);
    float _1640 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1628);
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1644 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1638);
    float _1646 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1640);
    float _1648 = -_427;
    int _1650 = _1620 ? as_type<int>(_1648) : as_type<int>(_427);
    float _1652 = -_323;
    float _1654 = _1652 + 1.0;
    float _1656 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1658 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1660 = !_1632;
    float _1662 = _1660 ? _427 : as_type<float>(_1650);
    float _1664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1668 = _1666 != 0;
    float _1670 = _1658 + _1656;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1674 = _1672 != 0;
    float _1676 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1678 = _1662 + 0.5;
    float _1680 = 1.0 / _1656;
    float _1682 = fma(_1676, _1678, _243);
    bool _1684 = _179 > 0.5;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1688 = -_403;
    float _1690 = _1688 + 1.0;
    float _1692 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1694 = -_397;
    float _1696 = _1694 + 1.0;
    float _1698 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1700 = _409 * (-0.15915493667125701904296875);
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1708 = -_1690;
    float _1710 = fma(_1662, _1708, _1682);
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1670 * _1680;
    float _1716 = _1714 * 0.5;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1720 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1718);
    float _1722 = _1700 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1728 = -_433;
    int _1730 = _1684 ? as_type<int>(_1728) : as_type<int>(_433);
    float _1732 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1734 = !_1668;
    float _1736 = _1734 ? _433 : as_type<float>(_1730);
    float _1738 = 1.0 / _1720;
    out.m_60.x = _1698;
    out.m_60.y = _1732;
    out.m_60.z = _1712;
    out.m_60.w = _1704;
    float _1740 = _1700 * 6.283185482025146484375;
    float _1742 = cos(_1740);
    float _1744 = _479 * _1724;
    float _1746 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1748 = -_427;
    int _1750 = _435 ? as_type<int>(_1748) : as_type<int>(_427);
    float _1752 = _1736 + (-0.5);
    float _1754 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1758 = !_1674;
    float _1760 = _1758 ? _427 : as_type<float>(_1750);
    float _1762 = -_1754;
    float _1764 = -_255;
    float _1766 = fma(_1762, _1752, _1764);
    float _1768 = _479 * _1742;
    float _1770 = -_1744;
    float _1772 = fma(_471, _1742, _1770);
    float _1774 = _1760 + 0.5;
    float _1776 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1780 = _1772 + 0.5;
    float _1782 = fma(_1746, _1774, _301);
    float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1786 = _1738 * _1784;
    float _1788 = fma(_471, _1724, _1768);
    float _1790 = fma(_1776, _1780, _289);
    float _1792 = _811 + (-0.5);
    float _1794 = fma(_1736, _1624, _1766);
    float _1796 = abs(_1786);
    float _1798 = log2(_1796);
    float _1800 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1802 = _1788 + (-0.5);
    float _1804 = -_1654;
    float _1806 = fma(_1760, _1804, _1782);
    float _1808 = -_1800;
    float _1810 = -_329;
    float _1812 = fma(_1808, _1792, _1810);
    float _1814 = -_433;
    float _1816 = _1814 + 0.5;
    float _1818 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1824 = -_1818;
    float _1826 = -_411;
    float _1828 = fma(_1824, _1802, _1826);
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1832 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1834 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_62.y = _1816;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1840 = _433 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1842 = exp2(_1832);
    float _1844 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = -_405;
    float _1848 = _1846 + 1.0;
    float _1850 = fma(_811, _1636, _1812);
    bool _1852 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1854 = isnan(0.5);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1860 = _1856 || _1858;
    float _1862 = -_1696;
    float _1864 = fma(_1772, _1862, _1790);
    float _1866 = fma(_1788, _1848, _1828);
    out.m_64.x = _1830;
    out.m_64.y = _1834;
    out.m_64.z = _1844;
    out.m_64.w = _1838;
    float _1868 = exp2(_1692);
    float _1870 = -_1840;
    float _1872 = _1109 * _1870;
    float _1874 = _1125 * _1840;
    out.m_66.x = _1710;
    out.m_66.y = _1794;
    out.m_66.z = _1806;
    out.m_66.w = _1850;
    float _1876 = _427 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1878 = _1101 * _1840;
    float _1880 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1882 = precise::clamp(_1880, 0.0, 1.0);
    float _1884 = in.m_68.x;
    out.m_70.x = _1864;
    out.m_70.y = _1866;
    float _1886 = fma(_1882, -2.0, 3.0);
    float _1888 = _1882 * _1882;
    float _1890 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1892 = _1786 <= 8000.0;
    bool _1894 = isnan(_1786);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(8000.0);
    bool _1900 = _1896 || _1898;
    float _1902 = float(_1900);
    float _1904 = _1505 * 0.5;
    float _1906 = _1888 * _1886;
    float _1908 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1890);
    float _1910 = fma(_1123, _1876, _1872);
    float _1912 = fma(_1137, _1876, _1874);
    float _1914 = -_1906;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1908);
    float _1920 = fma(_1129, _1876, _1878);
    float _1922 = fma(_1569, -0.5, _1904);
    float _1924 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1906);
    float _1926 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1918);
    float _1928 = _1878;
    float _1930 = _1505;
    float _1932 = _1922;
    if (_1860)
    {
        _1928 = 1.0;
    }
    float _1934 = _1928;
    float _1936 = _1902 * _1924;
    float _1938 = _1926 + _1505;
    float _1940 = _1555 + _1505;
    float _1942 = _1938 * 0.5;
    float _1944 = _1940 * 0.5;
    float _1946 = _1934;
    float _1948 = _1944;
    if (!_1860)
    {
        float _1950 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1952 = _1950 * 0.15915493667125701904296875;
        float _1954 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1956 = _1952 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = _1954 * 0.15915493667125701904296875;
        float _1962 = _1952 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = 1.0 / _1958;
        float _1968 = _1960 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        float _1972 = _1964 * _1966;
        float _1974 = _1960 * 6.283185482025146484375;
        float _1976 = sin(_1974);
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1978;
        float _1982 = _1970 * _1972;
        float _1984 = 1.0 / _1980;
        float _1986 = 1.0 / _1982;
        float _1988 = _1976 * _1986;
        float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1992 = fma(_1786, _1988, _1990);
        float _1994 = _1992 * _1984;
        float _1996 = precise::clamp(_1994, 0.0, 1.0);
        _1946 = _1996;
    }
    float _1998 = _1946;
    float _2000 = -_1868;
    float _2002 = _2000 + 1.0;
    float _2004 = _1135 + _1920;
    float _2006 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2008 = -_1589;
    float _2010 = _2008 + 1.0;
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1555;
    out.gl_Position.y = _1569;
    out.gl_Position.z = _1926;
    out.gl_Position.w = _1505;
    float _2014 = _2010 * _2006;
    float _2016 = precise::clamp(_2014, 0.0, 1.0);
    float _2018 = _1117 + _1910;
    float _2020 = _1145 + _1912;
    out.m_72.x = _1255;
    out.m_72.y = _1251;
    out.m_72.z = _1259;
    bool _2022 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2024 = isnan(_1297);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2030 = _2026 || _2028;
    out.m_74.x = _2018;
    out.m_74.y = _2020;
    out.m_74.z = _2004;
    out.m_76.x = _1944;
    out.m_76.y = _1922;
    out.m_76.z = _1942;
    out.m_76.w = _1505;
    float _2032 = _2012 * _1591;
    float _2034 = -_2012;
    float _2036 = _2034 + 1.0;
    float _2038 = -_2016;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2042 = _1602 * _2032;
    float _2044 = _1612 * _2032;
    float _2046 = _1602 * _2036;
    float _2048 = _2040 * _1884;
    float _2050 = fma(_1608, _2042, _1596);
    float _2052 = fma(_1610, _2042, _1598);
    float _2054 = fma(_1602, _2044, _1600);
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2058 = _2032;
    float _2060 = _2042;
    float _2062 = _2056;
    if (!_2030)
    {
        _1930 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2064 = _1930;
    float _2066 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2068 = _2064;
    float _2070 = _2064;
    if (!_2030)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2072 = _1932;
    out.m_78.x = _2050;
    out.m_78.y = _2052;
    out.m_78.z = _2054;
    out.m_78.w = _2046;
    float _2074 = _2072;
    float _2076 = _2072;
    if (!_2030)
    {
        _1948 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2078 = _1948;
    float _2080 = _2078;
    float _2082 = _2078;
    if (!_2030)
    {
        _2058 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2084 = _2058;
    out.m_80.x = _2056;
    float _2086 = _2084;
    float _2088 = _2084;
    if (!_2030)
    {
        _2060 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2090 = _2060;
    float _2092 = _2090;
    float _2094 = _2090;
    if (!_2030)
    {
        _2062 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2096 = _2062;
    bool _2098 = !_2030;
    float _2100 = _2096;
    float _2102 = _2096;
    if (!_2098)
    {
        bool _2104 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2106 = isnan(_1297);
        bool _2108 = _2104 || _2106;
        bool _2110 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2112 = _2108 || _2110;
        if (!_2112)
        {
            float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2116 = _1297 + _2114;
            float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2120 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2118;
            float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2126 = 1.0 / _2120;
            float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2130 = _2128 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2138 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2144 = _2116 * _2126;
            float _2146 = precise::clamp(_2144, 0.0, 1.0);
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2152 = fma(_2146, _2124, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2154 = fma(_2146, _2150, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2156 = fma(_2146, _2130, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2158 = fma(_2146, _2134, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2160 = fma(_2146, _2138, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2162 = fma(_2146, _2142, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2082 = _2156;
            _2094 = _2160;
            _2076 = _2152;
            _2088 = _2158;
            _2070 = _2154;
            _2102 = _2162;
            _2164 = true;
        }
        else
        {
            bool _2166 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2168 = isnan(_1297);
            bool _2170 = _2166 || _2168;
            bool _2172 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2174 = _2170 || _2172;
            if (!_2174)
            {
                _2074 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2176 = _2074;
            _2076 = _2176;
            if (!_2174)
            {
                _2080 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2178 = _2080;
            _2082 = _2178;
            if (!_2174)
            {
                _2068 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2180 = _2068;
            _2070 = _2180;
            if (!_2174)
            {
                _2086 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2182 = _2086;
            _2088 = _2182;
            if (!_2174)
            {
                _2092 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2184 = _2092;
            _2094 = _2184;
            if (!_2174)
            {
                _2100 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2186 = _2100;
            bool _2188 = !_2174;
            _2102 = _2186;
            if (!_2188)
            {
                bool _2190 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2192 = isnan(_1297);
                bool _2194 = _2190 || _2192;
                bool _2196 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2198 = _2194 || _2196;
                if (!_2198)
                {
                    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2202 = _1297 + _2200;
                    float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2206 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2204;
                    float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2212 = 1.0 / _2206;
                    float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2216 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2220 = _2218 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2224 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2230 = _2202 * _2212;
                    float _2232 = precise::clamp(_2230, 0.0, 1.0);
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2238 = fma(_2232, _2210, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2240 = fma(_2232, _2236, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2242 = fma(_2232, _2216, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2244 = fma(_2232, _2220, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2246 = fma(_2232, _2224, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2248 = fma(_2232, _2228, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2082 = _2242;
                    _2094 = _2246;
                    _2076 = _2238;
                    _2088 = _2244;
                    _2070 = _2240;
                    _2102 = _2248;
                    _2164 = true;
                }
                else
                {
                    _2082 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2094 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2076 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2088 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2070 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2102 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2164 = false;
    float _2250 = _2082;
    float _2252 = _2094;
    float _2254 = _2076;
    float _2256 = _2088;
    float _2258 = _2070;
    float _2260 = _2102;
    float _2262 = _2066 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2264 = fma(_2020, -0.5, 0.5);
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = -_2250;
    float _2270 = _2268 + _2252;
    float _2272 = -_2254;
    float _2274 = _2272 + _2256;
    out.m_82.x = 0.0;
    float _2276 = fma(_2266, _2270, _2250);
    float _2278 = -_2258;
    float _2280 = _2278 + _2260;
    float _2282 = fma(_2266, _2274, _2254);
    float _2284 = _2276 * 0.586610972881317138671875;
    bool _2286 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2288 = fma(_2266, _2280, _2258);
    out.m_49.x = _2262;
    float _2290 = fma(_2282, 0.298911988735198974609375, _2284);
    bool _2292 = _1998 > 0.0;
    bool _2294 = isnan(_1998);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan(0.0);
    bool _2300 = _2296 || _2298;
    float _2302 = fma(_2288, 0.114477999508380889892578125, _2290);
    float _2304 = -_2302;
    float _2306 = _2282 + _2304;
    float _2308 = -_2302;
    float _2310 = _2276 + _2308;
    float _2312 = -_2302;
    float _2314 = _2288 + _2312;
    float _2316 = fma(_2306, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2302);
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2302);
    float _2320 = fma(_2314, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2302);
    bool _2322 = !_2286;
    if (!_2322)
    {
        float _2324 = -_1251;
        float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2328 = -_1255;
        float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2332 = -_1259;
        float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2336 = _2326 * _2326;
        float _2338 = fma(_2330, _2330, _2336);
        float _2340 = fma(_2334, _2334, _2338);
        float _2342 = sqrt(_2340);
        float _2344 = rsqrt(_2340);
        float _2346 = -_2342;
        float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2350 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2352 = precise::clamp(_2350, 0.0, 1.0);
        float _2354 = _2330 * _2344;
        float _2356 = _2326 * _2344;
        float _2358 = abs(_2352);
        float _2360 = log2(_2358);
        float _2362 = _2334 * _2344;
        float _2364 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2366 = _2020 * _2356;
        float _2368 = -_2356;
        float _2370 = -_2364;
        float _2372 = fma(_2368, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2370);
        float _2374 = fma(_2018, _2354, _2366);
        float _2376 = -_2362;
        float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2372);
        float _2380 = fma(_2004, _2362, _2374);
        float _2382 = precise::clamp(_2380, 0.0, 1.0);
        float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2386 = _2378 + _2384;
        float _2388 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2390 = _2386 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2392 = precise::clamp(_2390, 0.0, 1.0);
        float _2394 = exp2(_2388);
        float _2396 = _2394 * _2392;
        float _2398 = _2382 * _2396;
        float _2400 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2402 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2404 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2400;
        out.m_82.y = _2402;
        out.m_82.z = _2404;
    }
    out.m_84.x = _2316;
    out.m_84.y = _2318;
    out.m_84.z = _2320;
    if (_2300)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2406 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2406;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2164 = false;
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
        float _2464 = as_type<float>(_119);
        out.gl_Position.z = _2464;
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
        float _2534 = as_type<float>(_157);
        out.gl_Position.z = _2534;
    }
    if (_149)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _163 = log2(_161);
    float _165 = in.m_56.x;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _169 = _167 != 0;
    float _171 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = in.m_56.z;
    float _175 = in.m_56.w;
    float _177 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _179 = in.m_56.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _185 = 0.0;
    float _187 = _181;
    if (!_169)
    {
        float _189 = in.m_56.z;
        _185 = _189;
    }
    float _191 = _185;
    float _193 = _163 * _137;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _201 = as_type<int>(_159) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_159) & 2;
    bool _207 = _205 != 0;
    int _209 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _211 = _209 != 0;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _215 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _217 = _165 * 2.0;
    float _219 = exp2(_193);
    float _221 = _173 * 2.0;
    float _223 = -_181;
    float _225 = fma(_215, 2.0, _223);
    float _227 = _215;
    if (_169)
    {
        _187 = _165;
    }
    float _229 = _187;
    float _231 = _171 * _183;
    float _233 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _235 = _229;
    float _237 = _191;
    if (!_169)
    {
        _227 = _179;
    }
    float _239 = _227;
    float _241 = -_137;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[76].x, _225);
    float _245 = floor(_221);
    float _247 = fma(_233, -2.0, _177);
    float _249 = _239;
    if (!_169)
    {
        _235 = _173;
    }
    float _251 = _235;
    float _253 = _179 * 2.0;
    float _255 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _247);
    if (_169)
    {
        _249 = _165;
    }
    float _257 = _249;
    float _259 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _231);
    float _261 = floor(_217);
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _265 = _251 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _269 = _257 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _271 = -_263;
    float _273 = fma(_265, 2.0, _271);
    float _275 = -_267;
    float _277 = fma(_269, 2.0, _275);
    float _279 = _267;
    float _281 = _257;
    float _283 = _269;
    if (!_169)
    {
        _279 = _191;
    }
    float _285 = _279;
    float _287 = -_137;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[86].x, _273);
    float _291 = _285;
    if (_169)
    {
        _291 = _179;
    }
    float _293 = _291;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _297 = _245 > 0.0;
    float _299 = -_137;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[81].x, _277);
    bool _303 = _245 >= 0.0;
    bool _305 = isnan(_245);
    bool _307 = _303 || _305;
    bool _309 = isnan(0.0);
    bool _311 = _307 || _309;
    float _313 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[83].z, _195);
    float _315 = _293 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_169)
    {
        _281 = _179;
    }
    float _317 = _281;
    float _319 = floor(_253);
    float _321 = fma(_315, -2.0, _295);
    float _323 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _313);
    float _325 = _317;
    if (!_169)
    {
        _325 = _165;
    }
    float _327 = _325;
    float _329 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _321);
    if (_169)
    {
        _283 = _173;
    }
    float _331 = _283;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _335 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _337 = isnan(1.0);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _343 = _339 || _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _347 = 1.0 + _345;
    float _349 = _331;
    if (_169)
    {
        _237 = _179;
    }
    float _351 = _237;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_169)
    {
        _349 = _179;
    }
    float _355 = _349;
    float _357 = 1.0 / _347;
    float _359 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[83].w, _197);
    float _361 = fma(_353, -2.0, _333);
    float _363 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[89].z, _213);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _367 = -_219;
    float _369 = _367 + 1.0;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _373 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _375 = isnan(0.0);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _381 = _377 || _379;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _385 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _365);
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _389 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _371);
    float _391 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _383);
    float _393 = _381 ? _369 : 0.0;
    float _395 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _387);
    float _397 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _385);
    float _399 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _401 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _389);
    float _403 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _391);
    float _405 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _395);
    float _407 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _359);
    float _409 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[89].x, _363);
    float _411 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _361);
    if (_343)
    {
        float _413 = _393 * _357;
        _139 = _413;
    }
    float _415 = _139;
    float _417 = in.m_46.x;
    float _419 = in.m_46.y;
    float _421 = in.m_46.z;
    float _423 = _399 * _199;
    bool _425 = !_203;
    float _427 = _425 ? (-0.5) : 0.5;
    float _429 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _423);
    bool _431 = !_207;
    float _433 = _431 ? (-0.5) : 0.5;
    bool _435 = _173 > 0.5;
    float _437 = floor(_429);
    bool _439 = _179 > 0.5;
    bool _441 = !_211;
    int _443 = _441 ? 0 : 1;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _455 = _453 != 0;
    float _457 = -_427;
    int _459 = _439 ? as_type<int>(_457) : as_type<int>(_427);
    float _461 = -_433;
    int _463 = _435 ? as_type<int>(_461) : as_type<int>(_433);
    int _465 = _311 ? 0 : 1;
    float _467 = _419 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _469 = !_451;
    float _471 = _469 ? _427 : as_type<float>(_459);
    float _473 = -_437;
    float _475 = _429 + _473;
    bool _477 = !_455;
    float _479 = _477 ? _433 : as_type<float>(_463);
    float _481 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].x, _467);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _493 = _491 != 0;
    bool _495 = _319 > 0.0;
    float _497 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _481);
    int _499 = ~_465;
    int _501 = _499 + 1;
    int _503 = _501 + 1;
    int _505 = _503;
    if (!_297)
    {
        int _507 = ~_465;
        int _509 = _507 + 1;
        _505 = _509;
    }
    int _511 = _505;
    float _513 = _497 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _515 = _319 >= 0.0;
    bool _517 = isnan(_319);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    float _525 = _419 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _527 = _419 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _529 = !_485;
    int _531 = _529 ? 0 : 1;
    float _533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _535 = _513 + _533;
    int _537 = _523 ? 0 : 1;
    float _539 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
    bool _541 = !_489;
    int _543 = _541 ? 0 : 1;
    float _545 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].x, _525);
    bool _547 = _175 > 0.5;
    float _549 = _179 + _173;
    bool _551 = _261 >= 0.0;
    bool _553 = isnan(_261);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = _165 + _179;
    int _563 = ~_537;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
    int _571 = _567;
    if (!_495)
    {
        int _573 = ~_537;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _165 + _173;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _587 = _585 != 0;
    float _589 = _561 + (-1.0);
    int _591 = _559 ? 0 : 1;
    float _593 = _579 + (-1.0);
    bool _595 = _261 > 0.0;
    float _597 = _549 + (-1.0);
    float _599 = _429 * 6.283185482025146484375;
    float _601 = _569 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _603 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _605 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _607 = _599 * 0.15915493667125701904296875;
    float _609 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _539);
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _613 = _601 + _611;
    int _615 = ~_591;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    float _621 = _607 * 6.283185482025146484375;
    float _623 = cos(_621);
    int _625 = _619;
    bool _627 = _583;
    if (!_595)
    {
        int _629 = ~_591;
        int _631 = _629 + 1;
        _625 = _631;
    }
    int _633 = _625;
    float _635 = _609 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _637 = _613 * _613;
    float _639 = -_475;
    float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _643 = _475 < 0.5;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _649 = _635 + _647;
    float _651 = fma(_535, _535, _637);
    bool _653 = !_493;
    int _655 = _653 ? 0 : 1;
    float _657 = -_635;
    float _659 = _657 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _661 = abs(_531);
    float _663 = fma(_649, _649, _651);
    float _665 = -_645;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _669 = abs(_655);
    float _671 = fma(_623, 0.5, 0.5);
    float _673 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _675 = rsqrt(_663);
    float _677 = float(_511);
    float _679 = float(_661);
    float _681 = -_671;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _685 = abs(_543);
    float _687 = _679 * _677;
    float _689 = floor(_259);
    float _691 = float(_577);
    float _693 = _535 * 0.0625;
    float _695 = float(_669);
    float _697 = _687 * (-2.0);
    float _699 = abs(_535);
    float _701 = abs(_659);
    float _703 = precise::max(_699, _701);
    float _705 = _613 * _675;
    float _707 = _695 * _691;
    bool _709 = _703 >= 16.0;
    float _711 = _649 * _675;
    float _713 = float(_633);
    float _715 = _707 * (-2.0);
    float _717 = _709 ? _693 : _535;
    float _719 = _535 * _675;
    float _721 = float(_685);
    float _723 = -_705;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _727 = fma(_673, _697, _673);
    float _729 = fma(_605, _715, _605);
    float _731 = _165 + (-0.5);
    float _733 = -_689;
    float _735 = _259 + _733;
    float _737 = _259 * 6.283185482025146484375;
    float _739 = -_719;
    float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _535);
    float _743 = _725 * _725;
    float _745 = _721 * _713;
    float _747 = _731 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _749 = _737 * 0.15915493667125701904296875;
    float _751 = fma(_741, _741, _743);
    float _753 = _745 * (-2.0);
    float _755 = -_433;
    int _757 = _547 ? as_type<int>(_755) : as_type<int>(_433);
    float _759 = _659;
    float _761 = _719;
    if (_709)
    {
        float _763 = _659 * 0.0625;
        _759 = _763;
    }
    float _765 = _759;
    float _767 = fma(_727, _415, _747);
    float _769 = abs(_717);
    bool _771 = _769 != 0.0;
    bool _773 = isnan(_769);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = _173 + (-0.5);
    float _783 = _749 * 6.283185482025146484375;
    float _785 = cos(_783);
    float _787 = fma(_603, _753, _603);
    float _789 = abs(_765);
    bool _791 = _789 == 0.0;
    bool _793 = !_779;
    bool _795 = _791 && _793;
    float _797 = -_711;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    float _801 = in.m_58.x;
    float _803 = in.m_58.y;
    float _805 = _781 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _807 = _179 + (-0.5);
    bool _809 = !_447;
    float _811 = _809 ? _433 : as_type<float>(_757);
    float _813 = fma(_799, _799, _751);
    bool _815 = _735 < 0.5;
    float _817 = float(_815);
    float _819 = _767 * 0.15915493667125701904296875;
    float _821 = abs(_765);
    bool _823 = _821 == 0.0;
    float _825 = -_735;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _829 = _807 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _831 = -_817;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _835 = sqrt(_813);
    bool _837 = !_583;
    int _839 = _837 ? 0 : 1;
    float _841 = fma(_785, 0.5, 0.5);
    int _843 = as_type<int>(_787);
    int _845 = _839;
    int _847 = _823 ? (-1) : 0;
    if (_795)
    {
        bool _849 = as_type<int>(_765) >= 0;
        _627 = _849;
    }
    bool _851 = _627;
    float _853 = fma(_787, _415, _829);
    float _855 = fma(_729, _415, _805);
    int _857 = abs(_839);
    float _859 = -_841;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _863 = _819 * 6.283185482025146484375;
    float _865 = sin(_863);
    if (_795)
    {
        int _867 = _851 ? 0 : 1078530011;
        _843 = _867;
    }
    int _869 = _843;
    int _871 = abs(_443);
    bool _873 = !_587;
    int _875 = _873 ? 0 : 1;
    if (_795)
    {
        int _877 = int(0x80000000) & as_type<int>(_717);
        int _879 = _869 | _877;
        _845 = _879;
    }
    int _881 = _845;
    bool _883 = !_779;
    bool _885 = _883 && _823;
    int _887 = _881;
    float _889 = as_type<float>(_881);
    if (!_885)
    {
        float _891 = abs(_717);
        bool _893 = _891 != as_type<float>(0x7f800000u /* inf */);
        bool _895 = isnan(_891);
        bool _897 = _893 || _895;
        bool _899 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _901 = _897 || _899;
        float _903 = abs(_765);
        bool _905 = _903 == as_type<float>(0x7f800000u /* inf */);
        float _907 = abs(_765);
        bool _909 = _907 == as_type<float>(0x7f800000u /* inf */);
        bool _911 = !_901;
        bool _913 = _909 && _911;
        if (_913)
        {
            bool _915 = as_type<int>(_765) >= 0;
            _847 = _915 ? (-1) : 0;
        }
        int _917 = _847;
        if (_913)
        {
            _887 = 1075235812;
        }
        int _919 = _887;
        int _921 = _919;
        if (_913)
        {
            int _923 = ~_917;
            int _925 = (_923 != 0) ? _919 : 1061752795;
            _921 = _925;
        }
        int _927 = _921;
        float _929 = as_type<float>(_927);
        if (_913)
        {
            int _931 = int(0x80000000) & as_type<int>(_717);
            int _933 = _927 | _931;
            _929 = as_type<float>(_933);
        }
        float _935 = _929;
        bool _937 = !_901;
        bool _939 = _937 && _905;
        _889 = _935;
        if (!_939)
        {
            float _941 = abs(_765);
            float _943 = abs(_717);
            float _945 = precise::max(_941, _943);
            float _947 = abs(_765);
            float _949 = abs(_717);
            float _951 = precise::min(_947, _949);
            float _953 = 1.0 / _945;
            float _955 = abs(_717);
            float _957 = abs(_765);
            bool _959 = _955 > _957;
            bool _961 = as_type<int>(_765) >= 0;
            float _963 = _951 * _953;
            float _965 = _963 * _963;
            float _967 = _965 + 11.33538818359375;
            float _969 = fma(_965, _967, 28.84246826171875);
            float _971 = fma(_965, _969, 19.6966705322265625);
            float _973 = fma(_965, -0.82336294651031494140625, -5.674867153167724609375);
            float _975 = fma(_965, _973, -6.565555095672607421875);
            float _977 = 1.0 / _971;
            float _979 = _965 * _975;
            float _981 = abs(_765);
            float _983 = abs(_717);
            float _985 = _981 + _983;
            int _987 = as_type<int>(_717) & int(0x80000000);
            float _989 = _963 * _979;
            bool _991 = _985 > as_type<float>(0x7f800000u /* inf */);
            bool _993 = isnan(_985);
            bool _995 = _991 || _993;
            bool _997 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _999 = _995 || _997;
            float _1001 = fma(_989, _977, _963);
            float _1003 = _1001;
            _889 = _985;
            if (_959)
            {
                float _1005 = -_1001;
                float _1007 = _1005 + 1.57079637050628662109375;
                _1003 = _1007;
            }
            float _1009 = _1003;
            int _1011 = as_type<int>(_1009);
            if (!_961)
            {
                float _1013 = -_1009;
                float _1015 = _1013 + 3.1415927410125732421875;
                _1011 = as_type<int>(_1015);
            }
            int _1017 = _1011;
            if (!_999)
            {
                int _1019 = _987 | _1017;
                _889 = as_type<float>(_1019);
            }
        }
    }
    float _1021 = _889;
    float _1023 = -_1021;
    float _1025 = _853 + _1023;
    float _1027 = _855 * 0.15915493667125701904296875;
    float _1029 = float(_857);
    float _1031 = _1025 * 0.15915493667125701904296875;
    int _1033 = abs(_875);
    float _1035 = _819 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = float(_871);
    float _1041 = abs(_641);
    float _1043 = _1029 * _1041;
    float _1045 = abs(_827);
    float _1047 = _1029 * _1045;
    float _1049 = _675 * _835;
    float _1051 = fma(_1039, _683, _1043);
    float _1053 = float(_1033);
    float _1055 = fma(_1039, _861, _1047);
    float _1057 = _1027 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1063 = _1061 * 0.5;
    float _1065 = abs(_667);
    float _1067 = fma(_1053, _1065, _1051);
    float _1069 = abs(_833);
    float _1071 = fma(_1053, _1069, _1055);
    float _1073 = _801 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1075 = _803 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1077 = _1031 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1067 * _1073;
    float _1083 = _1071 * _1075;
    float _1085 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _433);
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _427);
    float _1089 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1093 = _1031 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = _1049 * _1089;
    float _1099 = _1049 * _1091;
    float _1101 = _865 * _1059;
    float _1103 = _1097 * _1087;
    float _1105 = _1099 * _1085;
    float _1107 = _1027 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = _1037 * _1079;
    float _1113 = _865 * _1079;
    float _1115 = _1101 * _1105;
    float _1117 = _1079 * _1059;
    float _1119 = _865 * _1095;
    float _1121 = _1037 * _1095;
    float _1123 = _1095 * _1059;
    float _1125 = _1037 * _1059;
    float _1127 = -_1111;
    float _1129 = fma(_1109, _1119, _1127);
    float _1131 = -_1105;
    float _1133 = _1109 * _1131;
    float _1135 = fma(_1109, _1113, _1121);
    float _1137 = fma(_1109, _1121, _1113);
    float _1139 = fma(_1129, _1103, _1115);
    float _1141 = fma(_1123, _1103, _1133);
    float _1143 = -_1119;
    float _1145 = fma(_1109, _1111, _1143);
    float _1147 = fma(_1135, _1063, _1139);
    float _1149 = fma(_1117, _1063, _1141);
    float _1151 = _635 + _1147;
    float _1153 = _513 + _1149;
    float _1155 = _1125 * _1105;
    float _1157 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1159 = _1151 + _1157;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1163 = _1153 + _1161;
    float _1165 = fma(_1137, _1103, _1155);
    float _1167 = _1159 * _1159;
    float _1169 = fma(_1145, _1063, _1165);
    float _1171 = fma(_1163, _1163, _1167);
    float _1173 = _601 + _1169;
    float _1175 = sqrt(_1171);
    bool _1177 = _1175 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1179 = _1063;
    float _1181 = _1165;
    float _1183 = _1105;
    float _1185 = _1175;
    float _1187 = _1151;
    float _1189 = _1171;
    if (!_1177)
    {
        _1179 = _1153;
    }
    float _1191 = _1179;
    float _1193 = _1191;
    if (!_1177)
    {
        _1181 = _1151;
    }
    float _1195 = _1181;
    float _1197 = _1195;
    if (!_1177)
    {
        _1183 = _1173;
    }
    float _1199 = _1183;
    bool _1201 = !_1177;
    float _1203 = _1199;
    if (!_1201)
    {
        float _1205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1209 = _1175 + _1207;
        float _1211 = rsqrt(_1171);
        float _1213 = _1209 * _1205;
        float _1215 = _1173 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = _1213 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = fma(_1221, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1211 * _1227;
        float _1231 = _1225 + (-1.0);
        float _1233 = fma(_1163, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1159, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1237 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = fma(_1173, _1225, _1237);
        _1203 = _1239;
        _1193 = _1233;
        _1197 = _1235;
        _1185 = _1217;
    }
    float _1241 = _1203;
    float _1243 = _1193;
    float _1245 = _1197;
    float _1247 = _1185;
    float _1249 = -_705;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1241);
    float _1253 = -_719;
    float _1255 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1257 = -_711;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1261 = -_719;
    float _1263 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[18].w, _513);
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1267 = _1251 + _1265;
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1271 = _1255 + _1269;
    float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1275 = _1259 + _1273;
    float _1277 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1279 = _1267 * _1267;
    float _1281 = -_711;
    float _1283 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _1285 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1277);
    float _1287 = fma(_1271, _1271, _1279);
    float _1289 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1291 = fma(_1275, _1275, _1287);
    float _1293 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1295 = rsqrt(_1291);
    float _1297 = sqrt(_1291);
    float _1299 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1301 = _1271 * _1299;
    float _1303 = _1275 * _1299;
    float _1305 = _1301 * _1301;
    float _1307 = _1303 * _1303;
    float _1309 = _1305 + _1307;
    float _1311 = sqrt(_1309);
    bool _1313 = _1311 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1317 = _1311 + _1315;
    float _1319 = _1247;
    float _1321 = _1317;
    float _1323 = _1301;
    float _1325 = _1305;
    if (_1313)
    {
        float _1327 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1319 = _1327;
    }
    float _1329 = _1319;
    if (_1313)
    {
        float _1331 = rsqrt(_1309);
        _1187 = _1331;
    }
    float _1333 = _1187;
    float _1335 = _1333;
    if (_1313)
    {
        float _1337 = _1317 * _1329;
        _1321 = _1337;
    }
    float _1339 = _1321;
    float _1341 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1313)
    {
        float _1343 = _1339 * 0.15915493667125701904296875;
        _1189 = _1343;
    }
    float _1345 = _1189;
    float _1347 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1349 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1341);
    float _1351 = _1153;
    if (_1313)
    {
        float _1353 = _1345 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        _1351 = _1355;
    }
    float _1357 = _1351;
    float _1359 = precise::max(0.0, _1347);
    float _1361 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1349);
    float _1363 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1365 = _1359;
    if (_1313)
    {
        float _1367 = _1345 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        _1363 = _1369;
    }
    float _1371 = _1363;
    float _1373 = -_1299;
    float _1375 = -_1359;
    float _1377 = fma(_1267, _1373, _1375);
    float _1379 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1313)
    {
        float _1381 = _1377 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1381;
    }
    float _1383 = _1365;
    float _1385 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1387 = _1357;
    float _1389 = _1383;
    if (_1313)
    {
        float _1391 = fma(_1357, _1383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = _1393;
    if (!_1313)
    {
        _1389 = _1377;
    }
    float _1397 = _1389;
    float _1399 = _1397;
    if (_1313)
    {
        float _1401 = _1333 * _1393;
        _1395 = _1401;
    }
    float _1403 = _1395;
    float _1405 = floor(_1385);
    float _1407 = _1371;
    if (_1313)
    {
        float _1409 = _1371 + (-1.0);
        _761 = _1409;
    }
    float _1411 = _761;
    float _1413 = _1411;
    if (_1313)
    {
        float _1415 = _1301 * _1403;
        _1323 = _1415;
    }
    float _1417 = _1323;
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1421 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1419);
    float _1423 = precise::clamp(_1421, 0.0, 1.0);
    if (_1313)
    {
        float _1425 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1425;
    }
    float _1427 = _1335;
    if (!_1313)
    {
        _1413 = _1303;
    }
    float _1429 = _1413;
    float _1431 = _1429;
    if (_1313)
    {
        float _1433 = _1303 * _1403;
        _1431 = _1433;
    }
    float _1435 = _1431;
    if (_1313)
    {
        float _1437 = _1417 * _1417;
        _1325 = _1437;
    }
    float _1439 = _1325;
    if (_1313)
    {
        float _1441 = fma(_1377, _1371, _1427);
        _1399 = _1441;
    }
    float _1443 = _1399;
    if (!_1313)
    {
        _1407 = _1307;
    }
    float _1445 = _1407;
    float _1447 = _1445;
    if (_1313)
    {
        float _1449 = _1435 * _1435;
        _1447 = _1449;
    }
    float _1451 = _1447;
    float _1453 = fma(_1443, _1443, _1439);
    float _1455 = -_1423;
    float _1457 = _1455 + 1.0;
    float _1459 = _1453 + _1451;
    float _1461 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1463 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1465 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = abs(_1457);
    float _1469 = log2(_1467);
    float _1471 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1473 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1463);
    float _1475 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1477 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1473);
    float _1479 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1475);
    float _1481 = rsqrt(_1459);
    float _1483 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1485 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1487 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1491 = -_1487;
    float _1493 = fma(_1491, _1461, 1.0);
    float _1495 = floor(_1471);
    float _1497 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1489);
    float _1499 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1497);
    float _1501 = _1481 * _1417;
    float _1503 = _1481 * _1443;
    float _1505 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1499);
    float _1507 = _1481 * _1435;
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1511 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1513 = 1.0 / _1505;
    float _1515 = -_1509;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1515);
    float _1519 = -_1405;
    float _1521 = _1385 + _1519;
    float _1523 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1525 = -_1495;
    float _1527 = _1471 + _1525;
    float _1529 = -_1507;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1517);
    float _1533 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1535 = exp2(_1511);
    float _1537 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1523);
    float _1539 = fma(_1531, -0.5, 0.5);
    float _1541 = fma(_1531, 0.5, 0.5);
    float _1543 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1533);
    float _1545 = _1503 + 1.0;
    float _1547 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1537);
    float _1549 = fma(_1541, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1551 = log2(_1493);
    float _1553 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1543);
    float _1555 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1547);
    float _1557 = fma(_1541, _1549, -0.212114393711090087890625);
    float _1559 = _1555 * _1513;
    float _1561 = fma(_1541, _1557, 1.570728778839111328125);
    float _1563 = sqrt(_1539);
    float _1565 = -_1503;
    float _1567 = fma(_1535, _1545, _1565);
    float _1569 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1553);
    float _1571 = fma(_1567, 0.5, 0.5);
    float _1573 = _1569 * _1513;
    float _1575 = _1551 * 0.693147182464599609375;
    float _1577 = fma(_1573, -0.5, 0.5);
    float _1579 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1581 = _1563 * 0.636619746685028076171875;
    float _1583 = fma(_1559, 0.5, 0.5);
    float _1585 = -_1561;
    float _1587 = fma(_1581, _1585, 1.0);
    float2 _4768 = float2(_1521, _1527);
    float _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4768, float2(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4768, float2(0.0), isnan(_4768)), level(0.0)).x;
    float3 _4779 = float3(_1583, _1577, _1579);
    float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4779, float3(0.0), isnan(_4779)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4779, float3(0.0), isnan(_4779)), level(0.0)).x;
    float3 _4790 = float3(_1583, _1577, _1579);
    float4 _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4790, float3(0.0), isnan(_4790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4790, float3(0.0), isnan(_4790)), level(0.0)).xyzw;
    float _1596 = _1594.x;
    float _1598 = _1594.y;
    float _1600 = _1594.z;
    float _1602 = _1594.w;
    float2 _4806 = float2(_1587, _1571);
    float3 _1606 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4806, float2(0.0), isnan(_4806)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4806, float2(0.0), isnan(_4806)), level(0.0)).xyz;
    float _1608 = _1606.x;
    float _1610 = _1606.y;
    float _1612 = _1606.z;
    float _1614 = -_705;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1620 = _165 > 0.5;
    float _1622 = -_401;
    float _1624 = _1622 + 1.0;
    float _1626 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1628 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1632 = _1630 != 0;
    float _1634 = -_407;
    float _1636 = _1634 + 1.0;
    float _1638 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1626);
    float _1640 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1628);
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1644 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1638);
    float _1646 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1640);
    float _1648 = -_427;
    int _1650 = _1620 ? as_type<int>(_1648) : as_type<int>(_427);
    float _1652 = -_323;
    float _1654 = _1652 + 1.0;
    float _1656 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1658 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1660 = !_1632;
    float _1662 = _1660 ? _427 : as_type<float>(_1650);
    float _1664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1668 = _1666 != 0;
    float _1670 = _1658 + _1656;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1674 = _1672 != 0;
    float _1676 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1678 = _1662 + 0.5;
    float _1680 = 1.0 / _1656;
    float _1682 = fma(_1676, _1678, _243);
    bool _1684 = _179 > 0.5;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1688 = -_403;
    float _1690 = _1688 + 1.0;
    float _1692 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1694 = -_397;
    float _1696 = _1694 + 1.0;
    float _1698 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1700 = _409 * (-0.15915493667125701904296875);
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1708 = -_1690;
    float _1710 = fma(_1662, _1708, _1682);
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1670 * _1680;
    float _1716 = _1714 * 0.5;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1720 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1718);
    float _1722 = _1700 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1728 = -_433;
    int _1730 = _1684 ? as_type<int>(_1728) : as_type<int>(_433);
    float _1732 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1734 = !_1668;
    float _1736 = _1734 ? _433 : as_type<float>(_1730);
    float _1738 = 1.0 / _1720;
    out.m_60.x = _1698;
    out.m_60.y = _1732;
    out.m_60.z = _1712;
    out.m_60.w = _1704;
    float _1740 = _1700 * 6.283185482025146484375;
    float _1742 = cos(_1740);
    float _1744 = _479 * _1724;
    float _1746 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1748 = -_427;
    int _1750 = _435 ? as_type<int>(_1748) : as_type<int>(_427);
    float _1752 = _1736 + (-0.5);
    float _1754 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1758 = !_1674;
    float _1760 = _1758 ? _427 : as_type<float>(_1750);
    float _1762 = -_1754;
    float _1764 = -_255;
    float _1766 = fma(_1762, _1752, _1764);
    float _1768 = _479 * _1742;
    float _1770 = -_1744;
    float _1772 = fma(_471, _1742, _1770);
    float _1774 = _1760 + 0.5;
    float _1776 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1780 = _1772 + 0.5;
    float _1782 = fma(_1746, _1774, _301);
    float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1786 = _1738 * _1784;
    float _1788 = fma(_471, _1724, _1768);
    float _1790 = fma(_1776, _1780, _289);
    float _1792 = _811 + (-0.5);
    float _1794 = fma(_1736, _1624, _1766);
    float _1796 = abs(_1786);
    float _1798 = log2(_1796);
    float _1800 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1802 = _1788 + (-0.5);
    float _1804 = -_1654;
    float _1806 = fma(_1760, _1804, _1782);
    float _1808 = -_1800;
    float _1810 = -_329;
    float _1812 = fma(_1808, _1792, _1810);
    float _1814 = -_433;
    float _1816 = _1814 + 0.5;
    float _1818 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1824 = -_1818;
    float _1826 = -_411;
    float _1828 = fma(_1824, _1802, _1826);
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1832 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1834 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_62.y = _1816;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1840 = _433 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1842 = exp2(_1832);
    float _1844 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = -_405;
    float _1848 = _1846 + 1.0;
    float _1850 = fma(_811, _1636, _1812);
    bool _1852 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1854 = isnan(0.5);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1860 = _1856 || _1858;
    float _1862 = -_1696;
    float _1864 = fma(_1772, _1862, _1790);
    float _1866 = fma(_1788, _1848, _1828);
    out.m_64.x = _1830;
    out.m_64.y = _1834;
    out.m_64.z = _1844;
    out.m_64.w = _1838;
    float _1868 = exp2(_1692);
    float _1870 = -_1840;
    float _1872 = _1109 * _1870;
    float _1874 = _1125 * _1840;
    out.m_66.x = _1710;
    out.m_66.y = _1794;
    out.m_66.z = _1806;
    out.m_66.w = _1850;
    float _1876 = _427 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1878 = _1101 * _1840;
    float _1880 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1882 = precise::clamp(_1880, 0.0, 1.0);
    float _1884 = in.m_68.x;
    out.m_70.x = _1864;
    out.m_70.y = _1866;
    float _1886 = fma(_1882, -2.0, 3.0);
    float _1888 = _1882 * _1882;
    float _1890 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1892 = _1786 <= 8000.0;
    bool _1894 = isnan(_1786);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(8000.0);
    bool _1900 = _1896 || _1898;
    float _1902 = float(_1900);
    float _1904 = _1505 * 0.5;
    float _1906 = _1888 * _1886;
    float _1908 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1890);
    float _1910 = fma(_1123, _1876, _1872);
    float _1912 = fma(_1137, _1876, _1874);
    float _1914 = -_1906;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1908);
    float _1920 = fma(_1129, _1876, _1878);
    float _1922 = fma(_1569, -0.5, _1904);
    float _1924 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1906);
    float _1926 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1918);
    float _1928 = _1878;
    float _1930 = _1505;
    float _1932 = _1922;
    if (_1860)
    {
        _1928 = 1.0;
    }
    float _1934 = _1928;
    float _1936 = _1902 * _1924;
    float _1938 = _1926 + _1505;
    float _1940 = _1555 + _1505;
    float _1942 = _1938 * 0.5;
    float _1944 = _1940 * 0.5;
    float _1946 = _1934;
    float _1948 = _1944;
    if (!_1860)
    {
        float _1950 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1952 = _1950 * 0.15915493667125701904296875;
        float _1954 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1956 = _1952 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = _1954 * 0.15915493667125701904296875;
        float _1962 = _1952 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = 1.0 / _1958;
        float _1968 = _1960 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        float _1972 = _1964 * _1966;
        float _1974 = _1960 * 6.283185482025146484375;
        float _1976 = sin(_1974);
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1978;
        float _1982 = _1970 * _1972;
        float _1984 = 1.0 / _1980;
        float _1986 = 1.0 / _1982;
        float _1988 = _1976 * _1986;
        float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1992 = fma(_1786, _1988, _1990);
        float _1994 = _1992 * _1984;
        float _1996 = precise::clamp(_1994, 0.0, 1.0);
        _1946 = _1996;
    }
    float _1998 = _1946;
    float _2000 = -_1868;
    float _2002 = _2000 + 1.0;
    float _2004 = _1135 + _1920;
    float _2006 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2008 = -_1589;
    float _2010 = _2008 + 1.0;
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1555;
    out.gl_Position.y = _1569;
    out.gl_Position.z = _1926;
    out.gl_Position.w = _1505;
    float _2014 = _2010 * _2006;
    float _2016 = precise::clamp(_2014, 0.0, 1.0);
    float _2018 = _1117 + _1910;
    float _2020 = _1145 + _1912;
    out.m_72.x = _1255;
    out.m_72.y = _1251;
    out.m_72.z = _1259;
    bool _2022 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2024 = isnan(_1297);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2030 = _2026 || _2028;
    out.m_74.x = _2018;
    out.m_74.y = _2020;
    out.m_74.z = _2004;
    out.m_76.x = _1944;
    out.m_76.y = _1922;
    out.m_76.z = _1942;
    out.m_76.w = _1505;
    float _2032 = _2012 * _1591;
    float _2034 = -_2012;
    float _2036 = _2034 + 1.0;
    float _2038 = -_2016;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2042 = _1602 * _2032;
    float _2044 = _1612 * _2032;
    float _2046 = _1602 * _2036;
    float _2048 = _2040 * _1884;
    float _2050 = fma(_1608, _2042, _1596);
    float _2052 = fma(_1610, _2042, _1598);
    float _2054 = fma(_1602, _2044, _1600);
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2058 = _2032;
    float _2060 = _2042;
    float _2062 = _2056;
    if (!_2030)
    {
        _1930 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2064 = _1930;
    float _2066 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2068 = _2064;
    float _2070 = _2064;
    if (!_2030)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2072 = _1932;
    out.m_78.x = _2050;
    out.m_78.y = _2052;
    out.m_78.z = _2054;
    out.m_78.w = _2046;
    float _2074 = _2072;
    float _2076 = _2072;
    if (!_2030)
    {
        _1948 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2078 = _1948;
    float _2080 = _2078;
    float _2082 = _2078;
    if (!_2030)
    {
        _2058 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2084 = _2058;
    out.m_80.x = _2056;
    float _2086 = _2084;
    float _2088 = _2084;
    if (!_2030)
    {
        _2060 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2090 = _2060;
    float _2092 = _2090;
    float _2094 = _2090;
    if (!_2030)
    {
        _2062 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2096 = _2062;
    bool _2098 = !_2030;
    float _2100 = _2096;
    float _2102 = _2096;
    if (!_2098)
    {
        bool _2104 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2106 = isnan(_1297);
        bool _2108 = _2104 || _2106;
        bool _2110 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2112 = _2108 || _2110;
        if (!_2112)
        {
            float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2116 = _1297 + _2114;
            float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2120 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2118;
            float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2126 = 1.0 / _2120;
            float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2130 = _2128 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2138 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2144 = _2116 * _2126;
            float _2146 = precise::clamp(_2144, 0.0, 1.0);
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2152 = fma(_2146, _2124, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2154 = fma(_2146, _2150, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2156 = fma(_2146, _2130, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2158 = fma(_2146, _2134, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2160 = fma(_2146, _2138, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2162 = fma(_2146, _2142, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2082 = _2156;
            _2094 = _2160;
            _2076 = _2152;
            _2088 = _2158;
            _2070 = _2154;
            _2102 = _2162;
            _2164 = true;
        }
        else
        {
            bool _2166 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2168 = isnan(_1297);
            bool _2170 = _2166 || _2168;
            bool _2172 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2174 = _2170 || _2172;
            if (!_2174)
            {
                _2074 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2176 = _2074;
            _2076 = _2176;
            if (!_2174)
            {
                _2080 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2178 = _2080;
            _2082 = _2178;
            if (!_2174)
            {
                _2068 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2180 = _2068;
            _2070 = _2180;
            if (!_2174)
            {
                _2086 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2182 = _2086;
            _2088 = _2182;
            if (!_2174)
            {
                _2092 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2184 = _2092;
            _2094 = _2184;
            if (!_2174)
            {
                _2100 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2186 = _2100;
            bool _2188 = !_2174;
            _2102 = _2186;
            if (!_2188)
            {
                bool _2190 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2192 = isnan(_1297);
                bool _2194 = _2190 || _2192;
                bool _2196 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2198 = _2194 || _2196;
                if (!_2198)
                {
                    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2202 = _1297 + _2200;
                    float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2206 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2204;
                    float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2212 = 1.0 / _2206;
                    float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2216 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2220 = _2218 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2224 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2230 = _2202 * _2212;
                    float _2232 = precise::clamp(_2230, 0.0, 1.0);
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2238 = fma(_2232, _2210, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2240 = fma(_2232, _2236, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2242 = fma(_2232, _2216, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2244 = fma(_2232, _2220, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2246 = fma(_2232, _2224, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2248 = fma(_2232, _2228, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2082 = _2242;
                    _2094 = _2246;
                    _2076 = _2238;
                    _2088 = _2244;
                    _2070 = _2240;
                    _2102 = _2248;
                    _2164 = true;
                }
                else
                {
                    _2082 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2094 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2076 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2088 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2070 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2102 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2164 = false;
    float _2250 = _2082;
    float _2252 = _2094;
    float _2254 = _2076;
    float _2256 = _2088;
    float _2258 = _2070;
    float _2260 = _2102;
    float _2262 = _2066 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2264 = fma(_2020, -0.5, 0.5);
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = -_2250;
    float _2270 = _2268 + _2252;
    float _2272 = -_2254;
    float _2274 = _2272 + _2256;
    out.m_82.x = 0.0;
    float _2276 = fma(_2266, _2270, _2250);
    float _2278 = -_2258;
    float _2280 = _2278 + _2260;
    float _2282 = fma(_2266, _2274, _2254);
    float _2284 = _2276 * 0.586610972881317138671875;
    bool _2286 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2288 = fma(_2266, _2280, _2258);
    out.m_49.x = _2262;
    float _2290 = fma(_2282, 0.298911988735198974609375, _2284);
    bool _2292 = _1998 > 0.0;
    bool _2294 = isnan(_1998);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan(0.0);
    bool _2300 = _2296 || _2298;
    float _2302 = fma(_2288, 0.114477999508380889892578125, _2290);
    float _2304 = -_2302;
    float _2306 = _2282 + _2304;
    float _2308 = -_2302;
    float _2310 = _2276 + _2308;
    float _2312 = -_2302;
    float _2314 = _2288 + _2312;
    float _2316 = fma(_2306, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2302);
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2302);
    float _2320 = fma(_2314, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2302);
    bool _2322 = !_2286;
    if (!_2322)
    {
        float _2324 = -_1251;
        float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2328 = -_1255;
        float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2332 = -_1259;
        float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2336 = _2326 * _2326;
        float _2338 = fma(_2330, _2330, _2336);
        float _2340 = fma(_2334, _2334, _2338);
        float _2342 = sqrt(_2340);
        float _2344 = rsqrt(_2340);
        float _2346 = -_2342;
        float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2350 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2352 = precise::clamp(_2350, 0.0, 1.0);
        float _2354 = _2330 * _2344;
        float _2356 = _2326 * _2344;
        float _2358 = abs(_2352);
        float _2360 = log2(_2358);
        float _2362 = _2334 * _2344;
        float _2364 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2366 = _2020 * _2356;
        float _2368 = -_2356;
        float _2370 = -_2364;
        float _2372 = fma(_2368, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2370);
        float _2374 = fma(_2018, _2354, _2366);
        float _2376 = -_2362;
        float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2372);
        float _2380 = fma(_2004, _2362, _2374);
        float _2382 = precise::clamp(_2380, 0.0, 1.0);
        float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2386 = _2378 + _2384;
        float _2388 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2390 = _2386 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2392 = precise::clamp(_2390, 0.0, 1.0);
        float _2394 = exp2(_2388);
        float _2396 = _2394 * _2392;
        float _2398 = _2382 * _2396;
        float _2400 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2402 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2404 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2400;
        out.m_82.y = _2402;
        out.m_82.z = _2404;
    }
    out.m_84.x = _2316;
    out.m_84.y = _2318;
    out.m_84.z = _2320;
    if (_2300)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2406 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2406;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2164 = false;
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
        float _2464 = as_type<float>(_119);
        out.gl_Position.z = _2464;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2534 = as_type<float>(_157);
        out.gl_Position.z = _2534;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _163 = log2(_161);
    float _165 = in.m_56.x;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _169 = _167 != 0;
    float _171 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _173 = in.m_56.z;
    float _175 = in.m_56.w;
    float _177 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _179 = in.m_56.y;
    float _181 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _185 = 0.0;
    float _187 = _181;
    if (!_169)
    {
        float _189 = in.m_56.z;
        _185 = _189;
    }
    float _191 = _185;
    float _193 = _163 * _137;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    int _201 = as_type<int>(_159) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_159) & 2;
    bool _207 = _205 != 0;
    int _209 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _211 = _209 != 0;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _215 = _165 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _217 = _165 * 2.0;
    float _219 = exp2(_193);
    float _221 = _173 * 2.0;
    float _223 = -_181;
    float _225 = fma(_215, 2.0, _223);
    float _227 = _215;
    if (_169)
    {
        _187 = _165;
    }
    float _229 = _187;
    float _231 = _171 * _183;
    float _233 = _179 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _235 = _229;
    float _237 = _191;
    if (!_169)
    {
        _227 = _179;
    }
    float _239 = _227;
    float _241 = -_137;
    float _243 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[76].x, _225);
    float _245 = floor(_221);
    float _247 = fma(_233, -2.0, _177);
    float _249 = _239;
    if (!_169)
    {
        _235 = _173;
    }
    float _251 = _235;
    float _253 = _179 * 2.0;
    float _255 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _247);
    if (_169)
    {
        _249 = _165;
    }
    float _257 = _249;
    float _259 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].y, _231);
    float _261 = floor(_217);
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _265 = _251 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _269 = _257 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _271 = -_263;
    float _273 = fma(_265, 2.0, _271);
    float _275 = -_267;
    float _277 = fma(_269, 2.0, _275);
    float _279 = _267;
    float _281 = _257;
    float _283 = _269;
    if (!_169)
    {
        _279 = _191;
    }
    float _285 = _279;
    float _287 = -_137;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[86].x, _273);
    float _291 = _285;
    if (_169)
    {
        _291 = _179;
    }
    float _293 = _291;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _297 = _245 > 0.0;
    float _299 = -_137;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[81].x, _277);
    bool _303 = _245 >= 0.0;
    bool _305 = isnan(_245);
    bool _307 = _303 || _305;
    bool _309 = isnan(0.0);
    bool _311 = _307 || _309;
    float _313 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[83].z, _195);
    float _315 = _293 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_169)
    {
        _281 = _179;
    }
    float _317 = _281;
    float _319 = floor(_253);
    float _321 = fma(_315, -2.0, _295);
    float _323 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _313);
    float _325 = _317;
    if (!_169)
    {
        _325 = _165;
    }
    float _327 = _325;
    float _329 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _321);
    if (_169)
    {
        _283 = _173;
    }
    float _331 = _283;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _335 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _337 = isnan(1.0);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _343 = _339 || _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _347 = 1.0 + _345;
    float _349 = _331;
    if (_169)
    {
        _237 = _179;
    }
    float _351 = _237;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_169)
    {
        _349 = _179;
    }
    float _355 = _349;
    float _357 = 1.0 / _347;
    float _359 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[83].w, _197);
    float _361 = fma(_353, -2.0, _333);
    float _363 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[89].z, _213);
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _367 = -_219;
    float _369 = _367 + 1.0;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _373 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _375 = isnan(0.0);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _381 = _377 || _379;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _385 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[88].z, _365);
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _389 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[78].w, _371);
    float _391 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[78].z, _383);
    float _393 = _381 ? _369 : 0.0;
    float _395 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[88].w, _387);
    float _397 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _385);
    float _399 = _137 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _401 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _389);
    float _403 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _391);
    float _405 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _395);
    float _407 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _359);
    float _409 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[89].x, _363);
    float _411 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _361);
    if (_343)
    {
        float _413 = _393 * _357;
        _139 = _413;
    }
    float _415 = _139;
    float _417 = in.m_46.x;
    float _419 = in.m_46.y;
    float _421 = in.m_46.z;
    float _423 = _399 * _199;
    bool _425 = !_203;
    float _427 = _425 ? (-0.5) : 0.5;
    float _429 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[20].x, _423);
    bool _431 = !_207;
    float _433 = _431 ? (-0.5) : 0.5;
    bool _435 = _173 > 0.5;
    float _437 = floor(_429);
    bool _439 = _179 > 0.5;
    bool _441 = !_211;
    int _443 = _441 ? 0 : 1;
    int _445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _447 = _445 != 0;
    int _449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _451 = _449 != 0;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _455 = _453 != 0;
    float _457 = -_427;
    int _459 = _439 ? as_type<int>(_457) : as_type<int>(_427);
    float _461 = -_433;
    int _463 = _435 ? as_type<int>(_461) : as_type<int>(_433);
    int _465 = _311 ? 0 : 1;
    float _467 = _419 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _469 = !_451;
    float _471 = _469 ? _427 : as_type<float>(_459);
    float _473 = -_437;
    float _475 = _429 + _473;
    bool _477 = !_455;
    float _479 = _477 ? _433 : as_type<float>(_463);
    float _481 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[4].x, _467);
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _485 = _483 != 0;
    int _487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _489 = _487 != 0;
    int _491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _493 = _491 != 0;
    bool _495 = _319 > 0.0;
    float _497 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[4].z, _481);
    int _499 = ~_465;
    int _501 = _499 + 1;
    int _503 = _501 + 1;
    int _505 = _503;
    if (!_297)
    {
        int _507 = ~_465;
        int _509 = _507 + 1;
        _505 = _509;
    }
    int _511 = _505;
    float _513 = _497 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _515 = _319 >= 0.0;
    bool _517 = isnan(_319);
    bool _519 = _515 || _517;
    bool _521 = isnan(0.0);
    bool _523 = _519 || _521;
    float _525 = _419 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _527 = _419 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _529 = !_485;
    int _531 = _529 ? 0 : 1;
    float _533 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _535 = _513 + _533;
    int _537 = _523 ? 0 : 1;
    float _539 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[6].x, _527);
    bool _541 = !_489;
    int _543 = _541 ? 0 : 1;
    float _545 = fma(_417, (*spvDescriptorSet0.vp_c10)._m0[5].x, _525);
    bool _547 = _175 > 0.5;
    float _549 = _179 + _173;
    bool _551 = _261 >= 0.0;
    bool _553 = isnan(_261);
    bool _555 = _551 || _553;
    bool _557 = isnan(0.0);
    bool _559 = _555 || _557;
    float _561 = _165 + _179;
    int _563 = ~_537;
    int _565 = _563 + 1;
    int _567 = _565 + 1;
    float _569 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[5].z, _545);
    int _571 = _567;
    if (!_495)
    {
        int _573 = ~_537;
        int _575 = _573 + 1;
        _571 = _575;
    }
    int _577 = _571;
    float _579 = _165 + _173;
    int _581 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _583 = _581 != 0;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _587 = _585 != 0;
    float _589 = _561 + (-1.0);
    int _591 = _559 ? 0 : 1;
    float _593 = _579 + (-1.0);
    bool _595 = _261 > 0.0;
    float _597 = _549 + (-1.0);
    float _599 = _429 * 6.283185482025146484375;
    float _601 = _569 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _603 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _605 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _607 = _599 * 0.15915493667125701904296875;
    float _609 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[6].z, _539);
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _613 = _601 + _611;
    int _615 = ~_591;
    int _617 = _615 + 1;
    int _619 = _617 + 1;
    float _621 = _607 * 6.283185482025146484375;
    float _623 = cos(_621);
    int _625 = _619;
    bool _627 = _583;
    if (!_595)
    {
        int _629 = ~_591;
        int _631 = _629 + 1;
        _625 = _631;
    }
    int _633 = _625;
    float _635 = _609 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _637 = _613 * _613;
    float _639 = -_475;
    float _641 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _643 = _475 < 0.5;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _649 = _635 + _647;
    float _651 = fma(_535, _535, _637);
    bool _653 = !_493;
    int _655 = _653 ? 0 : 1;
    float _657 = -_635;
    float _659 = _657 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _661 = abs(_531);
    float _663 = fma(_649, _649, _651);
    float _665 = -_645;
    float _667 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _669 = abs(_655);
    float _671 = fma(_623, 0.5, 0.5);
    float _673 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _675 = rsqrt(_663);
    float _677 = float(_511);
    float _679 = float(_661);
    float _681 = -_671;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _685 = abs(_543);
    float _687 = _679 * _677;
    float _689 = floor(_259);
    float _691 = float(_577);
    float _693 = _535 * 0.0625;
    float _695 = float(_669);
    float _697 = _687 * (-2.0);
    float _699 = abs(_535);
    float _701 = abs(_659);
    float _703 = precise::max(_699, _701);
    float _705 = _613 * _675;
    float _707 = _695 * _691;
    bool _709 = _703 >= 16.0;
    float _711 = _649 * _675;
    float _713 = float(_633);
    float _715 = _707 * (-2.0);
    float _717 = _709 ? _693 : _535;
    float _719 = _535 * _675;
    float _721 = float(_685);
    float _723 = -_705;
    float _725 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _613);
    float _727 = fma(_673, _697, _673);
    float _729 = fma(_605, _715, _605);
    float _731 = _165 + (-0.5);
    float _733 = -_689;
    float _735 = _259 + _733;
    float _737 = _259 * 6.283185482025146484375;
    float _739 = -_719;
    float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[18].w, _535);
    float _743 = _725 * _725;
    float _745 = _721 * _713;
    float _747 = _731 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _749 = _737 * 0.15915493667125701904296875;
    float _751 = fma(_741, _741, _743);
    float _753 = _745 * (-2.0);
    float _755 = -_433;
    int _757 = _547 ? as_type<int>(_755) : as_type<int>(_433);
    float _759 = _659;
    float _761 = _719;
    if (_709)
    {
        float _763 = _659 * 0.0625;
        _759 = _763;
    }
    float _765 = _759;
    float _767 = fma(_727, _415, _747);
    float _769 = abs(_717);
    bool _771 = _769 != 0.0;
    bool _773 = isnan(_769);
    bool _775 = _771 || _773;
    bool _777 = isnan(0.0);
    bool _779 = _775 || _777;
    float _781 = _173 + (-0.5);
    float _783 = _749 * 6.283185482025146484375;
    float _785 = cos(_783);
    float _787 = fma(_603, _753, _603);
    float _789 = abs(_765);
    bool _791 = _789 == 0.0;
    bool _793 = !_779;
    bool _795 = _791 && _793;
    float _797 = -_711;
    float _799 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    float _801 = in.m_58.x;
    float _803 = in.m_58.y;
    float _805 = _781 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _807 = _179 + (-0.5);
    bool _809 = !_447;
    float _811 = _809 ? _433 : as_type<float>(_757);
    float _813 = fma(_799, _799, _751);
    bool _815 = _735 < 0.5;
    float _817 = float(_815);
    float _819 = _767 * 0.15915493667125701904296875;
    float _821 = abs(_765);
    bool _823 = _821 == 0.0;
    float _825 = -_735;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _829 = _807 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _831 = -_817;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _835 = sqrt(_813);
    bool _837 = !_583;
    int _839 = _837 ? 0 : 1;
    float _841 = fma(_785, 0.5, 0.5);
    int _843 = as_type<int>(_787);
    int _845 = _839;
    int _847 = _823 ? (-1) : 0;
    if (_795)
    {
        bool _849 = as_type<int>(_765) >= 0;
        _627 = _849;
    }
    bool _851 = _627;
    float _853 = fma(_787, _415, _829);
    float _855 = fma(_729, _415, _805);
    int _857 = abs(_839);
    float _859 = -_841;
    float _861 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _863 = _819 * 6.283185482025146484375;
    float _865 = sin(_863);
    if (_795)
    {
        int _867 = _851 ? 0 : 1078530011;
        _843 = _867;
    }
    int _869 = _843;
    int _871 = abs(_443);
    bool _873 = !_587;
    int _875 = _873 ? 0 : 1;
    if (_795)
    {
        int _877 = int(0x80000000) & as_type<int>(_717);
        int _879 = _869 | _877;
        _845 = _879;
    }
    int _881 = _845;
    bool _883 = !_779;
    bool _885 = _883 && _823;
    int _887 = _881;
    float _889 = as_type<float>(_881);
    if (!_885)
    {
        float _891 = abs(_717);
        bool _893 = _891 != as_type<float>(0x7f800000u /* inf */);
        bool _895 = isnan(_891);
        bool _897 = _893 || _895;
        bool _899 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _901 = _897 || _899;
        float _903 = abs(_765);
        bool _905 = _903 == as_type<float>(0x7f800000u /* inf */);
        float _907 = abs(_765);
        bool _909 = _907 == as_type<float>(0x7f800000u /* inf */);
        bool _911 = !_901;
        bool _913 = _909 && _911;
        if (_913)
        {
            bool _915 = as_type<int>(_765) >= 0;
            _847 = _915 ? (-1) : 0;
        }
        int _917 = _847;
        if (_913)
        {
            _887 = 1075235812;
        }
        int _919 = _887;
        int _921 = _919;
        if (_913)
        {
            int _923 = ~_917;
            int _925 = (_923 != 0) ? _919 : 1061752795;
            _921 = _925;
        }
        int _927 = _921;
        float _929 = as_type<float>(_927);
        if (_913)
        {
            int _931 = int(0x80000000) & as_type<int>(_717);
            int _933 = _927 | _931;
            _929 = as_type<float>(_933);
        }
        float _935 = _929;
        bool _937 = !_901;
        bool _939 = _937 && _905;
        _889 = _935;
        if (!_939)
        {
            float _941 = abs(_765);
            float _943 = abs(_717);
            float _945 = precise::max(_941, _943);
            float _947 = abs(_765);
            float _949 = abs(_717);
            float _951 = precise::min(_947, _949);
            float _953 = 1.0 / _945;
            float _955 = abs(_717);
            float _957 = abs(_765);
            bool _959 = _955 > _957;
            bool _961 = as_type<int>(_765) >= 0;
            float _963 = _951 * _953;
            float _965 = _963 * _963;
            float _967 = _965 + 11.33538818359375;
            float _969 = fma(_965, _967, 28.84246826171875);
            float _971 = fma(_965, _969, 19.6966705322265625);
            float _973 = fma(_965, -0.82336294651031494140625, -5.674867153167724609375);
            float _975 = fma(_965, _973, -6.565555095672607421875);
            float _977 = 1.0 / _971;
            float _979 = _965 * _975;
            float _981 = abs(_765);
            float _983 = abs(_717);
            float _985 = _981 + _983;
            int _987 = as_type<int>(_717) & int(0x80000000);
            float _989 = _963 * _979;
            bool _991 = _985 > as_type<float>(0x7f800000u /* inf */);
            bool _993 = isnan(_985);
            bool _995 = _991 || _993;
            bool _997 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _999 = _995 || _997;
            float _1001 = fma(_989, _977, _963);
            float _1003 = _1001;
            _889 = _985;
            if (_959)
            {
                float _1005 = -_1001;
                float _1007 = _1005 + 1.57079637050628662109375;
                _1003 = _1007;
            }
            float _1009 = _1003;
            int _1011 = as_type<int>(_1009);
            if (!_961)
            {
                float _1013 = -_1009;
                float _1015 = _1013 + 3.1415927410125732421875;
                _1011 = as_type<int>(_1015);
            }
            int _1017 = _1011;
            if (!_999)
            {
                int _1019 = _987 | _1017;
                _889 = as_type<float>(_1019);
            }
        }
    }
    float _1021 = _889;
    float _1023 = -_1021;
    float _1025 = _853 + _1023;
    float _1027 = _855 * 0.15915493667125701904296875;
    float _1029 = float(_857);
    float _1031 = _1025 * 0.15915493667125701904296875;
    int _1033 = abs(_875);
    float _1035 = _819 * 6.283185482025146484375;
    float _1037 = cos(_1035);
    float _1039 = float(_871);
    float _1041 = abs(_641);
    float _1043 = _1029 * _1041;
    float _1045 = abs(_827);
    float _1047 = _1029 * _1045;
    float _1049 = _675 * _835;
    float _1051 = fma(_1039, _683, _1043);
    float _1053 = float(_1033);
    float _1055 = fma(_1039, _861, _1047);
    float _1057 = _1027 * 6.283185482025146484375;
    float _1059 = cos(_1057);
    float _1061 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1063 = _1061 * 0.5;
    float _1065 = abs(_667);
    float _1067 = fma(_1053, _1065, _1051);
    float _1069 = abs(_833);
    float _1071 = fma(_1053, _1069, _1055);
    float _1073 = _801 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1075 = _803 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1077 = _1031 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = _1067 * _1073;
    float _1083 = _1071 * _1075;
    float _1085 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _433);
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _427);
    float _1089 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1091 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1093 = _1031 * 6.283185482025146484375;
    float _1095 = cos(_1093);
    float _1097 = _1049 * _1089;
    float _1099 = _1049 * _1091;
    float _1101 = _865 * _1059;
    float _1103 = _1097 * _1087;
    float _1105 = _1099 * _1085;
    float _1107 = _1027 * 6.283185482025146484375;
    float _1109 = sin(_1107);
    float _1111 = _1037 * _1079;
    float _1113 = _865 * _1079;
    float _1115 = _1101 * _1105;
    float _1117 = _1079 * _1059;
    float _1119 = _865 * _1095;
    float _1121 = _1037 * _1095;
    float _1123 = _1095 * _1059;
    float _1125 = _1037 * _1059;
    float _1127 = -_1111;
    float _1129 = fma(_1109, _1119, _1127);
    float _1131 = -_1105;
    float _1133 = _1109 * _1131;
    float _1135 = fma(_1109, _1113, _1121);
    float _1137 = fma(_1109, _1121, _1113);
    float _1139 = fma(_1129, _1103, _1115);
    float _1141 = fma(_1123, _1103, _1133);
    float _1143 = -_1119;
    float _1145 = fma(_1109, _1111, _1143);
    float _1147 = fma(_1135, _1063, _1139);
    float _1149 = fma(_1117, _1063, _1141);
    float _1151 = _635 + _1147;
    float _1153 = _513 + _1149;
    float _1155 = _1125 * _1105;
    float _1157 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1159 = _1151 + _1157;
    float _1161 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1163 = _1153 + _1161;
    float _1165 = fma(_1137, _1103, _1155);
    float _1167 = _1159 * _1159;
    float _1169 = fma(_1145, _1063, _1165);
    float _1171 = fma(_1163, _1163, _1167);
    float _1173 = _601 + _1169;
    float _1175 = sqrt(_1171);
    bool _1177 = _1175 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1179 = _1063;
    float _1181 = _1165;
    float _1183 = _1105;
    float _1185 = _1175;
    float _1187 = _1151;
    float _1189 = _1171;
    if (!_1177)
    {
        _1179 = _1153;
    }
    float _1191 = _1179;
    float _1193 = _1191;
    if (!_1177)
    {
        _1181 = _1151;
    }
    float _1195 = _1181;
    float _1197 = _1195;
    if (!_1177)
    {
        _1183 = _1173;
    }
    float _1199 = _1183;
    bool _1201 = !_1177;
    float _1203 = _1199;
    if (!_1201)
    {
        float _1205 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1209 = _1175 + _1207;
        float _1211 = rsqrt(_1171);
        float _1213 = _1209 * _1205;
        float _1215 = _1173 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1217 = _1213 * 0.15915493667125701904296875;
        float _1219 = _1217 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1217 * 6.283185482025146484375;
        float _1225 = cos(_1223);
        float _1227 = fma(_1221, _1215, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1229 = _1211 * _1227;
        float _1231 = _1225 + (-1.0);
        float _1233 = fma(_1163, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1235 = fma(_1159, _1229, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1237 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1239 = fma(_1173, _1225, _1237);
        _1203 = _1239;
        _1193 = _1233;
        _1197 = _1235;
        _1185 = _1217;
    }
    float _1241 = _1203;
    float _1243 = _1193;
    float _1245 = _1197;
    float _1247 = _1185;
    float _1249 = -_705;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1241);
    float _1253 = -_719;
    float _1255 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1243);
    float _1257 = -_711;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1245);
    float _1261 = -_719;
    float _1263 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[18].w, _513);
    float _1265 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1267 = _1251 + _1265;
    float _1269 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1271 = _1255 + _1269;
    float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1275 = _1259 + _1273;
    float _1277 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1279 = _1267 * _1267;
    float _1281 = -_711;
    float _1283 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[18].w, _635);
    float _1285 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1277);
    float _1287 = fma(_1271, _1271, _1279);
    float _1289 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1285);
    float _1291 = fma(_1275, _1275, _1287);
    float _1293 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1295 = rsqrt(_1291);
    float _1297 = sqrt(_1291);
    float _1299 = _1295 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1301 = _1271 * _1299;
    float _1303 = _1275 * _1299;
    float _1305 = _1301 * _1301;
    float _1307 = _1303 * _1303;
    float _1309 = _1305 + _1307;
    float _1311 = sqrt(_1309);
    bool _1313 = _1311 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1317 = _1311 + _1315;
    float _1319 = _1247;
    float _1321 = _1317;
    float _1323 = _1301;
    float _1325 = _1305;
    if (_1313)
    {
        float _1327 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1319 = _1327;
    }
    float _1329 = _1319;
    if (_1313)
    {
        float _1331 = rsqrt(_1309);
        _1187 = _1331;
    }
    float _1333 = _1187;
    float _1335 = _1333;
    if (_1313)
    {
        float _1337 = _1317 * _1329;
        _1321 = _1337;
    }
    float _1339 = _1321;
    float _1341 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1313)
    {
        float _1343 = _1339 * 0.15915493667125701904296875;
        _1189 = _1343;
    }
    float _1345 = _1189;
    float _1347 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1349 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1341);
    float _1351 = _1153;
    if (_1313)
    {
        float _1353 = _1345 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        _1351 = _1355;
    }
    float _1357 = _1351;
    float _1359 = precise::max(0.0, _1347);
    float _1361 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1349);
    float _1363 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1365 = _1359;
    if (_1313)
    {
        float _1367 = _1345 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        _1363 = _1369;
    }
    float _1371 = _1363;
    float _1373 = -_1299;
    float _1375 = -_1359;
    float _1377 = fma(_1267, _1373, _1375);
    float _1379 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_1313)
    {
        float _1381 = _1377 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1365 = _1381;
    }
    float _1383 = _1365;
    float _1385 = fma(_1263, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1387 = _1357;
    float _1389 = _1383;
    if (_1313)
    {
        float _1391 = fma(_1357, _1383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1387 = _1391;
    }
    float _1393 = _1387;
    float _1395 = _1393;
    if (!_1313)
    {
        _1389 = _1377;
    }
    float _1397 = _1389;
    float _1399 = _1397;
    if (_1313)
    {
        float _1401 = _1333 * _1393;
        _1395 = _1401;
    }
    float _1403 = _1395;
    float _1405 = floor(_1385);
    float _1407 = _1371;
    if (_1313)
    {
        float _1409 = _1371 + (-1.0);
        _761 = _1409;
    }
    float _1411 = _761;
    float _1413 = _1411;
    if (_1313)
    {
        float _1415 = _1301 * _1403;
        _1323 = _1415;
    }
    float _1417 = _1323;
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1421 = fma(_1297, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1419);
    float _1423 = precise::clamp(_1421, 0.0, 1.0);
    if (_1313)
    {
        float _1425 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1425;
    }
    float _1427 = _1335;
    if (!_1313)
    {
        _1413 = _1303;
    }
    float _1429 = _1413;
    float _1431 = _1429;
    if (_1313)
    {
        float _1433 = _1303 * _1403;
        _1431 = _1433;
    }
    float _1435 = _1431;
    if (_1313)
    {
        float _1437 = _1417 * _1417;
        _1325 = _1437;
    }
    float _1439 = _1325;
    if (_1313)
    {
        float _1441 = fma(_1377, _1371, _1427);
        _1399 = _1441;
    }
    float _1443 = _1399;
    if (!_1313)
    {
        _1407 = _1307;
    }
    float _1445 = _1407;
    float _1447 = _1445;
    if (_1313)
    {
        float _1449 = _1435 * _1435;
        _1447 = _1449;
    }
    float _1451 = _1447;
    float _1453 = fma(_1443, _1443, _1439);
    float _1455 = -_1423;
    float _1457 = _1455 + 1.0;
    float _1459 = _1453 + _1451;
    float _1461 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1463 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1465 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = abs(_1457);
    float _1469 = log2(_1467);
    float _1471 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1473 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1463);
    float _1475 = fma(_1255, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1477 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1473);
    float _1479 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1475);
    float _1481 = rsqrt(_1459);
    float _1483 = _1477 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1485 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1487 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1491 = -_1487;
    float _1493 = fma(_1491, _1461, 1.0);
    float _1495 = floor(_1471);
    float _1497 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1489);
    float _1499 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1497);
    float _1501 = _1481 * _1417;
    float _1503 = _1481 * _1443;
    float _1505 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1499);
    float _1507 = _1481 * _1435;
    float _1509 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1511 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1513 = 1.0 / _1505;
    float _1515 = -_1509;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1515);
    float _1519 = -_1405;
    float _1521 = _1385 + _1519;
    float _1523 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1525 = -_1495;
    float _1527 = _1471 + _1525;
    float _1529 = -_1507;
    float _1531 = fma(_1529, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1517);
    float _1533 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1535 = exp2(_1511);
    float _1537 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1523);
    float _1539 = fma(_1531, -0.5, 0.5);
    float _1541 = fma(_1531, 0.5, 0.5);
    float _1543 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1533);
    float _1545 = _1503 + 1.0;
    float _1547 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1537);
    float _1549 = fma(_1541, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1551 = log2(_1493);
    float _1553 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1543);
    float _1555 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1547);
    float _1557 = fma(_1541, _1549, -0.212114393711090087890625);
    float _1559 = _1555 * _1513;
    float _1561 = fma(_1541, _1557, 1.570728778839111328125);
    float _1563 = sqrt(_1539);
    float _1565 = -_1503;
    float _1567 = fma(_1535, _1545, _1565);
    float _1569 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1553);
    float _1571 = fma(_1567, 0.5, 0.5);
    float _1573 = _1569 * _1513;
    float _1575 = _1551 * 0.693147182464599609375;
    float _1577 = fma(_1573, -0.5, 0.5);
    float _1579 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1581 = _1563 * 0.636619746685028076171875;
    float _1583 = fma(_1559, 0.5, 0.5);
    float _1585 = -_1561;
    float _1587 = fma(_1581, _1585, 1.0);
    float2 _4768 = float2(_1521, _1527);
    float _1589 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4768, float2(0.0), isnan(_4768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4768, float2(0.0), isnan(_4768)), level(0.0)).x;
    float3 _4779 = float3(_1583, _1577, _1579);
    float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4779, float3(0.0), isnan(_4779)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4779, float3(0.0), isnan(_4779)), level(0.0)).x;
    float3 _4790 = float3(_1583, _1577, _1579);
    float4 _1594 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4790, float3(0.0), isnan(_4790)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4790, float3(0.0), isnan(_4790)), level(0.0)).xyzw;
    float _1596 = _1594.x;
    float _1598 = _1594.y;
    float _1600 = _1594.z;
    float _1602 = _1594.w;
    float2 _4806 = float2(_1587, _1571);
    float3 _1606 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4806, float2(0.0), isnan(_4806)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4806, float2(0.0), isnan(_4806)), level(0.0)).xyz;
    float _1608 = _1606.x;
    float _1610 = _1606.y;
    float _1612 = _1606.z;
    float _1614 = -_705;
    float _1616 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1620 = _165 > 0.5;
    float _1622 = -_401;
    float _1624 = _1622 + 1.0;
    float _1626 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1628 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1632 = _1630 != 0;
    float _1634 = -_407;
    float _1636 = _1634 + 1.0;
    float _1638 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1626);
    float _1640 = fma(_1263, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1628);
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1644 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1638);
    float _1646 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1640);
    float _1648 = -_427;
    int _1650 = _1620 ? as_type<int>(_1648) : as_type<int>(_427);
    float _1652 = -_323;
    float _1654 = _1652 + 1.0;
    float _1656 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1658 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1660 = !_1632;
    float _1662 = _1660 ? _427 : as_type<float>(_1650);
    float _1664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1668 = _1666 != 0;
    float _1670 = _1658 + _1656;
    int _1672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1674 = _1672 != 0;
    float _1676 = _1618 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1678 = _1662 + 0.5;
    float _1680 = 1.0 / _1656;
    float _1682 = fma(_1676, _1678, _243);
    bool _1684 = _179 > 0.5;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1688 = -_403;
    float _1690 = _1688 + 1.0;
    float _1692 = _1469 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1694 = -_397;
    float _1696 = _1694 + 1.0;
    float _1698 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1700 = _409 * (-0.15915493667125701904296875);
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1708 = -_1690;
    float _1710 = fma(_1662, _1708, _1682);
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1670 * _1680;
    float _1716 = _1714 * 0.5;
    float _1718 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1720 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1718);
    float _1722 = _1700 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1728 = -_433;
    int _1730 = _1684 ? as_type<int>(_1728) : as_type<int>(_433);
    float _1732 = _1726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1734 = !_1668;
    float _1736 = _1734 ? _433 : as_type<float>(_1730);
    float _1738 = 1.0 / _1720;
    out.m_60.x = _1698;
    out.m_60.y = _1732;
    out.m_60.z = _1712;
    out.m_60.w = _1704;
    float _1740 = _1700 * 6.283185482025146484375;
    float _1742 = cos(_1740);
    float _1744 = _479 * _1724;
    float _1746 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1748 = -_427;
    int _1750 = _435 ? as_type<int>(_1748) : as_type<int>(_427);
    float _1752 = _1736 + (-0.5);
    float _1754 = _1664 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1758 = !_1674;
    float _1760 = _1758 ? _427 : as_type<float>(_1750);
    float _1762 = -_1754;
    float _1764 = -_255;
    float _1766 = fma(_1762, _1752, _1764);
    float _1768 = _479 * _1742;
    float _1770 = -_1744;
    float _1772 = fma(_471, _1742, _1770);
    float _1774 = _1760 + 0.5;
    float _1776 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1780 = _1772 + 0.5;
    float _1782 = fma(_1746, _1774, _301);
    float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1786 = _1738 * _1784;
    float _1788 = fma(_471, _1724, _1768);
    float _1790 = fma(_1776, _1780, _289);
    float _1792 = _811 + (-0.5);
    float _1794 = fma(_1736, _1624, _1766);
    float _1796 = abs(_1786);
    float _1798 = log2(_1796);
    float _1800 = _1756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1802 = _1788 + (-0.5);
    float _1804 = -_1654;
    float _1806 = fma(_1760, _1804, _1782);
    float _1808 = -_1800;
    float _1810 = -_329;
    float _1812 = fma(_1808, _1792, _1810);
    float _1814 = -_433;
    float _1816 = _1814 + 0.5;
    float _1818 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1824 = -_1818;
    float _1826 = -_411;
    float _1828 = fma(_1824, _1802, _1826);
    float _1830 = _1820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1832 = _1798 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1834 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_62.y = _1816;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1840 = _433 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1842 = exp2(_1832);
    float _1844 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = -_405;
    float _1848 = _1846 + 1.0;
    float _1850 = fma(_811, _1636, _1812);
    bool _1852 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1854 = isnan(0.5);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1860 = _1856 || _1858;
    float _1862 = -_1696;
    float _1864 = fma(_1772, _1862, _1790);
    float _1866 = fma(_1788, _1848, _1828);
    out.m_64.x = _1830;
    out.m_64.y = _1834;
    out.m_64.z = _1844;
    out.m_64.w = _1838;
    float _1868 = exp2(_1692);
    float _1870 = -_1840;
    float _1872 = _1109 * _1870;
    float _1874 = _1125 * _1840;
    out.m_66.x = _1710;
    out.m_66.y = _1794;
    out.m_66.z = _1806;
    out.m_66.w = _1850;
    float _1876 = _427 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1878 = _1101 * _1840;
    float _1880 = fma(_1842, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1882 = precise::clamp(_1880, 0.0, 1.0);
    float _1884 = in.m_68.x;
    out.m_70.x = _1864;
    out.m_70.y = _1866;
    float _1886 = fma(_1882, -2.0, 3.0);
    float _1888 = _1882 * _1882;
    float _1890 = _1483 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1892 = _1786 <= 8000.0;
    bool _1894 = isnan(_1786);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(8000.0);
    bool _1900 = _1896 || _1898;
    float _1902 = float(_1900);
    float _1904 = _1505 * 0.5;
    float _1906 = _1888 * _1886;
    float _1908 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1890);
    float _1910 = fma(_1123, _1876, _1872);
    float _1912 = fma(_1137, _1876, _1874);
    float _1914 = -_1906;
    float _1916 = _1914 + 1.0;
    float _1918 = fma(_1379, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1908);
    float _1920 = fma(_1129, _1876, _1878);
    float _1922 = fma(_1569, -0.5, _1904);
    float _1924 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1906);
    float _1926 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1918);
    float _1928 = _1878;
    float _1930 = _1505;
    float _1932 = _1922;
    if (_1860)
    {
        _1928 = 1.0;
    }
    float _1934 = _1928;
    float _1936 = _1902 * _1924;
    float _1938 = _1926 + _1505;
    float _1940 = _1555 + _1505;
    float _1942 = _1938 * 0.5;
    float _1944 = _1940 * 0.5;
    float _1946 = _1934;
    float _1948 = _1944;
    if (!_1860)
    {
        float _1950 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1952 = _1950 * 0.15915493667125701904296875;
        float _1954 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1956 = _1952 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = _1954 * 0.15915493667125701904296875;
        float _1962 = _1952 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = 1.0 / _1958;
        float _1968 = _1960 * 6.283185482025146484375;
        float _1970 = cos(_1968);
        float _1972 = _1964 * _1966;
        float _1974 = _1960 * 6.283185482025146484375;
        float _1976 = sin(_1974);
        float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1980 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1978;
        float _1982 = _1970 * _1972;
        float _1984 = 1.0 / _1980;
        float _1986 = 1.0 / _1982;
        float _1988 = _1976 * _1986;
        float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1992 = fma(_1786, _1988, _1990);
        float _1994 = _1992 * _1984;
        float _1996 = precise::clamp(_1994, 0.0, 1.0);
        _1946 = _1996;
    }
    float _1998 = _1946;
    float _2000 = -_1868;
    float _2002 = _2000 + 1.0;
    float _2004 = _1135 + _1920;
    float _2006 = _1936 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2008 = -_1589;
    float _2010 = _2008 + 1.0;
    float _2012 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1555;
    out.gl_Position.y = _1569;
    out.gl_Position.z = _1926;
    out.gl_Position.w = _1505;
    float _2014 = _2010 * _2006;
    float _2016 = precise::clamp(_2014, 0.0, 1.0);
    float _2018 = _1117 + _1910;
    float _2020 = _1145 + _1912;
    out.m_72.x = _1255;
    out.m_72.y = _1251;
    out.m_72.z = _1259;
    bool _2022 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2024 = isnan(_1297);
    bool _2026 = _2022 || _2024;
    bool _2028 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2030 = _2026 || _2028;
    out.m_74.x = _2018;
    out.m_74.y = _2020;
    out.m_74.z = _2004;
    out.m_76.x = _1944;
    out.m_76.y = _1922;
    out.m_76.z = _1942;
    out.m_76.w = _1505;
    float _2032 = _2012 * _1591;
    float _2034 = -_2012;
    float _2036 = _2034 + 1.0;
    float _2038 = -_2016;
    float _2040 = fma(_2038, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2042 = _1602 * _2032;
    float _2044 = _1612 * _2032;
    float _2046 = _1602 * _2036;
    float _2048 = _2040 * _1884;
    float _2050 = fma(_1608, _2042, _1596);
    float _2052 = fma(_1610, _2042, _1598);
    float _2054 = fma(_1602, _2044, _1600);
    float _2056 = _2048 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2058 = _2032;
    float _2060 = _2042;
    float _2062 = _2056;
    if (!_2030)
    {
        _1930 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2064 = _1930;
    float _2066 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2068 = _2064;
    float _2070 = _2064;
    if (!_2030)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2072 = _1932;
    out.m_78.x = _2050;
    out.m_78.y = _2052;
    out.m_78.z = _2054;
    out.m_78.w = _2046;
    float _2074 = _2072;
    float _2076 = _2072;
    if (!_2030)
    {
        _1948 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2078 = _1948;
    float _2080 = _2078;
    float _2082 = _2078;
    if (!_2030)
    {
        _2058 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2084 = _2058;
    out.m_80.x = _2056;
    float _2086 = _2084;
    float _2088 = _2084;
    if (!_2030)
    {
        _2060 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2090 = _2060;
    float _2092 = _2090;
    float _2094 = _2090;
    if (!_2030)
    {
        _2062 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2096 = _2062;
    bool _2098 = !_2030;
    float _2100 = _2096;
    float _2102 = _2096;
    if (!_2098)
    {
        bool _2104 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2106 = isnan(_1297);
        bool _2108 = _2104 || _2106;
        bool _2110 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2112 = _2108 || _2110;
        if (!_2112)
        {
            float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2116 = _1297 + _2114;
            float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2120 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2118;
            float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2126 = 1.0 / _2120;
            float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2130 = _2128 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2134 = _2132 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2136 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2138 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2142 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2144 = _2116 * _2126;
            float _2146 = precise::clamp(_2144, 0.0, 1.0);
            float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2150 = _2148 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2152 = fma(_2146, _2124, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2154 = fma(_2146, _2150, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2156 = fma(_2146, _2130, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2158 = fma(_2146, _2134, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2160 = fma(_2146, _2138, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2162 = fma(_2146, _2142, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2082 = _2156;
            _2094 = _2160;
            _2076 = _2152;
            _2088 = _2158;
            _2070 = _2154;
            _2102 = _2162;
            _2164 = true;
        }
        else
        {
            bool _2166 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2168 = isnan(_1297);
            bool _2170 = _2166 || _2168;
            bool _2172 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2174 = _2170 || _2172;
            if (!_2174)
            {
                _2074 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2176 = _2074;
            _2076 = _2176;
            if (!_2174)
            {
                _2080 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2178 = _2080;
            _2082 = _2178;
            if (!_2174)
            {
                _2068 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2180 = _2068;
            _2070 = _2180;
            if (!_2174)
            {
                _2086 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2182 = _2086;
            _2088 = _2182;
            if (!_2174)
            {
                _2092 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2184 = _2092;
            _2094 = _2184;
            if (!_2174)
            {
                _2100 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2186 = _2100;
            bool _2188 = !_2174;
            _2102 = _2186;
            if (!_2188)
            {
                bool _2190 = _1297 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2192 = isnan(_1297);
                bool _2194 = _2190 || _2192;
                bool _2196 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2198 = _2194 || _2196;
                if (!_2198)
                {
                    float _2200 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2202 = _1297 + _2200;
                    float _2204 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2206 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2204;
                    float _2208 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2210 = _2208 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2212 = 1.0 / _2206;
                    float _2214 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2216 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2218 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2220 = _2218 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2222 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2224 = _2222 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2226 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2228 = _2226 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2230 = _2202 * _2212;
                    float _2232 = precise::clamp(_2230, 0.0, 1.0);
                    float _2234 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2236 = _2234 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2238 = fma(_2232, _2210, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2240 = fma(_2232, _2236, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2242 = fma(_2232, _2216, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2244 = fma(_2232, _2220, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2246 = fma(_2232, _2224, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2248 = fma(_2232, _2228, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2082 = _2242;
                    _2094 = _2246;
                    _2076 = _2238;
                    _2088 = _2244;
                    _2070 = _2240;
                    _2102 = _2248;
                    _2164 = true;
                }
                else
                {
                    _2082 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2094 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2076 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2088 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2070 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2102 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2164 = false;
    float _2250 = _2082;
    float _2252 = _2094;
    float _2254 = _2076;
    float _2256 = _2088;
    float _2258 = _2070;
    float _2260 = _2102;
    float _2262 = _2066 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2264 = fma(_2020, -0.5, 0.5);
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = -_2250;
    float _2270 = _2268 + _2252;
    float _2272 = -_2254;
    float _2274 = _2272 + _2256;
    out.m_82.x = 0.0;
    float _2276 = fma(_2266, _2270, _2250);
    float _2278 = -_2258;
    float _2280 = _2278 + _2260;
    float _2282 = fma(_2266, _2274, _2254);
    float _2284 = _2276 * 0.586610972881317138671875;
    bool _2286 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2288 = fma(_2266, _2280, _2258);
    out.m_49.x = _2262;
    float _2290 = fma(_2282, 0.298911988735198974609375, _2284);
    bool _2292 = _1998 > 0.0;
    bool _2294 = isnan(_1998);
    bool _2296 = _2292 || _2294;
    bool _2298 = isnan(0.0);
    bool _2300 = _2296 || _2298;
    float _2302 = fma(_2288, 0.114477999508380889892578125, _2290);
    float _2304 = -_2302;
    float _2306 = _2282 + _2304;
    float _2308 = -_2302;
    float _2310 = _2276 + _2308;
    float _2312 = -_2302;
    float _2314 = _2288 + _2312;
    float _2316 = fma(_2306, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2302);
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2302);
    float _2320 = fma(_2314, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2302);
    bool _2322 = !_2286;
    if (!_2322)
    {
        float _2324 = -_1251;
        float _2326 = _2324 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2328 = -_1255;
        float _2330 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2332 = -_1259;
        float _2334 = _2332 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2336 = _2326 * _2326;
        float _2338 = fma(_2330, _2330, _2336);
        float _2340 = fma(_2334, _2334, _2338);
        float _2342 = sqrt(_2340);
        float _2344 = rsqrt(_2340);
        float _2346 = -_2342;
        float _2348 = _2346 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2350 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2352 = precise::clamp(_2350, 0.0, 1.0);
        float _2354 = _2330 * _2344;
        float _2356 = _2326 * _2344;
        float _2358 = abs(_2352);
        float _2360 = log2(_2358);
        float _2362 = _2334 * _2344;
        float _2364 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2366 = _2020 * _2356;
        float _2368 = -_2356;
        float _2370 = -_2364;
        float _2372 = fma(_2368, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2370);
        float _2374 = fma(_2018, _2354, _2366);
        float _2376 = -_2362;
        float _2378 = fma(_2376, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2372);
        float _2380 = fma(_2004, _2362, _2374);
        float _2382 = precise::clamp(_2380, 0.0, 1.0);
        float _2384 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2386 = _2378 + _2384;
        float _2388 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2390 = _2386 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2392 = precise::clamp(_2390, 0.0, 1.0);
        float _2394 = exp2(_2388);
        float _2396 = _2394 * _2392;
        float _2398 = _2382 * _2396;
        float _2400 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2402 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2404 = _2398 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2400;
        out.m_82.y = _2402;
        out.m_82.z = _2404;
    }
    out.m_84.x = _2316;
    out.m_84.y = _2318;
    out.m_84.z = _2320;
    if (_2300)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2406 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2406;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

