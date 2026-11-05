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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    texture2d<float> vp_t_tcb_8 [[id(7)]];
    sampler vp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_C [[id(9)]];
    sampler vp_t_tcb_CSmplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_8Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_81 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_61 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _102(thread const int& _7393, thread const int& _7394, constant _10& support_buffer)
{
    float _7397 = as_type<float>(support_buffer._m4);
    int _7399 = _7394 + as_type<int>(_7397);
    int _7401 = 1 + _7399;
    float _7403 = support_buffer._m5[_7401].x;
    float _7405 = abs(_7403);
    bool _7407 = _7405 == 1.0;
    if (_7407)
    {
        return _7393;
    }
    float _7409 = float(_7393);
    float _7411 = _7409 / _7405;
    int _7413 = int(_7411);
    return _7413;
}

static inline __attribute__((always_inline))
int _103(thread const int& _7443, thread const int& _7444, constant _10& support_buffer)
{
    float _7447 = as_type<float>(support_buffer._m4);
    int _7449 = _7444 + as_type<int>(_7447);
    int _7451 = 1 + _7449;
    float _7453 = support_buffer._m5[_7451].x;
    bool _7455 = _7453 == 1.0;
    if (_7455)
    {
        return _7443;
    }
    float _7457 = float(_7443);
    float _7459 = _7457 * _7453;
    int _7461 = int(_7459);
    return _7461;
}

