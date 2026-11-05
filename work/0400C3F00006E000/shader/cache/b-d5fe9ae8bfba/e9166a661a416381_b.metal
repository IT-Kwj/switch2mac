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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture3d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture3d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_ESmplr_w [[id(17)]];
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
    bool _231 = false;
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
    float2 _344 = float2(_70, _72);
    float _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_344, float2(0.0), isnan(_344))).x;
    float2 _355 = float2(_70, _72);
    float4 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_355, float2(0.0), isnan(_355))).xyzw;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = _77.w;
    bool _89 = _74 >= 1.0;
    bool _91 = isnan(_74);
    bool _93 = _89 || _91;
    bool _95 = isnan(1.0);
    bool _97 = _93 || _95;
    if (_97)
    {
        out.m_47.x = _79;
        out.m_47.y = _81;
        out.m_47.z = _83;
        out.m_47.w = _85;
        return out;
    }
    float _99 = _70 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _101 = _72 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float2 _404 = float2(_99, _101);
    float3 _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_404, float2(0.0), isnan(_404))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_404, float2(0.0), isnan(_404))).xyz;
    float _107 = _105.x;
    float _109 = _105.y;
    float _111 = _105.z;
    float _113 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _115 = (*spvDescriptorSet0.fp_c3)._m0[0].w + _113;
    float _117 = (*spvDescriptorSet0.fp_c3)._m0[0].w + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _119 = -_117;
    float _121 = fma(_74, _115, _119);
    float _123 = (*spvDescriptorSet0.fp_c3)._m0[0].w * (-2.0);
    float _125 = _81 * 0.715200006961822509765625;
    float _127 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _129 = 1.0 / _121;
    float _131 = fma(_79, 0.2125999927520751953125, _125);
    float _133 = fma(_83, 0.072200000286102294921875, _131);
    float _135 = 1.0 / _133;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _139 = fma(_127, _129, _137);
    float _141 = precise::max(0.0, _139);
    float _143 = _141 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _145 = _135 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _147 = precise::clamp(_145, 0.0, 1.0);
    float _149 = _143 * (-1.44269502162933349609375);
    float _151 = fma(_147, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _153 = exp2(_149);
    float _155 = fma(_79, _151, _107);
    float _157 = fma(_81, _151, _109);
    float _159 = _153 + (-0.5);
    float _161 = _155 * 4.0;
    float _163 = _157 * 4.0;
    float _165 = fma(_83, _151, _111);
    float _167 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[9].z, 0.5);
    uint _170 = as_type<uint>(half2(float2(_161, _163)));
    float _172 = _165 * 4.0;
    float _174 = precise::max(_167, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    uint _176 = extract_bits(_170, 16u, 16u);
    float _178 = float(_176);
    int _181 = int(_170) & 32767;
    uint _183 = as_type<uint>(half2(float2(_172, 0.0)));
    bool _185 = _174 > 0.999000012874603271484375;
    uint _187 = extract_bits(_183, 0u, 8u);
    int _189 = int(_187) & 255;
    uint _191 = extract_bits(_183, 8u, 8u);
    int _193 = int(_191) & 255;
    int _195 = _193 << 8;
    int _197 = _189 | _195;
    float _199 = float(uint(_181));
    float _201 = float(uint(_197));
    float _203 = fma(_199, 6.103515625e-05, -0.3125);
    float _205 = fma(_178, 6.103515625e-05, -0.3125);
    float _207 = fma(_201, 6.103515625e-05, -0.3125);
    float _209 = fma(_203, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _211 = fma(_205, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _213 = fma(_207, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _215 = !_185;
    float _225;
    float _227;
    float _229;
    if (!_215)
    {
        float3 _599 = float3(_209, _211, _213);
        float3 _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_599, float3(0.0), isnan(_599))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_599, float3(0.0), isnan(_599))).xyz;
        float _219 = _217.x;
        float _221 = _217.y;
        float _223 = _217.z;
        _225 = _221;
        _227 = _219;
        _229 = _223;
        _231 = true;
    }
    else
    {
        bool _233 = _174 >= 0.001000000047497451305389404296875;
        bool _235 = isnan(_174);
        bool _237 = _233 || _235;
        bool _239 = isnan(0.001000000047497451305389404296875);
        bool _241 = _237 || _239;
        if (!_241)
        {
            float3 _636 = float3(_209, _211, _213);
            float3 _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_636, float3(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_636, float3(0.0), isnan(_636))).xyz;
            float _245 = _243.x;
            float _247 = _243.y;
            float _249 = _243.z;
            _225 = _247;
            _227 = _245;
            _229 = _249;
            _231 = true;
        }
        else
        {
            float3 _655 = float3(_209, _211, _213);
            float3 _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_655, float3(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_655, float3(0.0), isnan(_655))).xyz;
            float _253 = _251.x;
            float _255 = _251.y;
            float _257 = _251.z;
            float3 _670 = float3(_209, _211, _213);
            float3 _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_670, float3(0.0), isnan(_670))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_670, float3(0.0), isnan(_670))).xyz;
            float _261 = _259.x;
            float _263 = _259.y;
            float _265 = _259.z;
            float _267 = -_255;
            float _269 = _263 + _267;
            float _271 = -_253;
            float _273 = _261 + _271;
            float _275 = -_257;
            float _277 = _265 + _275;
            float _279 = fma(_174, _269, _255);
            float _281 = fma(_174, _273, _253);
            float _283 = fma(_174, _277, _257);
            _225 = _279;
            _227 = _281;
            _229 = _283;
        }
    }
    _231 = false;
    float _285 = _225;
    float _287 = _227;
    float _289 = _229;
    float _291 = _285 * 0.715200006961822509765625;
    float _293 = fma(_287, 0.2125999927520751953125, _291);
    float _295 = fma(_289, 0.072200000286102294921875, _293);
    float _297 = 1.0 / _295;
    float _299 = _297 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = fma(_301, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _305 = _303 * _287;
    float _307 = _303 * _285;
    float _309 = _303 * _289;
    out.m_47.x = _305;
    out.m_47.y = _307;
    out.m_47.z = _309;
    out.m_47.w = _85;
    return out;
}

