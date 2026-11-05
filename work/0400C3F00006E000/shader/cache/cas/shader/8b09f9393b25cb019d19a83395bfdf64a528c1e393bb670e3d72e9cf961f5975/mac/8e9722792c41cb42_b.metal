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
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
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
    bool _209 = false;
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
    float2 _344 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_344, float2(0.0), isnan(_344))).x;
    float2 _355 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_355, float2(0.0), isnan(_355))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    float _85 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _87 = (*spvDescriptorSet0.fp_c3)._m0[0].w + _85;
    float _89 = (*spvDescriptorSet0.fp_c3)._m0[0].w + (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _91 = -_89;
    float _93 = fma(_72, _87, _91);
    float _95 = (*spvDescriptorSet0.fp_c3)._m0[0].w * (-2.0);
    float _97 = _79 * 0.715200006961822509765625;
    float _99 = _95 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _101 = 1.0 / _93;
    float _103 = fma(_77, 0.2125999927520751953125, _97);
    float _105 = fma(_81, 0.072200000286102294921875, _103);
    float _107 = 1.0 / _105;
    float _109 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _111 = fma(_99, _101, _109);
    float _113 = precise::max(0.0, _111);
    float _115 = _107 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _113 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _121 = fma(_117, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _123 = _119 * (-1.44269502162933349609375);
    float _125 = _77 * _121;
    float _127 = _125 * 4.0;
    float _129 = _79 * _121;
    float _131 = _129 * 4.0;
    float _133 = _81 * _121;
    float _135 = _133 * 4.0;
    float _137 = exp2(_123);
    uint _140 = as_type<uint>(half2(float2(_127, _131)));
    uint _142 = as_type<uint>(half2(float2(_135, 0.0)));
    int _145 = int(_140) & 32767;
    uint _147 = extract_bits(_140, 16u, 16u);
    float _149 = float(_147);
    uint _151 = extract_bits(_142, 0u, 8u);
    int _153 = int(_151) & 255;
    uint _155 = extract_bits(_142, 8u, 8u);
    int _157 = int(_155) & 255;
    int _159 = _157 << 8;
    int _161 = _153 | _159;
    float _163 = float(uint(_145));
    float _165 = float(uint(_161));
    float _167 = _137 + (-0.5);
    float _169 = fma(_165, 6.103515625e-05, -0.3125);
    float _171 = fma(_163, 6.103515625e-05, -0.3125);
    float _173 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[9].z, 0.5);
    float _175 = fma(_169, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _177 = fma(_171, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _179 = fma(_149, 6.103515625e-05, -0.3125);
    float _181 = precise::max(_173, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _183 = fma(_179, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _187 = _181 > 0.999000012874603271484375;
    bool _189 = !_187;
    float _191 = _171;
    float _203;
    float _205;
    float _207;
    if (!_189)
    {
        float3 _552 = float3(_177, _183, _175);
        float3 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_552, float3(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_552, float3(0.0), isnan(_552))).xyz;
        float _197 = _195.x;
        float _199 = _195.y;
        float _201 = _195.z;
        _203 = _199;
        _205 = _197;
        _207 = _201;
        _209 = true;
    }
    else
    {
        bool _211 = _181 >= 0.001000000047497451305389404296875;
        bool _213 = isnan(_181);
        bool _215 = _211 || _213;
        bool _217 = isnan(0.001000000047497451305389404296875);
        bool _219 = _215 || _217;
        float3 _586 = float3(_177, _183, _175);
        float3 _221 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_586, float3(0.0), isnan(_586))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_586, float3(0.0), isnan(_586))).xyz;
        float _223 = _221.x;
        float _225 = _221.y;
        float _227 = _221.z;
        float _229 = (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _231 = 0.0;
        float _233 = 6.103515625e-05;
        float _235 = _223;
        float _237 = _225;
        _207 = _227;
        if (_219)
        {
            float3 _608 = float3(_177, _183, _175);
            float3 _239 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_608, float3(0.0), isnan(_608))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_608, float3(0.0), isnan(_608))).xyz;
            float _241 = _239.x;
            float _243 = _239.y;
            float _245 = _239.z;
            _229 = _241;
            _231 = _243;
            _233 = _245;
        }
        float _247 = _229;
        float _249 = _231;
        float _251 = _233;
        float _253 = _247;
        float _255 = _251;
        if (_219)
        {
            float _257 = -_223;
            float _259 = _257 + _247;
            _191 = _259;
        }
        float _261 = _191;
        if (_219)
        {
            float _263 = -_225;
            float _265 = _263 + _249;
            _253 = _265;
        }
        float _267 = _253;
        if (_219)
        {
            float _269 = -_227;
            float _271 = _269 + _251;
            _255 = _271;
        }
        float _273 = _255;
        if (_219)
        {
            float _275 = fma(_181, _261, _223);
            _235 = _275;
        }
        float _277 = _235;
        _205 = _277;
        if (_219)
        {
            float _279 = fma(_181, _267, _225);
            _237 = _279;
        }
        float _281 = _237;
        _203 = _281;
        if (_219)
        {
            float _283 = fma(_181, _273, _227);
            _207 = _283;
        }
    }
    _209 = false;
    float _285 = _203;
    float _287 = _205;
    float _289 = _207;
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
    out.m_45.x = _305;
    out.m_45.y = _307;
    out.m_45.z = _309;
    out.m_45.w = _83;
    return out;
}

