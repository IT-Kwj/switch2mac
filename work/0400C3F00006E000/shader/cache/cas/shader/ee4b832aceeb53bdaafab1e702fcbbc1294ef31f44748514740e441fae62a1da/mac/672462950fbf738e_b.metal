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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c5 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture3d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _259 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_44.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_44.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _54;
    float _70 = _68 * _60;
    float _72 = _68 * _66;
    float _74 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float2 _430 = float2(_70, _72);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_430, float2(0.0), isnan(_430))).x;
    float2 _441 = float2(_70, _72);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = _72 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float2 _461 = float2(_74, _89);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_461, float2(0.0), isnan(_461))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    bool _103 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _111 = _107 || _109;
    float _113 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _115 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _113;
    float _117 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _119 = _72;
    float _121 = _115;
    if (!_111)
    {
        _119 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _123 = _119;
    float _125 = -_117;
    float _127 = fma(_76, _115, _125);
    float _129 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
    float _131 = _123;
    if (_111)
    {
        float _133 = _83 * 0.715200006961822509765625;
        _121 = _133;
    }
    float _135 = _121;
    float _137 = _129 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _139 = 1.0 / _127;
    float _141 = _135;
    if (_111)
    {
        float _143 = fma(_81, 0.2125999927520751953125, _135);
        _141 = _143;
    }
    float _145 = _141;
    float _147 = _145;
    if (_111)
    {
        float _149 = fma(_85, 0.072200000286102294921875, _145);
        _147 = _149;
    }
    float _151 = _147;
    float _153 = _70;
    if (_111)
    {
        float _155 = 1.0 / _151;
        _153 = _155;
    }
    float _157 = _153;
    float _159 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _161 = fma(_137, _139, _159);
    float _163 = precise::max(0.0, _161);
    float _165 = _157;
    if (_111)
    {
        float _167 = _157 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _169 = precise::clamp(_167, 0.0, 1.0);
        _165 = _169;
    }
    float _171 = _165;
    float _173 = _163 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    if (_111)
    {
        float _175 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _131 = _175;
    }
    float _177 = _131;
    float _179 = _173 * (-1.44269502162933349609375);
    float _181 = exp2(_179);
    float _183 = fma(_81, _177, _95);
    float _185 = fma(_83, _177, _97);
    float _187 = fma(_85, _177, _99);
    float _189 = _183 * 4.0;
    float _191 = _185 * 4.0;
    float _193 = _187 * 4.0;
    uint _196 = as_type<uint>(half2(float2(_189, _191)));
    uint _198 = as_type<uint>(half2(float2(_193, 0.0)));
    uint _200 = extract_bits(_196, 16u, 16u);
    float _202 = float(_200);
    float _204 = _181 + (-0.5);
    uint _206 = extract_bits(_198, 0u, 8u);
    int _209 = int(_206) & 255;
    uint _211 = extract_bits(_198, 8u, 8u);
    int _213 = int(_211) & 255;
    int _215 = _213 << 8;
    int _217 = _209 | _215;
    float _219 = fma(_204, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
    int _221 = int(_196) & 32767;
    float _223 = float(uint(_217));
    float _225 = precise::max(_219, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _227 = float(uint(_221));
    float _229 = fma(_223, 6.103515625e-05, -0.3125);
    bool _231 = _225 > 0.999000012874603271484375;
    float _233 = fma(_202, 6.103515625e-05, -0.3125);
    float _235 = fma(_227, 6.103515625e-05, -0.3125);
    float _237 = fma(_233, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _239 = fma(_229, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _241 = fma(_235, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _243 = !_231;
    float _253;
    float _255;
    float _257;
    if (!_243)
    {
        float3 _713 = float3(_241, _237, _239);
        float3 _245 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_713, float3(0.0), isnan(_713))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_713, float3(0.0), isnan(_713))).xyz;
        float _247 = _245.x;
        float _249 = _245.y;
        float _251 = _245.z;
        _253 = _249;
        _255 = _247;
        _257 = _251;
        _259 = true;
    }
    else
    {
        bool _261 = _225 >= 0.001000000047497451305389404296875;
        bool _263 = isnan(_225);
        bool _265 = _261 || _263;
        bool _267 = isnan(0.001000000047497451305389404296875);
        bool _269 = _265 || _267;
        if (!_269)
        {
            float3 _750 = float3(_241, _237, _239);
            float3 _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_750, float3(0.0), isnan(_750))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_750, float3(0.0), isnan(_750))).xyz;
            float _273 = _271.x;
            float _275 = _271.y;
            float _277 = _271.z;
            _253 = _275;
            _255 = _273;
            _257 = _277;
            _259 = true;
        }
        else
        {
            float3 _769 = float3(_241, _237, _239);
            float3 _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_769, float3(0.0), isnan(_769))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_769, float3(0.0), isnan(_769))).xyz;
            float _281 = _279.x;
            float _283 = _279.y;
            float _285 = _279.z;
            float3 _784 = float3(_241, _237, _239);
            float3 _287 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_784, float3(0.0), isnan(_784))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_784, float3(0.0), isnan(_784))).xyz;
            float _289 = _287.x;
            float _291 = _287.y;
            float _293 = _287.z;
            float _295 = -_281;
            float _297 = _289 + _295;
            float _299 = -_283;
            float _301 = _291 + _299;
            float _303 = -_285;
            float _305 = _293 + _303;
            float _307 = fma(_225, _297, _281);
            float _309 = fma(_225, _301, _283);
            float _311 = fma(_225, _305, _285);
            _253 = _309;
            _255 = _307;
            _257 = _311;
        }
    }
    _259 = false;
    float _313 = _253;
    float _315 = _255;
    float _317 = _257;
    bool _319 = _315 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _321 = isnan(_315);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _327 = _323 || _325;
    float _329 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _331 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _333 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _335 = _313 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _337 = isnan(_313);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _343 = _339 || _341;
    bool _345 = _317 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _347 = isnan(_317);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _353 = _349 || _351;
    float _355 = exp2(_329);
    float _357 = exp2(_333);
    float _359 = exp2(_331);
    float _361 = _315;
    float _363 = _313;
    float _365 = _317;
    if (_327)
    {
        float _367 = -_355;
        float _369 = _367 + 1.0;
        _361 = _369;
    }
    float _371 = _361;
    float _373 = _371 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_343)
    {
        float _375 = -_357;
        float _377 = _375 + 1.0;
        _363 = _377;
    }
    float _379 = _363;
    float _381 = _379 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_353)
    {
        float _383 = -_359;
        float _385 = _383 + 1.0;
        _365 = _385;
    }
    float _387 = _365;
    float _389 = _387 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_47.x = _373;
    out.m_47.y = _381;
    out.m_47.z = _389;
    out.m_47.w = _87;
    return out;
}

