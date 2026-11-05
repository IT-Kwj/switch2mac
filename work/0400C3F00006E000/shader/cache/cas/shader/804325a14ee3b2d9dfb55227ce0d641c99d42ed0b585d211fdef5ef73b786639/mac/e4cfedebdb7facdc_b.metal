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
    float4 m_66 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _980 = false;
    bool _847 = false;
    bool _727 = false;
    bool _491 = false;
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
        float _3106 = as_type<float>(_111);
        out.gl_Position.z = _3106;
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
        out.m_45.x = 0.0;
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
        float _3174 = as_type<float>(_149);
        out.gl_Position.z = _3174;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = 0.0;
    float _173 = _153;
    if (!_169)
    {
        float _175 = _153 * _153;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = 0.0;
    float _183 = _179;
    if (!_169)
    {
        float _185 = _129 * _129;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    if (!_169)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _191;
    }
    float _193 = _183;
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    bool _203 = !_201;
    int _205 = _203 ? (-1090519040) : 1056964608;
    bool _207 = !_197;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_169;
    float _213 = _193;
    float _215 = _151;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _153 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _153);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _245;
        _133 = _233;
        _215 = _235;
    }
    float _247 = _213;
    float _249 = _133;
    float _251 = _215;
    bool _253 = !_169;
    float _255 = _251;
    float _257 = _249;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _153 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _265;
        _173 = _277;
    }
    float _279 = _255;
    float _281 = _173;
    float _283 = _279;
    if (!_169)
    {
        _283 = _129;
    }
    float _285 = _283;
    float _287 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _285;
    if (!_169)
    {
        float _291 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _291;
    }
    float _293 = _257;
    bool _295 = !_169;
    float _297 = _293;
    if (!_295)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _305 = _303 + 1.0;
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _129 * _301;
        float _311 = 1.0 / _305;
        float _313 = _307 * 0.693147182464599609375;
        float _315 = exp2(_309);
        float _317 = 1.0 / _313;
        float _319 = _315 + (-1.0);
        float _321 = -_319;
        float _323 = fma(_321, _317, _129);
        float _325 = _323 * _311;
        float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _327;
    }
    float _329 = _297;
    bool _331 = !_169;
    if (!_331)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _129 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _289 = _351;
    }
    float _353 = _289;
    float _355 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = fma(_281, _157, _287);
    float _361 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_353, _157, _355);
    float _365 = fma(_281, _155, _357);
    float _367 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_353, _155, _361);
    float _373 = -_363;
    float _375 = _359 + _373;
    float _377 = fma(_353, _159, _367);
    float _379 = fma(_281, _159, _369);
    float _381 = -_371;
    float _383 = _365 + _381;
    float _385 = _375 * _375;
    float _387 = in.m_52.w;
    float _389 = -_377;
    float _391 = _379 + _389;
    float _393 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = fma(_383, _383, _385);
    out.m_54.y = as_type<float>(_205);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _401 = fma(_391, _391, _395);
    float _403 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = in.m_42.x;
    float _407 = in.m_42.y;
    float _409 = in.m_42.z;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _413 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _415 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _417 = sqrt(_401);
    float _419 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    float _421 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    bool _423 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan(9.9999999747524270787835121154785e-07);
    bool _431 = _427 || _429;
    float _433 = fma(_365, _387, _405);
    float _435 = fma(_359, _387, _407);
    float _437 = fma(_379, _387, _409);
    float _439 = _411;
    float _441 = _387;
    float _443 = _421;
    if (_431)
    {
        _439 = _413;
    }
    float _445 = _439;
    float _447 = _445;
    if (_431)
    {
        _441 = _419;
    }
    float _449 = _441;
    float _451 = _449;
    if (!_431)
    {
        bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _455 = !_453;
        if (!_455)
        {
            float _457 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _459 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
            float _475 = _469 * _469;
            float _477 = fma(_471, _471, _475);
            float _479 = fma(_473, _473, _477);
            float _481 = rsqrt(_479);
            float _483 = _481 * 9.9999999747524270787835121154785e-07;
            float _485 = _471 * _483;
            float _487 = _469 * _483;
            float _489 = _473 * _483;
            _451 = _487;
            _447 = _485;
            _443 = _489;
            _491 = true;
        }
        else
        {
            float _493 = _157 * _157;
            float _495 = fma(_155, _155, _493);
            float _497 = fma(_159, _159, _495);
            float _499 = sqrt(_497);
            bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
            bool _503 = isnan(_499);
            bool _505 = _501 || _503;
            bool _507 = isnan(9.9999999747524270787835121154785e-07);
            bool _509 = _505 || _507;
            if (!_509)
            {
                float _511 = _407 * _407;
                float _513 = fma(_405, _405, _511);
                float _515 = fma(_409, _409, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                if (!_527)
                {
                    float _529 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _529);
                    float _533 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _451 = _541;
                    _447 = _539;
                    _443 = _543;
                    _491 = true;
                }
                else
                {
                    float _545 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _549 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _551 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                    float _553 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                    float _557 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                    float _559 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                    float _561 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                    float _563 = _557 * _557;
                    float _565 = fma(_559, _559, _563);
                    float _567 = fma(_561, _561, _565);
                    float _569 = rsqrt(_567);
                    float _571 = _569 * 9.9999999747524270787835121154785e-07;
                    float _573 = _559 * _571;
                    float _575 = _557 * _571;
                    float _577 = _561 * _571;
                    _451 = _575;
                    _447 = _573;
                    _443 = _577;
                    _491 = true;
                }
            }
            else
            {
                float _579 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _581 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _583 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _585 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _579);
                float _587 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
                float _589 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
                float _591 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _585);
                float _593 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _587);
                float _595 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _589);
                float _597 = _591 * _591;
                float _599 = fma(_593, _593, _597);
                float _601 = fma(_595, _595, _599);
                float _603 = rsqrt(_601);
                float _605 = _603 * 9.9999999747524270787835121154785e-07;
                float _607 = _593 * _605;
                float _609 = _591 * _605;
                float _611 = _595 * _605;
                _451 = _609;
                _447 = _607;
                _443 = _611;
            }
        }
    }
    _491 = false;
    float _613 = _451;
    float _615 = _447;
    float _617 = _443;
    float _619 = in.m_56.x;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _623 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _631 = _629 != 0;
    float _633 = _623 * _621;
    int _635 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _637 = _635 != 0;
    float _639 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[20].x, _633);
    bool _641 = !_631;
    int _643 = _641 ? 0 : 1;
    float _645 = _639 * 6.283185482025146484375;
    float _647 = floor(_639);
    int _649 = abs(_643);
    float _651 = _645 * 0.15915493667125701904296875;
    bool _653 = !_627;
    int _655 = _653 ? 0 : 1;
    int _657 = abs(_655);
    float _659 = _651 * 6.283185482025146484375;
    float _661 = cos(_659);
    bool _663 = !_637;
    int _665 = _663 ? 0 : 1;
    bool _667 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _669 = -_647;
    float _671 = _639 + _669;
    int _673 = abs(_665);
    float _675 = float(_657);
    float _677 = -_671;
    float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _681 = _671 < 0.5;
    float _683 = float(_681);
    float _685 = abs(_679);
    float _687 = _675 * _685;
    float _689 = fma(_661, 0.5, 0.5);
    float _691 = float(_673);
    float _693 = -_683;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _697 = float(_649);
    float _699 = -_689;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _703 = fma(_691, _701, _687);
    float _705 = abs(_695);
    float _707 = fma(_697, _705, _703);
    bool _709 = !_667;
    float _725;
    if (!_709)
    {
        float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _713 = _619 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _717 = _715 * _711;
        float _719 = floor(_717);
        float _721 = -_719;
        float _723 = _717 + _721;
        _725 = _723;
        _727 = true;
    }
    else
    {
        float _729 = float(_95);
        float _731 = 1.0 / _729;
        float _733 = _129 * _731;
        _725 = _733;
    }
    _727 = false;
    float _735 = _725;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _739 = _735 + _737;
    float _741 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _743 = in.m_52.x;
    float _745 = in.m_52.y;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _747;
    bool _751 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _753 = isnan(_735);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _741 * _619;
    bool _765 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _767 = 1.0 / _749;
    float _769 = -_761;
    float _771 = _769 + 1.0;
    float _773 = trunc(_763);
    int _775 = int(_773);
    float _777 = _739 * _767;
    bool _779 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _781 = isnan(_735);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _795;
    float _799 = _789 * _771;
    float _801 = fma(_793, _777, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _803 = fma(_797, _777, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _805 = -_789;
    float _807 = _805 + 1.0;
    int _809 = _775 << 4;
    int _811 = _809 + 1712;
    float _813 = _801 * _799;
    float _815 = _803 * _799;
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[143].x, _813);
    float _819 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[143].y, _815);
    float _821 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].x, _817);
    float _823 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].y, _819);
    float _825 = _821 * _743;
    float _827 = _823 * _745;
    bool _829 = !_765;
    float _845;
    if (!_829)
    {
        float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _833 = _619 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _837 = _835 * _831;
        float _839 = floor(_837);
        float _841 = -_839;
        float _843 = _837 + _841;
        _845 = _843;
        _847 = true;
    }
    else
    {
        float _849 = float(_95);
        float _851 = 1.0 / _849;
        float _853 = _129 * _851;
        _845 = _853;
    }
    _847 = false;
    float _855 = _845;
    int _857 = _811 + 8;
    uint _860 = uint(int(uint(_857) >> uint(2)));
    uint _862 = uint(int(uint(int(_860)) >> uint(2)));
    int _864 = int(_860) & 3;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[int(_862)][_864];
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _870 = _855 + _868;
    bool _872 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _874 = isnan(_855);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _888 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _890 = isnan(_855);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    uint _900 = uint(int(uint(_811) >> uint(2)));
    uint _902 = uint(int(uint(int(_900)) >> uint(2)));
    int _904 = int(_900) & 3;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[int(_902)][_904];
    int _908 = int(_900) + 1;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    int _912 = _908 & 3;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[int(_910)][_912];
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _916;
    float _920 = -_882;
    float _922 = _920 + 1.0;
    bool _924 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _926 = 1.0 / _886;
    float _928 = _898 * _922;
    float _930 = -_898;
    float _932 = _930 + 1.0;
    float _934 = _918 * _926;
    float _936 = fma(_934, _870, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _938 = _936 * _928;
    float _940 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[115].x, _938);
    float _942 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[116].x, _940);
    float _944 = _866 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _942 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _950 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = _914 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _958 = !_924;
    float _976;
    float _978;
    if (!_958)
    {
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _962 = _619 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _964 = float(_95);
        float _966 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _968 = _966 * _960;
        float _970 = floor(_968);
        float _972 = -_970;
        float _974 = _968 + _972;
        _976 = _964;
        _978 = _974;
        _980 = true;
    }
    else
    {
        float _982 = float(_95);
        float _984 = 1.0 / _982;
        float _986 = _129 * _984;
        _976 = _982;
        _978 = _986;
    }
    _980 = false;
    float _988 = _976;
    float _990 = _978;
    float _992 = in.m_56.z;
    float _994 = _619 * 2.0;
    float _996 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _998 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1000 = in.m_56.y;
    float _1002 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1004 = _613 * _613;
    float _1006 = floor(_994);
    float _1008 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _998);
    float _1010 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _996);
    float _1012 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1002);
    float _1014 = fma(_615, _615, _1004);
    float _1016 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1008);
    float _1018 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1010);
    float _1020 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1012);
    float _1022 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1024 = log2(_1022);
    float _1026 = fma(_617, _617, _1014);
    float _1028 = _1016 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1030 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1032 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1034 = rsqrt(_1026);
    float _1036 = _992 * 2.0;
    bool _1038 = _1006 > 0.0;
    float _1040 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1042 = _1006 >= 0.0;
    bool _1044 = isnan(_1006);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = _1000 * 2.0;
    float _1054 = _1000 + _992;
    float _1056 = floor(_1036);
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1068 = _1066 != 0;
    float _1070 = _129 * _1024;
    float _1072 = _1054 + (-1.0);
    bool _1074 = !_1064;
    int _1076 = _1074 ? 0 : 1;
    float _1078 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1080 = floor(_1052);
    float _1082 = _619 + _992;
    int _1084 = abs(_1076);
    float _1086 = _1082 + (-1.0);
    bool _1088 = _1056 > 0.0;
    float _1090 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1092 = _1056 >= 0.0;
    bool _1094 = isnan(_1056);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    float _1102 = exp2(_1070);
    bool _1104 = !_1060;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = in.m_58.x;
    float _1110 = in.m_58.y;
    float _1112 = in.m_58.z;
    float _1114 = _1034 * _613;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1118 = 1.0 + _1116;
    bool _1120 = _1080 > 0.0;
    bool _1122 = _1080 >= 0.0;
    bool _1124 = isnan(_1080);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = _1034 * _615;
    float _1134 = _1034 * _617;
    int _1136 = _1050 ? 0 : 1;
    float _1138 = 1.0 / _1118;
    int _1140 = _1100 ? 0 : 1;
    float _1142 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1144 = ~_1136;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    int _1150 = _1148;
    if (!_1038)
    {
        int _1152 = ~_1136;
        int _1154 = _1152 + 1;
        _1150 = _1154;
    }
    int _1156 = _1150;
    float _1158 = -_1102;
    float _1160 = _1158 + 1.0;
    int _1162 = ~_1140;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    int _1168 = _1166;
    if (!_1088)
    {
        int _1170 = ~_1140;
        int _1172 = _1170 + 1;
        _1168 = _1172;
    }
    int _1174 = _1168;
    float _1176 = _1000 + (-0.5);
    int _1178 = abs(_1106);
    float _1180 = float(_1084);
    float _1182 = float(_1156);
    bool _1184 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1186 = isnan(0.0);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1192 = _1188 || _1190;
    float _1194 = _1180 * _1182;
    int _1196 = _1130 ? 0 : 1;
    float _1198 = float(_1178);
    float _1200 = _1194 * (-2.0);
    float _1202 = _1192 ? _1160 : 0.0;
    int _1204 = ~_1196;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    int _1210 = _1208;
    if (!_1120)
    {
        int _1212 = ~_1196;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1028 + _1218;
    float _1222 = float(_1174);
    float _1224 = fma(_1200, _1110, _1110);
    float _1226 = _1202 * _1138;
    float _1228 = fma(_1078, _1200, _1078);
    float _1230 = _619 + _1000;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1030 + _1232;
    float _1236 = _1220 * _1220;
    float _1238 = _1198 * _1222;
    float _1240 = _1230 + (-1.0);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1244 = _1032 + _1242;
    float _1246 = fma(_1234, _1234, _1236);
    float _1248 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1224);
    bool _1250 = !_1068;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = _1238 * (-2.0);
    float _1256 = fma(_1244, _1244, _1246);
    bool _1258 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1260 = isnan(1.0);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1266 = _1262 || _1264;
    int _1268 = abs(_1252);
    bool _1270 = !_1266;
    float _1272 = _1270 ? _129 : _1226;
    float _1274 = rsqrt(_1256);
    float _1276 = float(_1268);
    float _1278 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1142);
    float _1280 = float(_1216);
    float _1282 = fma(_1272, _1228, _1248);
    float _1284 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1286 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1278);
    float _1288 = _619 + (-0.5);
    float _1290 = _1276 * _1280;
    float _1292 = fma(_1254, _1108, _1108);
    float _1294 = _1282 * 0.15915493667125701904296875;
    float _1296 = abs(_1286);
    bool _1298 = _1296 > 0.99989998340606689453125;
    float _1300 = _1290 * (-2.0);
    float _1302 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1292);
    float _1304 = fma(_1284, _1254, _1284);
    float _1306 = _1220 * _1274;
    float _1308 = fma(_1090, _1300, _1090);
    float _1310 = fma(_1300, _1112, _1112);
    float _1312 = _992 + (-0.5);
    float _1314 = _1234 * _1274;
    float _1316 = -_1306;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1320 = fma(_1272, _1304, _1302);
    float _1322 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1310);
    float _1324 = _1254;
    float _1326 = _1288;
    float _1328 = _1322;
    float _1330 = _1272;
    if (_1298)
    {
        _1324 = 0.001000000047497451305389404296875;
    }
    float _1332 = _1324;
    float _1334 = -_1314;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1338 = _1318 * _1318;
    float _1340 = _1244 * _1274;
    float _1342 = _1320 * 0.15915493667125701904296875;
    if (!_1298)
    {
        _1326 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1344 = _1326;
    float _1346 = fma(_1272, _1308, _1322);
    float _1348 = fma(_1336, _1336, _1338);
    float _1350 = _1344;
    if (_1298)
    {
        float _1352 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1350 = _1352;
    }
    float _1354 = _1350;
    float _1356 = -_1340;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _1360 = _1294 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    if (!_1298)
    {
        _1328 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1364 = _1328;
    float _1366 = _1346 * 0.15915493667125701904296875;
    float _1368 = _1364;
    if (_1298)
    {
        float _1370 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1368 = _1370;
    }
    float _1372 = _1368;
    float _1374 = fma(_1358, _1358, _1348);
    if (!_1298)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1376 = _1330;
    float _1378 = -_1372;
    float _1380 = _1114 * _1378;
    float _1382 = _1294 * 6.283185482025146484375;
    float _1384 = cos(_1382);
    float _1386 = _1342 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = _1376;
    if (_1298)
    {
        float _1392 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = _1342 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = -_1394;
    float _1402 = _1132 * _1400;
    float _1404 = -_1394;
    float _1406 = -_1380;
    float _1408 = fma(_1134, _1404, _1406);
    float _1410 = -_1354;
    float _1412 = -_1402;
    float _1414 = fma(_1114, _1410, _1412);
    float _1416 = _1366 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = -_1354;
    float _1422 = _1134 * _1420;
    float _1424 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1426 = _1388 * _1362;
    float _1428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1430 = -_1372;
    float _1432 = -_1422;
    float _1434 = fma(_1132, _1430, _1432);
    float _1436 = sqrt(_1374);
    float _1438 = _1398 * _1384;
    float _1440 = _1398 * _1362;
    float _1442 = _1366 * 6.283185482025146484375;
    float _1444 = sin(_1442);
    float _1446 = _1434 * _1434;
    float _1448 = _1384 * _1418;
    float _1450 = _1362 * _1418;
    float _1452 = fma(_1408, _1408, _1446);
    float _1454 = fma(_1414, _1414, _1452);
    float _1456 = _1388 * _1384;
    float _1458 = _1398 * _1418;
    float _1460 = fma(_129, 0.014999999664723873138427734375, _619);
    float _1462 = rsqrt(_1454);
    float _1464 = _1274 * _1436;
    float _1466 = _1388 * _1418;
    float _1468 = fma(_1444, _1438, _1426);
    float _1470 = -_1456;
    float _1472 = fma(_1444, _1440, _1470);
    float _1474 = _1424 * _1464;
    float _1476 = fma(_1444, _1426, _1438);
    float _1478 = floor(_1460);
    float _1480 = _1474 * _1428;
    float _1482 = _1468 * _1134;
    float _1484 = -_1440;
    float _1486 = fma(_1444, _1456, _1484);
    float _1488 = _1472 * _1134;
    float _1490 = _1434 * _1462;
    float _1492 = _1414 * _1462;
    float _1494 = _1458 * _1134;
    float _1496 = _1408 * _1462;
    float _1498 = _1132 * _1490;
    float _1500 = fma(_1448, _1492, _1482);
    float _1502 = -_1444;
    float _1504 = fma(_1502, _1492, _1494);
    float _1506 = fma(_1450, _1492, _1488);
    float _1508 = fma(_1478, -0.1500000059604644775390625, 1.0);
    float _1510 = -_1498;
    float _1512 = fma(_1114, _1496, _1510);
    float _1514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_205));
    float _1516 = _1458 * _1132;
    float _1518 = fma(_1486, _1512, _1500);
    float _1520 = precise::max(_1508, 0.20000000298023223876953125);
    float _1522 = _1040 * _1464;
    float _1524 = _1114 * _1492;
    float _1526 = fma(_1466, _1512, _1504);
    float _1528 = fma(_1476, _1512, _1506);
    float _1530 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1532 = _1530 * 0.5;
    float _1534 = _1468 * _1132;
    float _1536 = -_1444;
    float _1538 = fma(_1536, _1496, _1516);
    float _1540 = -_1524;
    float _1542 = fma(_1134, _1490, _1540);
    float _1544 = _1522 * _1514;
    float _1546 = _1472 * _1132;
    float _1548 = fma(_1448, _1496, _1534);
    float _1550 = fma(_1466, _1542, _1538);
    float _1552 = _1544 * _1526;
    float _1554 = fma(_1450, _1496, _1546);
    float _1556 = fma(_1486, _1542, _1548);
    float _1558 = _1544 * _1550;
    float _1560 = fma(_1480, _1518, _1552);
    float _1562 = precise::min(_1520, 1.0);
    float _1564 = fma(_1476, _1542, _1554);
    float _1566 = fma(_1480, _1556, _1558);
    float _1568 = fma(_1532, _1528, _1560);
    float _1570 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1572 = _1134 * _1496;
    float _1574 = fma(_1532, _1564, _1566);
    float _1576 = fma(_1568, _1562, _1032);
    float _1578 = _1472 * _1114;
    float _1580 = -_1572;
    float _1582 = fma(_1132, _1492, _1580);
    float _1584 = fma(_1574, _1562, _1030);
    float _1586 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1576);
    float _1588 = fma(_1450, _1490, _1578);
    float _1590 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1584);
    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1594 = _1586 + _1592;
    float _1596 = _1458 * _1114;
    float _1598 = fma(_1476, _1582, _1588);
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1602 = _1590 + _1600;
    float _1604 = _1594 * _1594;
    float _1606 = -_1444;
    float _1608 = fma(_1606, _1490, _1596);
    float _1610 = _1468 * _1114;
    float _1612 = fma(_1602, _1602, _1604);
    float _1614 = fma(_1466, _1582, _1608);
    float _1616 = fma(_1448, _1490, _1610);
    float _1618 = sqrt(_1612);
    float _1620 = _1544 * _1614;
    float _1622 = fma(_1486, _1582, _1616);
    float _1624 = fma(_1480, _1622, _1620);
    float _1626 = fma(_1532, _1598, _1624);
    float _1628 = fma(_1626, _1562, _1028);
    bool _1630 = _1618 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1628);
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1644 = _1642 != 0;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1648 = _1646 != 0;
    bool _1650 = !_1640;
    int _1652 = _1650 ? 0 : 1;
    bool _1654 = !_1636;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1644;
    int _1660 = _1658 ? 0 : 1;
    bool _1662 = !_1648;
    float _1664 = _1662 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1666 = _1588;
    float _1668 = _1590;
    float _1670 = _1586;
    float _1672 = _1628;
    float _1674 = _1602;
    float _1676 = _1664;
    if (!_1630)
    {
        _1666 = _1632;
    }
    float _1678 = _1666;
    bool _1680 = !_1630;
    float _1682 = _1678;
    if (!_1680)
    {
        float _1684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1688 = _1618 + _1686;
        float _1690 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = rsqrt(_1612);
        float _1694 = _1688 * _1684;
        float _1696 = _1694 * 0.15915493667125701904296875;
        float _1698 = _1696 * 6.283185482025146484375;
        float _1700 = cos(_1698);
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 + (-1.0);
        float _1708 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = fma(_1704, _1690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = fma(_1632, _1700, _1708);
        float _1714 = _1692 * _1710;
        float _1716 = fma(_1602, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1594, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1682 = _1712;
        _1668 = _1716;
        _1670 = _1718;
    }
    float _1720 = _1682;
    float _1722 = _1668;
    float _1724 = _1670;
    float _1726 = -_1306;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1720);
    float _1730 = -_1314;
    float _1732 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _1734 = -_1340;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1724);
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1740 = _1728 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1744 = _1732 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = _1736 + _1746;
    float _1750 = _1740 * _1740;
    float _1752 = fma(_1744, _1744, _1750);
    float _1754 = fma(_1748, _1748, _1752);
    float _1756 = rsqrt(_1754);
    float _1758 = sqrt(_1754);
    float _1760 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1762 = _1744 * _1760;
    float _1764 = _1748 * _1760;
    float _1766 = _1762 * _1762;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 + _1768;
    float _1772 = sqrt(_1770);
    bool _1774 = _1772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = _1772 + _1776;
    float _1780 = _1748;
    float _1782 = _1770;
    float _1784 = _1778;
    float _1786 = _1740;
    float _1788 = _1724;
    if (_1774)
    {
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1780 = _1790;
    }
    float _1792 = _1780;
    if (_1774)
    {
        float _1794 = rsqrt(_1770);
        _1782 = _1794;
    }
    float _1796 = _1782;
    float _1798 = _1796;
    if (_1774)
    {
        float _1800 = _1778 * _1792;
        _1784 = _1800;
    }
    float _1802 = _1784;
    if (_1774)
    {
        float _1804 = _1802 * 0.15915493667125701904296875;
        _1672 = _1804;
    }
    float _1806 = _1672;
    float _1808 = _1792;
    if (_1774)
    {
        float _1810 = _1806 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = precise::max(0.0, _1816);
    float _1820 = _1756;
    float _1822 = _1818;
    if (_1774)
    {
        float _1824 = _1806 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = -_1760;
    float _1832 = -_1818;
    float _1834 = fma(_1740, _1830, _1832);
    if (_1774)
    {
        float _1836 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1836;
    }
    float _1838 = _1822;
    float _1840 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1842 = _1838;
    float _1844 = _1814;
    if (_1774)
    {
        float _1846 = fma(_1814, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1842 = _1846;
    }
    float _1848 = _1842;
    float _1850 = _1848;
    if (!_1774)
    {
        _1844 = _1762;
    }
    float _1852 = _1844;
    float _1854 = _1852;
    float _1856 = _1828;
    if (_1774)
    {
        float _1858 = _1828 + (-1.0);
        _1786 = _1858;
    }
    float _1860 = _1786;
    float _1862 = _1860;
    if (_1774)
    {
        float _1864 = _1796 * _1848;
        _1788 = _1864;
    }
    float _1866 = _1788;
    if (!_1774)
    {
        _1850 = _1834;
    }
    float _1868 = _1850;
    float _1870 = _1868;
    if (_1774)
    {
        float _1872 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1872;
    }
    float _1874 = _1674;
    if (_1774)
    {
        float _1876 = _1762 * _1866;
        _1854 = _1876;
    }
    float _1878 = _1854;
    if (!_1774)
    {
        _1862 = _1764;
    }
    float _1880 = _1862;
    float _1882 = _1880;
    if (_1774)
    {
        float _1884 = _1764 * _1866;
        _1882 = _1884;
    }
    float _1886 = _1882;
    if (!_1774)
    {
        _1798 = _1766;
    }
    float _1888 = _1798;
    float _1890 = _1888;
    if (_1774)
    {
        float _1892 = fma(_1834, _1828, _1874);
        _1870 = _1892;
    }
    float _1894 = _1870;
    if (_1774)
    {
        float _1896 = _1878 * _1878;
        _1890 = _1896;
    }
    float _1898 = _1890;
    if (!_1774)
    {
        _1856 = _1768;
    }
    float _1900 = _1856;
    float _1902 = _1900;
    if (_1774)
    {
        float _1904 = _1886 * _1886;
        _1902 = _1904;
    }
    float _1906 = _1902;
    float _1908 = fma(_1894, _1894, _1898);
    float _1910 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1840);
    float _1912 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1914 = _1908 + _1906;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1918 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1916);
    float _1920 = precise::clamp(_1918, 0.0, 1.0);
    float _1922 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1924 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1926 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1912);
    float _1928 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1910);
    float _1930 = rsqrt(_1914);
    float _1932 = -_1920;
    float _1934 = _1932 + 1.0;
    float _1936 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1924);
    float _1938 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1926);
    float _1940 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1944 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1936);
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1948 = abs(_1934);
    float _1950 = log2(_1948);
    float _1952 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1942);
    float _1954 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1958 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1960 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1952);
    float _1962 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1956);
    float _1964 = _1930 * _1878;
    float _1966 = _1930 * _1894;
    float _1968 = _1930 * _1886;
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1972 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1974 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1962);
    float _1976 = -_1958;
    float _1978 = fma(_1976, _1922, 1.0);
    float _1980 = -_1972;
    float _1982 = fma(_1966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1980);
    float _1984 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1986 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1974);
    float _1988 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1990 = -_1968;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1982);
    float _1994 = log2(_1978);
    float _1996 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1998 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1988);
    float _2000 = fma(_1992, -0.5, 0.5);
    float _2002 = fma(_1992, 0.5, 0.5);
    float _2004 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1996);
    float _2006 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1998);
    float _2008 = _1966 + 1.0;
    float _2010 = exp2(_1984);
    float _2012 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2004);
    float _2014 = 1.0 / _1986;
    float _2016 = fma(_2002, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2018 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2012);
    float _2020 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2006);
    float _2022 = _1994 * 0.693147182464599609375;
    float _2024 = fma(_2002, _2016, -0.212114393711090087890625);
    float _2026 = sqrt(_2000);
    float _2028 = -_1966;
    float _2030 = fma(_2010, _2008, _2028);
    float _2032 = fma(_2002, _2024, 1.570728778839111328125);
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2036 = fma(_2030, 0.5, 0.5);
    float _2038 = _2018 * _2014;
    float _2040 = _2020 * _2014;
    float _2042 = fma(_2038, 0.5, 0.5);
    float _2044 = fma(_2040, -0.5, 0.5);
    float _2046 = _2026 * 0.636619746685028076171875;
    float _2048 = -_2032;
    float _2050 = fma(_2046, _2048, 1.0);
    float3 _6164 = float3(_2042, _2044, _2034);
    float _2052 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6164, float3(0.0), isnan(_6164)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6164, float3(0.0), isnan(_6164)), level(0.0)).x;
    float3 _6175 = float3(_2042, _2044, _2034);
    float4 _2055 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6175, float3(0.0), isnan(_6175)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6175, float3(0.0), isnan(_6175)), level(0.0)).xyzw;
    float _2057 = _2055.x;
    float _2059 = _2055.y;
    float _2061 = _2055.z;
    float _2063 = _2055.w;
    float2 _6192 = float2(_2050, _2036);
    float3 _2067 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6192, float2(0.0), isnan(_6192)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6192, float2(0.0), isnan(_6192)), level(0.0)).xyz;
    float _2069 = _2067.x;
    float _2071 = _2067.y;
    float _2073 = _2067.z;
    float _2075 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2077 = int(_2075);
    out.m_60.x = _954;
    out.m_60.y = _956;
    out.m_60.z = _946;
    out.m_60.w = _948;
    bool _2079 = _619 > 0.5;
    float _2081 = -_1306;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    bool _2085 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.5);
    bool _2093 = _2089 || _2091;
    float _2095 = -_1314;
    float _2097 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _2099 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2101 = int(_2099);
    bool _2103 = _1000 > 0.5;
    float _2105 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2107 = -_1340;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _2111 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2105);
    float _2113 = 1.0 / _988;
    float _2115 = float(_2077);
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2123 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2125 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.x = _1732;
    out.m_62.y = _1728;
    out.m_62.z = _1736;
    float _2127 = 1.0 / _2115;
    float _2129 = float(uint(_2101));
    float _2131 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2125);
    int _2133 = ~_2101;
    int _2135 = _2133 + 1;
    out.m_64.y = _1522;
    int _2137 = ~_2101;
    int _2139 = _2137 + 1;
    float _2141 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2131);
    int _2143 = ~_2101;
    int _2145 = _2143 + 1;
    float _2147 = 1.0 / _2129;
    float _2149 = _129 * _2127;
    float _2151 = in.m_56.w;
    float _2153 = exp2(_2123);
    int _2155 = as_type<int>(_2147) + (-2);
    float _2157 = trunc(_2149);
    int _2159 = int(_2157);
    float _2161 = -_2153;
    float _2163 = _2161 + 1.0;
    float _2165 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2167 = _2151 > 0.5;
    float _2169 = -_2165;
    float _2171 = _2169 + 1.0;
    float _2173 = float(uint(_2159));
    float _2175 = as_type<float>(_2155) * _2173;
    float _2177 = trunc(_2175);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    int _2183 = _2135 * int(_2181);
    int _2185 = _2183 + _2159;
    float _2187 = float(uint(_2185));
    float _2189 = as_type<float>(_2155) * _2187;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2193 = _2191 != 0;
    bool _2195 = !_2193;
    float _2197 = _2195 ? _1000 : _619;
    float _2199 = trunc(_2189);
    float _2201 = precise::max(_2199, 0.0);
    uint _2203 = uint(_2201);
    bool _2205 = !_2193;
    float _2207 = _2205 ? 1.2345600128173828125 : 1.0;
    float _2209 = _2207 * _2197;
    float _2211 = float(_2159);
    int _2213 = int(_2181) + int(_2203);
    float _2215 = float(_2101);
    float _2217 = floor(_2209);
    int _2219 = _2139 * _2213;
    int _2221 = _2219 + _2159;
    bool _2223 = _2211 >= _2215;
    bool _2225 = isnan(_2211);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan(_2215);
    bool _2231 = _2227 || _2229;
    float _2233 = float(_2231);
    float _2235 = _129 * _2215;
    bool _2237 = uint(_2221) >= uint(_2101);
    float _2239 = _2235 * _2113;
    float _2241 = trunc(_2233);
    int _2243 = int(_2241);
    bool _2245 = !_2237;
    int _2247 = _2245 ? 0 : (-1);
    bool _2249 = _2101 == 0;
    int _2251 = ~_2213;
    int _2253 = _2251 + _2247;
    int _2255 = _2253 + 1;
    float _2257 = -_2217;
    float _2259 = _2209 + _2257;
    float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2265 = _2101 + (-1);
    float _2267 = trunc(_2239);
    int _2269 = int(_2267);
    int _2271 = _2101 * _2255;
    int _2273 = _2271 + _2159;
    float _2275 = _2259 * _2215;
    float _2277 = _619 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2279 = ~_2243;
    int _2281 = _2279 + 1;
    int _2283 = _2281 + 1;
    bool _2285 = !_2249;
    int _2287 = _2285 ? _2273 : (-1);
    float _2289 = trunc(_2275);
    int _2291 = int(_2289);
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2295 = _2293 != 0;
    int _2297 = _2287 * _2283;
    int _2299 = abs(_1656);
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2303 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2305 = _990 + _2303;
    int _2307 = _2243 * _2265;
    int _2309 = _2307 + _2297;
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2315 = 1.0 / _2263;
    int _2317 = abs(_1652);
    float _2319 = -_2301;
    float _2321 = fma(_2277, 2.0, _2319);
    bool _2323 = !_2295;
    int _2325 = _2323 ? 0 : 1;
    int _2327 = _2309 * _2317;
    int _2329 = abs(_2325);
    float _2331 = 1.0 / _2313;
    float _2333 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2335 = _2269 * _2299;
    int _2337 = _2335 + _2327;
    int _2339 = abs(_1660);
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2341;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2349 = _2347 != 0;
    float _2351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2355 = _2353 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2357 = fma(_2333, -2.0, _2345);
    int _2359 = _2291 * _2329;
    int _2361 = _2359 + _2159;
    float _2363 = _2343 * _2315;
    int _2365 = abs(as_type<int>(_1664));
    float _2367 = _2355 * _2331;
    int _2369 = _2361 * _2339;
    int _2371 = _2369 + _2337;
    float _2373 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2375 = -_129;
    float _2377 = fma(_2375, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2321);
    float _2379 = as_type<float>(_2365);
    if (!_2193)
    {
        _1676 = _1000;
    }
    float _2381 = _1676;
    float _2383 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2373);
    float _2385 = _2381;
    if (_2193)
    {
        _2385 = _619;
    }
    float _2387 = _2385;
    int _2389 = _2291 * _2365;
    int _2391 = _2389 + _2371;
    float _2393 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2395 = -_209;
    int _2397 = _2079 ? as_type<int>(_2395) : as_type<int>(_209);
    float _2399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2401 = float(uint(_2391));
    float _2403 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2405 = !_2349;
    float _2407 = _2405 ? _209 : as_type<float>(_2397);
    float _2409 = _2387 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2411 = _2403;
    if (!_2193)
    {
        _2379 = _992;
    }
    float _2413 = _2379;
    float _2415 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2403);
    float _2417 = _2413;
    if (!_2193)
    {
        _2411 = _992;
    }
    float _2419 = _2411;
    float _2421 = as_type<float>(_2155) * _2401;
    bool _2423 = _992 > 0.5;
    float _2425 = _2407 + 0.5;
    float _2427 = _2419;
    if (_2193)
    {
        _2417 = _1000;
    }
    float _2429 = _2417;
    float _2431 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2383);
    if (_2193)
    {
        _2427 = _1000;
    }
    float _2433 = _2427;
    float _2435 = fma(_2393, _2425, _2377);
    bool _2437 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2439 = isnan(_990);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = trunc(_2421);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    bool _2455 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2457 = isnan(_990);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2463 = _2459 || _2461;
    float _2465 = float(_2463);
    float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2469 = _990 + _2467;
    bool _2471 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2473 = isnan(_990);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = -_2447;
    float _2485 = _2483 + 1.0;
    int _2487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2489 = _2487 != 0;
    float _2491 = -_2465;
    float _2493 = _2491 + 1.0;
    float _2495 = _2399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2497 = _2465 * _2485;
    float _2499 = fma(_2363, _2305, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2501 = _2481 * _2493;
    float _2503 = fma(_2367, _2469, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2505 = ~_2101;
    int _2507 = _2505 + 1;
    float _2509 = fma(_2433, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2117);
    float _2511 = _2499 * _2501;
    float _2513 = float(uint(_2361));
    float _2515 = _2429 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2517 = ~_2101;
    int _2519 = _2517 + 1;
    float _2521 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2415);
    float _2523 = as_type<float>(_2155) * _2513;
    int _2525 = _2507 * int(_2453);
    int _2527 = _2525 + _2391;
    float _2529 = fma(_2515, -2.0, _2121);
    float _2531 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2509);
    float _2533 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2535 = -_2481;
    float _2537 = _2535 + 1.0;
    float _2539 = trunc(_2523);
    float _2541 = precise::max(_2539, 0.0);
    uint _2543 = uint(_2541);
    float _2545 = float(uint(_2527));
    float _2547 = -_2533;
    float _2549 = fma(_2409, 2.0, _2547);
    float _2551 = -as_type<float>(_205);
    int _2553 = _2103 ? as_type<int>(_2551) : _205;
    float _2555 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2529);
    float _2557 = fma(_2537, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2511);
    float _2559 = as_type<float>(_2155) * _2545;
    bool _2561 = !_2489;
    float _2563 = _2561 ? as_type<float>(_205) : as_type<float>(_2553);
    float _2565 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2357);
    float _2567 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2119);
    float _2569 = -_129;
    float _2571 = fma(_2569, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2549);
    int _2573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2575 = _2573 != 0;
    float _2577 = trunc(_2559);
    float _2579 = precise::max(_2577, 0.0);
    uint _2581 = uint(_2579);
    float _2583 = _2563 + (-0.5);
    float _2585 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2567);
    float _2587 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2589 = _2519 * int(_2543);
    int _2591 = _2589 + _2361;
    float _2593 = -_2495;
    float _2595 = -_2565;
    float _2597 = fma(_2593, _2583, _2595);
    float _2599 = fma(_2503, _2497, _2557);
    float _2601 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2587);
    float _2603 = -_2431;
    float _2605 = _2603 + 1.0;
    float _2607 = float(uint(_2591));
    float _2609 = -_2521;
    float _2611 = _2609 + 1.0;
    float _2613 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2601);
    float _2615 = -_2605;
    float _2617 = fma(_2407, _2615, _2435);
    float _2619 = -_2531;
    float _2621 = _2619 + 1.0;
    float _2623 = as_type<float>(_2155) * _2607;
    float _2625 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2111);
    int _2627 = int(_2453) + int(_2581);
    float _2629 = trunc(_2623);
    float _2631 = precise::max(_2629, 0.0);
    uint _2633 = uint(_2631);
    float _2635 = -_209;
    int _2637 = _2423 ? as_type<int>(_2635) : as_type<int>(_209);
    float _2639 = _2625 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2641 = _2613 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2643 = _2145 * _2627;
    int _2645 = _2643 + _2391;
    bool _2647 = !_2575;
    float _2649 = _2647 ? _209 : as_type<float>(_2637);
    float _2651 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2599);
    int _2653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2655 = _2653 != 0;
    float _2657 = 1.0 / _2639;
    bool _2659 = uint(_2645) >= uint(_2101);
    float _2661 = _2649 + 0.5;
    float _2663 = -as_type<float>(_205);
    int _2665 = _2167 ? as_type<int>(_2663) : _205;
    float _2667 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2669 = !_2659;
    int _2671 = _2669 ? 0 : (-1);
    float _2673 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2571);
    bool _2675 = !_2655;
    float _2677 = _2675 ? as_type<float>(_205) : as_type<float>(_2665);
    float _2679 = as_type<float>(_205) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2681 = ~_2627;
    int _2683 = _2681 + _2671;
    int _2685 = _2683 + 1;
    float _2687 = _2641 + _2639;
    int _2689 = int(_2543) + int(_2633);
    float _2691 = _1550 * _2679;
    float _2693 = as_type<float>(_2633);
    float _2695 = _2503;
    float _2697 = _2617;
    if (!_2093)
    {
        _2693 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2699 = _2693;
    int _2701 = _2101 * _2685;
    int _2703 = _2701 + _2391;
    float _2705 = _2677 + (-0.5);
    float _2707 = _2687 * _2657;
    float _2709 = _2707 * 0.5;
    int _2711 = ~_2101;
    int _2713 = _2711 + 1;
    float _2715 = _1614 * _2679;
    bool _2717 = !_2249;
    int _2719 = _2717 ? _2703 : (-1);
    float _2721 = -_2705;
    float _2723 = -_2555;
    float _2725 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2723);
    float _2727 = as_type<float>(_2703);
    float _2729 = _2709;
    if (!_2093)
    {
        float _2731 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2733 = fma(_2709, _2699, _2731);
        _2727 = _2733;
    }
    float _2735 = _2727;
    int _2737 = _2713 * _2689;
    int _2739 = _2737 + _2361;
    int _2741 = _2719 >> 31;
    float _2743 = _1526 * _2679;
    if (!_2093)
    {
        _2729 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2745 = _2729;
    float _2747 = _2165 * _2052;
    int _2749 = _2741 & 3;
    float _2751 = _2735;
    if (!_2093)
    {
        float _2753 = 1.0 / _2735;
        _2751 = _2753;
    }
    float _2755 = _2751;
    float _2757 = -_2585;
    float _2759 = _2757 + 1.0;
    bool _2761 = uint(_2739) >= uint(_2101);
    if (!_2093)
    {
        float _2763 = -_2745;
        float _2765 = _2763 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2695 = _2765;
    }
    float _2767 = _2695;
    int _2769 = _2719 + _2749;
    float _2771 = -_2759;
    float _2773 = fma(_2649, _2771, _2673);
    int _2775 = _2719 & 3;
    bool _2777 = _2775 != 0;
    out.m_66.w = _2667;
    int _2779 = _2769 >> 2;
    float _2781 = _2435;
    if (!_2093)
    {
        float _2783 = 1.0 / _2767;
        _2781 = _2783;
    }
    float _2785 = _2781;
    int _2787 = _2719 & 3;
    bool _2789 = _2787 != 0;
    int _2791 = _2779 << 4;
    int _2793 = _2791 + 512;
    float _2795 = fma(_2563, _2611, _2597);
    float _2797 = fma(_2677, _2621, _2725);
    bool _2799 = uint(_2787) > 1u;
    uint _2801 = uint(int(uint(_2793) >> uint(2)));
    uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
    int _2805 = int(_2801) & 3;
    float _2807 = (*spvDescriptorSet0.vp_c9)._m0[int(_2803)][_2805];
    int _2809 = int(_2801) + 1;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    int _2813 = _2809 & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    float _2817 = _2755;
    if (!_2093)
    {
        float _2819 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2821 = -_2745;
        float _2823 = fma(_2755, _2819, _2821);
        _2817 = _2823;
    }
    float _2825 = _2817;
    bool _2827 = !_2761;
    int _2829 = _2827 ? 0 : (-1);
    out.m_68.x = _2617;
    out.m_68.y = _2795;
    out.m_68.z = _2773;
    out.m_68.w = _2797;
    int _2831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2833 = _2831 != 0;
    int _2835 = ~_2689;
    int _2837 = _2835 + _2829;
    int _2839 = _2837 + 1;
    int _2841 = _2793 + 8;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    uint _2845 = uint(int(uint(int(_2843)) >> uint(2)));
    int _2847 = int(_2843) & 3;
    float _2849 = (*spvDescriptorSet0.vp_c9)._m0[int(_2845)][_2847];
    int _2851 = int(_2843) + 1;
    uint _2853 = uint(int(uint(_2851) >> uint(2)));
    int _2855 = _2851 & 3;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[int(_2853)][_2855];
    float _2859 = _2825;
    if (!_2093)
    {
        float _2861 = _2825 * _2785;
        float _2863 = precise::clamp(_2861, 0.0, 1.0);
        _2859 = _2863;
    }
    float _2865 = _2859;
    int _2867 = _2101 * _2839;
    int _2869 = _2867 + _2361;
    bool _2871 = !_2249;
    int _2873 = _2871 ? _2869 : (-1);
    float _2875 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2877 = _2777 ? 0 : 1;
    bool _2879 = _2787 != 3;
    float _2881 = fma(_1556, _2875, _2691);
    int _2883 = ~_2877;
    int _2885 = _2883 + 1;
    int _2887 = _2885 + 1;
    float _2889 = fma(_1622, _2875, _2715);
    int _2891 = _2887;
    if (_2093)
    {
        _2697 = 1.0;
    }
    float _2893 = _2697;
    float _2895 = _2893;
    if (!_2093)
    {
        float _2897 = -_2865;
        float _2899 = _2897 + 1.0;
        _2895 = _2899;
    }
    float _2901 = _2895;
    if (!_2799)
    {
        int _2903 = ~_2877;
        int _2905 = _2903 + 1;
        _2891 = _2905;
    }
    int _2907 = _2891;
    float _2909 = fma(_1518, _2875, _2743);
    bool _2911 = uint(_2787) >= 2u;
    float _2913 = _2073 * _2747;
    bool _2915 = !_2789;
    int _2917 = _2915 ? 0 : 1;
    float _2919 = _1598 + _2889;
    int _2921 = abs(_2907);
    float _2923 = _1564 + _2881;
    int _2925 = _2911 ? 0 : 1;
    float _2927 = _1528 + _2909;
    int _2929 = abs(_2917);
    int _2931 = ~_2925;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    out.m_70.x = _2923;
    out.m_70.y = _2919;
    out.m_70.z = _2927;
    int _2937 = _2935;
    if (_2879)
    {
        int _2939 = ~_2925;
        int _2941 = _2939 + 1;
        _2937 = _2941;
    }
    int _2943 = _2937;
    bool _2945 = _2787 != 3;
    int _2947 = ~_2921;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    int _2953 = abs(_2943);
    bool _2955 = !_2945;
    int _2957 = _2955 ? 0 : (-1);
    int _2959 = _2951 * as_type<int>(_2815);
    int _2961 = ~_2929;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    bool _2967 = !_2833;
    int _2969 = _2967 ? 0 : 1;
    int _2971 = abs(_2957);
    int _2973 = _2965 * as_type<int>(_2807);
    int _2975 = _2973 + _2959;
    int _2977 = ~_2953;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    int _2983 = abs(_2969);
    int _2985 = ~_2971;
    int _2987 = _2985 + 1;
    int _2989 = _2987 + 1;
    int _2991 = _2981 * as_type<int>(_2849);
    int _2993 = _2991 + _2975;
    float _2995 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2997 = _2901 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2999 = _2989 * as_type<int>(_2857);
    int _3001 = _2999 + _2993;
    int _3003 = ~_2983;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    float _3009 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3011 = _2995 + _3009;
    float _3013 = _707 * _2997;
    bool _3015 = _2901 > 0.0;
    bool _3017 = isnan(_2901);
    bool _3019 = _3015 || _3017;
    bool _3021 = isnan(0.0);
    bool _3023 = _3019 || _3021;
    int _3025 = _3001 * _3007;
    float _3027 = _1986 + _3011;
    int _3029 = _2873 * _2983;
    int _3031 = _3029 + _3025;
    float _3033 = _2063 * _2747;
    float _3035 = _3027 * 0.5;
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _3011;
    out.gl_Position.w = _1986;
    float _3037 = float(_3031);
    float _3039 = _3013 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3041 = fma(_2069, _3033, _2057);
    float _3043 = fma(_2071, _3033, _2059);
    float _3045 = _2063 * _2171;
    float _3047 = fma(_2063, _2913, _2061);
    out.m_72.z = _3035;
    out.m_72.w = _1986;
    out.m_74.y = _3037;
    out.m_45.x = _3039;
    out.m_76.x = _3041;
    out.m_76.y = _3043;
    out.m_76.z = _3047;
    out.m_76.w = _3045;
    if (_3023)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3049 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3049;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _980 = false;
    bool _847 = false;
    bool _727 = false;
    bool _491 = false;
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
        float _3106 = as_type<float>(_111);
        out.gl_Position.z = _3106;
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
        out.m_45.x = 0.0;
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
        float _3174 = as_type<float>(_149);
        out.gl_Position.z = _3174;
    }
    if (_143)
    {
        return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = 0.0;
    float _173 = _153;
    if (!_169)
    {
        float _175 = _153 * _153;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = 0.0;
    float _183 = _179;
    if (!_169)
    {
        float _185 = _129 * _129;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    if (!_169)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _191;
    }
    float _193 = _183;
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    bool _203 = !_201;
    int _205 = _203 ? (-1090519040) : 1056964608;
    bool _207 = !_197;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_169;
    float _213 = _193;
    float _215 = _151;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _153 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _153);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _245;
        _133 = _233;
        _215 = _235;
    }
    float _247 = _213;
    float _249 = _133;
    float _251 = _215;
    bool _253 = !_169;
    float _255 = _251;
    float _257 = _249;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _153 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _265;
        _173 = _277;
    }
    float _279 = _255;
    float _281 = _173;
    float _283 = _279;
    if (!_169)
    {
        _283 = _129;
    }
    float _285 = _283;
    float _287 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _285;
    if (!_169)
    {
        float _291 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _291;
    }
    float _293 = _257;
    bool _295 = !_169;
    float _297 = _293;
    if (!_295)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _305 = _303 + 1.0;
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _129 * _301;
        float _311 = 1.0 / _305;
        float _313 = _307 * 0.693147182464599609375;
        float _315 = exp2(_309);
        float _317 = 1.0 / _313;
        float _319 = _315 + (-1.0);
        float _321 = -_319;
        float _323 = fma(_321, _317, _129);
        float _325 = _323 * _311;
        float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _327;
    }
    float _329 = _297;
    bool _331 = !_169;
    if (!_331)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _129 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _289 = _351;
    }
    float _353 = _289;
    float _355 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = fma(_281, _157, _287);
    float _361 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_353, _157, _355);
    float _365 = fma(_281, _155, _357);
    float _367 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_353, _155, _361);
    float _373 = -_363;
    float _375 = _359 + _373;
    float _377 = fma(_353, _159, _367);
    float _379 = fma(_281, _159, _369);
    float _381 = -_371;
    float _383 = _365 + _381;
    float _385 = _375 * _375;
    float _387 = in.m_52.w;
    float _389 = -_377;
    float _391 = _379 + _389;
    float _393 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = fma(_383, _383, _385);
    out.m_54.y = as_type<float>(_205);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _401 = fma(_391, _391, _395);
    float _403 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = in.m_42.x;
    float _407 = in.m_42.y;
    float _409 = in.m_42.z;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _413 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _415 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _417 = sqrt(_401);
    float _419 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    float _421 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    bool _423 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan(9.9999999747524270787835121154785e-07);
    bool _431 = _427 || _429;
    float _433 = fma(_365, _387, _405);
    float _435 = fma(_359, _387, _407);
    float _437 = fma(_379, _387, _409);
    float _439 = _411;
    float _441 = _387;
    float _443 = _421;
    if (_431)
    {
        _439 = _413;
    }
    float _445 = _439;
    float _447 = _445;
    if (_431)
    {
        _441 = _419;
    }
    float _449 = _441;
    float _451 = _449;
    if (!_431)
    {
        bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _455 = !_453;
        if (!_455)
        {
            float _457 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _459 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
            float _475 = _469 * _469;
            float _477 = fma(_471, _471, _475);
            float _479 = fma(_473, _473, _477);
            float _481 = rsqrt(_479);
            float _483 = _481 * 9.9999999747524270787835121154785e-07;
            float _485 = _471 * _483;
            float _487 = _469 * _483;
            float _489 = _473 * _483;
            _451 = _487;
            _447 = _485;
            _443 = _489;
            _491 = true;
        }
        else
        {
            float _493 = _157 * _157;
            float _495 = fma(_155, _155, _493);
            float _497 = fma(_159, _159, _495);
            float _499 = sqrt(_497);
            bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
            bool _503 = isnan(_499);
            bool _505 = _501 || _503;
            bool _507 = isnan(9.9999999747524270787835121154785e-07);
            bool _509 = _505 || _507;
            if (!_509)
            {
                float _511 = _407 * _407;
                float _513 = fma(_405, _405, _511);
                float _515 = fma(_409, _409, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                if (!_527)
                {
                    float _529 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _529);
                    float _533 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _451 = _541;
                    _447 = _539;
                    _443 = _543;
                    _491 = true;
                }
                else
                {
                    float _545 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _549 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _551 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                    float _553 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                    float _557 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                    float _559 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                    float _561 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                    float _563 = _557 * _557;
                    float _565 = fma(_559, _559, _563);
                    float _567 = fma(_561, _561, _565);
                    float _569 = rsqrt(_567);
                    float _571 = _569 * 9.9999999747524270787835121154785e-07;
                    float _573 = _559 * _571;
                    float _575 = _557 * _571;
                    float _577 = _561 * _571;
                    _451 = _575;
                    _447 = _573;
                    _443 = _577;
                    _491 = true;
                }
            }
            else
            {
                float _579 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _581 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _583 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _585 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _579);
                float _587 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
                float _589 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
                float _591 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _585);
                float _593 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _587);
                float _595 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _589);
                float _597 = _591 * _591;
                float _599 = fma(_593, _593, _597);
                float _601 = fma(_595, _595, _599);
                float _603 = rsqrt(_601);
                float _605 = _603 * 9.9999999747524270787835121154785e-07;
                float _607 = _593 * _605;
                float _609 = _591 * _605;
                float _611 = _595 * _605;
                _451 = _609;
                _447 = _607;
                _443 = _611;
            }
        }
    }
    _491 = false;
    float _613 = _451;
    float _615 = _447;
    float _617 = _443;
    float _619 = in.m_56.x;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _623 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _631 = _629 != 0;
    float _633 = _623 * _621;
    int _635 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _637 = _635 != 0;
    float _639 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[20].x, _633);
    bool _641 = !_631;
    int _643 = _641 ? 0 : 1;
    float _645 = _639 * 6.283185482025146484375;
    float _647 = floor(_639);
    int _649 = abs(_643);
    float _651 = _645 * 0.15915493667125701904296875;
    bool _653 = !_627;
    int _655 = _653 ? 0 : 1;
    int _657 = abs(_655);
    float _659 = _651 * 6.283185482025146484375;
    float _661 = cos(_659);
    bool _663 = !_637;
    int _665 = _663 ? 0 : 1;
    bool _667 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _669 = -_647;
    float _671 = _639 + _669;
    int _673 = abs(_665);
    float _675 = float(_657);
    float _677 = -_671;
    float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _681 = _671 < 0.5;
    float _683 = float(_681);
    float _685 = abs(_679);
    float _687 = _675 * _685;
    float _689 = fma(_661, 0.5, 0.5);
    float _691 = float(_673);
    float _693 = -_683;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _697 = float(_649);
    float _699 = -_689;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _703 = fma(_691, _701, _687);
    float _705 = abs(_695);
    float _707 = fma(_697, _705, _703);
    bool _709 = !_667;
    float _725;
    if (!_709)
    {
        float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _713 = _619 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _717 = _715 * _711;
        float _719 = floor(_717);
        float _721 = -_719;
        float _723 = _717 + _721;
        _725 = _723;
        _727 = true;
    }
    else
    {
        float _729 = float(_95);
        float _731 = 1.0 / _729;
        float _733 = _129 * _731;
        _725 = _733;
    }
    _727 = false;
    float _735 = _725;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _739 = _735 + _737;
    float _741 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _743 = in.m_52.x;
    float _745 = in.m_52.y;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _747;
    bool _751 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _753 = isnan(_735);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _741 * _619;
    bool _765 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _767 = 1.0 / _749;
    float _769 = -_761;
    float _771 = _769 + 1.0;
    float _773 = trunc(_763);
    int _775 = int(_773);
    float _777 = _739 * _767;
    bool _779 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _781 = isnan(_735);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _795;
    float _799 = _789 * _771;
    float _801 = fma(_793, _777, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _803 = fma(_797, _777, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _805 = -_789;
    float _807 = _805 + 1.0;
    int _809 = _775 << 4;
    int _811 = _809 + 1712;
    float _813 = _801 * _799;
    float _815 = _803 * _799;
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[143].x, _813);
    float _819 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[143].y, _815);
    float _821 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].x, _817);
    float _823 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].y, _819);
    float _825 = _821 * _743;
    float _827 = _823 * _745;
    bool _829 = !_765;
    float _845;
    if (!_829)
    {
        float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _833 = _619 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _837 = _835 * _831;
        float _839 = floor(_837);
        float _841 = -_839;
        float _843 = _837 + _841;
        _845 = _843;
        _847 = true;
    }
    else
    {
        float _849 = float(_95);
        float _851 = 1.0 / _849;
        float _853 = _129 * _851;
        _845 = _853;
    }
    _847 = false;
    float _855 = _845;
    int _857 = _811 + 8;
    uint _860 = uint(int(uint(_857) >> uint(2)));
    uint _862 = uint(int(uint(int(_860)) >> uint(2)));
    int _864 = int(_860) & 3;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[int(_862)][_864];
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _870 = _855 + _868;
    bool _872 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _874 = isnan(_855);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _888 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _890 = isnan(_855);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    uint _900 = uint(int(uint(_811) >> uint(2)));
    uint _902 = uint(int(uint(int(_900)) >> uint(2)));
    int _904 = int(_900) & 3;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[int(_902)][_904];
    int _908 = int(_900) + 1;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    int _912 = _908 & 3;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[int(_910)][_912];
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _916;
    float _920 = -_882;
    float _922 = _920 + 1.0;
    bool _924 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _926 = 1.0 / _886;
    float _928 = _898 * _922;
    float _930 = -_898;
    float _932 = _930 + 1.0;
    float _934 = _918 * _926;
    float _936 = fma(_934, _870, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _938 = _936 * _928;
    float _940 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[115].x, _938);
    float _942 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[116].x, _940);
    float _944 = _866 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _942 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _950 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = _914 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _958 = !_924;
    float _976;
    float _978;
    if (!_958)
    {
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _962 = _619 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _964 = float(_95);
        float _966 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _968 = _966 * _960;
        float _970 = floor(_968);
        float _972 = -_970;
        float _974 = _968 + _972;
        _976 = _964;
        _978 = _974;
        _980 = true;
    }
    else
    {
        float _982 = float(_95);
        float _984 = 1.0 / _982;
        float _986 = _129 * _984;
        _976 = _982;
        _978 = _986;
    }
    _980 = false;
    float _988 = _976;
    float _990 = _978;
    float _992 = in.m_56.z;
    float _994 = _619 * 2.0;
    float _996 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _998 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1000 = in.m_56.y;
    float _1002 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1004 = _613 * _613;
    float _1006 = floor(_994);
    float _1008 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _998);
    float _1010 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _996);
    float _1012 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1002);
    float _1014 = fma(_615, _615, _1004);
    float _1016 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1008);
    float _1018 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1010);
    float _1020 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1012);
    float _1022 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1024 = log2(_1022);
    float _1026 = fma(_617, _617, _1014);
    float _1028 = _1016 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1030 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1032 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1034 = rsqrt(_1026);
    float _1036 = _992 * 2.0;
    bool _1038 = _1006 > 0.0;
    float _1040 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1042 = _1006 >= 0.0;
    bool _1044 = isnan(_1006);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = _1000 * 2.0;
    float _1054 = _1000 + _992;
    float _1056 = floor(_1036);
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1068 = _1066 != 0;
    float _1070 = _129 * _1024;
    float _1072 = _1054 + (-1.0);
    bool _1074 = !_1064;
    int _1076 = _1074 ? 0 : 1;
    float _1078 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1080 = floor(_1052);
    float _1082 = _619 + _992;
    int _1084 = abs(_1076);
    float _1086 = _1082 + (-1.0);
    bool _1088 = _1056 > 0.0;
    float _1090 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1092 = _1056 >= 0.0;
    bool _1094 = isnan(_1056);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    float _1102 = exp2(_1070);
    bool _1104 = !_1060;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = in.m_58.x;
    float _1110 = in.m_58.y;
    float _1112 = in.m_58.z;
    float _1114 = _1034 * _613;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1118 = 1.0 + _1116;
    bool _1120 = _1080 > 0.0;
    bool _1122 = _1080 >= 0.0;
    bool _1124 = isnan(_1080);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = _1034 * _615;
    float _1134 = _1034 * _617;
    int _1136 = _1050 ? 0 : 1;
    float _1138 = 1.0 / _1118;
    int _1140 = _1100 ? 0 : 1;
    float _1142 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1144 = ~_1136;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    int _1150 = _1148;
    if (!_1038)
    {
        int _1152 = ~_1136;
        int _1154 = _1152 + 1;
        _1150 = _1154;
    }
    int _1156 = _1150;
    float _1158 = -_1102;
    float _1160 = _1158 + 1.0;
    int _1162 = ~_1140;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    int _1168 = _1166;
    if (!_1088)
    {
        int _1170 = ~_1140;
        int _1172 = _1170 + 1;
        _1168 = _1172;
    }
    int _1174 = _1168;
    float _1176 = _1000 + (-0.5);
    int _1178 = abs(_1106);
    float _1180 = float(_1084);
    float _1182 = float(_1156);
    bool _1184 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1186 = isnan(0.0);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1192 = _1188 || _1190;
    float _1194 = _1180 * _1182;
    int _1196 = _1130 ? 0 : 1;
    float _1198 = float(_1178);
    float _1200 = _1194 * (-2.0);
    float _1202 = _1192 ? _1160 : 0.0;
    int _1204 = ~_1196;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    int _1210 = _1208;
    if (!_1120)
    {
        int _1212 = ~_1196;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1028 + _1218;
    float _1222 = float(_1174);
    float _1224 = fma(_1200, _1110, _1110);
    float _1226 = _1202 * _1138;
    float _1228 = fma(_1078, _1200, _1078);
    float _1230 = _619 + _1000;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1030 + _1232;
    float _1236 = _1220 * _1220;
    float _1238 = _1198 * _1222;
    float _1240 = _1230 + (-1.0);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1244 = _1032 + _1242;
    float _1246 = fma(_1234, _1234, _1236);
    float _1248 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1224);
    bool _1250 = !_1068;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = _1238 * (-2.0);
    float _1256 = fma(_1244, _1244, _1246);
    bool _1258 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1260 = isnan(1.0);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1266 = _1262 || _1264;
    int _1268 = abs(_1252);
    bool _1270 = !_1266;
    float _1272 = _1270 ? _129 : _1226;
    float _1274 = rsqrt(_1256);
    float _1276 = float(_1268);
    float _1278 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1142);
    float _1280 = float(_1216);
    float _1282 = fma(_1272, _1228, _1248);
    float _1284 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1286 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1278);
    float _1288 = _619 + (-0.5);
    float _1290 = _1276 * _1280;
    float _1292 = fma(_1254, _1108, _1108);
    float _1294 = _1282 * 0.15915493667125701904296875;
    float _1296 = abs(_1286);
    bool _1298 = _1296 > 0.99989998340606689453125;
    float _1300 = _1290 * (-2.0);
    float _1302 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1292);
    float _1304 = fma(_1284, _1254, _1284);
    float _1306 = _1220 * _1274;
    float _1308 = fma(_1090, _1300, _1090);
    float _1310 = fma(_1300, _1112, _1112);
    float _1312 = _992 + (-0.5);
    float _1314 = _1234 * _1274;
    float _1316 = -_1306;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1320 = fma(_1272, _1304, _1302);
    float _1322 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1310);
    float _1324 = _1254;
    float _1326 = _1288;
    float _1328 = _1322;
    float _1330 = _1272;
    if (_1298)
    {
        _1324 = 0.001000000047497451305389404296875;
    }
    float _1332 = _1324;
    float _1334 = -_1314;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1338 = _1318 * _1318;
    float _1340 = _1244 * _1274;
    float _1342 = _1320 * 0.15915493667125701904296875;
    if (!_1298)
    {
        _1326 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1344 = _1326;
    float _1346 = fma(_1272, _1308, _1322);
    float _1348 = fma(_1336, _1336, _1338);
    float _1350 = _1344;
    if (_1298)
    {
        float _1352 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1350 = _1352;
    }
    float _1354 = _1350;
    float _1356 = -_1340;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _1360 = _1294 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    if (!_1298)
    {
        _1328 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1364 = _1328;
    float _1366 = _1346 * 0.15915493667125701904296875;
    float _1368 = _1364;
    if (_1298)
    {
        float _1370 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1368 = _1370;
    }
    float _1372 = _1368;
    float _1374 = fma(_1358, _1358, _1348);
    if (!_1298)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1376 = _1330;
    float _1378 = -_1372;
    float _1380 = _1114 * _1378;
    float _1382 = _1294 * 6.283185482025146484375;
    float _1384 = cos(_1382);
    float _1386 = _1342 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = _1376;
    if (_1298)
    {
        float _1392 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = _1342 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = -_1394;
    float _1402 = _1132 * _1400;
    float _1404 = -_1394;
    float _1406 = -_1380;
    float _1408 = fma(_1134, _1404, _1406);
    float _1410 = -_1354;
    float _1412 = -_1402;
    float _1414 = fma(_1114, _1410, _1412);
    float _1416 = _1366 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = -_1354;
    float _1422 = _1134 * _1420;
    float _1424 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1426 = _1388 * _1362;
    float _1428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1430 = -_1372;
    float _1432 = -_1422;
    float _1434 = fma(_1132, _1430, _1432);
    float _1436 = sqrt(_1374);
    float _1438 = _1398 * _1384;
    float _1440 = _1398 * _1362;
    float _1442 = _1366 * 6.283185482025146484375;
    float _1444 = sin(_1442);
    float _1446 = _1434 * _1434;
    float _1448 = _1384 * _1418;
    float _1450 = _1362 * _1418;
    float _1452 = fma(_1408, _1408, _1446);
    float _1454 = fma(_1414, _1414, _1452);
    float _1456 = _1388 * _1384;
    float _1458 = _1398 * _1418;
    float _1460 = fma(_129, 0.014999999664723873138427734375, _619);
    float _1462 = rsqrt(_1454);
    float _1464 = _1274 * _1436;
    float _1466 = _1388 * _1418;
    float _1468 = fma(_1444, _1438, _1426);
    float _1470 = -_1456;
    float _1472 = fma(_1444, _1440, _1470);
    float _1474 = _1424 * _1464;
    float _1476 = fma(_1444, _1426, _1438);
    float _1478 = floor(_1460);
    float _1480 = _1474 * _1428;
    float _1482 = _1468 * _1134;
    float _1484 = -_1440;
    float _1486 = fma(_1444, _1456, _1484);
    float _1488 = _1472 * _1134;
    float _1490 = _1434 * _1462;
    float _1492 = _1414 * _1462;
    float _1494 = _1458 * _1134;
    float _1496 = _1408 * _1462;
    float _1498 = _1132 * _1490;
    float _1500 = fma(_1448, _1492, _1482);
    float _1502 = -_1444;
    float _1504 = fma(_1502, _1492, _1494);
    float _1506 = fma(_1450, _1492, _1488);
    float _1508 = fma(_1478, -0.1500000059604644775390625, 1.0);
    float _1510 = -_1498;
    float _1512 = fma(_1114, _1496, _1510);
    float _1514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_205));
    float _1516 = _1458 * _1132;
    float _1518 = fma(_1486, _1512, _1500);
    float _1520 = precise::max(_1508, 0.20000000298023223876953125);
    float _1522 = _1040 * _1464;
    float _1524 = _1114 * _1492;
    float _1526 = fma(_1466, _1512, _1504);
    float _1528 = fma(_1476, _1512, _1506);
    float _1530 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1532 = _1530 * 0.5;
    float _1534 = _1468 * _1132;
    float _1536 = -_1444;
    float _1538 = fma(_1536, _1496, _1516);
    float _1540 = -_1524;
    float _1542 = fma(_1134, _1490, _1540);
    float _1544 = _1522 * _1514;
    float _1546 = _1472 * _1132;
    float _1548 = fma(_1448, _1496, _1534);
    float _1550 = fma(_1466, _1542, _1538);
    float _1552 = _1544 * _1526;
    float _1554 = fma(_1450, _1496, _1546);
    float _1556 = fma(_1486, _1542, _1548);
    float _1558 = _1544 * _1550;
    float _1560 = fma(_1480, _1518, _1552);
    float _1562 = precise::min(_1520, 1.0);
    float _1564 = fma(_1476, _1542, _1554);
    float _1566 = fma(_1480, _1556, _1558);
    float _1568 = fma(_1532, _1528, _1560);
    float _1570 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1572 = _1134 * _1496;
    float _1574 = fma(_1532, _1564, _1566);
    float _1576 = fma(_1568, _1562, _1032);
    float _1578 = _1472 * _1114;
    float _1580 = -_1572;
    float _1582 = fma(_1132, _1492, _1580);
    float _1584 = fma(_1574, _1562, _1030);
    float _1586 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1576);
    float _1588 = fma(_1450, _1490, _1578);
    float _1590 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1584);
    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1594 = _1586 + _1592;
    float _1596 = _1458 * _1114;
    float _1598 = fma(_1476, _1582, _1588);
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1602 = _1590 + _1600;
    float _1604 = _1594 * _1594;
    float _1606 = -_1444;
    float _1608 = fma(_1606, _1490, _1596);
    float _1610 = _1468 * _1114;
    float _1612 = fma(_1602, _1602, _1604);
    float _1614 = fma(_1466, _1582, _1608);
    float _1616 = fma(_1448, _1490, _1610);
    float _1618 = sqrt(_1612);
    float _1620 = _1544 * _1614;
    float _1622 = fma(_1486, _1582, _1616);
    float _1624 = fma(_1480, _1622, _1620);
    float _1626 = fma(_1532, _1598, _1624);
    float _1628 = fma(_1626, _1562, _1028);
    bool _1630 = _1618 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1628);
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1644 = _1642 != 0;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1648 = _1646 != 0;
    bool _1650 = !_1640;
    int _1652 = _1650 ? 0 : 1;
    bool _1654 = !_1636;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1644;
    int _1660 = _1658 ? 0 : 1;
    bool _1662 = !_1648;
    float _1664 = _1662 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1666 = _1588;
    float _1668 = _1590;
    float _1670 = _1586;
    float _1672 = _1628;
    float _1674 = _1602;
    float _1676 = _1664;
    if (!_1630)
    {
        _1666 = _1632;
    }
    float _1678 = _1666;
    bool _1680 = !_1630;
    float _1682 = _1678;
    if (!_1680)
    {
        float _1684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1688 = _1618 + _1686;
        float _1690 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = rsqrt(_1612);
        float _1694 = _1688 * _1684;
        float _1696 = _1694 * 0.15915493667125701904296875;
        float _1698 = _1696 * 6.283185482025146484375;
        float _1700 = cos(_1698);
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 + (-1.0);
        float _1708 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = fma(_1704, _1690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = fma(_1632, _1700, _1708);
        float _1714 = _1692 * _1710;
        float _1716 = fma(_1602, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1594, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1682 = _1712;
        _1668 = _1716;
        _1670 = _1718;
    }
    float _1720 = _1682;
    float _1722 = _1668;
    float _1724 = _1670;
    float _1726 = -_1306;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1720);
    float _1730 = -_1314;
    float _1732 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _1734 = -_1340;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1724);
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1740 = _1728 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1744 = _1732 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = _1736 + _1746;
    float _1750 = _1740 * _1740;
    float _1752 = fma(_1744, _1744, _1750);
    float _1754 = fma(_1748, _1748, _1752);
    float _1756 = rsqrt(_1754);
    float _1758 = sqrt(_1754);
    float _1760 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1762 = _1744 * _1760;
    float _1764 = _1748 * _1760;
    float _1766 = _1762 * _1762;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 + _1768;
    float _1772 = sqrt(_1770);
    bool _1774 = _1772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = _1772 + _1776;
    float _1780 = _1748;
    float _1782 = _1770;
    float _1784 = _1778;
    float _1786 = _1740;
    float _1788 = _1724;
    if (_1774)
    {
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1780 = _1790;
    }
    float _1792 = _1780;
    if (_1774)
    {
        float _1794 = rsqrt(_1770);
        _1782 = _1794;
    }
    float _1796 = _1782;
    float _1798 = _1796;
    if (_1774)
    {
        float _1800 = _1778 * _1792;
        _1784 = _1800;
    }
    float _1802 = _1784;
    if (_1774)
    {
        float _1804 = _1802 * 0.15915493667125701904296875;
        _1672 = _1804;
    }
    float _1806 = _1672;
    float _1808 = _1792;
    if (_1774)
    {
        float _1810 = _1806 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = precise::max(0.0, _1816);
    float _1820 = _1756;
    float _1822 = _1818;
    if (_1774)
    {
        float _1824 = _1806 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = -_1760;
    float _1832 = -_1818;
    float _1834 = fma(_1740, _1830, _1832);
    if (_1774)
    {
        float _1836 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1836;
    }
    float _1838 = _1822;
    float _1840 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1842 = _1838;
    float _1844 = _1814;
    if (_1774)
    {
        float _1846 = fma(_1814, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1842 = _1846;
    }
    float _1848 = _1842;
    float _1850 = _1848;
    if (!_1774)
    {
        _1844 = _1762;
    }
    float _1852 = _1844;
    float _1854 = _1852;
    float _1856 = _1828;
    if (_1774)
    {
        float _1858 = _1828 + (-1.0);
        _1786 = _1858;
    }
    float _1860 = _1786;
    float _1862 = _1860;
    if (_1774)
    {
        float _1864 = _1796 * _1848;
        _1788 = _1864;
    }
    float _1866 = _1788;
    if (!_1774)
    {
        _1850 = _1834;
    }
    float _1868 = _1850;
    float _1870 = _1868;
    if (_1774)
    {
        float _1872 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1872;
    }
    float _1874 = _1674;
    if (_1774)
    {
        float _1876 = _1762 * _1866;
        _1854 = _1876;
    }
    float _1878 = _1854;
    if (!_1774)
    {
        _1862 = _1764;
    }
    float _1880 = _1862;
    float _1882 = _1880;
    if (_1774)
    {
        float _1884 = _1764 * _1866;
        _1882 = _1884;
    }
    float _1886 = _1882;
    if (!_1774)
    {
        _1798 = _1766;
    }
    float _1888 = _1798;
    float _1890 = _1888;
    if (_1774)
    {
        float _1892 = fma(_1834, _1828, _1874);
        _1870 = _1892;
    }
    float _1894 = _1870;
    if (_1774)
    {
        float _1896 = _1878 * _1878;
        _1890 = _1896;
    }
    float _1898 = _1890;
    if (!_1774)
    {
        _1856 = _1768;
    }
    float _1900 = _1856;
    float _1902 = _1900;
    if (_1774)
    {
        float _1904 = _1886 * _1886;
        _1902 = _1904;
    }
    float _1906 = _1902;
    float _1908 = fma(_1894, _1894, _1898);
    float _1910 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1840);
    float _1912 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1914 = _1908 + _1906;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1918 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1916);
    float _1920 = precise::clamp(_1918, 0.0, 1.0);
    float _1922 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1924 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1926 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1912);
    float _1928 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1910);
    float _1930 = rsqrt(_1914);
    float _1932 = -_1920;
    float _1934 = _1932 + 1.0;
    float _1936 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1924);
    float _1938 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1926);
    float _1940 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1944 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1936);
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1948 = abs(_1934);
    float _1950 = log2(_1948);
    float _1952 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1942);
    float _1954 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1958 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1960 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1952);
    float _1962 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1956);
    float _1964 = _1930 * _1878;
    float _1966 = _1930 * _1894;
    float _1968 = _1930 * _1886;
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1972 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1974 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1962);
    float _1976 = -_1958;
    float _1978 = fma(_1976, _1922, 1.0);
    float _1980 = -_1972;
    float _1982 = fma(_1966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1980);
    float _1984 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1986 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1974);
    float _1988 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1990 = -_1968;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1982);
    float _1994 = log2(_1978);
    float _1996 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1998 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1988);
    float _2000 = fma(_1992, -0.5, 0.5);
    float _2002 = fma(_1992, 0.5, 0.5);
    float _2004 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1996);
    float _2006 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1998);
    float _2008 = _1966 + 1.0;
    float _2010 = exp2(_1984);
    float _2012 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2004);
    float _2014 = 1.0 / _1986;
    float _2016 = fma(_2002, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2018 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2012);
    float _2020 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2006);
    float _2022 = _1994 * 0.693147182464599609375;
    float _2024 = fma(_2002, _2016, -0.212114393711090087890625);
    float _2026 = sqrt(_2000);
    float _2028 = -_1966;
    float _2030 = fma(_2010, _2008, _2028);
    float _2032 = fma(_2002, _2024, 1.570728778839111328125);
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2036 = fma(_2030, 0.5, 0.5);
    float _2038 = _2018 * _2014;
    float _2040 = _2020 * _2014;
    float _2042 = fma(_2038, 0.5, 0.5);
    float _2044 = fma(_2040, -0.5, 0.5);
    float _2046 = _2026 * 0.636619746685028076171875;
    float _2048 = -_2032;
    float _2050 = fma(_2046, _2048, 1.0);
    float3 _6164 = float3(_2042, _2044, _2034);
    float _2052 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6164, float3(0.0), isnan(_6164)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6164, float3(0.0), isnan(_6164)), level(0.0)).x;
    float3 _6175 = float3(_2042, _2044, _2034);
    float4 _2055 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6175, float3(0.0), isnan(_6175)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6175, float3(0.0), isnan(_6175)), level(0.0)).xyzw;
    float _2057 = _2055.x;
    float _2059 = _2055.y;
    float _2061 = _2055.z;
    float _2063 = _2055.w;
    float2 _6192 = float2(_2050, _2036);
    float3 _2067 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6192, float2(0.0), isnan(_6192)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6192, float2(0.0), isnan(_6192)), level(0.0)).xyz;
    float _2069 = _2067.x;
    float _2071 = _2067.y;
    float _2073 = _2067.z;
    float _2075 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2077 = int(_2075);
    out.m_60.x = _954;
    out.m_60.y = _956;
    out.m_60.z = _946;
    out.m_60.w = _948;
    bool _2079 = _619 > 0.5;
    float _2081 = -_1306;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    bool _2085 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.5);
    bool _2093 = _2089 || _2091;
    float _2095 = -_1314;
    float _2097 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _2099 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2101 = int(_2099);
    bool _2103 = _1000 > 0.5;
    float _2105 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2107 = -_1340;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _2111 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2105);
    float _2113 = 1.0 / _988;
    float _2115 = float(_2077);
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2123 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2125 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.x = _1732;
    out.m_62.y = _1728;
    out.m_62.z = _1736;
    float _2127 = 1.0 / _2115;
    float _2129 = float(uint(_2101));
    float _2131 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2125);
    int _2133 = ~_2101;
    int _2135 = _2133 + 1;
    out.m_64.y = _1522;
    int _2137 = ~_2101;
    int _2139 = _2137 + 1;
    float _2141 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2131);
    int _2143 = ~_2101;
    int _2145 = _2143 + 1;
    float _2147 = 1.0 / _2129;
    float _2149 = _129 * _2127;
    float _2151 = in.m_56.w;
    float _2153 = exp2(_2123);
    int _2155 = as_type<int>(_2147) + (-2);
    float _2157 = trunc(_2149);
    int _2159 = int(_2157);
    float _2161 = -_2153;
    float _2163 = _2161 + 1.0;
    float _2165 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2167 = _2151 > 0.5;
    float _2169 = -_2165;
    float _2171 = _2169 + 1.0;
    float _2173 = float(uint(_2159));
    float _2175 = as_type<float>(_2155) * _2173;
    float _2177 = trunc(_2175);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    int _2183 = _2135 * int(_2181);
    int _2185 = _2183 + _2159;
    float _2187 = float(uint(_2185));
    float _2189 = as_type<float>(_2155) * _2187;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2193 = _2191 != 0;
    bool _2195 = !_2193;
    float _2197 = _2195 ? _1000 : _619;
    float _2199 = trunc(_2189);
    float _2201 = precise::max(_2199, 0.0);
    uint _2203 = uint(_2201);
    bool _2205 = !_2193;
    float _2207 = _2205 ? 1.2345600128173828125 : 1.0;
    float _2209 = _2207 * _2197;
    float _2211 = float(_2159);
    int _2213 = int(_2181) + int(_2203);
    float _2215 = float(_2101);
    float _2217 = floor(_2209);
    int _2219 = _2139 * _2213;
    int _2221 = _2219 + _2159;
    bool _2223 = _2211 >= _2215;
    bool _2225 = isnan(_2211);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan(_2215);
    bool _2231 = _2227 || _2229;
    float _2233 = float(_2231);
    float _2235 = _129 * _2215;
    bool _2237 = uint(_2221) >= uint(_2101);
    float _2239 = _2235 * _2113;
    float _2241 = trunc(_2233);
    int _2243 = int(_2241);
    bool _2245 = !_2237;
    int _2247 = _2245 ? 0 : (-1);
    bool _2249 = _2101 == 0;
    int _2251 = ~_2213;
    int _2253 = _2251 + _2247;
    int _2255 = _2253 + 1;
    float _2257 = -_2217;
    float _2259 = _2209 + _2257;
    float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2265 = _2101 + (-1);
    float _2267 = trunc(_2239);
    int _2269 = int(_2267);
    int _2271 = _2101 * _2255;
    int _2273 = _2271 + _2159;
    float _2275 = _2259 * _2215;
    float _2277 = _619 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2279 = ~_2243;
    int _2281 = _2279 + 1;
    int _2283 = _2281 + 1;
    bool _2285 = !_2249;
    int _2287 = _2285 ? _2273 : (-1);
    float _2289 = trunc(_2275);
    int _2291 = int(_2289);
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2295 = _2293 != 0;
    int _2297 = _2287 * _2283;
    int _2299 = abs(_1656);
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2303 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2305 = _990 + _2303;
    int _2307 = _2243 * _2265;
    int _2309 = _2307 + _2297;
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2315 = 1.0 / _2263;
    int _2317 = abs(_1652);
    float _2319 = -_2301;
    float _2321 = fma(_2277, 2.0, _2319);
    bool _2323 = !_2295;
    int _2325 = _2323 ? 0 : 1;
    int _2327 = _2309 * _2317;
    int _2329 = abs(_2325);
    float _2331 = 1.0 / _2313;
    float _2333 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2335 = _2269 * _2299;
    int _2337 = _2335 + _2327;
    int _2339 = abs(_1660);
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2341;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2349 = _2347 != 0;
    float _2351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2355 = _2353 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2357 = fma(_2333, -2.0, _2345);
    int _2359 = _2291 * _2329;
    int _2361 = _2359 + _2159;
    float _2363 = _2343 * _2315;
    int _2365 = abs(as_type<int>(_1664));
    float _2367 = _2355 * _2331;
    int _2369 = _2361 * _2339;
    int _2371 = _2369 + _2337;
    float _2373 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2375 = -_129;
    float _2377 = fma(_2375, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2321);
    float _2379 = as_type<float>(_2365);
    if (!_2193)
    {
        _1676 = _1000;
    }
    float _2381 = _1676;
    float _2383 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2373);
    float _2385 = _2381;
    if (_2193)
    {
        _2385 = _619;
    }
    float _2387 = _2385;
    int _2389 = _2291 * _2365;
    int _2391 = _2389 + _2371;
    float _2393 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2395 = -_209;
    int _2397 = _2079 ? as_type<int>(_2395) : as_type<int>(_209);
    float _2399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2401 = float(uint(_2391));
    float _2403 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2405 = !_2349;
    float _2407 = _2405 ? _209 : as_type<float>(_2397);
    float _2409 = _2387 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2411 = _2403;
    if (!_2193)
    {
        _2379 = _992;
    }
    float _2413 = _2379;
    float _2415 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2403);
    float _2417 = _2413;
    if (!_2193)
    {
        _2411 = _992;
    }
    float _2419 = _2411;
    float _2421 = as_type<float>(_2155) * _2401;
    bool _2423 = _992 > 0.5;
    float _2425 = _2407 + 0.5;
    float _2427 = _2419;
    if (_2193)
    {
        _2417 = _1000;
    }
    float _2429 = _2417;
    float _2431 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2383);
    if (_2193)
    {
        _2427 = _1000;
    }
    float _2433 = _2427;
    float _2435 = fma(_2393, _2425, _2377);
    bool _2437 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2439 = isnan(_990);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = trunc(_2421);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    bool _2455 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2457 = isnan(_990);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2463 = _2459 || _2461;
    float _2465 = float(_2463);
    float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2469 = _990 + _2467;
    bool _2471 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2473 = isnan(_990);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = -_2447;
    float _2485 = _2483 + 1.0;
    int _2487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2489 = _2487 != 0;
    float _2491 = -_2465;
    float _2493 = _2491 + 1.0;
    float _2495 = _2399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2497 = _2465 * _2485;
    float _2499 = fma(_2363, _2305, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2501 = _2481 * _2493;
    float _2503 = fma(_2367, _2469, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2505 = ~_2101;
    int _2507 = _2505 + 1;
    float _2509 = fma(_2433, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2117);
    float _2511 = _2499 * _2501;
    float _2513 = float(uint(_2361));
    float _2515 = _2429 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2517 = ~_2101;
    int _2519 = _2517 + 1;
    float _2521 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2415);
    float _2523 = as_type<float>(_2155) * _2513;
    int _2525 = _2507 * int(_2453);
    int _2527 = _2525 + _2391;
    float _2529 = fma(_2515, -2.0, _2121);
    float _2531 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2509);
    float _2533 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2535 = -_2481;
    float _2537 = _2535 + 1.0;
    float _2539 = trunc(_2523);
    float _2541 = precise::max(_2539, 0.0);
    uint _2543 = uint(_2541);
    float _2545 = float(uint(_2527));
    float _2547 = -_2533;
    float _2549 = fma(_2409, 2.0, _2547);
    float _2551 = -as_type<float>(_205);
    int _2553 = _2103 ? as_type<int>(_2551) : _205;
    float _2555 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2529);
    float _2557 = fma(_2537, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2511);
    float _2559 = as_type<float>(_2155) * _2545;
    bool _2561 = !_2489;
    float _2563 = _2561 ? as_type<float>(_205) : as_type<float>(_2553);
    float _2565 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2357);
    float _2567 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2119);
    float _2569 = -_129;
    float _2571 = fma(_2569, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2549);
    int _2573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2575 = _2573 != 0;
    float _2577 = trunc(_2559);
    float _2579 = precise::max(_2577, 0.0);
    uint _2581 = uint(_2579);
    float _2583 = _2563 + (-0.5);
    float _2585 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2567);
    float _2587 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2589 = _2519 * int(_2543);
    int _2591 = _2589 + _2361;
    float _2593 = -_2495;
    float _2595 = -_2565;
    float _2597 = fma(_2593, _2583, _2595);
    float _2599 = fma(_2503, _2497, _2557);
    float _2601 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2587);
    float _2603 = -_2431;
    float _2605 = _2603 + 1.0;
    float _2607 = float(uint(_2591));
    float _2609 = -_2521;
    float _2611 = _2609 + 1.0;
    float _2613 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2601);
    float _2615 = -_2605;
    float _2617 = fma(_2407, _2615, _2435);
    float _2619 = -_2531;
    float _2621 = _2619 + 1.0;
    float _2623 = as_type<float>(_2155) * _2607;
    float _2625 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2111);
    int _2627 = int(_2453) + int(_2581);
    float _2629 = trunc(_2623);
    float _2631 = precise::max(_2629, 0.0);
    uint _2633 = uint(_2631);
    float _2635 = -_209;
    int _2637 = _2423 ? as_type<int>(_2635) : as_type<int>(_209);
    float _2639 = _2625 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2641 = _2613 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2643 = _2145 * _2627;
    int _2645 = _2643 + _2391;
    bool _2647 = !_2575;
    float _2649 = _2647 ? _209 : as_type<float>(_2637);
    float _2651 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2599);
    int _2653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2655 = _2653 != 0;
    float _2657 = 1.0 / _2639;
    bool _2659 = uint(_2645) >= uint(_2101);
    float _2661 = _2649 + 0.5;
    float _2663 = -as_type<float>(_205);
    int _2665 = _2167 ? as_type<int>(_2663) : _205;
    float _2667 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2669 = !_2659;
    int _2671 = _2669 ? 0 : (-1);
    float _2673 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2571);
    bool _2675 = !_2655;
    float _2677 = _2675 ? as_type<float>(_205) : as_type<float>(_2665);
    float _2679 = as_type<float>(_205) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2681 = ~_2627;
    int _2683 = _2681 + _2671;
    int _2685 = _2683 + 1;
    float _2687 = _2641 + _2639;
    int _2689 = int(_2543) + int(_2633);
    float _2691 = _1550 * _2679;
    float _2693 = as_type<float>(_2633);
    float _2695 = _2503;
    float _2697 = _2617;
    if (!_2093)
    {
        _2693 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2699 = _2693;
    int _2701 = _2101 * _2685;
    int _2703 = _2701 + _2391;
    float _2705 = _2677 + (-0.5);
    float _2707 = _2687 * _2657;
    float _2709 = _2707 * 0.5;
    int _2711 = ~_2101;
    int _2713 = _2711 + 1;
    float _2715 = _1614 * _2679;
    bool _2717 = !_2249;
    int _2719 = _2717 ? _2703 : (-1);
    float _2721 = -_2705;
    float _2723 = -_2555;
    float _2725 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2723);
    float _2727 = as_type<float>(_2703);
    float _2729 = _2709;
    if (!_2093)
    {
        float _2731 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2733 = fma(_2709, _2699, _2731);
        _2727 = _2733;
    }
    float _2735 = _2727;
    int _2737 = _2713 * _2689;
    int _2739 = _2737 + _2361;
    int _2741 = _2719 >> 31;
    float _2743 = _1526 * _2679;
    if (!_2093)
    {
        _2729 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2745 = _2729;
    float _2747 = _2165 * _2052;
    int _2749 = _2741 & 3;
    float _2751 = _2735;
    if (!_2093)
    {
        float _2753 = 1.0 / _2735;
        _2751 = _2753;
    }
    float _2755 = _2751;
    float _2757 = -_2585;
    float _2759 = _2757 + 1.0;
    bool _2761 = uint(_2739) >= uint(_2101);
    if (!_2093)
    {
        float _2763 = -_2745;
        float _2765 = _2763 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2695 = _2765;
    }
    float _2767 = _2695;
    int _2769 = _2719 + _2749;
    float _2771 = -_2759;
    float _2773 = fma(_2649, _2771, _2673);
    int _2775 = _2719 & 3;
    bool _2777 = _2775 != 0;
    out.m_66.w = _2667;
    int _2779 = _2769 >> 2;
    float _2781 = _2435;
    if (!_2093)
    {
        float _2783 = 1.0 / _2767;
        _2781 = _2783;
    }
    float _2785 = _2781;
    int _2787 = _2719 & 3;
    bool _2789 = _2787 != 0;
    int _2791 = _2779 << 4;
    int _2793 = _2791 + 512;
    float _2795 = fma(_2563, _2611, _2597);
    float _2797 = fma(_2677, _2621, _2725);
    bool _2799 = uint(_2787) > 1u;
    uint _2801 = uint(int(uint(_2793) >> uint(2)));
    uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
    int _2805 = int(_2801) & 3;
    float _2807 = (*spvDescriptorSet0.vp_c9)._m0[int(_2803)][_2805];
    int _2809 = int(_2801) + 1;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    int _2813 = _2809 & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    float _2817 = _2755;
    if (!_2093)
    {
        float _2819 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2821 = -_2745;
        float _2823 = fma(_2755, _2819, _2821);
        _2817 = _2823;
    }
    float _2825 = _2817;
    bool _2827 = !_2761;
    int _2829 = _2827 ? 0 : (-1);
    out.m_68.x = _2617;
    out.m_68.y = _2795;
    out.m_68.z = _2773;
    out.m_68.w = _2797;
    int _2831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2833 = _2831 != 0;
    int _2835 = ~_2689;
    int _2837 = _2835 + _2829;
    int _2839 = _2837 + 1;
    int _2841 = _2793 + 8;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    uint _2845 = uint(int(uint(int(_2843)) >> uint(2)));
    int _2847 = int(_2843) & 3;
    float _2849 = (*spvDescriptorSet0.vp_c9)._m0[int(_2845)][_2847];
    int _2851 = int(_2843) + 1;
    uint _2853 = uint(int(uint(_2851) >> uint(2)));
    int _2855 = _2851 & 3;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[int(_2853)][_2855];
    float _2859 = _2825;
    if (!_2093)
    {
        float _2861 = _2825 * _2785;
        float _2863 = precise::clamp(_2861, 0.0, 1.0);
        _2859 = _2863;
    }
    float _2865 = _2859;
    int _2867 = _2101 * _2839;
    int _2869 = _2867 + _2361;
    bool _2871 = !_2249;
    int _2873 = _2871 ? _2869 : (-1);
    float _2875 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2877 = _2777 ? 0 : 1;
    bool _2879 = _2787 != 3;
    float _2881 = fma(_1556, _2875, _2691);
    int _2883 = ~_2877;
    int _2885 = _2883 + 1;
    int _2887 = _2885 + 1;
    float _2889 = fma(_1622, _2875, _2715);
    int _2891 = _2887;
    if (_2093)
    {
        _2697 = 1.0;
    }
    float _2893 = _2697;
    float _2895 = _2893;
    if (!_2093)
    {
        float _2897 = -_2865;
        float _2899 = _2897 + 1.0;
        _2895 = _2899;
    }
    float _2901 = _2895;
    if (!_2799)
    {
        int _2903 = ~_2877;
        int _2905 = _2903 + 1;
        _2891 = _2905;
    }
    int _2907 = _2891;
    float _2909 = fma(_1518, _2875, _2743);
    bool _2911 = uint(_2787) >= 2u;
    float _2913 = _2073 * _2747;
    bool _2915 = !_2789;
    int _2917 = _2915 ? 0 : 1;
    float _2919 = _1598 + _2889;
    int _2921 = abs(_2907);
    float _2923 = _1564 + _2881;
    int _2925 = _2911 ? 0 : 1;
    float _2927 = _1528 + _2909;
    int _2929 = abs(_2917);
    int _2931 = ~_2925;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    out.m_70.x = _2923;
    out.m_70.y = _2919;
    out.m_70.z = _2927;
    int _2937 = _2935;
    if (_2879)
    {
        int _2939 = ~_2925;
        int _2941 = _2939 + 1;
        _2937 = _2941;
    }
    int _2943 = _2937;
    bool _2945 = _2787 != 3;
    int _2947 = ~_2921;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    int _2953 = abs(_2943);
    bool _2955 = !_2945;
    int _2957 = _2955 ? 0 : (-1);
    int _2959 = _2951 * as_type<int>(_2815);
    int _2961 = ~_2929;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    bool _2967 = !_2833;
    int _2969 = _2967 ? 0 : 1;
    int _2971 = abs(_2957);
    int _2973 = _2965 * as_type<int>(_2807);
    int _2975 = _2973 + _2959;
    int _2977 = ~_2953;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    int _2983 = abs(_2969);
    int _2985 = ~_2971;
    int _2987 = _2985 + 1;
    int _2989 = _2987 + 1;
    int _2991 = _2981 * as_type<int>(_2849);
    int _2993 = _2991 + _2975;
    float _2995 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2997 = _2901 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2999 = _2989 * as_type<int>(_2857);
    int _3001 = _2999 + _2993;
    int _3003 = ~_2983;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    float _3009 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3011 = _2995 + _3009;
    float _3013 = _707 * _2997;
    bool _3015 = _2901 > 0.0;
    bool _3017 = isnan(_2901);
    bool _3019 = _3015 || _3017;
    bool _3021 = isnan(0.0);
    bool _3023 = _3019 || _3021;
    int _3025 = _3001 * _3007;
    float _3027 = _1986 + _3011;
    int _3029 = _2873 * _2983;
    int _3031 = _3029 + _3025;
    float _3033 = _2063 * _2747;
    float _3035 = _3027 * 0.5;
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _3011;
    out.gl_Position.w = _1986;
    float _3037 = float(_3031);
    float _3039 = _3013 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3041 = fma(_2069, _3033, _2057);
    float _3043 = fma(_2071, _3033, _2059);
    float _3045 = _2063 * _2171;
    float _3047 = fma(_2063, _2913, _2061);
    out.m_72.z = _3035;
    out.m_72.w = _1986;
    out.m_74.y = _3037;
    out.m_45.x = _3039;
    out.m_76.x = _3041;
    out.m_76.y = _3043;
    out.m_76.z = _3047;
    out.m_76.w = _3045;
    if (_3023)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3049 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3049;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _980 = false;
    bool _847 = false;
    bool _727 = false;
    bool _491 = false;
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
        float _3106 = as_type<float>(_111);
        out.gl_Position.z = _3106;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        out.m_45.x = 0.0;
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
        float _3174 = as_type<float>(_149);
        out.gl_Position.z = _3174;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = 0.0;
    float _173 = _153;
    if (!_169)
    {
        float _175 = _153 * _153;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = 0.0;
    float _183 = _179;
    if (!_169)
    {
        float _185 = _129 * _129;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    if (!_169)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _191;
    }
    float _193 = _183;
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    bool _203 = !_201;
    int _205 = _203 ? (-1090519040) : 1056964608;
    bool _207 = !_197;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_169;
    float _213 = _193;
    float _215 = _151;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _153 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _153);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _245;
        _133 = _233;
        _215 = _235;
    }
    float _247 = _213;
    float _249 = _133;
    float _251 = _215;
    bool _253 = !_169;
    float _255 = _251;
    float _257 = _249;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _153 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _265;
        _173 = _277;
    }
    float _279 = _255;
    float _281 = _173;
    float _283 = _279;
    if (!_169)
    {
        _283 = _129;
    }
    float _285 = _283;
    float _287 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _285;
    if (!_169)
    {
        float _291 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _291;
    }
    float _293 = _257;
    bool _295 = !_169;
    float _297 = _293;
    if (!_295)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _305 = _303 + 1.0;
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _129 * _301;
        float _311 = 1.0 / _305;
        float _313 = _307 * 0.693147182464599609375;
        float _315 = exp2(_309);
        float _317 = 1.0 / _313;
        float _319 = _315 + (-1.0);
        float _321 = -_319;
        float _323 = fma(_321, _317, _129);
        float _325 = _323 * _311;
        float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _327;
    }
    float _329 = _297;
    bool _331 = !_169;
    if (!_331)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _129 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _289 = _351;
    }
    float _353 = _289;
    float _355 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = fma(_281, _157, _287);
    float _361 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_353, _157, _355);
    float _365 = fma(_281, _155, _357);
    float _367 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_353, _155, _361);
    float _373 = -_363;
    float _375 = _359 + _373;
    float _377 = fma(_353, _159, _367);
    float _379 = fma(_281, _159, _369);
    float _381 = -_371;
    float _383 = _365 + _381;
    float _385 = _375 * _375;
    float _387 = in.m_52.w;
    float _389 = -_377;
    float _391 = _379 + _389;
    float _393 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = fma(_383, _383, _385);
    out.m_54.y = as_type<float>(_205);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _401 = fma(_391, _391, _395);
    float _403 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _405 = in.m_42.x;
    float _407 = in.m_42.y;
    float _409 = in.m_42.z;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _413 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _399);
    float _415 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _403);
    float _417 = sqrt(_401);
    float _419 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    float _421 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _415);
    bool _423 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan(9.9999999747524270787835121154785e-07);
    bool _431 = _427 || _429;
    float _433 = fma(_365, _387, _405);
    float _435 = fma(_359, _387, _407);
    float _437 = fma(_379, _387, _409);
    float _439 = _411;
    float _441 = _387;
    float _443 = _421;
    if (_431)
    {
        _439 = _413;
    }
    float _445 = _439;
    float _447 = _445;
    if (_431)
    {
        _441 = _419;
    }
    float _449 = _441;
    float _451 = _449;
    if (!_431)
    {
        bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _455 = !_453;
        if (!_455)
        {
            float _457 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _459 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _463 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
            float _465 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _459);
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _467);
            float _475 = _469 * _469;
            float _477 = fma(_471, _471, _475);
            float _479 = fma(_473, _473, _477);
            float _481 = rsqrt(_479);
            float _483 = _481 * 9.9999999747524270787835121154785e-07;
            float _485 = _471 * _483;
            float _487 = _469 * _483;
            float _489 = _473 * _483;
            _451 = _487;
            _447 = _485;
            _443 = _489;
            _491 = true;
        }
        else
        {
            float _493 = _157 * _157;
            float _495 = fma(_155, _155, _493);
            float _497 = fma(_159, _159, _495);
            float _499 = sqrt(_497);
            bool _501 = _499 >= 9.9999999747524270787835121154785e-07;
            bool _503 = isnan(_499);
            bool _505 = _501 || _503;
            bool _507 = isnan(9.9999999747524270787835121154785e-07);
            bool _509 = _505 || _507;
            if (!_509)
            {
                float _511 = _407 * _407;
                float _513 = fma(_405, _405, _511);
                float _515 = fma(_409, _409, _513);
                float _517 = sqrt(_515);
                bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
                bool _521 = isnan(_517);
                bool _523 = _519 || _521;
                bool _525 = isnan(9.9999999747524270787835121154785e-07);
                bool _527 = _523 || _525;
                if (!_527)
                {
                    float _529 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _531 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _529);
                    float _533 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _541 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _543 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _451 = _541;
                    _447 = _539;
                    _443 = _543;
                    _491 = true;
                }
                else
                {
                    float _545 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _549 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _551 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                    float _553 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                    float _557 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                    float _559 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                    float _561 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                    float _563 = _557 * _557;
                    float _565 = fma(_559, _559, _563);
                    float _567 = fma(_561, _561, _565);
                    float _569 = rsqrt(_567);
                    float _571 = _569 * 9.9999999747524270787835121154785e-07;
                    float _573 = _559 * _571;
                    float _575 = _557 * _571;
                    float _577 = _561 * _571;
                    _451 = _575;
                    _447 = _573;
                    _443 = _577;
                    _491 = true;
                }
            }
            else
            {
                float _579 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _581 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _583 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _585 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _579);
                float _587 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _581);
                float _589 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _583);
                float _591 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _585);
                float _593 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _587);
                float _595 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _589);
                float _597 = _591 * _591;
                float _599 = fma(_593, _593, _597);
                float _601 = fma(_595, _595, _599);
                float _603 = rsqrt(_601);
                float _605 = _603 * 9.9999999747524270787835121154785e-07;
                float _607 = _593 * _605;
                float _609 = _591 * _605;
                float _611 = _595 * _605;
                _451 = _609;
                _447 = _607;
                _443 = _611;
            }
        }
    }
    _491 = false;
    float _613 = _451;
    float _615 = _447;
    float _617 = _443;
    float _619 = in.m_56.x;
    float _621 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _623 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _631 = _629 != 0;
    float _633 = _623 * _621;
    int _635 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _637 = _635 != 0;
    float _639 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[20].x, _633);
    bool _641 = !_631;
    int _643 = _641 ? 0 : 1;
    float _645 = _639 * 6.283185482025146484375;
    float _647 = floor(_639);
    int _649 = abs(_643);
    float _651 = _645 * 0.15915493667125701904296875;
    bool _653 = !_627;
    int _655 = _653 ? 0 : 1;
    int _657 = abs(_655);
    float _659 = _651 * 6.283185482025146484375;
    float _661 = cos(_659);
    bool _663 = !_637;
    int _665 = _663 ? 0 : 1;
    bool _667 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _669 = -_647;
    float _671 = _639 + _669;
    int _673 = abs(_665);
    float _675 = float(_657);
    float _677 = -_671;
    float _679 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _681 = _671 < 0.5;
    float _683 = float(_681);
    float _685 = abs(_679);
    float _687 = _675 * _685;
    float _689 = fma(_661, 0.5, 0.5);
    float _691 = float(_673);
    float _693 = -_683;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _697 = float(_649);
    float _699 = -_689;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _703 = fma(_691, _701, _687);
    float _705 = abs(_695);
    float _707 = fma(_697, _705, _703);
    bool _709 = !_667;
    float _725;
    if (!_709)
    {
        float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _713 = _619 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _715 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _717 = _715 * _711;
        float _719 = floor(_717);
        float _721 = -_719;
        float _723 = _717 + _721;
        _725 = _723;
        _727 = true;
    }
    else
    {
        float _729 = float(_95);
        float _731 = 1.0 / _729;
        float _733 = _129 * _731;
        _725 = _733;
    }
    _727 = false;
    float _735 = _725;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _739 = _735 + _737;
    float _741 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _743 = in.m_52.x;
    float _745 = in.m_52.y;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _747;
    bool _751 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _753 = isnan(_735);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _741 * _619;
    bool _765 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _767 = 1.0 / _749;
    float _769 = -_761;
    float _771 = _769 + 1.0;
    float _773 = trunc(_763);
    int _775 = int(_773);
    float _777 = _739 * _767;
    bool _779 = _735 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _781 = isnan(_735);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _791;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _795;
    float _799 = _789 * _771;
    float _801 = fma(_793, _777, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _803 = fma(_797, _777, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _805 = -_789;
    float _807 = _805 + 1.0;
    int _809 = _775 << 4;
    int _811 = _809 + 1712;
    float _813 = _801 * _799;
    float _815 = _803 * _799;
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[143].x, _813);
    float _819 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[143].y, _815);
    float _821 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].x, _817);
    float _823 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[144].y, _819);
    float _825 = _821 * _743;
    float _827 = _823 * _745;
    bool _829 = !_765;
    float _845;
    if (!_829)
    {
        float _831 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _833 = _619 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _835 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _837 = _835 * _831;
        float _839 = floor(_837);
        float _841 = -_839;
        float _843 = _837 + _841;
        _845 = _843;
        _847 = true;
    }
    else
    {
        float _849 = float(_95);
        float _851 = 1.0 / _849;
        float _853 = _129 * _851;
        _845 = _853;
    }
    _847 = false;
    float _855 = _845;
    int _857 = _811 + 8;
    uint _860 = uint(int(uint(_857) >> uint(2)));
    uint _862 = uint(int(uint(int(_860)) >> uint(2)));
    int _864 = int(_860) & 3;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[int(_862)][_864];
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _870 = _855 + _868;
    bool _872 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _874 = isnan(_855);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _888 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _890 = isnan(_855);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    uint _900 = uint(int(uint(_811) >> uint(2)));
    uint _902 = uint(int(uint(int(_900)) >> uint(2)));
    int _904 = int(_900) & 3;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[int(_902)][_904];
    int _908 = int(_900) + 1;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    int _912 = _908 & 3;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[int(_910)][_912];
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _916;
    float _920 = -_882;
    float _922 = _920 + 1.0;
    bool _924 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _926 = 1.0 / _886;
    float _928 = _898 * _922;
    float _930 = -_898;
    float _932 = _930 + 1.0;
    float _934 = _918 * _926;
    float _936 = fma(_934, _870, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _938 = _936 * _928;
    float _940 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[115].x, _938);
    float _942 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[116].x, _940);
    float _944 = _866 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _942 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _950 = _906 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = _914 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _958 = !_924;
    float _976;
    float _978;
    if (!_958)
    {
        float _960 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _962 = _619 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _964 = float(_95);
        float _966 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _968 = _966 * _960;
        float _970 = floor(_968);
        float _972 = -_970;
        float _974 = _968 + _972;
        _976 = _964;
        _978 = _974;
        _980 = true;
    }
    else
    {
        float _982 = float(_95);
        float _984 = 1.0 / _982;
        float _986 = _129 * _984;
        _976 = _982;
        _978 = _986;
    }
    _980 = false;
    float _988 = _976;
    float _990 = _978;
    float _992 = in.m_56.z;
    float _994 = _619 * 2.0;
    float _996 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _998 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1000 = in.m_56.y;
    float _1002 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1004 = _613 * _613;
    float _1006 = floor(_994);
    float _1008 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _998);
    float _1010 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _996);
    float _1012 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1002);
    float _1014 = fma(_615, _615, _1004);
    float _1016 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1008);
    float _1018 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1010);
    float _1020 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1012);
    float _1022 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1024 = log2(_1022);
    float _1026 = fma(_617, _617, _1014);
    float _1028 = _1016 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1030 = _1018 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1032 = _1020 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1034 = rsqrt(_1026);
    float _1036 = _992 * 2.0;
    bool _1038 = _1006 > 0.0;
    float _1040 = _827 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1042 = _1006 >= 0.0;
    bool _1044 = isnan(_1006);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(0.0);
    bool _1050 = _1046 || _1048;
    float _1052 = _1000 * 2.0;
    float _1054 = _1000 + _992;
    float _1056 = floor(_1036);
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1060 = _1058 != 0;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1068 = _1066 != 0;
    float _1070 = _129 * _1024;
    float _1072 = _1054 + (-1.0);
    bool _1074 = !_1064;
    int _1076 = _1074 ? 0 : 1;
    float _1078 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1080 = floor(_1052);
    float _1082 = _619 + _992;
    int _1084 = abs(_1076);
    float _1086 = _1082 + (-1.0);
    bool _1088 = _1056 > 0.0;
    float _1090 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1092 = _1056 >= 0.0;
    bool _1094 = isnan(_1056);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan(0.0);
    bool _1100 = _1096 || _1098;
    float _1102 = exp2(_1070);
    bool _1104 = !_1060;
    int _1106 = _1104 ? 0 : 1;
    float _1108 = in.m_58.x;
    float _1110 = in.m_58.y;
    float _1112 = in.m_58.z;
    float _1114 = _1034 * _613;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1118 = 1.0 + _1116;
    bool _1120 = _1080 > 0.0;
    bool _1122 = _1080 >= 0.0;
    bool _1124 = isnan(_1080);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = _1034 * _615;
    float _1134 = _1034 * _617;
    int _1136 = _1050 ? 0 : 1;
    float _1138 = 1.0 / _1118;
    int _1140 = _1100 ? 0 : 1;
    float _1142 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1144 = ~_1136;
    int _1146 = _1144 + 1;
    int _1148 = _1146 + 1;
    int _1150 = _1148;
    if (!_1038)
    {
        int _1152 = ~_1136;
        int _1154 = _1152 + 1;
        _1150 = _1154;
    }
    int _1156 = _1150;
    float _1158 = -_1102;
    float _1160 = _1158 + 1.0;
    int _1162 = ~_1140;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    int _1168 = _1166;
    if (!_1088)
    {
        int _1170 = ~_1140;
        int _1172 = _1170 + 1;
        _1168 = _1172;
    }
    int _1174 = _1168;
    float _1176 = _1000 + (-0.5);
    int _1178 = abs(_1106);
    float _1180 = float(_1084);
    float _1182 = float(_1156);
    bool _1184 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1186 = isnan(0.0);
    bool _1188 = _1184 || _1186;
    bool _1190 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1192 = _1188 || _1190;
    float _1194 = _1180 * _1182;
    int _1196 = _1130 ? 0 : 1;
    float _1198 = float(_1178);
    float _1200 = _1194 * (-2.0);
    float _1202 = _1192 ? _1160 : 0.0;
    int _1204 = ~_1196;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    int _1210 = _1208;
    if (!_1120)
    {
        int _1212 = ~_1196;
        int _1214 = _1212 + 1;
        _1210 = _1214;
    }
    int _1216 = _1210;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1028 + _1218;
    float _1222 = float(_1174);
    float _1224 = fma(_1200, _1110, _1110);
    float _1226 = _1202 * _1138;
    float _1228 = fma(_1078, _1200, _1078);
    float _1230 = _619 + _1000;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1030 + _1232;
    float _1236 = _1220 * _1220;
    float _1238 = _1198 * _1222;
    float _1240 = _1230 + (-1.0);
    float _1242 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1244 = _1032 + _1242;
    float _1246 = fma(_1234, _1234, _1236);
    float _1248 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1224);
    bool _1250 = !_1068;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = _1238 * (-2.0);
    float _1256 = fma(_1244, _1244, _1246);
    bool _1258 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1260 = isnan(1.0);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1266 = _1262 || _1264;
    int _1268 = abs(_1252);
    bool _1270 = !_1266;
    float _1272 = _1270 ? _129 : _1226;
    float _1274 = rsqrt(_1256);
    float _1276 = float(_1268);
    float _1278 = fma(_1132, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1142);
    float _1280 = float(_1216);
    float _1282 = fma(_1272, _1228, _1248);
    float _1284 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1286 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1278);
    float _1288 = _619 + (-0.5);
    float _1290 = _1276 * _1280;
    float _1292 = fma(_1254, _1108, _1108);
    float _1294 = _1282 * 0.15915493667125701904296875;
    float _1296 = abs(_1286);
    bool _1298 = _1296 > 0.99989998340606689453125;
    float _1300 = _1290 * (-2.0);
    float _1302 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1292);
    float _1304 = fma(_1284, _1254, _1284);
    float _1306 = _1220 * _1274;
    float _1308 = fma(_1090, _1300, _1090);
    float _1310 = fma(_1300, _1112, _1112);
    float _1312 = _992 + (-0.5);
    float _1314 = _1234 * _1274;
    float _1316 = -_1306;
    float _1318 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1320 = fma(_1272, _1304, _1302);
    float _1322 = fma(_1312, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1310);
    float _1324 = _1254;
    float _1326 = _1288;
    float _1328 = _1322;
    float _1330 = _1272;
    if (_1298)
    {
        _1324 = 0.001000000047497451305389404296875;
    }
    float _1332 = _1324;
    float _1334 = -_1314;
    float _1336 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1338 = _1318 * _1318;
    float _1340 = _1244 * _1274;
    float _1342 = _1320 * 0.15915493667125701904296875;
    if (!_1298)
    {
        _1326 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1344 = _1326;
    float _1346 = fma(_1272, _1308, _1322);
    float _1348 = fma(_1336, _1336, _1338);
    float _1350 = _1344;
    if (_1298)
    {
        float _1352 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1350 = _1352;
    }
    float _1354 = _1350;
    float _1356 = -_1340;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1244);
    float _1360 = _1294 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    if (!_1298)
    {
        _1328 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1364 = _1328;
    float _1366 = _1346 * 0.15915493667125701904296875;
    float _1368 = _1364;
    if (_1298)
    {
        float _1370 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1368 = _1370;
    }
    float _1372 = _1368;
    float _1374 = fma(_1358, _1358, _1348);
    if (!_1298)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1376 = _1330;
    float _1378 = -_1372;
    float _1380 = _1114 * _1378;
    float _1382 = _1294 * 6.283185482025146484375;
    float _1384 = cos(_1382);
    float _1386 = _1342 * 6.283185482025146484375;
    float _1388 = sin(_1386);
    float _1390 = _1376;
    if (_1298)
    {
        float _1392 = fma(_1332, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1390 = _1392;
    }
    float _1394 = _1390;
    float _1396 = _1342 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = -_1394;
    float _1402 = _1132 * _1400;
    float _1404 = -_1394;
    float _1406 = -_1380;
    float _1408 = fma(_1134, _1404, _1406);
    float _1410 = -_1354;
    float _1412 = -_1402;
    float _1414 = fma(_1114, _1410, _1412);
    float _1416 = _1366 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = -_1354;
    float _1422 = _1134 * _1420;
    float _1424 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1426 = _1388 * _1362;
    float _1428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1430 = -_1372;
    float _1432 = -_1422;
    float _1434 = fma(_1132, _1430, _1432);
    float _1436 = sqrt(_1374);
    float _1438 = _1398 * _1384;
    float _1440 = _1398 * _1362;
    float _1442 = _1366 * 6.283185482025146484375;
    float _1444 = sin(_1442);
    float _1446 = _1434 * _1434;
    float _1448 = _1384 * _1418;
    float _1450 = _1362 * _1418;
    float _1452 = fma(_1408, _1408, _1446);
    float _1454 = fma(_1414, _1414, _1452);
    float _1456 = _1388 * _1384;
    float _1458 = _1398 * _1418;
    float _1460 = fma(_129, 0.014999999664723873138427734375, _619);
    float _1462 = rsqrt(_1454);
    float _1464 = _1274 * _1436;
    float _1466 = _1388 * _1418;
    float _1468 = fma(_1444, _1438, _1426);
    float _1470 = -_1456;
    float _1472 = fma(_1444, _1440, _1470);
    float _1474 = _1424 * _1464;
    float _1476 = fma(_1444, _1426, _1438);
    float _1478 = floor(_1460);
    float _1480 = _1474 * _1428;
    float _1482 = _1468 * _1134;
    float _1484 = -_1440;
    float _1486 = fma(_1444, _1456, _1484);
    float _1488 = _1472 * _1134;
    float _1490 = _1434 * _1462;
    float _1492 = _1414 * _1462;
    float _1494 = _1458 * _1134;
    float _1496 = _1408 * _1462;
    float _1498 = _1132 * _1490;
    float _1500 = fma(_1448, _1492, _1482);
    float _1502 = -_1444;
    float _1504 = fma(_1502, _1492, _1494);
    float _1506 = fma(_1450, _1492, _1488);
    float _1508 = fma(_1478, -0.1500000059604644775390625, 1.0);
    float _1510 = -_1498;
    float _1512 = fma(_1114, _1496, _1510);
    float _1514 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_205));
    float _1516 = _1458 * _1132;
    float _1518 = fma(_1486, _1512, _1500);
    float _1520 = precise::max(_1508, 0.20000000298023223876953125);
    float _1522 = _1040 * _1464;
    float _1524 = _1114 * _1492;
    float _1526 = fma(_1466, _1512, _1504);
    float _1528 = fma(_1476, _1512, _1506);
    float _1530 = _1464 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1532 = _1530 * 0.5;
    float _1534 = _1468 * _1132;
    float _1536 = -_1444;
    float _1538 = fma(_1536, _1496, _1516);
    float _1540 = -_1524;
    float _1542 = fma(_1134, _1490, _1540);
    float _1544 = _1522 * _1514;
    float _1546 = _1472 * _1132;
    float _1548 = fma(_1448, _1496, _1534);
    float _1550 = fma(_1466, _1542, _1538);
    float _1552 = _1544 * _1526;
    float _1554 = fma(_1450, _1496, _1546);
    float _1556 = fma(_1486, _1542, _1548);
    float _1558 = _1544 * _1550;
    float _1560 = fma(_1480, _1518, _1552);
    float _1562 = precise::min(_1520, 1.0);
    float _1564 = fma(_1476, _1542, _1554);
    float _1566 = fma(_1480, _1556, _1558);
    float _1568 = fma(_1532, _1528, _1560);
    float _1570 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1572 = _1134 * _1496;
    float _1574 = fma(_1532, _1564, _1566);
    float _1576 = fma(_1568, _1562, _1032);
    float _1578 = _1472 * _1114;
    float _1580 = -_1572;
    float _1582 = fma(_1132, _1492, _1580);
    float _1584 = fma(_1574, _1562, _1030);
    float _1586 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1576);
    float _1588 = fma(_1450, _1490, _1578);
    float _1590 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1584);
    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1594 = _1586 + _1592;
    float _1596 = _1458 * _1114;
    float _1598 = fma(_1476, _1582, _1588);
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1602 = _1590 + _1600;
    float _1604 = _1594 * _1594;
    float _1606 = -_1444;
    float _1608 = fma(_1606, _1490, _1596);
    float _1610 = _1468 * _1114;
    float _1612 = fma(_1602, _1602, _1604);
    float _1614 = fma(_1466, _1582, _1608);
    float _1616 = fma(_1448, _1490, _1610);
    float _1618 = sqrt(_1612);
    float _1620 = _1544 * _1614;
    float _1622 = fma(_1486, _1582, _1616);
    float _1624 = fma(_1480, _1622, _1620);
    float _1626 = fma(_1532, _1598, _1624);
    float _1628 = fma(_1626, _1562, _1028);
    bool _1630 = _1618 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1632 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1628);
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1640 = _1638 != 0;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1644 = _1642 != 0;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1648 = _1646 != 0;
    bool _1650 = !_1640;
    int _1652 = _1650 ? 0 : 1;
    bool _1654 = !_1636;
    int _1656 = _1654 ? 0 : 1;
    bool _1658 = !_1644;
    int _1660 = _1658 ? 0 : 1;
    bool _1662 = !_1648;
    float _1664 = _1662 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1666 = _1588;
    float _1668 = _1590;
    float _1670 = _1586;
    float _1672 = _1628;
    float _1674 = _1602;
    float _1676 = _1664;
    if (!_1630)
    {
        _1666 = _1632;
    }
    float _1678 = _1666;
    bool _1680 = !_1630;
    float _1682 = _1678;
    if (!_1680)
    {
        float _1684 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1688 = _1618 + _1686;
        float _1690 = _1632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = rsqrt(_1612);
        float _1694 = _1688 * _1684;
        float _1696 = _1694 * 0.15915493667125701904296875;
        float _1698 = _1696 * 6.283185482025146484375;
        float _1700 = cos(_1698);
        float _1702 = _1696 * 6.283185482025146484375;
        float _1704 = sin(_1702);
        float _1706 = _1700 + (-1.0);
        float _1708 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = fma(_1704, _1690, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1712 = fma(_1632, _1700, _1708);
        float _1714 = _1692 * _1710;
        float _1716 = fma(_1602, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = fma(_1594, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1682 = _1712;
        _1668 = _1716;
        _1670 = _1718;
    }
    float _1720 = _1682;
    float _1722 = _1668;
    float _1724 = _1670;
    float _1726 = -_1306;
    float _1728 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1720);
    float _1730 = -_1314;
    float _1732 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1722);
    float _1734 = -_1340;
    float _1736 = fma(_1734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1724);
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1740 = _1728 + _1738;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1744 = _1732 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1748 = _1736 + _1746;
    float _1750 = _1740 * _1740;
    float _1752 = fma(_1744, _1744, _1750);
    float _1754 = fma(_1748, _1748, _1752);
    float _1756 = rsqrt(_1754);
    float _1758 = sqrt(_1754);
    float _1760 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1762 = _1744 * _1760;
    float _1764 = _1748 * _1760;
    float _1766 = _1762 * _1762;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 + _1768;
    float _1772 = sqrt(_1770);
    bool _1774 = _1772 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1776 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = _1772 + _1776;
    float _1780 = _1748;
    float _1782 = _1770;
    float _1784 = _1778;
    float _1786 = _1740;
    float _1788 = _1724;
    if (_1774)
    {
        float _1790 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1780 = _1790;
    }
    float _1792 = _1780;
    if (_1774)
    {
        float _1794 = rsqrt(_1770);
        _1782 = _1794;
    }
    float _1796 = _1782;
    float _1798 = _1796;
    if (_1774)
    {
        float _1800 = _1778 * _1792;
        _1784 = _1800;
    }
    float _1802 = _1784;
    if (_1774)
    {
        float _1804 = _1802 * 0.15915493667125701904296875;
        _1672 = _1804;
    }
    float _1806 = _1672;
    float _1808 = _1792;
    if (_1774)
    {
        float _1810 = _1806 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        _1808 = _1812;
    }
    float _1814 = _1808;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = precise::max(0.0, _1816);
    float _1820 = _1756;
    float _1822 = _1818;
    if (_1774)
    {
        float _1824 = _1806 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = -_1760;
    float _1832 = -_1818;
    float _1834 = fma(_1740, _1830, _1832);
    if (_1774)
    {
        float _1836 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1822 = _1836;
    }
    float _1838 = _1822;
    float _1840 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1842 = _1838;
    float _1844 = _1814;
    if (_1774)
    {
        float _1846 = fma(_1814, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1842 = _1846;
    }
    float _1848 = _1842;
    float _1850 = _1848;
    if (!_1774)
    {
        _1844 = _1762;
    }
    float _1852 = _1844;
    float _1854 = _1852;
    float _1856 = _1828;
    if (_1774)
    {
        float _1858 = _1828 + (-1.0);
        _1786 = _1858;
    }
    float _1860 = _1786;
    float _1862 = _1860;
    if (_1774)
    {
        float _1864 = _1796 * _1848;
        _1788 = _1864;
    }
    float _1866 = _1788;
    if (!_1774)
    {
        _1850 = _1834;
    }
    float _1868 = _1850;
    float _1870 = _1868;
    if (_1774)
    {
        float _1872 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1674 = _1872;
    }
    float _1874 = _1674;
    if (_1774)
    {
        float _1876 = _1762 * _1866;
        _1854 = _1876;
    }
    float _1878 = _1854;
    if (!_1774)
    {
        _1862 = _1764;
    }
    float _1880 = _1862;
    float _1882 = _1880;
    if (_1774)
    {
        float _1884 = _1764 * _1866;
        _1882 = _1884;
    }
    float _1886 = _1882;
    if (!_1774)
    {
        _1798 = _1766;
    }
    float _1888 = _1798;
    float _1890 = _1888;
    if (_1774)
    {
        float _1892 = fma(_1834, _1828, _1874);
        _1870 = _1892;
    }
    float _1894 = _1870;
    if (_1774)
    {
        float _1896 = _1878 * _1878;
        _1890 = _1896;
    }
    float _1898 = _1890;
    if (!_1774)
    {
        _1856 = _1768;
    }
    float _1900 = _1856;
    float _1902 = _1900;
    if (_1774)
    {
        float _1904 = _1886 * _1886;
        _1902 = _1904;
    }
    float _1906 = _1902;
    float _1908 = fma(_1894, _1894, _1898);
    float _1910 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1840);
    float _1912 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1914 = _1908 + _1906;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1918 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1916);
    float _1920 = precise::clamp(_1918, 0.0, 1.0);
    float _1922 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1924 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1926 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1912);
    float _1928 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1910);
    float _1930 = rsqrt(_1914);
    float _1932 = -_1920;
    float _1934 = _1932 + 1.0;
    float _1936 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1924);
    float _1938 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1926);
    float _1940 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = _1728 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1944 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1936);
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1948 = abs(_1934);
    float _1950 = log2(_1948);
    float _1952 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1942);
    float _1954 = _1944 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1958 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1960 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1952);
    float _1962 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1956);
    float _1964 = _1930 * _1878;
    float _1966 = _1930 * _1894;
    float _1968 = _1930 * _1886;
    float _1970 = _1960 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1972 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1974 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1962);
    float _1976 = -_1958;
    float _1978 = fma(_1976, _1922, 1.0);
    float _1980 = -_1972;
    float _1982 = fma(_1966, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1980);
    float _1984 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1986 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1974);
    float _1988 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1990 = -_1968;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1982);
    float _1994 = log2(_1978);
    float _1996 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1998 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1988);
    float _2000 = fma(_1992, -0.5, 0.5);
    float _2002 = fma(_1992, 0.5, 0.5);
    float _2004 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1996);
    float _2006 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1998);
    float _2008 = _1966 + 1.0;
    float _2010 = exp2(_1984);
    float _2012 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2004);
    float _2014 = 1.0 / _1986;
    float _2016 = fma(_2002, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2018 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2012);
    float _2020 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2006);
    float _2022 = _1994 * 0.693147182464599609375;
    float _2024 = fma(_2002, _2016, -0.212114393711090087890625);
    float _2026 = sqrt(_2000);
    float _2028 = -_1966;
    float _2030 = fma(_2010, _2008, _2028);
    float _2032 = fma(_2002, _2024, 1.570728778839111328125);
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2036 = fma(_2030, 0.5, 0.5);
    float _2038 = _2018 * _2014;
    float _2040 = _2020 * _2014;
    float _2042 = fma(_2038, 0.5, 0.5);
    float _2044 = fma(_2040, -0.5, 0.5);
    float _2046 = _2026 * 0.636619746685028076171875;
    float _2048 = -_2032;
    float _2050 = fma(_2046, _2048, 1.0);
    float3 _6164 = float3(_2042, _2044, _2034);
    float _2052 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6164, float3(0.0), isnan(_6164)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6164, float3(0.0), isnan(_6164)), level(0.0)).x;
    float3 _6175 = float3(_2042, _2044, _2034);
    float4 _2055 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6175, float3(0.0), isnan(_6175)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6175, float3(0.0), isnan(_6175)), level(0.0)).xyzw;
    float _2057 = _2055.x;
    float _2059 = _2055.y;
    float _2061 = _2055.z;
    float _2063 = _2055.w;
    float2 _6192 = float2(_2050, _2036);
    float3 _2067 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6192, float2(0.0), isnan(_6192)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6192, float2(0.0), isnan(_6192)), level(0.0)).xyz;
    float _2069 = _2067.x;
    float _2071 = _2067.y;
    float _2073 = _2067.z;
    float _2075 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2077 = int(_2075);
    out.m_60.x = _954;
    out.m_60.y = _956;
    out.m_60.z = _946;
    out.m_60.w = _948;
    bool _2079 = _619 > 0.5;
    float _2081 = -_1306;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1028);
    bool _2085 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.5);
    bool _2093 = _2089 || _2091;
    float _2095 = -_1314;
    float _2097 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _2099 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2101 = int(_2099);
    bool _2103 = _1000 > 0.5;
    float _2105 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2107 = -_1340;
    float _2109 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _2111 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2105);
    float _2113 = 1.0 / _988;
    float _2115 = float(_2077);
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2119 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2123 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2125 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_62.x = _1732;
    out.m_62.y = _1728;
    out.m_62.z = _1736;
    float _2127 = 1.0 / _2115;
    float _2129 = float(uint(_2101));
    float _2131 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2125);
    int _2133 = ~_2101;
    int _2135 = _2133 + 1;
    out.m_64.y = _1522;
    int _2137 = ~_2101;
    int _2139 = _2137 + 1;
    float _2141 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2131);
    int _2143 = ~_2101;
    int _2145 = _2143 + 1;
    float _2147 = 1.0 / _2129;
    float _2149 = _129 * _2127;
    float _2151 = in.m_56.w;
    float _2153 = exp2(_2123);
    int _2155 = as_type<int>(_2147) + (-2);
    float _2157 = trunc(_2149);
    int _2159 = int(_2157);
    float _2161 = -_2153;
    float _2163 = _2161 + 1.0;
    float _2165 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2167 = _2151 > 0.5;
    float _2169 = -_2165;
    float _2171 = _2169 + 1.0;
    float _2173 = float(uint(_2159));
    float _2175 = as_type<float>(_2155) * _2173;
    float _2177 = trunc(_2175);
    float _2179 = precise::max(_2177, 0.0);
    uint _2181 = uint(_2179);
    int _2183 = _2135 * int(_2181);
    int _2185 = _2183 + _2159;
    float _2187 = float(uint(_2185));
    float _2189 = as_type<float>(_2155) * _2187;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2193 = _2191 != 0;
    bool _2195 = !_2193;
    float _2197 = _2195 ? _1000 : _619;
    float _2199 = trunc(_2189);
    float _2201 = precise::max(_2199, 0.0);
    uint _2203 = uint(_2201);
    bool _2205 = !_2193;
    float _2207 = _2205 ? 1.2345600128173828125 : 1.0;
    float _2209 = _2207 * _2197;
    float _2211 = float(_2159);
    int _2213 = int(_2181) + int(_2203);
    float _2215 = float(_2101);
    float _2217 = floor(_2209);
    int _2219 = _2139 * _2213;
    int _2221 = _2219 + _2159;
    bool _2223 = _2211 >= _2215;
    bool _2225 = isnan(_2211);
    bool _2227 = _2223 || _2225;
    bool _2229 = isnan(_2215);
    bool _2231 = _2227 || _2229;
    float _2233 = float(_2231);
    float _2235 = _129 * _2215;
    bool _2237 = uint(_2221) >= uint(_2101);
    float _2239 = _2235 * _2113;
    float _2241 = trunc(_2233);
    int _2243 = int(_2241);
    bool _2245 = !_2237;
    int _2247 = _2245 ? 0 : (-1);
    bool _2249 = _2101 == 0;
    int _2251 = ~_2213;
    int _2253 = _2251 + _2247;
    int _2255 = _2253 + 1;
    float _2257 = -_2217;
    float _2259 = _2209 + _2257;
    float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2265 = _2101 + (-1);
    float _2267 = trunc(_2239);
    int _2269 = int(_2267);
    int _2271 = _2101 * _2255;
    int _2273 = _2271 + _2159;
    float _2275 = _2259 * _2215;
    float _2277 = _619 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2279 = ~_2243;
    int _2281 = _2279 + 1;
    int _2283 = _2281 + 1;
    bool _2285 = !_2249;
    int _2287 = _2285 ? _2273 : (-1);
    float _2289 = trunc(_2275);
    int _2291 = int(_2289);
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2295 = _2293 != 0;
    int _2297 = _2287 * _2283;
    int _2299 = abs(_1656);
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2303 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2305 = _990 + _2303;
    int _2307 = _2243 * _2265;
    int _2309 = _2307 + _2297;
    float _2311 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2313 = _2311 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2315 = 1.0 / _2263;
    int _2317 = abs(_1652);
    float _2319 = -_2301;
    float _2321 = fma(_2277, 2.0, _2319);
    bool _2323 = !_2295;
    int _2325 = _2323 ? 0 : 1;
    int _2327 = _2309 * _2317;
    int _2329 = abs(_2325);
    float _2331 = 1.0 / _2313;
    float _2333 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2335 = _2269 * _2299;
    int _2337 = _2335 + _2327;
    int _2339 = abs(_1660);
    float _2341 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2341;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2349 = _2347 != 0;
    float _2351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2355 = _2353 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2357 = fma(_2333, -2.0, _2345);
    int _2359 = _2291 * _2329;
    int _2361 = _2359 + _2159;
    float _2363 = _2343 * _2315;
    int _2365 = abs(as_type<int>(_1664));
    float _2367 = _2355 * _2331;
    int _2369 = _2361 * _2339;
    int _2371 = _2369 + _2337;
    float _2373 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2375 = -_129;
    float _2377 = fma(_2375, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2321);
    float _2379 = as_type<float>(_2365);
    if (!_2193)
    {
        _1676 = _1000;
    }
    float _2381 = _1676;
    float _2383 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2373);
    float _2385 = _2381;
    if (_2193)
    {
        _2385 = _619;
    }
    float _2387 = _2385;
    int _2389 = _2291 * _2365;
    int _2391 = _2389 + _2371;
    float _2393 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2395 = -_209;
    int _2397 = _2079 ? as_type<int>(_2395) : as_type<int>(_209);
    float _2399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2401 = float(uint(_2391));
    float _2403 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2405 = !_2349;
    float _2407 = _2405 ? _209 : as_type<float>(_2397);
    float _2409 = _2387 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2411 = _2403;
    if (!_2193)
    {
        _2379 = _992;
    }
    float _2413 = _2379;
    float _2415 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2403);
    float _2417 = _2413;
    if (!_2193)
    {
        _2411 = _992;
    }
    float _2419 = _2411;
    float _2421 = as_type<float>(_2155) * _2401;
    bool _2423 = _992 > 0.5;
    float _2425 = _2407 + 0.5;
    float _2427 = _2419;
    if (_2193)
    {
        _2417 = _1000;
    }
    float _2429 = _2417;
    float _2431 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2383);
    if (_2193)
    {
        _2427 = _1000;
    }
    float _2433 = _2427;
    float _2435 = fma(_2393, _2425, _2377);
    bool _2437 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2439 = isnan(_990);
    bool _2441 = _2437 || _2439;
    bool _2443 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2445 = _2441 || _2443;
    float _2447 = float(_2445);
    float _2449 = trunc(_2421);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    bool _2455 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2457 = isnan(_990);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2463 = _2459 || _2461;
    float _2465 = float(_2463);
    float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2469 = _990 + _2467;
    bool _2471 = _990 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2473 = isnan(_990);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = -_2447;
    float _2485 = _2483 + 1.0;
    int _2487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2489 = _2487 != 0;
    float _2491 = -_2465;
    float _2493 = _2491 + 1.0;
    float _2495 = _2399 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2497 = _2465 * _2485;
    float _2499 = fma(_2363, _2305, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2501 = _2481 * _2493;
    float _2503 = fma(_2367, _2469, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2505 = ~_2101;
    int _2507 = _2505 + 1;
    float _2509 = fma(_2433, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2117);
    float _2511 = _2499 * _2501;
    float _2513 = float(uint(_2361));
    float _2515 = _2429 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2517 = ~_2101;
    int _2519 = _2517 + 1;
    float _2521 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2415);
    float _2523 = as_type<float>(_2155) * _2513;
    int _2525 = _2507 * int(_2453);
    int _2527 = _2525 + _2391;
    float _2529 = fma(_2515, -2.0, _2121);
    float _2531 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2509);
    float _2533 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2535 = -_2481;
    float _2537 = _2535 + 1.0;
    float _2539 = trunc(_2523);
    float _2541 = precise::max(_2539, 0.0);
    uint _2543 = uint(_2541);
    float _2545 = float(uint(_2527));
    float _2547 = -_2533;
    float _2549 = fma(_2409, 2.0, _2547);
    float _2551 = -as_type<float>(_205);
    int _2553 = _2103 ? as_type<int>(_2551) : _205;
    float _2555 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2529);
    float _2557 = fma(_2537, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2511);
    float _2559 = as_type<float>(_2155) * _2545;
    bool _2561 = !_2489;
    float _2563 = _2561 ? as_type<float>(_205) : as_type<float>(_2553);
    float _2565 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2357);
    float _2567 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2119);
    float _2569 = -_129;
    float _2571 = fma(_2569, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2549);
    int _2573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2575 = _2573 != 0;
    float _2577 = trunc(_2559);
    float _2579 = precise::max(_2577, 0.0);
    uint _2581 = uint(_2579);
    float _2583 = _2563 + (-0.5);
    float _2585 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2567);
    float _2587 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2589 = _2519 * int(_2543);
    int _2591 = _2589 + _2361;
    float _2593 = -_2495;
    float _2595 = -_2565;
    float _2597 = fma(_2593, _2583, _2595);
    float _2599 = fma(_2503, _2497, _2557);
    float _2601 = fma(_2097, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2587);
    float _2603 = -_2431;
    float _2605 = _2603 + 1.0;
    float _2607 = float(uint(_2591));
    float _2609 = -_2521;
    float _2611 = _2609 + 1.0;
    float _2613 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2601);
    float _2615 = -_2605;
    float _2617 = fma(_2407, _2615, _2435);
    float _2619 = -_2531;
    float _2621 = _2619 + 1.0;
    float _2623 = as_type<float>(_2155) * _2607;
    float _2625 = fma(_2109, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2111);
    int _2627 = int(_2453) + int(_2581);
    float _2629 = trunc(_2623);
    float _2631 = precise::max(_2629, 0.0);
    uint _2633 = uint(_2631);
    float _2635 = -_209;
    int _2637 = _2423 ? as_type<int>(_2635) : as_type<int>(_209);
    float _2639 = _2625 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2641 = _2613 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2643 = _2145 * _2627;
    int _2645 = _2643 + _2391;
    bool _2647 = !_2575;
    float _2649 = _2647 ? _209 : as_type<float>(_2637);
    float _2651 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2599);
    int _2653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2655 = _2653 != 0;
    float _2657 = 1.0 / _2639;
    bool _2659 = uint(_2645) >= uint(_2101);
    float _2661 = _2649 + 0.5;
    float _2663 = -as_type<float>(_205);
    int _2665 = _2167 ? as_type<int>(_2663) : _205;
    float _2667 = _2651 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2669 = !_2659;
    int _2671 = _2669 ? 0 : (-1);
    float _2673 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2571);
    bool _2675 = !_2655;
    float _2677 = _2675 ? as_type<float>(_205) : as_type<float>(_2665);
    float _2679 = as_type<float>(_205) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2681 = ~_2627;
    int _2683 = _2681 + _2671;
    int _2685 = _2683 + 1;
    float _2687 = _2641 + _2639;
    int _2689 = int(_2543) + int(_2633);
    float _2691 = _1550 * _2679;
    float _2693 = as_type<float>(_2633);
    float _2695 = _2503;
    float _2697 = _2617;
    if (!_2093)
    {
        _2693 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2699 = _2693;
    int _2701 = _2101 * _2685;
    int _2703 = _2701 + _2391;
    float _2705 = _2677 + (-0.5);
    float _2707 = _2687 * _2657;
    float _2709 = _2707 * 0.5;
    int _2711 = ~_2101;
    int _2713 = _2711 + 1;
    float _2715 = _1614 * _2679;
    bool _2717 = !_2249;
    int _2719 = _2717 ? _2703 : (-1);
    float _2721 = -_2705;
    float _2723 = -_2555;
    float _2725 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2723);
    float _2727 = as_type<float>(_2703);
    float _2729 = _2709;
    if (!_2093)
    {
        float _2731 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2733 = fma(_2709, _2699, _2731);
        _2727 = _2733;
    }
    float _2735 = _2727;
    int _2737 = _2713 * _2689;
    int _2739 = _2737 + _2361;
    int _2741 = _2719 >> 31;
    float _2743 = _1526 * _2679;
    if (!_2093)
    {
        _2729 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2745 = _2729;
    float _2747 = _2165 * _2052;
    int _2749 = _2741 & 3;
    float _2751 = _2735;
    if (!_2093)
    {
        float _2753 = 1.0 / _2735;
        _2751 = _2753;
    }
    float _2755 = _2751;
    float _2757 = -_2585;
    float _2759 = _2757 + 1.0;
    bool _2761 = uint(_2739) >= uint(_2101);
    if (!_2093)
    {
        float _2763 = -_2745;
        float _2765 = _2763 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2695 = _2765;
    }
    float _2767 = _2695;
    int _2769 = _2719 + _2749;
    float _2771 = -_2759;
    float _2773 = fma(_2649, _2771, _2673);
    int _2775 = _2719 & 3;
    bool _2777 = _2775 != 0;
    out.m_66.w = _2667;
    int _2779 = _2769 >> 2;
    float _2781 = _2435;
    if (!_2093)
    {
        float _2783 = 1.0 / _2767;
        _2781 = _2783;
    }
    float _2785 = _2781;
    int _2787 = _2719 & 3;
    bool _2789 = _2787 != 0;
    int _2791 = _2779 << 4;
    int _2793 = _2791 + 512;
    float _2795 = fma(_2563, _2611, _2597);
    float _2797 = fma(_2677, _2621, _2725);
    bool _2799 = uint(_2787) > 1u;
    uint _2801 = uint(int(uint(_2793) >> uint(2)));
    uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
    int _2805 = int(_2801) & 3;
    float _2807 = (*spvDescriptorSet0.vp_c9)._m0[int(_2803)][_2805];
    int _2809 = int(_2801) + 1;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    int _2813 = _2809 & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    float _2817 = _2755;
    if (!_2093)
    {
        float _2819 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2821 = -_2745;
        float _2823 = fma(_2755, _2819, _2821);
        _2817 = _2823;
    }
    float _2825 = _2817;
    bool _2827 = !_2761;
    int _2829 = _2827 ? 0 : (-1);
    out.m_68.x = _2617;
    out.m_68.y = _2795;
    out.m_68.z = _2773;
    out.m_68.w = _2797;
    int _2831 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2833 = _2831 != 0;
    int _2835 = ~_2689;
    int _2837 = _2835 + _2829;
    int _2839 = _2837 + 1;
    int _2841 = _2793 + 8;
    uint _2843 = uint(int(uint(_2841) >> uint(2)));
    uint _2845 = uint(int(uint(int(_2843)) >> uint(2)));
    int _2847 = int(_2843) & 3;
    float _2849 = (*spvDescriptorSet0.vp_c9)._m0[int(_2845)][_2847];
    int _2851 = int(_2843) + 1;
    uint _2853 = uint(int(uint(_2851) >> uint(2)));
    int _2855 = _2851 & 3;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[int(_2853)][_2855];
    float _2859 = _2825;
    if (!_2093)
    {
        float _2861 = _2825 * _2785;
        float _2863 = precise::clamp(_2861, 0.0, 1.0);
        _2859 = _2863;
    }
    float _2865 = _2859;
    int _2867 = _2101 * _2839;
    int _2869 = _2867 + _2361;
    bool _2871 = !_2249;
    int _2873 = _2871 ? _2869 : (-1);
    float _2875 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2877 = _2777 ? 0 : 1;
    bool _2879 = _2787 != 3;
    float _2881 = fma(_1556, _2875, _2691);
    int _2883 = ~_2877;
    int _2885 = _2883 + 1;
    int _2887 = _2885 + 1;
    float _2889 = fma(_1622, _2875, _2715);
    int _2891 = _2887;
    if (_2093)
    {
        _2697 = 1.0;
    }
    float _2893 = _2697;
    float _2895 = _2893;
    if (!_2093)
    {
        float _2897 = -_2865;
        float _2899 = _2897 + 1.0;
        _2895 = _2899;
    }
    float _2901 = _2895;
    if (!_2799)
    {
        int _2903 = ~_2877;
        int _2905 = _2903 + 1;
        _2891 = _2905;
    }
    int _2907 = _2891;
    float _2909 = fma(_1518, _2875, _2743);
    bool _2911 = uint(_2787) >= 2u;
    float _2913 = _2073 * _2747;
    bool _2915 = !_2789;
    int _2917 = _2915 ? 0 : 1;
    float _2919 = _1598 + _2889;
    int _2921 = abs(_2907);
    float _2923 = _1564 + _2881;
    int _2925 = _2911 ? 0 : 1;
    float _2927 = _1528 + _2909;
    int _2929 = abs(_2917);
    int _2931 = ~_2925;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    out.m_70.x = _2923;
    out.m_70.y = _2919;
    out.m_70.z = _2927;
    int _2937 = _2935;
    if (_2879)
    {
        int _2939 = ~_2925;
        int _2941 = _2939 + 1;
        _2937 = _2941;
    }
    int _2943 = _2937;
    bool _2945 = _2787 != 3;
    int _2947 = ~_2921;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    int _2953 = abs(_2943);
    bool _2955 = !_2945;
    int _2957 = _2955 ? 0 : (-1);
    int _2959 = _2951 * as_type<int>(_2815);
    int _2961 = ~_2929;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    bool _2967 = !_2833;
    int _2969 = _2967 ? 0 : 1;
    int _2971 = abs(_2957);
    int _2973 = _2965 * as_type<int>(_2807);
    int _2975 = _2973 + _2959;
    int _2977 = ~_2953;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    int _2983 = abs(_2969);
    int _2985 = ~_2971;
    int _2987 = _2985 + 1;
    int _2989 = _2987 + 1;
    int _2991 = _2981 * as_type<int>(_2849);
    int _2993 = _2991 + _2975;
    float _2995 = fma(_1970, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2141);
    float _2997 = _2901 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2999 = _2989 * as_type<int>(_2857);
    int _3001 = _2999 + _2993;
    int _3003 = ~_2983;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    float _3009 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3011 = _2995 + _3009;
    float _3013 = _707 * _2997;
    bool _3015 = _2901 > 0.0;
    bool _3017 = isnan(_2901);
    bool _3019 = _3015 || _3017;
    bool _3021 = isnan(0.0);
    bool _3023 = _3019 || _3021;
    int _3025 = _3001 * _3007;
    float _3027 = _1986 + _3011;
    int _3029 = _2873 * _2983;
    int _3031 = _3029 + _3025;
    float _3033 = _2063 * _2747;
    float _3035 = _3027 * 0.5;
    out.gl_Position.x = _2018;
    out.gl_Position.y = _2020;
    out.gl_Position.z = _3011;
    out.gl_Position.w = _1986;
    float _3037 = float(_3031);
    float _3039 = _3013 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3041 = fma(_2069, _3033, _2057);
    float _3043 = fma(_2071, _3033, _2059);
    float _3045 = _2063 * _2171;
    float _3047 = fma(_2063, _2913, _2061);
    out.m_72.z = _3035;
    out.m_72.w = _1986;
    out.m_74.y = _3037;
    out.m_45.x = _3039;
    out.m_76.x = _3041;
    out.m_76.y = _3043;
    out.m_76.z = _3047;
    out.m_76.w = _3045;
    if (_3023)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3049 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3049;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

