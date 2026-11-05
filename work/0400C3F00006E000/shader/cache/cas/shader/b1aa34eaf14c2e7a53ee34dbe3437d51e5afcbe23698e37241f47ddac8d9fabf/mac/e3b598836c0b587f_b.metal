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
    texture3d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _245 = false;
    float _52 = gl_FragCoord.w;
    float _54 = in.m_42.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_42.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _52;
    float _68 = _66 * _58;
    float _70 = _66 * _64;
    float2 _410 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_410, float2(0.0), isnan(_410))).x;
    float2 _421 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    bool _87 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _89 = isnan(0.0);
    bool _91 = _87 || _89;
    bool _93 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
    bool _95 = _91 || _93;
    float _97 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _99 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _97;
    float _101 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _103 = _70;
    float _105 = _99;
    if (!_95)
    {
        _103 = (*spvDescriptorSet0.fp_c3)._m0[0].x;
    }
    float _107 = _103;
    float _109 = -_101;
    float _111 = fma(_72, _99, _109);
    float _113 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
    float _115 = _107;
    if (_95)
    {
        float _117 = _79 * 0.715200006961822509765625;
        _105 = _117;
    }
    float _119 = _105;
    float _121 = _113 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _123 = 1.0 / _111;
    float _125 = _119;
    if (_95)
    {
        float _127 = fma(_77, 0.2125999927520751953125, _119);
        _125 = _127;
    }
    float _129 = _125;
    float _131 = _129;
    if (_95)
    {
        float _133 = fma(_81, 0.072200000286102294921875, _129);
        _131 = _133;
    }
    float _135 = _131;
    float _137 = _68;
    if (_95)
    {
        float _139 = 1.0 / _135;
        _137 = _139;
    }
    float _141 = _137;
    float _143 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
    float _145 = fma(_121, _123, _143);
    float _147 = precise::max(0.0, _145);
    float _149 = _141;
    if (_95)
    {
        float _151 = _141 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _153 = precise::clamp(_151, 0.0, 1.0);
        _149 = _153;
    }
    float _155 = _149;
    float _157 = _147 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
    if (_95)
    {
        float _159 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
        _115 = _159;
    }
    float _161 = _115;
    float _163 = _157 * (-1.44269502162933349609375);
    float _165 = _77 * _161;
    float _167 = _165 * 4.0;
    float _169 = _79 * _161;
    float _171 = _169 * 4.0;
    float _173 = _81 * _161;
    float _175 = _173 * 4.0;
    float _177 = exp2(_163);
    uint _180 = as_type<uint>(half2(float2(_167, _171)));
    uint _182 = as_type<uint>(half2(float2(_175, 0.0)));
    int _185 = int(_180) & 32767;
    uint _187 = extract_bits(_180, 16u, 16u);
    float _189 = float(_187);
    uint _191 = extract_bits(_182, 0u, 8u);
    int _193 = int(_191) & 255;
    uint _195 = extract_bits(_182, 8u, 8u);
    int _197 = int(_195) & 255;
    int _199 = _197 << 8;
    int _201 = _193 | _199;
    float _203 = float(uint(_185));
    float _205 = float(uint(_201));
    float _207 = _177 + (-0.5);
    float _209 = fma(_205, 6.103515625e-05, -0.3125);
    float _211 = fma(_203, 6.103515625e-05, -0.3125);
    float _213 = fma(_207, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
    float _215 = fma(_209, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _217 = fma(_211, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    float _219 = fma(_189, 6.103515625e-05, -0.3125);
    float _221 = precise::max(_213, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _223 = fma(_219, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
    bool _225 = _221 > 0.999000012874603271484375;
    bool _227 = !_225;
    float _239;
    float _241;
    float _243;
    if (!_227)
    {
        float3 _674 = float3(_217, _223, _215);
        float3 _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_674, float3(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_674, float3(0.0), isnan(_674))).xyz;
        float _233 = _231.x;
        float _235 = _231.y;
        float _237 = _231.z;
        _239 = _235;
        _241 = _233;
        _243 = _237;
        _245 = true;
    }
    else
    {
        bool _247 = _221 >= 0.001000000047497451305389404296875;
        bool _249 = isnan(_221);
        bool _251 = _247 || _249;
        bool _253 = isnan(0.001000000047497451305389404296875);
        bool _255 = _251 || _253;
        if (!_255)
        {
            float3 _711 = float3(_217, _223, _215);
            float3 _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_711, float3(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_711, float3(0.0), isnan(_711))).xyz;
            float _259 = _257.x;
            float _261 = _257.y;
            float _263 = _257.z;
            _239 = _261;
            _241 = _259;
            _243 = _263;
            _245 = true;
        }
        else
        {
            float3 _730 = float3(_217, _223, _215);
            float3 _265 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_730, float3(0.0), isnan(_730))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_730, float3(0.0), isnan(_730))).xyz;
            float _267 = _265.x;
            float _269 = _265.y;
            float _271 = _265.z;
            float3 _745 = float3(_217, _223, _215);
            float3 _273 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_745, float3(0.0), isnan(_745))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_745, float3(0.0), isnan(_745))).xyz;
            float _275 = _273.x;
            float _277 = _273.y;
            float _279 = _273.z;
            float _281 = -_267;
            float _283 = _275 + _281;
            float _285 = -_269;
            float _287 = _277 + _285;
            float _289 = -_271;
            float _291 = _279 + _289;
            float _293 = fma(_221, _283, _267);
            float _295 = fma(_221, _287, _269);
            float _297 = fma(_221, _291, _271);
            _239 = _295;
            _241 = _293;
            _243 = _297;
        }
    }
    _245 = false;
    float _299 = _239;
    float _301 = _241;
    float _303 = _243;
    bool _305 = _301 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _307 = isnan(_301);
    bool _309 = _305 || _307;
    bool _311 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _313 = _309 || _311;
    float _315 = fma(_301, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _317 = fma(_303, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _319 = fma(_299, (*spvDescriptorSet0.fp_c3)._m0[1].y, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    bool _321 = _299 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _323 = isnan(_299);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _329 = _325 || _327;
    bool _331 = _303 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _333 = isnan(_303);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
    bool _339 = _335 || _337;
    float _341 = exp2(_315);
    float _343 = exp2(_319);
    float _345 = exp2(_317);
    float _347 = _301;
    float _349 = _299;
    float _351 = _303;
    if (_313)
    {
        float _353 = -_341;
        float _355 = _353 + 1.0;
        _347 = _355;
    }
    float _357 = _347;
    float _359 = _357 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_329)
    {
        float _361 = -_343;
        float _363 = _361 + 1.0;
        _349 = _363;
    }
    float _365 = _349;
    float _367 = _365 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    if (_339)
    {
        float _369 = -_345;
        float _371 = _369 + 1.0;
        _351 = _371;
    }
    float _373 = _351;
    float _375 = _373 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    out.m_45.x = _359;
    out.m_45.y = _367;
    out.m_45.z = _375;
    out.m_45.w = _83;
    return out;
}

