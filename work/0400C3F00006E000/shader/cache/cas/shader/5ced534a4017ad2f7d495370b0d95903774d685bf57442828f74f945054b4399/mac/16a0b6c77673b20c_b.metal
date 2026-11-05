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
    float4 m_60 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_54 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _984 = false;
    bool _851 = false;
    bool _731 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3144 = as_type<float>(_111);
        out.gl_Position.z = _3144;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = 0.0;
    if (_125)
    {
        float _135 = float(_95);
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _113 = as_type<int>(_149);
    }
    int _151 = _113;
    float _153 = as_type<float>(_151);
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3215 = as_type<float>(_151);
        out.gl_Position.z = _3215;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = _157;
    if (!_173)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _153 = _179;
    }
    float _181 = _153;
    float _183 = 0.0;
    float _185 = _181;
    if (!_173)
    {
        float _187 = _129 * _129;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    if (!_173)
    {
        float _193 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _193;
    }
    float _195 = _185;
    int _197 = as_type<int>(_155) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_155) & 2;
    bool _203 = _201 != 0;
    bool _205 = !_203;
    int _207 = _205 ? (-1090519040) : 1056964608;
    bool _209 = !_199;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_173;
    float _215 = _195;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _157 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _157);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _131 = _235;
        _215 = _245;
        _133 = _233;
    }
    float _247 = _131;
    float _249 = _215;
    float _251 = _133;
    bool _253 = !_173;
    float _255 = _247;
    float _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _157 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _271;
        _257 = _265;
        _175 = _277;
    }
    float _279 = _255;
    float _281 = _257;
    float _283 = _175;
    float _285 = _281;
    float _287 = _279;
    if (!_173)
    {
        _285 = _129;
    }
    float _289 = _285;
    float _291 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _293 = _289;
    if (!_173)
    {
        float _295 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _295;
    }
    float _297 = _287;
    bool _299 = !_173;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _129 * _305;
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _307 * 0.693147182464599609375;
        float _319 = exp2(_309);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _129);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
    }
    float _333 = _301;
    bool _335 = !_173;
    if (!_335)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _129 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _293 = _355;
    }
    float _357 = _293;
    float _359 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _361 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_283, _161, _291);
    float _365 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_357, _161, _359);
    float _369 = fma(_283, _159, _361);
    float _371 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = fma(_357, _159, _365);
    float _377 = -_367;
    float _379 = _363 + _377;
    float _381 = fma(_283, _163, _371);
    float _383 = fma(_357, _163, _373);
    float _385 = -_375;
    float _387 = _369 + _385;
    float _389 = _379 * _379;
    float _391 = in.m_52.w;
    float _393 = -_383;
    float _395 = _381 + _393;
    float _397 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _399 = fma(_387, _387, _389);
    out.m_54.y = as_type<float>(_207);
    float _401 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _397);
    float _405 = fma(_395, _395, _399);
    float _407 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _409 = in.m_42.x;
    float _411 = in.m_42.y;
    float _413 = in.m_42.z;
    float _415 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _417 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _407);
    float _421 = sqrt(_405);
    float _423 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    bool _425 = _421 >= 9.9999999747524270787835121154785e-07;
    bool _427 = isnan(_421);
    bool _429 = _425 || _427;
    bool _431 = isnan(9.9999999747524270787835121154785e-07);
    bool _433 = _429 || _431;
    float _435 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _415);
    float _437 = fma(_369, _391, _409);
    float _439 = fma(_363, _391, _411);
    float _441 = fma(_381, _391, _413);
    float _443 = _363;
    float _445 = _391;
    float _447 = _423;
    if (_433)
    {
        _443 = _417;
    }
    float _449 = _443;
    float _451 = _449;
    if (_433)
    {
        _445 = _435;
    }
    float _453 = _445;
    float _455 = _453;
    if (!_433)
    {
        bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _459 = !_457;
        if (!_459)
        {
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
            float _479 = _473 * _473;
            float _481 = fma(_475, _475, _479);
            float _483 = fma(_477, _477, _481);
            float _485 = rsqrt(_483);
            float _487 = _485 * 9.9999999747524270787835121154785e-07;
            float _489 = _475 * _487;
            float _491 = _473 * _487;
            float _493 = _477 * _487;
            _455 = _491;
            _451 = _489;
            _447 = _493;
            _495 = true;
        }
        else
        {
            float _497 = _161 * _161;
            float _499 = fma(_159, _159, _497);
            float _501 = fma(_163, _163, _499);
            float _503 = sqrt(_501);
            bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
            bool _507 = isnan(_503);
            bool _509 = _505 || _507;
            bool _511 = isnan(9.9999999747524270787835121154785e-07);
            bool _513 = _509 || _511;
            if (!_513)
            {
                float _515 = _411 * _411;
                float _517 = fma(_409, _409, _515);
                float _519 = fma(_413, _413, _517);
                float _521 = sqrt(_519);
                bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
                bool _525 = isnan(_521);
                bool _527 = _523 || _525;
                bool _529 = isnan(9.9999999747524270787835121154785e-07);
                bool _531 = _527 || _529;
                if (!_531)
                {
                    float _533 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _533);
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _541 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _545 = _541 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _455 = _545;
                    _451 = _543;
                    _447 = _547;
                    _495 = true;
                }
                else
                {
                    float _549 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _551 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _555 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                    float _557 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                    float _559 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                    float _561 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                    float _563 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                    float _565 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                    float _567 = _561 * _561;
                    float _569 = fma(_563, _563, _567);
                    float _571 = fma(_565, _565, _569);
                    float _573 = rsqrt(_571);
                    float _575 = _573 * 9.9999999747524270787835121154785e-07;
                    float _577 = _563 * _575;
                    float _579 = _561 * _575;
                    float _581 = _565 * _575;
                    _455 = _579;
                    _451 = _577;
                    _447 = _581;
                    _495 = true;
                }
            }
            else
            {
                float _583 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _585 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _587 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _589 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
                float _591 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
                float _593 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
                float _595 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
                float _597 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _591);
                float _599 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _593);
                float _601 = _595 * _595;
                float _603 = fma(_597, _597, _601);
                float _605 = fma(_599, _599, _603);
                float _607 = rsqrt(_605);
                float _609 = _607 * 9.9999999747524270787835121154785e-07;
                float _611 = _597 * _609;
                float _613 = _595 * _609;
                float _615 = _599 * _609;
                _455 = _613;
                _451 = _611;
                _447 = _615;
            }
        }
    }
    _495 = false;
    float _617 = _455;
    float _619 = _451;
    float _621 = _447;
    float _623 = in.m_56.x;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _627 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _635 = _633 != 0;
    float _637 = _627 * _625;
    float _639 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[20].x, _637);
    float _641 = _639 * 6.283185482025146484375;
    float _643 = floor(_639);
    int _645 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _647 = _645 != 0;
    float _649 = _641 * 0.15915493667125701904296875;
    bool _651 = !_631;
    int _653 = _651 ? 0 : 1;
    bool _655 = !_635;
    int _657 = _655 ? 0 : 1;
    int _659 = abs(_653);
    float _661 = _649 * 6.283185482025146484375;
    float _663 = cos(_661);
    bool _665 = !_647;
    int _667 = _665 ? 0 : 1;
    int _669 = abs(_657);
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _673 = -_643;
    float _675 = _639 + _673;
    int _677 = abs(_667);
    float _679 = float(_659);
    float _681 = -_675;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _685 = _675 < 0.5;
    float _687 = float(_685);
    float _689 = float(_669);
    float _691 = abs(_683);
    float _693 = _679 * _691;
    float _695 = fma(_663, 0.5, 0.5);
    float _697 = float(_677);
    float _699 = -_687;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _703 = -_695;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _707 = fma(_697, _705, _693);
    float _709 = abs(_701);
    float _711 = fma(_689, _709, _707);
    bool _713 = !_671;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _717 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_95);
        float _735 = 1.0 / _733;
        float _737 = _129 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _743 = _739 + _741;
    float _745 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _747;
    bool _751 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _753 = isnan(_739);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = 1.0 / _749;
    bool _765 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _767 = isnan(_739);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _777;
    float _781 = _745 * _623;
    float _783 = -_761;
    float _785 = _783 + 1.0;
    bool _787 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _789 = _775 * _785;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _791;
    float _795 = trunc(_781);
    int _797 = int(_795);
    float _799 = -_775;
    float _801 = _799 + 1.0;
    float _803 = _743 * _763;
    float _805 = in.m_52.x;
    float _807 = in.m_52.y;
    float _809 = fma(_779, _803, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _811 = fma(_793, _803, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _813 = _809 * _789;
    float _815 = _811 * _789;
    int _817 = _797 << 4;
    int _819 = _817 + 1712;
    float _821 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].x, _813);
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].y, _815);
    float _825 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].x, _821);
    float _827 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].y, _823);
    float _829 = _825 * _805;
    float _831 = _827 * _807;
    bool _833 = !_787;
    float _849;
    if (!_833)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _837 = _623 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_95);
        float _855 = 1.0 / _853;
        float _857 = _129 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    uint _862 = uint(int(uint(_819) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[int(_872)][_874];
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _859 + _878;
    bool _882 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_859);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _898 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _900 = isnan(_859);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    int _910 = _819 + 8;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _920;
    float _924 = -_892;
    float _926 = _924 + 1.0;
    bool _928 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _930 = 1.0 / _896;
    float _932 = _908 * _926;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    float _938 = _922 * _930;
    float _940 = fma(_938, _880, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _942 = _940 * _932;
    float _944 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _946 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[116].x, _944);
    float _948 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _954 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _962 = !_928;
    float _980;
    float _982;
    if (!_962)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _966 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _968 = float(_95);
        float _970 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _972 = _970 * _964;
        float _974 = floor(_972);
        float _976 = -_974;
        float _978 = _972 + _976;
        _980 = _968;
        _982 = _978;
        _984 = true;
    }
    else
    {
        float _986 = float(_95);
        float _988 = 1.0 / _986;
        float _990 = _129 * _988;
        _980 = _986;
        _982 = _990;
    }
    _984 = false;
    float _992 = _980;
    float _994 = _982;
    float _996 = in.m_56.z;
    float _998 = _623 * 2.0;
    float _1000 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1002 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1004 = in.m_56.y;
    float _1006 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1008 = _617 * _617;
    float _1010 = floor(_998);
    float _1012 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1000);
    float _1014 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1002);
    float _1016 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1006);
    float _1018 = fma(_619, _619, _1008);
    float _1020 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1012);
    float _1022 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1014);
    float _1024 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1016);
    float _1026 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1028 = log2(_1026);
    float _1030 = fma(_621, _621, _1018);
    float _1032 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1034 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1038 = rsqrt(_1030);
    float _1040 = _996 * 2.0;
    float _1042 = _623 + _996;
    bool _1044 = _1010 > 0.0;
    float _1046 = _829 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1048 = _1004 * 2.0;
    bool _1050 = _1010 >= 0.0;
    bool _1052 = isnan(_1010);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan(0.0);
    bool _1058 = _1054 || _1056;
    float _1060 = _1042 + (-1.0);
    float _1062 = floor(_1040);
    float _1064 = _129 * _1028;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1076 = _1074 != 0;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_207));
    bool _1080 = !_1068;
    int _1082 = _1080 ? 0 : 1;
    float _1084 = floor(_1048);
    float _1086 = _1004 + _996;
    bool _1088 = !_1072;
    int _1090 = _1088 ? 0 : 1;
    float _1092 = _1038 * _617;
    float _1094 = _1086 + (-1.0);
    int _1096 = abs(_1090);
    float _1098 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1100 = _1062 > 0.0;
    float _1102 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1104 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1106 = _1062 >= 0.0;
    bool _1108 = isnan(_1062);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = in.m_58.x;
    float _1118 = in.m_58.y;
    float _1120 = in.m_58.z;
    float _1122 = _1038 * _621;
    float _1124 = exp2(_1064);
    bool _1126 = _1084 > 0.0;
    bool _1128 = _1084 >= 0.0;
    bool _1130 = isnan(_1084);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan(0.0);
    bool _1136 = _1132 || _1134;
    float _1138 = _1038 * _619;
    int _1140 = _1058 ? 0 : 1;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1144 = 1.0 + _1142;
    int _1146 = _1114 ? 0 : 1;
    float _1148 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1098);
    int _1150 = ~_1140;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = 1.0 / _1144;
    int _1158 = _1154;
    if (!_1044)
    {
        int _1160 = ~_1140;
        int _1162 = _1160 + 1;
        _1158 = _1162;
    }
    int _1164 = _1158;
    float _1166 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1148);
    int _1168 = ~_1146;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    float _1174 = -_1124;
    float _1176 = _1174 + 1.0;
    int _1178 = _1172;
    if (!_1100)
    {
        int _1180 = ~_1146;
        int _1182 = _1180 + 1;
        _1178 = _1182;
    }
    int _1184 = _1178;
    float _1186 = float(_1096);
    float _1188 = float(_1164);
    float _1190 = _1004 + (-0.5);
    bool _1192 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1200 = _1196 || _1198;
    int _1202 = abs(_1082);
    float _1204 = _1186 * _1188;
    float _1206 = _1200 ? _1176 : 0.0;
    int _1208 = _1136 ? 0 : 1;
    float _1210 = _1204 * (-2.0);
    float _1212 = float(_1202);
    float _1214 = _1206 * _1156;
    float _1216 = float(_1184);
    float _1218 = fma(_1210, _1118, _1118);
    int _1220 = ~_1208;
    int _1222 = _1220 + 1;
    int _1224 = _1222 + 1;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1032 + _1226;
    int _1230 = _1224;
    if (!_1126)
    {
        int _1232 = ~_1208;
        int _1234 = _1232 + 1;
        _1230 = _1234;
    }
    int _1236 = _1230;
    float _1238 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1218);
    float _1240 = _623 + _1004;
    float _1242 = fma(_1102, _1210, _1102);
    float _1244 = _1212 * _1216;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1034 + _1246;
    float _1250 = _1240 + (-1.0);
    float _1252 = _1228 * _1228;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1256 = _1036 + _1254;
    bool _1258 = !_1076;
    int _1260 = _1258 ? 0 : 1;
    float _1262 = _1244 * (-2.0);
    float _1264 = fma(_1248, _1248, _1252);
    bool _1266 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1268 = isnan(1.0);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1274 = _1270 || _1272;
    int _1276 = abs(_1260);
    float _1278 = fma(_1256, _1256, _1264);
    bool _1280 = !_1274;
    float _1282 = _1280 ? _129 : _1214;
    float _1284 = float(_1276);
    float _1286 = float(_1236);
    float _1288 = rsqrt(_1278);
    float _1290 = abs(_1166);
    bool _1292 = _1290 > 0.99989998340606689453125;
    float _1294 = fma(_1282, _1242, _1238);
    float _1296 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1298 = _1284 * _1286;
    float _1300 = _623 + (-0.5);
    float _1302 = fma(_1262, _1116, _1116);
    float _1304 = fma(_1296, _1262, _1296);
    float _1306 = _1298 * (-2.0);
    float _1308 = _1294 * 0.15915493667125701904296875;
    float _1310 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1302);
    float _1312 = fma(_1104, _1306, _1104);
    float _1314 = fma(_1306, _1120, _1120);
    float _1316 = _996 + (-0.5);
    float _1318 = fma(_1282, _1304, _1310);
    float _1320 = _1228 * _1288;
    float _1322 = _1248 * _1288;
    float _1324 = _1256 * _1288;
    float _1326 = _1302;
    float _1328 = _1318;
    float _1330 = _1282;
    if (_1292)
    {
        _1326 = 0.001000000047497451305389404296875;
    }
    float _1332 = _1326;
    float _1334 = -_1320;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1338 = -_1322;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1342 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1314);
    float _1344 = _1308 * 6.283185482025146484375;
    float _1346 = sin(_1344);
    float _1348 = _1336 * _1336;
    float _1350 = _1318 * 0.15915493667125701904296875;
    float _1352 = -_1324;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1356 = _1354;
    if (!_1292)
    {
        _1328 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1358 = _1328;
    float _1360 = fma(_1340, _1340, _1348);
    float _1362 = fma(_1282, _1312, _1342);
    float _1364 = _1358;
    if (_1292)
    {
        float _1366 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1308 * 6.283185482025146484375;
    float _1372 = cos(_1370);
    float _1374 = fma(_1354, _1354, _1360);
    if (!_1292)
    {
        _1356 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1376 = _1356;
    float _1378 = -_1368;
    float _1380 = _1122 * _1378;
    float _1382 = _1376;
    if (!_1292)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1384 = _1330;
    float _1386 = _1384;
    if (_1292)
    {
        float _1388 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1386 = _1388;
    }
    float _1390 = _1386;
    float _1392 = fma(_129, 0.014999999664723873138427734375, _623);
    float _1394 = _1350 * 6.283185482025146484375;
    float _1396 = sin(_1394);
    if (_1292)
    {
        float _1398 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1382 = _1398;
    }
    float _1400 = _1382;
    float _1402 = _1362 * 0.15915493667125701904296875;
    float _1404 = _1350 * 6.283185482025146484375;
    float _1406 = cos(_1404);
    float _1408 = -_1400;
    float _1410 = _1092 * _1408;
    float _1412 = -_1400;
    float _1414 = -_1380;
    float _1416 = fma(_1138, _1412, _1414);
    float _1418 = -_1390;
    float _1420 = _1138 * _1418;
    float _1422 = -_1390;
    float _1424 = -_1410;
    float _1426 = fma(_1122, _1422, _1424);
    float _1428 = _1416 * _1416;
    float _1430 = sqrt(_1374);
    float _1432 = _1396 * _1346;
    float _1434 = _1396 * _1372;
    float _1436 = fma(_1426, _1426, _1428);
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = cos(_1438);
    float _1442 = -_1368;
    float _1444 = -_1420;
    float _1446 = fma(_1092, _1442, _1444);
    float _1448 = _1406 * _1372;
    float _1450 = _1406 * _1346;
    float _1452 = fma(_1446, _1446, _1436);
    float _1454 = _1402 * 6.283185482025146484375;
    float _1456 = sin(_1454);
    float _1458 = _1288 * _1430;
    float _1460 = rsqrt(_1452);
    float _1462 = _1396 * _1440;
    float _1464 = _1372 * _1440;
    float _1466 = _1406 * _1440;
    float _1468 = _1346 * _1440;
    float _1470 = _1046 * _1458;
    float _1472 = _831 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1474 = _1466 * _1138;
    float _1476 = fma(_1456, _1448, _1432);
    float _1478 = fma(_1456, _1432, _1448);
    float _1480 = -_1450;
    float _1482 = fma(_1456, _1434, _1480);
    float _1484 = -_1434;
    float _1486 = fma(_1456, _1450, _1484);
    float _1488 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _1490 = floor(_1392);
    float _1492 = _1472 * _1458;
    float _1494 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1496 = _1494 * 0.5;
    float _1498 = _1426 * _1460;
    float _1500 = _1416 * _1460;
    float _1502 = _1446 * _1460;
    float _1504 = _1486 * _1122;
    float _1506 = _1470 * _1488;
    float _1508 = _1476 * _1122;
    float _1510 = _1138 * _1500;
    float _1512 = _1466 * _1122;
    float _1514 = fma(_1468, _1502, _1504);
    float _1516 = fma(_1464, _1502, _1508);
    float _1518 = -_1510;
    float _1520 = fma(_1092, _1498, _1518);
    float _1522 = -_1456;
    float _1524 = fma(_1522, _1502, _1512);
    float _1526 = -_1456;
    float _1528 = fma(_1526, _1498, _1474);
    float _1530 = fma(_1490, -0.1500000059604644775390625, 1.0);
    float _1532 = fma(_1482, _1520, _1516);
    float _1534 = fma(_1462, _1520, _1524);
    float _1536 = fma(_1478, _1520, _1514);
    float _1538 = _1476 * _1138;
    float _1540 = precise::max(_1530, 0.20000000298023223876953125);
    float _1542 = _1092 * _1502;
    float _1544 = _1492 * _1078;
    float _1546 = _1486 * _1138;
    float _1548 = precise::min(_1540, 1.0);
    float _1550 = -_1542;
    float _1552 = fma(_1122, _1500, _1550);
    float _1554 = fma(_1464, _1498, _1538);
    float _1556 = _1544 * _1534;
    float _1558 = fma(_1468, _1498, _1546);
    float _1560 = fma(_1462, _1552, _1528);
    float _1562 = fma(_1482, _1552, _1554);
    float _1564 = fma(_1506, _1532, _1556);
    float _1566 = fma(_1478, _1552, _1558);
    float _1568 = _1544 * _1560;
    float _1570 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1572 = fma(_1496, _1536, _1564);
    float _1574 = _1466 * _1092;
    float _1576 = fma(_1506, _1562, _1568);
    float _1578 = _1122 * _1498;
    float _1580 = fma(_1572, _1548, _1036);
    float _1582 = -_1456;
    float _1584 = fma(_1582, _1500, _1574);
    float _1586 = fma(_1496, _1566, _1576);
    float _1588 = _1476 * _1092;
    float _1590 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1580);
    float _1592 = -_1578;
    float _1594 = fma(_1138, _1502, _1592);
    float _1596 = fma(_1586, _1548, _1034);
    float _1598 = _1486 * _1092;
    float _1600 = fma(_1464, _1500, _1588);
    float _1602 = fma(_1462, _1594, _1584);
    float _1604 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1596);
    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1608 = _1590 + _1606;
    float _1610 = fma(_1468, _1500, _1598);
    float _1612 = fma(_1482, _1594, _1600);
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1616 = _1604 + _1614;
    float _1618 = _1608 * _1608;
    float _1620 = _1544 * _1602;
    float _1622 = fma(_1478, _1594, _1610);
    float _1624 = fma(_1616, _1616, _1618);
    float _1626 = fma(_1506, _1612, _1620);
    float _1628 = sqrt(_1624);
    float _1630 = fma(_1496, _1622, _1626);
    float _1632 = fma(_1630, _1548, _1032);
    float _1634 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1632);
    bool _1636 = _1628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1644 = _1642 != 0;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1648 = _1646 != 0;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1652 = _1650 != 0;
    bool _1654 = !_1644;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1640;
    int _1660 = _1658 ? 0 : 1;
    bool _1662 = !_1648;
    int _1664 = _1662 ? 0 : 1;
    bool _1666 = !_1652;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = _1610;
    float _1672 = _1604;
    float _1674 = _1590;
    float _1676 = _1588;
    float _1678 = _1496;
    if (!_1636)
    {
        _1670 = _1634;
    }
    float _1680 = _1670;
    bool _1682 = !_1636;
    float _1684 = _1680;
    if (!_1682)
    {
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1690 = _1628 + _1688;
        float _1692 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1694 = rsqrt(_1624);
        float _1696 = _1690 * _1686;
        float _1698 = _1696 * 0.15915493667125701904296875;
        float _1700 = _1698 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        float _1704 = _1698 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 + (-1.0);
        float _1710 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = fma(_1706, _1692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = fma(_1634, _1702, _1710);
        float _1716 = _1694 * _1712;
        float _1718 = fma(_1616, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1720 = fma(_1608, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1684 = _1714;
        _1672 = _1718;
        _1674 = _1720;
    }
    float _1722 = _1684;
    float _1724 = _1672;
    float _1726 = _1674;
    float _1728 = -_1320;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _1732 = -_1322;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1724);
    float _1736 = -_1324;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1726);
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1742 = _1730 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1746 = _1734 + _1744;
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1750 = _1738 + _1748;
    float _1752 = _1742 * _1742;
    float _1754 = fma(_1746, _1746, _1752);
    float _1756 = fma(_1750, _1750, _1754);
    float _1758 = rsqrt(_1756);
    float _1760 = sqrt(_1756);
    float _1762 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1764 = _1746 * _1762;
    float _1766 = _1750 * _1762;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 * _1766;
    float _1772 = _1768 + _1770;
    float _1774 = sqrt(_1772);
    bool _1776 = _1774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1780 = _1774 + _1778;
    float _1782 = _1750;
    float _1784 = _1772;
    float _1786 = _1780;
    float _1788 = _1742;
    if (_1776)
    {
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1790;
    }
    float _1792 = _1782;
    if (_1776)
    {
        float _1794 = rsqrt(_1772);
        _1784 = _1794;
    }
    float _1796 = _1784;
    if (_1776)
    {
        float _1798 = _1780 * _1792;
        _1786 = _1798;
    }
    float _1800 = _1786;
    if (_1776)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1676 = _1802;
    }
    float _1804 = _1676;
    float _1806 = _1752;
    float _1808 = _1804;
    if (_1776)
    {
        float _1810 = _1804 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1806 = _1812;
    }
    float _1814 = _1806;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = precise::max(0.0, _1816);
    float _1820 = _1758;
    float _1822 = _1818;
    float _1824 = _1816;
    if (_1776)
    {
        float _1826 = _1804 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        _1820 = _1828;
    }
    float _1830 = _1820;
    float _1832 = -_1762;
    float _1834 = -_1818;
    float _1836 = fma(_1742, _1832, _1834);
    if (!_1776)
    {
        _1822 = _1764;
    }
    float _1838 = _1822;
    float _1840 = _1838;
    if (_1776)
    {
        float _1842 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1842;
    }
    float _1844 = _1824;
    float _1846 = _1814;
    float _1848 = _1844;
    if (_1776)
    {
        float _1850 = fma(_1814, _1844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1846 = _1850;
    }
    float _1852 = _1846;
    float _1854 = _1852;
    if (!_1776)
    {
        _1848 = _1836;
    }
    float _1856 = _1848;
    float _1858 = _1856;
    float _1860 = _1830;
    if (_1776)
    {
        float _1862 = _1830 + (-1.0);
        _1788 = _1862;
    }
    float _1864 = _1788;
    float _1866 = _1864;
    if (_1776)
    {
        float _1868 = _1796 * _1852;
        _1678 = _1868;
    }
    float _1870 = _1678;
    if (!_1776)
    {
        _1854 = _1768;
    }
    float _1872 = _1854;
    float _1874 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1876 = _1872;
    if (_1776)
    {
        float _1878 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1878;
    }
    float _1880 = _1808;
    if (_1776)
    {
        float _1882 = _1764 * _1870;
        _1840 = _1882;
    }
    float _1884 = _1840;
    if (!_1776)
    {
        _1866 = _1766;
    }
    float _1886 = _1866;
    float _1888 = _1886;
    if (_1776)
    {
        float _1890 = _1766 * _1870;
        _1888 = _1890;
    }
    float _1892 = _1888;
    if (_1776)
    {
        float _1894 = fma(_1836, _1830, _1880);
        _1858 = _1894;
    }
    float _1896 = _1858;
    if (_1776)
    {
        float _1898 = _1884 * _1884;
        _1876 = _1898;
    }
    float _1900 = _1876;
    if (!_1776)
    {
        _1860 = _1770;
    }
    float _1902 = _1860;
    float _1904 = _1902;
    if (_1776)
    {
        float _1906 = _1892 * _1892;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1896, _1896, _1900);
    float _1912 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1914 = _1910 + _1908;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1918 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1916);
    float _1920 = precise::clamp(_1918, 0.0, 1.0);
    float _1922 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1874);
    float _1924 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1926 = -_1920;
    float _1928 = _1926 + 1.0;
    float _1930 = rsqrt(_1914);
    float _1932 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1922);
    float _1934 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1936 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1924);
    float _1938 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1940 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1934);
    float _1944 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1936);
    float _1946 = abs(_1928);
    float _1948 = log2(_1946);
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1952 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1938);
    float _1954 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1942);
    float _1956 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1958 = -_1950;
    float _1960 = fma(_1958, _1912, 1.0);
    float _1962 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1952);
    float _1964 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1966 = _1930 * _1884;
    float _1968 = _1930 * _1896;
    float _1970 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1972 = _1930 * _1892;
    float _1974 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1976 = _1962 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1978 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1970);
    float _1980 = log2(_1960);
    float _1982 = -_1974;
    float _1984 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1982);
    float _1986 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1988 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1978);
    float _1990 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1992 = -_1972;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1984);
    float _1996 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1998 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1988);
    float _2000 = exp2(_1986);
    float _2002 = fma(_1994, -0.5, 0.5);
    float _2004 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1990);
    float _2006 = fma(_1994, 0.5, 0.5);
    float _2008 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1996);
    float _2010 = _1968 + 1.0;
    float _2012 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2004);
    float _2014 = fma(_2006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2016 = 1.0 / _1998;
    float _2018 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2008);
    float _2020 = _1980 * 0.693147182464599609375;
    float _2022 = fma(_2006, _2014, -0.212114393711090087890625);
    float _2024 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2026 = fma(_2006, _2022, 1.570728778839111328125);
    float _2028 = sqrt(_2002);
    float _2030 = -_1968;
    float _2032 = fma(_2000, _2010, _2030);
    float _2034 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2012);
    float _2036 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2018);
    float _2038 = fma(_2032, 0.5, 0.5);
    float _2040 = _2034 * _2016;
    float _2042 = _2036 * _2016;
    float _2044 = fma(_2040, 0.5, 0.5);
    float _2046 = fma(_2042, -0.5, 0.5);
    float _2048 = _2028 * 0.636619746685028076171875;
    float _2050 = -_2026;
    float _2052 = fma(_2048, _2050, 1.0);
    float3 _6205 = float3(_2044, _2046, _2024);
    float _2054 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6205, float3(0.0), isnan(_6205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6205, float3(0.0), isnan(_6205)), level(0.0)).x;
    float3 _6216 = float3(_2044, _2046, _2024);
    float4 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6216, float3(0.0), isnan(_6216)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6216, float3(0.0), isnan(_6216)), level(0.0)).xyzw;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = _2057.w;
    float2 _6233 = float2(_2052, _2038);
    float3 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6233, float2(0.0), isnan(_6233)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6233, float2(0.0), isnan(_6233)), level(0.0)).xyz;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2079 = int(_2077);
    out.m_60.x = _954;
    out.m_60.y = _956;
    out.m_60.z = _960;
    out.m_60.w = _952;
    float _2081 = -_1320;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    int _2085 = abs(_1660);
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2089 = _2087 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2091 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2093 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan(0.5);
    bool _2099 = _2095 || _2097;
    float _2101 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2103 = int(_2101);
    float _2105 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2107 = _623 > 0.5;
    float _2109 = -_1322;
    float _2111 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    bool _2113 = _1004 > 0.5;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2117 = _2115 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2119 = 1.0 / _2089;
    float _2121 = float(_2079);
    float _2123 = -_1324;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2129 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.x = _1734;
    out.m_62.y = _1730;
    out.m_62.z = _1738;
    float _2131 = 1.0 / _2121;
    float _2133 = float(uint(_2103));
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2135;
    int _2139 = ~_2103;
    int _2141 = _2139 + 1;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2145 = _2143 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2147 = ~_2103;
    int _2149 = _2147 + 1;
    float _2151 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2129);
    out.m_64.y = _1492;
    float _2153 = 1.0 / _2133;
    float _2155 = _2137 * _2119;
    float _2157 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2151);
    float _2159 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2157);
    float _2161 = _129 * _2131;
    float _2163 = 1.0 / _992;
    int _2165 = as_type<int>(_2153) + (-2);
    float _2167 = trunc(_2161);
    int _2169 = int(_2167);
    float _2171 = 1.0 / _2117;
    float _2173 = float(uint(_2169));
    float _2175 = as_type<float>(_2165) * _2173;
    int _2177 = ~_2103;
    int _2179 = _2177 + 1;
    float _2181 = _2145 * _2171;
    int _2183 = _2103 + (-1);
    float _2185 = trunc(_2175);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    int _2191 = _2179 * int(_2189);
    int _2193 = _2191 + _2169;
    float _2195 = float(uint(_2193));
    float _2197 = as_type<float>(_2165) * _2195;
    float _2199 = in.m_56.w;
    float _2201 = trunc(_2197);
    float _2203 = precise::max(_2201, 0.0);
    uint _2205 = uint(_2203);
    int _2207 = int(_2189) + int(_2205);
    int _2209 = _2141 * _2207;
    int _2211 = _2209 + _2169;
    int _2213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2215 = _2213 != 0;
    float _2217 = float(_2103);
    bool _2219 = !_2215;
    float _2221 = _2219 ? 1.2345600128173828125 : 1.0;
    bool _2223 = !_2215;
    float _2225 = _2223 ? _1004 : _623;
    float _2227 = _129 * _2217;
    bool _2229 = uint(_2211) >= uint(_2103);
    float _2231 = float(_2169);
    float _2233 = _2221 * _2225;
    float _2235 = _2227 * _2163;
    bool _2237 = _2231 >= _2217;
    bool _2239 = isnan(_2231);
    bool _2241 = _2237 || _2239;
    bool _2243 = isnan(_2217);
    bool _2245 = _2241 || _2243;
    float _2247 = float(_2245);
    float _2249 = floor(_2233);
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2255 = _2199 > 0.5;
    float _2257 = _623 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2259 = !_2229;
    int _2261 = _2259 ? 0 : (-1);
    float _2263 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2265 = _2103 == 0;
    float _2267 = trunc(_2247);
    int _2269 = int(_2267);
    int _2271 = ~_2207;
    int _2273 = _2271 + _2261;
    int _2275 = _2273 + 1;
    float _2277 = -_2263;
    float _2279 = fma(_2257, 2.0, _2277);
    int _2281 = _2103 * _2275;
    int _2283 = _2281 + _2169;
    int _2285 = abs(_1656);
    float _2287 = 1.0 / _2253;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2291 = -_2249;
    float _2293 = _2233 + _2291;
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2295;
    float _2299 = fma(_2105, -2.0, _2289);
    bool _2301 = !_2265;
    int _2303 = _2301 ? _2283 : (-1);
    float _2305 = _2293 * _2217;
    int _2307 = ~_2269;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    float _2313 = trunc(_2235);
    int _2315 = int(_2313);
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2319 = _2303 * _2311;
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2323 = _2321 != 0;
    float _2325 = _2297 * _2287;
    float _2327 = trunc(_2305);
    int _2329 = int(_2327);
    float _2331 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2317);
    int _2333 = _2269 * _2183;
    int _2335 = _2333 + _2319;
    bool _2337 = !_2323;
    float _2339 = _2337 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2341 = _996 > 0.5;
    int _2343 = _2335 * _2285;
    int _2345 = abs(as_type<int>(_2339));
    float _2347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2349 = as_type<float>(_2335);
    float _2351 = _2339;
    float _2353 = as_type<float>(_2269);
    if (!_2215)
    {
        _2349 = _996;
    }
    float _2355 = _2349;
    float _2357 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2331);
    float _2359 = _2355;
    if (!_2215)
    {
        _2351 = _996;
    }
    float _2361 = _2351;
    float _2363 = _2361;
    if (!_2215)
    {
        _2353 = _1004;
    }
    float _2365 = _2353;
    int _2367 = _2329 * _2345;
    int _2369 = _2367 + _2169;
    float _2371 = _2365;
    if (_2215)
    {
        _2371 = _623;
    }
    float _2373 = _2371;
    int _2375 = _2315 * _2085;
    int _2377 = _2375 + _2343;
    if (_2215)
    {
        _2359 = _1004;
    }
    float _2379 = _2359;
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2383 = _994 + _2381;
    if (_2215)
    {
        _2363 = _1004;
    }
    float _2385 = _2363;
    float _2387 = -_211;
    int _2389 = _2107 ? as_type<int>(_2387) : as_type<int>(_211);
    float _2391 = _2347 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2395 = _2393 != 0;
    float _2397 = -_129;
    float _2399 = fma(_2397, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2279);
    int _2401 = abs(_1664);
    float _2403 = fma(_2181, _2383, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2405 = abs(_1668);
    float _2407 = _2379 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2409 = !_2395;
    float _2411 = _2409 ? _211 : as_type<float>(_2389);
    int _2413 = _2369 * _2401;
    int _2415 = _2413 + _2377;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2419 = _994 + _2417;
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2423 = _2421 != 0;
    float _2425 = _2411 + 0.5;
    int _2427 = _2329 * _2405;
    int _2429 = _2427 + _2415;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2433 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2299);
    float _2435 = fma(_2391, _2425, _2399);
    float _2437 = -as_type<float>(_207);
    int _2439 = _2113 ? as_type<int>(_2437) : _207;
    float _2441 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2431);
    float _2443 = float(uint(_2429));
    float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2447 = fma(_2155, _2419, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2449 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2451 = _994 + _2449;
    float _2453 = as_type<float>(_2165) * _2443;
    bool _2455 = !_2423;
    float _2457 = _2455 ? as_type<float>(_207) : as_type<float>(_2439);
    float _2459 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2461 = float(uint(_2369));
    float _2463 = trunc(_2453);
    float _2465 = precise::max(_2463, 0.0);
    uint _2467 = uint(_2465);
    float _2469 = fma(_2325, _2451, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2471 = ~_2103;
    int _2473 = _2471 + 1;
    float _2475 = _2457 + (-0.5);
    float _2477 = fma(_2385, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2459);
    float _2479 = as_type<float>(_2165) * _2461;
    bool _2481 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2483 = isnan(_994);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2441);
    float _2495 = _2445 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2497 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2499 = isnan(_994);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2477);
    float _2511 = trunc(_2479);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    float _2517 = -_2495;
    float _2519 = -_2433;
    float _2521 = fma(_2517, _2475, _2519);
    bool _2523 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2525 = isnan(_994);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2531 = _2527 || _2529;
    float _2533 = float(_2531);
    float _2535 = -_2507;
    float _2537 = _2535 + 1.0;
    bool _2539 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2541 = isnan(_994);
    bool _2543 = _2539 || _2541;
    bool _2545 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2547 = _2543 || _2545;
    float _2549 = float(_2547);
    int _2551 = _2473 * int(_2467);
    int _2553 = _2551 + _2429;
    float _2555 = -_2533;
    float _2557 = _2555 + 1.0;
    float _2559 = _2533 * _2537;
    float _2561 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2127);
    float _2563 = float(uint(_2553));
    float _2565 = _2491 * _2557;
    float _2567 = -_2491;
    float _2569 = _2567 + 1.0;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2573 = as_type<float>(_2165) * _2563;
    float _2575 = _2549 * _2569;
    int _2577 = _2473 * int(_2515);
    int _2579 = _2577 + _2369;
    float _2581 = -_2549;
    float _2583 = _2581 + 1.0;
    float _2585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2587 = _2447 * _2575;
    float _2589 = trunc(_2573);
    float _2591 = precise::max(_2589, 0.0);
    uint _2593 = uint(_2591);
    float _2595 = fma(_2407, -2.0, _2571);
    float _2597 = float(uint(_2579));
    float _2599 = fma(_2583, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2587);
    float _2601 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2603 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2607 = _2605 != 0;
    float _2609 = as_type<float>(_2165) * _2597;
    float _2611 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2601);
    float _2613 = -_211;
    int _2615 = _2341 ? as_type<int>(_2613) : as_type<int>(_211);
    float _2617 = -_2585;
    float _2619 = fma(_2603, 2.0, _2617);
    float _2621 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2561);
    float _2623 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2611);
    bool _2625 = !_2607;
    float _2627 = _2625 ? _211 : as_type<float>(_2615);
    float _2629 = -_129;
    float _2631 = fma(_2629, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2619);
    float _2633 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2635 = int(_2467) + int(_2593);
    float _2637 = _2623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2639 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2595);
    float _2641 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2633);
    float _2643 = fma(_2403, _2565, _2599);
    int _2645 = _2149 * _2635;
    int _2647 = _2645 + _2429;
    float _2649 = 1.0 / _2637;
    float _2651 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2641);
    float _2653 = _2627 + 0.5;
    float _2655 = -_2621;
    float _2657 = _2655 + 1.0;
    bool _2659 = uint(_2647) >= uint(_2103);
    float _2661 = _2651 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2663 = fma(_2653, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2631);
    float _2665 = -as_type<float>(_207);
    float _2667 = _2255 ? _2665 : as_type<float>(_207);
    float _2669 = trunc(_2609);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    bool _2675 = !_2659;
    int _2677 = _2675 ? 0 : (-1);
    float _2679 = _2661 + _2637;
    int _2681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2683 = _2681 != 0;
    float _2685 = -_2509;
    float _2687 = _2685 + 1.0;
    int _2689 = ~_2635;
    int _2691 = _2689 + _2677;
    int _2693 = _2691 + 1;
    float _2695 = -_2657;
    float _2697 = fma(_2627, _2695, _2663);
    bool _2699 = !_2683;
    float _2701 = _2699 ? as_type<float>(_207) : _2667;
    float _2703 = _2679 * _2649;
    float _2705 = _2703 * 0.5;
    int _2707 = ~_2103;
    int _2709 = _2707 + 1;
    int _2711 = _2103 * _2693;
    int _2713 = _2711 + _2429;
    float _2715 = _2667;
    float _2717 = _2705;
    float _2719 = _2631;
    if (!_2099)
    {
        _2715 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2721 = _2715;
    float _2723 = -_2493;
    float _2725 = _2723 + 1.0;
    float _2727 = as_type<float>(_207) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2729 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2731 = !_2265;
    int _2733 = _2731 ? _2713 : (-1);
    float _2735 = _2721;
    if (!_2099)
    {
        float _2737 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2739 = fma(_2705, _2721, _2737);
        _2735 = _2739;
    }
    float _2741 = _2735;
    float _2743 = fma(_2457, _2725, _2521);
    int _2745 = _2733 >> 31;
    float _2747 = _1602 * _2727;
    int _2749 = int(_2515) + int(_2673);
    float _2751 = _2701 + (-0.5);
    int _2753 = _2745 & 3;
    float _2755 = -_2357;
    float _2757 = _2755 + 1.0;
    if (!_2099)
    {
        _2717 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2759 = _2717;
    float _2761 = _2741;
    if (!_2099)
    {
        float _2763 = 1.0 / _2741;
        _2761 = _2763;
    }
    float _2765 = _2761;
    int _2767 = _2733 + _2753;
    int _2769 = _2709 * _2749;
    int _2771 = _2769 + _2369;
    float _2773 = -_2751;
    float _2775 = -_2639;
    float _2777 = fma(_2773, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2775);
    if (!_2099)
    {
        float _2779 = -_2759;
        float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2719 = _2781;
    }
    float _2783 = _2719;
    int _2785 = _2767 >> 2;
    float _2787 = -_2757;
    float _2789 = fma(_2411, _2787, _2435);
    bool _2791 = uint(_2771) >= uint(_2103);
    float _2793 = fma(_2701, _2687, _2777);
    int _2795 = _2785 << 4;
    int _2797 = _2795 + 512;
    float _2799 = _2783;
    float _2801 = _2789;
    if (!_2099)
    {
        float _2803 = 1.0 / _2783;
        _2799 = _2803;
    }
    float _2805 = _2799;
    bool _2807 = !_2791;
    int _2809 = _2807 ? 0 : (-1);
    float _2811 = fma(_1612, _2729, _2747);
    uint _2813 = uint(int(uint(_2797) >> uint(2)));
    uint _2815 = uint(int(uint(int(_2813)) >> uint(2)));
    int _2817 = int(_2813) & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    int _2821 = int(_2813) + 1;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    int _2825 = _2821 & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    int _2829 = _2733 & 3;
    bool _2831 = _2829 != 0;
    out.m_66.x = _2789;
    out.m_66.y = _2743;
    out.m_66.z = _2697;
    out.m_66.w = _2793;
    float _2833 = _2765;
    if (!_2099)
    {
        float _2835 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2837 = -_2759;
        float _2839 = fma(_2765, _2835, _2837);
        _2833 = _2839;
    }
    float _2841 = _2833;
    int _2843 = ~_2749;
    int _2845 = _2843 + _2809;
    int _2847 = _2845 + 1;
    float _2849 = _1622 + _2811;
    int _2851 = _2733 & 3;
    bool _2853 = _2851 != 0;
    float _2855 = fma(_2469, _2559, _2643);
    int _2857 = _2797 + 8;
    uint _2859 = uint(int(uint(_2857) >> uint(2)));
    uint _2861 = uint(int(uint(int(_2859)) >> uint(2)));
    int _2863 = int(_2859) & 3;
    float _2865 = (*spvDescriptorSet0.vp_c9)._m0[int(_2861)][_2863];
    int _2867 = int(_2859) + 1;
    uint _2869 = uint(int(uint(_2867) >> uint(2)));
    int _2871 = _2867 & 3;
    float _2873 = (*spvDescriptorSet0.vp_c9)._m0[int(_2869)][_2871];
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2877 = _2875 != 0;
    int _2879 = _2103 * _2847;
    int _2881 = _2879 + _2369;
    bool _2883 = uint(_2851) > 1u;
    float _2885 = fma(_2507, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2855);
    float _2887 = _2841;
    if (!_2099)
    {
        float _2889 = _2841 * _2805;
        float _2891 = precise::clamp(_2889, 0.0, 1.0);
        _2887 = _2891;
    }
    float _2893 = _2887;
    bool _2895 = !_2265;
    int _2897 = _2895 ? _2881 : (-1);
    float _2899 = _1560 * _2727;
    int _2901 = _2831 ? 0 : 1;
    float _2903 = _1534 * _2727;
    bool _2905 = _2851 != 3;
    float _2907 = fma(_1562, _2729, _2899);
    if (_2099)
    {
        _2801 = 1.0;
    }
    float _2909 = _2801;
    float _2911 = _2909;
    if (!_2099)
    {
        float _2913 = -_2893;
        float _2915 = _2913 + 1.0;
        _2911 = _2915;
    }
    float _2917 = _2911;
    bool _2919 = uint(_2851) >= 2u;
    float _2921 = fma(_1532, _2729, _2903);
    int _2923 = ~_2901;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    float _2929 = _2885 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2931 = _2927;
    if (!_2883)
    {
        int _2933 = ~_2901;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    float _2939 = _1536 + _2921;
    int _2941 = _2919 ? 0 : 1;
    bool _2943 = !_2853;
    int _2945 = _2943 ? 0 : 1;
    out.m_68.w = _2929;
    int _2947 = abs(_2937);
    bool _2949 = _2851 != 3;
    int _2951 = ~_2941;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    int _2957 = abs(_2945);
    int _2959 = _2955;
    if (_2905)
    {
        int _2961 = ~_2941;
        int _2963 = _2961 + 1;
        _2959 = _2963;
    }
    int _2965 = _2959;
    bool _2967 = !_2949;
    int _2969 = _2967 ? 0 : (-1);
    int _2971 = abs(_2965);
    int _2973 = abs(_2969);
    int _2975 = ~_2957;
    int _2977 = _2975 + 1;
    int _2979 = _2977 + 1;
    float _2981 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2983 = ~_2947;
    int _2985 = _2983 + 1;
    int _2987 = _2985 + 1;
    float _2989 = _1566 + _2907;
    int _2991 = ~_2971;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    bool _2997 = _2917 > 0.0;
    bool _2999 = isnan(_2917);
    bool _3001 = _2997 || _2999;
    bool _3003 = isnan(0.0);
    bool _3005 = _3001 || _3003;
    float _3007 = exp2(_2981);
    int _3009 = _2987 * as_type<int>(_2827);
    bool _3011 = !_2877;
    int _3013 = _3011 ? 0 : 1;
    out.m_70.x = _2989;
    out.m_70.y = _2849;
    out.m_70.z = _2939;
    int _3015 = _2979 * as_type<int>(_2819);
    int _3017 = _3015 + _3009;
    int _3019 = abs(_3013);
    int _3021 = ~_2973;
    int _3023 = _3021 + 1;
    int _3025 = _3023 + 1;
    int _3027 = _2995 * as_type<int>(_2865);
    int _3029 = _3027 + _3017;
    float _3031 = _2917 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3033 = _3025 * as_type<int>(_2873);
    int _3035 = _3033 + _3029;
    int _3037 = ~_3019;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    float _3043 = _711 * _3031;
    float _3045 = -_3007;
    float _3047 = _3045 + 1.0;
    int _3049 = _3035 * _3041;
    float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3053 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3055 = _2159 + _3053;
    float _3057 = _3043 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _3059 = _2897 * _3019;
    int _3061 = _3059 + _3049;
    float _3063 = _3051 * _2054;
    float _3065 = _1998 + _3055;
    float _3067 = -_3051;
    float _3069 = _3067 + 1.0;
    out.gl_Position.x = _2034;
    out.gl_Position.y = _2036;
    out.gl_Position.z = _3055;
    out.gl_Position.w = _1998;
    float _3071 = _2065 * _3063;
    float _3073 = _2075 * _3063;
    float _3075 = _3065 * 0.5;
    float _3077 = float(_3061);
    float _3079 = fma(_2071, _3071, _2059);
    float _3081 = fma(_2073, _3071, _2061);
    float _3083 = _2065 * _3069;
    float _3085 = fma(_2065, _3073, _2063);
    out.m_72.z = _3075;
    out.m_72.w = _1998;
    out.m_74.y = _3077;
    out.m_45.x = _3057;
    out.m_76.x = _3079;
    out.m_76.y = _3081;
    out.m_76.z = _3085;
    out.m_76.w = _3083;
    if (_3005)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3087;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _984 = false;
    bool _851 = false;
    bool _731 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3144 = as_type<float>(_111);
        out.gl_Position.z = _3144;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = 0.0;
    if (_125)
    {
        float _135 = float(_95);
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _113 = as_type<int>(_149);
    }
    int _151 = _113;
    float _153 = as_type<float>(_151);
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3215 = as_type<float>(_151);
        out.gl_Position.z = _3215;
    }
    if (_143)
    {
        return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = _157;
    if (!_173)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _153 = _179;
    }
    float _181 = _153;
    float _183 = 0.0;
    float _185 = _181;
    if (!_173)
    {
        float _187 = _129 * _129;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    if (!_173)
    {
        float _193 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _193;
    }
    float _195 = _185;
    int _197 = as_type<int>(_155) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_155) & 2;
    bool _203 = _201 != 0;
    bool _205 = !_203;
    int _207 = _205 ? (-1090519040) : 1056964608;
    bool _209 = !_199;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_173;
    float _215 = _195;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _157 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _157);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _131 = _235;
        _215 = _245;
        _133 = _233;
    }
    float _247 = _131;
    float _249 = _215;
    float _251 = _133;
    bool _253 = !_173;
    float _255 = _247;
    float _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _157 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _271;
        _257 = _265;
        _175 = _277;
    }
    float _279 = _255;
    float _281 = _257;
    float _283 = _175;
    float _285 = _281;
    float _287 = _279;
    if (!_173)
    {
        _285 = _129;
    }
    float _289 = _285;
    float _291 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _293 = _289;
    if (!_173)
    {
        float _295 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _295;
    }
    float _297 = _287;
    bool _299 = !_173;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _129 * _305;
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _307 * 0.693147182464599609375;
        float _319 = exp2(_309);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _129);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
    }
    float _333 = _301;
    bool _335 = !_173;
    if (!_335)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _129 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _293 = _355;
    }
    float _357 = _293;
    float _359 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _361 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_283, _161, _291);
    float _365 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_357, _161, _359);
    float _369 = fma(_283, _159, _361);
    float _371 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = fma(_357, _159, _365);
    float _377 = -_367;
    float _379 = _363 + _377;
    float _381 = fma(_283, _163, _371);
    float _383 = fma(_357, _163, _373);
    float _385 = -_375;
    float _387 = _369 + _385;
    float _389 = _379 * _379;
    float _391 = in.m_52.w;
    float _393 = -_383;
    float _395 = _381 + _393;
    float _397 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _399 = fma(_387, _387, _389);
    out.m_54.y = as_type<float>(_207);
    float _401 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _397);
    float _405 = fma(_395, _395, _399);
    float _407 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _409 = in.m_42.x;
    float _411 = in.m_42.y;
    float _413 = in.m_42.z;
    float _415 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _417 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _407);
    float _421 = sqrt(_405);
    float _423 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    bool _425 = _421 >= 9.9999999747524270787835121154785e-07;
    bool _427 = isnan(_421);
    bool _429 = _425 || _427;
    bool _431 = isnan(9.9999999747524270787835121154785e-07);
    bool _433 = _429 || _431;
    float _435 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _415);
    float _437 = fma(_369, _391, _409);
    float _439 = fma(_363, _391, _411);
    float _441 = fma(_381, _391, _413);
    float _443 = _363;
    float _445 = _391;
    float _447 = _423;
    if (_433)
    {
        _443 = _417;
    }
    float _449 = _443;
    float _451 = _449;
    if (_433)
    {
        _445 = _435;
    }
    float _453 = _445;
    float _455 = _453;
    if (!_433)
    {
        bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _459 = !_457;
        if (!_459)
        {
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
            float _479 = _473 * _473;
            float _481 = fma(_475, _475, _479);
            float _483 = fma(_477, _477, _481);
            float _485 = rsqrt(_483);
            float _487 = _485 * 9.9999999747524270787835121154785e-07;
            float _489 = _475 * _487;
            float _491 = _473 * _487;
            float _493 = _477 * _487;
            _455 = _491;
            _451 = _489;
            _447 = _493;
            _495 = true;
        }
        else
        {
            float _497 = _161 * _161;
            float _499 = fma(_159, _159, _497);
            float _501 = fma(_163, _163, _499);
            float _503 = sqrt(_501);
            bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
            bool _507 = isnan(_503);
            bool _509 = _505 || _507;
            bool _511 = isnan(9.9999999747524270787835121154785e-07);
            bool _513 = _509 || _511;
            if (!_513)
            {
                float _515 = _411 * _411;
                float _517 = fma(_409, _409, _515);
                float _519 = fma(_413, _413, _517);
                float _521 = sqrt(_519);
                bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
                bool _525 = isnan(_521);
                bool _527 = _523 || _525;
                bool _529 = isnan(9.9999999747524270787835121154785e-07);
                bool _531 = _527 || _529;
                if (!_531)
                {
                    float _533 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _533);
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _541 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _545 = _541 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _455 = _545;
                    _451 = _543;
                    _447 = _547;
                    _495 = true;
                }
                else
                {
                    float _549 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _551 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _555 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                    float _557 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                    float _559 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                    float _561 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                    float _563 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                    float _565 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                    float _567 = _561 * _561;
                    float _569 = fma(_563, _563, _567);
                    float _571 = fma(_565, _565, _569);
                    float _573 = rsqrt(_571);
                    float _575 = _573 * 9.9999999747524270787835121154785e-07;
                    float _577 = _563 * _575;
                    float _579 = _561 * _575;
                    float _581 = _565 * _575;
                    _455 = _579;
                    _451 = _577;
                    _447 = _581;
                    _495 = true;
                }
            }
            else
            {
                float _583 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _585 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _587 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _589 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
                float _591 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
                float _593 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
                float _595 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
                float _597 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _591);
                float _599 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _593);
                float _601 = _595 * _595;
                float _603 = fma(_597, _597, _601);
                float _605 = fma(_599, _599, _603);
                float _607 = rsqrt(_605);
                float _609 = _607 * 9.9999999747524270787835121154785e-07;
                float _611 = _597 * _609;
                float _613 = _595 * _609;
                float _615 = _599 * _609;
                _455 = _613;
                _451 = _611;
                _447 = _615;
            }
        }
    }
    _495 = false;
    float _617 = _455;
    float _619 = _451;
    float _621 = _447;
    float _623 = in.m_56.x;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _627 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _635 = _633 != 0;
    float _637 = _627 * _625;
    float _639 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[20].x, _637);
    float _641 = _639 * 6.283185482025146484375;
    float _643 = floor(_639);
    int _645 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _647 = _645 != 0;
    float _649 = _641 * 0.15915493667125701904296875;
    bool _651 = !_631;
    int _653 = _651 ? 0 : 1;
    bool _655 = !_635;
    int _657 = _655 ? 0 : 1;
    int _659 = abs(_653);
    float _661 = _649 * 6.283185482025146484375;
    float _663 = cos(_661);
    bool _665 = !_647;
    int _667 = _665 ? 0 : 1;
    int _669 = abs(_657);
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _673 = -_643;
    float _675 = _639 + _673;
    int _677 = abs(_667);
    float _679 = float(_659);
    float _681 = -_675;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _685 = _675 < 0.5;
    float _687 = float(_685);
    float _689 = float(_669);
    float _691 = abs(_683);
    float _693 = _679 * _691;
    float _695 = fma(_663, 0.5, 0.5);
    float _697 = float(_677);
    float _699 = -_687;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _703 = -_695;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _707 = fma(_697, _705, _693);
    float _709 = abs(_701);
    float _711 = fma(_689, _709, _707);
    bool _713 = !_671;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _717 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_95);
        float _735 = 1.0 / _733;
        float _737 = _129 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _743 = _739 + _741;
    float _745 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _747;
    bool _751 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _753 = isnan(_739);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = 1.0 / _749;
    bool _765 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _767 = isnan(_739);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _777;
    float _781 = _745 * _623;
    float _783 = -_761;
    float _785 = _783 + 1.0;
    bool _787 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _789 = _775 * _785;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _791;
    float _795 = trunc(_781);
    int _797 = int(_795);
    float _799 = -_775;
    float _801 = _799 + 1.0;
    float _803 = _743 * _763;
    float _805 = in.m_52.x;
    float _807 = in.m_52.y;
    float _809 = fma(_779, _803, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _811 = fma(_793, _803, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _813 = _809 * _789;
    float _815 = _811 * _789;
    int _817 = _797 << 4;
    int _819 = _817 + 1712;
    float _821 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].x, _813);
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].y, _815);
    float _825 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].x, _821);
    float _827 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].y, _823);
    float _829 = _825 * _805;
    float _831 = _827 * _807;
    bool _833 = !_787;
    float _849;
    if (!_833)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _837 = _623 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_95);
        float _855 = 1.0 / _853;
        float _857 = _129 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    uint _862 = uint(int(uint(_819) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[int(_872)][_874];
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _859 + _878;
    bool _882 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_859);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _898 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _900 = isnan(_859);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    int _910 = _819 + 8;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _920;
    float _924 = -_892;
    float _926 = _924 + 1.0;
    bool _928 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _930 = 1.0 / _896;
    float _932 = _908 * _926;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    float _938 = _922 * _930;
    float _940 = fma(_938, _880, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _942 = _940 * _932;
    float _944 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _946 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[116].x, _944);
    float _948 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _954 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _962 = !_928;
    float _980;
    float _982;
    if (!_962)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _966 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _968 = float(_95);
        float _970 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _972 = _970 * _964;
        float _974 = floor(_972);
        float _976 = -_974;
        float _978 = _972 + _976;
        _980 = _968;
        _982 = _978;
        _984 = true;
    }
    else
    {
        float _986 = float(_95);
        float _988 = 1.0 / _986;
        float _990 = _129 * _988;
        _980 = _986;
        _982 = _990;
    }
    _984 = false;
    float _992 = _980;
    float _994 = _982;
    float _996 = in.m_56.z;
    float _998 = _623 * 2.0;
    float _1000 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1002 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1004 = in.m_56.y;
    float _1006 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1008 = _617 * _617;
    float _1010 = floor(_998);
    float _1012 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1000);
    float _1014 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1002);
    float _1016 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1006);
    float _1018 = fma(_619, _619, _1008);
    float _1020 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1012);
    float _1022 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1014);
    float _1024 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1016);
    float _1026 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1028 = log2(_1026);
    float _1030 = fma(_621, _621, _1018);
    float _1032 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1034 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1038 = rsqrt(_1030);
    float _1040 = _996 * 2.0;
    float _1042 = _623 + _996;
    bool _1044 = _1010 > 0.0;
    float _1046 = _829 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1048 = _1004 * 2.0;
    bool _1050 = _1010 >= 0.0;
    bool _1052 = isnan(_1010);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan(0.0);
    bool _1058 = _1054 || _1056;
    float _1060 = _1042 + (-1.0);
    float _1062 = floor(_1040);
    float _1064 = _129 * _1028;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1076 = _1074 != 0;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_207));
    bool _1080 = !_1068;
    int _1082 = _1080 ? 0 : 1;
    float _1084 = floor(_1048);
    float _1086 = _1004 + _996;
    bool _1088 = !_1072;
    int _1090 = _1088 ? 0 : 1;
    float _1092 = _1038 * _617;
    float _1094 = _1086 + (-1.0);
    int _1096 = abs(_1090);
    float _1098 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1100 = _1062 > 0.0;
    float _1102 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1104 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1106 = _1062 >= 0.0;
    bool _1108 = isnan(_1062);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = in.m_58.x;
    float _1118 = in.m_58.y;
    float _1120 = in.m_58.z;
    float _1122 = _1038 * _621;
    float _1124 = exp2(_1064);
    bool _1126 = _1084 > 0.0;
    bool _1128 = _1084 >= 0.0;
    bool _1130 = isnan(_1084);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan(0.0);
    bool _1136 = _1132 || _1134;
    float _1138 = _1038 * _619;
    int _1140 = _1058 ? 0 : 1;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1144 = 1.0 + _1142;
    int _1146 = _1114 ? 0 : 1;
    float _1148 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1098);
    int _1150 = ~_1140;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = 1.0 / _1144;
    int _1158 = _1154;
    if (!_1044)
    {
        int _1160 = ~_1140;
        int _1162 = _1160 + 1;
        _1158 = _1162;
    }
    int _1164 = _1158;
    float _1166 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1148);
    int _1168 = ~_1146;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    float _1174 = -_1124;
    float _1176 = _1174 + 1.0;
    int _1178 = _1172;
    if (!_1100)
    {
        int _1180 = ~_1146;
        int _1182 = _1180 + 1;
        _1178 = _1182;
    }
    int _1184 = _1178;
    float _1186 = float(_1096);
    float _1188 = float(_1164);
    float _1190 = _1004 + (-0.5);
    bool _1192 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1200 = _1196 || _1198;
    int _1202 = abs(_1082);
    float _1204 = _1186 * _1188;
    float _1206 = _1200 ? _1176 : 0.0;
    int _1208 = _1136 ? 0 : 1;
    float _1210 = _1204 * (-2.0);
    float _1212 = float(_1202);
    float _1214 = _1206 * _1156;
    float _1216 = float(_1184);
    float _1218 = fma(_1210, _1118, _1118);
    int _1220 = ~_1208;
    int _1222 = _1220 + 1;
    int _1224 = _1222 + 1;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1032 + _1226;
    int _1230 = _1224;
    if (!_1126)
    {
        int _1232 = ~_1208;
        int _1234 = _1232 + 1;
        _1230 = _1234;
    }
    int _1236 = _1230;
    float _1238 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1218);
    float _1240 = _623 + _1004;
    float _1242 = fma(_1102, _1210, _1102);
    float _1244 = _1212 * _1216;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1034 + _1246;
    float _1250 = _1240 + (-1.0);
    float _1252 = _1228 * _1228;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1256 = _1036 + _1254;
    bool _1258 = !_1076;
    int _1260 = _1258 ? 0 : 1;
    float _1262 = _1244 * (-2.0);
    float _1264 = fma(_1248, _1248, _1252);
    bool _1266 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1268 = isnan(1.0);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1274 = _1270 || _1272;
    int _1276 = abs(_1260);
    float _1278 = fma(_1256, _1256, _1264);
    bool _1280 = !_1274;
    float _1282 = _1280 ? _129 : _1214;
    float _1284 = float(_1276);
    float _1286 = float(_1236);
    float _1288 = rsqrt(_1278);
    float _1290 = abs(_1166);
    bool _1292 = _1290 > 0.99989998340606689453125;
    float _1294 = fma(_1282, _1242, _1238);
    float _1296 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1298 = _1284 * _1286;
    float _1300 = _623 + (-0.5);
    float _1302 = fma(_1262, _1116, _1116);
    float _1304 = fma(_1296, _1262, _1296);
    float _1306 = _1298 * (-2.0);
    float _1308 = _1294 * 0.15915493667125701904296875;
    float _1310 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1302);
    float _1312 = fma(_1104, _1306, _1104);
    float _1314 = fma(_1306, _1120, _1120);
    float _1316 = _996 + (-0.5);
    float _1318 = fma(_1282, _1304, _1310);
    float _1320 = _1228 * _1288;
    float _1322 = _1248 * _1288;
    float _1324 = _1256 * _1288;
    float _1326 = _1302;
    float _1328 = _1318;
    float _1330 = _1282;
    if (_1292)
    {
        _1326 = 0.001000000047497451305389404296875;
    }
    float _1332 = _1326;
    float _1334 = -_1320;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1338 = -_1322;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1342 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1314);
    float _1344 = _1308 * 6.283185482025146484375;
    float _1346 = sin(_1344);
    float _1348 = _1336 * _1336;
    float _1350 = _1318 * 0.15915493667125701904296875;
    float _1352 = -_1324;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1356 = _1354;
    if (!_1292)
    {
        _1328 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1358 = _1328;
    float _1360 = fma(_1340, _1340, _1348);
    float _1362 = fma(_1282, _1312, _1342);
    float _1364 = _1358;
    if (_1292)
    {
        float _1366 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1308 * 6.283185482025146484375;
    float _1372 = cos(_1370);
    float _1374 = fma(_1354, _1354, _1360);
    if (!_1292)
    {
        _1356 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1376 = _1356;
    float _1378 = -_1368;
    float _1380 = _1122 * _1378;
    float _1382 = _1376;
    if (!_1292)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1384 = _1330;
    float _1386 = _1384;
    if (_1292)
    {
        float _1388 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1386 = _1388;
    }
    float _1390 = _1386;
    float _1392 = fma(_129, 0.014999999664723873138427734375, _623);
    float _1394 = _1350 * 6.283185482025146484375;
    float _1396 = sin(_1394);
    if (_1292)
    {
        float _1398 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1382 = _1398;
    }
    float _1400 = _1382;
    float _1402 = _1362 * 0.15915493667125701904296875;
    float _1404 = _1350 * 6.283185482025146484375;
    float _1406 = cos(_1404);
    float _1408 = -_1400;
    float _1410 = _1092 * _1408;
    float _1412 = -_1400;
    float _1414 = -_1380;
    float _1416 = fma(_1138, _1412, _1414);
    float _1418 = -_1390;
    float _1420 = _1138 * _1418;
    float _1422 = -_1390;
    float _1424 = -_1410;
    float _1426 = fma(_1122, _1422, _1424);
    float _1428 = _1416 * _1416;
    float _1430 = sqrt(_1374);
    float _1432 = _1396 * _1346;
    float _1434 = _1396 * _1372;
    float _1436 = fma(_1426, _1426, _1428);
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = cos(_1438);
    float _1442 = -_1368;
    float _1444 = -_1420;
    float _1446 = fma(_1092, _1442, _1444);
    float _1448 = _1406 * _1372;
    float _1450 = _1406 * _1346;
    float _1452 = fma(_1446, _1446, _1436);
    float _1454 = _1402 * 6.283185482025146484375;
    float _1456 = sin(_1454);
    float _1458 = _1288 * _1430;
    float _1460 = rsqrt(_1452);
    float _1462 = _1396 * _1440;
    float _1464 = _1372 * _1440;
    float _1466 = _1406 * _1440;
    float _1468 = _1346 * _1440;
    float _1470 = _1046 * _1458;
    float _1472 = _831 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1474 = _1466 * _1138;
    float _1476 = fma(_1456, _1448, _1432);
    float _1478 = fma(_1456, _1432, _1448);
    float _1480 = -_1450;
    float _1482 = fma(_1456, _1434, _1480);
    float _1484 = -_1434;
    float _1486 = fma(_1456, _1450, _1484);
    float _1488 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _1490 = floor(_1392);
    float _1492 = _1472 * _1458;
    float _1494 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1496 = _1494 * 0.5;
    float _1498 = _1426 * _1460;
    float _1500 = _1416 * _1460;
    float _1502 = _1446 * _1460;
    float _1504 = _1486 * _1122;
    float _1506 = _1470 * _1488;
    float _1508 = _1476 * _1122;
    float _1510 = _1138 * _1500;
    float _1512 = _1466 * _1122;
    float _1514 = fma(_1468, _1502, _1504);
    float _1516 = fma(_1464, _1502, _1508);
    float _1518 = -_1510;
    float _1520 = fma(_1092, _1498, _1518);
    float _1522 = -_1456;
    float _1524 = fma(_1522, _1502, _1512);
    float _1526 = -_1456;
    float _1528 = fma(_1526, _1498, _1474);
    float _1530 = fma(_1490, -0.1500000059604644775390625, 1.0);
    float _1532 = fma(_1482, _1520, _1516);
    float _1534 = fma(_1462, _1520, _1524);
    float _1536 = fma(_1478, _1520, _1514);
    float _1538 = _1476 * _1138;
    float _1540 = precise::max(_1530, 0.20000000298023223876953125);
    float _1542 = _1092 * _1502;
    float _1544 = _1492 * _1078;
    float _1546 = _1486 * _1138;
    float _1548 = precise::min(_1540, 1.0);
    float _1550 = -_1542;
    float _1552 = fma(_1122, _1500, _1550);
    float _1554 = fma(_1464, _1498, _1538);
    float _1556 = _1544 * _1534;
    float _1558 = fma(_1468, _1498, _1546);
    float _1560 = fma(_1462, _1552, _1528);
    float _1562 = fma(_1482, _1552, _1554);
    float _1564 = fma(_1506, _1532, _1556);
    float _1566 = fma(_1478, _1552, _1558);
    float _1568 = _1544 * _1560;
    float _1570 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1572 = fma(_1496, _1536, _1564);
    float _1574 = _1466 * _1092;
    float _1576 = fma(_1506, _1562, _1568);
    float _1578 = _1122 * _1498;
    float _1580 = fma(_1572, _1548, _1036);
    float _1582 = -_1456;
    float _1584 = fma(_1582, _1500, _1574);
    float _1586 = fma(_1496, _1566, _1576);
    float _1588 = _1476 * _1092;
    float _1590 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1580);
    float _1592 = -_1578;
    float _1594 = fma(_1138, _1502, _1592);
    float _1596 = fma(_1586, _1548, _1034);
    float _1598 = _1486 * _1092;
    float _1600 = fma(_1464, _1500, _1588);
    float _1602 = fma(_1462, _1594, _1584);
    float _1604 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1596);
    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1608 = _1590 + _1606;
    float _1610 = fma(_1468, _1500, _1598);
    float _1612 = fma(_1482, _1594, _1600);
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1616 = _1604 + _1614;
    float _1618 = _1608 * _1608;
    float _1620 = _1544 * _1602;
    float _1622 = fma(_1478, _1594, _1610);
    float _1624 = fma(_1616, _1616, _1618);
    float _1626 = fma(_1506, _1612, _1620);
    float _1628 = sqrt(_1624);
    float _1630 = fma(_1496, _1622, _1626);
    float _1632 = fma(_1630, _1548, _1032);
    float _1634 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1632);
    bool _1636 = _1628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1644 = _1642 != 0;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1648 = _1646 != 0;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1652 = _1650 != 0;
    bool _1654 = !_1644;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1640;
    int _1660 = _1658 ? 0 : 1;
    bool _1662 = !_1648;
    int _1664 = _1662 ? 0 : 1;
    bool _1666 = !_1652;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = _1610;
    float _1672 = _1604;
    float _1674 = _1590;
    float _1676 = _1588;
    float _1678 = _1496;
    if (!_1636)
    {
        _1670 = _1634;
    }
    float _1680 = _1670;
    bool _1682 = !_1636;
    float _1684 = _1680;
    if (!_1682)
    {
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1690 = _1628 + _1688;
        float _1692 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1694 = rsqrt(_1624);
        float _1696 = _1690 * _1686;
        float _1698 = _1696 * 0.15915493667125701904296875;
        float _1700 = _1698 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        float _1704 = _1698 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 + (-1.0);
        float _1710 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = fma(_1706, _1692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = fma(_1634, _1702, _1710);
        float _1716 = _1694 * _1712;
        float _1718 = fma(_1616, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1720 = fma(_1608, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1684 = _1714;
        _1672 = _1718;
        _1674 = _1720;
    }
    float _1722 = _1684;
    float _1724 = _1672;
    float _1726 = _1674;
    float _1728 = -_1320;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _1732 = -_1322;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1724);
    float _1736 = -_1324;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1726);
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1742 = _1730 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1746 = _1734 + _1744;
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1750 = _1738 + _1748;
    float _1752 = _1742 * _1742;
    float _1754 = fma(_1746, _1746, _1752);
    float _1756 = fma(_1750, _1750, _1754);
    float _1758 = rsqrt(_1756);
    float _1760 = sqrt(_1756);
    float _1762 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1764 = _1746 * _1762;
    float _1766 = _1750 * _1762;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 * _1766;
    float _1772 = _1768 + _1770;
    float _1774 = sqrt(_1772);
    bool _1776 = _1774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1780 = _1774 + _1778;
    float _1782 = _1750;
    float _1784 = _1772;
    float _1786 = _1780;
    float _1788 = _1742;
    if (_1776)
    {
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1790;
    }
    float _1792 = _1782;
    if (_1776)
    {
        float _1794 = rsqrt(_1772);
        _1784 = _1794;
    }
    float _1796 = _1784;
    if (_1776)
    {
        float _1798 = _1780 * _1792;
        _1786 = _1798;
    }
    float _1800 = _1786;
    if (_1776)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1676 = _1802;
    }
    float _1804 = _1676;
    float _1806 = _1752;
    float _1808 = _1804;
    if (_1776)
    {
        float _1810 = _1804 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1806 = _1812;
    }
    float _1814 = _1806;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = precise::max(0.0, _1816);
    float _1820 = _1758;
    float _1822 = _1818;
    float _1824 = _1816;
    if (_1776)
    {
        float _1826 = _1804 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        _1820 = _1828;
    }
    float _1830 = _1820;
    float _1832 = -_1762;
    float _1834 = -_1818;
    float _1836 = fma(_1742, _1832, _1834);
    if (!_1776)
    {
        _1822 = _1764;
    }
    float _1838 = _1822;
    float _1840 = _1838;
    if (_1776)
    {
        float _1842 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1842;
    }
    float _1844 = _1824;
    float _1846 = _1814;
    float _1848 = _1844;
    if (_1776)
    {
        float _1850 = fma(_1814, _1844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1846 = _1850;
    }
    float _1852 = _1846;
    float _1854 = _1852;
    if (!_1776)
    {
        _1848 = _1836;
    }
    float _1856 = _1848;
    float _1858 = _1856;
    float _1860 = _1830;
    if (_1776)
    {
        float _1862 = _1830 + (-1.0);
        _1788 = _1862;
    }
    float _1864 = _1788;
    float _1866 = _1864;
    if (_1776)
    {
        float _1868 = _1796 * _1852;
        _1678 = _1868;
    }
    float _1870 = _1678;
    if (!_1776)
    {
        _1854 = _1768;
    }
    float _1872 = _1854;
    float _1874 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1876 = _1872;
    if (_1776)
    {
        float _1878 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1878;
    }
    float _1880 = _1808;
    if (_1776)
    {
        float _1882 = _1764 * _1870;
        _1840 = _1882;
    }
    float _1884 = _1840;
    if (!_1776)
    {
        _1866 = _1766;
    }
    float _1886 = _1866;
    float _1888 = _1886;
    if (_1776)
    {
        float _1890 = _1766 * _1870;
        _1888 = _1890;
    }
    float _1892 = _1888;
    if (_1776)
    {
        float _1894 = fma(_1836, _1830, _1880);
        _1858 = _1894;
    }
    float _1896 = _1858;
    if (_1776)
    {
        float _1898 = _1884 * _1884;
        _1876 = _1898;
    }
    float _1900 = _1876;
    if (!_1776)
    {
        _1860 = _1770;
    }
    float _1902 = _1860;
    float _1904 = _1902;
    if (_1776)
    {
        float _1906 = _1892 * _1892;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1896, _1896, _1900);
    float _1912 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1914 = _1910 + _1908;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1918 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1916);
    float _1920 = precise::clamp(_1918, 0.0, 1.0);
    float _1922 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1874);
    float _1924 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1926 = -_1920;
    float _1928 = _1926 + 1.0;
    float _1930 = rsqrt(_1914);
    float _1932 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1922);
    float _1934 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1936 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1924);
    float _1938 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1940 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1934);
    float _1944 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1936);
    float _1946 = abs(_1928);
    float _1948 = log2(_1946);
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1952 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1938);
    float _1954 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1942);
    float _1956 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1958 = -_1950;
    float _1960 = fma(_1958, _1912, 1.0);
    float _1962 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1952);
    float _1964 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1966 = _1930 * _1884;
    float _1968 = _1930 * _1896;
    float _1970 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1972 = _1930 * _1892;
    float _1974 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1976 = _1962 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1978 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1970);
    float _1980 = log2(_1960);
    float _1982 = -_1974;
    float _1984 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1982);
    float _1986 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1988 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1978);
    float _1990 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1992 = -_1972;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1984);
    float _1996 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1998 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1988);
    float _2000 = exp2(_1986);
    float _2002 = fma(_1994, -0.5, 0.5);
    float _2004 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1990);
    float _2006 = fma(_1994, 0.5, 0.5);
    float _2008 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1996);
    float _2010 = _1968 + 1.0;
    float _2012 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2004);
    float _2014 = fma(_2006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2016 = 1.0 / _1998;
    float _2018 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2008);
    float _2020 = _1980 * 0.693147182464599609375;
    float _2022 = fma(_2006, _2014, -0.212114393711090087890625);
    float _2024 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2026 = fma(_2006, _2022, 1.570728778839111328125);
    float _2028 = sqrt(_2002);
    float _2030 = -_1968;
    float _2032 = fma(_2000, _2010, _2030);
    float _2034 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2012);
    float _2036 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2018);
    float _2038 = fma(_2032, 0.5, 0.5);
    float _2040 = _2034 * _2016;
    float _2042 = _2036 * _2016;
    float _2044 = fma(_2040, 0.5, 0.5);
    float _2046 = fma(_2042, -0.5, 0.5);
    float _2048 = _2028 * 0.636619746685028076171875;
    float _2050 = -_2026;
    float _2052 = fma(_2048, _2050, 1.0);
    float3 _6205 = float3(_2044, _2046, _2024);
    float _2054 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6205, float3(0.0), isnan(_6205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6205, float3(0.0), isnan(_6205)), level(0.0)).x;
    float3 _6216 = float3(_2044, _2046, _2024);
    float4 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6216, float3(0.0), isnan(_6216)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6216, float3(0.0), isnan(_6216)), level(0.0)).xyzw;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = _2057.w;
    float2 _6233 = float2(_2052, _2038);
    float3 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6233, float2(0.0), isnan(_6233)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6233, float2(0.0), isnan(_6233)), level(0.0)).xyz;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2079 = int(_2077);
    out.m_60.x = _954;
    out.m_60.y = _956;
    out.m_60.z = _960;
    out.m_60.w = _952;
    float _2081 = -_1320;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    int _2085 = abs(_1660);
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2089 = _2087 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2091 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2093 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan(0.5);
    bool _2099 = _2095 || _2097;
    float _2101 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2103 = int(_2101);
    float _2105 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2107 = _623 > 0.5;
    float _2109 = -_1322;
    float _2111 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    bool _2113 = _1004 > 0.5;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2117 = _2115 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2119 = 1.0 / _2089;
    float _2121 = float(_2079);
    float _2123 = -_1324;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2129 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.x = _1734;
    out.m_62.y = _1730;
    out.m_62.z = _1738;
    float _2131 = 1.0 / _2121;
    float _2133 = float(uint(_2103));
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2135;
    int _2139 = ~_2103;
    int _2141 = _2139 + 1;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2145 = _2143 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2147 = ~_2103;
    int _2149 = _2147 + 1;
    float _2151 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2129);
    out.m_64.y = _1492;
    float _2153 = 1.0 / _2133;
    float _2155 = _2137 * _2119;
    float _2157 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2151);
    float _2159 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2157);
    float _2161 = _129 * _2131;
    float _2163 = 1.0 / _992;
    int _2165 = as_type<int>(_2153) + (-2);
    float _2167 = trunc(_2161);
    int _2169 = int(_2167);
    float _2171 = 1.0 / _2117;
    float _2173 = float(uint(_2169));
    float _2175 = as_type<float>(_2165) * _2173;
    int _2177 = ~_2103;
    int _2179 = _2177 + 1;
    float _2181 = _2145 * _2171;
    int _2183 = _2103 + (-1);
    float _2185 = trunc(_2175);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    int _2191 = _2179 * int(_2189);
    int _2193 = _2191 + _2169;
    float _2195 = float(uint(_2193));
    float _2197 = as_type<float>(_2165) * _2195;
    float _2199 = in.m_56.w;
    float _2201 = trunc(_2197);
    float _2203 = precise::max(_2201, 0.0);
    uint _2205 = uint(_2203);
    int _2207 = int(_2189) + int(_2205);
    int _2209 = _2141 * _2207;
    int _2211 = _2209 + _2169;
    int _2213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2215 = _2213 != 0;
    float _2217 = float(_2103);
    bool _2219 = !_2215;
    float _2221 = _2219 ? 1.2345600128173828125 : 1.0;
    bool _2223 = !_2215;
    float _2225 = _2223 ? _1004 : _623;
    float _2227 = _129 * _2217;
    bool _2229 = uint(_2211) >= uint(_2103);
    float _2231 = float(_2169);
    float _2233 = _2221 * _2225;
    float _2235 = _2227 * _2163;
    bool _2237 = _2231 >= _2217;
    bool _2239 = isnan(_2231);
    bool _2241 = _2237 || _2239;
    bool _2243 = isnan(_2217);
    bool _2245 = _2241 || _2243;
    float _2247 = float(_2245);
    float _2249 = floor(_2233);
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2255 = _2199 > 0.5;
    float _2257 = _623 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2259 = !_2229;
    int _2261 = _2259 ? 0 : (-1);
    float _2263 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2265 = _2103 == 0;
    float _2267 = trunc(_2247);
    int _2269 = int(_2267);
    int _2271 = ~_2207;
    int _2273 = _2271 + _2261;
    int _2275 = _2273 + 1;
    float _2277 = -_2263;
    float _2279 = fma(_2257, 2.0, _2277);
    int _2281 = _2103 * _2275;
    int _2283 = _2281 + _2169;
    int _2285 = abs(_1656);
    float _2287 = 1.0 / _2253;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2291 = -_2249;
    float _2293 = _2233 + _2291;
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2295;
    float _2299 = fma(_2105, -2.0, _2289);
    bool _2301 = !_2265;
    int _2303 = _2301 ? _2283 : (-1);
    float _2305 = _2293 * _2217;
    int _2307 = ~_2269;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    float _2313 = trunc(_2235);
    int _2315 = int(_2313);
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2319 = _2303 * _2311;
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2323 = _2321 != 0;
    float _2325 = _2297 * _2287;
    float _2327 = trunc(_2305);
    int _2329 = int(_2327);
    float _2331 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2317);
    int _2333 = _2269 * _2183;
    int _2335 = _2333 + _2319;
    bool _2337 = !_2323;
    float _2339 = _2337 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2341 = _996 > 0.5;
    int _2343 = _2335 * _2285;
    int _2345 = abs(as_type<int>(_2339));
    float _2347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2349 = as_type<float>(_2335);
    float _2351 = _2339;
    float _2353 = as_type<float>(_2269);
    if (!_2215)
    {
        _2349 = _996;
    }
    float _2355 = _2349;
    float _2357 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2331);
    float _2359 = _2355;
    if (!_2215)
    {
        _2351 = _996;
    }
    float _2361 = _2351;
    float _2363 = _2361;
    if (!_2215)
    {
        _2353 = _1004;
    }
    float _2365 = _2353;
    int _2367 = _2329 * _2345;
    int _2369 = _2367 + _2169;
    float _2371 = _2365;
    if (_2215)
    {
        _2371 = _623;
    }
    float _2373 = _2371;
    int _2375 = _2315 * _2085;
    int _2377 = _2375 + _2343;
    if (_2215)
    {
        _2359 = _1004;
    }
    float _2379 = _2359;
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2383 = _994 + _2381;
    if (_2215)
    {
        _2363 = _1004;
    }
    float _2385 = _2363;
    float _2387 = -_211;
    int _2389 = _2107 ? as_type<int>(_2387) : as_type<int>(_211);
    float _2391 = _2347 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2395 = _2393 != 0;
    float _2397 = -_129;
    float _2399 = fma(_2397, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2279);
    int _2401 = abs(_1664);
    float _2403 = fma(_2181, _2383, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2405 = abs(_1668);
    float _2407 = _2379 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2409 = !_2395;
    float _2411 = _2409 ? _211 : as_type<float>(_2389);
    int _2413 = _2369 * _2401;
    int _2415 = _2413 + _2377;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2419 = _994 + _2417;
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2423 = _2421 != 0;
    float _2425 = _2411 + 0.5;
    int _2427 = _2329 * _2405;
    int _2429 = _2427 + _2415;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2433 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2299);
    float _2435 = fma(_2391, _2425, _2399);
    float _2437 = -as_type<float>(_207);
    int _2439 = _2113 ? as_type<int>(_2437) : _207;
    float _2441 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2431);
    float _2443 = float(uint(_2429));
    float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2447 = fma(_2155, _2419, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2449 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2451 = _994 + _2449;
    float _2453 = as_type<float>(_2165) * _2443;
    bool _2455 = !_2423;
    float _2457 = _2455 ? as_type<float>(_207) : as_type<float>(_2439);
    float _2459 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2461 = float(uint(_2369));
    float _2463 = trunc(_2453);
    float _2465 = precise::max(_2463, 0.0);
    uint _2467 = uint(_2465);
    float _2469 = fma(_2325, _2451, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2471 = ~_2103;
    int _2473 = _2471 + 1;
    float _2475 = _2457 + (-0.5);
    float _2477 = fma(_2385, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2459);
    float _2479 = as_type<float>(_2165) * _2461;
    bool _2481 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2483 = isnan(_994);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2441);
    float _2495 = _2445 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2497 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2499 = isnan(_994);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2477);
    float _2511 = trunc(_2479);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    float _2517 = -_2495;
    float _2519 = -_2433;
    float _2521 = fma(_2517, _2475, _2519);
    bool _2523 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2525 = isnan(_994);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2531 = _2527 || _2529;
    float _2533 = float(_2531);
    float _2535 = -_2507;
    float _2537 = _2535 + 1.0;
    bool _2539 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2541 = isnan(_994);
    bool _2543 = _2539 || _2541;
    bool _2545 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2547 = _2543 || _2545;
    float _2549 = float(_2547);
    int _2551 = _2473 * int(_2467);
    int _2553 = _2551 + _2429;
    float _2555 = -_2533;
    float _2557 = _2555 + 1.0;
    float _2559 = _2533 * _2537;
    float _2561 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2127);
    float _2563 = float(uint(_2553));
    float _2565 = _2491 * _2557;
    float _2567 = -_2491;
    float _2569 = _2567 + 1.0;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2573 = as_type<float>(_2165) * _2563;
    float _2575 = _2549 * _2569;
    int _2577 = _2473 * int(_2515);
    int _2579 = _2577 + _2369;
    float _2581 = -_2549;
    float _2583 = _2581 + 1.0;
    float _2585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2587 = _2447 * _2575;
    float _2589 = trunc(_2573);
    float _2591 = precise::max(_2589, 0.0);
    uint _2593 = uint(_2591);
    float _2595 = fma(_2407, -2.0, _2571);
    float _2597 = float(uint(_2579));
    float _2599 = fma(_2583, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2587);
    float _2601 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2603 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2607 = _2605 != 0;
    float _2609 = as_type<float>(_2165) * _2597;
    float _2611 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2601);
    float _2613 = -_211;
    int _2615 = _2341 ? as_type<int>(_2613) : as_type<int>(_211);
    float _2617 = -_2585;
    float _2619 = fma(_2603, 2.0, _2617);
    float _2621 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2561);
    float _2623 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2611);
    bool _2625 = !_2607;
    float _2627 = _2625 ? _211 : as_type<float>(_2615);
    float _2629 = -_129;
    float _2631 = fma(_2629, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2619);
    float _2633 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2635 = int(_2467) + int(_2593);
    float _2637 = _2623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2639 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2595);
    float _2641 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2633);
    float _2643 = fma(_2403, _2565, _2599);
    int _2645 = _2149 * _2635;
    int _2647 = _2645 + _2429;
    float _2649 = 1.0 / _2637;
    float _2651 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2641);
    float _2653 = _2627 + 0.5;
    float _2655 = -_2621;
    float _2657 = _2655 + 1.0;
    bool _2659 = uint(_2647) >= uint(_2103);
    float _2661 = _2651 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2663 = fma(_2653, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2631);
    float _2665 = -as_type<float>(_207);
    float _2667 = _2255 ? _2665 : as_type<float>(_207);
    float _2669 = trunc(_2609);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    bool _2675 = !_2659;
    int _2677 = _2675 ? 0 : (-1);
    float _2679 = _2661 + _2637;
    int _2681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2683 = _2681 != 0;
    float _2685 = -_2509;
    float _2687 = _2685 + 1.0;
    int _2689 = ~_2635;
    int _2691 = _2689 + _2677;
    int _2693 = _2691 + 1;
    float _2695 = -_2657;
    float _2697 = fma(_2627, _2695, _2663);
    bool _2699 = !_2683;
    float _2701 = _2699 ? as_type<float>(_207) : _2667;
    float _2703 = _2679 * _2649;
    float _2705 = _2703 * 0.5;
    int _2707 = ~_2103;
    int _2709 = _2707 + 1;
    int _2711 = _2103 * _2693;
    int _2713 = _2711 + _2429;
    float _2715 = _2667;
    float _2717 = _2705;
    float _2719 = _2631;
    if (!_2099)
    {
        _2715 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2721 = _2715;
    float _2723 = -_2493;
    float _2725 = _2723 + 1.0;
    float _2727 = as_type<float>(_207) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2729 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2731 = !_2265;
    int _2733 = _2731 ? _2713 : (-1);
    float _2735 = _2721;
    if (!_2099)
    {
        float _2737 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2739 = fma(_2705, _2721, _2737);
        _2735 = _2739;
    }
    float _2741 = _2735;
    float _2743 = fma(_2457, _2725, _2521);
    int _2745 = _2733 >> 31;
    float _2747 = _1602 * _2727;
    int _2749 = int(_2515) + int(_2673);
    float _2751 = _2701 + (-0.5);
    int _2753 = _2745 & 3;
    float _2755 = -_2357;
    float _2757 = _2755 + 1.0;
    if (!_2099)
    {
        _2717 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2759 = _2717;
    float _2761 = _2741;
    if (!_2099)
    {
        float _2763 = 1.0 / _2741;
        _2761 = _2763;
    }
    float _2765 = _2761;
    int _2767 = _2733 + _2753;
    int _2769 = _2709 * _2749;
    int _2771 = _2769 + _2369;
    float _2773 = -_2751;
    float _2775 = -_2639;
    float _2777 = fma(_2773, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2775);
    if (!_2099)
    {
        float _2779 = -_2759;
        float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2719 = _2781;
    }
    float _2783 = _2719;
    int _2785 = _2767 >> 2;
    float _2787 = -_2757;
    float _2789 = fma(_2411, _2787, _2435);
    bool _2791 = uint(_2771) >= uint(_2103);
    float _2793 = fma(_2701, _2687, _2777);
    int _2795 = _2785 << 4;
    int _2797 = _2795 + 512;
    float _2799 = _2783;
    float _2801 = _2789;
    if (!_2099)
    {
        float _2803 = 1.0 / _2783;
        _2799 = _2803;
    }
    float _2805 = _2799;
    bool _2807 = !_2791;
    int _2809 = _2807 ? 0 : (-1);
    float _2811 = fma(_1612, _2729, _2747);
    uint _2813 = uint(int(uint(_2797) >> uint(2)));
    uint _2815 = uint(int(uint(int(_2813)) >> uint(2)));
    int _2817 = int(_2813) & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    int _2821 = int(_2813) + 1;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    int _2825 = _2821 & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    int _2829 = _2733 & 3;
    bool _2831 = _2829 != 0;
    out.m_66.x = _2789;
    out.m_66.y = _2743;
    out.m_66.z = _2697;
    out.m_66.w = _2793;
    float _2833 = _2765;
    if (!_2099)
    {
        float _2835 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2837 = -_2759;
        float _2839 = fma(_2765, _2835, _2837);
        _2833 = _2839;
    }
    float _2841 = _2833;
    int _2843 = ~_2749;
    int _2845 = _2843 + _2809;
    int _2847 = _2845 + 1;
    float _2849 = _1622 + _2811;
    int _2851 = _2733 & 3;
    bool _2853 = _2851 != 0;
    float _2855 = fma(_2469, _2559, _2643);
    int _2857 = _2797 + 8;
    uint _2859 = uint(int(uint(_2857) >> uint(2)));
    uint _2861 = uint(int(uint(int(_2859)) >> uint(2)));
    int _2863 = int(_2859) & 3;
    float _2865 = (*spvDescriptorSet0.vp_c9)._m0[int(_2861)][_2863];
    int _2867 = int(_2859) + 1;
    uint _2869 = uint(int(uint(_2867) >> uint(2)));
    int _2871 = _2867 & 3;
    float _2873 = (*spvDescriptorSet0.vp_c9)._m0[int(_2869)][_2871];
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2877 = _2875 != 0;
    int _2879 = _2103 * _2847;
    int _2881 = _2879 + _2369;
    bool _2883 = uint(_2851) > 1u;
    float _2885 = fma(_2507, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2855);
    float _2887 = _2841;
    if (!_2099)
    {
        float _2889 = _2841 * _2805;
        float _2891 = precise::clamp(_2889, 0.0, 1.0);
        _2887 = _2891;
    }
    float _2893 = _2887;
    bool _2895 = !_2265;
    int _2897 = _2895 ? _2881 : (-1);
    float _2899 = _1560 * _2727;
    int _2901 = _2831 ? 0 : 1;
    float _2903 = _1534 * _2727;
    bool _2905 = _2851 != 3;
    float _2907 = fma(_1562, _2729, _2899);
    if (_2099)
    {
        _2801 = 1.0;
    }
    float _2909 = _2801;
    float _2911 = _2909;
    if (!_2099)
    {
        float _2913 = -_2893;
        float _2915 = _2913 + 1.0;
        _2911 = _2915;
    }
    float _2917 = _2911;
    bool _2919 = uint(_2851) >= 2u;
    float _2921 = fma(_1532, _2729, _2903);
    int _2923 = ~_2901;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    float _2929 = _2885 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2931 = _2927;
    if (!_2883)
    {
        int _2933 = ~_2901;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    float _2939 = _1536 + _2921;
    int _2941 = _2919 ? 0 : 1;
    bool _2943 = !_2853;
    int _2945 = _2943 ? 0 : 1;
    out.m_68.w = _2929;
    int _2947 = abs(_2937);
    bool _2949 = _2851 != 3;
    int _2951 = ~_2941;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    int _2957 = abs(_2945);
    int _2959 = _2955;
    if (_2905)
    {
        int _2961 = ~_2941;
        int _2963 = _2961 + 1;
        _2959 = _2963;
    }
    int _2965 = _2959;
    bool _2967 = !_2949;
    int _2969 = _2967 ? 0 : (-1);
    int _2971 = abs(_2965);
    int _2973 = abs(_2969);
    int _2975 = ~_2957;
    int _2977 = _2975 + 1;
    int _2979 = _2977 + 1;
    float _2981 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2983 = ~_2947;
    int _2985 = _2983 + 1;
    int _2987 = _2985 + 1;
    float _2989 = _1566 + _2907;
    int _2991 = ~_2971;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    bool _2997 = _2917 > 0.0;
    bool _2999 = isnan(_2917);
    bool _3001 = _2997 || _2999;
    bool _3003 = isnan(0.0);
    bool _3005 = _3001 || _3003;
    float _3007 = exp2(_2981);
    int _3009 = _2987 * as_type<int>(_2827);
    bool _3011 = !_2877;
    int _3013 = _3011 ? 0 : 1;
    out.m_70.x = _2989;
    out.m_70.y = _2849;
    out.m_70.z = _2939;
    int _3015 = _2979 * as_type<int>(_2819);
    int _3017 = _3015 + _3009;
    int _3019 = abs(_3013);
    int _3021 = ~_2973;
    int _3023 = _3021 + 1;
    int _3025 = _3023 + 1;
    int _3027 = _2995 * as_type<int>(_2865);
    int _3029 = _3027 + _3017;
    float _3031 = _2917 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3033 = _3025 * as_type<int>(_2873);
    int _3035 = _3033 + _3029;
    int _3037 = ~_3019;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    float _3043 = _711 * _3031;
    float _3045 = -_3007;
    float _3047 = _3045 + 1.0;
    int _3049 = _3035 * _3041;
    float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3053 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3055 = _2159 + _3053;
    float _3057 = _3043 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _3059 = _2897 * _3019;
    int _3061 = _3059 + _3049;
    float _3063 = _3051 * _2054;
    float _3065 = _1998 + _3055;
    float _3067 = -_3051;
    float _3069 = _3067 + 1.0;
    out.gl_Position.x = _2034;
    out.gl_Position.y = _2036;
    out.gl_Position.z = _3055;
    out.gl_Position.w = _1998;
    float _3071 = _2065 * _3063;
    float _3073 = _2075 * _3063;
    float _3075 = _3065 * 0.5;
    float _3077 = float(_3061);
    float _3079 = fma(_2071, _3071, _2059);
    float _3081 = fma(_2073, _3071, _2061);
    float _3083 = _2065 * _3069;
    float _3085 = fma(_2065, _3073, _2063);
    out.m_72.z = _3075;
    out.m_72.w = _1998;
    out.m_74.y = _3077;
    out.m_45.x = _3057;
    out.m_76.x = _3079;
    out.m_76.y = _3081;
    out.m_76.z = _3085;
    out.m_76.w = _3083;
    if (_3005)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3087;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _984 = false;
    bool _851 = false;
    bool _731 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3144 = as_type<float>(_111);
        out.gl_Position.z = _3144;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = 0.0;
    if (_125)
    {
        float _135 = float(_95);
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _113 = as_type<int>(_149);
    }
    int _151 = _113;
    float _153 = as_type<float>(_151);
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3215 = as_type<float>(_151);
        out.gl_Position.z = _3215;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = _157;
    if (!_173)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _153 = _179;
    }
    float _181 = _153;
    float _183 = 0.0;
    float _185 = _181;
    if (!_173)
    {
        float _187 = _129 * _129;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    if (!_173)
    {
        float _193 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _193;
    }
    float _195 = _185;
    int _197 = as_type<int>(_155) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_155) & 2;
    bool _203 = _201 != 0;
    bool _205 = !_203;
    int _207 = _205 ? (-1090519040) : 1056964608;
    bool _209 = !_199;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_173;
    float _215 = _195;
    if (!_213)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _157 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _157);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _131 = _235;
        _215 = _245;
        _133 = _233;
    }
    float _247 = _131;
    float _249 = _215;
    float _251 = _133;
    bool _253 = !_173;
    float _255 = _247;
    float _257 = _251;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _157 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _271;
        _257 = _265;
        _175 = _277;
    }
    float _279 = _255;
    float _281 = _257;
    float _283 = _175;
    float _285 = _281;
    float _287 = _279;
    if (!_173)
    {
        _285 = _129;
    }
    float _289 = _285;
    float _291 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _293 = _289;
    if (!_173)
    {
        float _295 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _287 = _295;
    }
    float _297 = _287;
    bool _299 = !_173;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _129 * _305;
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _307 * 0.693147182464599609375;
        float _319 = exp2(_309);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _129);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
    }
    float _333 = _301;
    bool _335 = !_173;
    if (!_335)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _129 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _293 = _355;
    }
    float _357 = _293;
    float _359 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _361 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_283, _161, _291);
    float _365 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_357, _161, _359);
    float _369 = fma(_283, _159, _361);
    float _371 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = fma(_357, _159, _365);
    float _377 = -_367;
    float _379 = _363 + _377;
    float _381 = fma(_283, _163, _371);
    float _383 = fma(_357, _163, _373);
    float _385 = -_375;
    float _387 = _369 + _385;
    float _389 = _379 * _379;
    float _391 = in.m_52.w;
    float _393 = -_383;
    float _395 = _381 + _393;
    float _397 = _379 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _399 = fma(_387, _387, _389);
    out.m_54.y = as_type<float>(_207);
    float _401 = _379 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _403 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _397);
    float _405 = fma(_395, _395, _399);
    float _407 = _379 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _409 = in.m_42.x;
    float _411 = in.m_42.y;
    float _413 = in.m_42.z;
    float _415 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _401);
    float _417 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _407);
    float _421 = sqrt(_405);
    float _423 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[6].z, _419);
    bool _425 = _421 >= 9.9999999747524270787835121154785e-07;
    bool _427 = isnan(_421);
    bool _429 = _425 || _427;
    bool _431 = isnan(9.9999999747524270787835121154785e-07);
    bool _433 = _429 || _431;
    float _435 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[5].z, _415);
    float _437 = fma(_369, _391, _409);
    float _439 = fma(_363, _391, _411);
    float _441 = fma(_381, _391, _413);
    float _443 = _363;
    float _445 = _391;
    float _447 = _423;
    if (_433)
    {
        _443 = _417;
    }
    float _449 = _443;
    float _451 = _449;
    if (_433)
    {
        _445 = _435;
    }
    float _453 = _445;
    float _455 = _453;
    if (!_433)
    {
        bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _459 = !_457;
        if (!_459)
        {
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
            float _479 = _473 * _473;
            float _481 = fma(_475, _475, _479);
            float _483 = fma(_477, _477, _481);
            float _485 = rsqrt(_483);
            float _487 = _485 * 9.9999999747524270787835121154785e-07;
            float _489 = _475 * _487;
            float _491 = _473 * _487;
            float _493 = _477 * _487;
            _455 = _491;
            _451 = _489;
            _447 = _493;
            _495 = true;
        }
        else
        {
            float _497 = _161 * _161;
            float _499 = fma(_159, _159, _497);
            float _501 = fma(_163, _163, _499);
            float _503 = sqrt(_501);
            bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
            bool _507 = isnan(_503);
            bool _509 = _505 || _507;
            bool _511 = isnan(9.9999999747524270787835121154785e-07);
            bool _513 = _509 || _511;
            if (!_513)
            {
                float _515 = _411 * _411;
                float _517 = fma(_409, _409, _515);
                float _519 = fma(_413, _413, _517);
                float _521 = sqrt(_519);
                bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
                bool _525 = isnan(_521);
                bool _527 = _523 || _525;
                bool _529 = isnan(9.9999999747524270787835121154785e-07);
                bool _531 = _527 || _529;
                if (!_531)
                {
                    float _533 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _533);
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _541 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _545 = _541 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _455 = _545;
                    _451 = _543;
                    _447 = _547;
                    _495 = true;
                }
                else
                {
                    float _549 = _411 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _551 = _411 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _411 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _555 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                    float _557 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                    float _559 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                    float _561 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                    float _563 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                    float _565 = fma(_413, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                    float _567 = _561 * _561;
                    float _569 = fma(_563, _563, _567);
                    float _571 = fma(_565, _565, _569);
                    float _573 = rsqrt(_571);
                    float _575 = _573 * 9.9999999747524270787835121154785e-07;
                    float _577 = _563 * _575;
                    float _579 = _561 * _575;
                    float _581 = _565 * _575;
                    _455 = _579;
                    _451 = _577;
                    _447 = _581;
                    _495 = true;
                }
            }
            else
            {
                float _583 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _585 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _587 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _589 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
                float _591 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
                float _593 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
                float _595 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
                float _597 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _591);
                float _599 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _593);
                float _601 = _595 * _595;
                float _603 = fma(_597, _597, _601);
                float _605 = fma(_599, _599, _603);
                float _607 = rsqrt(_605);
                float _609 = _607 * 9.9999999747524270787835121154785e-07;
                float _611 = _597 * _609;
                float _613 = _595 * _609;
                float _615 = _599 * _609;
                _455 = _613;
                _451 = _611;
                _447 = _615;
            }
        }
    }
    _495 = false;
    float _617 = _455;
    float _619 = _451;
    float _621 = _447;
    float _623 = in.m_56.x;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _627 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _635 = _633 != 0;
    float _637 = _627 * _625;
    float _639 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[20].x, _637);
    float _641 = _639 * 6.283185482025146484375;
    float _643 = floor(_639);
    int _645 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _647 = _645 != 0;
    float _649 = _641 * 0.15915493667125701904296875;
    bool _651 = !_631;
    int _653 = _651 ? 0 : 1;
    bool _655 = !_635;
    int _657 = _655 ? 0 : 1;
    int _659 = abs(_653);
    float _661 = _649 * 6.283185482025146484375;
    float _663 = cos(_661);
    bool _665 = !_647;
    int _667 = _665 ? 0 : 1;
    int _669 = abs(_657);
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _673 = -_643;
    float _675 = _639 + _673;
    int _677 = abs(_667);
    float _679 = float(_659);
    float _681 = -_675;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _685 = _675 < 0.5;
    float _687 = float(_685);
    float _689 = float(_669);
    float _691 = abs(_683);
    float _693 = _679 * _691;
    float _695 = fma(_663, 0.5, 0.5);
    float _697 = float(_677);
    float _699 = -_687;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _703 = -_695;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _707 = fma(_697, _705, _693);
    float _709 = abs(_701);
    float _711 = fma(_689, _709, _707);
    bool _713 = !_671;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _717 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_95);
        float _735 = 1.0 / _733;
        float _737 = _129 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _743 = _739 + _741;
    float _745 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _747;
    bool _751 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _753 = isnan(_739);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = 1.0 / _749;
    bool _765 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _767 = isnan(_739);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _777;
    float _781 = _745 * _623;
    float _783 = -_761;
    float _785 = _783 + 1.0;
    bool _787 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _789 = _775 * _785;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _791;
    float _795 = trunc(_781);
    int _797 = int(_795);
    float _799 = -_775;
    float _801 = _799 + 1.0;
    float _803 = _743 * _763;
    float _805 = in.m_52.x;
    float _807 = in.m_52.y;
    float _809 = fma(_779, _803, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _811 = fma(_793, _803, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _813 = _809 * _789;
    float _815 = _811 * _789;
    int _817 = _797 << 4;
    int _819 = _817 + 1712;
    float _821 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].x, _813);
    float _823 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[143].y, _815);
    float _825 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].x, _821);
    float _827 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].y, _823);
    float _829 = _825 * _805;
    float _831 = _827 * _807;
    bool _833 = !_787;
    float _849;
    if (!_833)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _837 = _623 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_95);
        float _855 = 1.0 / _853;
        float _857 = _129 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    uint _862 = uint(int(uint(_819) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[int(_872)][_874];
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _859 + _878;
    bool _882 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_859);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _898 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _900 = isnan(_859);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    int _910 = _819 + 8;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _920;
    float _924 = -_892;
    float _926 = _924 + 1.0;
    bool _928 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _930 = 1.0 / _896;
    float _932 = _908 * _926;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    float _938 = _922 * _930;
    float _940 = fma(_938, _880, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _942 = _940 * _932;
    float _944 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _946 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[116].x, _944);
    float _948 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _954 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _962 = !_928;
    float _980;
    float _982;
    if (!_962)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _966 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _968 = float(_95);
        float _970 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _972 = _970 * _964;
        float _974 = floor(_972);
        float _976 = -_974;
        float _978 = _972 + _976;
        _980 = _968;
        _982 = _978;
        _984 = true;
    }
    else
    {
        float _986 = float(_95);
        float _988 = 1.0 / _986;
        float _990 = _129 * _988;
        _980 = _986;
        _982 = _990;
    }
    _984 = false;
    float _992 = _980;
    float _994 = _982;
    float _996 = in.m_56.z;
    float _998 = _623 * 2.0;
    float _1000 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1002 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1004 = in.m_56.y;
    float _1006 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1008 = _617 * _617;
    float _1010 = floor(_998);
    float _1012 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1000);
    float _1014 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1002);
    float _1016 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1006);
    float _1018 = fma(_619, _619, _1008);
    float _1020 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1012);
    float _1022 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1014);
    float _1024 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1016);
    float _1026 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1028 = log2(_1026);
    float _1030 = fma(_621, _621, _1018);
    float _1032 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1034 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = _1024 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1038 = rsqrt(_1030);
    float _1040 = _996 * 2.0;
    float _1042 = _623 + _996;
    bool _1044 = _1010 > 0.0;
    float _1046 = _829 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1048 = _1004 * 2.0;
    bool _1050 = _1010 >= 0.0;
    bool _1052 = isnan(_1010);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan(0.0);
    bool _1058 = _1054 || _1056;
    float _1060 = _1042 + (-1.0);
    float _1062 = floor(_1040);
    float _1064 = _129 * _1028;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1072 = _1070 != 0;
    int _1074 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1076 = _1074 != 0;
    float _1078 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_207));
    bool _1080 = !_1068;
    int _1082 = _1080 ? 0 : 1;
    float _1084 = floor(_1048);
    float _1086 = _1004 + _996;
    bool _1088 = !_1072;
    int _1090 = _1088 ? 0 : 1;
    float _1092 = _1038 * _617;
    float _1094 = _1086 + (-1.0);
    int _1096 = abs(_1090);
    float _1098 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _1100 = _1062 > 0.0;
    float _1102 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1104 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1106 = _1062 >= 0.0;
    bool _1108 = isnan(_1062);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan(0.0);
    bool _1114 = _1110 || _1112;
    float _1116 = in.m_58.x;
    float _1118 = in.m_58.y;
    float _1120 = in.m_58.z;
    float _1122 = _1038 * _621;
    float _1124 = exp2(_1064);
    bool _1126 = _1084 > 0.0;
    bool _1128 = _1084 >= 0.0;
    bool _1130 = isnan(_1084);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan(0.0);
    bool _1136 = _1132 || _1134;
    float _1138 = _1038 * _619;
    int _1140 = _1058 ? 0 : 1;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1144 = 1.0 + _1142;
    int _1146 = _1114 ? 0 : 1;
    float _1148 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1098);
    int _1150 = ~_1140;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = 1.0 / _1144;
    int _1158 = _1154;
    if (!_1044)
    {
        int _1160 = ~_1140;
        int _1162 = _1160 + 1;
        _1158 = _1162;
    }
    int _1164 = _1158;
    float _1166 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1148);
    int _1168 = ~_1146;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    float _1174 = -_1124;
    float _1176 = _1174 + 1.0;
    int _1178 = _1172;
    if (!_1100)
    {
        int _1180 = ~_1146;
        int _1182 = _1180 + 1;
        _1178 = _1182;
    }
    int _1184 = _1178;
    float _1186 = float(_1096);
    float _1188 = float(_1164);
    float _1190 = _1004 + (-0.5);
    bool _1192 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1200 = _1196 || _1198;
    int _1202 = abs(_1082);
    float _1204 = _1186 * _1188;
    float _1206 = _1200 ? _1176 : 0.0;
    int _1208 = _1136 ? 0 : 1;
    float _1210 = _1204 * (-2.0);
    float _1212 = float(_1202);
    float _1214 = _1206 * _1156;
    float _1216 = float(_1184);
    float _1218 = fma(_1210, _1118, _1118);
    int _1220 = ~_1208;
    int _1222 = _1220 + 1;
    int _1224 = _1222 + 1;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1228 = _1032 + _1226;
    int _1230 = _1224;
    if (!_1126)
    {
        int _1232 = ~_1208;
        int _1234 = _1232 + 1;
        _1230 = _1234;
    }
    int _1236 = _1230;
    float _1238 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1218);
    float _1240 = _623 + _1004;
    float _1242 = fma(_1102, _1210, _1102);
    float _1244 = _1212 * _1216;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1034 + _1246;
    float _1250 = _1240 + (-1.0);
    float _1252 = _1228 * _1228;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1256 = _1036 + _1254;
    bool _1258 = !_1076;
    int _1260 = _1258 ? 0 : 1;
    float _1262 = _1244 * (-2.0);
    float _1264 = fma(_1248, _1248, _1252);
    bool _1266 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1268 = isnan(1.0);
    bool _1270 = _1266 || _1268;
    bool _1272 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1274 = _1270 || _1272;
    int _1276 = abs(_1260);
    float _1278 = fma(_1256, _1256, _1264);
    bool _1280 = !_1274;
    float _1282 = _1280 ? _129 : _1214;
    float _1284 = float(_1276);
    float _1286 = float(_1236);
    float _1288 = rsqrt(_1278);
    float _1290 = abs(_1166);
    bool _1292 = _1290 > 0.99989998340606689453125;
    float _1294 = fma(_1282, _1242, _1238);
    float _1296 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1298 = _1284 * _1286;
    float _1300 = _623 + (-0.5);
    float _1302 = fma(_1262, _1116, _1116);
    float _1304 = fma(_1296, _1262, _1296);
    float _1306 = _1298 * (-2.0);
    float _1308 = _1294 * 0.15915493667125701904296875;
    float _1310 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1302);
    float _1312 = fma(_1104, _1306, _1104);
    float _1314 = fma(_1306, _1120, _1120);
    float _1316 = _996 + (-0.5);
    float _1318 = fma(_1282, _1304, _1310);
    float _1320 = _1228 * _1288;
    float _1322 = _1248 * _1288;
    float _1324 = _1256 * _1288;
    float _1326 = _1302;
    float _1328 = _1318;
    float _1330 = _1282;
    if (_1292)
    {
        _1326 = 0.001000000047497451305389404296875;
    }
    float _1332 = _1326;
    float _1334 = -_1320;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1228);
    float _1338 = -_1322;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1342 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1314);
    float _1344 = _1308 * 6.283185482025146484375;
    float _1346 = sin(_1344);
    float _1348 = _1336 * _1336;
    float _1350 = _1318 * 0.15915493667125701904296875;
    float _1352 = -_1324;
    float _1354 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1256);
    float _1356 = _1354;
    if (!_1292)
    {
        _1328 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1358 = _1328;
    float _1360 = fma(_1340, _1340, _1348);
    float _1362 = fma(_1282, _1312, _1342);
    float _1364 = _1358;
    if (_1292)
    {
        float _1366 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = _1308 * 6.283185482025146484375;
    float _1372 = cos(_1370);
    float _1374 = fma(_1354, _1354, _1360);
    if (!_1292)
    {
        _1356 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1376 = _1356;
    float _1378 = -_1368;
    float _1380 = _1122 * _1378;
    float _1382 = _1376;
    if (!_1292)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1384 = _1330;
    float _1386 = _1384;
    if (_1292)
    {
        float _1388 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1386 = _1388;
    }
    float _1390 = _1386;
    float _1392 = fma(_129, 0.014999999664723873138427734375, _623);
    float _1394 = _1350 * 6.283185482025146484375;
    float _1396 = sin(_1394);
    if (_1292)
    {
        float _1398 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1382 = _1398;
    }
    float _1400 = _1382;
    float _1402 = _1362 * 0.15915493667125701904296875;
    float _1404 = _1350 * 6.283185482025146484375;
    float _1406 = cos(_1404);
    float _1408 = -_1400;
    float _1410 = _1092 * _1408;
    float _1412 = -_1400;
    float _1414 = -_1380;
    float _1416 = fma(_1138, _1412, _1414);
    float _1418 = -_1390;
    float _1420 = _1138 * _1418;
    float _1422 = -_1390;
    float _1424 = -_1410;
    float _1426 = fma(_1122, _1422, _1424);
    float _1428 = _1416 * _1416;
    float _1430 = sqrt(_1374);
    float _1432 = _1396 * _1346;
    float _1434 = _1396 * _1372;
    float _1436 = fma(_1426, _1426, _1428);
    float _1438 = _1402 * 6.283185482025146484375;
    float _1440 = cos(_1438);
    float _1442 = -_1368;
    float _1444 = -_1420;
    float _1446 = fma(_1092, _1442, _1444);
    float _1448 = _1406 * _1372;
    float _1450 = _1406 * _1346;
    float _1452 = fma(_1446, _1446, _1436);
    float _1454 = _1402 * 6.283185482025146484375;
    float _1456 = sin(_1454);
    float _1458 = _1288 * _1430;
    float _1460 = rsqrt(_1452);
    float _1462 = _1396 * _1440;
    float _1464 = _1372 * _1440;
    float _1466 = _1406 * _1440;
    float _1468 = _1346 * _1440;
    float _1470 = _1046 * _1458;
    float _1472 = _831 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1474 = _1466 * _1138;
    float _1476 = fma(_1456, _1448, _1432);
    float _1478 = fma(_1456, _1432, _1448);
    float _1480 = -_1450;
    float _1482 = fma(_1456, _1434, _1480);
    float _1484 = -_1434;
    float _1486 = fma(_1456, _1450, _1484);
    float _1488 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _1490 = floor(_1392);
    float _1492 = _1472 * _1458;
    float _1494 = _1458 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1496 = _1494 * 0.5;
    float _1498 = _1426 * _1460;
    float _1500 = _1416 * _1460;
    float _1502 = _1446 * _1460;
    float _1504 = _1486 * _1122;
    float _1506 = _1470 * _1488;
    float _1508 = _1476 * _1122;
    float _1510 = _1138 * _1500;
    float _1512 = _1466 * _1122;
    float _1514 = fma(_1468, _1502, _1504);
    float _1516 = fma(_1464, _1502, _1508);
    float _1518 = -_1510;
    float _1520 = fma(_1092, _1498, _1518);
    float _1522 = -_1456;
    float _1524 = fma(_1522, _1502, _1512);
    float _1526 = -_1456;
    float _1528 = fma(_1526, _1498, _1474);
    float _1530 = fma(_1490, -0.1500000059604644775390625, 1.0);
    float _1532 = fma(_1482, _1520, _1516);
    float _1534 = fma(_1462, _1520, _1524);
    float _1536 = fma(_1478, _1520, _1514);
    float _1538 = _1476 * _1138;
    float _1540 = precise::max(_1530, 0.20000000298023223876953125);
    float _1542 = _1092 * _1502;
    float _1544 = _1492 * _1078;
    float _1546 = _1486 * _1138;
    float _1548 = precise::min(_1540, 1.0);
    float _1550 = -_1542;
    float _1552 = fma(_1122, _1500, _1550);
    float _1554 = fma(_1464, _1498, _1538);
    float _1556 = _1544 * _1534;
    float _1558 = fma(_1468, _1498, _1546);
    float _1560 = fma(_1462, _1552, _1528);
    float _1562 = fma(_1482, _1552, _1554);
    float _1564 = fma(_1506, _1532, _1556);
    float _1566 = fma(_1478, _1552, _1558);
    float _1568 = _1544 * _1560;
    float _1570 = _1490 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1572 = fma(_1496, _1536, _1564);
    float _1574 = _1466 * _1092;
    float _1576 = fma(_1506, _1562, _1568);
    float _1578 = _1122 * _1498;
    float _1580 = fma(_1572, _1548, _1036);
    float _1582 = -_1456;
    float _1584 = fma(_1582, _1500, _1574);
    float _1586 = fma(_1496, _1566, _1576);
    float _1588 = _1476 * _1092;
    float _1590 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1580);
    float _1592 = -_1578;
    float _1594 = fma(_1138, _1502, _1592);
    float _1596 = fma(_1586, _1548, _1034);
    float _1598 = _1486 * _1092;
    float _1600 = fma(_1464, _1500, _1588);
    float _1602 = fma(_1462, _1594, _1584);
    float _1604 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1596);
    float _1606 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1608 = _1590 + _1606;
    float _1610 = fma(_1468, _1500, _1598);
    float _1612 = fma(_1482, _1594, _1600);
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1616 = _1604 + _1614;
    float _1618 = _1608 * _1608;
    float _1620 = _1544 * _1602;
    float _1622 = fma(_1478, _1594, _1610);
    float _1624 = fma(_1616, _1616, _1618);
    float _1626 = fma(_1506, _1612, _1620);
    float _1628 = sqrt(_1624);
    float _1630 = fma(_1496, _1622, _1626);
    float _1632 = fma(_1630, _1548, _1032);
    float _1634 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1632);
    bool _1636 = _1628 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1644 = _1642 != 0;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1648 = _1646 != 0;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1652 = _1650 != 0;
    bool _1654 = !_1644;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1640;
    int _1660 = _1658 ? 0 : 1;
    bool _1662 = !_1648;
    int _1664 = _1662 ? 0 : 1;
    bool _1666 = !_1652;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = _1610;
    float _1672 = _1604;
    float _1674 = _1590;
    float _1676 = _1588;
    float _1678 = _1496;
    if (!_1636)
    {
        _1670 = _1634;
    }
    float _1680 = _1670;
    bool _1682 = !_1636;
    float _1684 = _1680;
    if (!_1682)
    {
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1690 = _1628 + _1688;
        float _1692 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1694 = rsqrt(_1624);
        float _1696 = _1690 * _1686;
        float _1698 = _1696 * 0.15915493667125701904296875;
        float _1700 = _1698 * 6.283185482025146484375;
        float _1702 = cos(_1700);
        float _1704 = _1698 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 + (-1.0);
        float _1710 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = fma(_1706, _1692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = fma(_1634, _1702, _1710);
        float _1716 = _1694 * _1712;
        float _1718 = fma(_1616, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1720 = fma(_1608, _1716, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1684 = _1714;
        _1672 = _1718;
        _1674 = _1720;
    }
    float _1722 = _1684;
    float _1724 = _1672;
    float _1726 = _1674;
    float _1728 = -_1320;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _1732 = -_1322;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1724);
    float _1736 = -_1324;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1726);
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1742 = _1730 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1746 = _1734 + _1744;
    float _1748 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1750 = _1738 + _1748;
    float _1752 = _1742 * _1742;
    float _1754 = fma(_1746, _1746, _1752);
    float _1756 = fma(_1750, _1750, _1754);
    float _1758 = rsqrt(_1756);
    float _1760 = sqrt(_1756);
    float _1762 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1764 = _1746 * _1762;
    float _1766 = _1750 * _1762;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 * _1766;
    float _1772 = _1768 + _1770;
    float _1774 = sqrt(_1772);
    bool _1776 = _1774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1780 = _1774 + _1778;
    float _1782 = _1750;
    float _1784 = _1772;
    float _1786 = _1780;
    float _1788 = _1742;
    if (_1776)
    {
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1790;
    }
    float _1792 = _1782;
    if (_1776)
    {
        float _1794 = rsqrt(_1772);
        _1784 = _1794;
    }
    float _1796 = _1784;
    if (_1776)
    {
        float _1798 = _1780 * _1792;
        _1786 = _1798;
    }
    float _1800 = _1786;
    if (_1776)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1676 = _1802;
    }
    float _1804 = _1676;
    float _1806 = _1752;
    float _1808 = _1804;
    if (_1776)
    {
        float _1810 = _1804 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1806 = _1812;
    }
    float _1814 = _1806;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = precise::max(0.0, _1816);
    float _1820 = _1758;
    float _1822 = _1818;
    float _1824 = _1816;
    if (_1776)
    {
        float _1826 = _1804 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        _1820 = _1828;
    }
    float _1830 = _1820;
    float _1832 = -_1762;
    float _1834 = -_1818;
    float _1836 = fma(_1742, _1832, _1834);
    if (!_1776)
    {
        _1822 = _1764;
    }
    float _1838 = _1822;
    float _1840 = _1838;
    if (_1776)
    {
        float _1842 = _1836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1824 = _1842;
    }
    float _1844 = _1824;
    float _1846 = _1814;
    float _1848 = _1844;
    if (_1776)
    {
        float _1850 = fma(_1814, _1844, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1846 = _1850;
    }
    float _1852 = _1846;
    float _1854 = _1852;
    if (!_1776)
    {
        _1848 = _1836;
    }
    float _1856 = _1848;
    float _1858 = _1856;
    float _1860 = _1830;
    if (_1776)
    {
        float _1862 = _1830 + (-1.0);
        _1788 = _1862;
    }
    float _1864 = _1788;
    float _1866 = _1864;
    if (_1776)
    {
        float _1868 = _1796 * _1852;
        _1678 = _1868;
    }
    float _1870 = _1678;
    if (!_1776)
    {
        _1854 = _1768;
    }
    float _1872 = _1854;
    float _1874 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1876 = _1872;
    if (_1776)
    {
        float _1878 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1808 = _1878;
    }
    float _1880 = _1808;
    if (_1776)
    {
        float _1882 = _1764 * _1870;
        _1840 = _1882;
    }
    float _1884 = _1840;
    if (!_1776)
    {
        _1866 = _1766;
    }
    float _1886 = _1866;
    float _1888 = _1886;
    if (_1776)
    {
        float _1890 = _1766 * _1870;
        _1888 = _1890;
    }
    float _1892 = _1888;
    if (_1776)
    {
        float _1894 = fma(_1836, _1830, _1880);
        _1858 = _1894;
    }
    float _1896 = _1858;
    if (_1776)
    {
        float _1898 = _1884 * _1884;
        _1876 = _1898;
    }
    float _1900 = _1876;
    if (!_1776)
    {
        _1860 = _1770;
    }
    float _1902 = _1860;
    float _1904 = _1902;
    if (_1776)
    {
        float _1906 = _1892 * _1892;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1896, _1896, _1900);
    float _1912 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1914 = _1910 + _1908;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1918 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1916);
    float _1920 = precise::clamp(_1918, 0.0, 1.0);
    float _1922 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1874);
    float _1924 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1926 = -_1920;
    float _1928 = _1926 + 1.0;
    float _1930 = rsqrt(_1914);
    float _1932 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1922);
    float _1934 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1936 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1924);
    float _1938 = _1730 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1940 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1934);
    float _1944 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1936);
    float _1946 = abs(_1928);
    float _1948 = log2(_1946);
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1952 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1938);
    float _1954 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1942);
    float _1956 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1958 = -_1950;
    float _1960 = fma(_1958, _1912, 1.0);
    float _1962 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1952);
    float _1964 = _1954 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1966 = _1930 * _1884;
    float _1968 = _1930 * _1896;
    float _1970 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1972 = _1930 * _1892;
    float _1974 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1976 = _1962 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1978 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1970);
    float _1980 = log2(_1960);
    float _1982 = -_1974;
    float _1984 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1982);
    float _1986 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1988 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1978);
    float _1990 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1992 = -_1972;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1984);
    float _1996 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1998 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1988);
    float _2000 = exp2(_1986);
    float _2002 = fma(_1994, -0.5, 0.5);
    float _2004 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1990);
    float _2006 = fma(_1994, 0.5, 0.5);
    float _2008 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1996);
    float _2010 = _1968 + 1.0;
    float _2012 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2004);
    float _2014 = fma(_2006, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2016 = 1.0 / _1998;
    float _2018 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2008);
    float _2020 = _1980 * 0.693147182464599609375;
    float _2022 = fma(_2006, _2014, -0.212114393711090087890625);
    float _2024 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2026 = fma(_2006, _2022, 1.570728778839111328125);
    float _2028 = sqrt(_2002);
    float _2030 = -_1968;
    float _2032 = fma(_2000, _2010, _2030);
    float _2034 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2012);
    float _2036 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2018);
    float _2038 = fma(_2032, 0.5, 0.5);
    float _2040 = _2034 * _2016;
    float _2042 = _2036 * _2016;
    float _2044 = fma(_2040, 0.5, 0.5);
    float _2046 = fma(_2042, -0.5, 0.5);
    float _2048 = _2028 * 0.636619746685028076171875;
    float _2050 = -_2026;
    float _2052 = fma(_2048, _2050, 1.0);
    float3 _6205 = float3(_2044, _2046, _2024);
    float _2054 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6205, float3(0.0), isnan(_6205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6205, float3(0.0), isnan(_6205)), level(0.0)).x;
    float3 _6216 = float3(_2044, _2046, _2024);
    float4 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6216, float3(0.0), isnan(_6216)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6216, float3(0.0), isnan(_6216)), level(0.0)).xyzw;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = _2057.w;
    float2 _6233 = float2(_2052, _2038);
    float3 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6233, float2(0.0), isnan(_6233)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6233, float2(0.0), isnan(_6233)), level(0.0)).xyz;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2079 = int(_2077);
    out.m_60.x = _954;
    out.m_60.y = _956;
    out.m_60.z = _960;
    out.m_60.w = _952;
    float _2081 = -_1320;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    int _2085 = abs(_1660);
    float _2087 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2089 = _2087 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2091 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2093 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan(0.5);
    bool _2099 = _2095 || _2097;
    float _2101 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2103 = int(_2101);
    float _2105 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2107 = _623 > 0.5;
    float _2109 = -_1322;
    float _2111 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    bool _2113 = _1004 > 0.5;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2117 = _2115 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2119 = 1.0 / _2089;
    float _2121 = float(_2079);
    float _2123 = -_1324;
    float _2125 = fma(_2123, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2129 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.x = _1734;
    out.m_62.y = _1730;
    out.m_62.z = _1738;
    float _2131 = 1.0 / _2121;
    float _2133 = float(uint(_2103));
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2137 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2135;
    int _2139 = ~_2103;
    int _2141 = _2139 + 1;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2145 = _2143 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _2147 = ~_2103;
    int _2149 = _2147 + 1;
    float _2151 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2129);
    out.m_64.y = _1492;
    float _2153 = 1.0 / _2133;
    float _2155 = _2137 * _2119;
    float _2157 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2151);
    float _2159 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2157);
    float _2161 = _129 * _2131;
    float _2163 = 1.0 / _992;
    int _2165 = as_type<int>(_2153) + (-2);
    float _2167 = trunc(_2161);
    int _2169 = int(_2167);
    float _2171 = 1.0 / _2117;
    float _2173 = float(uint(_2169));
    float _2175 = as_type<float>(_2165) * _2173;
    int _2177 = ~_2103;
    int _2179 = _2177 + 1;
    float _2181 = _2145 * _2171;
    int _2183 = _2103 + (-1);
    float _2185 = trunc(_2175);
    float _2187 = precise::max(_2185, 0.0);
    uint _2189 = uint(_2187);
    int _2191 = _2179 * int(_2189);
    int _2193 = _2191 + _2169;
    float _2195 = float(uint(_2193));
    float _2197 = as_type<float>(_2165) * _2195;
    float _2199 = in.m_56.w;
    float _2201 = trunc(_2197);
    float _2203 = precise::max(_2201, 0.0);
    uint _2205 = uint(_2203);
    int _2207 = int(_2189) + int(_2205);
    int _2209 = _2141 * _2207;
    int _2211 = _2209 + _2169;
    int _2213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2215 = _2213 != 0;
    float _2217 = float(_2103);
    bool _2219 = !_2215;
    float _2221 = _2219 ? 1.2345600128173828125 : 1.0;
    bool _2223 = !_2215;
    float _2225 = _2223 ? _1004 : _623;
    float _2227 = _129 * _2217;
    bool _2229 = uint(_2211) >= uint(_2103);
    float _2231 = float(_2169);
    float _2233 = _2221 * _2225;
    float _2235 = _2227 * _2163;
    bool _2237 = _2231 >= _2217;
    bool _2239 = isnan(_2231);
    bool _2241 = _2237 || _2239;
    bool _2243 = isnan(_2217);
    bool _2245 = _2241 || _2243;
    float _2247 = float(_2245);
    float _2249 = floor(_2233);
    float _2251 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2255 = _2199 > 0.5;
    float _2257 = _623 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2259 = !_2229;
    int _2261 = _2259 ? 0 : (-1);
    float _2263 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2265 = _2103 == 0;
    float _2267 = trunc(_2247);
    int _2269 = int(_2267);
    int _2271 = ~_2207;
    int _2273 = _2271 + _2261;
    int _2275 = _2273 + 1;
    float _2277 = -_2263;
    float _2279 = fma(_2257, 2.0, _2277);
    int _2281 = _2103 * _2275;
    int _2283 = _2281 + _2169;
    int _2285 = abs(_1656);
    float _2287 = 1.0 / _2253;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2291 = -_2249;
    float _2293 = _2233 + _2291;
    float _2295 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2295;
    float _2299 = fma(_2105, -2.0, _2289);
    bool _2301 = !_2265;
    int _2303 = _2301 ? _2283 : (-1);
    float _2305 = _2293 * _2217;
    int _2307 = ~_2269;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    float _2313 = trunc(_2235);
    int _2315 = int(_2313);
    float _2317 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2319 = _2303 * _2311;
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2323 = _2321 != 0;
    float _2325 = _2297 * _2287;
    float _2327 = trunc(_2305);
    int _2329 = int(_2327);
    float _2331 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2317);
    int _2333 = _2269 * _2183;
    int _2335 = _2333 + _2319;
    bool _2337 = !_2323;
    float _2339 = _2337 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2341 = _996 > 0.5;
    int _2343 = _2335 * _2285;
    int _2345 = abs(as_type<int>(_2339));
    float _2347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2349 = as_type<float>(_2335);
    float _2351 = _2339;
    float _2353 = as_type<float>(_2269);
    if (!_2215)
    {
        _2349 = _996;
    }
    float _2355 = _2349;
    float _2357 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2331);
    float _2359 = _2355;
    if (!_2215)
    {
        _2351 = _996;
    }
    float _2361 = _2351;
    float _2363 = _2361;
    if (!_2215)
    {
        _2353 = _1004;
    }
    float _2365 = _2353;
    int _2367 = _2329 * _2345;
    int _2369 = _2367 + _2169;
    float _2371 = _2365;
    if (_2215)
    {
        _2371 = _623;
    }
    float _2373 = _2371;
    int _2375 = _2315 * _2085;
    int _2377 = _2375 + _2343;
    if (_2215)
    {
        _2359 = _1004;
    }
    float _2379 = _2359;
    float _2381 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2383 = _994 + _2381;
    if (_2215)
    {
        _2363 = _1004;
    }
    float _2385 = _2363;
    float _2387 = -_211;
    int _2389 = _2107 ? as_type<int>(_2387) : as_type<int>(_211);
    float _2391 = _2347 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2395 = _2393 != 0;
    float _2397 = -_129;
    float _2399 = fma(_2397, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2279);
    int _2401 = abs(_1664);
    float _2403 = fma(_2181, _2383, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2405 = abs(_1668);
    float _2407 = _2379 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2409 = !_2395;
    float _2411 = _2409 ? _211 : as_type<float>(_2389);
    int _2413 = _2369 * _2401;
    int _2415 = _2413 + _2377;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2419 = _994 + _2417;
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2423 = _2421 != 0;
    float _2425 = _2411 + 0.5;
    int _2427 = _2329 * _2405;
    int _2429 = _2427 + _2415;
    float _2431 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2433 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2299);
    float _2435 = fma(_2391, _2425, _2399);
    float _2437 = -as_type<float>(_207);
    int _2439 = _2113 ? as_type<int>(_2437) : _207;
    float _2441 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2431);
    float _2443 = float(uint(_2429));
    float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2447 = fma(_2155, _2419, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2449 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2451 = _994 + _2449;
    float _2453 = as_type<float>(_2165) * _2443;
    bool _2455 = !_2423;
    float _2457 = _2455 ? as_type<float>(_207) : as_type<float>(_2439);
    float _2459 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2461 = float(uint(_2369));
    float _2463 = trunc(_2453);
    float _2465 = precise::max(_2463, 0.0);
    uint _2467 = uint(_2465);
    float _2469 = fma(_2325, _2451, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2471 = ~_2103;
    int _2473 = _2471 + 1;
    float _2475 = _2457 + (-0.5);
    float _2477 = fma(_2385, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2459);
    float _2479 = as_type<float>(_2165) * _2461;
    bool _2481 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2483 = isnan(_994);
    bool _2485 = _2481 || _2483;
    bool _2487 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2489 = _2485 || _2487;
    float _2491 = float(_2489);
    float _2493 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2441);
    float _2495 = _2445 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2497 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2499 = isnan(_994);
    bool _2501 = _2497 || _2499;
    bool _2503 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2505 = _2501 || _2503;
    float _2507 = float(_2505);
    float _2509 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2477);
    float _2511 = trunc(_2479);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    float _2517 = -_2495;
    float _2519 = -_2433;
    float _2521 = fma(_2517, _2475, _2519);
    bool _2523 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2525 = isnan(_994);
    bool _2527 = _2523 || _2525;
    bool _2529 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2531 = _2527 || _2529;
    float _2533 = float(_2531);
    float _2535 = -_2507;
    float _2537 = _2535 + 1.0;
    bool _2539 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2541 = isnan(_994);
    bool _2543 = _2539 || _2541;
    bool _2545 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2547 = _2543 || _2545;
    float _2549 = float(_2547);
    int _2551 = _2473 * int(_2467);
    int _2553 = _2551 + _2429;
    float _2555 = -_2533;
    float _2557 = _2555 + 1.0;
    float _2559 = _2533 * _2537;
    float _2561 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2127);
    float _2563 = float(uint(_2553));
    float _2565 = _2491 * _2557;
    float _2567 = -_2491;
    float _2569 = _2567 + 1.0;
    float _2571 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2573 = as_type<float>(_2165) * _2563;
    float _2575 = _2549 * _2569;
    int _2577 = _2473 * int(_2515);
    int _2579 = _2577 + _2369;
    float _2581 = -_2549;
    float _2583 = _2581 + 1.0;
    float _2585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2587 = _2447 * _2575;
    float _2589 = trunc(_2573);
    float _2591 = precise::max(_2589, 0.0);
    uint _2593 = uint(_2591);
    float _2595 = fma(_2407, -2.0, _2571);
    float _2597 = float(uint(_2579));
    float _2599 = fma(_2583, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2587);
    float _2601 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2603 = _2373 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2607 = _2605 != 0;
    float _2609 = as_type<float>(_2165) * _2597;
    float _2611 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2601);
    float _2613 = -_211;
    int _2615 = _2341 ? as_type<int>(_2613) : as_type<int>(_211);
    float _2617 = -_2585;
    float _2619 = fma(_2603, 2.0, _2617);
    float _2621 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2561);
    float _2623 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2611);
    bool _2625 = !_2607;
    float _2627 = _2625 ? _211 : as_type<float>(_2615);
    float _2629 = -_129;
    float _2631 = fma(_2629, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2619);
    float _2633 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2635 = int(_2467) + int(_2593);
    float _2637 = _2623 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2639 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2595);
    float _2641 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2633);
    float _2643 = fma(_2403, _2565, _2599);
    int _2645 = _2149 * _2635;
    int _2647 = _2645 + _2429;
    float _2649 = 1.0 / _2637;
    float _2651 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2641);
    float _2653 = _2627 + 0.5;
    float _2655 = -_2621;
    float _2657 = _2655 + 1.0;
    bool _2659 = uint(_2647) >= uint(_2103);
    float _2661 = _2651 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2663 = fma(_2653, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2631);
    float _2665 = -as_type<float>(_207);
    float _2667 = _2255 ? _2665 : as_type<float>(_207);
    float _2669 = trunc(_2609);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    bool _2675 = !_2659;
    int _2677 = _2675 ? 0 : (-1);
    float _2679 = _2661 + _2637;
    int _2681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2683 = _2681 != 0;
    float _2685 = -_2509;
    float _2687 = _2685 + 1.0;
    int _2689 = ~_2635;
    int _2691 = _2689 + _2677;
    int _2693 = _2691 + 1;
    float _2695 = -_2657;
    float _2697 = fma(_2627, _2695, _2663);
    bool _2699 = !_2683;
    float _2701 = _2699 ? as_type<float>(_207) : _2667;
    float _2703 = _2679 * _2649;
    float _2705 = _2703 * 0.5;
    int _2707 = ~_2103;
    int _2709 = _2707 + 1;
    int _2711 = _2103 * _2693;
    int _2713 = _2711 + _2429;
    float _2715 = _2667;
    float _2717 = _2705;
    float _2719 = _2631;
    if (!_2099)
    {
        _2715 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2721 = _2715;
    float _2723 = -_2493;
    float _2725 = _2723 + 1.0;
    float _2727 = as_type<float>(_207) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2729 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2731 = !_2265;
    int _2733 = _2731 ? _2713 : (-1);
    float _2735 = _2721;
    if (!_2099)
    {
        float _2737 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2739 = fma(_2705, _2721, _2737);
        _2735 = _2739;
    }
    float _2741 = _2735;
    float _2743 = fma(_2457, _2725, _2521);
    int _2745 = _2733 >> 31;
    float _2747 = _1602 * _2727;
    int _2749 = int(_2515) + int(_2673);
    float _2751 = _2701 + (-0.5);
    int _2753 = _2745 & 3;
    float _2755 = -_2357;
    float _2757 = _2755 + 1.0;
    if (!_2099)
    {
        _2717 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2759 = _2717;
    float _2761 = _2741;
    if (!_2099)
    {
        float _2763 = 1.0 / _2741;
        _2761 = _2763;
    }
    float _2765 = _2761;
    int _2767 = _2733 + _2753;
    int _2769 = _2709 * _2749;
    int _2771 = _2769 + _2369;
    float _2773 = -_2751;
    float _2775 = -_2639;
    float _2777 = fma(_2773, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2775);
    if (!_2099)
    {
        float _2779 = -_2759;
        float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2719 = _2781;
    }
    float _2783 = _2719;
    int _2785 = _2767 >> 2;
    float _2787 = -_2757;
    float _2789 = fma(_2411, _2787, _2435);
    bool _2791 = uint(_2771) >= uint(_2103);
    float _2793 = fma(_2701, _2687, _2777);
    int _2795 = _2785 << 4;
    int _2797 = _2795 + 512;
    float _2799 = _2783;
    float _2801 = _2789;
    if (!_2099)
    {
        float _2803 = 1.0 / _2783;
        _2799 = _2803;
    }
    float _2805 = _2799;
    bool _2807 = !_2791;
    int _2809 = _2807 ? 0 : (-1);
    float _2811 = fma(_1612, _2729, _2747);
    uint _2813 = uint(int(uint(_2797) >> uint(2)));
    uint _2815 = uint(int(uint(int(_2813)) >> uint(2)));
    int _2817 = int(_2813) & 3;
    float _2819 = (*spvDescriptorSet0.vp_c9)._m0[int(_2815)][_2817];
    int _2821 = int(_2813) + 1;
    uint _2823 = uint(int(uint(_2821) >> uint(2)));
    int _2825 = _2821 & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    int _2829 = _2733 & 3;
    bool _2831 = _2829 != 0;
    out.m_66.x = _2789;
    out.m_66.y = _2743;
    out.m_66.z = _2697;
    out.m_66.w = _2793;
    float _2833 = _2765;
    if (!_2099)
    {
        float _2835 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2837 = -_2759;
        float _2839 = fma(_2765, _2835, _2837);
        _2833 = _2839;
    }
    float _2841 = _2833;
    int _2843 = ~_2749;
    int _2845 = _2843 + _2809;
    int _2847 = _2845 + 1;
    float _2849 = _1622 + _2811;
    int _2851 = _2733 & 3;
    bool _2853 = _2851 != 0;
    float _2855 = fma(_2469, _2559, _2643);
    int _2857 = _2797 + 8;
    uint _2859 = uint(int(uint(_2857) >> uint(2)));
    uint _2861 = uint(int(uint(int(_2859)) >> uint(2)));
    int _2863 = int(_2859) & 3;
    float _2865 = (*spvDescriptorSet0.vp_c9)._m0[int(_2861)][_2863];
    int _2867 = int(_2859) + 1;
    uint _2869 = uint(int(uint(_2867) >> uint(2)));
    int _2871 = _2867 & 3;
    float _2873 = (*spvDescriptorSet0.vp_c9)._m0[int(_2869)][_2871];
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2877 = _2875 != 0;
    int _2879 = _2103 * _2847;
    int _2881 = _2879 + _2369;
    bool _2883 = uint(_2851) > 1u;
    float _2885 = fma(_2507, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2855);
    float _2887 = _2841;
    if (!_2099)
    {
        float _2889 = _2841 * _2805;
        float _2891 = precise::clamp(_2889, 0.0, 1.0);
        _2887 = _2891;
    }
    float _2893 = _2887;
    bool _2895 = !_2265;
    int _2897 = _2895 ? _2881 : (-1);
    float _2899 = _1560 * _2727;
    int _2901 = _2831 ? 0 : 1;
    float _2903 = _1534 * _2727;
    bool _2905 = _2851 != 3;
    float _2907 = fma(_1562, _2729, _2899);
    if (_2099)
    {
        _2801 = 1.0;
    }
    float _2909 = _2801;
    float _2911 = _2909;
    if (!_2099)
    {
        float _2913 = -_2893;
        float _2915 = _2913 + 1.0;
        _2911 = _2915;
    }
    float _2917 = _2911;
    bool _2919 = uint(_2851) >= 2u;
    float _2921 = fma(_1532, _2729, _2903);
    int _2923 = ~_2901;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    float _2929 = _2885 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2931 = _2927;
    if (!_2883)
    {
        int _2933 = ~_2901;
        int _2935 = _2933 + 1;
        _2931 = _2935;
    }
    int _2937 = _2931;
    float _2939 = _1536 + _2921;
    int _2941 = _2919 ? 0 : 1;
    bool _2943 = !_2853;
    int _2945 = _2943 ? 0 : 1;
    out.m_68.w = _2929;
    int _2947 = abs(_2937);
    bool _2949 = _2851 != 3;
    int _2951 = ~_2941;
    int _2953 = _2951 + 1;
    int _2955 = _2953 + 1;
    int _2957 = abs(_2945);
    int _2959 = _2955;
    if (_2905)
    {
        int _2961 = ~_2941;
        int _2963 = _2961 + 1;
        _2959 = _2963;
    }
    int _2965 = _2959;
    bool _2967 = !_2949;
    int _2969 = _2967 ? 0 : (-1);
    int _2971 = abs(_2965);
    int _2973 = abs(_2969);
    int _2975 = ~_2957;
    int _2977 = _2975 + 1;
    int _2979 = _2977 + 1;
    float _2981 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2983 = ~_2947;
    int _2985 = _2983 + 1;
    int _2987 = _2985 + 1;
    float _2989 = _1566 + _2907;
    int _2991 = ~_2971;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    bool _2997 = _2917 > 0.0;
    bool _2999 = isnan(_2917);
    bool _3001 = _2997 || _2999;
    bool _3003 = isnan(0.0);
    bool _3005 = _3001 || _3003;
    float _3007 = exp2(_2981);
    int _3009 = _2987 * as_type<int>(_2827);
    bool _3011 = !_2877;
    int _3013 = _3011 ? 0 : 1;
    out.m_70.x = _2989;
    out.m_70.y = _2849;
    out.m_70.z = _2939;
    int _3015 = _2979 * as_type<int>(_2819);
    int _3017 = _3015 + _3009;
    int _3019 = abs(_3013);
    int _3021 = ~_2973;
    int _3023 = _3021 + 1;
    int _3025 = _3023 + 1;
    int _3027 = _2995 * as_type<int>(_2865);
    int _3029 = _3027 + _3017;
    float _3031 = _2917 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3033 = _3025 * as_type<int>(_2873);
    int _3035 = _3033 + _3029;
    int _3037 = ~_3019;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    float _3043 = _711 * _3031;
    float _3045 = -_3007;
    float _3047 = _3045 + 1.0;
    int _3049 = _3035 * _3041;
    float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3053 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3055 = _2159 + _3053;
    float _3057 = _3043 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _3059 = _2897 * _3019;
    int _3061 = _3059 + _3049;
    float _3063 = _3051 * _2054;
    float _3065 = _1998 + _3055;
    float _3067 = -_3051;
    float _3069 = _3067 + 1.0;
    out.gl_Position.x = _2034;
    out.gl_Position.y = _2036;
    out.gl_Position.z = _3055;
    out.gl_Position.w = _1998;
    float _3071 = _2065 * _3063;
    float _3073 = _2075 * _3063;
    float _3075 = _3065 * 0.5;
    float _3077 = float(_3061);
    float _3079 = fma(_2071, _3071, _2059);
    float _3081 = fma(_2073, _3071, _2061);
    float _3083 = _2065 * _3069;
    float _3085 = fma(_2065, _3073, _2063);
    out.m_72.z = _3075;
    out.m_72.w = _1998;
    out.m_74.y = _3077;
    out.m_45.x = _3057;
    out.m_76.x = _3079;
    out.m_76.y = _3081;
    out.m_76.z = _3085;
    out.m_76.w = _3083;
    if (_3005)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3087 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3087;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

