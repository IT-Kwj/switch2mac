#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _942, thread const int& _943, constant _10& support_buffer)
{
    int _946 = 1 + _943;
    float _948 = support_buffer._m5[_946].x;
    float _950 = abs(_948);
    bool _952 = _950 == 1.0;
    if (_952)
    {
        return _942;
    }
    float _954 = float(_942);
    float _956 = _954 / _950;
    int _958 = int(_956);
    return _958;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _436 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_436, float2(0.0), isnan(_436))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_436, float2(0.0), isnan(_436))).x;
    bool _70 = _66 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_70)
    {
        discard_fragment();
    }
    if (_70)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _72 = in.m_36.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _92 = precise::clamp(_90, 0.0, 1.0);
    float _94 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _96 = precise::clamp(_94, 0.0, 1.0);
    float _98 = _60 * _76;
    float _100 = precise::max(_92, _98);
    bool _102 = _100 != 0.0;
    bool _104 = isnan(_100);
    bool _106 = _102 || _104;
    bool _108 = isnan(0.0);
    bool _110 = _106 || _108;
    float _112 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _114 = precise::clamp(_112, 0.0, 1.0);
    float _116 = _60 * _82;
    float _118 = _60 * _88;
    float _120 = precise::min(_114, _96);
    bool _122 = !_110;
    if (!_122)
    {
        float _124 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _126 = fma(_100, _124, 1.0);
        float _128 = log2(_126);
        float _130 = _128 + (-1.0);
        float _132 = trunc(_130);
        int _134 = int(_132);
        int _136 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).x;
        int _138 = _136;
        int _140 = 1;
        int _142 = _42(_138, _140, (*spvDescriptorSet0.support_buffer));
        int _144 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_134), spvDescriptorSet0.fp_t_tcb_A.get_height(_134)).y;
        int _146 = _144;
        int _148 = 1;
        int _150 = _42(_146, _148, (*spvDescriptorSet0.support_buffer));
        float _152 = float(_142);
        float _154 = float(_150);
        float _156 = fma(_62, _152, -0.5);
        float _158 = fma(_64, _154, -0.5);
        float _160 = 1.0 / _152;
        float _162 = floor(_156);
        float _164 = floor(_158);
        float _166 = -_162;
        float _168 = _156 + _166;
        float _170 = -_168;
        float _172 = _170 + 1.0;
        float _174 = -_168;
        float _176 = _174 + 2.0;
        float _178 = -_164;
        float _180 = _158 + _178;
        float _182 = _172 * _172;
        float _184 = _176 * _176;
        float _186 = -_180;
        float _188 = _186 + 1.0;
        float _190 = _172 * _182;
        float _192 = -_180;
        float _194 = _192 + 2.0;
        float _196 = _188 * _188;
        float _198 = -_190;
        float _200 = _198 + 6.0;
        float _202 = _194 * _194;
        float _204 = _188 * _196;
        float _206 = _190 * 4.0;
        float _208 = _204 * 4.0;
        float _210 = -_206;
        float _212 = fma(_176, _184, _210);
        float _214 = -_204;
        float _216 = _214 + 6.0;
        float _218 = 1.0 / _154;
        float _220 = -_208;
        float _222 = fma(_194, _202, _220);
        float _224 = -_212;
        float _226 = _224 + _200;
        float _228 = _190 + _212;
        float _230 = _212 * 0.16666667163372039794921875;
        float _232 = _204 + _222;
        float _234 = -_222;
        float _236 = _234 + _216;
        float _238 = _226 * 0.16666667163372039794921875;
        float _240 = _228 * 0.16666667163372039794921875;
        float _242 = _232 * 0.16666667163372039794921875;
        float _244 = _236 * 0.16666667163372039794921875;
        float _246 = 1.0 / _238;
        float _248 = _168 * _168;
        float _250 = _180 * _180;
        float _252 = _222 * 0.16666667163372039794921875;
        float _254 = _168 * _248;
        float _256 = _164 + (-0.5);
        float _258 = _180 * _250;
        float _260 = 1.0 / _242;
        float _262 = _162 + (-0.5);
        float _264 = _162 + 1.5;
        float _266 = _254 * 0.16666667163372039794921875;
        float _268 = _164 + 1.5;
        float _270 = _258 * 0.16666667163372039794921875;
        float _272 = 1.0 / _244;
        float _274 = fma(_266, _246, _264);
        float _276 = _274 * _160;
        float _278 = 1.0 / _240;
        float _280 = fma(_252, _260, _256);
        float _282 = _280 * _218;
        float _284 = fma(_270, _272, _268);
        float _286 = _284 * _218;
        float _288 = fma(_230, _278, _262);
        float _290 = _288 * _160;
        float2 _753 = float2(_290, _282);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_753, float2(0.0), isnan(_753)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_753, float2(0.0), isnan(_753)), level(_130)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float2 _768 = float2(_276, _282);
        float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_768, float2(0.0), isnan(_768)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_768, float2(0.0), isnan(_768)), level(_130)).xyz;
        float _304 = _302.x;
        float _306 = _302.y;
        float _308 = _302.z;
        float2 _783 = float2(_290, _286);
        float3 _310 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_783, float2(0.0), isnan(_783)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_783, float2(0.0), isnan(_783)), level(_130)).xyz;
        float _312 = _310.x;
        float _314 = _310.y;
        float _316 = _310.z;
        float2 _798 = float2(_276, _286);
        float3 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_798, float2(0.0), isnan(_798)), level(_130)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_798, float2(0.0), isnan(_798)), level(_130)).xyz;
        float _320 = _318.x;
        float _322 = _318.y;
        float _324 = _318.z;
        float _326 = 0.0 + _128;
        float _328 = precise::clamp(_326, 0.0, 1.0);
        float _330 = fma(_118, _328, _116);
        float _332 = -_304;
        float _334 = _296 + _332;
        float _336 = -_306;
        float _338 = _298 + _336;
        float _340 = fma(_240, _334, _304);
        float _342 = -_308;
        float _344 = _300 + _342;
        float _346 = -_320;
        float _348 = _312 + _346;
        float _350 = -_322;
        float _352 = _314 + _350;
        float _354 = -_324;
        float _356 = _316 + _354;
        float _358 = fma(_240, _338, _306);
        float _360 = fma(_240, _348, _320);
        float _362 = fma(_240, _344, _308);
        float _364 = fma(_240, _352, _322);
        float _366 = fma(_240, _356, _324);
        float _368 = -_360;
        float _370 = _368 + _340;
        float _372 = -_364;
        float _374 = _372 + _358;
        float _376 = -_366;
        float _378 = _376 + _362;
        float _380 = fma(_242, _370, _360);
        float _382 = fma(_242, _374, _364);
        float _384 = fma(_242, _378, _366);
        float _386 = -_380;
        float _388 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[13].x, _386);
        float _390 = -_382;
        float _392 = fma(_382, (*spvDescriptorSet0.fp_c3)._m0[13].y, _390);
        float _394 = -_384;
        float _396 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[13].z, _394);
        float _398 = fma(_120, _388, _380);
        float _400 = fma(_120, _392, _382);
        float _402 = fma(_120, _396, _384);
        out.m_34.x = _398;
        out.m_34.y = _400;
        out.m_34.z = _402;
        out.m_34.w = _330;
        return out;
    }
    discard_fragment();
    return out;
}

