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
    bool _179 = false;
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
    float2 _310 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_310, float2(0.0), isnan(_310))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_310, float2(0.0), isnan(_310))).x;
    float2 _321 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_321, float2(0.0), isnan(_321))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_321, float2(0.0), isnan(_321))).xyzw;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _75.w;
    bool _87 = _72 >= 1.0;
    bool _89 = isnan(_72);
    bool _91 = _87 || _89;
    bool _93 = isnan(1.0);
    bool _95 = _91 || _93;
    float _97 = _77;
    float _99 = _79;
    float _101 = _81;
    if (!_95)
    {
        float _103 = -(*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _105 = (*spvDescriptorSet0.fp_c3)._m0[0].w + _103;
        float _107 = (*spvDescriptorSet0.fp_c3)._m0[0].w + (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _109 = (*spvDescriptorSet0.fp_c3)._m0[0].w * (-2.0);
        float _111 = -_107;
        float _113 = fma(_72, _105, _111);
        float _115 = _109 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _117 = _79 * 0.715200006961822509765625;
        float _119 = 1.0 / _113;
        float _121 = fma(_77, 0.2125999927520751953125, _117);
        float _123 = fma(_81, 0.072200000286102294921875, _121);
        float _125 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
        float _127 = fma(_115, _119, _125);
        float _129 = precise::max(0.0, _127);
        float _131 = _129 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
        float _133 = _131 * (-1.44269502162933349609375);
        float _135 = 1.0 / _123;
        float _137 = exp2(_133);
        float _139 = _135 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _141 = precise::clamp(_139, 0.0, 1.0);
        float _143 = fma(_141, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
        float _145 = _137 + (-0.5);
        float _147 = _143 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _149 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[9].z, 0.5);
        float _151 = fma(_77, _147, (*spvDescriptorSet0.fp_c4)._m0[0].w);
        float _153 = fma(_79, _147, (*spvDescriptorSet0.fp_c4)._m0[0].w);
        float _155 = fma(_81, _147, (*spvDescriptorSet0.fp_c4)._m0[0].w);
        float _157 = precise::max(_149, (*spvDescriptorSet0.fp_c3)._m0[5].w);
        bool _159 = _157 > 0.999000012874603271484375;
        bool _161 = !_159;
        float _173;
        float _175;
        float _177;
        if (!_161)
        {
            float3 _470 = float3(_151, _153, _155);
            float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_470, float3(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_470, float3(0.0), isnan(_470))).xyz;
            float _167 = _165.x;
            float _169 = _165.y;
            float _171 = _165.z;
            _173 = _169;
            _175 = _167;
            _177 = _171;
            _179 = true;
        }
        else
        {
            bool _181 = _157 >= 0.001000000047497451305389404296875;
            bool _183 = isnan(_157);
            bool _185 = _181 || _183;
            bool _187 = isnan(0.001000000047497451305389404296875);
            bool _189 = _185 || _187;
            if (!_189)
            {
                float3 _507 = float3(_151, _153, _155);
                float3 _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_507, float3(0.0), isnan(_507))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_507, float3(0.0), isnan(_507))).xyz;
                float _193 = _191.x;
                float _195 = _191.y;
                float _197 = _191.z;
                _173 = _195;
                _175 = _193;
                _177 = _197;
                _179 = true;
            }
            else
            {
                float3 _526 = float3(_151, _153, _155);
                float3 _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_526, float3(0.0), isnan(_526))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_526, float3(0.0), isnan(_526))).xyz;
                float _201 = _199.x;
                float _203 = _199.y;
                float _205 = _199.z;
                float3 _541 = float3(_151, _153, _155);
                float3 _207 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_541, float3(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_541, float3(0.0), isnan(_541))).xyz;
                float _209 = _207.x;
                float _211 = _207.y;
                float _213 = _207.z;
                float _215 = -_203;
                float _217 = _211 + _215;
                float _219 = -_201;
                float _221 = _209 + _219;
                float _223 = -_205;
                float _225 = _213 + _223;
                float _227 = fma(_157, _217, _203);
                float _229 = fma(_157, _221, _201);
                float _231 = fma(_157, _225, _205);
                _173 = _227;
                _175 = _229;
                _177 = _231;
            }
        }
        _179 = false;
        float _233 = _173;
        float _235 = _175;
        float _237 = _177;
        float _239 = _233 * 0.715200006961822509765625;
        float _241 = fma(_235, 0.2125999927520751953125, _239);
        float _243 = fma(_237, 0.072200000286102294921875, _241);
        float _245 = 1.0 / _243;
        float _247 = _245 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
        float _249 = precise::clamp(_247, 0.0, 1.0);
        float _251 = fma(_249, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
        float _253 = _251 * _235;
        float _255 = _251 * _233;
        float _257 = _251 * _237;
        _97 = _253;
        _99 = _255;
        _101 = _257;
    }
    float _259 = _97;
    float _261 = _99;
    float _263 = _101;
    float _265 = 0.0 + _259;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    float _269 = 0.0 + _261;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = 0.0 + _263;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    out.m_45.x = _267;
    out.m_45.y = _271;
    out.m_45.z = _275;
    out.m_45.w = _83;
    return out;
}

