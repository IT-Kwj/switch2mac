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
    bool _249 = false;
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
    float2 _384 = float2(_66, _68);
    float4 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_384, float2(0.0), isnan(_384))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_384, float2(0.0), isnan(_384))).xyzw;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float _79 = _71.w;
    float _81 = _68 + (-0.5);
    float _83 = _66 + (-0.5);
    float _85 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[7].x, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _87 = _83 + (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _89 = _85 * _85;
    float _91 = precise::max(0.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _93 = abs((*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _95 = -_93;
    float _97 = fma(_95, 2.0, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _99 = fma(_87, _87, _89);
    bool _103 = (*spvDescriptorSet0.fp_c3)._m0[6].w > (-1.0999999631167156621813774108887e-06);
    bool _105 = (*spvDescriptorSet0.fp_c3)._m0[6].w >= (-1.0999999631167156621813774108887e-06);
    bool _107 = isnan((*spvDescriptorSet0.fp_c3)._m0[6].w);
    bool _109 = _105 || _107;
    bool _111 = isnan(-1.0999999631167156621813774108887e-06);
    bool _113 = _109 || _111;
    float _115 = precise::max(0.0, _97);
    float _117 = sqrt(_99);
    float _119 = -_115;
    float _121 = _91 + _119;
    float _123 = 1.0 / _121;
    float _125 = -_115;
    float _127 = _117 + _125;
    int _130 = _113 ? 0 : 1;
    int _132 = ~_130;
    int _134 = _132 + 1;
    int _136 = _134 + 1;
    int _138 = _136;
    if (!_103)
    {
        int _140 = ~_130;
        int _142 = _140 + 1;
        _138 = _142;
    }
    int _144 = _138;
    float _146 = _127 * _123;
    float _148 = precise::clamp(_146, 0.0, 1.0);
    float _150 = float(_144);
    float _152 = fma(_148, -2.0, 3.0);
    float _154 = _148 * _148;
    float _156 = fma(_154, _152, -0.5);
    float _158 = fma(_156, _150, 0.5);
    float _160 = precise::max(_158, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    bool _162 = _160 > 0.999000012874603271484375;
    float _164 = _75 * 0.715200006961822509765625;
    float _166 = fma(_73, 0.2125999927520751953125, _164);
    float _168 = fma(_77, 0.072200000286102294921875, _166);
    float _170 = 1.0 / _168;
    float _172 = _170 * (*spvDescriptorSet0.fp_c5)._m0[0].z;
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = fma(_174, (*spvDescriptorSet0.fp_c5)._m0[0].y, (*spvDescriptorSet0.fp_c5)._m0[0].x);
    float _178 = _73 * _176;
    float _180 = _178 * 4.0;
    float _182 = _75 * _176;
    float _184 = _182 * 4.0;
    float _186 = _77 * _176;
    float _188 = _186 * 4.0;
    uint _191 = as_type<uint>(half2(float2(_180, _184)));
    uint _193 = as_type<uint>(half2(float2(_188, 0.0)));
    uint _195 = extract_bits(_191, 16u, 16u);
    float _197 = float(_195);
    int _199 = int(_191) & 32767;
    uint _201 = extract_bits(_193, 0u, 8u);
    int _203 = int(_201) & 255;
    uint _205 = extract_bits(_193, 8u, 8u);
    int _207 = int(_205) & 255;
    int _209 = _207 << 8;
    int _211 = _203 | _209;
    float _213 = float(uint(_199));
    float _215 = float(uint(_211));
    float _217 = fma(_213, 6.103515625e-05, -0.3125);
    float _219 = fma(_215, 6.103515625e-05, -0.3125);
    float _221 = fma(_197, 6.103515625e-05, -0.3125);
    float _223 = fma(_219, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _225 = fma(_221, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    float _227 = fma(_217, (*spvDescriptorSet0.fp_c4)._m0[0].z, (*spvDescriptorSet0.fp_c4)._m0[0].w);
    bool _229 = !_162;
    float _231 = (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _243;
    float _245;
    float _247;
    if (!_229)
    {
        float3 _640 = float3(_227, _225, _223);
        float3 _235 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_640, float3(0.0), isnan(_640))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_640, float3(0.0), isnan(_640))).xyz;
        float _237 = _235.x;
        float _239 = _235.y;
        float _241 = _235.z;
        _243 = _239;
        _245 = _237;
        _247 = _241;
        _249 = true;
    }
    else
    {
        bool _251 = _160 >= 0.001000000047497451305389404296875;
        bool _253 = isnan(_160);
        bool _255 = _251 || _253;
        bool _257 = isnan(0.001000000047497451305389404296875);
        bool _259 = _255 || _257;
        float3 _674 = float3(_227, _225, _223);
        float3 _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_674, float3(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_674, float3(0.0), isnan(_674))).xyz;
        float _263 = _261.x;
        float _265 = _261.y;
        float _267 = _261.z;
        float _269 = _150;
        float _271 = (*spvDescriptorSet0.fp_c5)._m0[0].y;
        float _273 = 0.0;
        float _275 = _263;
        float _277 = _265;
        _247 = _267;
        if (_259)
        {
            float3 _697 = float3(_227, _225, _223);
            float3 _279 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_697, float3(0.0), isnan(_697))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_697, float3(0.0), isnan(_697))).xyz;
            float _281 = _279.x;
            float _283 = _279.y;
            float _285 = _279.z;
            _269 = _281;
            _271 = _283;
            _273 = _285;
        }
        float _287 = _269;
        float _289 = _271;
        float _291 = _273;
        float _293 = _287;
        float _295 = _289;
        if (_259)
        {
            float _297 = -_263;
            float _299 = _297 + _287;
            _231 = _299;
        }
        float _301 = _231;
        if (_259)
        {
            float _303 = -_265;
            float _305 = _303 + _289;
            _293 = _305;
        }
        float _307 = _293;
        if (_259)
        {
            float _309 = -_267;
            float _311 = _309 + _291;
            _295 = _311;
        }
        float _313 = _295;
        if (_259)
        {
            float _315 = fma(_160, _301, _263);
            _275 = _315;
        }
        float _317 = _275;
        _245 = _317;
        if (_259)
        {
            float _319 = fma(_160, _307, _265);
            _277 = _319;
        }
        float _321 = _277;
        _243 = _321;
        if (_259)
        {
            float _323 = fma(_160, _313, _267);
            _247 = _323;
        }
    }
    _249 = false;
    float _325 = _243;
    float _327 = _245;
    float _329 = _247;
    float _331 = _325 * 0.715200006961822509765625;
    float _333 = fma(_327, 0.2125999927520751953125, _331);
    float _335 = fma(_329, 0.072200000286102294921875, _333);
    float _337 = 1.0 / _335;
    float _339 = _337 * (*spvDescriptorSet0.fp_c5)._m0[1].z;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    float _343 = fma(_341, (*spvDescriptorSet0.fp_c5)._m0[1].y, (*spvDescriptorSet0.fp_c5)._m0[1].x);
    float _345 = _343 * _327;
    float _347 = _343 * _325;
    float _349 = _343 * _329;
    out.m_43.x = _345;
    out.m_43.y = _347;
    out.m_43.z = _349;
    out.m_43.w = _79;
    return out;
}

