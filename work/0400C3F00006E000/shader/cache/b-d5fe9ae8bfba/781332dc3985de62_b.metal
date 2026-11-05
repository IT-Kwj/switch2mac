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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _445 = false;
    bool _411 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _502 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_502, float2(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_502, float2(0.0), isnan(_502))).x;
    float2 _513 = float2(_57, _59);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_513, float2(0.0), isnan(_513))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_513, float2(0.0), isnan(_513))).x;
    float _65 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[15].w, (*spvDescriptorSet0.fp_c3)._m0[15].z);
    bool _69 = _63 != 0.0;
    bool _71 = isnan(_63);
    bool _73 = _69 || _71;
    bool _75 = isnan(0.0);
    bool _77 = _73 || _75;
    float _79 = _65 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _81 = fma(_57, 2.0, -1.0);
    bool _83 = _79 > (*spvDescriptorSet0.fp_c3)._m0[11].w;
    bool _85 = !_77;
    bool _87 = _83 || _85;
    float _89 = fma(_59, 2.0, -1.0);
    float _91 = _81 * (*spvDescriptorSet0.fp_c3)._m0[15].x;
    float _93 = _89 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _95 = _65 * _91;
    float _97 = _65 * _93;
    if (!_87)
    {
        int _100 = 0;
        bool _102 = false;
        float _104 = 0.0;
        float _106 = 0.0;
        bool _108;
        bool _377;
        float _385;
        float _451;
        do
        {
            int _110 = _100;
            bool _112 = _102;
            float _114 = _104;
            float _116 = _106;
            int _118 = _110 << 4;
            int _120 = _118 + 112;
            int _122 = _110 + 1;
            uint _125 = uint(int(uint(_120) >> uint(2)));
            uint _127 = uint(int(uint(int(_125)) >> uint(2)));
            int _129 = int(_125) & 3;
            float _131 = (*spvDescriptorSet0.fp_c3)._m0[int(_127)][_129];
            int _133 = int(_125) + 1;
            uint _135 = uint(int(uint(_133) >> uint(2)));
            int _137 = _133 & 3;
            float _139 = (*spvDescriptorSet0.fp_c3)._m0[int(_135)][_137];
            bool _141 = _122 >= 2;
            int _143 = _120 + 8;
            uint _145 = uint(int(uint(_143) >> uint(2)));
            uint _147 = uint(int(uint(int(_145)) >> uint(2)));
            int _149 = int(_145) & 3;
            float _151 = (*spvDescriptorSet0.fp_c3)._m0[int(_147)][_149];
            float _153 = -_97;
            float _155 = fma(_139, -0.100000001490116119384765625, _153);
            float _157 = fma(_131, -0.100000001490116119384765625, _95);
            float _159 = _155 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _161 = _151 * 0.100000001490116119384765625;
            float _163 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[6].x, _159);
            float _165 = -_79;
            float _167 = -_161;
            float _169 = _165 + _167;
            float _171 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[6].z, _163);
            float _173 = _171 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _175 = _155 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _177 = _155 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _179 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[4].x, _175);
            float _181 = 1.0 / _173;
            float _183 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[3].x, _177);
            float _185 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[4].z, _179);
            float _187 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[3].z, _183);
            float _189 = _185 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _191 = _187 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            float _193 = _189 * _181;
            float _195 = _191 * _181;
            float _197 = -_59;
            float _199 = _197 + _193;
            float _201 = -_57;
            float _203 = _201 + _195;
            float _205 = _199 * _199;
            float _207 = fma(_203, _203, _205);
            float _209 = sqrt(_207);
            bool _211 = _209 != 0.0;
            bool _213 = isnan(_209);
            bool _215 = _211 || _213;
            bool _217 = isnan(0.0);
            bool _219 = _215 || _217;
            _100 = _122;
            bool _221 = _112;
            float _223 = _205;
            float _225 = _209;
            float _227 = _116;
            float _229 = _116;
            if (!_219)
            {
                float _231 = -_161;
                bool _233 = _231 >= 0.0;
                bool _235 = isnan(_231);
                bool _237 = _233 || _235;
                bool _239 = isnan(0.0);
                bool _241 = _237 || _239;
                _221 = _241;
            }
            bool _243 = _221;
            bool _245 = _243;
            bool _247 = _243;
            if (!_219)
            {
                float _249 = _243 ? 0.0 : 0.5;
                _223 = _249;
            }
            float _251 = _223;
            if (!_219)
            {
                float _253 = _251 + _114;
                _225 = _253;
            }
            float _255 = _225;
            bool _257 = !_219;
            float _259 = _255;
            if (!_257)
            {
                float _261 = rsqrt(_207);
                float _263 = _63 * 10.0;
                float _265 = -_193;
                float _267 = _59 + _265;
                float _269 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[13].w;
                float _271 = _263 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
                float _273 = _63 * _269;
                float _275 = _273 * 2.0;
                float _277 = _261 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
                float _279 = 1.0 / _277;
                float _281 = _277 * _267;
                float _283 = _161 * _277;
                float _285 = _271 * _279;
                float _287 = -_195;
                float _289 = _57 + _287;
                bool _291 = _285 >= _275;
                bool _293 = isnan(_285);
                bool _295 = _291 || _293;
                bool _297 = isnan(_275);
                bool _299 = _295 || _297;
                float _301 = _277 * _289;
                float _303 = _277;
                if (!_299)
                {
                    float _305 = -_161;
                    bool _307 = _305 >= 0.0;
                    bool _309 = isnan(_305);
                    bool _311 = _307 || _309;
                    bool _313 = isnan(0.0);
                    bool _315 = _311 || _313;
                    _245 = _315;
                }
                bool _317 = _245;
                _247 = _317;
                if (!_299)
                {
                    float _319 = _317 ? 0.0 : 0.5;
                    _227 = _319;
                }
                float _321 = _227;
                _229 = _321;
                if (!_299)
                {
                    float _323 = _321 + _114;
                    _303 = _323;
                }
                float _325 = _303;
                bool _327 = !_299;
                _259 = _325;
                if (!_327)
                {
                    float _329 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[12].x));
                    float _331 = _283 * _285;
                    bool _333 = _283 >= 0.0;
                    bool _335 = isnan(_283);
                    bool _337 = _333 || _335;
                    bool _339 = isnan(0.0);
                    bool _341 = _337 || _339;
                    bool _343 = _329 > 0.0;
                    bool _345 = !_341;
                    float _347 = _345 ? 2.5 : 0.5;
                    float _349 = -_283;
                    float _351 = -_79;
                    float _353 = fma(_349, _347, _351);
                    bool _355 = !_343;
                    _247 = _343;
                    _229 = _331;
                    if (!_355)
                    {
                        float _357 = _353 + (*spvDescriptorSet0.fp_c3)._m0[14].x;
                        float _359 = _301 * _285;
                        float _361 = _281 * _285;
                        float _363 = fma(_281, -1.5, _59);
                        float _365 = fma(_301, -1.5, _57);
                        float _367 = _357 * (*spvDescriptorSet0.fp_c3)._m0[14].z;
                        float _369 = _365;
                        float _371 = _363;
                        float _373 = _367;
                        float _375 = 0.0;
                        do
                        {
                            float _379 = _369;
                            float _381 = _371;
                            float _383 = _373;
                            _385 = _375;
                            float2 _984 = float2(_379, _381);
                            float _387 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_984, float2(0.0), isnan(_984)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_984, float2(0.0), isnan(_984)), level(0.0)).x;
                            float _389 = _387 + _383;
                            float _391 = -_389;
                            float _393 = precise::max(_391, (*spvDescriptorSet0.fp_c3)._m0[8].w);
                            float _395 = precise::min(_393, (*spvDescriptorSet0.fp_c3)._m0[7].w);
                            float _397 = -_389;
                            bool _399 = _395 != _397;
                            bool _401 = isnan(_395);
                            bool _403 = _399 || _401;
                            bool _405 = isnan(_397);
                            bool _407 = _403 || _405;
                            bool _409 = !_407;
                            _411 = _409;
                            if (_411)
                            {
                                break;
                            }
                            float _413 = _385 + 1.0;
                            float _415 = -_331;
                            float _417 = fma(_415, (*spvDescriptorSet0.fp_c3)._m0[14].z, _383);
                            float _419 = -_361;
                            float _421 = _419 + _381;
                            float _423 = -_359;
                            float _425 = _423 + _379;
                            bool _427 = _413 >= _329;
                            bool _429 = isnan(_413);
                            bool _431 = _427 || _429;
                            bool _433 = isnan(_329);
                            bool _435 = _431 || _433;
                            _377 = !_435;
                            _369 = _425;
                            _371 = _421;
                            _373 = _417;
                            _375 = _413;
                        } while (_377);
                        if (!_411)
                        {
                        }
                        if (false || _411)
                        {
                            _411 = false;
                            float _437 = -_385;
                            float _439 = fma(_437, (*spvDescriptorSet0.fp_c3)._m0[10].w, 1.0);
                            float _441 = precise::clamp(_439, 0.0, 1.0);
                            float _443 = fma(_441, 0.5, _114);
                            _259 = _443;
                            _445 = true;
                        }
                    }
                    if (!_445)
                    {
                        _259 = _114;
                    }
                }
            }
            _445 = false;
            bool _447 = _247;
            float _449 = _229;
            _451 = _259;
            _108 = !_141;
            _102 = _447;
            _104 = _451;
            _106 = _449;
        } while (_108);
        float _453 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _455 = _79 + _453;
        float _457 = _455 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _459 = precise::clamp(_457, 0.0, 1.0);
        float _461 = -_459;
        float _463 = _461 + 1.0;
        float _465 = -_451;
        float _467 = fma(_465, _463, 1.0);
        out.m_34.x = _467;
        out.m_34.y = _467;
        out.m_34.z = _467;
        out.m_34.w = _467;
        return out;
    }
    out.m_34.x = 1.0;
    out.m_34.y = 1.0;
    out.m_34.z = 1.0;
    out.m_34.w = 1.0;
    return out;
}

