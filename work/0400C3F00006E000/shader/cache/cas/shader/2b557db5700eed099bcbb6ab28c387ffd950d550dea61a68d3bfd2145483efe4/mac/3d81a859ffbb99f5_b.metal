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
    bool _223 = false;
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
    float _74 = _70 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float2 _364 = float2(_70, _72);
    float _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_364, float2(0.0), isnan(_364))).x;
    float2 _375 = float2(_70, _72);
    float4 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_375, float2(0.0), isnan(_375))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_375, float2(0.0), isnan(_375))).xyzw;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float _87 = _79.w;
    float _89 = _72 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float2 _395 = float2(_74, _89);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_395, float2(0.0), isnan(_395))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_395, float2(0.0), isnan(_395))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _103 = (*spvDescriptorSet0.fp_c3)._m0[0].w + _101;
    float _105 = (*spvDescriptorSet0.fp_c3)._m0[0].w + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _107 = -_105;
    float _109 = fma(_76, _103, _107);
    float _111 = (*spvDescriptorSet0.fp_c3)._m0[0].w * (-2.0);
    float _113 = _83 * 0.715200006961822509765625;
    float _115 = _111 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _117 = 1.0 / _109;
    float _119 = fma(_81, 0.2125999927520751953125, _113);
    float _121 = fma(_85, 0.072200000286102294921875, _119);
    float _123 = 1.0 / _121;
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _127 = fma(_115, _117, _125);
    float _129 = precise::max(0.0, _127);
    float _131 = _123 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = _129 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _137 = fma(_133, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _139 = _135 * (-1.44269502162933349609375);
    float _141 = exp2(_139);
    float _143 = fma(_81, _137, _95);
    float _145 = fma(_83, _137, _97);
    float _147 = fma(_85, _137, _99);
    float _149 = _143 * 4.0;
    float _151 = _145 * 4.0;
    float _153 = _147 * 4.0;
    uint _156 = as_type<uint>(half2(float2(_149, _151)));
    uint _158 = as_type<uint>(half2(float2(_153, 0.0)));
    uint _160 = extract_bits(_156, 16u, 16u);
    float _162 = float(_160);
    float _164 = _141 + (-0.5);
    uint _166 = extract_bits(_158, 0u, 8u);
    int _169 = int(_166) & 255;
    uint _171 = extract_bits(_158, 8u, 8u);
    int _173 = int(_171) & 255;
    int _175 = _173 << 8;
    int _177 = _169 | _175;
    float _179 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[9].z, 0.5);
    int _181 = int(_156) & 32767;
    float _183 = float(uint(_177));
    float _185 = precise::max(_179, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _187 = float(uint(_181));
    float _189 = fma(_183, 6.103515625e-05, -0.3125);
    bool _193 = _185 > 0.999000012874603271484375;
    float _195 = fma(_162, 6.103515625e-05, -0.3125);
    float _197 = fma(_187, 6.103515625e-05, -0.3125);
    float _199 = fma(_195, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _201 = fma(_189, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _203 = fma(_197, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _205 = !_193;
    float _207 = as_type<float>(_156);
    float _217;
    float _219;
    float _221;
    if (!_205)
    {
        float3 _592 = float3(_203, _199, _201);
        float3 _209 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_592, float3(0.0), isnan(_592))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_592, float3(0.0), isnan(_592))).xyz;
        float _211 = _209.x;
        float _213 = _209.y;
        float _215 = _209.z;
        _217 = _213;
        _219 = _211;
        _221 = _215;
        _223 = true;
    }
    else
    {
        bool _225 = _185 >= 0.001000000047497451305389404296875;
        bool _227 = isnan(_185);
        bool _229 = _225 || _227;
        bool _231 = isnan(0.001000000047497451305389404296875);
        bool _233 = _229 || _231;
        float3 _626 = float3(_203, _199, _201);
        float3 _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_626, float3(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_626, float3(0.0), isnan(_626))).xyz;
        float _237 = _235.x;
        float _239 = _235.y;
        float _241 = _235.z;
        float _243 = _141;
        float _245 = _121;
        float _247 = _117;
        float _249 = _237;
        float _251 = _239;
        _221 = _241;
        if (_233)
        {
            float3 _649 = float3(_203, _199, _201);
            float3 _253 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_649, float3(0.0), isnan(_649))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_649, float3(0.0), isnan(_649))).xyz;
            float _255 = _253.x;
            float _257 = _253.y;
            float _259 = _253.z;
            _243 = _255;
            _245 = _257;
            _247 = _259;
        }
        float _261 = _243;
        float _263 = _245;
        float _265 = _247;
        float _267 = _261;
        float _269 = _263;
        if (_233)
        {
            float _271 = -_237;
            float _273 = _271 + _261;
            _207 = _273;
        }
        float _275 = _207;
        if (_233)
        {
            float _277 = -_239;
            float _279 = _277 + _263;
            _267 = _279;
        }
        float _281 = _267;
        if (_233)
        {
            float _283 = -_241;
            float _285 = _283 + _265;
            _269 = _285;
        }
        float _287 = _269;
        if (_233)
        {
            float _289 = fma(_185, _275, _237);
            _249 = _289;
        }
        float _291 = _249;
        _219 = _291;
        if (_233)
        {
            float _293 = fma(_185, _281, _239);
            _251 = _293;
        }
        float _295 = _251;
        _217 = _295;
        if (_233)
        {
            float _297 = fma(_185, _287, _241);
            _221 = _297;
        }
    }
    _223 = false;
    float _299 = _217;
    float _301 = _219;
    float _303 = _221;
    float _305 = _299 * 0.715200006961822509765625;
    float _307 = fma(_301, 0.2125999927520751953125, _305);
    float _309 = fma(_303, 0.072200000286102294921875, _307);
    float _311 = 1.0 / _309;
    float _313 = _311 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = fma(_315, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _319 = _317 * _301;
    float _321 = _317 * _299;
    float _323 = _317 * _303;
    out.m_47.x = _319;
    out.m_47.y = _321;
    out.m_47.z = _323;
    out.m_47.w = _87;
    return out;
}