static inline __attribute__((always_inline))
void _100(thread const int& _7080, thread const int& _7081, thread const int& _7082, thread const int& _7083, thread const int& _7084, thread int& _7085, thread int& _7086, thread int& _7087, thread int& _7088, thread int& _7089, thread int& _7090, thread int& _7091, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _7094 = _7084;
    int _7096 = _7080;
    int _7098 = _7081;
    int _7100 = _7082;
    float _7102 = 0.0 + as_type<float>(_7080);
    bool _7104 = _7102 != 0.0;
    bool _7106 = isnan(_7102);
    bool _7108 = _7104 || _7106;
    bool _7110 = isnan(0.0);
    bool _7112 = _7108 || _7110;
    int _7114 = _7112 ? (-1) : 0;
    if (!_7112)
    {
        float _7116 = as_type<float>(_7080) * 1.0;
        _7094 = as_type<int>(_7116);
    }
    int _7118 = _7094;
    bool _7120 = !_7112;
    int _7122 = _7118;
    int _7124 = _7118;
    if (!_7120)
    {
        bool _7126 = _7102 >= 0.0;
        bool _7128 = isnan(_7102);
        bool _7130 = _7126 || _7128;
        bool _7132 = isnan(0.0);
        bool _7134 = _7130 || _7132;
        _7114 = _7134 ? (-1) : 0;
        if (!_7134)
        {
            _7122 = 2147483647;
        }
        int _7136 = _7122;
        bool _7138 = !_7134;
        int _7140 = _7136;
        _7124 = _7136;
        if (!_7138)
        {
            float _7142 = abs(as_type<float>(_7080));
            float _7144 = 0.0 + _7142;
            bool _7146 = _7144 > as_type<float>(0x7f800000u /* inf */);
            bool _7148 = isnan(_7144);
            bool _7150 = _7146 || _7148;
            bool _7152 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _7154 = _7150 || _7152;
            _7114 = _7154 ? (-1) : 0;
            if (_7154)
            {
                float _7156 = as_type<float>(_7080) + 1.0;
                _7140 = as_type<int>(_7156);
            }
            int _7158 = _7140;
            int _7160 = _7158;
            _7124 = _7158;
            if (!_7154)
            {
                bool _7162 = _7144 != as_type<float>(0x7f800000u /* inf */);
                bool _7164 = isnan(_7144);
                bool _7166 = _7162 || _7164;
                bool _7168 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _7170 = _7166 || _7168;
                _7114 = _7170 ? (-1) : 0;
                if (!_7170)
                {
                    _7160 = _7080;
                }
                int _7172 = _7160;
                bool _7174 = !_7170;
                _7124 = _7172;
                if (!_7174)
                {
                    float _7176 = as_type<float>(_7080) * 18446744073709551616.0;
                    float _7178 = rsqrt(_7176);
                    float _7180 = _7176 * _7178;
                    float _7182 = _7178 * 0.5;
                    float _7184 = -_7180;
                    float _7186 = 0.0 + _7184;
                    float _7188 = fma(_7182, _7186, 0.5);
                    float _7190 = fma(_7180, _7188, _7180);
                    float _7192 = -_7190;
                    float _7194 = 0.0 + _7192;
                    float _7196 = fma(_7190, _7194, _7176);
                    float _7198 = fma(_7182, _7196, _7190);
                    float _7200 = _7198 * 2.3283064365386962890625e-10;
                    _7096 = as_type<int>(_7176);
                    _7098 = as_type<int>(_7190);
                    _7100 = as_type<int>(_7186);
                    _7124 = as_type<int>(_7200);
                }
            }
        }
    }
    int _7202 = _7096;
    int _7204 = _7098;
    int _7206 = _7100;
    int _7208 = _7124;
    int _7210 = _7114;
    _7085 = _7202;
    _7086 = _7083;
    _7087 = 0;
    _7088 = _7204;
    _7089 = _7206;
    _7090 = _7208;
    _7091 = _7210;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2565 = false;
    bool _1229 = false;
    bool _1035 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _111 = int(_109);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2850 = as_type<float>(_127);
        out.gl_Position.z = _2850;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2919 = as_type<float>(_165);
        out.gl_Position.z = _2919;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_55.w;
    float _169 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_53.x;
    float _183 = in.m_53.y;
    float _185 = in.m_53.z;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _189 = in.m_48.x;
    float _191 = in.m_48.y;
    float _193 = in.m_48.z;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _203 = 0.0;
    float _205 = _169;
    if (!_179)
    {
        float _207 = _169 * _169;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _215 = _187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _219 = _195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _221 = _197 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _223 = _199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _225 = _201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _227 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _229 = _211;
    if (!_179)
    {
        float _231 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_179;
    float _237 = _233;
    float _239 = _189;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _169 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _169);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _269;
    }
    float _271 = _237;
    bool _273 = !_179;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _169 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _205 = _293;
    }
    float _295 = _205;
    out.m_57.x = _215;
    out.m_57.y = _219;
    out.m_57.z = _221;
    out.m_57.w = _217;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _299 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _301 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    out.m_59.x = _223;
    out.m_59.y = _225;
    out.m_59.z = _227;
    float _303 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _305 = fma(_295, _183, _299);
    float _307 = fma(_295, _181, _301);
    float _309 = fma(_295, _185, _303);
    float _311 = fma(_305, _167, _191);
    float _313 = fma(_307, _167, _189);
    float _315 = fma(_309, _167, _193);
    bool _317 = !_297;
    float _319 = _311;
    float _337;
    if (!_317)
    {
        float _321 = in.m_61.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[14].x, _145);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _239 = _323;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_111);
        float _343 = 1.0 / _341;
        float _345 = _145 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _239;
    float _349 = _337;
    float _351 = in.m_61.x;
    float _353 = in.m_61.y;
    float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _359 = _357 != 0;
    float _361 = in.m_63.x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _365 = in.m_63.y;
    float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _373 = _371 != 0;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _377 = _271;
    int _379 = as_type<int>(_363);
    float _381 = _347;
    if (_359)
    {
        float _383 = in.m_61.x;
        _377 = _383;
    }
    float _385 = _377;
    float _387 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _389 = _353 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _391 = _353 > 0.5;
    bool _393 = _391 && _373;
    float _395 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].z, _375);
    float _397 = -_363;
    float _399 = fma(_387, 2.0, _397);
    float _401 = fma(_389, -2.0, _369);
    float _403 = _361;
    if (_359)
    {
        float _405 = -_361;
        float _407 = _405 + 1.0;
        _379 = as_type<int>(_407);
    }
    int _409 = _379;
    float _411 = _367 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _413 = -_365;
    float _415 = _413 + 1.0;
    if (!_359)
    {
        _381 = _361;
    }
    float _417 = _381;
    float _419 = -_145;
    float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[76].x, _399);
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _425 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _401);
    bool _427 = false;
    float _429 = _417;
    if (_359)
    {
        bool _431 = _385 > 0.5;
        _427 = _431;
    }
    bool _433 = _427;
    float _435 = _393 ? _415 : _365;
    bool _437 = _433;
    if (_359)
    {
        float _439 = _433 ? as_type<float>(_409) : _361;
        _429 = _439;
    }
    float _441 = _429;
    float _443 = _355 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _445 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[78].w, _423);
    float _447 = fma(_411, _435, -0.5);
    float _449 = fma(_443, _441, -0.5);
    float _451 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _395);
    float _453 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _445);
    float _455 = fma(_451, _449, _421);
    float _457 = -_425;
    float _459 = fma(_453, _447, _457);
    float _461 = _455 + 0.5;
    float _463 = _459 + 0.5;
    float2 _3421 = float2(_461, _463);
    float _465 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_3421, float2(0.0), isnan(_3421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_3421, float2(0.0), isnan(_3421)), level(0.0)).w;
    int _467 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _469 = _467;
    int _471 = 1;
    int _473 = _102(_469, _471, (*spvDescriptorSet0.support_buffer));
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _479 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _481 = isnan(_349);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _503 = 1.0 / _477;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _507 = _349 + _505;
    bool _509 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _511 = isnan(_349);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    bool _521 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _523 = isnan(_349);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _537 = 1.0 / _493;
    bool _539 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _541 = isnan(_349);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = _497 * _503;
    bool _553 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _555 = isnan(_349);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = 1.0 / _535;
    float _567 = -_563;
    float _569 = _567 + 1.0;
    float _571 = _501 * _537;
    float _573 = fma(_551, _507, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _579 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _581 = isnan(_349);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _595 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _597 = isnan(_349);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _589 * _569;
    float _609 = -_589;
    float _611 = _609 + 1.0;
    float _613 = 1.0 / _593;
    float _615 = _577 * _565;
    float _617 = -_605;
    float _619 = _617 + 1.0;
    float _621 = _605 * _611;
    float _623 = _489 * _619;
    float _625 = -_489;
    float _627 = _625 + 1.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _633 = -_519;
    float _635 = _633 + 1.0;
    float _637 = _519 * _627;
    float _639 = 1.0 / _631;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _645 = _531 * _635;
    float _647 = -_531;
    float _649 = _647 + 1.0;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _659 = -_549;
    float _661 = _659 + 1.0;
    float _663 = 1.0 / _643;
    float _665 = _549 * _649;
    float _667 = _653 * _613;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _669;
    float _673 = _573 * _665;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _677 = _349 + _675;
    float _679 = 1.0 / _657;
    float _681 = _671 * _639;
    float _683 = fma(_571, _677, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _689 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[159].x, _673);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _693 = _349 + _691;
    float _695 = _687 * _663;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _699 = _349 + _697;
    float _701 = fma(_667, _693, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _703 = fma(_683, _645, _689);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _705;
    float _709 = fma(_615, _699, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _713 = _349 + _711;
    float _715 = fma(_701, _637, _703);
    float _717 = _707 * _679;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _721 = _349 + _719;
    float _723 = fma(_681, _713, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _725 = fma(_709, _623, _715);
    bool _727 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _729 = isnan(_349);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = fma(_695, _721, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _743 = _349 + _741;
    float _745 = fma(_723, _621, _725);
    float _747 = -_737;
    float _749 = _747 + 1.0;
    float _751 = fma(_717, _743, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _753 = fma(_739, _607, _745);
    float _755 = _563 * _749;
    float _757 = in.m_63.z;
    float _759 = fma(_751, _755, _753);
    float _761 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[166].x, _759);
    float _763 = trunc(_757);
    int _765 = int(_763);
    float _767 = _465 + _351;
    float _769 = fma(_145, 0.070000000298023223876953125, _767);
    float _771 = _769 * 6.283185482025146484375;
    float _773 = _771 * 0.15915493667125701904296875;
    float _775 = _773 * 6.283185482025146484375;
    float _777 = sin(_775);
    int _779 = _473 + (-1);
    float _781 = fma(_777, 0.4000000059604644775390625, 0.60000002384185791015625);
    float _783 = float(_779);
    float _785 = _761 * _781;
    float _787 = precise::clamp(_785, 0.0, 1.0);
    float _789 = _787 * _783;
    float _791 = trunc(_789);
    int _793 = int(_791);
    int _795 = _793;
    int _797 = 1;
    int _799 = _103(_795, _797, (*spvDescriptorSet0.support_buffer));
    int _801 = _765;
    int _803 = 1;
    int _805 = _103(_801, _803, (*spvDescriptorSet0.support_buffer));
    float4 _808 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_799, _805)), 0).xyzw;
    float _810 = _808.x;
    float _812 = _808.y;
    float _814 = _808.z;
    float _816 = _808.w;
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _826 = _824 != 0;
    float _828 = in.m_61.w;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _832 = _830 != 0;
    float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _836 = _717;
    float _838 = _761;
    if (_822)
    {
        float _840 = in.m_61.z;
        _836 = _840;
    }
    float _842 = _836;
    if (!_826)
    {
        _838 = _353;
    }
    float _844 = _838;
    float _846 = _773;
    float _848 = _844;
    if (!_826)
    {
        float _850 = in.m_61.z;
        _846 = _850;
    }
    float _852 = _846;
    if (_826)
    {
        _848 = _351;
    }
    float _854 = _848;
    float _856 = _818 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _858 = as_type<int>(_818);
    if (_822)
    {
        float _860 = -_361;
        float _862 = _860 + 1.0;
        _858 = as_type<int>(_862);
    }
    int _864 = _858;
    bool _866 = _828 > 0.5;
    bool _868 = _866 && _832;
    float _870 = _868 ? _415 : _365;
    float _872 = fma(_856, _870, -0.5);
    float _874 = _854 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _876 = _828;
    if (_822)
    {
        bool _878 = _842 > 0.5;
        _437 = _878;
    }
    bool _880 = _437;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _884 = _852;
    if (!_826)
    {
        _876 = _852;
    }
    float _886 = _876;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _890 = _886;
    if (_826)
    {
        _890 = _353;
    }
    float _892 = _890;
    if (_826)
    {
        _884 = _353;
    }
    float _894 = _884;
    float _896 = -_888;
    float _898 = fma(_874, 2.0, _896);
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_822)
    {
        float _902 = _880 ? as_type<float>(_864) : _361;
        _403 = _902;
    }
    float _904 = _403;
    float _906 = -_145;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _912 = fma(_900, -2.0, _882);
    float _914 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[83].z, _910);
    float _916 = _834 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _920 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _914);
    float _922 = fma(_916, _904, -0.5);
    float _924 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[83].w, _918);
    float _926 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _912);
    float _928 = fma(_920, _922, _908);
    float _930 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _924);
    int _932 = _793 + 1;
    float _934 = _928 + 0.5;
    float _936 = -_926;
    float _938 = fma(_930, _872, _936);
    int _940 = min(_779, _932);
    float _942 = _938 + 0.5;
    uint _945 = as_type<uint>(half2(float2(_816, 0.0)));
    uint _947 = extract_bits(_945, 0u, 8u);
    int _949 = int(_947) & 255;
    uint _951 = extract_bits(_945, 8u, 8u);
    int _953 = int(_951) & 255;
    int _955 = _953 << 8;
    int _957 = _949 | _955;
    bool _959 = _957 >= 32768;
    int _961 = _957 + (-1024);
    int _963 = _961;
    if (_959)
    {
        int _965 = ~_957;
        int _967 = _965 + 33792;
        int _969 = _967 + 1;
        _963 = _969;
    }
    int _971 = _963;
    int _973 = _971 + 30719;
    float _975 = float(_973);
    float _977 = fma(_975, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _979 = abs(_977);
    float _981 = -_979;
    float _983 = _981 + 1.0;
    float _985 = abs(_977);
    float _987 = fma(_985, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _989 = _977 < 0.0;
    float _991 = float(_989);
    int _993 = as_type<int>(_983) + (-218103808);
    float _995 = abs(_977);
    float _997 = fma(_995, _987, -0.212114393711090087890625);
    bool _999 = uint(_993) >= 1920991232u;
    float _1001 = abs(_977);
    float _1003 = fma(_1001, _997, 1.570728778839111328125);
    bool _1005 = !_999;
    float _1007 = _977;
    float _1033;
    if (!_1005)
    {
        int _1009 = as_type<int>(_983);
        int _1011 = as_type<int>(_938);
        int _1013 = as_type<int>(_983);
        int _1015 = 4944;
        int _1017 = 0;
        int _1019;
        int _1021;
        int _1023;
        int _1025;
        int _1027;
        int _1029;
        int _1031;
        _100(_1009, _1011, _1013, _1015, _1017, _1019, _1021, _1023, _1025, _1027, _1029, _1031, out.gl_Position, out.gl_PointSize);
        _1033 = as_type<float>(_1029);
        _1035 = true;
    }
    else
    {
        float _1037 = rsqrt(_983);
        float _1039 = _983 * _1037;
        float _1041 = _1037 * 0.5;
        float _1043 = -_1039;
        float _1045 = 0.0 + _1043;
        float _1047 = fma(_1041, _1045, 0.5);
        float _1049 = fma(_1039, _1047, _1039);
        float _1051 = -_1049;
        float _1053 = 0.0 + _1051;
        float _1055 = fma(_1049, _1053, _983);
        float _1057 = fma(_1041, _1055, _1049);
        _1033 = _1057;
    }
    _1035 = false;
    float _1059 = _1033;
    int _1061 = _940;
    int _1063 = 1;
    int _1065 = _103(_1061, _1063, (*spvDescriptorSet0.support_buffer));
    int _1067 = _765;
    int _1069 = 1;
    int _1071 = _103(_1067, _1069, (*spvDescriptorSet0.support_buffer));
    float4 _1073 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1065, _1071)), 0).xyzw;
    float _1075 = _1073.x;
    float _1077 = _1073.y;
    float _1079 = _1073.z;
    float _1081 = _1073.w;
    float _1083 = _1003 * _1059;
    float _1085 = _991 * 2.0;
    float _1087 = floor(_789);
    float _1089 = _975 * 3.883221149444580078125;
    float _1091 = -_1085;
    float _1093 = fma(_1083, _1091, _1083);
    float _1095 = _1089 * 0.15915493667125701904296875;
    float _1097 = fma(_991, 3.1415927410125732421875, _1093);
    float _1099 = _1095 * 6.283185482025146484375;
    float _1101 = cos(_1099);
    float _1103 = _1097 * 0.15915493667125701904296875;
    float _1105 = -_1087;
    float _1107 = _789 + _1105;
    float _1109 = _1103 * 6.283185482025146484375;
    float _1111 = sin(_1109);
    float _1113 = _1095 * 6.283185482025146484375;
    float _1115 = sin(_1113);
    float _1117 = _1111 * _1101;
    float _1119 = _1111 * _1115;
    uint _1121 = as_type<uint>(half2(float2(_1081, 0.0)));
    float _1123 = -_810;
    float _1125 = _1123 + _1075;
    float _1127 = -_812;
    float _1129 = _1127 + _1077;
    float _1131 = -_814;
    float _1133 = _1131 + _1079;
    uint _1135 = extract_bits(_1121, 0u, 8u);
    int _1137 = int(_1135) & 255;
    uint _1139 = extract_bits(_1121, 8u, 8u);
    int _1141 = int(_1139) & 255;
    int _1143 = _1141 << 8;
    int _1145 = _1137 | _1143;
    float _1147 = fma(_1107, _1125, _810);
    float _1149 = fma(_1107, _1129, _812);
    float _1151 = fma(_1107, _1133, _814);
    bool _1153 = _1145 >= 32768;
    int _1155 = _1145 + (-1024);
    int _1157 = _1155;
    float _1159 = _1107;
    if (_1153)
    {
        int _1161 = ~_1145;
        int _1163 = _1161 + 33792;
        int _1165 = _1163 + 1;
        _1157 = _1165;
    }
    int _1167 = _1157;
    int _1169 = _1167 + 30719;
    float _1171 = float(_1169);
    float _1173 = fma(_1171, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1175 = abs(_1173);
    float _1177 = -_1175;
    float _1179 = _1177 + 1.0;
    float _1181 = abs(_1173);
    float _1183 = fma(_1181, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1185 = _1173 < 0.0;
    float _1187 = float(_1185);
    int _1189 = as_type<int>(_1179) + (-218103808);
    float _1191 = abs(_1173);
    float _1193 = fma(_1191, _1183, -0.212114393711090087890625);
    bool _1195 = uint(_1189) >= 1920991232u;
    float _1197 = abs(_1173);
    float _1199 = fma(_1197, _1193, 1.570728778839111328125);
    bool _1201 = !_1195;
    float _1227;
    if (!_1201)
    {
        int _1203 = as_type<int>(_1179);
        int _1205 = as_type<int>(_1129);
        int _1207 = as_type<int>(_1077);
        int _1209 = 5840;
        int _1211 = as_type<int>(_1083);
        int _1213;
        int _1215;
        int _1217;
        int _1219;
        int _1221;
        int _1223;
        int _1225;
        _100(_1203, _1205, _1207, _1209, _1211, _1213, _1215, _1217, _1219, _1221, _1223, _1225, out.gl_Position, out.gl_PointSize);
        _1227 = as_type<float>(_1223);
        _1229 = true;
    }
    else
    {
        float _1231 = rsqrt(_1179);
        float _1233 = _1179 * _1231;
        float _1235 = _1231 * 0.5;
        float _1237 = -_1233;
        float _1239 = 0.0 + _1237;
        float _1241 = fma(_1235, _1239, 0.5);
        float _1243 = fma(_1233, _1241, _1233);
        float _1245 = -_1243;
        float _1247 = 0.0 + _1245;
        float _1249 = fma(_1243, _1247, _1179);
        float _1251 = fma(_1235, _1249, _1243);
        _1227 = _1251;
    }
    _1229 = false;
    float _1253 = _1227;
    float _1255 = in.m_61.x;
    float _1257 = in.m_61.y;
    float _1259 = in.m_61.z;
    float _1261 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1263 = log2(_1261);
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1275 = _1273 != 0;
    bool _1277 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1279 = isnan(0.0);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1285 = _1281 || _1283;
    float _1287 = _1263 * _145;
    float _1289 = exp2(_1287);
    float _1291 = _1259 * 2.0;
    float _1293 = _1255 * 2.0;
    float _1295 = _1257 + _1259;
    float _1297 = _1257 * 2.0;
    float _1299 = floor(_1293);
    float _1301 = floor(_1291);
    float _1303 = _1295 + (-1.0);
    float _1305 = -_1289;
    float _1307 = _1305 + 1.0;
    float _1309 = _1285 ? _1307 : 0.0;
    float _1311 = floor(_1297);
    bool _1313 = _1299 >= 0.0;
    bool _1315 = isnan(_1299);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.0);
    bool _1321 = _1317 || _1319;
    int _1323 = _1321 ? 0 : 1;
    bool _1325 = _1301 > 0.0;
    bool _1327 = _1301 >= 0.0;
    bool _1329 = isnan(_1301);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan(0.0);
    bool _1335 = _1331 || _1333;
    float _1337 = _1257 + _1255;
    int _1339 = ~_1323;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    float _1345 = _1257 + (-0.5);
    float _1347 = _1337 + (-1.0);
    float _1349 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1351 = _1335 ? 0 : 1;
    float _1353 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1357 = 1.0 + _1355;
    int _1359 = ~_1351;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    bool _1365 = _1299 > 0.0;
    float _1367 = 1.0 / _1357;
    int _1369 = _1363;
    int _1371 = _1343;
    if (!_1325)
    {
        int _1373 = ~_1351;
        int _1375 = _1373 + 1;
        _1369 = _1375;
    }
    int _1377 = _1369;
    float _1379 = in.m_65.x;
    float _1381 = in.m_65.y;
    float _1383 = in.m_65.z;
    bool _1385 = !_1267;
    int _1387 = _1385 ? 0 : 1;
    bool _1389 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1391 = isnan(1.0);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1397 = _1393 || _1395;
    int _1399 = abs(_1387);
    bool _1401 = !_1271;
    int _1403 = _1401 ? 0 : 1;
    float _1405 = float(_1399);
    float _1407 = float(_1377);
    bool _1409 = _1311 > 0.0;
    float _1411 = _1311;
    if (!_1365)
    {
        int _1413 = ~_1323;
        int _1415 = _1413 + 1;
        _1371 = _1415;
    }
    int _1417 = _1371;
    float _1419 = _1405 * _1407;
    if (_1397)
    {
        float _1421 = _1309 * _1367;
        _149 = _1421;
    }
    float _1423 = _149;
    int _1425 = abs(_1403);
    float _1427 = _1255 + (-0.5);
    float _1429 = _1419 * (-2.0);
    bool _1431 = _1311 >= 0.0;
    bool _1433 = isnan(_1311);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan(0.0);
    bool _1439 = _1435 || _1437;
    float _1441 = _1255 + _1259;
    float _1443 = float(_1425);
    float _1445 = fma(_1429, _1379, _1379);
    float _1447 = float(_1417);
    float _1449 = fma(_1353, _1429, _1353);
    bool _1451 = !_1275;
    int _1453 = _1451 ? 0 : 1;
    float _1455 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1445);
    int _1457 = _1439 ? 0 : 1;
    float _1459 = _1443 * _1447;
    int _1461 = abs(_1453);
    float _1463 = fma(_1449, _1423, _1455);
    int _1465 = ~_1457;
    int _1467 = _1465 + 1;
    int _1469 = _1467 + 1;
    float _1471 = _1459 * (-2.0);
    int _1473 = _1469;
    if (!_1409)
    {
        int _1475 = ~_1457;
        int _1477 = _1475 + 1;
        _1473 = _1477;
    }
    int _1479 = _1473;
    float _1481 = _1441 + (-1.0);
    float _1483 = fma(_1471, _1381, _1381);
    float _1485 = float(_1479);
    float _1487 = fma(_1349, _1471, _1349);
    float _1489 = float(_1461);
    float _1491 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1483);
    float _1493 = _1259 + (-0.5);
    float _1495 = _1463 * 0.15915493667125701904296875;
    float _1497 = _1489 * _1485;
    float _1499 = fma(_1487, _1423, _1491);
    float _1501 = in.m_55.x;
    float _1503 = in.m_55.y;
    float _1505 = in.m_55.z;
    float _1507 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1509 = _1497 * (-2.0);
    float _1511 = _1499 * 0.15915493667125701904296875;
    float _1513 = _1495 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = fma(_1509, _1383, _1383);
    float _1519 = fma(_1507, _1509, _1507);
    bool _1521 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1523 = isnan(0.5);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1529 = _1525 || _1527;
    float _1531 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1517);
    float _1533 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1151);
    float _1535 = _1511 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = fma(_1519, _1423, _1531);
    float _1541 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1147);
    float _1543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1149);
    float _1545 = _1539 * 0.15915493667125701904296875;
    float _1547 = _1511 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1553 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1555 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1557 = _1545 * 6.283185482025146484375;
    float _1559 = cos(_1557);
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1563 = _1553 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1565 = _1555 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1567 = _1515 * _1537;
    float _1569 = _1541 * _1561;
    float _1571 = _1543 * _1563;
    float _1573 = _1533 * _1565;
    float _1575 = _1495 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1515 * _1549;
    float _1581 = _1545 * 6.283185482025146484375;
    float _1583 = sin(_1581);
    float _1585 = _1515 * _1559;
    float _1587 = _1549 * _1559;
    float _1589 = _1537 * _1559;
    float _1591 = _1577 * _1537;
    float _1593 = _1577 * _1549;
    float _1595 = _1577 * _1559;
    float _1597 = _1585 * _1571;
    float _1599 = _1595 * _1571;
    float _1601 = fma(_1583, _1579, _1591);
    float _1603 = fma(_1583, _1591, _1579);
    float _1605 = -_1567;
    float _1607 = fma(_1583, _1593, _1605);
    float _1609 = -_1593;
    float _1611 = fma(_1583, _1567, _1609);
    float _1613 = -_1571;
    float _1615 = _1583 * _1613;
    float _1617 = fma(_1601, _1569, _1597);
    float _1619 = _311 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1621 = fma(_1607, _1569, _1599);
    float _1623 = fma(_1587, _1569, _1615);
    float _1625 = fma(_1611, _1573, _1617);
    float _1627 = _311 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1629 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1619);
    float _1631 = fma(_1589, _1573, _1623);
    float _1633 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1635 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1627);
    float _1637 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1639 = fma(_1603, _1573, _1621);
    float _1641 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1629);
    float _1643 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1633);
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1637);
    float _1647 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1635);
    float _1649 = _1641 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1651 = fma(_1639, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1643);
    float _1653 = fma(_1639, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1645);
    float _1655 = _1647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1657 = _311 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1659 = _1649 + _1651;
    float _1661 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1663 = _1655 + _1653;
    float _1665 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1657);
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1669 = _1659 + _1667;
    float _1671 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1661);
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1675 = _1663 + _1673;
    float _1677 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1665);
    float _1679 = _1669 * _1669;
    float _1681 = fma(_1639, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1671);
    float _1683 = _1677 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1685 = fma(_1675, _1675, _1679);
    float _1687 = _1683 + _1681;
    float _1689 = sqrt(_1685);
    bool _1691 = _1689 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1693 = _1671;
    float _1695 = _1657;
    float _1697 = _1663;
    float _1699 = _1689;
    float _1701 = _1675;
    float _1703 = _1669;
    if (!_1691)
    {
        _1693 = _1663;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (!_1691)
    {
        _1695 = _1659;
    }
    float _1709 = _1695;
    float _1711 = _1709;
    if (!_1691)
    {
        _1697 = _1687;
    }
    float _1713 = _1697;
    bool _1715 = !_1691;
    float _1717 = _1713;
    if (!_1715)
    {
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1723 = _1689 + _1721;
        float _1725 = rsqrt(_1685);
        float _1727 = _1723 * _1719;
        float _1729 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1731 = _1727 * 0.15915493667125701904296875;
        float _1733 = _1731 * 6.283185482025146484375;
        float _1735 = cos(_1733);
        float _1737 = _1731 * 6.283185482025146484375;
        float _1739 = sin(_1737);
        float _1741 = _1735 + (-1.0);
        float _1743 = fma(_1739, _1729, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1745 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = _1725 * _1743;
        float _1749 = fma(_1687, _1735, _1745);
        float _1751 = fma(_1675, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1753 = fma(_1669, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1707 = _1751;
        _1717 = _1749;
        _1711 = _1753;
        _319 = _1725;
        _1699 = _1741;
    }
    float _1755 = _1707;
    float _1757 = _1717;
    float _1759 = _1711;
    float _1761 = _319;
    float _1763 = _1699;
    float _1765 = _1759;
    float _1767 = _1761;
    float _1769 = _1763;
    if (_1529)
    {
        _1701 = _1755;
    }
    float _1771 = _1701;
    float _1773 = _1771;
    if (_1529)
    {
        _1703 = _1757;
    }
    float _1775 = _1703;
    float _1777 = _1775;
    if (!_1529)
    {
        float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1781 = _1683 + _1779;
        float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1785 = _1655 + _1783;
        float _1787 = -_1655;
        float _1789 = _1787 + _1755;
        float _1791 = -_1683;
        float _1793 = _1791 + _1757;
        float _1795 = _1781 * _1781;
        float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1799 = _1649 + _1797;
        float _1801 = -_1649;
        float _1803 = _1801 + _1759;
        float _1805 = fma(_1785, _1785, _1795);
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1809 = fma(_1799, _1799, _1805);
        float _1811 = sqrt(_1809);
        float _1813 = precise::min(_1811, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1815 = _1813 * _1807;
        float _1817 = fma(_1789, _1815, _1655);
        float _1819 = fma(_1793, _1815, _1683);
        float _1821 = fma(_1803, _1815, _1649);
        _1777 = _1819;
        _1773 = _1817;
        _1765 = _1821;
        _1767 = _1815;
        _1769 = _1811;
    }
    float _1823 = _1777;
    float _1825 = _1773;
    float _1827 = _1765;
    float _1829 = _1767;
    float _1831 = _1769;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1835 = _1823 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1839 = _1825 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = _1827 + _1841;
    float _1845 = _1835 * _1835;
    float _1847 = fma(_1839, _1839, _1845);
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = rsqrt(_1849);
    float _1853 = sqrt(_1849);
    float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1857 = _1839 * _1855;
    float _1859 = _1843 * _1855;
    float _1861 = _1857 * _1857;
    float _1863 = _1859 * _1859;
    float _1865 = _1861 + _1863;
    float _1867 = sqrt(_1865);
    bool _1869 = _1867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1873 = _1867 + _1871;
    float _1875 = _1843;
    float _1877 = _1831;
    float _1879 = _1873;
    float _1881 = _1829;
    float _1883 = _1835;
    if (_1869)
    {
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1875 = _1885;
    }
    float _1887 = _1875;
    if (_1869)
    {
        float _1889 = rsqrt(_1865);
        _1877 = _1889;
    }
    float _1891 = _1877;
    float _1893 = _1891;
    if (_1869)
    {
        float _1895 = _1873 * _1887;
        _1879 = _1895;
    }
    float _1897 = _1879;
    if (_1869)
    {
        float _1899 = _1897 * 0.15915493667125701904296875;
        _1881 = _1899;
    }
    float _1901 = _1881;
    float _1903 = _1845;
    if (_1869)
    {
        float _1905 = _1901 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        _1903 = _1907;
    }
    float _1909 = _1903;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1913 = precise::max(0.0, _1911);
    float _1915 = _1851;
    float _1917 = _1913;
    float _1919 = _1911;
    if (_1869)
    {
        float _1921 = _1901 * 6.283185482025146484375;
        float _1923 = cos(_1921);
        _1915 = _1923;
    }
    float _1925 = _1915;
    float _1927 = -_1855;
    float _1929 = -_1913;
    float _1931 = fma(_1835, _1927, _1929);
    if (!_1869)
    {
        _1917 = _1857;
    }
    float _1933 = _1917;
    float _1935 = _1933;
    if (_1869)
    {
        float _1937 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1937;
    }
    float _1939 = _1919;
    float _1941 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1943 = _1909;
    float _1945 = _1939;
    if (_1869)
    {
        float _1947 = fma(_1909, _1939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1883 = _1947;
    }
    float _1949 = _1883;
    float _1951 = _1949;
    if (!_1869)
    {
        _1943 = _1861;
    }
    float _1953 = _1943;
    float _1955 = _1953;
    float _1957 = _1925;
    if (_1869)
    {
        float _1959 = _1925 + (-1.0);
        _1945 = _1959;
    }
    float _1961 = _1945;
    float _1963 = _1961;
    if (_1869)
    {
        float _1965 = _1891 * _1949;
        _1411 = _1965;
    }
    float _1967 = _1411;
    if (!_1869)
    {
        _1951 = _1931;
    }
    float _1969 = _1951;
    float _1971 = _1969;
    if (_1869)
    {
        float _1973 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1893 = _1973;
    }
    float _1975 = _1893;
    if (_1869)
    {
        float _1977 = _1857 * _1967;
        _1935 = _1977;
    }
    float _1979 = _1935;
    if (!_1869)
    {
        _1963 = _1859;
    }
    float _1981 = _1963;
    float _1983 = _1981;
    if (_1869)
    {
        float _1985 = _1859 * _1967;
        _1983 = _1985;
    }
    float _1987 = _1983;
    if (_1869)
    {
        float _1989 = fma(_1931, _1925, _1975);
        _1971 = _1989;
    }
    float _1991 = _1971;
    if (_1869)
    {
        float _1993 = _1979 * _1979;
        _1955 = _1993;
    }
    float _1995 = _1955;
    if (!_1869)
    {
        _1957 = _1863;
    }
    float _1997 = _1957;
    float _1999 = _1997;
    if (_1869)
    {
        float _2001 = _1987 * _1987;
        _1999 = _2001;
    }
    float _2003 = _1999;
    float _2005 = fma(_1991, _1991, _1995);
    float _2007 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2009 = _2005 + _2003;
    float _2011 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1941);
    float _2013 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2017 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2015);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2023 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2011);
    float _2025 = rsqrt(_2009);
    float _2027 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2029 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2013);
    float _2031 = -_2019;
    float _2033 = _2031 + 1.0;
    float _2035 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2021);
    float _2037 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2027);
    float _2039 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2029);
    float _2041 = _2023 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2043 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2035);
    float _2045 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2037);
    float _2047 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2049 = abs(_2033);
    float _2051 = log2(_2049);
    float _2053 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2055 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2057 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2059 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2061 = _2025 * _1979;
    float _2063 = _2025 * _1991;
    float _2065 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2057);
    float _2067 = _2025 * _1987;
    float _2069 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2071 = -_2059;
    float _2073 = fma(_2071, _2007, 1.0);
    float _2075 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2065);
    float _2077 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2079 = -_2069;
    float _2081 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2079);
    float _2083 = log2(_2073);
    float _2085 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2075);
    float _2087 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2089 = -_2067;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2081);
    float _2093 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2095 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2077);
    float _2097 = fma(_2091, -0.5, 0.5);
    float _2099 = 1.0 / _2085;
    float _2101 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2093);
    float _2103 = fma(_2091, 0.5, 0.5);
    float _2105 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2095);
    float _2107 = _2063 + 1.0;
    float _2109 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2101);
    float _2111 = fma(_2103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2113 = exp2(_2087);
    float _2115 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2109);
    float _2117 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2105);
    float _2119 = _2083 * 0.693147182464599609375;
    float _2121 = fma(_2103, _2111, -0.212114393711090087890625);
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2125 = sqrt(_2097);
    float _2127 = _2115 * _2099;
    float _2129 = _2117 * _2099;
    float _2131 = fma(_2103, _2121, 1.570728778839111328125);
    float _2133 = fma(_2127, 0.5, 0.5);
    float _2135 = fma(_2129, -0.5, 0.5);
    float _2137 = -_2063;
    float _2139 = fma(_2113, _2107, _2137);
    float3 _5871 = float3(_2133, _2135, _2123);
    float _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5871, float3(0.0), isnan(_5871)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5871, float3(0.0), isnan(_5871)), level(0.0)).x;
    float _2143 = fma(_2139, 0.5, 0.5);
    float _2145 = _2125 * 0.636619746685028076171875;
    float _2147 = -_2131;
    float _2149 = fma(_2145, _2147, 1.0);
    float3 _5892 = float3(_2133, _2135, _2123);
    float4 _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5892, float3(0.0), isnan(_5892)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5892, float3(0.0), isnan(_5892)), level(0.0)).xyzw;
    float _2153 = _2151.x;
    float _2155 = _2151.y;
    float _2157 = _2151.z;
    float _2159 = _2151.w;
    float2 _5908 = float2(_2149, _2143);
    float3 _2163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5908, float2(0.0), isnan(_5908)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5908, float2(0.0), isnan(_5908)), level(0.0)).xyz;
    float _2165 = _2163.x;
    float _2167 = _2163.y;
    float _2169 = _2163.z;
    float _2171 = _1199 * _1253;
    float _2173 = _1187 * 2.0;
    float _2175 = _1171 * 3.883221149444580078125;
    bool _2177 = _1149 != 0.0;
    bool _2179 = isnan(_1149);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(0.0);
    bool _2185 = _2181 || _2183;
    float _2187 = -_977;
    float _2189 = _2187 + _1173;
    float _2191 = -_2173;
    float _2193 = fma(_2171, _2191, _2171);
    float _2195 = _2175 * 0.15915493667125701904296875;
    bool _2197 = _1147 == 0.0;
    bool _2199 = !_2185;
    bool _2201 = _2197 && _2199;
    float _2203 = fma(_1107, _2189, _977);
    float _2205 = fma(_1187, 3.1415927410125732421875, _2193);
    float _2207 = _2195 * 6.283185482025146484375;
    float _2209 = cos(_2207);
    float _2211 = in.m_67.x;
    float _2213 = in.m_67.y;
    float _2215 = in.m_67.z;
    float _2217 = in.m_67.w;
    bool _2219 = _1151 == 0.0;
    bool _2221 = _2219 && _2201;
    float _2223 = _2205 * 0.15915493667125701904296875;
    float _2225 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_69.z = _934;
    out.m_69.w = _942;
    float _2227 = _2195 * 6.283185482025146484375;
    float _2229 = sin(_2227);
    out.m_71.x = _1825;
    out.m_71.y = _1823;
    out.m_71.z = _1827;
    float _2231 = _2085;
    float _2233 = _2117;
    if (_2221)
    {
        _1007 = _2203;
    }
    float _2235 = _1007;
    float _2237 = _2223 * 6.283185482025146484375;
    float _2239 = sin(_2237);
    float _2241 = _2235;
    if (!_2221)
    {
        float _2243 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2203);
        _2241 = _2243;
    }
    float _2245 = _2241;
    float _2247 = exp2(_2225);
    float _2249 = -_1117;
    float _2251 = fma(_2239, _2209, _2249);
    float _2253 = -_1119;
    float _2255 = fma(_2239, _2229, _2253);
    float _2257 = _2203 * _2211;
    float _2259 = fma(_1107, _2251, _1117);
    float _2261 = fma(_1107, _2255, _1119);
    float _2263 = _2259 * _2215;
    float _2265 = _2261 * _2213;
    float _2267 = -_2257;
    float _2269 = fma(_2259, _2213, _2267);
    float _2271 = -_2245;
    float _2273 = _1583 * _2271;
    float _2275 = -_2263;
    float _2277 = fma(_2261, _2211, _2275);
    float _2279 = -_2265;
    float _2281 = fma(_2203, _2215, _2279);
    float _2283 = _2269 * _2217;
    float _2285 = -_2213;
    float _2287 = _1583 * _2285;
    float _2289 = _2277 * _2217;
    float _2291 = _2281 * _2217;
    float _2293 = _1585 * _2213;
    float _2295 = _1595 * _2245;
    float _2297 = -_2289;
    float _2299 = _1583 * _2297;
    float _2301 = _1585 * _2245;
    float _2303 = _1595 * _2213;
    float _2305 = _1585 * _2289;
    float _2307 = _1595 * _2289;
    float _2309 = fma(_1601, _2211, _2293);
    float _2311 = fma(_1587, _2211, _2287);
    float _2313 = _2259;
    if (!_2221)
    {
        float _2315 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2259);
        _2313 = _2315;
    }
    float _2317 = _2313;
    float _2319 = fma(_1587, _2291, _2299);
    float _2321 = fma(_1607, _2211, _2303);
    float _2323 = fma(_1601, _2291, _2305);
    float _2325 = fma(_1607, _2291, _2307);
    float _2327 = fma(_1611, _2215, _2309);
    if (_2221)
    {
        _1159 = _2261;
    }
    float _2329 = _1159;
    float _2331 = fma(_1589, _2215, _2311);
    float _2333 = _2329;
    if (!_2221)
    {
        float _2335 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2261);
        _2333 = _2335;
    }
    float _2337 = _2333;
    float _2339 = fma(_1587, _2317, _2273);
    float _2341 = fma(_1603, _2215, _2321);
    float _2343 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2345 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2347 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2349 = fma(_1601, _2317, _2301);
    float _2351 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2353 = fma(_1589, _2337, _2339);
    float _2355 = fma(_1611, _2283, _2323);
    float _2357 = fma(_1589, _2283, _2319);
    float _2359 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2343);
    float _2361 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2345);
    float _2363 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2347);
    float _2365 = fma(_1611, _2337, _2349);
    float _2367 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2351);
    float _2369 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2371 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2373 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2375 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2377 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2379 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2381 = fma(_1603, _2283, _2325);
    float _2383 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2369);
    float _2385 = -_2247;
    float _2387 = _2385 + 1.0;
    float _2389 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2373);
    float _2391 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2375);
    float _2393 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2377);
    float _2395 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2371);
    float _2397 = fma(_2381, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2383);
    float _2399 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2379);
    float _2401 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2403 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2359);
    float _2405 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2361);
    float _2407 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2363);
    float _2409 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2367);
    float _2411 = fma(_1607, _2317, _2295);
    float _2413 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2403);
    float _2415 = fma(_2381, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2395);
    out.m_73.x = _2405;
    out.m_73.y = _2407;
    out.m_73.z = _2409;
    float _2417 = fma(_1603, _2337, _2411);
    float _2419 = _2413 + _2085;
    float _2421 = fma(_2381, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2399);
    float _2423 = fma(_2417, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2389);
    float _2425 = _2419 * 0.5;
    float _2427 = fma(_2417, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2391);
    float _2429 = fma(_2417, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2393);
    out.m_75.x = _2397;
    out.m_75.y = _2415;
    out.m_75.z = _2421;
    bool _2431 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2433 = isnan(_1853);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2439 = _2435 || _2437;
    float _2441 = -_2401;
    float _2443 = _2441 + 1.0;
    out.m_77.z = _2425;
    out.m_77.w = _2085;
    out.m_79.x = _2423;
    out.m_79.y = _2427;
    out.m_79.z = _2429;
    out.gl_Position.x = _2115;
    out.gl_Position.y = _2117;
    out.gl_Position.z = _2413;
    out.gl_Position.w = _2085;
    float _2445 = _2407;
    float _2447 = _2413;
    float _2449 = _2115;
    float _2451 = _2443;
    if (!_2439)
    {
        _2445 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2453 = _2445;
    float _2455 = _2453;
    float _2457 = _2453;
    if (!_2439)
    {
        _2231 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2459 = _2231;
    float _2461 = _2459;
    float _2463 = _2459;
    if (!_2439)
    {
        _2447 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2465 = _2447;
    float _2467 = _2465;
    float _2469 = _2465;
    if (!_2439)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2471 = _2233;
    float _2473 = _2471;
    float _2475 = _2471;
    if (!_2439)
    {
        _2449 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2477 = _2449;
    float _2479 = _2401 * _2141;
    float _2481 = _2159 * _2479;
    float _2483 = _2159 * _2443;
    float _2485 = _2477;
    float _2487 = _2477;
    if (!_2439)
    {
        _2451 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2489 = _2451;
    float _2491 = _2169 * _2479;
    float _2493 = fma(_2165, _2481, _2153);
    float _2495 = fma(_2167, _2481, _2155);
    float _2497 = fma(_2159, _2491, _2157);
    out.m_81.x = _2493;
    out.m_81.y = _2495;
    out.m_81.z = _2497;
    out.m_81.w = _2483;
    bool _2499 = !_2439;
    float _2501 = _2489;
    float _2503 = _2489;
    if (!_2499)
    {
        bool _2505 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2507 = isnan(_1853);
        bool _2509 = _2505 || _2507;
        bool _2511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2513 = _2509 || _2511;
        if (!_2513)
        {
            float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2517 = _1853 + _2515;
            float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2521 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2519;
            float _2523 = 1.0 / _2521;
            float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2545 = _2517 * _2523;
            float _2547 = precise::clamp(_2545, 0.0, 1.0);
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2553 = fma(_2547, _2531, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2555 = fma(_2547, _2551, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2557 = fma(_2547, _2527, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2559 = fma(_2547, _2535, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2561 = fma(_2547, _2539, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2563 = fma(_2547, _2543, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2475 = _2557;
            _2503 = _2561;
            _2469 = _2555;
            _2457 = _2559;
            _2487 = _2553;
            _2463 = _2563;
            _2565 = true;
        }
        else
        {
            bool _2567 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2569 = isnan(_1853);
            bool _2571 = _2567 || _2569;
            bool _2573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2575 = _2571 || _2573;
            if (!_2575)
            {
                _2455 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2577 = _2455;
            _2457 = _2577;
            if (!_2575)
            {
                _2501 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2579 = _2501;
            _2503 = _2579;
            if (!_2575)
            {
                _2461 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2581 = _2461;
            _2463 = _2581;
            if (!_2575)
            {
                _2467 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2583 = _2467;
            _2469 = _2583;
            if (!_2575)
            {
                _2473 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2585 = _2473;
            _2475 = _2585;
            if (!_2575)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2587 = _2485;
            bool _2589 = !_2575;
            _2487 = _2587;
            if (!_2589)
            {
                bool _2591 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2593 = isnan(_1853);
                bool _2595 = _2591 || _2593;
                bool _2597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2599 = _2595 || _2597;
                if (!_2599)
                {
                    float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2603 = _1853 + _2601;
                    float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2607 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2605;
                    float _2609 = 1.0 / _2607;
                    float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2631 = _2603 * _2609;
                    float _2633 = precise::clamp(_2631, 0.0, 1.0);
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2639 = fma(_2633, _2617, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2641 = fma(_2633, _2637, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2643 = fma(_2633, _2613, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2645 = fma(_2633, _2621, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2647 = fma(_2633, _2625, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2649 = fma(_2633, _2629, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2475 = _2643;
                    _2503 = _2647;
                    _2469 = _2641;
                    _2457 = _2645;
                    _2487 = _2639;
                    _2463 = _2649;
                    _2565 = true;
                }
                else
                {
                    _2475 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2503 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2469 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2457 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2463 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2565 = false;
    float _2651 = _2475;
    float _2653 = _2503;
    float _2655 = _2469;
    float _2657 = _2457;
    float _2659 = _2487;
    float _2661 = _2463;
    float _2663 = fma(_2427, -0.5, 0.5);
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = -_2651;
    float _2669 = _2653 + _2667;
    float _2671 = -_2655;
    float _2673 = _2657 + _2671;
    float _2675 = -_2659;
    float _2677 = _2661 + _2675;
    bool _2679 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2681 = fma(_2665, _2669, _2651);
    float _2683 = fma(_2665, _2673, _2655);
    float _2685 = fma(_2665, _2677, _2659);
    float _2687 = _2681 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2689 = fma(_2683, 0.298911988735198974609375, _2687);
    float _2691 = fma(_2685, 0.114477999508380889892578125, _2689);
    out.m_83.x = 0.0;
    float _2693 = -_2691;
    float _2695 = _2683 + _2693;
    float _2697 = -_2691;
    float _2699 = _2681 + _2697;
    float _2701 = -_2691;
    float _2703 = _2685 + _2701;
    float _2705 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2707 = fma(_2695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2691);
    float _2709 = fma(_2699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2691);
    float _2711 = fma(_2703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2691);
    out.m_85.w = _2705;
    out.m_87.x = _2707;
    out.m_87.y = _2709;
    out.m_87.z = _2711;
    if (!_2679)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2713 = -_1823;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2717 = -_1825;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2721 = -_1827;
    float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2725 = _2715 * _2715;
    float _2727 = fma(_2719, _2719, _2725);
    float _2729 = fma(_2723, _2723, _2727);
    float _2731 = sqrt(_2729);
    float _2733 = rsqrt(_2729);
    float _2735 = -_2731;
    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2739 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    float _2743 = _2719 * _2733;
    float _2745 = _2715 * _2733;
    float _2747 = abs(_2741);
    float _2749 = log2(_2747);
    float _2751 = _2723 * _2733;
    float _2753 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2755 = _2427 * _2745;
    float _2757 = -_2745;
    float _2759 = -_2753;
    float _2761 = fma(_2757, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2759);
    float _2763 = fma(_2423, _2743, _2755);
    float _2765 = -_2751;
    float _2767 = fma(_2765, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2761);
    float _2769 = fma(_2429, _2751, _2763);
    float _2771 = precise::clamp(_2769, 0.0, 1.0);
    float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2775 = _2767 + _2773;
    float _2777 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2779 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2781 = precise::clamp(_2779, 0.0, 1.0);
    float _2783 = exp2(_2777);
    float _2785 = _2783 * _2781;
    float _2787 = _2771 * _2785;
    float _2789 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2791 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2793 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _2789;
    out.m_83.y = _2791;
    out.m_83.z = _2793;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2565 = false;
    bool _1229 = false;
    bool _1035 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _111 = int(_109);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2850 = as_type<float>(_127);
        out.gl_Position.z = _2850;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2919 = as_type<float>(_165);
        out.gl_Position.z = _2919;
    }
    if (_159)
    {
        return out;
    }
    float _167 = in.m_55.w;
    float _169 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_53.x;
    float _183 = in.m_53.y;
    float _185 = in.m_53.z;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _189 = in.m_48.x;
    float _191 = in.m_48.y;
    float _193 = in.m_48.z;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _203 = 0.0;
    float _205 = _169;
    if (!_179)
    {
        float _207 = _169 * _169;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _215 = _187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _219 = _195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _221 = _197 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _223 = _199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _225 = _201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _227 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _229 = _211;
    if (!_179)
    {
        float _231 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_179;
    float _237 = _233;
    float _239 = _189;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _169 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _169);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _269;
    }
    float _271 = _237;
    bool _273 = !_179;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _169 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _205 = _293;
    }
    float _295 = _205;
    out.m_57.x = _215;
    out.m_57.y = _219;
    out.m_57.z = _221;
    out.m_57.w = _217;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _299 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _301 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    out.m_59.x = _223;
    out.m_59.y = _225;
    out.m_59.z = _227;
    float _303 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _305 = fma(_295, _183, _299);
    float _307 = fma(_295, _181, _301);
    float _309 = fma(_295, _185, _303);
    float _311 = fma(_305, _167, _191);
    float _313 = fma(_307, _167, _189);
    float _315 = fma(_309, _167, _193);
    bool _317 = !_297;
    float _319 = _311;
    float _337;
    if (!_317)
    {
        float _321 = in.m_61.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[14].x, _145);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _239 = _323;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_111);
        float _343 = 1.0 / _341;
        float _345 = _145 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _239;
    float _349 = _337;
    float _351 = in.m_61.x;
    float _353 = in.m_61.y;
    float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _359 = _357 != 0;
    float _361 = in.m_63.x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _365 = in.m_63.y;
    float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _373 = _371 != 0;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _377 = _271;
    int _379 = as_type<int>(_363);
    float _381 = _347;
    if (_359)
    {
        float _383 = in.m_61.x;
        _377 = _383;
    }
    float _385 = _377;
    float _387 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _389 = _353 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _391 = _353 > 0.5;
    bool _393 = _391 && _373;
    float _395 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].z, _375);
    float _397 = -_363;
    float _399 = fma(_387, 2.0, _397);
    float _401 = fma(_389, -2.0, _369);
    float _403 = _361;
    if (_359)
    {
        float _405 = -_361;
        float _407 = _405 + 1.0;
        _379 = as_type<int>(_407);
    }
    int _409 = _379;
    float _411 = _367 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _413 = -_365;
    float _415 = _413 + 1.0;
    if (!_359)
    {
        _381 = _361;
    }
    float _417 = _381;
    float _419 = -_145;
    float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[76].x, _399);
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _425 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _401);
    bool _427 = false;
    float _429 = _417;
    if (_359)
    {
        bool _431 = _385 > 0.5;
        _427 = _431;
    }
    bool _433 = _427;
    float _435 = _393 ? _415 : _365;
    bool _437 = _433;
    if (_359)
    {
        float _439 = _433 ? as_type<float>(_409) : _361;
        _429 = _439;
    }
    float _441 = _429;
    float _443 = _355 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _445 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[78].w, _423);
    float _447 = fma(_411, _435, -0.5);
    float _449 = fma(_443, _441, -0.5);
    float _451 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _395);
    float _453 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _445);
    float _455 = fma(_451, _449, _421);
    float _457 = -_425;
    float _459 = fma(_453, _447, _457);
    float _461 = _455 + 0.5;
    float _463 = _459 + 0.5;
    float2 _3421 = float2(_461, _463);
    float _465 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_3421, float2(0.0), isnan(_3421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_3421, float2(0.0), isnan(_3421)), level(0.0)).w;
    int _467 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _469 = _467;
    int _471 = 1;
    int _473 = _102(_469, _471, (*spvDescriptorSet0.support_buffer));
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _479 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _481 = isnan(_349);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _503 = 1.0 / _477;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _507 = _349 + _505;
    bool _509 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _511 = isnan(_349);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    bool _521 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _523 = isnan(_349);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _537 = 1.0 / _493;
    bool _539 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _541 = isnan(_349);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = _497 * _503;
    bool _553 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _555 = isnan(_349);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = 1.0 / _535;
    float _567 = -_563;
    float _569 = _567 + 1.0;
    float _571 = _501 * _537;
    float _573 = fma(_551, _507, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _579 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _581 = isnan(_349);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _595 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _597 = isnan(_349);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _589 * _569;
    float _609 = -_589;
    float _611 = _609 + 1.0;
    float _613 = 1.0 / _593;
    float _615 = _577 * _565;
    float _617 = -_605;
    float _619 = _617 + 1.0;
    float _621 = _605 * _611;
    float _623 = _489 * _619;
    float _625 = -_489;
    float _627 = _625 + 1.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _633 = -_519;
    float _635 = _633 + 1.0;
    float _637 = _519 * _627;
    float _639 = 1.0 / _631;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _645 = _531 * _635;
    float _647 = -_531;
    float _649 = _647 + 1.0;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _659 = -_549;
    float _661 = _659 + 1.0;
    float _663 = 1.0 / _643;
    float _665 = _549 * _649;
    float _667 = _653 * _613;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _669;
    float _673 = _573 * _665;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _677 = _349 + _675;
    float _679 = 1.0 / _657;
    float _681 = _671 * _639;
    float _683 = fma(_571, _677, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _689 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[159].x, _673);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _693 = _349 + _691;
    float _695 = _687 * _663;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _699 = _349 + _697;
    float _701 = fma(_667, _693, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _703 = fma(_683, _645, _689);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _705;
    float _709 = fma(_615, _699, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _713 = _349 + _711;
    float _715 = fma(_701, _637, _703);
    float _717 = _707 * _679;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _721 = _349 + _719;
    float _723 = fma(_681, _713, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _725 = fma(_709, _623, _715);
    bool _727 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _729 = isnan(_349);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = fma(_695, _721, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _743 = _349 + _741;
    float _745 = fma(_723, _621, _725);
    float _747 = -_737;
    float _749 = _747 + 1.0;
    float _751 = fma(_717, _743, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _753 = fma(_739, _607, _745);
    float _755 = _563 * _749;
    float _757 = in.m_63.z;
    float _759 = fma(_751, _755, _753);
    float _761 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[166].x, _759);
    float _763 = trunc(_757);
    int _765 = int(_763);
    float _767 = _465 + _351;
    float _769 = fma(_145, 0.070000000298023223876953125, _767);
    float _771 = _769 * 6.283185482025146484375;
    float _773 = _771 * 0.15915493667125701904296875;
    float _775 = _773 * 6.283185482025146484375;
    float _777 = sin(_775);
    int _779 = _473 + (-1);
    float _781 = fma(_777, 0.4000000059604644775390625, 0.60000002384185791015625);
    float _783 = float(_779);
    float _785 = _761 * _781;
    float _787 = precise::clamp(_785, 0.0, 1.0);
    float _789 = _787 * _783;
    float _791 = trunc(_789);
    int _793 = int(_791);
    int _795 = _793;
    int _797 = 1;
    int _799 = _103(_795, _797, (*spvDescriptorSet0.support_buffer));
    int _801 = _765;
    int _803 = 1;
    int _805 = _103(_801, _803, (*spvDescriptorSet0.support_buffer));
    float4 _808 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_799, _805)), 0).xyzw;
    float _810 = _808.x;
    float _812 = _808.y;
    float _814 = _808.z;
    float _816 = _808.w;
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _826 = _824 != 0;
    float _828 = in.m_61.w;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _832 = _830 != 0;
    float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _836 = _717;
    float _838 = _761;
    if (_822)
    {
        float _840 = in.m_61.z;
        _836 = _840;
    }
    float _842 = _836;
    if (!_826)
    {
        _838 = _353;
    }
    float _844 = _838;
    float _846 = _773;
    float _848 = _844;
    if (!_826)
    {
        float _850 = in.m_61.z;
        _846 = _850;
    }
    float _852 = _846;
    if (_826)
    {
        _848 = _351;
    }
    float _854 = _848;
    float _856 = _818 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _858 = as_type<int>(_818);
    if (_822)
    {
        float _860 = -_361;
        float _862 = _860 + 1.0;
        _858 = as_type<int>(_862);
    }
    int _864 = _858;
    bool _866 = _828 > 0.5;
    bool _868 = _866 && _832;
    float _870 = _868 ? _415 : _365;
    float _872 = fma(_856, _870, -0.5);
    float _874 = _854 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _876 = _828;
    if (_822)
    {
        bool _878 = _842 > 0.5;
        _437 = _878;
    }
    bool _880 = _437;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _884 = _852;
    if (!_826)
    {
        _876 = _852;
    }
    float _886 = _876;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _890 = _886;
    if (_826)
    {
        _890 = _353;
    }
    float _892 = _890;
    if (_826)
    {
        _884 = _353;
    }
    float _894 = _884;
    float _896 = -_888;
    float _898 = fma(_874, 2.0, _896);
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_822)
    {
        float _902 = _880 ? as_type<float>(_864) : _361;
        _403 = _902;
    }
    float _904 = _403;
    float _906 = -_145;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _912 = fma(_900, -2.0, _882);
    float _914 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[83].z, _910);
    float _916 = _834 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _920 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _914);
    float _922 = fma(_916, _904, -0.5);
    float _924 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[83].w, _918);
    float _926 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _912);
    float _928 = fma(_920, _922, _908);
    float _930 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _924);
    int _932 = _793 + 1;
    float _934 = _928 + 0.5;
    float _936 = -_926;
    float _938 = fma(_930, _872, _936);
    int _940 = min(_779, _932);
    float _942 = _938 + 0.5;
    uint _945 = as_type<uint>(half2(float2(_816, 0.0)));
    uint _947 = extract_bits(_945, 0u, 8u);
    int _949 = int(_947) & 255;
    uint _951 = extract_bits(_945, 8u, 8u);
    int _953 = int(_951) & 255;
    int _955 = _953 << 8;
    int _957 = _949 | _955;
    bool _959 = _957 >= 32768;
    int _961 = _957 + (-1024);
    int _963 = _961;
    if (_959)
    {
        int _965 = ~_957;
        int _967 = _965 + 33792;
        int _969 = _967 + 1;
        _963 = _969;
    }
    int _971 = _963;
    int _973 = _971 + 30719;
    float _975 = float(_973);
    float _977 = fma(_975, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _979 = abs(_977);
    float _981 = -_979;
    float _983 = _981 + 1.0;
    float _985 = abs(_977);
    float _987 = fma(_985, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _989 = _977 < 0.0;
    float _991 = float(_989);
    int _993 = as_type<int>(_983) + (-218103808);
    float _995 = abs(_977);
    float _997 = fma(_995, _987, -0.212114393711090087890625);
    bool _999 = uint(_993) >= 1920991232u;
    float _1001 = abs(_977);
    float _1003 = fma(_1001, _997, 1.570728778839111328125);
    bool _1005 = !_999;
    float _1007 = _977;
    float _1033;
    if (!_1005)
    {
        int _1009 = as_type<int>(_983);
        int _1011 = as_type<int>(_938);
        int _1013 = as_type<int>(_983);
        int _1015 = 4944;
        int _1017 = 0;
        int _1019;
        int _1021;
        int _1023;
        int _1025;
        int _1027;
        int _1029;
        int _1031;
        _100(_1009, _1011, _1013, _1015, _1017, _1019, _1021, _1023, _1025, _1027, _1029, _1031, out.gl_Position, out.gl_PointSize);
        _1033 = as_type<float>(_1029);
        _1035 = true;
    }
    else
    {
        float _1037 = rsqrt(_983);
        float _1039 = _983 * _1037;
        float _1041 = _1037 * 0.5;
        float _1043 = -_1039;
        float _1045 = 0.0 + _1043;
        float _1047 = fma(_1041, _1045, 0.5);
        float _1049 = fma(_1039, _1047, _1039);
        float _1051 = -_1049;
        float _1053 = 0.0 + _1051;
        float _1055 = fma(_1049, _1053, _983);
        float _1057 = fma(_1041, _1055, _1049);
        _1033 = _1057;
    }
    _1035 = false;
    float _1059 = _1033;
    int _1061 = _940;
    int _1063 = 1;
    int _1065 = _103(_1061, _1063, (*spvDescriptorSet0.support_buffer));
    int _1067 = _765;
    int _1069 = 1;
    int _1071 = _103(_1067, _1069, (*spvDescriptorSet0.support_buffer));
    float4 _1073 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1065, _1071)), 0).xyzw;
    float _1075 = _1073.x;
    float _1077 = _1073.y;
    float _1079 = _1073.z;
    float _1081 = _1073.w;
    float _1083 = _1003 * _1059;
    float _1085 = _991 * 2.0;
    float _1087 = floor(_789);
    float _1089 = _975 * 3.883221149444580078125;
    float _1091 = -_1085;
    float _1093 = fma(_1083, _1091, _1083);
    float _1095 = _1089 * 0.15915493667125701904296875;
    float _1097 = fma(_991, 3.1415927410125732421875, _1093);
    float _1099 = _1095 * 6.283185482025146484375;
    float _1101 = cos(_1099);
    float _1103 = _1097 * 0.15915493667125701904296875;
    float _1105 = -_1087;
    float _1107 = _789 + _1105;
    float _1109 = _1103 * 6.283185482025146484375;
    float _1111 = sin(_1109);
    float _1113 = _1095 * 6.283185482025146484375;
    float _1115 = sin(_1113);
    float _1117 = _1111 * _1101;
    float _1119 = _1111 * _1115;
    uint _1121 = as_type<uint>(half2(float2(_1081, 0.0)));
    float _1123 = -_810;
    float _1125 = _1123 + _1075;
    float _1127 = -_812;
    float _1129 = _1127 + _1077;
    float _1131 = -_814;
    float _1133 = _1131 + _1079;
    uint _1135 = extract_bits(_1121, 0u, 8u);
    int _1137 = int(_1135) & 255;
    uint _1139 = extract_bits(_1121, 8u, 8u);
    int _1141 = int(_1139) & 255;
    int _1143 = _1141 << 8;
    int _1145 = _1137 | _1143;
    float _1147 = fma(_1107, _1125, _810);
    float _1149 = fma(_1107, _1129, _812);
    float _1151 = fma(_1107, _1133, _814);
    bool _1153 = _1145 >= 32768;
    int _1155 = _1145 + (-1024);
    int _1157 = _1155;
    float _1159 = _1107;
    if (_1153)
    {
        int _1161 = ~_1145;
        int _1163 = _1161 + 33792;
        int _1165 = _1163 + 1;
        _1157 = _1165;
    }
    int _1167 = _1157;
    int _1169 = _1167 + 30719;
    float _1171 = float(_1169);
    float _1173 = fma(_1171, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1175 = abs(_1173);
    float _1177 = -_1175;
    float _1179 = _1177 + 1.0;
    float _1181 = abs(_1173);
    float _1183 = fma(_1181, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1185 = _1173 < 0.0;
    float _1187 = float(_1185);
    int _1189 = as_type<int>(_1179) + (-218103808);
    float _1191 = abs(_1173);
    float _1193 = fma(_1191, _1183, -0.212114393711090087890625);
    bool _1195 = uint(_1189) >= 1920991232u;
    float _1197 = abs(_1173);
    float _1199 = fma(_1197, _1193, 1.570728778839111328125);
    bool _1201 = !_1195;
    float _1227;
    if (!_1201)
    {
        int _1203 = as_type<int>(_1179);
        int _1205 = as_type<int>(_1129);
        int _1207 = as_type<int>(_1077);
        int _1209 = 5840;
        int _1211 = as_type<int>(_1083);
        int _1213;
        int _1215;
        int _1217;
        int _1219;
        int _1221;
        int _1223;
        int _1225;
        _100(_1203, _1205, _1207, _1209, _1211, _1213, _1215, _1217, _1219, _1221, _1223, _1225, out.gl_Position, out.gl_PointSize);
        _1227 = as_type<float>(_1223);
        _1229 = true;
    }
    else
    {
        float _1231 = rsqrt(_1179);
        float _1233 = _1179 * _1231;
        float _1235 = _1231 * 0.5;
        float _1237 = -_1233;
        float _1239 = 0.0 + _1237;
        float _1241 = fma(_1235, _1239, 0.5);
        float _1243 = fma(_1233, _1241, _1233);
        float _1245 = -_1243;
        float _1247 = 0.0 + _1245;
        float _1249 = fma(_1243, _1247, _1179);
        float _1251 = fma(_1235, _1249, _1243);
        _1227 = _1251;
    }
    _1229 = false;
    float _1253 = _1227;
    float _1255 = in.m_61.x;
    float _1257 = in.m_61.y;
    float _1259 = in.m_61.z;
    float _1261 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1263 = log2(_1261);
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1275 = _1273 != 0;
    bool _1277 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1279 = isnan(0.0);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1285 = _1281 || _1283;
    float _1287 = _1263 * _145;
    float _1289 = exp2(_1287);
    float _1291 = _1259 * 2.0;
    float _1293 = _1255 * 2.0;
    float _1295 = _1257 + _1259;
    float _1297 = _1257 * 2.0;
    float _1299 = floor(_1293);
    float _1301 = floor(_1291);
    float _1303 = _1295 + (-1.0);
    float _1305 = -_1289;
    float _1307 = _1305 + 1.0;
    float _1309 = _1285 ? _1307 : 0.0;
    float _1311 = floor(_1297);
    bool _1313 = _1299 >= 0.0;
    bool _1315 = isnan(_1299);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.0);
    bool _1321 = _1317 || _1319;
    int _1323 = _1321 ? 0 : 1;
    bool _1325 = _1301 > 0.0;
    bool _1327 = _1301 >= 0.0;
    bool _1329 = isnan(_1301);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan(0.0);
    bool _1335 = _1331 || _1333;
    float _1337 = _1257 + _1255;
    int _1339 = ~_1323;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    float _1345 = _1257 + (-0.5);
    float _1347 = _1337 + (-1.0);
    float _1349 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1351 = _1335 ? 0 : 1;
    float _1353 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1357 = 1.0 + _1355;
    int _1359 = ~_1351;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    bool _1365 = _1299 > 0.0;
    float _1367 = 1.0 / _1357;
    int _1369 = _1363;
    int _1371 = _1343;
    if (!_1325)
    {
        int _1373 = ~_1351;
        int _1375 = _1373 + 1;
        _1369 = _1375;
    }
    int _1377 = _1369;
    float _1379 = in.m_65.x;
    float _1381 = in.m_65.y;
    float _1383 = in.m_65.z;
    bool _1385 = !_1267;
    int _1387 = _1385 ? 0 : 1;
    bool _1389 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1391 = isnan(1.0);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1397 = _1393 || _1395;
    int _1399 = abs(_1387);
    bool _1401 = !_1271;
    int _1403 = _1401 ? 0 : 1;
    float _1405 = float(_1399);
    float _1407 = float(_1377);
    bool _1409 = _1311 > 0.0;
    float _1411 = _1311;
    if (!_1365)
    {
        int _1413 = ~_1323;
        int _1415 = _1413 + 1;
        _1371 = _1415;
    }
    int _1417 = _1371;
    float _1419 = _1405 * _1407;
    if (_1397)
    {
        float _1421 = _1309 * _1367;
        _149 = _1421;
    }
    float _1423 = _149;
    int _1425 = abs(_1403);
    float _1427 = _1255 + (-0.5);
    float _1429 = _1419 * (-2.0);
    bool _1431 = _1311 >= 0.0;
    bool _1433 = isnan(_1311);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan(0.0);
    bool _1439 = _1435 || _1437;
    float _1441 = _1255 + _1259;
    float _1443 = float(_1425);
    float _1445 = fma(_1429, _1379, _1379);
    float _1447 = float(_1417);
    float _1449 = fma(_1353, _1429, _1353);
    bool _1451 = !_1275;
    int _1453 = _1451 ? 0 : 1;
    float _1455 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1445);
    int _1457 = _1439 ? 0 : 1;
    float _1459 = _1443 * _1447;
    int _1461 = abs(_1453);
    float _1463 = fma(_1449, _1423, _1455);
    int _1465 = ~_1457;
    int _1467 = _1465 + 1;
    int _1469 = _1467 + 1;
    float _1471 = _1459 * (-2.0);
    int _1473 = _1469;
    if (!_1409)
    {
        int _1475 = ~_1457;
        int _1477 = _1475 + 1;
        _1473 = _1477;
    }
    int _1479 = _1473;
    float _1481 = _1441 + (-1.0);
    float _1483 = fma(_1471, _1381, _1381);
    float _1485 = float(_1479);
    float _1487 = fma(_1349, _1471, _1349);
    float _1489 = float(_1461);
    float _1491 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1483);
    float _1493 = _1259 + (-0.5);
    float _1495 = _1463 * 0.15915493667125701904296875;
    float _1497 = _1489 * _1485;
    float _1499 = fma(_1487, _1423, _1491);
    float _1501 = in.m_55.x;
    float _1503 = in.m_55.y;
    float _1505 = in.m_55.z;
    float _1507 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1509 = _1497 * (-2.0);
    float _1511 = _1499 * 0.15915493667125701904296875;
    float _1513 = _1495 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = fma(_1509, _1383, _1383);
    float _1519 = fma(_1507, _1509, _1507);
    bool _1521 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1523 = isnan(0.5);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1529 = _1525 || _1527;
    float _1531 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1517);
    float _1533 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1151);
    float _1535 = _1511 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = fma(_1519, _1423, _1531);
    float _1541 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1147);
    float _1543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1149);
    float _1545 = _1539 * 0.15915493667125701904296875;
    float _1547 = _1511 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1553 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1555 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1557 = _1545 * 6.283185482025146484375;
    float _1559 = cos(_1557);
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1563 = _1553 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1565 = _1555 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1567 = _1515 * _1537;
    float _1569 = _1541 * _1561;
    float _1571 = _1543 * _1563;
    float _1573 = _1533 * _1565;
    float _1575 = _1495 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1515 * _1549;
    float _1581 = _1545 * 6.283185482025146484375;
    float _1583 = sin(_1581);
    float _1585 = _1515 * _1559;
    float _1587 = _1549 * _1559;
    float _1589 = _1537 * _1559;
    float _1591 = _1577 * _1537;
    float _1593 = _1577 * _1549;
    float _1595 = _1577 * _1559;
    float _1597 = _1585 * _1571;
    float _1599 = _1595 * _1571;
    float _1601 = fma(_1583, _1579, _1591);
    float _1603 = fma(_1583, _1591, _1579);
    float _1605 = -_1567;
    float _1607 = fma(_1583, _1593, _1605);
    float _1609 = -_1593;
    float _1611 = fma(_1583, _1567, _1609);
    float _1613 = -_1571;
    float _1615 = _1583 * _1613;
    float _1617 = fma(_1601, _1569, _1597);
    float _1619 = _311 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1621 = fma(_1607, _1569, _1599);
    float _1623 = fma(_1587, _1569, _1615);
    float _1625 = fma(_1611, _1573, _1617);
    float _1627 = _311 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1629 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1619);
    float _1631 = fma(_1589, _1573, _1623);
    float _1633 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1635 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1627);
    float _1637 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1639 = fma(_1603, _1573, _1621);
    float _1641 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1629);
    float _1643 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1633);
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1637);
    float _1647 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1635);
    float _1649 = _1641 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1651 = fma(_1639, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1643);
    float _1653 = fma(_1639, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1645);
    float _1655 = _1647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1657 = _311 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1659 = _1649 + _1651;
    float _1661 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1663 = _1655 + _1653;
    float _1665 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1657);
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1669 = _1659 + _1667;
    float _1671 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1661);
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1675 = _1663 + _1673;
    float _1677 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1665);
    float _1679 = _1669 * _1669;
    float _1681 = fma(_1639, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1671);
    float _1683 = _1677 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1685 = fma(_1675, _1675, _1679);
    float _1687 = _1683 + _1681;
    float _1689 = sqrt(_1685);
    bool _1691 = _1689 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1693 = _1671;
    float _1695 = _1657;
    float _1697 = _1663;
    float _1699 = _1689;
    float _1701 = _1675;
    float _1703 = _1669;
    if (!_1691)
    {
        _1693 = _1663;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (!_1691)
    {
        _1695 = _1659;
    }
    float _1709 = _1695;
    float _1711 = _1709;
    if (!_1691)
    {
        _1697 = _1687;
    }
    float _1713 = _1697;
    bool _1715 = !_1691;
    float _1717 = _1713;
    if (!_1715)
    {
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1723 = _1689 + _1721;
        float _1725 = rsqrt(_1685);
        float _1727 = _1723 * _1719;
        float _1729 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1731 = _1727 * 0.15915493667125701904296875;
        float _1733 = _1731 * 6.283185482025146484375;
        float _1735 = cos(_1733);
        float _1737 = _1731 * 6.283185482025146484375;
        float _1739 = sin(_1737);
        float _1741 = _1735 + (-1.0);
        float _1743 = fma(_1739, _1729, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1745 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = _1725 * _1743;
        float _1749 = fma(_1687, _1735, _1745);
        float _1751 = fma(_1675, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1753 = fma(_1669, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1707 = _1751;
        _1717 = _1749;
        _1711 = _1753;
        _319 = _1725;
        _1699 = _1741;
    }
    float _1755 = _1707;
    float _1757 = _1717;
    float _1759 = _1711;
    float _1761 = _319;
    float _1763 = _1699;
    float _1765 = _1759;
    float _1767 = _1761;
    float _1769 = _1763;
    if (_1529)
    {
        _1701 = _1755;
    }
    float _1771 = _1701;
    float _1773 = _1771;
    if (_1529)
    {
        _1703 = _1757;
    }
    float _1775 = _1703;
    float _1777 = _1775;
    if (!_1529)
    {
        float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1781 = _1683 + _1779;
        float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1785 = _1655 + _1783;
        float _1787 = -_1655;
        float _1789 = _1787 + _1755;
        float _1791 = -_1683;
        float _1793 = _1791 + _1757;
        float _1795 = _1781 * _1781;
        float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1799 = _1649 + _1797;
        float _1801 = -_1649;
        float _1803 = _1801 + _1759;
        float _1805 = fma(_1785, _1785, _1795);
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1809 = fma(_1799, _1799, _1805);
        float _1811 = sqrt(_1809);
        float _1813 = precise::min(_1811, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1815 = _1813 * _1807;
        float _1817 = fma(_1789, _1815, _1655);
        float _1819 = fma(_1793, _1815, _1683);
        float _1821 = fma(_1803, _1815, _1649);
        _1777 = _1819;
        _1773 = _1817;
        _1765 = _1821;
        _1767 = _1815;
        _1769 = _1811;
    }
    float _1823 = _1777;
    float _1825 = _1773;
    float _1827 = _1765;
    float _1829 = _1767;
    float _1831 = _1769;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1835 = _1823 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1839 = _1825 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = _1827 + _1841;
    float _1845 = _1835 * _1835;
    float _1847 = fma(_1839, _1839, _1845);
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = rsqrt(_1849);
    float _1853 = sqrt(_1849);
    float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1857 = _1839 * _1855;
    float _1859 = _1843 * _1855;
    float _1861 = _1857 * _1857;
    float _1863 = _1859 * _1859;
    float _1865 = _1861 + _1863;
    float _1867 = sqrt(_1865);
    bool _1869 = _1867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1873 = _1867 + _1871;
    float _1875 = _1843;
    float _1877 = _1831;
    float _1879 = _1873;
    float _1881 = _1829;
    float _1883 = _1835;
    if (_1869)
    {
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1875 = _1885;
    }
    float _1887 = _1875;
    if (_1869)
    {
        float _1889 = rsqrt(_1865);
        _1877 = _1889;
    }
    float _1891 = _1877;
    float _1893 = _1891;
    if (_1869)
    {
        float _1895 = _1873 * _1887;
        _1879 = _1895;
    }
    float _1897 = _1879;
    if (_1869)
    {
        float _1899 = _1897 * 0.15915493667125701904296875;
        _1881 = _1899;
    }
    float _1901 = _1881;
    float _1903 = _1845;
    if (_1869)
    {
        float _1905 = _1901 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        _1903 = _1907;
    }
    float _1909 = _1903;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1913 = precise::max(0.0, _1911);
    float _1915 = _1851;
    float _1917 = _1913;
    float _1919 = _1911;
    if (_1869)
    {
        float _1921 = _1901 * 6.283185482025146484375;
        float _1923 = cos(_1921);
        _1915 = _1923;
    }
    float _1925 = _1915;
    float _1927 = -_1855;
    float _1929 = -_1913;
    float _1931 = fma(_1835, _1927, _1929);
    if (!_1869)
    {
        _1917 = _1857;
    }
    float _1933 = _1917;
    float _1935 = _1933;
    if (_1869)
    {
        float _1937 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1937;
    }
    float _1939 = _1919;
    float _1941 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1943 = _1909;
    float _1945 = _1939;
    if (_1869)
    {
        float _1947 = fma(_1909, _1939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1883 = _1947;
    }
    float _1949 = _1883;
    float _1951 = _1949;
    if (!_1869)
    {
        _1943 = _1861;
    }
    float _1953 = _1943;
    float _1955 = _1953;
    float _1957 = _1925;
    if (_1869)
    {
        float _1959 = _1925 + (-1.0);
        _1945 = _1959;
    }
    float _1961 = _1945;
    float _1963 = _1961;
    if (_1869)
    {
        float _1965 = _1891 * _1949;
        _1411 = _1965;
    }
    float _1967 = _1411;
    if (!_1869)
    {
        _1951 = _1931;
    }
    float _1969 = _1951;
    float _1971 = _1969;
    if (_1869)
    {
        float _1973 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1893 = _1973;
    }
    float _1975 = _1893;
    if (_1869)
    {
        float _1977 = _1857 * _1967;
        _1935 = _1977;
    }
    float _1979 = _1935;
    if (!_1869)
    {
        _1963 = _1859;
    }
    float _1981 = _1963;
    float _1983 = _1981;
    if (_1869)
    {
        float _1985 = _1859 * _1967;
        _1983 = _1985;
    }
    float _1987 = _1983;
    if (_1869)
    {
        float _1989 = fma(_1931, _1925, _1975);
        _1971 = _1989;
    }
    float _1991 = _1971;
    if (_1869)
    {
        float _1993 = _1979 * _1979;
        _1955 = _1993;
    }
    float _1995 = _1955;
    if (!_1869)
    {
        _1957 = _1863;
    }
    float _1997 = _1957;
    float _1999 = _1997;
    if (_1869)
    {
        float _2001 = _1987 * _1987;
        _1999 = _2001;
    }
    float _2003 = _1999;
    float _2005 = fma(_1991, _1991, _1995);
    float _2007 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2009 = _2005 + _2003;
    float _2011 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1941);
    float _2013 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2017 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2015);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2023 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2011);
    float _2025 = rsqrt(_2009);
    float _2027 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2029 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2013);
    float _2031 = -_2019;
    float _2033 = _2031 + 1.0;
    float _2035 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2021);
    float _2037 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2027);
    float _2039 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2029);
    float _2041 = _2023 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2043 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2035);
    float _2045 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2037);
    float _2047 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2049 = abs(_2033);
    float _2051 = log2(_2049);
    float _2053 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2055 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2057 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2059 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2061 = _2025 * _1979;
    float _2063 = _2025 * _1991;
    float _2065 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2057);
    float _2067 = _2025 * _1987;
    float _2069 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2071 = -_2059;
    float _2073 = fma(_2071, _2007, 1.0);
    float _2075 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2065);
    float _2077 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2079 = -_2069;
    float _2081 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2079);
    float _2083 = log2(_2073);
    float _2085 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2075);
    float _2087 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2089 = -_2067;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2081);
    float _2093 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2095 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2077);
    float _2097 = fma(_2091, -0.5, 0.5);
    float _2099 = 1.0 / _2085;
    float _2101 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2093);
    float _2103 = fma(_2091, 0.5, 0.5);
    float _2105 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2095);
    float _2107 = _2063 + 1.0;
    float _2109 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2101);
    float _2111 = fma(_2103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2113 = exp2(_2087);
    float _2115 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2109);
    float _2117 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2105);
    float _2119 = _2083 * 0.693147182464599609375;
    float _2121 = fma(_2103, _2111, -0.212114393711090087890625);
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2125 = sqrt(_2097);
    float _2127 = _2115 * _2099;
    float _2129 = _2117 * _2099;
    float _2131 = fma(_2103, _2121, 1.570728778839111328125);
    float _2133 = fma(_2127, 0.5, 0.5);
    float _2135 = fma(_2129, -0.5, 0.5);
    float _2137 = -_2063;
    float _2139 = fma(_2113, _2107, _2137);
    float3 _5871 = float3(_2133, _2135, _2123);
    float _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5871, float3(0.0), isnan(_5871)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5871, float3(0.0), isnan(_5871)), level(0.0)).x;
    float _2143 = fma(_2139, 0.5, 0.5);
    float _2145 = _2125 * 0.636619746685028076171875;
    float _2147 = -_2131;
    float _2149 = fma(_2145, _2147, 1.0);
    float3 _5892 = float3(_2133, _2135, _2123);
    float4 _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5892, float3(0.0), isnan(_5892)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5892, float3(0.0), isnan(_5892)), level(0.0)).xyzw;
    float _2153 = _2151.x;
    float _2155 = _2151.y;
    float _2157 = _2151.z;
    float _2159 = _2151.w;
    float2 _5908 = float2(_2149, _2143);
    float3 _2163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5908, float2(0.0), isnan(_5908)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5908, float2(0.0), isnan(_5908)), level(0.0)).xyz;
    float _2165 = _2163.x;
    float _2167 = _2163.y;
    float _2169 = _2163.z;
    float _2171 = _1199 * _1253;
    float _2173 = _1187 * 2.0;
    float _2175 = _1171 * 3.883221149444580078125;
    bool _2177 = _1149 != 0.0;
    bool _2179 = isnan(_1149);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(0.0);
    bool _2185 = _2181 || _2183;
    float _2187 = -_977;
    float _2189 = _2187 + _1173;
    float _2191 = -_2173;
    float _2193 = fma(_2171, _2191, _2171);
    float _2195 = _2175 * 0.15915493667125701904296875;
    bool _2197 = _1147 == 0.0;
    bool _2199 = !_2185;
    bool _2201 = _2197 && _2199;
    float _2203 = fma(_1107, _2189, _977);
    float _2205 = fma(_1187, 3.1415927410125732421875, _2193);
    float _2207 = _2195 * 6.283185482025146484375;
    float _2209 = cos(_2207);
    float _2211 = in.m_67.x;
    float _2213 = in.m_67.y;
    float _2215 = in.m_67.z;
    float _2217 = in.m_67.w;
    bool _2219 = _1151 == 0.0;
    bool _2221 = _2219 && _2201;
    float _2223 = _2205 * 0.15915493667125701904296875;
    float _2225 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_69.z = _934;
    out.m_69.w = _942;
    float _2227 = _2195 * 6.283185482025146484375;
    float _2229 = sin(_2227);
    out.m_71.x = _1825;
    out.m_71.y = _1823;
    out.m_71.z = _1827;
    float _2231 = _2085;
    float _2233 = _2117;
    if (_2221)
    {
        _1007 = _2203;
    }
    float _2235 = _1007;
    float _2237 = _2223 * 6.283185482025146484375;
    float _2239 = sin(_2237);
    float _2241 = _2235;
    if (!_2221)
    {
        float _2243 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2203);
        _2241 = _2243;
    }
    float _2245 = _2241;
    float _2247 = exp2(_2225);
    float _2249 = -_1117;
    float _2251 = fma(_2239, _2209, _2249);
    float _2253 = -_1119;
    float _2255 = fma(_2239, _2229, _2253);
    float _2257 = _2203 * _2211;
    float _2259 = fma(_1107, _2251, _1117);
    float _2261 = fma(_1107, _2255, _1119);
    float _2263 = _2259 * _2215;
    float _2265 = _2261 * _2213;
    float _2267 = -_2257;
    float _2269 = fma(_2259, _2213, _2267);
    float _2271 = -_2245;
    float _2273 = _1583 * _2271;
    float _2275 = -_2263;
    float _2277 = fma(_2261, _2211, _2275);
    float _2279 = -_2265;
    float _2281 = fma(_2203, _2215, _2279);
    float _2283 = _2269 * _2217;
    float _2285 = -_2213;
    float _2287 = _1583 * _2285;
    float _2289 = _2277 * _2217;
    float _2291 = _2281 * _2217;
    float _2293 = _1585 * _2213;
    float _2295 = _1595 * _2245;
    float _2297 = -_2289;
    float _2299 = _1583 * _2297;
    float _2301 = _1585 * _2245;
    float _2303 = _1595 * _2213;
    float _2305 = _1585 * _2289;
    float _2307 = _1595 * _2289;
    float _2309 = fma(_1601, _2211, _2293);
    float _2311 = fma(_1587, _2211, _2287);
    float _2313 = _2259;
    if (!_2221)
    {
        float _2315 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2259);
        _2313 = _2315;
    }
    float _2317 = _2313;
    float _2319 = fma(_1587, _2291, _2299);
    float _2321 = fma(_1607, _2211, _2303);
    float _2323 = fma(_1601, _2291, _2305);
    float _2325 = fma(_1607, _2291, _2307);
    float _2327 = fma(_1611, _2215, _2309);
    if (_2221)
    {
        _1159 = _2261;
    }
    float _2329 = _1159;
    float _2331 = fma(_1589, _2215, _2311);
    float _2333 = _2329;
    if (!_2221)
    {
        float _2335 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2261);
        _2333 = _2335;
    }
    float _2337 = _2333;
    float _2339 = fma(_1587, _2317, _2273);
    float _2341 = fma(_1603, _2215, _2321);
    float _2343 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2345 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2347 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2349 = fma(_1601, _2317, _2301);
    float _2351 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2353 = fma(_1589, _2337, _2339);
    float _2355 = fma(_1611, _2283, _2323);
    float _2357 = fma(_1589, _2283, _2319);
    float _2359 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2343);
    float _2361 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2345);
    float _2363 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2347);
    float _2365 = fma(_1611, _2337, _2349);
    float _2367 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2351);
    float _2369 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2371 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2373 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2375 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2377 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2379 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2381 = fma(_1603, _2283, _2325);
    float _2383 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2369);
    float _2385 = -_2247;
    float _2387 = _2385 + 1.0;
    float _2389 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2373);
    float _2391 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2375);
    float _2393 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2377);
    float _2395 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2371);
    float _2397 = fma(_2381, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2383);
    float _2399 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2379);
    float _2401 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2403 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2359);
    float _2405 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2361);
    float _2407 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2363);
    float _2409 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2367);
    float _2411 = fma(_1607, _2317, _2295);
    float _2413 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2403);
    float _2415 = fma(_2381, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2395);
    out.m_73.x = _2405;
    out.m_73.y = _2407;
    out.m_73.z = _2409;
    float _2417 = fma(_1603, _2337, _2411);
    float _2419 = _2413 + _2085;
    float _2421 = fma(_2381, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2399);
    float _2423 = fma(_2417, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2389);
    float _2425 = _2419 * 0.5;
    float _2427 = fma(_2417, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2391);
    float _2429 = fma(_2417, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2393);
    out.m_75.x = _2397;
    out.m_75.y = _2415;
    out.m_75.z = _2421;
    bool _2431 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2433 = isnan(_1853);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2439 = _2435 || _2437;
    float _2441 = -_2401;
    float _2443 = _2441 + 1.0;
    out.m_77.z = _2425;
    out.m_77.w = _2085;
    out.m_79.x = _2423;
    out.m_79.y = _2427;
    out.m_79.z = _2429;
    out.gl_Position.x = _2115;
    out.gl_Position.y = _2117;
    out.gl_Position.z = _2413;
    out.gl_Position.w = _2085;
    float _2445 = _2407;
    float _2447 = _2413;
    float _2449 = _2115;
    float _2451 = _2443;
    if (!_2439)
    {
        _2445 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2453 = _2445;
    float _2455 = _2453;
    float _2457 = _2453;
    if (!_2439)
    {
        _2231 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2459 = _2231;
    float _2461 = _2459;
    float _2463 = _2459;
    if (!_2439)
    {
        _2447 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2465 = _2447;
    float _2467 = _2465;
    float _2469 = _2465;
    if (!_2439)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2471 = _2233;
    float _2473 = _2471;
    float _2475 = _2471;
    if (!_2439)
    {
        _2449 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2477 = _2449;
    float _2479 = _2401 * _2141;
    float _2481 = _2159 * _2479;
    float _2483 = _2159 * _2443;
    float _2485 = _2477;
    float _2487 = _2477;
    if (!_2439)
    {
        _2451 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2489 = _2451;
    float _2491 = _2169 * _2479;
    float _2493 = fma(_2165, _2481, _2153);
    float _2495 = fma(_2167, _2481, _2155);
    float _2497 = fma(_2159, _2491, _2157);
    out.m_81.x = _2493;
    out.m_81.y = _2495;
    out.m_81.z = _2497;
    out.m_81.w = _2483;
    bool _2499 = !_2439;
    float _2501 = _2489;
    float _2503 = _2489;
    if (!_2499)
    {
        bool _2505 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2507 = isnan(_1853);
        bool _2509 = _2505 || _2507;
        bool _2511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2513 = _2509 || _2511;
        if (!_2513)
        {
            float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2517 = _1853 + _2515;
            float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2521 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2519;
            float _2523 = 1.0 / _2521;
            float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2545 = _2517 * _2523;
            float _2547 = precise::clamp(_2545, 0.0, 1.0);
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2553 = fma(_2547, _2531, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2555 = fma(_2547, _2551, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2557 = fma(_2547, _2527, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2559 = fma(_2547, _2535, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2561 = fma(_2547, _2539, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2563 = fma(_2547, _2543, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2475 = _2557;
            _2503 = _2561;
            _2469 = _2555;
            _2457 = _2559;
            _2487 = _2553;
            _2463 = _2563;
            _2565 = true;
        }
        else
        {
            bool _2567 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2569 = isnan(_1853);
            bool _2571 = _2567 || _2569;
            bool _2573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2575 = _2571 || _2573;
            if (!_2575)
            {
                _2455 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2577 = _2455;
            _2457 = _2577;
            if (!_2575)
            {
                _2501 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2579 = _2501;
            _2503 = _2579;
            if (!_2575)
            {
                _2461 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2581 = _2461;
            _2463 = _2581;
            if (!_2575)
            {
                _2467 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2583 = _2467;
            _2469 = _2583;
            if (!_2575)
            {
                _2473 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2585 = _2473;
            _2475 = _2585;
            if (!_2575)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2587 = _2485;
            bool _2589 = !_2575;
            _2487 = _2587;
            if (!_2589)
            {
                bool _2591 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2593 = isnan(_1853);
                bool _2595 = _2591 || _2593;
                bool _2597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2599 = _2595 || _2597;
                if (!_2599)
                {
                    float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2603 = _1853 + _2601;
                    float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2607 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2605;
                    float _2609 = 1.0 / _2607;
                    float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2631 = _2603 * _2609;
                    float _2633 = precise::clamp(_2631, 0.0, 1.0);
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2639 = fma(_2633, _2617, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2641 = fma(_2633, _2637, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2643 = fma(_2633, _2613, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2645 = fma(_2633, _2621, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2647 = fma(_2633, _2625, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2649 = fma(_2633, _2629, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2475 = _2643;
                    _2503 = _2647;
                    _2469 = _2641;
                    _2457 = _2645;
                    _2487 = _2639;
                    _2463 = _2649;
                    _2565 = true;
                }
                else
                {
                    _2475 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2503 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2469 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2457 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2463 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2565 = false;
    float _2651 = _2475;
    float _2653 = _2503;
    float _2655 = _2469;
    float _2657 = _2457;
    float _2659 = _2487;
    float _2661 = _2463;
    float _2663 = fma(_2427, -0.5, 0.5);
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = -_2651;
    float _2669 = _2653 + _2667;
    float _2671 = -_2655;
    float _2673 = _2657 + _2671;
    float _2675 = -_2659;
    float _2677 = _2661 + _2675;
    bool _2679 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2681 = fma(_2665, _2669, _2651);
    float _2683 = fma(_2665, _2673, _2655);
    float _2685 = fma(_2665, _2677, _2659);
    float _2687 = _2681 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2689 = fma(_2683, 0.298911988735198974609375, _2687);
    float _2691 = fma(_2685, 0.114477999508380889892578125, _2689);
    out.m_83.x = 0.0;
    float _2693 = -_2691;
    float _2695 = _2683 + _2693;
    float _2697 = -_2691;
    float _2699 = _2681 + _2697;
    float _2701 = -_2691;
    float _2703 = _2685 + _2701;
    float _2705 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2707 = fma(_2695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2691);
    float _2709 = fma(_2699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2691);
    float _2711 = fma(_2703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2691);
    out.m_85.w = _2705;
    out.m_87.x = _2707;
    out.m_87.y = _2709;
    out.m_87.z = _2711;
    if (!_2679)
    {
        return out;
    }
    float _2713 = -_1823;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2717 = -_1825;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2721 = -_1827;
    float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2725 = _2715 * _2715;
    float _2727 = fma(_2719, _2719, _2725);
    float _2729 = fma(_2723, _2723, _2727);
    float _2731 = sqrt(_2729);
    float _2733 = rsqrt(_2729);
    float _2735 = -_2731;
    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2739 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    float _2743 = _2719 * _2733;
    float _2745 = _2715 * _2733;
    float _2747 = abs(_2741);
    float _2749 = log2(_2747);
    float _2751 = _2723 * _2733;
    float _2753 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2755 = _2427 * _2745;
    float _2757 = -_2745;
    float _2759 = -_2753;
    float _2761 = fma(_2757, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2759);
    float _2763 = fma(_2423, _2743, _2755);
    float _2765 = -_2751;
    float _2767 = fma(_2765, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2761);
    float _2769 = fma(_2429, _2751, _2763);
    float _2771 = precise::clamp(_2769, 0.0, 1.0);
    float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2775 = _2767 + _2773;
    float _2777 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2779 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2781 = precise::clamp(_2779, 0.0, 1.0);
    float _2783 = exp2(_2777);
    float _2785 = _2783 * _2781;
    float _2787 = _2771 * _2785;
    float _2789 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2791 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2793 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _2789;
    out.m_83.y = _2791;
    out.m_83.z = _2793;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2565 = false;
    bool _1229 = false;
    bool _1035 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _111 = int(_109);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2850 = as_type<float>(_127);
        out.gl_Position.z = _2850;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2919 = as_type<float>(_165);
        out.gl_Position.z = _2919;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_55.w;
    float _169 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_53.x;
    float _183 = in.m_53.y;
    float _185 = in.m_53.z;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _189 = in.m_48.x;
    float _191 = in.m_48.y;
    float _193 = in.m_48.z;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _203 = 0.0;
    float _205 = _169;
    if (!_179)
    {
        float _207 = _169 * _169;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _215 = _187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _219 = _195 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _221 = _197 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _223 = _199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _225 = _201 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _227 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _229 = _211;
    if (!_179)
    {
        float _231 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_179;
    float _237 = _233;
    float _239 = _189;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _169 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _169);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _269;
    }
    float _271 = _237;
    bool _273 = !_179;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _169 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _205 = _293;
    }
    float _295 = _205;
    out.m_57.x = _215;
    out.m_57.y = _219;
    out.m_57.z = _221;
    out.m_57.w = _217;
    bool _297 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _299 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _301 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    out.m_59.x = _223;
    out.m_59.y = _225;
    out.m_59.z = _227;
    float _303 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _305 = fma(_295, _183, _299);
    float _307 = fma(_295, _181, _301);
    float _309 = fma(_295, _185, _303);
    float _311 = fma(_305, _167, _191);
    float _313 = fma(_307, _167, _189);
    float _315 = fma(_309, _167, _193);
    bool _317 = !_297;
    float _319 = _311;
    float _337;
    if (!_317)
    {
        float _321 = in.m_61.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[14].x, _145);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _239 = _323;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_111);
        float _343 = 1.0 / _341;
        float _345 = _145 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _239;
    float _349 = _337;
    float _351 = in.m_61.x;
    float _353 = in.m_61.y;
    float _355 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _359 = _357 != 0;
    float _361 = in.m_63.x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _365 = in.m_63.y;
    float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _373 = _371 != 0;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _377 = _271;
    int _379 = as_type<int>(_363);
    float _381 = _347;
    if (_359)
    {
        float _383 = in.m_61.x;
        _377 = _383;
    }
    float _385 = _377;
    float _387 = _351 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _389 = _353 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _391 = _353 > 0.5;
    bool _393 = _391 && _373;
    float _395 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[78].z, _375);
    float _397 = -_363;
    float _399 = fma(_387, 2.0, _397);
    float _401 = fma(_389, -2.0, _369);
    float _403 = _361;
    if (_359)
    {
        float _405 = -_361;
        float _407 = _405 + 1.0;
        _379 = as_type<int>(_407);
    }
    int _409 = _379;
    float _411 = _367 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _413 = -_365;
    float _415 = _413 + 1.0;
    if (!_359)
    {
        _381 = _361;
    }
    float _417 = _381;
    float _419 = -_145;
    float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[76].x, _399);
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _425 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _401);
    bool _427 = false;
    float _429 = _417;
    if (_359)
    {
        bool _431 = _385 > 0.5;
        _427 = _431;
    }
    bool _433 = _427;
    float _435 = _393 ? _415 : _365;
    bool _437 = _433;
    if (_359)
    {
        float _439 = _433 ? as_type<float>(_409) : _361;
        _429 = _439;
    }
    float _441 = _429;
    float _443 = _355 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _445 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[78].w, _423);
    float _447 = fma(_411, _435, -0.5);
    float _449 = fma(_443, _441, -0.5);
    float _451 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _395);
    float _453 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _445);
    float _455 = fma(_451, _449, _421);
    float _457 = -_425;
    float _459 = fma(_453, _447, _457);
    float _461 = _455 + 0.5;
    float _463 = _459 + 0.5;
    float2 _3421 = float2(_461, _463);
    float _465 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_3421, float2(0.0), isnan(_3421)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_3421, float2(0.0), isnan(_3421)), level(0.0)).w;
    int _467 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _469 = _467;
    int _471 = 1;
    int _473 = _102(_469, _471, (*spvDescriptorSet0.support_buffer));
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _479 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _481 = isnan(_349);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _503 = 1.0 / _477;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _507 = _349 + _505;
    bool _509 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _511 = isnan(_349);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    bool _521 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _523 = isnan(_349);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _537 = 1.0 / _493;
    bool _539 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _541 = isnan(_349);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = _497 * _503;
    bool _553 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _555 = isnan(_349);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = 1.0 / _535;
    float _567 = -_563;
    float _569 = _567 + 1.0;
    float _571 = _501 * _537;
    float _573 = fma(_551, _507, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _579 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _581 = isnan(_349);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _595 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _597 = isnan(_349);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = _589 * _569;
    float _609 = -_589;
    float _611 = _609 + 1.0;
    float _613 = 1.0 / _593;
    float _615 = _577 * _565;
    float _617 = -_605;
    float _619 = _617 + 1.0;
    float _621 = _605 * _611;
    float _623 = _489 * _619;
    float _625 = -_489;
    float _627 = _625 + 1.0;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _633 = -_519;
    float _635 = _633 + 1.0;
    float _637 = _519 * _627;
    float _639 = 1.0 / _631;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _645 = _531 * _635;
    float _647 = -_531;
    float _649 = _647 + 1.0;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _659 = -_549;
    float _661 = _659 + 1.0;
    float _663 = 1.0 / _643;
    float _665 = _549 * _649;
    float _667 = _653 * _613;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _669;
    float _673 = _573 * _665;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _677 = _349 + _675;
    float _679 = 1.0 / _657;
    float _681 = _671 * _639;
    float _683 = fma(_571, _677, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _689 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[159].x, _673);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _693 = _349 + _691;
    float _695 = _687 * _663;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _699 = _349 + _697;
    float _701 = fma(_667, _693, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _703 = fma(_683, _645, _689);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _705;
    float _709 = fma(_615, _699, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _713 = _349 + _711;
    float _715 = fma(_701, _637, _703);
    float _717 = _707 * _679;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _721 = _349 + _719;
    float _723 = fma(_681, _713, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _725 = fma(_709, _623, _715);
    bool _727 = _349 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _729 = isnan(_349);
    bool _731 = _727 || _729;
    bool _733 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _735 = _731 || _733;
    float _737 = float(_735);
    float _739 = fma(_695, _721, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _743 = _349 + _741;
    float _745 = fma(_723, _621, _725);
    float _747 = -_737;
    float _749 = _747 + 1.0;
    float _751 = fma(_717, _743, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _753 = fma(_739, _607, _745);
    float _755 = _563 * _749;
    float _757 = in.m_63.z;
    float _759 = fma(_751, _755, _753);
    float _761 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[166].x, _759);
    float _763 = trunc(_757);
    int _765 = int(_763);
    float _767 = _465 + _351;
    float _769 = fma(_145, 0.070000000298023223876953125, _767);
    float _771 = _769 * 6.283185482025146484375;
    float _773 = _771 * 0.15915493667125701904296875;
    float _775 = _773 * 6.283185482025146484375;
    float _777 = sin(_775);
    int _779 = _473 + (-1);
    float _781 = fma(_777, 0.4000000059604644775390625, 0.60000002384185791015625);
    float _783 = float(_779);
    float _785 = _761 * _781;
    float _787 = precise::clamp(_785, 0.0, 1.0);
    float _789 = _787 * _783;
    float _791 = trunc(_789);
    int _793 = int(_791);
    int _795 = _793;
    int _797 = 1;
    int _799 = _103(_795, _797, (*spvDescriptorSet0.support_buffer));
    int _801 = _765;
    int _803 = 1;
    int _805 = _103(_801, _803, (*spvDescriptorSet0.support_buffer));
    float4 _808 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_799, _805)), 0).xyzw;
    float _810 = _808.x;
    float _812 = _808.y;
    float _814 = _808.z;
    float _816 = _808.w;
    float _818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _822 = _820 != 0;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _826 = _824 != 0;
    float _828 = in.m_61.w;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _832 = _830 != 0;
    float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _836 = _717;
    float _838 = _761;
    if (_822)
    {
        float _840 = in.m_61.z;
        _836 = _840;
    }
    float _842 = _836;
    if (!_826)
    {
        _838 = _353;
    }
    float _844 = _838;
    float _846 = _773;
    float _848 = _844;
    if (!_826)
    {
        float _850 = in.m_61.z;
        _846 = _850;
    }
    float _852 = _846;
    if (_826)
    {
        _848 = _351;
    }
    float _854 = _848;
    float _856 = _818 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _858 = as_type<int>(_818);
    if (_822)
    {
        float _860 = -_361;
        float _862 = _860 + 1.0;
        _858 = as_type<int>(_862);
    }
    int _864 = _858;
    bool _866 = _828 > 0.5;
    bool _868 = _866 && _832;
    float _870 = _868 ? _415 : _365;
    float _872 = fma(_856, _870, -0.5);
    float _874 = _854 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _876 = _828;
    if (_822)
    {
        bool _878 = _842 > 0.5;
        _437 = _878;
    }
    bool _880 = _437;
    float _882 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _884 = _852;
    if (!_826)
    {
        _876 = _852;
    }
    float _886 = _876;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _890 = _886;
    if (_826)
    {
        _890 = _353;
    }
    float _892 = _890;
    if (_826)
    {
        _884 = _353;
    }
    float _894 = _884;
    float _896 = -_888;
    float _898 = fma(_874, 2.0, _896);
    float _900 = _892 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_822)
    {
        float _902 = _880 ? as_type<float>(_864) : _361;
        _403 = _902;
    }
    float _904 = _403;
    float _906 = -_145;
    float _908 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _912 = fma(_900, -2.0, _882);
    float _914 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[83].z, _910);
    float _916 = _834 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _920 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _914);
    float _922 = fma(_916, _904, -0.5);
    float _924 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[83].w, _918);
    float _926 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _912);
    float _928 = fma(_920, _922, _908);
    float _930 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _924);
    int _932 = _793 + 1;
    float _934 = _928 + 0.5;
    float _936 = -_926;
    float _938 = fma(_930, _872, _936);
    int _940 = min(_779, _932);
    float _942 = _938 + 0.5;
    uint _945 = as_type<uint>(half2(float2(_816, 0.0)));
    uint _947 = extract_bits(_945, 0u, 8u);
    int _949 = int(_947) & 255;
    uint _951 = extract_bits(_945, 8u, 8u);
    int _953 = int(_951) & 255;
    int _955 = _953 << 8;
    int _957 = _949 | _955;
    bool _959 = _957 >= 32768;
    int _961 = _957 + (-1024);
    int _963 = _961;
    if (_959)
    {
        int _965 = ~_957;
        int _967 = _965 + 33792;
        int _969 = _967 + 1;
        _963 = _969;
    }
    int _971 = _963;
    int _973 = _971 + 30719;
    float _975 = float(_973);
    float _977 = fma(_975, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _979 = abs(_977);
    float _981 = -_979;
    float _983 = _981 + 1.0;
    float _985 = abs(_977);
    float _987 = fma(_985, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _989 = _977 < 0.0;
    float _991 = float(_989);
    int _993 = as_type<int>(_983) + (-218103808);
    float _995 = abs(_977);
    float _997 = fma(_995, _987, -0.212114393711090087890625);
    bool _999 = uint(_993) >= 1920991232u;
    float _1001 = abs(_977);
    float _1003 = fma(_1001, _997, 1.570728778839111328125);
    bool _1005 = !_999;
    float _1007 = _977;
    float _1033;
    if (!_1005)
    {
        int _1009 = as_type<int>(_983);
        int _1011 = as_type<int>(_938);
        int _1013 = as_type<int>(_983);
        int _1015 = 4944;
        int _1017 = 0;
        int _1019;
        int _1021;
        int _1023;
        int _1025;
        int _1027;
        int _1029;
        int _1031;
        _100(_1009, _1011, _1013, _1015, _1017, _1019, _1021, _1023, _1025, _1027, _1029, _1031, out.gl_Position, out.gl_PointSize);
        _1033 = as_type<float>(_1029);
        _1035 = true;
    }
    else
    {
        float _1037 = rsqrt(_983);
        float _1039 = _983 * _1037;
        float _1041 = _1037 * 0.5;
        float _1043 = -_1039;
        float _1045 = 0.0 + _1043;
        float _1047 = fma(_1041, _1045, 0.5);
        float _1049 = fma(_1039, _1047, _1039);
        float _1051 = -_1049;
        float _1053 = 0.0 + _1051;
        float _1055 = fma(_1049, _1053, _983);
        float _1057 = fma(_1041, _1055, _1049);
        _1033 = _1057;
    }
    _1035 = false;
    float _1059 = _1033;
    int _1061 = _940;
    int _1063 = 1;
    int _1065 = _103(_1061, _1063, (*spvDescriptorSet0.support_buffer));
    int _1067 = _765;
    int _1069 = 1;
    int _1071 = _103(_1067, _1069, (*spvDescriptorSet0.support_buffer));
    float4 _1073 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1065, _1071)), 0).xyzw;
    float _1075 = _1073.x;
    float _1077 = _1073.y;
    float _1079 = _1073.z;
    float _1081 = _1073.w;
    float _1083 = _1003 * _1059;
    float _1085 = _991 * 2.0;
    float _1087 = floor(_789);
    float _1089 = _975 * 3.883221149444580078125;
    float _1091 = -_1085;
    float _1093 = fma(_1083, _1091, _1083);
    float _1095 = _1089 * 0.15915493667125701904296875;
    float _1097 = fma(_991, 3.1415927410125732421875, _1093);
    float _1099 = _1095 * 6.283185482025146484375;
    float _1101 = cos(_1099);
    float _1103 = _1097 * 0.15915493667125701904296875;
    float _1105 = -_1087;
    float _1107 = _789 + _1105;
    float _1109 = _1103 * 6.283185482025146484375;
    float _1111 = sin(_1109);
    float _1113 = _1095 * 6.283185482025146484375;
    float _1115 = sin(_1113);
    float _1117 = _1111 * _1101;
    float _1119 = _1111 * _1115;
    uint _1121 = as_type<uint>(half2(float2(_1081, 0.0)));
    float _1123 = -_810;
    float _1125 = _1123 + _1075;
    float _1127 = -_812;
    float _1129 = _1127 + _1077;
    float _1131 = -_814;
    float _1133 = _1131 + _1079;
    uint _1135 = extract_bits(_1121, 0u, 8u);
    int _1137 = int(_1135) & 255;
    uint _1139 = extract_bits(_1121, 8u, 8u);
    int _1141 = int(_1139) & 255;
    int _1143 = _1141 << 8;
    int _1145 = _1137 | _1143;
    float _1147 = fma(_1107, _1125, _810);
    float _1149 = fma(_1107, _1129, _812);
    float _1151 = fma(_1107, _1133, _814);
    bool _1153 = _1145 >= 32768;
    int _1155 = _1145 + (-1024);
    int _1157 = _1155;
    float _1159 = _1107;
    if (_1153)
    {
        int _1161 = ~_1145;
        int _1163 = _1161 + 33792;
        int _1165 = _1163 + 1;
        _1157 = _1165;
    }
    int _1167 = _1157;
    int _1169 = _1167 + 30719;
    float _1171 = float(_1169);
    float _1173 = fma(_1171, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1175 = abs(_1173);
    float _1177 = -_1175;
    float _1179 = _1177 + 1.0;
    float _1181 = abs(_1173);
    float _1183 = fma(_1181, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1185 = _1173 < 0.0;
    float _1187 = float(_1185);
    int _1189 = as_type<int>(_1179) + (-218103808);
    float _1191 = abs(_1173);
    float _1193 = fma(_1191, _1183, -0.212114393711090087890625);
    bool _1195 = uint(_1189) >= 1920991232u;
    float _1197 = abs(_1173);
    float _1199 = fma(_1197, _1193, 1.570728778839111328125);
    bool _1201 = !_1195;
    float _1227;
    if (!_1201)
    {
        int _1203 = as_type<int>(_1179);
        int _1205 = as_type<int>(_1129);
        int _1207 = as_type<int>(_1077);
        int _1209 = 5840;
        int _1211 = as_type<int>(_1083);
        int _1213;
        int _1215;
        int _1217;
        int _1219;
        int _1221;
        int _1223;
        int _1225;
        _100(_1203, _1205, _1207, _1209, _1211, _1213, _1215, _1217, _1219, _1221, _1223, _1225, out.gl_Position, out.gl_PointSize);
        _1227 = as_type<float>(_1223);
        _1229 = true;
    }
    else
    {
        float _1231 = rsqrt(_1179);
        float _1233 = _1179 * _1231;
        float _1235 = _1231 * 0.5;
        float _1237 = -_1233;
        float _1239 = 0.0 + _1237;
        float _1241 = fma(_1235, _1239, 0.5);
        float _1243 = fma(_1233, _1241, _1233);
        float _1245 = -_1243;
        float _1247 = 0.0 + _1245;
        float _1249 = fma(_1243, _1247, _1179);
        float _1251 = fma(_1235, _1249, _1243);
        _1227 = _1251;
    }
    _1229 = false;
    float _1253 = _1227;
    float _1255 = in.m_61.x;
    float _1257 = in.m_61.y;
    float _1259 = in.m_61.z;
    float _1261 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1263 = log2(_1261);
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1275 = _1273 != 0;
    bool _1277 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1279 = isnan(0.0);
    bool _1281 = _1277 || _1279;
    bool _1283 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1285 = _1281 || _1283;
    float _1287 = _1263 * _145;
    float _1289 = exp2(_1287);
    float _1291 = _1259 * 2.0;
    float _1293 = _1255 * 2.0;
    float _1295 = _1257 + _1259;
    float _1297 = _1257 * 2.0;
    float _1299 = floor(_1293);
    float _1301 = floor(_1291);
    float _1303 = _1295 + (-1.0);
    float _1305 = -_1289;
    float _1307 = _1305 + 1.0;
    float _1309 = _1285 ? _1307 : 0.0;
    float _1311 = floor(_1297);
    bool _1313 = _1299 >= 0.0;
    bool _1315 = isnan(_1299);
    bool _1317 = _1313 || _1315;
    bool _1319 = isnan(0.0);
    bool _1321 = _1317 || _1319;
    int _1323 = _1321 ? 0 : 1;
    bool _1325 = _1301 > 0.0;
    bool _1327 = _1301 >= 0.0;
    bool _1329 = isnan(_1301);
    bool _1331 = _1327 || _1329;
    bool _1333 = isnan(0.0);
    bool _1335 = _1331 || _1333;
    float _1337 = _1257 + _1255;
    int _1339 = ~_1323;
    int _1341 = _1339 + 1;
    int _1343 = _1341 + 1;
    float _1345 = _1257 + (-0.5);
    float _1347 = _1337 + (-1.0);
    float _1349 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1351 = _1335 ? 0 : 1;
    float _1353 = fma(_1347, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1357 = 1.0 + _1355;
    int _1359 = ~_1351;
    int _1361 = _1359 + 1;
    int _1363 = _1361 + 1;
    bool _1365 = _1299 > 0.0;
    float _1367 = 1.0 / _1357;
    int _1369 = _1363;
    int _1371 = _1343;
    if (!_1325)
    {
        int _1373 = ~_1351;
        int _1375 = _1373 + 1;
        _1369 = _1375;
    }
    int _1377 = _1369;
    float _1379 = in.m_65.x;
    float _1381 = in.m_65.y;
    float _1383 = in.m_65.z;
    bool _1385 = !_1267;
    int _1387 = _1385 ? 0 : 1;
    bool _1389 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1391 = isnan(1.0);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1397 = _1393 || _1395;
    int _1399 = abs(_1387);
    bool _1401 = !_1271;
    int _1403 = _1401 ? 0 : 1;
    float _1405 = float(_1399);
    float _1407 = float(_1377);
    bool _1409 = _1311 > 0.0;
    float _1411 = _1311;
    if (!_1365)
    {
        int _1413 = ~_1323;
        int _1415 = _1413 + 1;
        _1371 = _1415;
    }
    int _1417 = _1371;
    float _1419 = _1405 * _1407;
    if (_1397)
    {
        float _1421 = _1309 * _1367;
        _149 = _1421;
    }
    float _1423 = _149;
    int _1425 = abs(_1403);
    float _1427 = _1255 + (-0.5);
    float _1429 = _1419 * (-2.0);
    bool _1431 = _1311 >= 0.0;
    bool _1433 = isnan(_1311);
    bool _1435 = _1431 || _1433;
    bool _1437 = isnan(0.0);
    bool _1439 = _1435 || _1437;
    float _1441 = _1255 + _1259;
    float _1443 = float(_1425);
    float _1445 = fma(_1429, _1379, _1379);
    float _1447 = float(_1417);
    float _1449 = fma(_1353, _1429, _1353);
    bool _1451 = !_1275;
    int _1453 = _1451 ? 0 : 1;
    float _1455 = fma(_1427, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1445);
    int _1457 = _1439 ? 0 : 1;
    float _1459 = _1443 * _1447;
    int _1461 = abs(_1453);
    float _1463 = fma(_1449, _1423, _1455);
    int _1465 = ~_1457;
    int _1467 = _1465 + 1;
    int _1469 = _1467 + 1;
    float _1471 = _1459 * (-2.0);
    int _1473 = _1469;
    if (!_1409)
    {
        int _1475 = ~_1457;
        int _1477 = _1475 + 1;
        _1473 = _1477;
    }
    int _1479 = _1473;
    float _1481 = _1441 + (-1.0);
    float _1483 = fma(_1471, _1381, _1381);
    float _1485 = float(_1479);
    float _1487 = fma(_1349, _1471, _1349);
    float _1489 = float(_1461);
    float _1491 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1483);
    float _1493 = _1259 + (-0.5);
    float _1495 = _1463 * 0.15915493667125701904296875;
    float _1497 = _1489 * _1485;
    float _1499 = fma(_1487, _1423, _1491);
    float _1501 = in.m_55.x;
    float _1503 = in.m_55.y;
    float _1505 = in.m_55.z;
    float _1507 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1509 = _1497 * (-2.0);
    float _1511 = _1499 * 0.15915493667125701904296875;
    float _1513 = _1495 * 6.283185482025146484375;
    float _1515 = cos(_1513);
    float _1517 = fma(_1509, _1383, _1383);
    float _1519 = fma(_1507, _1509, _1507);
    bool _1521 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1523 = isnan(0.5);
    bool _1525 = _1521 || _1523;
    bool _1527 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1529 = _1525 || _1527;
    float _1531 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1517);
    float _1533 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1151);
    float _1535 = _1511 * 6.283185482025146484375;
    float _1537 = sin(_1535);
    float _1539 = fma(_1519, _1423, _1531);
    float _1541 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1147);
    float _1543 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1149);
    float _1545 = _1539 * 0.15915493667125701904296875;
    float _1547 = _1511 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1553 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1555 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1557 = _1545 * 6.283185482025146484375;
    float _1559 = cos(_1557);
    float _1561 = _1551 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1563 = _1553 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1565 = _1555 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1567 = _1515 * _1537;
    float _1569 = _1541 * _1561;
    float _1571 = _1543 * _1563;
    float _1573 = _1533 * _1565;
    float _1575 = _1495 * 6.283185482025146484375;
    float _1577 = sin(_1575);
    float _1579 = _1515 * _1549;
    float _1581 = _1545 * 6.283185482025146484375;
    float _1583 = sin(_1581);
    float _1585 = _1515 * _1559;
    float _1587 = _1549 * _1559;
    float _1589 = _1537 * _1559;
    float _1591 = _1577 * _1537;
    float _1593 = _1577 * _1549;
    float _1595 = _1577 * _1559;
    float _1597 = _1585 * _1571;
    float _1599 = _1595 * _1571;
    float _1601 = fma(_1583, _1579, _1591);
    float _1603 = fma(_1583, _1591, _1579);
    float _1605 = -_1567;
    float _1607 = fma(_1583, _1593, _1605);
    float _1609 = -_1593;
    float _1611 = fma(_1583, _1567, _1609);
    float _1613 = -_1571;
    float _1615 = _1583 * _1613;
    float _1617 = fma(_1601, _1569, _1597);
    float _1619 = _311 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1621 = fma(_1607, _1569, _1599);
    float _1623 = fma(_1587, _1569, _1615);
    float _1625 = fma(_1611, _1573, _1617);
    float _1627 = _311 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1629 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1619);
    float _1631 = fma(_1589, _1573, _1623);
    float _1633 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1635 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1627);
    float _1637 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1639 = fma(_1603, _1573, _1621);
    float _1641 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1629);
    float _1643 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1633);
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1637);
    float _1647 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1635);
    float _1649 = _1641 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1651 = fma(_1639, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1643);
    float _1653 = fma(_1639, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1645);
    float _1655 = _1647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1657 = _311 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1659 = _1649 + _1651;
    float _1661 = _1625 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1663 = _1655 + _1653;
    float _1665 = fma(_313, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1657);
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1669 = _1659 + _1667;
    float _1671 = fma(_1631, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1661);
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1675 = _1663 + _1673;
    float _1677 = fma(_315, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1665);
    float _1679 = _1669 * _1669;
    float _1681 = fma(_1639, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1671);
    float _1683 = _1677 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1685 = fma(_1675, _1675, _1679);
    float _1687 = _1683 + _1681;
    float _1689 = sqrt(_1685);
    bool _1691 = _1689 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1693 = _1671;
    float _1695 = _1657;
    float _1697 = _1663;
    float _1699 = _1689;
    float _1701 = _1675;
    float _1703 = _1669;
    if (!_1691)
    {
        _1693 = _1663;
    }
    float _1705 = _1693;
    float _1707 = _1705;
    if (!_1691)
    {
        _1695 = _1659;
    }
    float _1709 = _1695;
    float _1711 = _1709;
    if (!_1691)
    {
        _1697 = _1687;
    }
    float _1713 = _1697;
    bool _1715 = !_1691;
    float _1717 = _1713;
    if (!_1715)
    {
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1723 = _1689 + _1721;
        float _1725 = rsqrt(_1685);
        float _1727 = _1723 * _1719;
        float _1729 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1731 = _1727 * 0.15915493667125701904296875;
        float _1733 = _1731 * 6.283185482025146484375;
        float _1735 = cos(_1733);
        float _1737 = _1731 * 6.283185482025146484375;
        float _1739 = sin(_1737);
        float _1741 = _1735 + (-1.0);
        float _1743 = fma(_1739, _1729, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1745 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = _1725 * _1743;
        float _1749 = fma(_1687, _1735, _1745);
        float _1751 = fma(_1675, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1753 = fma(_1669, _1747, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1707 = _1751;
        _1717 = _1749;
        _1711 = _1753;
        _319 = _1725;
        _1699 = _1741;
    }
    float _1755 = _1707;
    float _1757 = _1717;
    float _1759 = _1711;
    float _1761 = _319;
    float _1763 = _1699;
    float _1765 = _1759;
    float _1767 = _1761;
    float _1769 = _1763;
    if (_1529)
    {
        _1701 = _1755;
    }
    float _1771 = _1701;
    float _1773 = _1771;
    if (_1529)
    {
        _1703 = _1757;
    }
    float _1775 = _1703;
    float _1777 = _1775;
    if (!_1529)
    {
        float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1781 = _1683 + _1779;
        float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1785 = _1655 + _1783;
        float _1787 = -_1655;
        float _1789 = _1787 + _1755;
        float _1791 = -_1683;
        float _1793 = _1791 + _1757;
        float _1795 = _1781 * _1781;
        float _1797 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1799 = _1649 + _1797;
        float _1801 = -_1649;
        float _1803 = _1801 + _1759;
        float _1805 = fma(_1785, _1785, _1795);
        float _1807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1809 = fma(_1799, _1799, _1805);
        float _1811 = sqrt(_1809);
        float _1813 = precise::min(_1811, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1815 = _1813 * _1807;
        float _1817 = fma(_1789, _1815, _1655);
        float _1819 = fma(_1793, _1815, _1683);
        float _1821 = fma(_1803, _1815, _1649);
        _1777 = _1819;
        _1773 = _1817;
        _1765 = _1821;
        _1767 = _1815;
        _1769 = _1811;
    }
    float _1823 = _1777;
    float _1825 = _1773;
    float _1827 = _1765;
    float _1829 = _1767;
    float _1831 = _1769;
    float _1833 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1835 = _1823 + _1833;
    float _1837 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1839 = _1825 + _1837;
    float _1841 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1843 = _1827 + _1841;
    float _1845 = _1835 * _1835;
    float _1847 = fma(_1839, _1839, _1845);
    float _1849 = fma(_1843, _1843, _1847);
    float _1851 = rsqrt(_1849);
    float _1853 = sqrt(_1849);
    float _1855 = _1851 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1857 = _1839 * _1855;
    float _1859 = _1843 * _1855;
    float _1861 = _1857 * _1857;
    float _1863 = _1859 * _1859;
    float _1865 = _1861 + _1863;
    float _1867 = sqrt(_1865);
    bool _1869 = _1867 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1873 = _1867 + _1871;
    float _1875 = _1843;
    float _1877 = _1831;
    float _1879 = _1873;
    float _1881 = _1829;
    float _1883 = _1835;
    if (_1869)
    {
        float _1885 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1875 = _1885;
    }
    float _1887 = _1875;
    if (_1869)
    {
        float _1889 = rsqrt(_1865);
        _1877 = _1889;
    }
    float _1891 = _1877;
    float _1893 = _1891;
    if (_1869)
    {
        float _1895 = _1873 * _1887;
        _1879 = _1895;
    }
    float _1897 = _1879;
    if (_1869)
    {
        float _1899 = _1897 * 0.15915493667125701904296875;
        _1881 = _1899;
    }
    float _1901 = _1881;
    float _1903 = _1845;
    if (_1869)
    {
        float _1905 = _1901 * 6.283185482025146484375;
        float _1907 = sin(_1905);
        _1903 = _1907;
    }
    float _1909 = _1903;
    float _1911 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1913 = precise::max(0.0, _1911);
    float _1915 = _1851;
    float _1917 = _1913;
    float _1919 = _1911;
    if (_1869)
    {
        float _1921 = _1901 * 6.283185482025146484375;
        float _1923 = cos(_1921);
        _1915 = _1923;
    }
    float _1925 = _1915;
    float _1927 = -_1855;
    float _1929 = -_1913;
    float _1931 = fma(_1835, _1927, _1929);
    if (!_1869)
    {
        _1917 = _1857;
    }
    float _1933 = _1917;
    float _1935 = _1933;
    if (_1869)
    {
        float _1937 = _1931 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1919 = _1937;
    }
    float _1939 = _1919;
    float _1941 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1943 = _1909;
    float _1945 = _1939;
    if (_1869)
    {
        float _1947 = fma(_1909, _1939, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1883 = _1947;
    }
    float _1949 = _1883;
    float _1951 = _1949;
    if (!_1869)
    {
        _1943 = _1861;
    }
    float _1953 = _1943;
    float _1955 = _1953;
    float _1957 = _1925;
    if (_1869)
    {
        float _1959 = _1925 + (-1.0);
        _1945 = _1959;
    }
    float _1961 = _1945;
    float _1963 = _1961;
    if (_1869)
    {
        float _1965 = _1891 * _1949;
        _1411 = _1965;
    }
    float _1967 = _1411;
    if (!_1869)
    {
        _1951 = _1931;
    }
    float _1969 = _1951;
    float _1971 = _1969;
    if (_1869)
    {
        float _1973 = _1961 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1893 = _1973;
    }
    float _1975 = _1893;
    if (_1869)
    {
        float _1977 = _1857 * _1967;
        _1935 = _1977;
    }
    float _1979 = _1935;
    if (!_1869)
    {
        _1963 = _1859;
    }
    float _1981 = _1963;
    float _1983 = _1981;
    if (_1869)
    {
        float _1985 = _1859 * _1967;
        _1983 = _1985;
    }
    float _1987 = _1983;
    if (_1869)
    {
        float _1989 = fma(_1931, _1925, _1975);
        _1971 = _1989;
    }
    float _1991 = _1971;
    if (_1869)
    {
        float _1993 = _1979 * _1979;
        _1955 = _1993;
    }
    float _1995 = _1955;
    if (!_1869)
    {
        _1957 = _1863;
    }
    float _1997 = _1957;
    float _1999 = _1997;
    if (_1869)
    {
        float _2001 = _1987 * _1987;
        _1999 = _2001;
    }
    float _2003 = _1999;
    float _2005 = fma(_1991, _1991, _1995);
    float _2007 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2009 = _2005 + _2003;
    float _2011 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1941);
    float _2013 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2015 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2017 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2015);
    float _2019 = precise::clamp(_2017, 0.0, 1.0);
    float _2021 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2023 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2011);
    float _2025 = rsqrt(_2009);
    float _2027 = _1823 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2029 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2013);
    float _2031 = -_2019;
    float _2033 = _2031 + 1.0;
    float _2035 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2021);
    float _2037 = fma(_1825, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2027);
    float _2039 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2029);
    float _2041 = _2023 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2043 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2035);
    float _2045 = fma(_1827, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2037);
    float _2047 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2049 = abs(_2033);
    float _2051 = log2(_2049);
    float _2053 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2055 = _2045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2057 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2059 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2061 = _2025 * _1979;
    float _2063 = _2025 * _1991;
    float _2065 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2057);
    float _2067 = _2025 * _1987;
    float _2069 = _2061 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2071 = -_2059;
    float _2073 = fma(_2071, _2007, 1.0);
    float _2075 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2065);
    float _2077 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2079 = -_2069;
    float _2081 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2079);
    float _2083 = log2(_2073);
    float _2085 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2075);
    float _2087 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2089 = -_2067;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2081);
    float _2093 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2095 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2077);
    float _2097 = fma(_2091, -0.5, 0.5);
    float _2099 = 1.0 / _2085;
    float _2101 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2093);
    float _2103 = fma(_2091, 0.5, 0.5);
    float _2105 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2095);
    float _2107 = _2063 + 1.0;
    float _2109 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2101);
    float _2111 = fma(_2103, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2113 = exp2(_2087);
    float _2115 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2109);
    float _2117 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2105);
    float _2119 = _2083 * 0.693147182464599609375;
    float _2121 = fma(_2103, _2111, -0.212114393711090087890625);
    float _2123 = _2119 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2125 = sqrt(_2097);
    float _2127 = _2115 * _2099;
    float _2129 = _2117 * _2099;
    float _2131 = fma(_2103, _2121, 1.570728778839111328125);
    float _2133 = fma(_2127, 0.5, 0.5);
    float _2135 = fma(_2129, -0.5, 0.5);
    float _2137 = -_2063;
    float _2139 = fma(_2113, _2107, _2137);
    float3 _5871 = float3(_2133, _2135, _2123);
    float _2141 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5871, float3(0.0), isnan(_5871)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5871, float3(0.0), isnan(_5871)), level(0.0)).x;
    float _2143 = fma(_2139, 0.5, 0.5);
    float _2145 = _2125 * 0.636619746685028076171875;
    float _2147 = -_2131;
    float _2149 = fma(_2145, _2147, 1.0);
    float3 _5892 = float3(_2133, _2135, _2123);
    float4 _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5892, float3(0.0), isnan(_5892)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5892, float3(0.0), isnan(_5892)), level(0.0)).xyzw;
    float _2153 = _2151.x;
    float _2155 = _2151.y;
    float _2157 = _2151.z;
    float _2159 = _2151.w;
    float2 _5908 = float2(_2149, _2143);
    float3 _2163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5908, float2(0.0), isnan(_5908)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5908, float2(0.0), isnan(_5908)), level(0.0)).xyz;
    float _2165 = _2163.x;
    float _2167 = _2163.y;
    float _2169 = _2163.z;
    float _2171 = _1199 * _1253;
    float _2173 = _1187 * 2.0;
    float _2175 = _1171 * 3.883221149444580078125;
    bool _2177 = _1149 != 0.0;
    bool _2179 = isnan(_1149);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan(0.0);
    bool _2185 = _2181 || _2183;
    float _2187 = -_977;
    float _2189 = _2187 + _1173;
    float _2191 = -_2173;
    float _2193 = fma(_2171, _2191, _2171);
    float _2195 = _2175 * 0.15915493667125701904296875;
    bool _2197 = _1147 == 0.0;
    bool _2199 = !_2185;
    bool _2201 = _2197 && _2199;
    float _2203 = fma(_1107, _2189, _977);
    float _2205 = fma(_1187, 3.1415927410125732421875, _2193);
    float _2207 = _2195 * 6.283185482025146484375;
    float _2209 = cos(_2207);
    float _2211 = in.m_67.x;
    float _2213 = in.m_67.y;
    float _2215 = in.m_67.z;
    float _2217 = in.m_67.w;
    bool _2219 = _1151 == 0.0;
    bool _2221 = _2219 && _2201;
    float _2223 = _2205 * 0.15915493667125701904296875;
    float _2225 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_69.z = _934;
    out.m_69.w = _942;
    float _2227 = _2195 * 6.283185482025146484375;
    float _2229 = sin(_2227);
    out.m_71.x = _1825;
    out.m_71.y = _1823;
    out.m_71.z = _1827;
    float _2231 = _2085;
    float _2233 = _2117;
    if (_2221)
    {
        _1007 = _2203;
    }
    float _2235 = _1007;
    float _2237 = _2223 * 6.283185482025146484375;
    float _2239 = sin(_2237);
    float _2241 = _2235;
    if (!_2221)
    {
        float _2243 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2203);
        _2241 = _2243;
    }
    float _2245 = _2241;
    float _2247 = exp2(_2225);
    float _2249 = -_1117;
    float _2251 = fma(_2239, _2209, _2249);
    float _2253 = -_1119;
    float _2255 = fma(_2239, _2229, _2253);
    float _2257 = _2203 * _2211;
    float _2259 = fma(_1107, _2251, _1117);
    float _2261 = fma(_1107, _2255, _1119);
    float _2263 = _2259 * _2215;
    float _2265 = _2261 * _2213;
    float _2267 = -_2257;
    float _2269 = fma(_2259, _2213, _2267);
    float _2271 = -_2245;
    float _2273 = _1583 * _2271;
    float _2275 = -_2263;
    float _2277 = fma(_2261, _2211, _2275);
    float _2279 = -_2265;
    float _2281 = fma(_2203, _2215, _2279);
    float _2283 = _2269 * _2217;
    float _2285 = -_2213;
    float _2287 = _1583 * _2285;
    float _2289 = _2277 * _2217;
    float _2291 = _2281 * _2217;
    float _2293 = _1585 * _2213;
    float _2295 = _1595 * _2245;
    float _2297 = -_2289;
    float _2299 = _1583 * _2297;
    float _2301 = _1585 * _2245;
    float _2303 = _1595 * _2213;
    float _2305 = _1585 * _2289;
    float _2307 = _1595 * _2289;
    float _2309 = fma(_1601, _2211, _2293);
    float _2311 = fma(_1587, _2211, _2287);
    float _2313 = _2259;
    if (!_2221)
    {
        float _2315 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2259);
        _2313 = _2315;
    }
    float _2317 = _2313;
    float _2319 = fma(_1587, _2291, _2299);
    float _2321 = fma(_1607, _2211, _2303);
    float _2323 = fma(_1601, _2291, _2305);
    float _2325 = fma(_1607, _2291, _2307);
    float _2327 = fma(_1611, _2215, _2309);
    if (_2221)
    {
        _1159 = _2261;
    }
    float _2329 = _1159;
    float _2331 = fma(_1589, _2215, _2311);
    float _2333 = _2329;
    if (!_2221)
    {
        float _2335 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2261);
        _2333 = _2335;
    }
    float _2337 = _2333;
    float _2339 = fma(_1587, _2317, _2273);
    float _2341 = fma(_1603, _2215, _2321);
    float _2343 = _2047 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2345 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2347 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2349 = fma(_1601, _2317, _2301);
    float _2351 = _2327 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2353 = fma(_1589, _2337, _2339);
    float _2355 = fma(_1611, _2283, _2323);
    float _2357 = fma(_1589, _2283, _2319);
    float _2359 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2343);
    float _2361 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2345);
    float _2363 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2347);
    float _2365 = fma(_1611, _2337, _2349);
    float _2367 = fma(_2331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2351);
    float _2369 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2371 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2373 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2375 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2377 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2379 = _2355 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2381 = fma(_1603, _2283, _2325);
    float _2383 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2369);
    float _2385 = -_2247;
    float _2387 = _2385 + 1.0;
    float _2389 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2373);
    float _2391 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2375);
    float _2393 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2377);
    float _2395 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2371);
    float _2397 = fma(_2381, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2383);
    float _2399 = fma(_2357, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2379);
    float _2401 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2403 = fma(_2041, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2359);
    float _2405 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2361);
    float _2407 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2363);
    float _2409 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2367);
    float _2411 = fma(_1607, _2317, _2295);
    float _2413 = fma(_2053, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2403);
    float _2415 = fma(_2381, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2395);
    out.m_73.x = _2405;
    out.m_73.y = _2407;
    out.m_73.z = _2409;
    float _2417 = fma(_1603, _2337, _2411);
    float _2419 = _2413 + _2085;
    float _2421 = fma(_2381, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2399);
    float _2423 = fma(_2417, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2389);
    float _2425 = _2419 * 0.5;
    float _2427 = fma(_2417, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2391);
    float _2429 = fma(_2417, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2393);
    out.m_75.x = _2397;
    out.m_75.y = _2415;
    out.m_75.z = _2421;
    bool _2431 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2433 = isnan(_1853);
    bool _2435 = _2431 || _2433;
    bool _2437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2439 = _2435 || _2437;
    float _2441 = -_2401;
    float _2443 = _2441 + 1.0;
    out.m_77.z = _2425;
    out.m_77.w = _2085;
    out.m_79.x = _2423;
    out.m_79.y = _2427;
    out.m_79.z = _2429;
    out.gl_Position.x = _2115;
    out.gl_Position.y = _2117;
    out.gl_Position.z = _2413;
    out.gl_Position.w = _2085;
    float _2445 = _2407;
    float _2447 = _2413;
    float _2449 = _2115;
    float _2451 = _2443;
    if (!_2439)
    {
        _2445 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2453 = _2445;
    float _2455 = _2453;
    float _2457 = _2453;
    if (!_2439)
    {
        _2231 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2459 = _2231;
    float _2461 = _2459;
    float _2463 = _2459;
    if (!_2439)
    {
        _2447 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2465 = _2447;
    float _2467 = _2465;
    float _2469 = _2465;
    if (!_2439)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2471 = _2233;
    float _2473 = _2471;
    float _2475 = _2471;
    if (!_2439)
    {
        _2449 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2477 = _2449;
    float _2479 = _2401 * _2141;
    float _2481 = _2159 * _2479;
    float _2483 = _2159 * _2443;
    float _2485 = _2477;
    float _2487 = _2477;
    if (!_2439)
    {
        _2451 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2489 = _2451;
    float _2491 = _2169 * _2479;
    float _2493 = fma(_2165, _2481, _2153);
    float _2495 = fma(_2167, _2481, _2155);
    float _2497 = fma(_2159, _2491, _2157);
    out.m_81.x = _2493;
    out.m_81.y = _2495;
    out.m_81.z = _2497;
    out.m_81.w = _2483;
    bool _2499 = !_2439;
    float _2501 = _2489;
    float _2503 = _2489;
    if (!_2499)
    {
        bool _2505 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2507 = isnan(_1853);
        bool _2509 = _2505 || _2507;
        bool _2511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2513 = _2509 || _2511;
        if (!_2513)
        {
            float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2517 = _1853 + _2515;
            float _2519 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2521 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2519;
            float _2523 = 1.0 / _2521;
            float _2525 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2527 = _2525 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2529 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2533 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2535 = _2533 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2545 = _2517 * _2523;
            float _2547 = precise::clamp(_2545, 0.0, 1.0);
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2553 = fma(_2547, _2531, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2555 = fma(_2547, _2551, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2557 = fma(_2547, _2527, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2559 = fma(_2547, _2535, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2561 = fma(_2547, _2539, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2563 = fma(_2547, _2543, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2475 = _2557;
            _2503 = _2561;
            _2469 = _2555;
            _2457 = _2559;
            _2487 = _2553;
            _2463 = _2563;
            _2565 = true;
        }
        else
        {
            bool _2567 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2569 = isnan(_1853);
            bool _2571 = _2567 || _2569;
            bool _2573 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2575 = _2571 || _2573;
            if (!_2575)
            {
                _2455 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2577 = _2455;
            _2457 = _2577;
            if (!_2575)
            {
                _2501 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2579 = _2501;
            _2503 = _2579;
            if (!_2575)
            {
                _2461 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2581 = _2461;
            _2463 = _2581;
            if (!_2575)
            {
                _2467 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2583 = _2467;
            _2469 = _2583;
            if (!_2575)
            {
                _2473 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2585 = _2473;
            _2475 = _2585;
            if (!_2575)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2587 = _2485;
            bool _2589 = !_2575;
            _2487 = _2587;
            if (!_2589)
            {
                bool _2591 = _1853 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2593 = isnan(_1853);
                bool _2595 = _2591 || _2593;
                bool _2597 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2599 = _2595 || _2597;
                if (!_2599)
                {
                    float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2603 = _1853 + _2601;
                    float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2607 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2605;
                    float _2609 = 1.0 / _2607;
                    float _2611 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2613 = _2611 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2615 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2617 = _2615 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2631 = _2603 * _2609;
                    float _2633 = precise::clamp(_2631, 0.0, 1.0);
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2639 = fma(_2633, _2617, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2641 = fma(_2633, _2637, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2643 = fma(_2633, _2613, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2645 = fma(_2633, _2621, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2647 = fma(_2633, _2625, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2649 = fma(_2633, _2629, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2475 = _2643;
                    _2503 = _2647;
                    _2469 = _2641;
                    _2457 = _2645;
                    _2487 = _2639;
                    _2463 = _2649;
                    _2565 = true;
                }
                else
                {
                    _2475 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2503 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2469 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2457 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2463 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2565 = false;
    float _2651 = _2475;
    float _2653 = _2503;
    float _2655 = _2469;
    float _2657 = _2457;
    float _2659 = _2487;
    float _2661 = _2463;
    float _2663 = fma(_2427, -0.5, 0.5);
    float _2665 = precise::clamp(_2663, 0.0, 1.0);
    float _2667 = -_2651;
    float _2669 = _2653 + _2667;
    float _2671 = -_2655;
    float _2673 = _2657 + _2671;
    float _2675 = -_2659;
    float _2677 = _2661 + _2675;
    bool _2679 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2681 = fma(_2665, _2669, _2651);
    float _2683 = fma(_2665, _2673, _2655);
    float _2685 = fma(_2665, _2677, _2659);
    float _2687 = _2681 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2689 = fma(_2683, 0.298911988735198974609375, _2687);
    float _2691 = fma(_2685, 0.114477999508380889892578125, _2689);
    out.m_83.x = 0.0;
    float _2693 = -_2691;
    float _2695 = _2683 + _2693;
    float _2697 = -_2691;
    float _2699 = _2681 + _2697;
    float _2701 = -_2691;
    float _2703 = _2685 + _2701;
    float _2705 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2707 = fma(_2695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2691);
    float _2709 = fma(_2699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2691);
    float _2711 = fma(_2703, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2691);
    out.m_85.w = _2705;
    out.m_87.x = _2707;
    out.m_87.y = _2709;
    out.m_87.z = _2711;
    if (!_2679)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2713 = -_1823;
    float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2717 = -_1825;
    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2721 = -_1827;
    float _2723 = _2721 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2725 = _2715 * _2715;
    float _2727 = fma(_2719, _2719, _2725);
    float _2729 = fma(_2723, _2723, _2727);
    float _2731 = sqrt(_2729);
    float _2733 = rsqrt(_2729);
    float _2735 = -_2731;
    float _2737 = _2735 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2739 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2741 = precise::clamp(_2739, 0.0, 1.0);
    float _2743 = _2719 * _2733;
    float _2745 = _2715 * _2733;
    float _2747 = abs(_2741);
    float _2749 = log2(_2747);
    float _2751 = _2723 * _2733;
    float _2753 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2755 = _2427 * _2745;
    float _2757 = -_2745;
    float _2759 = -_2753;
    float _2761 = fma(_2757, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2759);
    float _2763 = fma(_2423, _2743, _2755);
    float _2765 = -_2751;
    float _2767 = fma(_2765, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2761);
    float _2769 = fma(_2429, _2751, _2763);
    float _2771 = precise::clamp(_2769, 0.0, 1.0);
    float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2775 = _2767 + _2773;
    float _2777 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2779 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2781 = precise::clamp(_2779, 0.0, 1.0);
    float _2783 = exp2(_2777);
    float _2785 = _2783 * _2781;
    float _2787 = _2771 * _2785;
    float _2789 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2791 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2793 = _2787 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_83.x = _2789;
    out.m_83.y = _2791;
    out.m_83.z = _2793;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

