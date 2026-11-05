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
    bool _224 = false;
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
    float2 _355 = float2(_68, _70);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_355, float2(0.0), isnan(_355))).x;
    float2 _366 = float2(_68, _70);
    float4 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_366, float2(0.0), isnan(_366))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_366, float2(0.0), isnan(_366))).xyzw;
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
        float _103 = _70 + (-0.5);
        float _105 = _68 + (-0.5);
        float _107 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[7].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
        float _109 = precise::max(0.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
        float _111 = _105 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
        bool _113 = (*spvDescriptorSet0.fp_c3)._m0[6].w > (-1.0999999631167156621813774108887e-06);
        float _115 = abs((*spvDescriptorSet0.fp_c3)._m0[6].w);
        float _117 = -_115;
        float _119 = fma(_117, 2.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
        float _121 = _107 * _107;
        bool _123 = (*spvDescriptorSet0.fp_c3)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
        bool _125 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].w);
        bool _127 = _123 || _125;
        bool _129 = isnan(-1.0999999631167156621813774108887e-06);
        bool _131 = _127 || _129;
        float _133 = precise::max(0.0, _119);
        float _135 = fma(_111, _111, _121);
        float _137 = _79 * 0.715200006961822509765625;
        int _140 = _131 ? 0 : 1;
        float _142 = -_133;
        float _144 = _109 + _142;
        float _146 = fma(_77, 0.2125999927520751953125, _137);
        float _148 = sqrt(_135);
        int _150 = ~_140;
        int _152 = _150 + 1;
        int _154 = _152 + 1;
        float _156 = fma(_81, 0.072200000286102294921875, _146);
        int _158 = _154;
        if (!_113)
        {
            int _160 = ~_140;
            int _162 = _160 + 1;
            _158 = _162;
        }
        int _164 = _158;
        float _166 = 1.0 / _144;
        float _168 = -_133;
        float _170 = _148 + _168;
        float _172 = 1.0 / _156;
        float _174 = _170 * _166;
        float _176 = precise::clamp(_174, 0.0, 1.0);
        float _178 = float(_164);
        float _180 = fma(_176, -2.0, 3.0);
        float _182 = _176 * _176;
        float _184 = fma(_182, _180, -0.5);
        float _186 = _172 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _188 = precise::clamp(_186, 0.0, 1.0);
        float _190 = fma(_184, _178, 0.5);
        float _192 = fma(_188, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
        float _194 = precise::max(_190, (*spvDescriptorSet0.fp_c3)._m0[5].w);
        float _196 = _192 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        bool _198 = _194 > 0.999000012874603271484375;
        float _200 = fma(_77, _196, (*spvDescriptorSet0.fp_c4)._m0[0].w);
        float _202 = fma(_79, _196, (*spvDescriptorSet0.fp_c4)._m0[0].w);
        float _204 = fma(_81, _196, (*spvDescriptorSet0.fp_c4)._m0[0].w);
        bool _206 = !_198;
        float _218;
        float _220;
        float _222;
        if (!_206)
        {
            float3 _570 = float3(_200, _202, _204);
            float3 _210 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_570, float3(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_570, float3(0.0), isnan(_570))).xyz;
            float _212 = _210.x;
            float _214 = _210.y;
            float _216 = _210.z;
            _218 = _214;
            _220 = _212;
            _222 = _216;
            _224 = true;
        }
        else
        {
            bool _226 = _194 >= 0.001000000047497451305389404296875;
            bool _228 = isnan(_194);
            bool _230 = _226 || _228;
            bool _232 = isnan(0.001000000047497451305389404296875);
            bool _234 = _230 || _232;
            if (!_234)
            {
                float3 _607 = float3(_200, _202, _204);
                float3 _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_607, float3(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_607, float3(0.0), isnan(_607))).xyz;
                float _238 = _236.x;
                float _240 = _236.y;
                float _242 = _236.z;
                _218 = _240;
                _220 = _238;
                _222 = _242;
                _224 = true;
            }
            else
            {
                float3 _626 = float3(_200, _202, _204);
                float3 _244 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_626, float3(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_626, float3(0.0), isnan(_626))).xyz;
                float _246 = _244.x;
                float _248 = _244.y;
                float _250 = _244.z;
                float3 _641 = float3(_200, _202, _204);
                float3 _252 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_641, float3(0.0), isnan(_641))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_641, float3(0.0), isnan(_641))).xyz;
                float _254 = _252.x;
                float _256 = _252.y;
                float _258 = _252.z;
                float _260 = -_246;
                float _262 = _254 + _260;
                float _264 = -_248;
                float _266 = _256 + _264;
                float _268 = -_250;
                float _270 = _258 + _268;
                float _272 = fma(_194, _262, _246);
                float _274 = fma(_194, _266, _248);
                float _276 = fma(_194, _270, _250);
                _218 = _274;
                _220 = _272;
                _222 = _276;
            }
        }
        _224 = false;
        float _278 = _218;
        float _280 = _220;
        float _282 = _222;
        float _284 = _278 * 0.715200006961822509765625;
        float _286 = fma(_280, 0.2125999927520751953125, _284);
        float _288 = fma(_282, 0.072200000286102294921875, _286);
        float _290 = 1.0 / _288;
        float _292 = _290 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
        float _294 = precise::clamp(_292, 0.0, 1.0);
        float _296 = fma(_294, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
        float _298 = _296 * _280;
        float _300 = _296 * _278;
        float _302 = _296 * _282;
        _97 = _298;
        _99 = _300;
        _101 = _302;
    }
    float _304 = _97;
    float _306 = _99;
    float _308 = _101;
    float _310 = 0.0 + _304;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = 0.0 + _306;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = 0.0 + _308;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    out.m_45.x = _312;
    out.m_45.y = _316;
    out.m_45.z = _320;
    out.m_45.w = _83;
    return out;
}

