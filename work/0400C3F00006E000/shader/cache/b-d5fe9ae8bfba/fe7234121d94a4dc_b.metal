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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_40 [[user(locn5), flat]];
    float4 m_50 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _64 = gl_FragCoord.w;
    float _66 = in.m_40.y;
    float _68 = in.m_42.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_42.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _64;
    float _94 = rint(_66);
    float _96 = precise::max(_94, 0.0);
    uint _99 = uint(_96);
    uint _101 = clamp(_99, 0u, 65535u);
    float _103 = _92 * _72;
    float _105 = _92 * _78;
    float _107 = _92 * _84;
    float _109 = _92 * _90;
    float2 _412 = float2(_103, _105);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412))).w;
    float3 _426 = float3(_109, _107, float(int(_101)));
    float3 _430 = select(_426, float3(0.0), isnan(_426));
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _430.xy, uint(rint(_430.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _430.xy, uint(rint(_430.z))).w;
    float _115 = in.m_44.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_46.w;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_48.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _92 * _119;
    float _135 = _92 * _125;
    float _137 = _92 * _131;
    float _139 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.100000001490116119384765625;
    float _141 = in.m_44.y;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_44.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = -_133;
    float _155 = fma(_153, _111, 1.0);
    float _157 = _155 * _113;
    float _159 = _157 * _135;
    float _161 = 0.0 + _159;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = _163 * _137;
    bool _169 = _165 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _171 = isnan(_165);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _177 = _173 || _175;
    float _179 = in.m_50.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    if (!_177)
    {
        discard_fragment();
    }
    float _185 = in.m_44.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = _92 * _183;
    float _193 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _195 = _191 + _193;
    float _197 = fma(_195, -15.0, _139);
    float _199 = _197 * 0.15915493667125701904296875;
    float _201 = _199 * 6.283185482025146484375;
    float _203 = sin(_201);
    float _205 = fma(_203, 0.5, 0.5);
    float _207 = _92 * _189;
    float _209 = _205 * _205;
    float _211 = -_207;
    float _213 = _211 + 0.75;
    float _215 = _205 * _209;
    float _217 = _92 * _145;
    float _219 = _92 * _151;
    float _221 = _215 * 0.300000011920928955078125;
    float _223 = -_217;
    float _225 = _223 + 0.75;
    float _227 = -_219;
    float _229 = _227 + 0.75;
    float _231 = fma(_221, _213, _207);
    float _233 = fma(_221, _225, _217);
    float _235 = fma(_221, _229, _219);
    if (!_177)
    {
        out.m_53.x = _231;
        out.m_53.y = _233;
        out.m_53.z = _235;
        out.m_53.w = _159;
        return out;
    }
    float _237 = _233 * 0.715200006961822509765625;
    float _239 = in.m_55.w;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_55.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_55.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = fma(_231, 0.2125999927520751953125, _237);
    float _259 = in.m_55.z;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    bool _265 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _267 = fma(_235, 0.072200000286102294921875, _257);
    float _269 = 1.0 / _267;
    float _271 = _269 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = 0.0 + _165;
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = _92 * _243;
    float _281 = fma(_273, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _283 = _92 * _255;
    float _285 = _92 * _263;
    float _287 = _281 * _279;
    float _289 = _92 * _249;
    float _291 = fma(_233, _287, _283);
    float _293 = fma(_231, _287, _289);
    float _295 = fma(_235, _287, _285);
    bool _297 = !_265;
    float _299 = _277;
    if (!_297)
    {
        float _301 = in.m_57.w;
        float _303 = gl_FragCoord.w;
        float _305 = _301 * _303;
        float _307 = in.m_57.z;
        float _309 = gl_FragCoord.w;
        float _311 = _307 * _309;
        float _313 = _92 * _305;
        float _315 = _92 * _311;
        float _317 = 1.0 / _313;
        float _319 = _315 * _317;
        float _321 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _323 = fma(_319, (*spvDescriptorSet0.fp_c8)._m0[30].w, _321);
        float _325 = 1.0 / _323;
        float _327 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _329 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _331 = fma(_325, _327, _329);
        float _333 = _331 * 8.0;
        float _335 = precise::clamp(_333, 0.0, 1.0);
        float _337 = _277 * _335;
        _299 = _337;
    }
    float _339 = _299;
    float _341 = 0.0 + _339;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    out.m_53.x = _293;
    out.m_53.y = _291;
    out.m_53.z = _295;
    out.m_53.w = _343;
    return out;
}

