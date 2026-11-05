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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
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
    bool _165 = false;
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
    float2 _306 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_306, float2(0.0), isnan(_306))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_306, float2(0.0), isnan(_306))).x;
    float2 _317 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_317, float2(0.0), isnan(_317))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_317, float2(0.0), isnan(_317))).xyzw;
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
    float _125 = _121 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _127 = exp2(_123);
    float _129 = fma(_77, _125, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _131 = fma(_79, _125, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _133 = _127 + (-0.5);
    float _135 = fma(_81, _125, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _137 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[9].z, 0.5);
    float _139 = precise::max(_137, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    bool _143 = _139 > 0.999000012874603271484375;
    bool _145 = !_143;
    float _147 = (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _159;
    float _161;
    float _163;
    if (!_145)
    {
        float3 _451 = float3(_129, _131, _135);
        float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_451, float3(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_451, float3(0.0), isnan(_451))).xyz;
        float _153 = _151.x;
        float _155 = _151.y;
        float _157 = _151.z;
        _159 = _155;
        _161 = _153;
        _163 = _157;
        _165 = true;
    }
    else
    {
        bool _167 = _139 >= 0.001000000047497451305389404296875;
        bool _169 = isnan(_139);
        bool _171 = _167 || _169;
        bool _173 = isnan(0.001000000047497451305389404296875);
        bool _175 = _171 || _173;
        float3 _485 = float3(_129, _131, _135);
        float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_485, float3(0.0), isnan(_485))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_485, float3(0.0), isnan(_485))).xyz;
        float _179 = _177.x;
        float _181 = _177.y;
        float _183 = _177.z;
        float _185 = (*spvDescriptorSet0.fp_c3)._m0[9].z;
        float _187 = _125;
        float _189 = 0.0;
        float _191 = _181;
        float _193 = _179;
        _163 = _183;
        if (_175)
        {
            float3 _508 = float3(_129, _131, _135);
            float3 _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_508, float3(0.0), isnan(_508))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_508, float3(0.0), isnan(_508))).xyz;
            float _197 = _195.x;
            float _199 = _195.y;
            float _201 = _195.z;
            _185 = _197;
            _187 = _199;
            _189 = _201;
        }
        float _203 = _185;
        float _205 = _187;
        float _207 = _189;
        float _209 = _203;
        float _211 = _205;
        if (_175)
        {
            float _213 = -_181;
            float _215 = _213 + _205;
            _147 = _215;
        }
        float _217 = _147;
        if (_175)
        {
            float _219 = -_179;
            float _221 = _219 + _203;
            _209 = _221;
        }
        float _223 = _209;
        if (_175)
        {
            float _225 = -_183;
            float _227 = _225 + _207;
            _211 = _227;
        }
        float _229 = _211;
        if (_175)
        {
            float _231 = fma(_139, _217, _181);
            _191 = _231;
        }
        float _233 = _191;
        _159 = _233;
        if (_175)
        {
            float _235 = fma(_139, _223, _179);
            _193 = _235;
        }
        float _237 = _193;
        _161 = _237;
        if (_175)
        {
            float _239 = fma(_139, _229, _183);
            _163 = _239;
        }
    }
    _165 = false;
    float _241 = _159;
    float _243 = _161;
    float _245 = _163;
    float _247 = _241 * 0.715200006961822509765625;
    float _249 = fma(_243, 0.2125999927520751953125, _247);
    float _251 = fma(_245, 0.072200000286102294921875, _249);
    float _253 = 1.0 / _251;
    float _255 = _253 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = fma(_257, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _261 = _259 * _243;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = _259 * _241;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = _259 * _245;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    out.m_45.x = _263;
    out.m_45.y = _267;
    out.m_45.z = _271;
    out.m_45.w = _83;
    return out;
}

