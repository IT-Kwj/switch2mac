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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture3d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _206 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_40.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_40.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _347 = float2(_66, _68);
    float4 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_347, float2(0.0), isnan(_347))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_347, float2(0.0), isnan(_347))).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    float _81 = _68 + (-0.5);
    float _83 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[7].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _85 = _66 + (-0.5);
    bool _89 = (*spvDescriptorSet0.fp_c3)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    float _91 = _83 * _83;
    float _93 = _85 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _95 = abs((*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _97 = -_95;
    float _99 = fma(_97, 2.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _101 = precise::max(0.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _103 = fma(_93, _93, _91);
    bool _105 = (*spvDescriptorSet0.fp_c3)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _107 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].w);
    bool _109 = _105 || _107;
    bool _111 = isnan(-1.0999999631167156621813774108887e-06);
    bool _113 = _109 || _111;
    float _115 = precise::max(0.0, _99);
    int _118 = _113 ? 0 : 1;
    float _120 = sqrt(_103);
    float _122 = -_115;
    float _124 = _101 + _122;
    float _126 = 1.0 / _124;
    float _128 = -_115;
    float _130 = _120 + _128;
    int _132 = ~_118;
    int _134 = _132 + 1;
    int _136 = _134 + 1;
    int _138 = _136;
    if (!_89)
    {
        int _140 = ~_118;
        int _142 = _140 + 1;
        _138 = _142;
    }
    int _144 = _138;
    float _146 = float(_144);
    float _148 = _130 * _126;
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = fma(_150, -2.0, 3.0);
    float _154 = _150 * _150;
    float _156 = fma(_154, _152, -0.5);
    float _158 = fma(_156, _146, 0.5);
    float _160 = precise::max(_158, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    bool _162 = _160 > 0.999000012874603271484375;
    float _164 = _75 * 0.715200006961822509765625;
    float _166 = fma(_73, 0.2125999927520751953125, _164);
    float _168 = fma(_77, 0.072200000286102294921875, _166);
    float _170 = 1.0 / _168;
    float _172 = _170 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = fma(_174, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _178 = _176 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _180 = fma(_73, _178, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _182 = fma(_75, _178, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _184 = fma(_77, _178, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _186 = !_162;
    float _188 = _178;
    float _200;
    float _202;
    float _204;
    if (!_186)
    {
        float3 _538 = float3(_180, _182, _184);
        float3 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_538, float3(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_538, float3(0.0), isnan(_538))).xyz;
        float _194 = _192.x;
        float _196 = _192.y;
        float _198 = _192.z;
        _200 = _196;
        _202 = _194;
        _204 = _198;
        _206 = true;
    }
    else
    {
        bool _208 = _160 >= 0.001000000047497451305389404296875;
        bool _210 = isnan(_160);
        bool _212 = _208 || _210;
        bool _214 = isnan(0.001000000047497451305389404296875);
        bool _216 = _212 || _214;
        float3 _572 = float3(_180, _182, _184);
        float3 _218 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_572, float3(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_572, float3(0.0), isnan(_572))).xyz;
        float _220 = _218.x;
        float _222 = _218.y;
        float _224 = _218.z;
        float _226 = _156;
        float _228 = (*spvDescriptorSet0.fp_c5)._m0[0].y;
        float _230 = 0.0;
        float _232 = _220;
        float _234 = _222;
        _204 = _224;
        if (_216)
        {
            float3 _595 = float3(_180, _182, _184);
            float3 _236 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_595, float3(0.0), isnan(_595))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_595, float3(0.0), isnan(_595))).xyz;
            float _238 = _236.x;
            float _240 = _236.y;
            float _242 = _236.z;
            _226 = _238;
            _228 = _240;
            _230 = _242;
        }
        float _244 = _226;
        float _246 = _228;
        float _248 = _230;
        float _250 = _244;
        float _252 = _246;
        if (_216)
        {
            float _254 = -_220;
            float _256 = _254 + _244;
            _188 = _256;
        }
        float _258 = _188;
        if (_216)
        {
            float _260 = -_222;
            float _262 = _260 + _246;
            _250 = _262;
        }
        float _264 = _250;
        if (_216)
        {
            float _266 = -_224;
            float _268 = _266 + _248;
            _252 = _268;
        }
        float _270 = _252;
        if (_216)
        {
            float _272 = fma(_160, _258, _220);
            _232 = _272;
        }
        float _274 = _232;
        _202 = _274;
        if (_216)
        {
            float _276 = fma(_160, _264, _222);
            _234 = _276;
        }
        float _278 = _234;
        _200 = _278;
        if (_216)
        {
            float _280 = fma(_160, _270, _224);
            _204 = _280;
        }
    }
    _206 = false;
    float _282 = _200;
    float _284 = _202;
    float _286 = _204;
    float _288 = _282 * 0.715200006961822509765625;
    float _290 = fma(_284, 0.2125999927520751953125, _288);
    float _292 = fma(_286, 0.072200000286102294921875, _290);
    float _294 = 1.0 / _292;
    float _296 = _294 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _298 = precise::clamp(_296, 0.0, 1.0);
    float _300 = fma(_298, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _302 = _300 * _284;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _300 * _282;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = _300 * _286;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    out.m_43.x = _304;
    out.m_43.y = _308;
    out.m_43.z = _312;
    out.m_43.w = _79;
    return out;
}

