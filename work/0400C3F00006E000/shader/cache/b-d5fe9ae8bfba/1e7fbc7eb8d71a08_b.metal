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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _447 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_447, float2(0.0), isnan(_447))).x;
    float _61 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[64].z;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[64].y, 1.0);
    int _68 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[64].x) << 4;
    int _70 = _68 + (-16);
    uint _73 = uint(int(uint(_70) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.fp_c3)._m0[int(_75)][_77];
    float _81 = -_59;
    float _83 = fma(_81, _65, 1.0);
    float _85 = 1.0 / _83;
    float _87 = _85 * (*spvDescriptorSet0.fp_c3)._m0[64].y;
    bool _91 = _87 >= _79;
    int _93 = as_type<int>(_59);
    int _95 = as_type<int>(_57);
    if (!_91)
    {
        int _97 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[64].x) + (-1);
        bool _99 = _97 > 0;
        bool _101 = !_99;
        float _103 = (*spvDescriptorSet0.fp_c3)._m0[32].z;
        int _105 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].w);
        int _107 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].y);
        int _109 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].x);
        int _111 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].x);
        int _113 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].y);
        int _115 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].z);
        int _117 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].w);
        if (!_101)
        {
            int _119 = 0;
            int _121 = 0;
            int _123 = 0;
            int _125 = 0;
            int _127 = 0;
            int _129 = 0;
            int _131 = 0;
            bool _133;
            do
            {
                int _135 = _119;
                int _137 = _93;
                float _139 = _103;
                int _141 = _105;
                int _143 = _107;
                int _145 = _121;
                int _147 = _123;
                int _149 = _125;
                int _151 = _127;
                int _153 = _129;
                int _155 = _131;
                int _157 = _95;
                int _159 = _109;
                int _161 = _135 << 4;
                int _163 = _135 + 1;
                uint _165 = uint(int(uint(_161) >> uint(2)));
                uint _167 = uint(int(uint(int(_165)) >> uint(2)));
                int _169 = int(_165) & 3;
                float _171 = (*spvDescriptorSet0.fp_c3)._m0[int(_167)][_169];
                bool _173 = _163 >= _97;
                bool _175 = _87 > _171;
                _119 = _163;
                int _177 = _137;
                int _179 = _157;
                int _181 = _143;
                int _183 = _145;
                int _185 = _147;
                int _187 = _149;
                int _189 = _151;
                int _191 = _153;
                int _193 = _155;
                int _195 = _159;
                if (_175)
                {
                    int _197 = _161 + 16;
                    uint _199 = uint(int(uint(_197) >> uint(2)));
                    uint _201 = uint(int(uint(int(_199)) >> uint(2)));
                    int _203 = int(_199) & 3;
                    float _205 = (*spvDescriptorSet0.fp_c3)._m0[int(_201)][_203];
                    _177 = as_type<int>(_205);
                }
                int _207 = _177;
                bool _209 = _87 < as_type<float>(_207);
                bool _211 = _209 && _175;
                float _213 = as_type<float>(_207);
                if (!_211)
                {
                    _213 = _139;
                }
                int _215 = as_type<int>(_213);
                int _217 = _215;
                float _219 = as_type<float>(_215);
                if (!_211)
                {
                    _179 = _141;
                }
                int _221 = _179;
                bool _223 = !_211;
                int _225 = _221;
                int _227 = _221;
                if (!_223)
                {
                    int _229 = _161 + 16;
                    uint _231 = uint(int(uint(_229) >> uint(2)));
                    uint _233 = uint(int(uint(int(_231)) >> uint(2)));
                    int _235 = int(_231) & 3;
                    float _237 = (*spvDescriptorSet0.fp_c3)._m0[int(_233)][_235];
                    int _239 = _161 + 512;
                    uint _241 = uint(int(uint(_239) >> uint(2)));
                    uint _243 = uint(int(uint(int(_241)) >> uint(2)));
                    int _245 = int(_241) & 3;
                    float _247 = (*spvDescriptorSet0.fp_c3)._m0[int(_243)][_245];
                    int _249 = int(_241) + 1;
                    uint _251 = uint(int(uint(_249) >> uint(2)));
                    int _253 = _249 & 3;
                    float _255 = (*spvDescriptorSet0.fp_c3)._m0[int(_251)][_253];
                    int _257 = _161 + 528;
                    uint _259 = uint(int(uint(_257) >> uint(2)));
                    uint _261 = uint(int(uint(int(_259)) >> uint(2)));
                    int _263 = int(_259) & 3;
                    float _265 = (*spvDescriptorSet0.fp_c3)._m0[int(_261)][_263];
                    int _267 = int(_259) + 1;
                    uint _269 = uint(int(uint(_267) >> uint(2)));
                    int _271 = _267 & 3;
                    float _273 = (*spvDescriptorSet0.fp_c3)._m0[int(_269)][_271];
                    int _275 = _161 + 520;
                    uint _277 = uint(int(uint(_275) >> uint(2)));
                    uint _279 = uint(int(uint(int(_277)) >> uint(2)));
                    int _281 = int(_277) & 3;
                    float _283 = (*spvDescriptorSet0.fp_c3)._m0[int(_279)][_281];
                    int _285 = int(_277) + 1;
                    uint _287 = uint(int(uint(_285) >> uint(2)));
                    int _289 = _285 & 3;
                    float _291 = (*spvDescriptorSet0.fp_c3)._m0[int(_287)][_289];
                    float _293 = -_171;
                    float _295 = _293 + _237;
                    float _297 = -_87;
                    float _299 = _297 + _237;
                    float _301 = 1.0 / _295;
                    int _303 = _161 + 536;
                    uint _305 = uint(int(uint(_303) >> uint(2)));
                    uint _307 = uint(int(uint(int(_305)) >> uint(2)));
                    int _309 = int(_305) & 3;
                    float _311 = (*spvDescriptorSet0.fp_c3)._m0[int(_307)][_309];
                    int _313 = int(_305) + 1;
                    uint _315 = uint(int(uint(_313) >> uint(2)));
                    int _317 = _313 & 3;
                    float _319 = (*spvDescriptorSet0.fp_c3)._m0[int(_315)][_317];
                    float _321 = -_265;
                    float _323 = _247 + _321;
                    float _325 = _299 * _301;
                    float _327 = -_273;
                    float _329 = _255 + _327;
                    float _331 = fma(_325, _323, _265);
                    float _333 = fma(_325, _329, _273);
                    float _335 = -_311;
                    float _337 = _283 + _335;
                    float _339 = -_319;
                    float _341 = _291 + _339;
                    float _343 = fma(_325, _337, _311);
                    float _345 = fma(_325, _341, _319);
                    _217 = as_type<int>(_343);
                    _181 = as_type<int>(_333);
                    _183 = as_type<int>(_247);
                    _185 = as_type<int>(_337);
                    _187 = as_type<int>(_265);
                    _189 = as_type<int>(_273);
                    _191 = as_type<int>(_283);
                    _193 = as_type<int>(_291);
                    _225 = as_type<int>(_345);
                    _219 = _343;
                    _227 = as_type<int>(_345);
                    _195 = as_type<int>(_331);
                }
                int _347 = _217;
                int _349 = _181;
                int _351 = _183;
                int _353 = _185;
                int _355 = _187;
                int _357 = _189;
                int _359 = _191;
                int _361 = _193;
                int _363 = _225;
                float _365 = _219;
                int _367 = _227;
                int _369 = _195;
                _133 = !_173;
                _93 = _347;
                _103 = _365;
                _105 = _367;
                _107 = _349;
                _121 = _351;
                _123 = _353;
                _125 = _355;
                _127 = _357;
                _129 = _359;
                _131 = _361;
                _95 = _363;
                _109 = _369;
                _111 = _369;
                _113 = _349;
                _115 = as_type<int>(_365);
                _117 = _367;
            } while (_133);
        }
        int _371 = _111;
        int _373 = _113;
        int _375 = _115;
        int _377 = _117;
        out.m_32.x = as_type<float>(_371);
        out.m_32.y = as_type<float>(_373);
        out.m_32.z = as_type<float>(_375);
        out.m_32.w = as_type<float>(_377);
        return out;
    }
    int _379 = _68 + 496;
    uint _381 = uint(int(uint(_379) >> uint(2)));
    uint _383 = uint(int(uint(int(_381)) >> uint(2)));
    int _385 = int(_381) & 3;
    float _387 = (*spvDescriptorSet0.fp_c3)._m0[int(_383)][_385];
    int _389 = int(_381) + 1;
    uint _391 = uint(int(uint(_389) >> uint(2)));
    int _393 = _389 & 3;
    float _395 = (*spvDescriptorSet0.fp_c3)._m0[int(_391)][_393];
    int _397 = _68 + 504;
    uint _399 = uint(int(uint(_397) >> uint(2)));
    uint _401 = uint(int(uint(int(_399)) >> uint(2)));
    int _403 = int(_399) & 3;
    float _405 = (*spvDescriptorSet0.fp_c3)._m0[int(_401)][_403];
    int _407 = int(_399) + 1;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    int _411 = _407 & 3;
    float _413 = (*spvDescriptorSet0.fp_c3)._m0[int(_409)][_411];
    out.m_32.x = _387;
    out.m_32.y = _395;
    out.m_32.z = _405;
    out.m_32.w = _413;
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _447 = float2(_55, _57);
    float _59 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_447, float2(0.0), isnan(_447))).x;
    float _61 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[64].z;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[64].y, 1.0);
    int _68 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[64].x) << 4;
    int _70 = _68 + (-16);
    uint _73 = uint(int(uint(_70) >> uint(2)));
    uint _75 = uint(int(uint(int(_73)) >> uint(2)));
    int _77 = int(_73) & 3;
    float _79 = (*spvDescriptorSet0.fp_c3)._m0[int(_75)][_77];
    float _81 = -_59;
    float _83 = fma(_81, _65, 1.0);
    float _85 = 1.0 / _83;
    float _87 = _85 * (*spvDescriptorSet0.fp_c3)._m0[64].y;
    bool _91 = _87 >= _79;
    int _93 = as_type<int>(_59);
    int _95 = as_type<int>(_57);
    if (!_91)
    {
        int _97 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[64].x) + (-1);
        bool _99 = _97 > 0;
        bool _101 = !_99;
        float _103 = (*spvDescriptorSet0.fp_c3)._m0[32].z;
        int _105 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].w);
        int _107 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].y);
        int _109 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].x);
        int _111 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].x);
        int _113 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].y);
        int _115 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].z);
        int _117 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[32].w);
        if (!_101)
        {
            int _119 = 0;
            int _121 = 0;
            int _123 = 0;
            int _125 = 0;
            int _127 = 0;
            int _129 = 0;
            int _131 = 0;
            bool _133;
            do
            {
                int _135 = _119;
                int _137 = _93;
                float _139 = _103;
                int _141 = _105;
                int _143 = _107;
                int _145 = _121;
                int _147 = _123;
                int _149 = _125;
                int _151 = _127;
                int _153 = _129;
                int _155 = _131;
                int _157 = _95;
                int _159 = _109;
                int _161 = _135 << 4;
                int _163 = _135 + 1;
                uint _165 = uint(int(uint(_161) >> uint(2)));
                uint _167 = uint(int(uint(int(_165)) >> uint(2)));
                int _169 = int(_165) & 3;
                float _171 = (*spvDescriptorSet0.fp_c3)._m0[int(_167)][_169];
                bool _173 = _163 >= _97;
                bool _175 = _87 > _171;
                _119 = _163;
                int _177 = _137;
                int _179 = _157;
                int _181 = _143;
                int _183 = _145;
                int _185 = _147;
                int _187 = _149;
                int _189 = _151;
                int _191 = _153;
                int _193 = _155;
                int _195 = _159;
                if (_175)
                {
                    int _197 = _161 + 16;
                    uint _199 = uint(int(uint(_197) >> uint(2)));
                    uint _201 = uint(int(uint(int(_199)) >> uint(2)));
                    int _203 = int(_199) & 3;
                    float _205 = (*spvDescriptorSet0.fp_c3)._m0[int(_201)][_203];
                    _177 = as_type<int>(_205);
                }
                int _207 = _177;
                bool _209 = _87 < as_type<float>(_207);
                bool _211 = _209 && _175;
                float _213 = as_type<float>(_207);
                if (!_211)
                {
                    _213 = _139;
                }
                int _215 = as_type<int>(_213);
                int _217 = _215;
                float _219 = as_type<float>(_215);
                if (!_211)
                {
                    _179 = _141;
                }
                int _221 = _179;
                bool _223 = !_211;
                int _225 = _221;
                int _227 = _221;
                if (!_223)
                {
                    int _229 = _161 + 16;
                    uint _231 = uint(int(uint(_229) >> uint(2)));
                    uint _233 = uint(int(uint(int(_231)) >> uint(2)));
                    int _235 = int(_231) & 3;
                    float _237 = (*spvDescriptorSet0.fp_c3)._m0[int(_233)][_235];
                    int _239 = _161 + 512;
                    uint _241 = uint(int(uint(_239) >> uint(2)));
                    uint _243 = uint(int(uint(int(_241)) >> uint(2)));
                    int _245 = int(_241) & 3;
                    float _247 = (*spvDescriptorSet0.fp_c3)._m0[int(_243)][_245];
                    int _249 = int(_241) + 1;
                    uint _251 = uint(int(uint(_249) >> uint(2)));
                    int _253 = _249 & 3;
                    float _255 = (*spvDescriptorSet0.fp_c3)._m0[int(_251)][_253];
                    int _257 = _161 + 528;
                    uint _259 = uint(int(uint(_257) >> uint(2)));
                    uint _261 = uint(int(uint(int(_259)) >> uint(2)));
                    int _263 = int(_259) & 3;
                    float _265 = (*spvDescriptorSet0.fp_c3)._m0[int(_261)][_263];
                    int _267 = int(_259) + 1;
                    uint _269 = uint(int(uint(_267) >> uint(2)));
                    int _271 = _267 & 3;
                    float _273 = (*spvDescriptorSet0.fp_c3)._m0[int(_269)][_271];
                    int _275 = _161 + 520;
                    uint _277 = uint(int(uint(_275) >> uint(2)));
                    uint _279 = uint(int(uint(int(_277)) >> uint(2)));
                    int _281 = int(_277) & 3;
                    float _283 = (*spvDescriptorSet0.fp_c3)._m0[int(_279)][_281];
                    int _285 = int(_277) + 1;
                    uint _287 = uint(int(uint(_285) >> uint(2)));
                    int _289 = _285 & 3;
                    float _291 = (*spvDescriptorSet0.fp_c3)._m0[int(_287)][_289];
                    float _293 = -_171;
                    float _295 = _293 + _237;
                    float _297 = -_87;
                    float _299 = _297 + _237;
                    float _301 = 1.0 / _295;
                    int _303 = _161 + 536;
                    uint _305 = uint(int(uint(_303) >> uint(2)));
                    uint _307 = uint(int(uint(int(_305)) >> uint(2)));
                    int _309 = int(_305) & 3;
                    float _311 = (*spvDescriptorSet0.fp_c3)._m0[int(_307)][_309];
                    int _313 = int(_305) + 1;
                    uint _315 = uint(int(uint(_313) >> uint(2)));
                    int _317 = _313 & 3;
                    float _319 = (*spvDescriptorSet0.fp_c3)._m0[int(_315)][_317];
                    float _321 = -_265;
                    float _323 = _247 + _321;
                    float _325 = _299 * _301;
                    float _327 = -_273;
                    float _329 = _255 + _327;
                    float _331 = fma(_325, _323, _265);
                    float _333 = fma(_325, _329, _273);
                    float _335 = -_311;
                    float _337 = _283 + _335;
                    float _339 = -_319;
                    float _341 = _291 + _339;
                    float _343 = fma(_325, _337, _311);
                    float _345 = fma(_325, _341, _319);
                    _217 = as_type<int>(_343);
                    _181 = as_type<int>(_333);
                    _183 = as_type<int>(_247);
                    _185 = as_type<int>(_337);
                    _187 = as_type<int>(_265);
                    _189 = as_type<int>(_273);
                    _191 = as_type<int>(_283);
                    _193 = as_type<int>(_291);
                    _225 = as_type<int>(_345);
                    _219 = _343;
                    _227 = as_type<int>(_345);
                    _195 = as_type<int>(_331);
                }
                int _347 = _217;
                int _349 = _181;
                int _351 = _183;
                int _353 = _185;
                int _355 = _187;
                int _357 = _189;
                int _359 = _191;
                int _361 = _193;
                int _363 = _225;
                float _365 = _219;
                int _367 = _227;
                int _369 = _195;
                _133 = !_173;
                _93 = _347;
                _103 = _365;
                _105 = _367;
                _107 = _349;
                _121 = _351;
                _123 = _353;
                _125 = _355;
                _127 = _357;
                _129 = _359;
                _131 = _361;
                _95 = _363;
                _109 = _369;
                _111 = _369;
                _113 = _349;
                _115 = as_type<int>(_365);
                _117 = _367;
            } while (_133);
        }
        int _371 = _111;
        int _373 = _113;
        int _375 = _115;
        int _377 = _117;
        out.m_32.x = as_type<float>(_371);
        out.m_32.y = as_type<float>(_373);
        out.m_32.z = as_type<float>(_375);
        out.m_32.w = as_type<float>(_377);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    int _379 = _68 + 496;
    uint _381 = uint(int(uint(_379) >> uint(2)));
    uint _383 = uint(int(uint(int(_381)) >> uint(2)));
    int _385 = int(_381) & 3;
    float _387 = (*spvDescriptorSet0.fp_c3)._m0[int(_383)][_385];
    int _389 = int(_381) + 1;
    uint _391 = uint(int(uint(_389) >> uint(2)));
    int _393 = _389 & 3;
    float _395 = (*spvDescriptorSet0.fp_c3)._m0[int(_391)][_393];
    int _397 = _68 + 504;
    uint _399 = uint(int(uint(_397) >> uint(2)));
    uint _401 = uint(int(uint(int(_399)) >> uint(2)));
    int _403 = int(_399) & 3;
    float _405 = (*spvDescriptorSet0.fp_c3)._m0[int(_401)][_403];
    int _407 = int(_399) + 1;
    uint _409 = uint(int(uint(_407) >> uint(2)));
    int _411 = _407 & 3;
    float _413 = (*spvDescriptorSet0.fp_c3)._m0[int(_409)][_411];
    out.m_32.x = _387;
    out.m_32.y = _395;
    out.m_32.z = _405;
    out.m_32.w = _413;
    return main0_out_u{as_type<uint4>(out.m_32)};
}

